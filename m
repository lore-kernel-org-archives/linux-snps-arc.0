Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264AEC433FE
	for <linux-snps-arc@archiver.kernel.org>; Tue, 11 Oct 2022 16:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nvk2az75W01x1pX8tKD5ZvGbGKy7GiiJqtv9nKlzMr8=; b=NiXgRO7Y/umBAh
	35cR0tPS78n3R1g5j37iEjdk5AEPIfsa536d9YsbbbRnrPzvsxuT1kVVuACeSYZmu2vFNAkIHgSAs
	cBigt/ZgX+lDF4kBZnxd6K9wGFUxfwd80HSP9FgM8uxATRkO5hVtto23rYRXFWcgbaSXQyYc8D+5P
	WXP11qxgLQ6dRh0xVwZqxs4iTIdBIga1cXYIAAr4847cIz7bGbNxtPMYR1ZwDTYfbEIwi8Rkyk3wy
	NQEMDU4WPUHWmv2WlHD78phFfuX2yvypGB2vTo0aEV7/10f5WfydBv/jIQ9TQUR4PEt28fqNfStXY
	SKcWz+for2XOqtN81VdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiIJ9-005FMz-Vt; Tue, 11 Oct 2022 16:40:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiIJ0-005FKE-1L
	for linux-snps-arc@lists.infradead.org; Tue, 11 Oct 2022 16:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665506433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3pR097ooCx/8nlTemhEf/WDhel/4mmcsp3Jh/tnUV8M=;
	b=U/gLUFQ2zyyKGXACegVmBqdC1ESayzCM+4Guli9wS8EzjGhpTiE/XwmboZbOwobIBUAcgj
	BfyHwBm51vNPihWQktKt/zcwJiKJMo7B5mxBF7UVXyas/OBKw5tAwCXVuaZmeRfY7Kg9sn
	+5p9oEl8//+9o5ofGCSaIH9sBgsQTMs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-658-scK1mC76M2KlzNxz-ZK2Yg-1; Tue, 11 Oct 2022 12:40:32 -0400
X-MC-Unique: scK1mC76M2KlzNxz-ZK2Yg-1
Received: by mail-wm1-f72.google.com with SMTP id k2-20020a05600c1c8200b003c3dd3aa638so6217788wms.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 11 Oct 2022 09:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3pR097ooCx/8nlTemhEf/WDhel/4mmcsp3Jh/tnUV8M=;
        b=X78CdKYNRG9/+QbuIQWcigPr6VAmhwgIH/s+SuSJyOuqkOKzzSarb1MYOKOw+Pis+Z
         DnGZXYmaV2cu7SxaCizFme2B7vM6NEM0KD9SO1I9UaohKAWTLLViL+wvvZphYu077u5m
         Y+850aavUCYdkTSWqqs5ax5w7DSeY1IjjIslbKIBtCKTJl52oVV1jgkMKdDHyHBBO+z/
         RGH6wJ40tPltWojc5A8ncXxSRdHkRZIPOdT0gq/Gyf6/+dQ5WoRnLLepnqaU8orlDb+W
         Noqu1VHW1a/hco0QJKUS6Z82jtnEdpH1+Glr098TJhhbQB4G7YwMIMHPEJNhFa03gmSq
         Q/WA==
X-Gm-Message-State: ACrzQf0z772n3M9X/0TXtrym0R2eoFg77c9DqPQk8a10TjScpRBlQEGN
	qPIUw+8FCwCsbaS5vmFijsdsVbf4HI/KBi2DZjkM7f8VgPtv420theWVtXxi0jN4kb0VsKwgSQA
	xPoiN0V56MjVAqP+E3zInbaY6kNo9xeiW
X-Received: by 2002:a5d:59a7:0:b0:230:3652:1aa with SMTP id p7-20020a5d59a7000000b00230365201aamr8455614wrr.308.1665506428136;
        Tue, 11 Oct 2022 09:40:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4XCj7SFWdE6E5DxEmMGEk+A0mlMYyEPprqhbmdn8jGtDu/Z9OxlEVw6NK6vPTlYZN68wZltQ==
X-Received: by 2002:a5d:59a7:0:b0:230:3652:1aa with SMTP id p7-20020a5d59a7000000b00230365201aamr8455591wrr.308.1665506427912;
        Tue, 11 Oct 2022 09:40:27 -0700 (PDT)
Received: from vschneid.remote.csb ([104.132.153.106])
        by smtp.gmail.com with ESMTPSA id y3-20020a7bcd83000000b003a3170a7af9sm7900578wmj.4.2022.10.11.09.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 09:40:27 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Daniel Bristot de Oliveira <bristot@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, "Paul E. McKenney"
 <paulmck@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Peter Zijlstra
 <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Sebastian
 Andrzej Siewior <bigeasy@linutronix.de>, Juri Lelli
 <juri.lelli@redhat.com>, Frederic Weisbecker <frederic@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell
 King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Marcelo
 Tosatti <mtosatti@redhat.com>, Guo Ren <guoren@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Douglas RAILLARD <douglas.raillard@arm.com>
Subject: Re: [RFC PATCH 0/5] Generic IPI sending tracepoint
In-Reply-To: <3e680bb9-9896-3665-dd59-4f2e6f8205bb@redhat.com>
References: <20221007154145.1877054-1-vschneid@redhat.com>
 <Y0CFnWDpMNGajIRD@fuller.cnet> <xhsmhilkqfi7z.mognet@vschneid.remote.csb>
 <3e680bb9-9896-3665-dd59-4f2e6f8205bb@redhat.com>
Date: Tue, 11 Oct 2022 17:40:26 +0100
Message-ID: <xhsmhfsfufh51.mognet@vschneid.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_094034_195528_4A2F5F43 
X-CRM114-Status: GOOD (  16.39  )
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

On 11/10/22 18:22, Daniel Bristot de Oliveira wrote:
> On 10/11/22 18:17, Valentin Schneider wrote:
>> Thinking out loud, it makes way more sense to record a cpumask in the
>> tracepoint, but perhaps we could have a postprocessing step to transform
>> those into N events each targeting a single CPU?
>
> My approach on the tracers/rtla is to make the simple things in kernel, and beautify
> things in user-space.
>
> You could keep the tracepoint as a mask, and then make it pretty, like cpus=3-5,8
> in user-space. For example with a trace-cmd/perf loadable plugin, libtracefs helper.
>

That's a nice idea, the one downside I see is that means registering an
event handler for all events with cpumasks rather than directly targeting
cpumask fields, but that doesn't look too horrible. I'll dig a bit in that
direction.

> For rtla I was thinking to make a new tool to parse them. and make it pretty there.
>
> -- Daniel


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
