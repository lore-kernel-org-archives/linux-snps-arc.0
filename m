Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A68C6FD1C
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Mar 2023 18:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ypagAif2MHOtVbs4H508fiqOPOheJNIIAxoEZosyYus=; b=wh5vrVaWWH83mC
	PgBc+exD0xRSqkZ7q6Bsh62KZZX+2pcuc4ol2UJTv4VlsGfqKw+Z6tYpLhOQfcibbRhLc5SpR8CEb
	OWmyrAMu0iXvMkMqKHYGTIAZhmQ0JDBzlSNYCYYlfP9gVrse2ZmNdALEvhG+ED4TURosQSsT2lcCV
	nO5XNNjFkz5a6ojPg4sB4YcveD92VFafsEH2P5BeZ2DlfZY2naViFYb3BzmusXfnWOxKK/Y9I+csu
	PSCOMXrMP0ppIme64kqHLF0/7LXKwgZsxbRkQjXEn+AzNPHUKE9l1gWai5AqbaLrOJQG0M5q0KqGL
	itCQJN8EJkUy8xgcjIgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfPj3-002iqw-1l;
	Thu, 23 Mar 2023 18:31:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfPj0-002ips-0M
	for linux-snps-arc@lists.infradead.org;
	Thu, 23 Mar 2023 18:31:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679596305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OQhuytQNa//R38jUclcb8GrjXYgITp5dQj88746r1Bo=;
	b=a9jKgFfLchsd1d4fCchlUwQjLiOE2gGw7j2jY9XlVeESDWvnTfbxIG1Pue0Y+IBbVB9ejb
	drjSIt6z0AWvpyoAbaDHfdPLv4TbsuISeFPuV1H72tXL/jvBgbEITuQ2RCvouAw+35fS/A
	S5DG/O6V42EtEE4ZNKSfSHxxK+JpRGk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-sxNySIRTO2yhynip14Au0w-1; Thu, 23 Mar 2023 14:31:42 -0400
X-MC-Unique: sxNySIRTO2yhynip14Au0w-1
Received: by mail-wm1-f72.google.com with SMTP id bi5-20020a05600c3d8500b003edda1368d7so1338822wmb.8
        for <linux-snps-arc@lists.infradead.org>; Thu, 23 Mar 2023 11:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679596301;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OQhuytQNa//R38jUclcb8GrjXYgITp5dQj88746r1Bo=;
        b=WPeoltsUhQNY4tgcnYGDElE4EfcTrnqubwP3ffDRzLukosXqwcFl55GLjw+Q0Z/mHz
         6X4N0yiVseQayTC9PNPNZUNxYJVvO17jGvlVlN3hhwUUpH9mKcWN64DtCLN7wwTWOojr
         +cmAamSIi4vpxniReAC6nQbISG1GFoTVKRSu+9XJguDAmLVdYMVezmYcSoL5kzzHn/3j
         Ri6yEbfeuulaSe1/d3+lDwvyggeZHnVNf/DJsRkBV0+CstTfTkfLZVwTpJPppgEvmeSV
         IG/tm2Y8cA5L40k5+OekF99vKPROxqupVDtzyFodS27sABh/Vc1rKv2IQDD08Ar8CwbP
         W6/g==
X-Gm-Message-State: AAQBX9eGNu5rShjo9LnqMiVhuRiKYEQ4VivXgwYYF4LdxDfEz/tdNS/D
	MZF/c2psT6l7BAvKtcvuuEE5nHBdx3tGh/64uvqhSmoV/p23HJU7nZjlMvEzQ44n3/nZzK3DV7e
	CfGhxbYjz/bVV/28QTxbQTa5p8WfPDh0H
X-Received: by 2002:adf:ee4e:0:b0:2d2:f3e3:115d with SMTP id w14-20020adfee4e000000b002d2f3e3115dmr104090wro.59.1679596301161;
        Thu, 23 Mar 2023 11:31:41 -0700 (PDT)
X-Google-Smtp-Source: AKy350akLKxXWb1wSOfhINrcngkAYQLWnw4Bp2RUkomUFDjjiyXwtTV3jYctLuET3Ky7jfggPrYKfQ==
X-Received: by 2002:adf:ee4e:0:b0:2d2:f3e3:115d with SMTP id w14-20020adfee4e000000b002d2f3e3115dmr104063wro.59.1679596300886;
        Thu, 23 Mar 2023 11:31:40 -0700 (PDT)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id s17-20020a5d4251000000b002d1801018e2sm16702552wrr.63.2023.03.23.11.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 11:31:39 -0700 (PDT)
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
Subject: Re: [PATCH v5 7/7] sched, smp: Trace smp callback causing an IPI
In-Reply-To: <20230323174129.GA2753619@hirez.programming.kicks-ass.net>
References: <20230307143558.294354-1-vschneid@redhat.com>
 <20230307143558.294354-8-vschneid@redhat.com>
 <20230322095329.GS2017917@hirez.programming.kicks-ass.net>
 <xhsmhmt45c703.mognet@vschneid.remote.csb>
 <20230322140434.GC2357380@hirez.programming.kicks-ass.net>
 <xhsmhbkkjcu4q.mognet@vschneid.remote.csb>
 <20230323174129.GA2753619@hirez.programming.kicks-ass.net>
Date: Thu, 23 Mar 2023 18:31:37 +0000
Message-ID: <xhsmh8rfncoae.mognet@vschneid.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_113146_238730_6934D0CB 
X-CRM114-Status: GOOD (  25.74  )
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

On 23/03/23 18:41, Peter Zijlstra wrote:
> On Thu, Mar 23, 2023 at 04:25:25PM +0000, Valentin Schneider wrote:
>> On 22/03/23 15:04, Peter Zijlstra wrote:
>> > @@ -798,14 +794,20 @@ static void smp_call_function_many_cond(
>> >  		}
>> >  
>> >  		/*
>> > +		 * Trace each smp_function_call_*() as an IPI, actual IPIs
>> > +		 * will be traced with func==generic_smp_call_function_single_ipi().
>> > +		 */
>> > +		trace_ipi_send_cpumask(cfd->cpumask_ipi, _RET_IP_, func);
>> 
>> I just got a trace pointing out this can emit an event even though no IPI
>> is sent if e.g. the cond_func predicate filters all CPUs in the argument
>> mask:
>> 
>>   ipi_send_cpumask:     cpumask= callsite=on_each_cpu_cond_mask+0x3c callback=flush_tlb_func+0x0
>> 
>> Maybe something like so on top?
>> 
>> ---
>> diff --git a/kernel/smp.c b/kernel/smp.c
>> index ba5478814e677..1dc452017d000 100644
>> --- a/kernel/smp.c
>> +++ b/kernel/smp.c
>> @@ -791,6 +791,8 @@ static void smp_call_function_many_cond(const struct cpumask *mask,
>>  			}
>>  		}
>>  
>> +		if (!nr_cpus)
>> +			goto local;
>
> Hmm, this isn't right. You can get nr_cpus==0 even though it did add
> some to various lists but never was first.
>

Duh, glanced over that.

> But urgh, even if we were to say count nr_queued we'd never get the mask
> right, because we don't track which CPUs have the predicate matched,
> only those we need to actually send an IPI to :/
>
> Ooh, I think we can clear those bits from cfd->cpumask, arguably that's
> a correctness fix too, because the 'run_remote && wait' case shouldn't
> wait on things we didn't queue.
>

Yeah, that makes sense to me. Just one tiny suggestion below.

> Hmm?
>
>
> --- a/kernel/smp.c
> +++ b/kernel/smp.c
> @@ -728,9 +728,9 @@ static void smp_call_function_many_cond(
>  	int cpu, last_cpu, this_cpu = smp_processor_id();
>  	struct call_function_data *cfd;
>  	bool wait = scf_flags & SCF_WAIT;
> +	int nr_cpus = 0, nr_queued = 0;
>  	bool run_remote = false;
>  	bool run_local = false;
> -	int nr_cpus = 0;
>  
>  	lockdep_assert_preemption_disabled();
>  
> @@ -772,8 +772,10 @@ static void smp_call_function_many_cond(
>  		for_each_cpu(cpu, cfd->cpumask) {
>  			call_single_data_t *csd = per_cpu_ptr(cfd->csd, cpu);
>  
> -			if (cond_func && !cond_func(cpu, info))
> +			if (cond_func && !cond_func(cpu, info)) {
> +				__cpumask_clear_cpu(cpu, cfd->cpumask);
>  				continue;
> +			}
>  
>  			csd_lock(csd);
>  			if (wait)
> @@ -789,13 +791,15 @@ static void smp_call_function_many_cond(
>  				nr_cpus++;
>  				last_cpu = cpu;
>  			}
> +			nr_queued++;
>  		}
>  
>  		/*
>  		 * Trace each smp_function_call_*() as an IPI, actual IPIs
>  		 * will be traced with func==generic_smp_call_function_single_ipi().
>  		 */
> -		trace_ipi_send_cpumask(cfd->cpumask_ipi, _RET_IP_, func);
> +		if (nr_queued)

With your change to cfd->cpumask, we could ditch nr_queued and make this

                if (!cpumask_empty(cfd->cpumask))

since cfd->cpumask now only contains CPUs that have had a CSD queued.

> +			trace_ipi_send_cpumask(cfd->cpumask, _RET_IP_, func);
>  
>  		/*
>  		 * Choose the most efficient way to send an IPI. Note that the


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
