Return-Path: <SRS0=3YnE=EE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2A9C4741F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Oct 2020 23:11:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C1A42076E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Oct 2020 23:11:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nc3hCaQW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SyS4Sffx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C1A42076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C4gfc/2g1YmO64/MRCvQXUhiPGmNR4aJrGAsF5lm3+s=; b=Nc3hCaQWgqjVfqXX6rlvHKk3B
	EgYzbT+N2vyGh2PmxGGyxalv03yMy+dZpMBK5D2gFnaoDRIBhsTgwfk7INz8kbyBL9ek4Cd3xEEyu
	CywXPGmZHxhzV5KjnKrtxy0ePsRZeDHxXLiP3EjBSBNo6VFeDQfXmnGYBmsQxG7EEWO5s6pLaMI4O
	IPLDYB3ABDc5nXyVtBOfbb45qz4fun6XutNPSvTRR9Ws0wAULXTaxGsmskI6iJ1cbSdSmb8zZEW6C
	aXiS19IqB345lergbSxmyNP7mvv7QxLh4nqTDKlAsHL9duc8+wCYRHzjtYLxKzRV/zVFFToD7ab1F
	S7GBJVYyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYH50-0005F3-Rl; Thu, 29 Oct 2020 23:11:38 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYH4y-0005EK-HV
 for linux-snps-arc@lists.infradead.org; Thu, 29 Oct 2020 23:11:37 +0000
Received: by mail-lf1-x142.google.com with SMTP id a7so5460112lfk.9
 for <linux-snps-arc@lists.infradead.org>; Thu, 29 Oct 2020 16:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OAaBl/U7PBG+TlUp0N4qfJ0eDW1D/8YEA2bXCC674us=;
 b=SyS4SffxYsNmj61H9VhYyfV30AKVcQI02I05R1QJ0WmBmFSO+bnQWo+8WU1Xmtdngw
 /WCUakc82ksJGHGKm7uLpuzRi56V0rh71ThvreQzsj4AGwhIaWOkntvIB7PKONmne7aI
 RS+5JSoq7Rynp7XqZeCI4Lh5y/aQJhenniqh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OAaBl/U7PBG+TlUp0N4qfJ0eDW1D/8YEA2bXCC674us=;
 b=OwWgf6pcofNWc85aQDa3NPvGd38ikEQuxnYq2ps+PoOs+N5dEbVJND4YmHPEEZjNXw
 NfRYzzIcvmwXVh1zlIwV+X1iHzjW+aFaBKdhj+H/JK6mk6aWUePsA4kn9aUqGMv0nzfp
 +32FbsB/hm9vk2U8DJCXbcJaOpWH+JXVGxeQHd/hJjFKBjlBkYfMFkZccnA0uz/qTOVA
 fExSHxxe+1CCV9w7viB05Nx888NimTpk1lDpnwV7N2lAtSQgcfEV/X3kuXpyd1KqDRAB
 BZ+HTXvuRBKUaUKWfuXOVK4pA/SzCRxy796wOIA0VfXG9L+hGp7L1HHGdP/Uxmh6bFaG
 rEGA==
X-Gm-Message-State: AOAM5308tPm7seYLRf3n9wxIwXsLx3ZuMy2iOhvZF+Sq8FHfgH85yX6g
 s4hU4DVKEXP6yeUPYhJpdVB25qTUxzbGpw==
X-Google-Smtp-Source: ABdhPJwrRGapbPoAM7XkGVu4nTJERHjrq/4p3BeVLxsdWWpS/uXCJJzZ8TNH0RmGfZxsYW0CHT6pkA==
X-Received: by 2002:a19:f518:: with SMTP id j24mr2341860lfb.307.1604013094612; 
 Thu, 29 Oct 2020 16:11:34 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com.
 [209.85.208.169])
 by smtp.gmail.com with ESMTPSA id l25sm424757lfc.152.2020.10.29.16.11.29
 for <linux-snps-arc@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 16:11:33 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id i2so4939935ljg.4
 for <linux-snps-arc@lists.infradead.org>; Thu, 29 Oct 2020 16:11:29 -0700 (PDT)
X-Received: by 2002:a2e:8815:: with SMTP id x21mr3018764ljh.312.1604013088281; 
 Thu, 29 Oct 2020 16:11:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201029221806.189523375@linutronix.de>
In-Reply-To: <20201029221806.189523375@linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 29 Oct 2020 16:11:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
Message-ID: <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic &
 friends
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_191136_719222_55CFA750 
X-CRM114-Status: GOOD (  14.74  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-xtensa@linux-xtensa.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, Linux-MM <linux-mm@kvack.org>,
 Guo Ren <guoren@kernel.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Vincent Chen <deanbo422@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, David Airlie <airlied@linux.ie>,
 Mel Gorman <mgorman@suse.de>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Ard Biesheuvel <ardb@kernel.org>, Paul McKenney <paulmck@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>, Greentime Hu <green.hu@gmail.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, Oct 29, 2020 at 3:32 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
>
> Though I wanted to share the current state of affairs before investigating
> that further. If there is consensus in going forward with this, I'll have a
> deeper look into this issue.

Me likee. I think this looks like the right thing to do.

I didn't actually apply the patches, but just from reading them it
_looks_ to me like you do the migrate_disable() unconditionally, even
if it's not a highmem page..

That sounds like it might be a good thing for debugging, but not
necessarily great in general.

Or am I misreading things?

                Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
