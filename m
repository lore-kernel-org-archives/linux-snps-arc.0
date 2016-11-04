From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 4 Nov 2016 13:16:42 -0700
Subject: [PATCH-v2] ARC: syscall for userspace cmpxchg assist
In-Reply-To: <1477325845-13936-1-git-send-email-vgupta@synopsys.com>
References: <9e22e4b1-7e36-1a74-3620-a4790a5d1bfd@synopsys.com>
 <1477325845-13936-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <b40add73-bd5f-9cf3-7c60-d5cfa9bfeb7e@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 10/24/2016 09:17 AM, Vineet Gupta wrote:
> Older ARC700 cores (ARC750 specifically) lack instructions to implement
> atomic r-w-w. This is problematic for userspace libraries such as NPTL
> which need atomic primitives. So enable them by providing kernel assist.
> This is costly but really the only sane soluton (othern than tight
> spinning using the otherwise avaialble atomic exchange EX instruciton).
> 
> Good thing is there are only a few of these cores running Linux out in
> the wild.
> 
> This only works on UP systems.
> 
> Reviewed-by: Colin Ian King <colin.king at canonical.com>
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
> Changes since v1
>  - errno not returned for access_ok() failing  [Colin]
>  - Beefed up change log
>  - WARN_ON_ONCE() for CONFIG_SMP since this is only UP safe
> ---
>  arch/arc/include/asm/syscalls.h    |  1 +
>  arch/arc/include/uapi/asm/unistd.h |  9 +++++----
>  arch/arc/kernel/process.c          | 33 +++++++++++++++++++++++++++++++++
>  3 files changed, 39 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arc/include/asm/syscalls.h b/arch/arc/include/asm/syscalls.h
> index e56f9fcc5581..772b67ca56e7 100644
> --- a/arch/arc/include/asm/syscalls.h
> +++ b/arch/arc/include/asm/syscalls.h
> @@ -17,6 +17,7 @@ int sys_clone_wrapper(int, int, int, int, int);
>  int sys_cacheflush(uint32_t, uint32_t uint32_t);
>  int sys_arc_settls(void *);
>  int sys_arc_gettls(void);
> +int sys_arc_usr_cmpxchg(int *, int, int);
>  
>  #include <asm-generic/syscalls.h>
>  
> diff --git a/arch/arc/include/uapi/asm/unistd.h b/arch/arc/include/uapi/asm/unistd.h
> index 41fa2ec9e02c..9a34136d84b2 100644
> --- a/arch/arc/include/uapi/asm/unistd.h
> +++ b/arch/arc/include/uapi/asm/unistd.h
> @@ -27,18 +27,19 @@
>  
>  #define NR_syscalls	__NR_syscalls
>  
> +/* Generic syscall (fs/filesystems.c - lost in asm-generic/unistd.h */
> +#define __NR_sysfs		(__NR_arch_specific_syscall + 3)
> +
>  /* ARC specific syscall */
>  #define __NR_cacheflush		(__NR_arch_specific_syscall + 0)
>  #define __NR_arc_settls		(__NR_arch_specific_syscall + 1)
>  #define __NR_arc_gettls		(__NR_arch_specific_syscall + 2)
> +#define __NR_arc_usr_cmpxchg	(__NR_arch_specific_syscall + 4)
>  
>  __SYSCALL(__NR_cacheflush, sys_cacheflush)
>  __SYSCALL(__NR_arc_settls, sys_arc_settls)
>  __SYSCALL(__NR_arc_gettls, sys_arc_gettls)
> -
> -
> -/* Generic syscall (fs/filesystems.c - lost in asm-generic/unistd.h */
> -#define __NR_sysfs		(__NR_arch_specific_syscall + 3)
> +__SYSCALL(__NR_arc_usr_cmpxchg, sys_arc_usr_cmpxchg)
>  __SYSCALL(__NR_sysfs, sys_sysfs)
>  
>  #undef __SYSCALL
> diff --git a/arch/arc/kernel/process.c b/arch/arc/kernel/process.c
> index be1972bd2729..59aa43cb146e 100644
> --- a/arch/arc/kernel/process.c
> +++ b/arch/arc/kernel/process.c
> @@ -41,6 +41,39 @@ SYSCALL_DEFINE0(arc_gettls)
>  	return task_thread_info(current)->thr_ptr;
>  }
>  
> +SYSCALL_DEFINE3(arc_usr_cmpxchg, int *, uaddr, int, expected, int, new)
> +{
> +	int uval;
> +	int ret;
> +
> +	/*
> +	 * This is only for old cores lacking LLOCK/SCOND, which by defintion
> +	 * can't possibly be SMP. Thus doesn't need to be SMP safe.
> +	 * And this also helps reduce the overhead for serializing in
> +	 * the UP case
> +	 */
> +	WARN_ON_ONCE(IS_ENABLED(CONFIG_SMP));
> +
> +	if (!access_ok(VERIFY_WRITE, uaddr, sizeof(int)))
> +		return -EFAULT;
> +
> +	preempt_disable();
> +
> +	ret = __get_user(uval, uaddr);
> +	if (ret)
> +		goto done;
> +
> +	if (uval != expected)
> +		ret = -EAGAIN;
> +	else
> +		ret = __put_user(new, uaddr);
> +
> +done:
> +	preempt_enable();
> +
> +	return ret;
> +}

It seems there is a subtle issue with this interface. Userspace cares more about
"prev" value to be able to build it's own state machine(s) - my existing uclibc
code was flawed as it was tight looping on the errno result.

We can add a return param, by passing a pointer, but I think it would be better
(and slightly cheaper) to just ditch the errno and simply return the prev value
which and current value could be checked for success/fail decision etc.

-Vineet
