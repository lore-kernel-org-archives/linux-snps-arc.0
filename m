Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB80EC5479D
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Jan 2023 19:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ikCfNmewNq2mmzOxPkY5lxswweTAfNl4CaFMDacQZ98=; b=xb7mvsBOBWn+/x
	Ey+Dhyn5l8rd26T6tcQS55rwBLI+aGc8AQLIdpHdhOwlnCiFTFhbx4MZOOt402DhSAyjSdma82uzA
	878Key+uyv4TG2GF5VlTeTkkoUhoxfL0SYg0uaGH1KX7fU+QXio04NrXVaKAKPVRlR8ZJfJAi6+6f
	yMf1PfGwGhIXwMcZQ13eTX99xDWVCmP1eV11ANszTx/hmcRyRzQovaRpf/mXwKxNvmxifjr5n7M5l
	1oNDIXzhKtldTMk3167GSCerK9DcVAfzcXzDKpUyRpyY/fm+EUWxy9KYmzzpb6rmEeXDynTHvUtrC
	j/r0o9uCXbnKZcYYzpKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pExQ5-003VdJ-9I; Mon, 09 Jan 2023 19:02:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pExPW-003VNR-1z
	for linux-snps-arc@lists.infradead.org; Mon, 09 Jan 2023 19:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673290937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mHlpuxTK3Q4mXdtUEAjHx/X4tIty+fqRI+m6xngZY9c=;
	b=iYLzfX/+x0gg809zW0TTeakmRwaUF0lw64Q6nF8en1Uul5QIM1GCu8sbmRnTHfpB3HFrp6
	oxhdcO7uTCXXXxk7EsQgQVC/pVAGqjSG9jgNDQdmVvz9akY9LbE16OWkdEv69rUibGbcws
	LgFQhXQxiRIFhsuNJsoft1bsRTeAWt8=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-524-AsDDfU14PxGBIX6NPU6VQw-1; Mon, 09 Jan 2023 14:02:16 -0500
X-MC-Unique: AsDDfU14PxGBIX6NPU6VQw-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-4bdeb1bbeafso100726167b3.4
        for <linux-snps-arc@lists.infradead.org>; Mon, 09 Jan 2023 11:02:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mHlpuxTK3Q4mXdtUEAjHx/X4tIty+fqRI+m6xngZY9c=;
        b=tEjq7qIhptQCeAGipz7cbq7v6jUA4FBkxPRocO2cax8MUF6dZ5bAKVM7xbZFnoL+qw
         KuTCuQ1x6y+NrFeTUfB/O2KhJhdkFru2wU9ZwqN8IW8BKbbb0JhwbUnXWtlMGcWBXKQD
         8Zrr6GMJK3qqHJAORfglbsjn648b5mfJ/AmrH2Cm8DCd11vKshAxlJayU6kLQNRsA6Ev
         ORj/beDa8EuV7nQK1XPCqO2Q4zWmBsJfSU/vMuFs3LWsaFS81ZOFJRUfaIZxshvpij7u
         IjDc1VIezbfRdlBeSB03hdzXi0DiSYOT4JwhLHwQjtIoTzfl5YvJ3aEvveEuOAhdBnxD
         /MBA==
X-Gm-Message-State: AFqh2krjDkeC9vAkGVYsmE69IEzJOiQflNjZwa70GWbSmohL+tlm25h4
	aKqIhOCsZOgSixjkOhf/p7yxImxeT36IDgr9yPL8Mq2HfLb0WCQ/iavZsKhqdXMVBe8NFfpwjwQ
	eCV7EXKUH2sOvBsEfCKfqDc9OwaOXpQGD
X-Received: by 2002:a05:7500:5c96:b0:f0:f14:b4f6 with SMTP id fh22-20020a0575005c9600b000f00f14b4f6mr1334336gab.55.1673290935396;
        Mon, 09 Jan 2023 11:02:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvpgx9uVCbTytxfSzpNGAx1CCCprwK9dYT+w5TdWAjmS9/Yvcm6uASOc9C3qqyAspkLlpcI4w==
X-Received: by 2002:a05:7500:5c96:b0:f0:f14:b4f6 with SMTP id fh22-20020a0575005c9600b000f00f14b4f6mr1334309gab.55.1673290934985;
        Mon, 09 Jan 2023 11:02:14 -0800 (PST)
Received: from vschneid.remote.csb ([154.57.232.159])
        by smtp.gmail.com with ESMTPSA id az31-20020a05620a171f00b006fbbdc6c68fsm5795671qkb.68.2023.01.09.11.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 11:02:14 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, Steven Rostedt
 <rostedt@goodmis.org>, "Paul E. McKenney" <paulmck@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Juri Lelli
 <juri.lelli@redhat.com>, Daniel Bristot de Oliveira <bristot@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Frederic Weisbecker
 <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter
 Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Nicholas
 Piggin <npiggin@gmail.com>, Guo Ren <guoren@kernel.org>, "David S. Miller"
 <davem@davemloft.net>
Subject: Re: [PATCH v3 3/8] sched, smp: Trace IPIs sent via
 send_call_function_single_ipi()
In-Reply-To: <Y7lRz7oCaAmAhoqS@gmail.com>
References: <20221202155817.2102944-1-vschneid@redhat.com>
 <20221202155817.2102944-4-vschneid@redhat.com>
 <Y7lRz7oCaAmAhoqS@gmail.com>
Date: Mon, 09 Jan 2023 19:02:08 +0000
Message-ID: <xhsmh4jszedlb.mognet@vschneid.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_110218_217604_0827CEDE 
X-CRM114-Status: GOOD (  19.12  )
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

On 07/01/23 12:04, Ingo Molnar wrote:
> * Valentin Schneider <vschneid@redhat.com> wrote:
>
>> send_call_function_single_ipi() is the thing that sends IPIs at the bottom
>> of smp_call_function*() via either generic_exec_single() or
>> smp_call_function_many_cond(). Give it an IPI-related tracepoint.
>> 
>> Note that this ends up tracing any IPI sent via __smp_call_single_queue(),
>> which covers __ttwu_queue_wakelist() and irq_work_queue_on() "for free".
>> 
>> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
>> Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
>
> Acked-by: Ingo Molnar <mingo@kernel.org>
>
> Patch series logistics:
>
>  - No objections from the scheduler side, this feature looks pretty useful.
>

Thanks!

>  - Certain patches are incomplete, others are noted as being merged 
>    separately, so I presume you'll send an updated/completed series 
>    eventually?
>

The first patch from Steve is now in, so can drop it.

The other patches are complete, though I need to rebase them and regenerate
the treewide patch to catch any changes that came with 6.2. I'll do that
this week.

The "incompleteness" pointed out in the cover letter is about the types of
IPIs that can be traced. This series covers the ones that end up invoking
some core code (coincidentally those are the most common ones), others such
as e.g. tick_broadcast() for arm, arm64, riscv and hexagon remain
unaffected.

I'm not that much interested in these (other than maybe the tick broadcast
one they are all fairly unfrequent), but I'm happy to have a shot at them
for the sake of completeness - either in that series or in a followup, up
to you.  

>  - We can merge this via the scheduler tree I suspect, as most callbacks 
>    affected relate to tip:sched/core and tmp:smp/core - but if you have 
>    some other preferred tree that's fine too.
>

Either sound good to me.

> Thanks,
>
> 	Ingo


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
