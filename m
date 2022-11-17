Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE81C4332F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Nov 2022 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vaRrVDNtVxT9+4TqJxfXTn0/AWQP3d4X506ZSQ/9S7I=; b=oLH1gpkaF3HgDU
	UdT/aQF+R5W1D7ylr1Ow/EQNx3/uLZ3cQvqihC3T/LFFbVxD22S+igqkoKdNSLnAflN/pgtW3Ce59
	SbOiTMedF68a03NvMmjMoL/722+E90brPAcvHLA8Fa4ryt4WLFLvzsxBRmmzU7ogAojZuN4u79A0b
	yGP9nf8vK2zdCvqk8HhEER4iWn8iqUMWJ8kvLZISnOuRdSRS8GVNdsxyfCoxfePXXWg0gH/zApWEb
	Nw8tpgSO9Hi40qTq28eJveoYXMygUtZ23Xt7KoV9rlDi5FGqJu5qJdC8GjX8A+cIg0+xtFEmdSzxc
	RjbbY18VaZ45voYIxuMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovg9C-00Evs8-A4; Thu, 17 Nov 2022 14:45:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovg95-00EvmY-Ly
	for linux-snps-arc@lists.infradead.org; Thu, 17 Nov 2022 14:45:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668696338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8gmgQPGvV0Pdco46Use918rHcFMun1FBq8lcqpGuipk=;
	b=WHLp+j2JwA+WtR97vTkPT0o4n4Tn8Z+CdeXCE+SjRo090Dnff4bI5Zw0Wgmn2367z/o2A/
	T34RXjDWMNql3epTmt/hPbAJtxWid97jiX7oFRf1NnIylNSN4bSxhprZiLhAM0wUOy8upu
	vP4iCUt8Y6LZ+v5NwmINmfujQRfd8Ac=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-454-iOoZj-DeMaSjqnRXwDlZPw-1; Thu, 17 Nov 2022 09:45:37 -0500
X-MC-Unique: iOoZj-DeMaSjqnRXwDlZPw-1
Received: by mail-wm1-f71.google.com with SMTP id j2-20020a05600c1c0200b003cf7397fc9bso730678wms.5
        for <linux-snps-arc@lists.infradead.org>; Thu, 17 Nov 2022 06:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8gmgQPGvV0Pdco46Use918rHcFMun1FBq8lcqpGuipk=;
        b=tp03p3jEm9P0NfdjX3++Hv+EYBq2xcvHV307VwmWGHkmYXnvfy8gMRAKHkjiMPjIbK
         n7TncR1abEsMBK0FZ2/HWNPzI+Gg5RWWyLTpjQYaou+bUi+tIldZXwj5rX14y4swjZjr
         qw9Vh/B8vR4aUazkspvdGHg1wxOxYrvT/z4Mrq+GL8WHCyTRDm42zQfXTdxLRGhFBomp
         TdNGyhI6j9NR1QtMBUAIclr7IW+9c0HoHeTL2a0Jnhp2m9+1W2Lwdi25dYwyPXRJrYtA
         jqVlmzlKAUdNtABLKZ3Z6k18XEMcaRb6N3EZ7yx0g/id+4knsQoPmoa9z9gDvnOXvY+h
         DNRA==
X-Gm-Message-State: ANoB5pnRjq2Xhi2zV2JOazvOncrKfoxBbQX6LUGb6fprC+Scy316WRV3
	tNTu9zzAPApK2BspvUNz7DUWHhh4Say+VXUm7YYbRvu8idaSOEKx7t6QTIw7Q7iUWNnSXDlUc/A
	ggRZcCgjY027fphXIljTAIx6lw3YPwEoF
X-Received: by 2002:a5d:4683:0:b0:23a:43b7:cdd5 with SMTP id u3-20020a5d4683000000b0023a43b7cdd5mr1645376wrq.387.1668696335544;
        Thu, 17 Nov 2022 06:45:35 -0800 (PST)
X-Google-Smtp-Source: AA0mqf64NPDvBapwgGSgB2P5pH25AfOA35vY/3ogR7keZELycX3grFeKUdCp0vRGXy3K3A08o5vlDw==
X-Received: by 2002:a5d:4683:0:b0:23a:43b7:cdd5 with SMTP id u3-20020a5d4683000000b0023a43b7cdd5mr1645351wrq.387.1668696335309;
        Thu, 17 Nov 2022 06:45:35 -0800 (PST)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id t18-20020a5d6a52000000b00236740c6e6fsm1069950wrw.100.2022.11.17.06.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 06:45:34 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, "Paul E. McKenney"
 <paulmck@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Daniel
 Bristot de Oliveira <bristot@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Frederic Weisbecker <frederic@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell
 King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Guo Ren
 <guoren@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [RFC PATCH v2 8/8] sched, smp: Trace smp callback causing an IPI
In-Reply-To: <Y3ZBUMteJysc1/lA@hirez.programming.kicks-ass.net>
References: <20221102182949.3119584-1-vschneid@redhat.com>
 <20221102183336.3120536-7-vschneid@redhat.com>
 <Y3ZBUMteJysc1/lA@hirez.programming.kicks-ass.net>
Date: Thu, 17 Nov 2022 14:45:29 +0000
Message-ID: <xhsmhfsehy706.mognet@vschneid.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_064539_841198_526377A5 
X-CRM114-Status: GOOD (  31.93  )
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

On 17/11/22 15:12, Peter Zijlstra wrote:
> On Wed, Nov 02, 2022 at 06:33:36PM +0000, Valentin Schneider wrote:
> *yuck*

:-)

>
> How about something like so?
>
> ---
> --- a/kernel/irq_work.c
> +++ b/kernel/irq_work.c
> @@ -24,6 +24,8 @@
>
>  #include <trace/events/ipi.h>
>
> +#include "sched/smp.h"
> +
>  static DEFINE_PER_CPU(struct llist_head, raised_list);
>  static DEFINE_PER_CPU(struct llist_head, lazy_list);
>  static DEFINE_PER_CPU(struct task_struct *, irq_workd);
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3763,16 +3763,17 @@ void sched_ttwu_pending(void *arg)
>       rq_unlock_irqrestore(rq, &rf);
>  }
>
> -void send_call_function_single_ipi(int cpu)
> +bool send_call_function_single_ipi(int cpu)
>  {
>       struct rq *rq = cpu_rq(cpu);
>
>       if (!set_nr_if_polling(rq->idle)) {
> -		trace_ipi_send_cpumask(cpumask_of(cpu), _RET_IP_, NULL);
>               arch_send_call_function_single_ipi(cpu);
> -	} else {
> -		trace_sched_wake_idle_without_ipi(cpu);
> +		return true;
>       }
> +
> +	trace_sched_wake_idle_without_ipi(cpu);
> +	return false;
>  }
>
>  /*
> --- a/kernel/sched/smp.h
> +++ b/kernel/sched/smp.h
> @@ -6,7 +6,7 @@
>
>  extern void sched_ttwu_pending(void *arg);
>
> -extern void send_call_function_single_ipi(int cpu);
> +extern bool send_call_function_single_ipi(int cpu);
>
>  #ifdef CONFIG_SMP
>  extern void flush_smp_call_function_queue(void);
> --- a/kernel/smp.c
> +++ b/kernel/smp.c
> @@ -163,7 +163,6 @@ void __init call_function_init(void)
>  static inline void
>  send_call_function_ipi_mask(const struct cpumask *mask)
>  {
> -	trace_ipi_send_cpumask(mask, _RET_IP_, func);
>       arch_send_call_function_ipi_mask(mask);
>  }
>
> @@ -438,11 +437,16 @@ static void __smp_call_single_queue_debu
>       struct cfd_seq_local *seq = this_cpu_ptr(&cfd_seq_local);
>       struct call_function_data *cfd = this_cpu_ptr(&cfd_data);
>       struct cfd_percpu *pcpu = per_cpu_ptr(cfd->pcpu, cpu);
> +	struct __call_single_data *csd;
> +
> +	csd = container_of(node, call_single_data_t, node.llist);
> +	WARN_ON_ONCE(!(CSD_TYPE(csd) & (CSD_TYPE_SYNC | CSD_TYPE_ASYNC)));
>
>       cfd_seq_store(pcpu->seq_queue, this_cpu, cpu, CFD_SEQ_QUEUE);
>       if (llist_add(node, &per_cpu(call_single_queue, cpu))) {
>               cfd_seq_store(pcpu->seq_ipi, this_cpu, cpu, CFD_SEQ_IPI);
>               cfd_seq_store(seq->ping, this_cpu, cpu, CFD_SEQ_PING);
> +		trace_ipi_send_cpumask(cpumask_of(cpu), _RET_IP_, csd->func);
>               send_call_function_single_ipi(cpu);
>               cfd_seq_store(seq->pinged, this_cpu, cpu, CFD_SEQ_PINGED);
>       } else {
> @@ -487,6 +491,27 @@ static __always_inline void csd_unlock(s
>
>  static DEFINE_PER_CPU_SHARED_ALIGNED(call_single_data_t, csd_data);
>
> +static __always_inline
> +bool raw_smp_call_single_queue(int cpu, struct llist_node *node)
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
> +		return send_call_function_single_ipi(cpu);
> +
> +	return false;
> +}
> +
>  void __smp_call_single_queue(int cpu, struct llist_node *node)
>  {
>  #ifdef CONFIG_CSD_LOCK_WAIT_DEBUG
> @@ -503,19 +528,28 @@ void __smp_call_single_queue(int cpu, st
>  #endif
>
>       /*
> -	 * The list addition should be visible to the target CPU when it pops
> -	 * the head of the list to pull the entry off it in the IPI handler
> -	 * because of normal cache coherency rules implied by the underlying
> -	 * llist ops.
> -	 *
> -	 * If IPIs can go out of order to the cache coherency protocol
> -	 * in an architecture, sufficient synchronisation should be added
> -	 * to arch code to make it appear to obey cache coherency WRT
> -	 * locking and barrier primitives. Generic code isn't really
> -	 * equipped to do the right thing...
> -	 */
> -	if (llist_add(node, &per_cpu(call_single_queue, cpu)))
> -		send_call_function_single_ipi(cpu);
> +	 * We have to check the type of the CSD before queueing it, because
> +	 * once queued it can have its flags cleared by
> +	 *   flush_smp_call_function_queue()
> +	 * even if we haven't sent the smp_call IPI yet (e.g. the stopper
> +	 * executes migration_cpu_stop() on the remote CPU).
> +	 */
> +	if (trace_ipi_send_cpumask_enabled()) {
> +		call_single_data_t *csd;
> +		smp_call_func_t func;
> +
> +		csd = container_of(node, call_single_data_t, node.llist);
> +
> +		func = sched_ttwu_pending;
> +		if (CSD_TYPE(csd) != CSD_TYPE_TTWU)
> +			func = csd->func;
> +
> +		if (raw_smp_call_single_queue(cpu, node))
> +			trace_ipi_send_cpumask(cpumask_of(cpu), _RET_IP_, func);

So I went with the tracepoint being placed *before* the actual IPI gets
sent to have a somewhat sane ordering between trace_ipi_send_cpumask() and
e.g. trace_call_function_single_entry().

Packaging the call_single_queue logic makes the code less horrible, but it
does mix up the event ordering...


> +		return;
> +	}
> +
> +	raw_smp_call_single_queue(cpu, node);
>  }
>
>  /*
> @@ -983,10 +1017,13 @@ static void smp_call_function_many_cond(
>                * number of CPUs might be zero due to concurrent changes to the
>                * provided mask.
>                */
> -		if (nr_cpus == 1)
> +		if (nr_cpus == 1) {
> +			trace_ipi_send_cpumask(cpumask_of(last_cpu), _RET_IP_, func);
>                       send_call_function_single_ipi(last_cpu);

This'll yield an IPI event even if no IPI is sent due to the idle task
polling, no?

> -		else if (likely(nr_cpus > 1))
> -			send_call_function_ipi_mask(cfd->cpumask_ipi);
> +		} else if (likely(nr_cpus > 1)) {
> +			trace_ipi_send_cpumask(mask, _RET_IP_, func);
> +			send_call_function_ipi_mask(mask);
> +		}
>
>               cfd_seq_store(this_cpu_ptr(&cfd_seq_local)->pinged, this_cpu, CFD_SEQ_NOCPU, CFD_SEQ_PINGED);
>       }


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
