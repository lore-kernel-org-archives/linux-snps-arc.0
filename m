Return-Path: <SRS0=Kv/D=C4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170BEC43464
	for <linux-snps-arc@archiver.kernel.org>; Sat, 19 Sep 2020 10:38:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C076220866
	for <linux-snps-arc@archiver.kernel.org>; Sat, 19 Sep 2020 10:38:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X3iSgsNp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="MhdAd/ZH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C076220866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eKwNo8kxbzahn9fi4j90EJOC/O31MZRk+Q0scgWYsBc=; b=X3iSgsNpz/9pqtKq8qF4v+Og/
	fuRNX6lwJnxSaTGTJptThbCLvxfB2NcAh0ZYzbdy0ysNnZEOWkimtKIpkfp68fq4blBTv3glhkZKw
	lkS3vkEGmc5zVZcWSiIQxoqVqV/cUhJt4TeUsPaajOudusPHdxx1WHWOg+v26Z28OhrPfxBImqlXl
	8JB4FrhmDprHrQA8MGZ2IZG5rVBniKFJ3COgUblJ6mMdWjk3GQNOakRm42IA7r0M1Yj0HaVC2RCKR
	anEqD+cCRrnLe94EXcN4coBjdZ8Q9O+yHlorcMDwfPz6hyShnkMVohOzM7oKmZoZbSw1wP47ODIA1
	gMv9MOcOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJaFy-0001K6-2F; Sat, 19 Sep 2020 10:38:14 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJaFp-0001Ga-US
 for linux-snps-arc@lists.infradead.org; Sat, 19 Sep 2020 10:38:09 +0000
Received: by mail-ot1-x341.google.com with SMTP id o6so7855163ota.2
 for <linux-snps-arc@lists.infradead.org>; Sat, 19 Sep 2020 03:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4qBMELpxnMWeh+ygY0m7dFfIjeObvSXUbCfgU+81OoU=;
 b=MhdAd/ZHaFK/DWpIGeCJTSrL4TspZA8urGXmqj7eu+tNyozMPj8lsNoIYGKFEkHH3i
 tz5kIr/iJffDO0Nt2pDPL1zyk3OacLo0mtMS/oIiThW5ZZklv3HS4ydmHDNHz/bb5JWz
 njvA7YA9+16uPDZnqoPhv6tTBSjVAYTx0v+gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4qBMELpxnMWeh+ygY0m7dFfIjeObvSXUbCfgU+81OoU=;
 b=Cc3Ir4KQ8y1H2FJeCwrRE2B8zCRY6u1lvDnJhz8yk4oEAcPRpC577/x541ycL1on60
 mV0az1TYmeMN2bRrsVUTflIO4jOnza6GTyUKrUkLbbw1cooBHk4YZfDJyJqu9uT+MqTr
 WODoXuK9xLFNKO02bX6k+FNE3HdWys716Tv7kToQKExJUh/XPM7c7oRBDLDCF+f5wMvf
 i5Nk66iNrt+CFS7NJntLdOf8L/Oo3vXTKGkdmorClJSg2KlTgJlQkT+oOhUrLR9EGDHH
 3/YuSY7HjCsbW8gMwbnRMfvYRhnaFZU9rWbAGC5NU6je6coMzcjbknhAS42CWFhdwwVa
 KFFQ==
X-Gm-Message-State: AOAM531VfWZs8eugMogV2/sdLnp77HDJzGRGaXDtIL/7Hvg+a4GMbw1W
 hgZBYfNDJVn2MX414qiHLDM1qYg1VTb3N5aBini5XQ==
X-Google-Smtp-Source: ABdhPJx5xVWJo6i2zNxAj54jCqUfintQtxPDT+BaBMGgav4MX+Ax0tqlV2axmkJLRRkUUHGKVrFmThuU1Fd1j9Iveeo=
X-Received: by 2002:a05:6830:14d9:: with SMTP id
 t25mr27032226otq.188.1600511884193; 
 Sat, 19 Sep 2020 03:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200919091751.011116649@linutronix.de>
 <CAKMK7uHTVJL2jGtCg61zG=myiF1BSk+yDdRYikcm-Mq_1TQWMQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHTVJL2jGtCg61zG=myiF1BSk+yDdRYikcm-Mq_1TQWMQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 19 Sep 2020 12:37:53 +0200
Message-ID: <CAKMK7uENFDANQKebS_H0bhHeQRijrp1aVHQqyZPute3KBZ+fVQ@mail.gmail.com>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_063806_052788_7EB68399 
X-CRM114-Status: GOOD (  32.12  )
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 "open list:GENERIC INCLUDE/A..." <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, X86 ML <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 arcml <linux-snps-arc@lists.infradead.org>, linux-xtensa@linux-xtensa.org,
 Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sat, Sep 19, 2020 at 12:35 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sat, Sep 19, 2020 at 11:50 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> >
> > First of all, sorry for the horribly big Cc list!
> >
> > Following up to the discussion in:
> >
> >   https://lore.kernel.org/r/20200914204209.256266093@linutronix.de
> >
> > this provides a preemptible variant of kmap_atomic & related
> > interfaces. This is achieved by:
> >
> >  - Consolidating all kmap atomic implementations in generic code
> >
> >  - Switching from per CPU storage of the kmap index to a per task storage
> >
> >  - Adding a pteval array to the per task storage which contains the ptevals
> >    of the currently active temporary kmaps
> >
> >  - Adding context switch code which checks whether the outgoing or the
> >    incoming task has active temporary kmaps. If so, the outgoing task's
> >    kmaps are removed and the incoming task's kmaps are restored.
> >
> >  - Adding new interfaces k[un]map_temporary*() which are not disabling
> >    preemption and can be called from any context (except NMI).
> >
> >    Contrary to kmap() which provides preemptible and "persistant" mappings,
> >    these interfaces are meant to replace the temporary mappings provided by
> >    kmap_atomic*() today.
> >
> > This allows to get rid of conditional mapping choices and allows to have
> > preemptible short term mappings on 64bit which are today enforced to be
> > non-preemptible due to the highmem constraints. It clearly puts overhead on
> > the highmem users, but highmem is slow anyway.
> >
> > This is not a wholesale conversion which makes kmap_atomic magically
> > preemptible because there might be usage sites which rely on the implicit
> > preempt disable. So this needs to be done on a case by case basis and the
> > call sites converted to kmap_temporary.
> >
> > Note, that this is only lightly tested on X86 and completely untested on
> > all other architectures.
> >
> > The lot is also available from
> >
> >    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git highmem
>
> I think it should be the case, but I want to double check: Will
> copy_*_user be allowed within a kmap_temporary section? This would
> allow us to ditch an absolute pile of slowpaths.

(coffee just kicked in) copy_*_user is ofc allowed, but if you hit a
page fault you get a short read/write. This looks like it would remove
the need to handle these in a slowpath, since page faults can now be
served in this new kmap_temporary sections. But this sounds too good
to be true, so I'm wondering what I'm missing.
-Daniel
>
> >
> > Thanks,
> >
> >         tglx
> > ---
> >  a/arch/arm/mm/highmem.c               |  121 ---------------------
> >  a/arch/microblaze/mm/highmem.c        |   78 -------------
> >  a/arch/nds32/mm/highmem.c             |   48 --------
> >  a/arch/powerpc/mm/highmem.c           |   67 -----------
> >  a/arch/sparc/mm/highmem.c             |  115 --------------------
> >  arch/arc/Kconfig                      |    1
> >  arch/arc/include/asm/highmem.h        |    8 +
> >  arch/arc/mm/highmem.c                 |   44 -------
> >  arch/arm/Kconfig                      |    1
> >  arch/arm/include/asm/highmem.h        |   30 +++--
> >  arch/arm/mm/Makefile                  |    1
> >  arch/csky/Kconfig                     |    1
> >  arch/csky/include/asm/highmem.h       |    4
> >  arch/csky/mm/highmem.c                |   75 -------------
> >  arch/microblaze/Kconfig               |    1
> >  arch/microblaze/include/asm/highmem.h |    6 -
> >  arch/microblaze/mm/Makefile           |    1
> >  arch/microblaze/mm/init.c             |    6 -
> >  arch/mips/Kconfig                     |    1
> >  arch/mips/include/asm/highmem.h       |    4
> >  arch/mips/mm/highmem.c                |   77 -------------
> >  arch/mips/mm/init.c                   |    3
> >  arch/nds32/Kconfig.cpu                |    1
> >  arch/nds32/include/asm/highmem.h      |   21 ++-
> >  arch/nds32/mm/Makefile                |    1
> >  arch/powerpc/Kconfig                  |    1
> >  arch/powerpc/include/asm/highmem.h    |    6 -
> >  arch/powerpc/mm/Makefile              |    1
> >  arch/powerpc/mm/mem.c                 |    7 -
> >  arch/sparc/Kconfig                    |    1
> >  arch/sparc/include/asm/highmem.h      |    7 -
> >  arch/sparc/mm/Makefile                |    3
> >  arch/sparc/mm/srmmu.c                 |    2
> >  arch/x86/include/asm/fixmap.h         |    1
> >  arch/x86/include/asm/highmem.h        |   12 +-
> >  arch/x86/include/asm/iomap.h          |   29 +++--
> >  arch/x86/mm/highmem_32.c              |   59 ----------
> >  arch/x86/mm/init_32.c                 |   15 --
> >  arch/x86/mm/iomap_32.c                |   57 ----------
> >  arch/xtensa/Kconfig                   |    1
> >  arch/xtensa/include/asm/highmem.h     |    9 +
> >  arch/xtensa/mm/highmem.c              |   44 -------
> >  b/arch/x86/Kconfig                    |    3
> >  include/linux/highmem.h               |  141 +++++++++++++++---------
> >  include/linux/io-mapping.h            |    2
> >  include/linux/sched.h                 |    9 +
> >  kernel/sched/core.c                   |   10 +
> >  mm/Kconfig                            |    3
> >  mm/highmem.c                          |  192 ++++++++++++++++++++++++++++++++--
> >  49 files changed, 422 insertions(+), 909 deletions(-)
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
