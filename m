Return-Path: <SRS0=SiYH=EG=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D6EBC5517A
	for <linux-snps-arc@archiver.kernel.org>; Sat, 31 Oct 2020 21:33:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 168E4206ED
	for <linux-snps-arc@archiver.kernel.org>; Sat, 31 Oct 2020 21:33:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SdsuYPq1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmxLv/JX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 168E4206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Sr7nAqLbprDlfiOFZYwqKDozOa7db+Ok9PS81xjY+7c=; b=SdsuYPq1IvcFeAj0ZJvk/8GuK
	iyjvOolaLg/6ihmpcXXUBU59rWsloLz41Tz7kktjswsyTjfDLqQIufw92NaFPcz2HiqA5lVGXRWAe
	zX9PxW1Pv8axTui/gzkWPZ1RTajiIotu7pWW8KO9XdCEeBqb22DN1gLaZF55fmr94xWOfQqTQP9Ho
	4iXQIi0Q4FMKG6f+kiKjqmEWv3RCnCbmQ3WuHxhy22TR/L+aXuU0eH8WxQpWJ5esojC5Z++oUeAmx
	Hq+gJN9GCHIFMvQlTiGq9mGi6AdsGGe9WLGucvQa/05Vgs0avBRaLxaN0kICPLFyErCFSAbyuFN4B
	IDEQBB0SQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYyVZ-0005S7-Ad; Sat, 31 Oct 2020 21:33:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYyVU-0005QQ-Nw; Sat, 31 Oct 2020 21:33:53 +0000
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE4012087D;
 Sat, 31 Oct 2020 21:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604180031;
 bh=a949fi3JWCiOsIfB/oXLlGSJaTnnNYCIyox+iEaG/3k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FmxLv/JX6BAYBbl58Wkol2prTj8sKl9cvxus7OmDo+6URnNTLmGqZ06GE9zo4BHaB
 iXhqDXTppGvvGbmmfODkn8e10A9CmYm2o8DPHq6nDPdkB1ghH/QP2hswGJSP45Izjn
 hBxXJsrdmGoAujywpsoLUpU9+3792RN4eIWY5h0o=
Received: by mail-qt1-f176.google.com with SMTP id c5so6767080qtw.3;
 Sat, 31 Oct 2020 14:33:50 -0700 (PDT)
X-Gm-Message-State: AOAM531D5rEHR2lLIK8S2jWpS8SReU5PgaPMIirbY2XP1tQgO2sPtzdz
 Oo7mdH8Rlw8Nu7IOkWQUP8cYvDfgMP+aIpsnjqs=
X-Google-Smtp-Source: ABdhPJyD/4AcE03j7HIaN207+kO4IYyQ0WkWkrWDUSbNUToIdPZlRv7YWwHuIabdMaXmtCngmEmV1ORQEwrjBUGk+Sk=
X-Received: by 2002:ac8:4808:: with SMTP id g8mr8036830qtq.18.1604180029997;
 Sat, 31 Oct 2020 14:33:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201029221806.189523375@linutronix.de>
 <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
 <87pn50ob0s.fsf@nanos.tec.linutronix.de>
 <87blgknjcw.fsf@nanos.tec.linutronix.de>
 <CAHk-=whsJv0bwWRVZHsLoSe48ykAea6T7Oi=G+r8ckLrZ0YUpg@mail.gmail.com>
 <87sg9vl59i.fsf@nanos.tec.linutronix.de>
 <CAHk-=wjjO9BtTUAsLraqZqdzaPGJ-qvubZfwUsmRUX896eHcGw@mail.gmail.com>
 <CAK8P3a3FyKTHDSAPCyP8e7UA0LN3OvAatNK_vQ3tnBsdbou4sA@mail.gmail.com>
 <20201031160539.Horde.n5yNbG9LoUSWqtuPQW_h3w1@messagerie.c-s.fr>
In-Reply-To: <20201031160539.Horde.n5yNbG9LoUSWqtuPQW_h3w1@messagerie.c-s.fr>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 31 Oct 2020 22:33:33 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3uY0ASRGcPi-OZdRyL_xLY81nJfu+O6z-Ovxu9YCR4dQ@mail.gmail.com>
Message-ID: <CAK8P3a3uY0ASRGcPi-OZdRyL_xLY81nJfu+O6z-Ovxu9YCR4dQ@mail.gmail.com>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic &
 friends
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_173352_914391_7F948B25 
X-CRM114-Status: GOOD (  22.46  )
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
Cc: Juri Lelli <juri.lelli@redhat.com>, David Airlie <airlied@linux.ie>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Ben Segall <bsegall@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Matthew Wilcox <willy@infradead.org>,
 linux-sparc <sparclinux@vger.kernel.org>, Vincent Chen <deanbo422@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Paul McKenney <paulmck@kernel.org>, the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Peter Zijlstra <peterz@infradead.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Mel Gorman <mgorman@suse.de>, Ingo Molnar <mingo@kernel.org>,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 Steven Rostedt <rostedt@goodmis.org>, Greentime Hu <green.hu@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sat, Oct 31, 2020 at 4:04 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> > There are also some users on 10+ year old 32-bit netbooks or
> > business laptops, both x86 and Apple G4.
> > The longest-lived 32-bit embedded systems with large memory
> > (other than Arm) are probably NXP QorIQ P20xx/P40xx used in
> > military VME bus systems, and low-end embedded systems based
> > on Vortex86.
> > I'm less worried about all of these because upstream kernel
> > support for ppc32 and x86-32 is already bitrotting and they will
> > likely get stuck on the last working kernel before the
> > TI/Renesas/NXP Arm systems do.
> >
>
> Upstream kernel support for ppc32 is bitrotting, seriously ? What do
> you mean exactly ?

I was thinking more of the platform support: out of the twelve
32-bit platforms in arch/powerpc/platforms/, your 8xx is the only
one listed as 'maintained' or 'supported' in the maintainers list,
and that seems to accurately describe the current state.

Freescale seems to have practically stopped contributing to any of
their 32-bit platforms in 2016 after the NXP acquisition and no longer
employing either of the maintainers. Similarly, Ben seems to have
stopped working on powermac in 2016, which was ten years after
the last 32-bit hardware shipped for that platform.

> ppc32 is actively supported, with recent addition of support of
> hugepages, kasan, uaccess protection, VMAP stack, etc ...

That is good to hear, I didn't know about these additions.
What platforms are people using to develop these? Is this
mainly your 8xx work, or is there ongoing development for
platforms that need highmem?

         Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
