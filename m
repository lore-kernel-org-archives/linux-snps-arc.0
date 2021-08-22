Return-Path: <SRS0=NpIR=NN=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC60C4338F
	for <linux-snps-arc@archiver.kernel.org>; Sun, 22 Aug 2021 19:51:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC6B461266
	for <linux-snps-arc@archiver.kernel.org>; Sun, 22 Aug 2021 19:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC6B461266
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwhO7l6J6q16ONUUXWPvlBqw7gZrVGhq1YJvddSlQhw=; b=slQgZ92Z5IR61jLDNHOWcSZxNM
	/mn7sxPT5XrWYn42Ne97Hm0EdbBo7cdfPpE04srCoeHeKYTb9eRIs6hofbfgsLAuDS6/Yr6TSQIij
	RtIUJjYAl5KOgmQ2eyO76JdQY9vNp22m6ZYg99q7OE0OsEOSbRtUHtSFhQA5zSvo0pRnJsbM/YMUW
	S4dI1blXuAOaYKRa9mDRemu9ETgPV84JEyf5OEQe5BvHCojsk1PMCIP9wgOV+wsWzyE4GDs5vuZrL
	41KxkwIRKV9It+8Bqck6o3IvX0zgjBYRBFLCipaLY3ApURUj3Oc3KcmjnyXl2rlw/G4y91GMF+jej
	JsntjBGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mHtVS-00EfNf-RJ; Sun, 22 Aug 2021 19:51:46 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mHtVP-00EfMt-Ea; Sun, 22 Aug 2021 19:51:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1629661817;
 bh=pjk5jD1zqKrMDItorPB4yDhy+hHyj7Di150YCWUjJSA=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=L5srSGlwOnnWzNjCtJvhGJQxaLVCM4qEF6Z1J266F6xZnz8Cd93QXE+u5+swHfz0f
 kJVrfLDjot0nP3MyPvX3LgMl/bObX5kl4PBzRvcPFQeYCAdBQQimDLyW2lYckBGP7W
 T+g29G/rdCbDxXOA++Ww3ZJuKyje+CSGa2X0JD7o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.149.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MulmF-1n8LVr31ed-00rqEu; Sun, 22
 Aug 2021 21:50:17 +0200
Subject: Re: [PATCH v2] init: consolidate trap_init()
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Michal Simek <monstr@monstr.eu>,
 "David S. Miller" <davem@davemloft.net>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-hexagon@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-um@lists.infradead.org,
 Anup Patel <anup@brainfault.org>, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org
References: <20210414165808.458a3d11@xhacker.debian>
 <20210414180037.14602dab@xhacker.debian>
From: Helge Deller <deller@gmx.de>
Message-ID: <8638c5bc-71cd-9407-e597-77bf9bec17ee@gmx.de>
Date: Sun, 22 Aug 2021 21:48:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210414180037.14602dab@xhacker.debian>
Content-Language: en-US
X-Provags-ID: V03:K1:iqhOMJzcHgngRWGUeJTS0NtZvTK1MvYjUB/t01FzLhE9XIaoXiZ
 kfsE2c5P8B/slLrvFuZKX82mTyU+P7kOPVOyeLCUWix0jZBuCQP5/RxgLdzLIXc8721wupw
 BXfChjTwIFcvt7PJbJuVENcZVlKgIlci6YyB50lbRsK9hvD2XFAIFrjh8ydx/AbPU7O3CT5
 cu/n0W491FE6U0tfzeSsA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eVnzXVPNHFs=:FJaxmeeBNCL9g7e4AjQbwa
 /A1IubdZQKTZ7aRheMbEw4z6Z1Ls+CJb3Buwnn7+iaHAPTKQBPvrvYxc1xH3/1XqaFtzbCJvO
 RdPNbrwTapfQ3mPpJ4mi4M3Lfxlg4k5Er7FUE5+M2hkjlawPcBX7a241wkCr3EASFBohCzZhp
 AyaF0SPbzdqVFbx+9hGfD1dkJimZDMaM4J+kvC2THhhlPQcyRf4uhnK+v+mEwFR1HD+DIxNds
 QXvqe+7skNfDhvR3yhBkTxRmx1LJ/ManTmrrr2/eQOyJG/6zM5kCue82O/3VsdJEcdsuSThc+
 1fpgkb9rqcYX5zRnfNoXvvaEIZ1/Z+LKvULZFvX2t/4j8KGeF22ih61NHY+JwMuZAx2M180CE
 BkgKHRO/QKIjBWgR0sO0dVQPfsIAwAJZd7q+13KY9JMO7LVqR/gMwtqEC2+MhwL+Y3lwyq5Bo
 x1WP67IKGbJyKuSnwZ0noJ9VDpY2NduJ7z9i2/BmMJlI90NkZaRPJmOLkGRuum/1KXu9YOEqI
 e7/rCx6X0MKiFB78fk+tPpdzQl9ARVKMgqpa9L9LyTcfmLji/JZabWSHk1D46SDIZ+N/WdXOO
 UFxXGqpWFk/b7qAnzlvXBQ4o5fGlve0BaxtiIxqCBvigCn+7luLO2+nVURTbTHcNzGH3QQitq
 5+WIgdoExFTGH8biny/xq4S3jjWL/z0ZWHdHVEHKuH16zvJr11UuNQYiYJmG9FQekFjLxyM2+
 7lqxqaHyJDMvHlT2tfKH+Vs4+KjTFHzajJ3aXgW4ubModkaYngvg3NXKIp0yS5jcI0lnYkGhR
 cGWn0ypb1PnRa8UAgUgssBlfEjmFuZ8ytKK8HmOS2VfBfjXyVIR74WCFJB2PelazWd/IkBkU7
 41clz863wQINwEa8TvwX0w7qvQUYWk0J90ZrbrLwPH8oT2gVrn+mtlEotB1X4don8fToNwMqJ
 qOWogVtdbEnh1Lnd2kCfhb7omp+qfUyJByW9uRxSa6TzkVX6ZTgEJsnhqSRYmttSKqlXWtdJ3
 qeAYEnt6ZbE1kaB8Bqgvo9idDRxh7DBIwJ5D1eN+0i4aovmMSZTV1+8tcOb15BDi8grVpufim
 ayEt+b07nKVGulEINhBuZCs9+ghWJ3rQbGPlY/XtXBCL6FwoUttAM1m9Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_125143_838073_99B778BA 
X-CRM114-Status: GOOD (  26.04  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 4/14/21 12:00 PM, Jisheng Zhang wrote:
> Many architectures implement the trap_init() as NOP, since there is
> no such default for trap_init(), this empty stub is duplicated among
> these architectures. Provide a generic but weak NOP implementation
> to drop the empty stubs of trap_init() in these architectures.
>
> The alpha, microblaze and sparc32 have real trap_init() implementation
> but the __init marker is missing, so add it to these three platforms.
>
> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> ---
> Since v1:
>   - add __init marker to trap_init() for alpha, microblaze and sparc32
>   - adjust the generic weak NOP trap_init() location to make it sits with
>     other NOP implementations together
>
>   arch/alpha/kernel/traps.c      |  2 +-
>   arch/arc/kernel/traps.c        |  5 -----
>   arch/arm/kernel/traps.c        |  5 -----
>   arch/h8300/kernel/traps.c      | 13 -------------
>   arch/hexagon/kernel/traps.c    |  4 ----
>   arch/microblaze/kernel/traps.c |  2 +-
>   arch/nds32/kernel/traps.c      |  5 -----
>   arch/nios2/kernel/traps.c      |  5 -----
>   arch/openrisc/kernel/traps.c   |  5 -----
>   arch/parisc/kernel/traps.c     |  4 ----
>   arch/powerpc/kernel/traps.c    |  5 -----
>   arch/riscv/kernel/traps.c      |  5 -----
>   arch/sparc/kernel/traps_32.c   |  2 +-
>   arch/um/kernel/trap.c          |  4 ----
>   init/main.c                    |  2 ++
>   15 files changed, 5 insertions(+), 63 deletions(-)


For parisc:

Acked-by: Helge Deller <deller@gmx.de> # parisc

Thanks!
Helge

>
> diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> index 921d4b6e4d95..96b203199c6c 100644
> --- a/arch/alpha/kernel/traps.c
> +++ b/arch/alpha/kernel/traps.c
> @@ -973,7 +973,7 @@ do_entUnaUser(void __user * va, unsigned long opcode,
>   	return;
>   }
>
> -void
> +void __init
>   trap_init(void)
>   {
>   	/* Tell PAL-code what global pointer we want in the kernel.  */
> diff --git a/arch/arc/kernel/traps.c b/arch/arc/kernel/traps.c
> index 57235e5c0cea..6b83e3f2b41c 100644
> --- a/arch/arc/kernel/traps.c
> +++ b/arch/arc/kernel/traps.c
> @@ -20,11 +20,6 @@
>   #include <asm/unaligned.h>
>   #include <asm/kprobes.h>
>
> -void __init trap_init(void)
> -{
> -	return;
> -}
> -
>   void die(const char *str, struct pt_regs *regs, unsigned long address)
>   {
>   	show_kernel_fault_diag(str, regs, address);
> diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
> index 17d5a785df28..9baccef20392 100644
> --- a/arch/arm/kernel/traps.c
> +++ b/arch/arm/kernel/traps.c
> @@ -780,11 +780,6 @@ void abort(void)
>   	panic("Oops failed to kill thread");
>   }
>
> -void __init trap_init(void)
> -{
> -	return;
> -}
> -
>   #ifdef CONFIG_KUSER_HELPERS
>   static void __init kuser_init(void *vectors)
>   {
> diff --git a/arch/h8300/kernel/traps.c b/arch/h8300/kernel/traps.c
> index 5d8b969cd8f3..c3a3ebf77fbb 100644
> --- a/arch/h8300/kernel/traps.c
> +++ b/arch/h8300/kernel/traps.c
> @@ -30,19 +30,6 @@
>
>   static DEFINE_SPINLOCK(die_lock);
>
> -/*
> - * this must be called very early as the kernel might
> - * use some instruction that are emulated on the 060
> - */
> -
> -void __init base_trap_init(void)
> -{
> -}
> -
> -void __init trap_init(void)
> -{
> -}
> -
>   asmlinkage void set_esp0(unsigned long ssp)
>   {
>   	current->thread.esp0 = ssp;
> diff --git a/arch/hexagon/kernel/traps.c b/arch/hexagon/kernel/traps.c
> index 904134b37232..edfc35dafeb1 100644
> --- a/arch/hexagon/kernel/traps.c
> +++ b/arch/hexagon/kernel/traps.c
> @@ -28,10 +28,6 @@
>   #define TRAP_SYSCALL	1
>   #define TRAP_DEBUG	0xdb
>
> -void __init trap_init(void)
> -{
> -}
> -
>   #ifdef CONFIG_GENERIC_BUG
>   /* Maybe should resemble arch/sh/kernel/traps.c ?? */
>   int is_valid_bugaddr(unsigned long addr)
> diff --git a/arch/microblaze/kernel/traps.c b/arch/microblaze/kernel/traps.c
> index 94b6fe93147d..7c15704fe56e 100644
> --- a/arch/microblaze/kernel/traps.c
> +++ b/arch/microblaze/kernel/traps.c
> @@ -18,7 +18,7 @@
>   #include <asm/exceptions.h>
>   #include <asm/unwind.h>
>
> -void trap_init(void)
> +void __init trap_init(void)
>   {
>   	__enable_hw_exceptions();
>   }
> diff --git a/arch/nds32/kernel/traps.c b/arch/nds32/kernel/traps.c
> index ee0d9ae192a5..f06421c645af 100644
> --- a/arch/nds32/kernel/traps.c
> +++ b/arch/nds32/kernel/traps.c
> @@ -183,11 +183,6 @@ void __pgd_error(const char *file, int line, unsigned long val)
>   }
>
>   extern char *exception_vector, *exception_vector_end;
> -void __init trap_init(void)
> -{
> -	return;
> -}
> -
>   void __init early_trap_init(void)
>   {
>   	unsigned long ivb = 0;
> diff --git a/arch/nios2/kernel/traps.c b/arch/nios2/kernel/traps.c
> index b172da4eb1a9..596986a74a26 100644
> --- a/arch/nios2/kernel/traps.c
> +++ b/arch/nios2/kernel/traps.c
> @@ -105,11 +105,6 @@ void show_stack(struct task_struct *task, unsigned long *stack,
>   	printk("%s\n", loglvl);
>   }
>
> -void __init trap_init(void)
> -{
> -	/* Nothing to do here */
> -}
> -
>   /* Breakpoint handler */
>   asmlinkage void breakpoint_c(struct pt_regs *fp)
>   {
> diff --git a/arch/openrisc/kernel/traps.c b/arch/openrisc/kernel/traps.c
> index 4d61333c2623..aa1e709405ac 100644
> --- a/arch/openrisc/kernel/traps.c
> +++ b/arch/openrisc/kernel/traps.c
> @@ -231,11 +231,6 @@ void unhandled_exception(struct pt_regs *regs, int ea, int vector)
>   	die("Oops", regs, 9);
>   }
>
> -void __init trap_init(void)
> -{
> -	/* Nothing needs to be done */
> -}
> -
>   asmlinkage void do_trap(struct pt_regs *regs, unsigned long address)
>   {
>   	force_sig_fault(SIGTRAP, TRAP_BRKPT, (void __user *)regs->pc);
> diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
> index 8d8441d4562a..747c328fb886 100644
> --- a/arch/parisc/kernel/traps.c
> +++ b/arch/parisc/kernel/traps.c
> @@ -859,7 +859,3 @@ void  __init early_trap_init(void)
>
>   	initialize_ivt(&fault_vector_20);
>   }
> -
> -void __init trap_init(void)
> -{
> -}
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index a44a30b0688c..e952bee89684 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -2207,11 +2207,6 @@ DEFINE_INTERRUPT_HANDLER(kernel_bad_stack)
>   	die("Bad kernel stack pointer", regs, SIGABRT);
>   }
>
> -void __init trap_init(void)
> -{
> -}
> -
> -
>   #ifdef CONFIG_PPC_EMULATED_STATS
>
>   #define WARN_EMULATED_SETUP(type)	.type = { .name = #type }
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index 0879b5df11b9..b3f3d84de779 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -194,8 +194,3 @@ int is_valid_bugaddr(unsigned long pc)
>   		return ((insn & __COMPRESSED_INSN_MASK) == __BUG_INSN_16);
>   }
>   #endif /* CONFIG_GENERIC_BUG */
> -
> -/* stvec & scratch is already set from head.S */
> -void trap_init(void)
> -{
> -}
> diff --git a/arch/sparc/kernel/traps_32.c b/arch/sparc/kernel/traps_32.c
> index 247a0d9683b2..c4df20ec01e2 100644
> --- a/arch/sparc/kernel/traps_32.c
> +++ b/arch/sparc/kernel/traps_32.c
> @@ -365,7 +365,7 @@ EXPORT_SYMBOL(do_BUG);
>    * up here so that timer interrupts work during initialization.
>    */
>
> -void trap_init(void)
> +void __init trap_init(void)
>   {
>   	extern void thread_info_offsets_are_bolixed_pete(void);
>
> diff --git a/arch/um/kernel/trap.c b/arch/um/kernel/trap.c
> index ad12f78bda7e..3198c4767387 100644
> --- a/arch/um/kernel/trap.c
> +++ b/arch/um/kernel/trap.c
> @@ -311,7 +311,3 @@ void winch(int sig, struct siginfo *unused_si, struct uml_pt_regs *regs)
>   {
>   	do_IRQ(WINCH_IRQ, regs);
>   }
> -
> -void trap_init(void)
> -{
> -}
> diff --git a/init/main.c b/init/main.c
> index 53b278845b88..8d14674c4e00 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -779,6 +779,8 @@ void __init __weak poking_init(void) { }
>
>   void __init __weak pgtable_cache_init(void) { }
>
> +void __init __weak trap_init(void) { }
> +
>   bool initcall_debug;
>   core_param(initcall_debug, initcall_debug, bool, 0644);
>
>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
