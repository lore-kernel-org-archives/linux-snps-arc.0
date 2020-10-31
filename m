Return-Path: <SRS0=SiYH=EG=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D34C388F7
	for <linux-snps-arc@archiver.kernel.org>; Sat, 31 Oct 2020 13:37:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 282A2206DC
	for <linux-snps-arc@archiver.kernel.org>; Sat, 31 Oct 2020 13:37:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nRrtt5ui";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RM6gL96U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 282A2206DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ng1V8DB90dpXH+kj9zse5DYcmFrlRAGEIClkesx6Zyc=; b=nRrtt5uiGMVttuPXjNWuzFgQO
	wbFgqHE6x2dPi4Q/uo6ixWD9khKPyIRNgPVBRQs+PqLFHbY8GdeSdnXRSOOeVcJ9eMi+TrmFJFIcP
	v9eeCgHzbWlF4wIr5n5pP5waO8c+2Myhx3NmmfRhRZTPhl+zXvLYweyEVb1K8/zo6IQ1WZdLh6hw8
	ymtMzaWgNl5BJYDpm9DlpWhP9CzaxkvULOcW+tfcngsMkbDg/pKnWspymxMTlCe3Qg2Wmlv2Cbp7l
	kZpjo+ph+HObuAL5BgWHlKG8hM81YA6MsrsYCD/s4ok3xZGgyniy7E/hsmYNpcjMP2RcWTqxqmx4X
	ay30Y501w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYr4P-0006Hi-EP; Sat, 31 Oct 2020 13:37:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYr4J-0006Fr-UU; Sat, 31 Oct 2020 13:37:21 +0000
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 368FE206DC;
 Sat, 31 Oct 2020 13:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604151438;
 bh=KsL4BllLtOAiumSXMCBq8rYe7s/DE2jdXN/dD3vutNo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RM6gL96UmqjkPB4vFSwKs67HSErS+vAyVlD8S4mG0PHI5hhzZE3leS9Nv9mggOPyX
 JXfK4y19g8PIIgLubo74FqId8jx+SP7BzrEHKZgRWm3FHX/JgHSLcPcTGK3GXcFWqE
 hcK5huelhR7bwU7gFe0tIJwmuL8OYH248yBzDLsI=
Received: by mail-qt1-f181.google.com with SMTP id r8so6138986qtp.13;
 Sat, 31 Oct 2020 06:37:18 -0700 (PDT)
X-Gm-Message-State: AOAM530rz78a1OIiikwaYpJL5tuVpJK71yUOkFO7nZU6tBQvfmLxd60b
 6PojUOKP3+MmMxeqz57sKlUMsUnFNXJIquuvt54=
X-Google-Smtp-Source: ABdhPJy91qWaVGms2GdzKOjDu6QuHL3ODS3nIJ7TUoaG3D14vcIMVYFpi2taO5I7gplDF7nHf39t19dhIbjX1TCVhrs=
X-Received: by 2002:ac8:6c25:: with SMTP id k5mr1254491qtu.142.1604151437406; 
 Sat, 31 Oct 2020 06:37:17 -0700 (PDT)
MIME-Version: 1.0
References: <20201029221806.189523375@linutronix.de>
 <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
 <87pn50ob0s.fsf@nanos.tec.linutronix.de>
 <87blgknjcw.fsf@nanos.tec.linutronix.de>
 <CAHk-=whsJv0bwWRVZHsLoSe48ykAea6T7Oi=G+r8ckLrZ0YUpg@mail.gmail.com>
 <87sg9vl59i.fsf@nanos.tec.linutronix.de>
 <CAHk-=wjjO9BtTUAsLraqZqdzaPGJ-qvubZfwUsmRUX896eHcGw@mail.gmail.com>
In-Reply-To: <CAHk-=wjjO9BtTUAsLraqZqdzaPGJ-qvubZfwUsmRUX896eHcGw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sat, 31 Oct 2020 14:37:01 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3FyKTHDSAPCyP8e7UA0LN3OvAatNK_vQ3tnBsdbou4sA@mail.gmail.com>
Message-ID: <CAK8P3a3FyKTHDSAPCyP8e7UA0LN3OvAatNK_vQ3tnBsdbou4sA@mail.gmail.com>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic &
 friends
To: Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201031_093720_282156_922976B7 
X-CRM114-Status: GOOD (  28.81  )
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
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Ben Segall <bsegall@google.com>, Linux-MM <linux-mm@kvack.org>,
 Guo Ren <guoren@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 linux-sparc <sparclinux@vger.kernel.org>, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
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
 Thomas Gleixner <tglx@linutronix.de>,
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

On Fri, Oct 30, 2020 at 11:46 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Oct 30, 2020 at 3:26 PM Thomas Gleixner <tglx@linutronix.de> wrote:
> >
> > While at it I might have a look at that debug request from Willy in the
> > other end of this thread. Any comment on that?
> >
> >  https://lore.kernel.org/r/87k0v7mrrd.fsf@nanos.tec.linutronix.de
>
> I do think that it would be nice to have a debug mode, particularly
> since over the last few years we've really lost a lot of HIGHMEM
> coverage (to the point that I've wondered how worthwhile it really is
> to support at all any more - I think it's Arnd who argued that it's
> mainly some embedded ARM variants that will want it for the forseeable
> future).
>
> So I'm honestly somewhat torn. I think HIGHMEM is dying, and yes that
> argues for "non-HIGHMEM had better have some debug coverage", but at
> the same time I think it doesn't even really matter any more.

Shifting the testing of highmem code to the actual users of highmem
sounds reasonable to me. This means it will get broken more often,
but if it doesn't happen all the time, it might serve as a canary:
once a bug survives for long enough, we have a good indication that
users stopped caring ;-)

> At some
> point those embedded ARM platforms just aren't even interesting - they
> might as well use older kernels if they are the only thing really
> arguing for HIGHMEM at all.

Agreed, but it does need a little time to get there. My best guess is three
to five years from now we can remove it for good, provided a few things
happen first:

1. The remaining users of TI Keystone2, NXP i.MX6 Quad(Plus) and
  Renesas R8A7790/R8A7791/R8A7742/R8A7743 that use the
  largest memory configuration must have stopped requiring kernel
  version updates.
  These were all introduced at the peak of 32-bit Arm embedded
  systems around 2013, but they have long (15+ year) product
  life cycles and users pick these because they do promise kernel
  updates, unlike other SoC families that get stuck on old vendor
  kernels much earlier.

2. The plan to add a CONFIG_VMSPLIT_4G_4G option on arch/arm/
  must work out. We don't have all the code yet, and so far it looks
  like it's going to be a bit ugly and a bit slow but not nearly as ugly
  or slow as it was on x86 20 years ago.
  This would cover Cortex-A7/A15 systems from 2GB to 4GB,
  which are still fairly common and need to keep using mainline
  kernels for much longer than the system in point 1.
  It won't help on Cortex-A9 machines with 2GB, which I hope can
  migrate CONFIG_VMSPLIT_2G_OPT as a fallback.

3. No new systems with larger memory must appear. I noticed that
  e.g. the newly introduced Rockchips RV1109 and Allwinner
  A50/R328/V316 support LP-DDR4 on a dual Cortex-A7, but I
  hope that nobody will in practice combine a $2 SoC with a $15
  memory chip.
  Most other 32-bit chips use DDR3, which tends to prohibit
  configurations over 4GB in new designs, with the cheapest
  ones limited to 512MB (a single 256Mx16 chip) and the
  high end having already moved on to 64 bit.

Regarding 32-bit non-Arm systems, support for the MIPS-based
Baikal T1 was merged earlier this year and is used in Russian
PC style systems with up to 8GB.
There are also some users on 10+ year old 32-bit netbooks or
business laptops, both x86 and Apple G4.
The longest-lived 32-bit embedded systems with large memory
(other than Arm) are probably NXP QorIQ P20xx/P40xx used in
military VME bus systems, and low-end embedded systems based
on Vortex86.
I'm less worried about all of these because upstream kernel
support for ppc32 and x86-32 is already bitrotting and they will
likely get stuck on the last working kernel before the
TI/Renesas/NXP Arm systems do.

       Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
