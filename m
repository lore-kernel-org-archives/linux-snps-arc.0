Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9EDC74A5B
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Mar 2023 17:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DE0ut+DNoMWwwukYKvmOVBA0HW2DLHMrcnP//H962yM=; b=ApGOspZ7r09bWA
	+hQniV7xuBxmimbeR41lLrCvFwnTn7ODs7hGBPTuF3p4Z1Ls+2tF+SAPX9qLjmRj0PVK+wUNS2tua
	bUUuG139X0/pALAorNafPH398+aisYzqo685EVvhL3SsrLwcTwH9AFPvRA7kRC693gSQI/3NsGvqQ
	CTWXqSmQ5c7+WDj6XCvk1mdlnxpxo30/0M8FYoF1zTS+R6v0ltxg0wUnAbWcs40LvIYdpCTfXBK3Y
	Ygd0AMp+ef4OS9E7MiqfH39T4wmUe1QqIgFDmgfDXJzj4cLav6k0ITvbwo2+yV0z+WDJEUkRHaVFZ
	rvodJDZ0uaI8T2f4saNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfOwc-002dxm-2R;
	Thu, 23 Mar 2023 17:41:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfOwZ-002dwI-38;
	Thu, 23 Mar 2023 17:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uknWkbKCt7r7d+Uri/V39eu4SUqBOmf1+zXqyPceR/Q=; b=dDxw8FpzxhqVLTwZLp+6PLqsZb
	sRJ3X8JsTwZ/JiVyuRpgwQqpktLFA6bvn6+Z5BUFJqFkJRGddW2MQ80jsQJfIgRgfreJe2ASji3Ok
	ubgdvdDoJEumb5zC8iamfg/Bj2JpUUoIIkbWbcU+eS2YQIKqSfzW3woiON0TO/xxXdEJFV3HgvHvO
	sXiZid3LBW1uxBADyBwicyQ2lIEhNgqEfn2o6vq+arvPTl9YSvFX++J11S113A+M+rXKiwhf9f2WT
	HAcSaWWs+/beDL4nUBnINhc313sBkIdpEH77HQ1cT1mXenwbLj9N8jiiOSWeGoraLKmJYcbpzRY9+
	kwRmLaAw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pfOwQ-004vDx-2T;
	Thu, 23 Mar 2023 17:41:35 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7E8ED3002FC;
	Thu, 23 Mar 2023 18:41:29 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 68B95240DB73A; Thu, 23 Mar 2023 18:41:29 +0100 (CET)
Date: Thu, 23 Mar 2023 18:41:29 +0100
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
Message-ID: <20230323174129.GA2753619@hirez.programming.kicks-ass.net>
References: <20230307143558.294354-1-vschneid@redhat.com>
 <20230307143558.294354-8-vschneid@redhat.com>
 <20230322095329.GS2017917@hirez.programming.kicks-ass.net>
 <xhsmhmt45c703.mognet@vschneid.remote.csb>
 <20230322140434.GC2357380@hirez.programming.kicks-ass.net>
 <xhsmhbkkjcu4q.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <xhsmhbkkjcu4q.mognet@vschneid.remote.csb>
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

On Thu, Mar 23, 2023 at 04:25:25PM +0000, Valentin Schneider wrote:
> On 22/03/23 15:04, Peter Zijlstra wrote:
> > @@ -798,14 +794,20 @@ static void smp_call_function_many_cond(
> >  		}
> >  
> >  		/*
> > +		 * Trace each smp_function_call_*() as an IPI, actual IPIs
> > +		 * will be traced with func==generic_smp_call_function_single_ipi().
> > +		 */
> > +		trace_ipi_send_cpumask(cfd->cpumask_ipi, _RET_IP_, func);
> 
> I just got a trace pointing out this can emit an event even though no IPI
> is sent if e.g. the cond_func predicate filters all CPUs in the argument
> mask:
> 
>   ipi_send_cpumask:     cpumask= callsite=on_each_cpu_cond_mask+0x3c callback=flush_tlb_func+0x0
> 
> Maybe something like so on top?
> 
> ---
> diff --git a/kernel/smp.c b/kernel/smp.c
> index ba5478814e677..1dc452017d000 100644
> --- a/kernel/smp.c
> +++ b/kernel/smp.c
> @@ -791,6 +791,8 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
>  			}
>  		}
>  
> +		if (!nr_cpus)
> +			goto local;

Hmm, this isn't right. You can get nr_cpus==0 even though it did add
some to various lists but never was first.

But urgh, even if we were to say count nr_queued we'd never get the mask
right, because we don't track which CPUs have the predicate matched,
only those we need to actually send an IPI to :/

Ooh, I think we can clear those bits from cfd->cpumask, arguably that's
a correctness fix too, because the 'run_remote && wait' case shouldn't
wait on things we didn't queue.

Hmm?


--- a/kernel/smp.c
+++ b/kernel/smp.c
@@ -728,9 +728,9 @@ static void smp_call_function_many_cond(
 	int cpu, last_cpu, this_cpu = smp_processor_id();
 	struct call_function_data *cfd;
 	bool wait = scf_flags & SCF_WAIT;
+	int nr_cpus = 0, nr_queued = 0;
 	bool run_remote = false;
 	bool run_local = false;
-	int nr_cpus = 0;
 
 	lockdep_assert_preemption_disabled();
 
@@ -772,8 +772,10 @@ static void smp_call_function_many_cond(
 		for_each_cpu(cpu, cfd->cpumask) {
 			call_single_data_t *csd = per_cpu_ptr(cfd->csd, cpu);
 
-			if (cond_func && !cond_func(cpu, info))
+			if (cond_func && !cond_func(cpu, info)) {
+				__cpumask_clear_cpu(cpu, cfd->cpumask);
 				continue;
+			}
 
 			csd_lock(csd);
 			if (wait)
@@ -789,13 +791,15 @@ static void smp_call_function_many_cond(
 				nr_cpus++;
 				last_cpu = cpu;
 			}
+			nr_queued++;
 		}
 
 		/*
 		 * Trace each smp_function_call_*() as an IPI, actual IPIs
 		 * will be traced with func==generic_smp_call_function_single_ipi().
 		 */
-		trace_ipi_send_cpumask(cfd->cpumask_ipi, _RET_IP_, func);
+		if (nr_queued)
+			trace_ipi_send_cpumask(cfd->cpumask, _RET_IP_, func);
 
 		/*
 		 * Choose the most efficient way to send an IPI. Note that the


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
