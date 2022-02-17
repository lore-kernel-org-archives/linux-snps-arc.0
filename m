Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A70FC433EF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Feb 2022 22:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:
	In-Reply-To:Date:References:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+Nx27V7GQ/IiK1uTEW1Sjg6JsVLQGKmASOdHmjROYD0=; b=N6E6Go6ddm4LltJfaOqddjZfRi
	EzliE86RmSKqLP5hdV9Fpms84j8mMZKUSiU14bk8SE7cgl7cUVyjTCmaI4Yzk72XN1cjajOcufXcG
	XU5GttGZORBLtYbfkip8ltYZysiKYRQP6RhehKQ8pf1Ysz1tXksqvMYlPTxBgU1KIv6Wk2aBeoDdQ
	EjlL9pMUO5jxSfhCAdc8uOQOxqQvehXuY4FKyLlDH6HuPuWgvH9GA7F1IKHhXD+EhdTtCGl1YFWcN
	vSdsNw2NBgZUCWvymDZ0l6yuJ4g7QDOWIp8IHzY/xogJkwHDs0gNVuLoqkbPPPMbAX8tS9xaC59ia
	ALiHqW5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKpOn-00CNMc-V1; Thu, 17 Feb 2022 22:37:17 +0000
Received: from out01.mta.xmission.com ([166.70.13.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKpOi-00CNI2-BD; Thu, 17 Feb 2022 22:37:13 +0000
Received: from in02.mta.xmission.com ([166.70.13.52]:48942)
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1nKpOJ-001bK3-23; Thu, 17 Feb 2022 15:36:47 -0700
Received: from ip68-227-174-4.om.om.cox.net ([68.227.174.4]:32906
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1nKpOG-00GKIm-Md; Thu, 17 Feb 2022 15:36:46 -0700
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,  Christoph Hellwig
 <hch@lst.de>,  linux-arch@vger.kernel.org,  linux-mm@kvack.org,
 linux-api@vger.kernel.org,  arnd@arndb.de,  linux-kernel@vger.kernel.org,
 viro@zeniv.linux.org.uk,  linux@armlinux.org.uk,  will@kernel.org,
 guoren@kernel.org,  bcain@codeaurora.org,  geert@linux-m68k.org,
 monstr@monstr.eu,  tsbogend@alpha.franken.de,  nickhu@andestech.com,
 green.hu@gmail.com,  dinguyen@kernel.org,  shorne@gmail.com,
 deller@gmx.de,  mpe@ellerman.id.au,  peterz@infradead.org,
 mingo@redhat.com,  mark.rutland@arm.com,  hca@linux.ibm.com,
 dalias@libc.org,  davem@davemloft.net,  richard@nod.at,  x86@kernel.org,
 jcmvbkbc@gmail.com,  akpm@linux-foundation.org,  ardb@kernel.org,
 linux-alpha@vger.kernel.org,  linux-snps-arc@lists.infradead.org,
 linux-csky@vger.kernel.org,  linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org,  linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,  openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org,  linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org,  sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org,  linux-xtensa@linux-xtensa.org
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-19-arnd@kernel.org>
Date: Thu, 17 Feb 2022 16:36:20 -0600
In-Reply-To: <20220216131332.1489939-19-arnd@kernel.org> (Arnd Bergmann's
 message of "Wed, 16 Feb 2022 14:13:32 +0100")
Message-ID: <8735khi0ij.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1nKpOG-00GKIm-Md; ; ;
 mid=<8735khi0ij.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.227.174.4; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX1/V+0C7NWKuSkdwXmdluwhE5ZIu3hq7L5I=
X-SA-Exim-Connect-IP: 68.227.174.4
X-SA-Exim-Mail-From: ebiederm@xmission.com
Subject: Re: [PATCH v2 18/18] uaccess: drop maining CONFIG_SET_FS users
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_143712_396361_9B9127DD 
X-CRM114-Status: GOOD (  21.88  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> There are no remaining callers of set_fs(), so CONFIG_SET_FS
> can be removed globally, along with the thread_info field and
> any references to it.
>
> This turns access_ok() into a cheaper check against TASK_SIZE_MAX.
>
> With CONFIG_SET_FS gone, so drop all remaining references to
> set_fs()/get_fs(), mm_segment_t and uaccess_kernel().

For the bits I have looked at recently, and think I understand.

Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>

>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  fs/exec.c                                 |  6 --
>  kernel/exit.c                             | 14 -----
>  kernel/kthread.c                          |  5 --
>
> diff --git a/fs/exec.c b/fs/exec.c
> index 79f2c9483302..bc68a0c089ac 100644
> --- a/fs/exec.c
> +++ b/fs/exec.c
> @@ -1303,12 +1303,6 @@ int begin_new_exec(struct linux_binprm * bprm)
>  	if (retval)
>  		goto out_unlock;
>  
> -	/*
> -	 * Ensure that the uaccess routines can actually operate on userspace
> -	 * pointers:
> -	 */
> -	force_uaccess_begin();
> -
>  	if (me->flags & PF_KTHREAD)
>  		free_kthread_struct(me);
>  	me->flags &= ~(PF_RANDOMIZE | PF_FORKNOEXEC | PF_KTHREAD |
> diff --git a/kernel/exit.c b/kernel/exit.c
> index b00a25bb4ab9..0884a75bc2f8 100644
> --- a/kernel/exit.c
> +++ b/kernel/exit.c
> @@ -737,20 +737,6 @@ void __noreturn do_exit(long code)
>  
>  	WARN_ON(blk_needs_flush_plug(tsk));
>  
> -	/*
> -	 * If do_dead is called because this processes oopsed, it's possible
> -	 * that get_fs() was left as KERNEL_DS, so reset it to USER_DS before
> -	 * continuing. Amongst other possible reasons, this is to prevent
> -	 * mm_release()->clear_child_tid() from writing to a user-controlled
> -	 * kernel address.
> -	 *
> -	 * On uptodate architectures force_uaccess_begin is a noop.  On
> -	 * architectures that still have set_fs/get_fs in addition to handling
> -	 * oopses handles kernel threads that run as set_fs(KERNEL_DS) by
> -	 * default.
> -	 */
> -	force_uaccess_begin();
> -
>  	kcov_task_exit(tsk);
>  
>  	coredump_task_exit(tsk);
> diff --git a/kernel/kthread.c b/kernel/kthread.c
> index 38c6dd822da8..16c2275d4b50 100644
> --- a/kernel/kthread.c
> +++ b/kernel/kthread.c
> @@ -55,7 +55,6 @@ struct kthread {
>  	int result;
>  	int (*threadfn)(void *);
>  	void *data;
> -	mm_segment_t oldfs;
>  	struct completion parked;
>  	struct completion exited;
>  #ifdef CONFIG_BLK_CGROUP
> @@ -1441,8 +1440,6 @@ void kthread_use_mm(struct mm_struct *mm)
>  		mmdrop(active_mm);
>  	else
>  		smp_mb();
> -
> -	to_kthread(tsk)->oldfs = force_uaccess_begin();
>  }
>  EXPORT_SYMBOL_GPL(kthread_use_mm);
>  
> @@ -1457,8 +1454,6 @@ void kthread_unuse_mm(struct mm_struct *mm)
>  	WARN_ON_ONCE(!(tsk->flags & PF_KTHREAD));
>  	WARN_ON_ONCE(!tsk->mm);
>  
> -	force_uaccess_end(to_kthread(tsk)->oldfs);
> -
>  	task_lock(tsk);
>  	/*
>  	 * When a kthread stops operating on an address space, the loop

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
