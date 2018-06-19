From: peterz@infradead.org (Peter Zijlstra)
Date: Tue, 19 Jun 2018 11:26:14 +0200
Subject: [PATCH] ARC: Improve cmpxchng syscall implementation
In-Reply-To: <20180319110002.27419-1-abrodkin@synopsys.com>
References: <20180319110002.27419-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180619092614.GD2494@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Mon, Mar 19, 2018@02:00:02PM +0300, Alexey Brodkin wrote:
> diff --git a/arch/arc/kernel/process.c b/arch/arc/kernel/process.c
> index 5ac3b547453f..d7d3e16133d6 100644
> --- a/arch/arc/kernel/process.c
> +++ b/arch/arc/kernel/process.c
> @@ -47,7 +47,9 @@ SYSCALL_DEFINE0(arc_gettls)
>  SYSCALL_DEFINE3(arc_usr_cmpxchg, int *, uaddr, int, expected, int, new)
>  {
>  	struct pt_regs *regs = current_pt_regs();
> +	struct page *page;
> +	u32 val;
> +	int ret;
>  
>  	/*
>  	 * This is only for old cores lacking LLOCK/SCOND, which by defintion
> @@ -60,23 +62,48 @@ SYSCALL_DEFINE3(arc_usr_cmpxchg, int *, uaddr, int, expected, int, new)
>  	/* Z indicates to userspace if operation succeded */
>  	regs->status32 &= ~STATUS_Z_MASK;
>  
> +	ret = access_ok(VERIFY_WRITE, uaddr, sizeof(*uaddr));
> +	if (!ret)
> +		goto fail;
>  
> +again:
>  	preempt_disable();
>  
> +	ret = __get_user(val, uaddr);
> +	if (ret == -EFAULT) {
> +		preempt_enable();
> +		ret = get_user_pages_fast((unsigned long)uaddr, 1, 1, &page);
> +		if (ret < 0)
> +			goto fail;
> +
> +		put_page(page);
> +		goto again;
> +	} else if (ret)
> +		goto fail;

goto fail with preempt disabled.

> +
> +	if (val == expected) {
> +		ret = __put_user(new, uaddr);
> +		if (!ret)
>  			regs->status32 |= STATUS_Z_MASK;
>  	}
>  
> -done:
>  	preempt_enable();
>  
> -	return uval;
> +	if (ret == -EFAULT) {
> +		ret = get_user_pages_fast((unsigned long)uaddr, 1, 1, &page);
> +		if (ret < 0)
> +			goto fail;
> +
> +		put_page(page);
> +		goto again;
> +	} else if (ret)
> +		goto fail;
> +
> +	return val;
> +
> +fail:
> +	force_sig(SIGSEGV, current);
> +	return ret;
>  }

Sorry for the delay, but I would write it like:

--- a/arch/arc/kernel/process.c
+++ b/arch/arc/kernel/process.c
@@ -47,7 +47,9 @@ SYSCALL_DEFINE0(arc_gettls)
 SYSCALL_DEFINE3(arc_usr_cmpxchg, int *, uaddr, int, expected, int, new)
 {
 	struct pt_regs *regs = current_pt_regs();
-	int uval = -EFAULT;
+	struct page *page;
+	u32 val;
+	int ret;
 
 	/*
 	 * This is only for old cores lacking LLOCK/SCOND, which by defintion
@@ -60,23 +62,46 @@ SYSCALL_DEFINE3(arc_usr_cmpxchg, int *,
 	/* Z indicates to userspace if operation succeded */
 	regs->status32 &= ~STATUS_Z_MASK;
 
-	if (!access_ok(VERIFY_WRITE, uaddr, sizeof(int)))
-		return -EFAULT;
+	ret = access_ok(VERIFY_WRITE, uaddr, sizeof(*uaddr));
+	if (!ret)
+		goto fail;
 
+again:
 	preempt_disable();
 
-	if (__get_user(uval, uaddr))
-		goto done;
+	ret = __get_user(val, uaddr);
+	if (ret)
+		goto fault;
 
-	if (uval == expected) {
-		if (!__put_user(new, uaddr))
-			regs->status32 |= STATUS_Z_MASK;
-	}
+	if (val != expected)
+		goto out;
 
-done:
+	ret = __put_user(new, uaddr);
+	if (ret)
+		goto fault;
+
+	regs->status32 |= STATUS_Z_MASK;
+
+out:
 	preempt_enable();
+	return val;
+
+fault:
+	preempt_enable();
+
+	if (unlikely(ret != -EFAULT))
+		goto fail;
 
-	return uval;
+	down_read(&current->mm->mmap_sem);
+	ret = fixup_user_fault(current, current->mm, uaddr, FAULT_FLAG_WRITE, NULL);
+	up_read(&current->mm->mmap_sem);
+
+	if (likely(!ret))
+		goto again;
+
+fail:
+	force_sig(SIGSEGV, current);
+	return ret;
 }
 
 #ifdef CONFIG_ISA_ARCV2
