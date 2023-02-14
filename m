Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09746C05027
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 15:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KrwSi5ZUMypQVqPS7I6i9iPmihuSnwfurhuzR7nf5y8=; b=l1DXr1Rn8YsDc3
	zr/SaC+AfVd9CcIe+/Apw77Fls+MYKWeQnNUWrxfCYACXTa3fBBVHRveFx2wKXtJ2xQGI2vBCDDiD
	p6gnLP4qPN7YGrwSw7lQ+DQER/DTW0oFWa8EUnUZBuNnJydo8GoijhZr0kcSbqCkwMkuaYRWY1faL
	Oiv9tNYRhfOR1oHEcMnujz8t6Dpxce/u3re3v+3HUhaM0bw+8/PUPnq7u3L3YG8MscrcmjQsOf9pB
	5Wh5Txbbz5ZuqR+g7pgzcQalNIypP+iAdKDBDcium88NIBBmVt4Hx2IH3mH+Z2bVQdQ/HOjeWKavb
	YtHS6OYPBlOYCWP+gX4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRwpx-002NP8-IF; Tue, 14 Feb 2023 15:03:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRw7m-0024s9-BZ
	for linux-snps-arc@lists.infradead.org; Tue, 14 Feb 2023 14:17:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676384256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7edBYp6qpX/SlmDw/QknJtcx6m2SrqGm1x4V+hfCBb4=;
	b=if/8bxJ1YFDlQdo61jr8v53vQ8zz1PRXM6iM024oMboqn8LvFcrM9wob6j6t18Hd1OgLIN
	Xxu7iAFCkYsEczlTovqWCPigwkyF3p649lSghSQHlTtDbdi+RrhvLyBvZkWUee+vXWgeXB
	/7caWgd8QiQz6LU7OKnCPrIVxKQVH3o=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-VNIOtyHOPGKdKZ7zO7cP7A-1; Tue, 14 Feb 2023 09:10:50 -0500
X-MC-Unique: VNIOtyHOPGKdKZ7zO7cP7A-1
Received: by mail-qv1-f69.google.com with SMTP id f6-20020a0cc306000000b0056e96f4fd64so6204948qvi.15
        for <linux-snps-arc@lists.infradead.org>; Tue, 14 Feb 2023 06:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7edBYp6qpX/SlmDw/QknJtcx6m2SrqGm1x4V+hfCBb4=;
        b=hoOtP8Hk9TT2INE2cqx4j1ba14fDUNaNNtgRNblkN6iuGjT1GBpv25lQFSpSmDA+Jv
         S/jWqujyJxQdsKUvbsEaUBBnAgr8Y6AVQAfr0YoTNuaK4lF08uk3EtZX5k7leXLc/p8C
         p2y77byc4OPiscmO6lplTGDz4yHESV04FNMxapNOpRCpUwwU5jO5HHq0FfXph8TxYXYi
         QA9YzzEr1fzxwbWf8ri5axSz7rAiWluYCGV7ig3Za7ixkXJh8GgDmWKd5Muny5humnk2
         WNa/YRtVidt1nqyL7ISZ1n6vB/be+1Tysh/lZpq6M9S0AnYAilvz+lpZtdSHDdD3u9QR
         67FQ==
X-Gm-Message-State: AO0yUKW6D2YaiXDRI5InrM6z/S8e21mWOzL2JAQaxQypxwgIXZcH2xmu
	FNc++xnPQ6VST1LervXT8B0jyr1wprLuRvdSGedKv7CNDzGQ7aNN71OFItqNel6W49jQX64fqyT
	YaRdy85+DCTX6vz10FP4ODS0mbVj8LEQ0
X-Received: by 2002:a05:622a:50:b0:3b8:691f:271 with SMTP id y16-20020a05622a005000b003b8691f0271mr3386028qtw.63.1676383850319;
        Tue, 14 Feb 2023 06:10:50 -0800 (PST)
X-Google-Smtp-Source: AK7set98OEMKfsGkU19OgnlE6heJ9O6LLo1g6QDlcHkAXfWHsX591p7/3MvgrPqMUwlWB9z0tPx4tA==
X-Received: by 2002:a05:622a:50:b0:3b8:691f:271 with SMTP id y16-20020a05622a005000b003b8691f0271mr3385969qtw.63.1676383849978;
        Tue, 14 Feb 2023 06:10:49 -0800 (PST)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id s184-20020ae9dec1000000b0073b38652b9csm4892065qkf.122.2023.02.14.06.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 06:10:49 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Daniel
 Bristot de Oliveira <bristot@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Frederic Weisbecker <frederic@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell
 King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Guo Ren
 <guoren@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v4 0/7] Generic IPI sending tracepoint
In-Reply-To: <20230119143619.2733236-1-vschneid@redhat.com>
References: <20230119143619.2733236-1-vschneid@redhat.com>
Date: Tue, 14 Feb 2023 14:10:43 +0000
Message-ID: <xhsmhh6voqqvw.mognet@vschneid.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_061738_487951_C1173756 
X-CRM114-Status: GOOD (  11.83  )
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


Hey folks,

On 19/01/23 14:36, Valentin Schneider wrote:
> Patches
> =======
>
> o Patches 1-5 spread out the tracepoint across relevant sites.
>   Patch 5 ends up sprinkling lots of #include <trace/events/ipi.h> which I'm not
>   the biggest fan of, but is the least horrible solution I've been able to come
>   up with so far.
>
> o Patch 7 is trying to be smart about tracing the callback associated with the
>   IPI.
>
> This results in having IPI trace events for:
>
> o smp_call_function*()
> o smp_send_reschedule()
> o irq_work_queue*()
> o standalone uses of __smp_call_single_queue()
>

This still rebases cleanly on top of the latest tip/sched/core, any
objections to parking it there?


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
