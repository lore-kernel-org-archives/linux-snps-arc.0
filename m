Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605DDC6FD1F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 22 Mar 2023 09:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3HR/PBAdLrJFXoxKlq7CLogjCn6pCk8mowx8ybyA2q0=; b=lasBr6cmI+PcDd
	7Z2PJ77NCrMa+xdKf8nRFiADXq8SPMN4kT3o+pRlimt6w4i49bzeXtH/wP6pjiE6t7k++YZ4puP1/
	1HOffFJWj6j3LpvQkgPpVE8Xm17Zox761Q/Wzn4uzgKEKLx6bniOsY00cUwe5pFHD08Q40hMrRXrL
	FZQtByRxEJJvpXnDO+gL3R5uHBIeoVuui7Ha6vDK2Y+gQ2gsibuENRk8zeJaobuiGOKQTzFP0nJFV
	/KriDNY0FxAtIOfoD/Xn/lQM3RwGHty6nR/gJsyaChnlB40Yan/rHaA0OXjAmpWu2Aj4QNY1em+/s
	qvNglwBhjpUEpFbkdtAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pevA1-00FXm4-1C;
	Wed, 22 Mar 2023 09:53:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pev9y-00FXlS-05;
	Wed, 22 Mar 2023 09:53:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dfqJs0p1KTlCgT/AzQPPoQtSmUdmtzuztLmCgmrMzTI=; b=CzzNDRhr38Kip/OFg6dq3dQ4EV
	+GktrtbeR8GTSIKCXFNIi+R0Uog/v4u3G/O25UfC/mgZT3ndlGcMabgm6LrFN6fGis9ydvHcppxLT
	VwY3AmsL8HPpn5zrgxUXGj6CeuAuLVZoJ7UhzkhlIInAFBW3QLRk/B/v7JvwmMujV1bNxp++Hjosy
	wZt5vtgdBxpEoKGx18nO98pgqPhFFQBy0Pj+s5w9JmrOA97n6Bu/+USPMl8ce2eWJVbxbyQjTP6hs
	mqyM/HOaIsbNgCi2gGUWk2nA/SAiwaMSIlKMsEneUn3H6IgrNoG7/6DpUd9PIcenBZzlTeCjIrCVD
	xEhMpymQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pev9u-002tfl-CF; Wed, 22 Mar 2023 09:53:30 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B96773001F7;
	Wed, 22 Mar 2023 10:53:29 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id A09DA205D08C3; Wed, 22 Mar 2023 10:53:29 +0100 (CET)
Date: Wed, 22 Mar 2023 10:53:29 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	x86@kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Juri Lelli <juri.lelli@redhat.com>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicholas Piggin <npiggin@gmail.com>, Guo Ren <guoren@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v5 7/7] sched, smp: Trace smp callback causing an IPI
Message-ID: <20230322095329.GS2017917@hirez.programming.kicks-ass.net>
References: <20230307143558.294354-1-vschneid@redhat.com>
 <20230307143558.294354-8-vschneid@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230307143558.294354-8-vschneid@redhat.com>
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

On Tue, Mar 07, 2023 at 02:35:58PM +0000, Valentin Schneider wrote:

> @@ -477,6 +490,25 @@ static __always_inline void csd_unlock(struct __call_single_data *csd)
>  	smp_store_release(&csd->node.u_flags, 0);
>  }
>  
> +static __always_inline void
> +raw_smp_call_single_queue(int cpu, struct llist_node *node, smp_call_func_t func)
> +{
> +	/*
> +	 * The list addition should be visible to the target CPU when it pops
> +	 * the head of the list to pull the entry off it in the IPI handler
> +	 * because of normal cache coherency rules implied by the underlying
> +	 * llist ops.
> +	 *
> +	 * If IPIs can go out of order to the cache coherency protocol
> +	 * in an architecture, sufficient synchronisation should be added
> +	 * to arch code to make it appear to obey cache coherency WRT
> +	 * locking and barrier primitives. Generic code isn't really
> +	 * equipped to do the right thing...
> +	 */
> +	if (llist_add(node, &per_cpu(call_single_queue, cpu)))
> +		send_call_function_single_ipi(cpu, func);
> +}
> +
>  static DEFINE_PER_CPU_SHARED_ALIGNED(call_single_data_t, csd_data);
>  
>  void __smp_call_single_queue(int cpu, struct llist_node *node)
> @@ -493,21 +525,25 @@ void __smp_call_single_queue(int cpu, struct llist_node *node)
>  		}
>  	}
>  #endif
>  	/*
> +	 * We have to check the type of the CSD before queueing it, because
> +	 * once queued it can have its flags cleared by
> +	 *   flush_smp_call_function_queue()
> +	 * even if we haven't sent the smp_call IPI yet (e.g. the stopper
> +	 * executes migration_cpu_stop() on the remote CPU).
>  	 */
> +	if (trace_ipi_send_cpumask_enabled()) {
> +		call_single_data_t *csd;
> +		smp_call_func_t func;
> +
> +		csd = container_of(node, call_single_data_t, node.llist);
> +		func = CSD_TYPE(csd) == CSD_TYPE_TTWU ?
> +			sched_ttwu_pending : csd->func;
> +
> +		raw_smp_call_single_queue(cpu, node, func);
> +	} else {
> +		raw_smp_call_single_queue(cpu, node, NULL);
> +	}
>  }

Hurmph... so we only really consume @func when we IPI. Would it not be
more useful to trace this thing for *every* csd enqeued?




_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
