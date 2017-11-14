From: peterz@infradead.org (Peter Zijlstra)
Date: Tue, 14 Nov 2017 11:28:02 +0100
Subject: [PATCH 4/4] ARCv2: entry: Reduce perf intr return path
In-Reply-To: <1510092784-19942-5-git-send-email-vgupta@synopsys.com>
References: <1510092784-19942-1-git-send-email-vgupta@synopsys.com>
 <1510092784-19942-5-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171114102802.GA3165@worktop.lehotels.local>
To: linux-snps-arc@lists.infradead.org

On Tue, Nov 07, 2017@02:13:04PM -0800, Vineet Gupta wrote:
> In the more likely case of returning to kernel from perf interrupt, do a
> fast path returning w/o bothering about CONFIG_PREEMPT etc

I think this needs more explaining and certainly also deserves a code
comment.

Is the argument something along these lines?

  Assumes the interrupt will never set TIF_NEED_RESCHED;
  therefore no preemption is ever required on return from
  the interrupt.

What do you (on ARC) do about irq_work ?

> +ENTRY(handle_interrupt_pct)
> +
> +	INTERRUPT_PROLOGUE  irq
> +
> +	IRQ_DISABLE
> +
> +	lr	r0, [ICAUSE]
> +
> +	bl.d	arch_do_IRQ
> +	mov	r1, sp
> +
> +	ld	r0, [sp, PT_status32]   ; returning to User/Kernel Mode
> +	btst	r0, STATUS_U_BIT
> +	bnz	resume_user_mode_begin
> +
> +	clri
> +	b	.Lisr_ret_fast_path_to_k
> +
> +END(handle_interrupt_pct)
