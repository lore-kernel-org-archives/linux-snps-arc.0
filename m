Return-Path: <SRS0=Kv/D=C4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD8FEC43464
	for <linux-snps-arc@archiver.kernel.org>; Sat, 19 Sep 2020 10:35:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 569BD20866
	for <linux-snps-arc@archiver.kernel.org>; Sat, 19 Sep 2020 10:35:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0mDDs065";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="EVzELTGq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 569BD20866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d0opv1w3gfzxkF2zAm2dR004j/iHrd/C9JWG7e2MLPE=; b=0mDDs065cpdL56geEzPzN6R7Q
	HvXih2A9uZYeKK8QGwZUo+FzCIgwdDhWtDM/qojIT7XNiD0V5POa4seCJPvc1SvzKMnaGtOR+8ea+
	Jb9Ww4K2+ZCwFkGxPzA2dFdH2bawv/dyo2m9AyWh3JLlxeg1F6prHkI+Ci+YTmhhaSyb/iYFKXEyg
	B8S/u5q+IMIaxpsNZTa3GgNGjAImRjEDdnerszxoH/S/DffD0ecQbWDerD1N4Plothc8wu1Cz9YeY
	3wX9XyAlPGtMEDHEhwKvZ/XgQZ2Y7LlGCRI7cdrgYxs8E55M1ky2awMjU/bdqEyiUlYW9O2ANF50n
	5C5qvMUwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJaDM-0000xN-NW; Sat, 19 Sep 2020 10:35:32 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJaDK-0000vG-Bj
 for linux-snps-arc@lists.infradead.org; Sat, 19 Sep 2020 10:35:31 +0000
Received: by mail-ot1-x343.google.com with SMTP id 95so556670ota.13
 for <linux-snps-arc@lists.infradead.org>; Sat, 19 Sep 2020 03:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=el+Z1rLUwIg0Lo19W7bciojCg78mYjD/sa8mCUQGhXg=;
 b=EVzELTGqNpOCv+xxoHTDIB+JfH6R+bJea1X1ICZfYUUSwyVqtWZK8FGT/+012CWynI
 JZJ90/eXttC7sXGHMV6vVDJiFkkgzC9M1+Jr+djbqhC9yIsLWNmlmHNtqfOJm783H4QN
 20i+/s03YOHbsQdMI48ii5Hoj/X8m7lQJqJ4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=el+Z1rLUwIg0Lo19W7bciojCg78mYjD/sa8mCUQGhXg=;
 b=foefeQKcXymxlubjqM3za5Tzg7ACSqb4+EJx3BCT+hAXigat0/VewXsvRr1jc858nb
 puRLXBEcZacOSyRjFUsv+4oMZR4JsVp4US/tqO/tF1i2wI4gAB8OexUzTG1EKCh2BwOd
 usQ4AGihwyjBWkYgPGS0sV+wtIaI+lHvjQCXzuJfvD9Kx5mIxJbP+AClOn6dgNVXXSyR
 DLMD7FkUag6xl2J6JiZnZ82txUyMtws9b+Vm0oeZEjuKsyQ/pcWFPtmqMvkMaeGPEn54
 S8c5SH1dwcKkrGVqrm1+kZLSJnYEAsUngAFajbu9X7YP/TWYtmRzEhz5dg8Jm3OYizGC
 9wcg==
X-Gm-Message-State: AOAM533JgyQKsherXVkA60z+00L0UPeIFDBcdRGUH6y5Ll+usVsRMAIV
 3r20pvrV+2EZpicLjhbo4noCSo2lZDii89Y0WmFFjw==
X-Google-Smtp-Source: ABdhPJxt+kM+c4sGqm0VngBIRvBEF3eOuAoLdZF9ShbveHjPXujfxmRvD8dORjLp/h2eldKD21rGXbvHdOMaT6H1ALo=
X-Received: by 2002:a05:6830:1e56:: with SMTP id
 e22mr24822187otj.303.1600511726492; 
 Sat, 19 Sep 2020 03:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200919091751.011116649@linutronix.de>
In-Reply-To: <20200919091751.011116649@linutronix.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 19 Sep 2020 12:35:15 +0200
Message-ID: <CAKMK7uHTVJL2jGtCg61zG=myiF1BSk+yDdRYikcm-Mq_1TQWMQ@mail.gmail.com>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_063530_444657_EB55EFC2 
X-CRM114-Status: GOOD (  27.18  )
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

On Sat, Sep 19, 2020 at 11:50 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> First of all, sorry for the horribly big Cc list!
>
> Following up to the discussion in:
>
>   https://lore.kernel.org/r/20200914204209.256266093@linutronix.de
>
> this provides a preemptible variant of kmap_atomic & related
> interfaces. This is achieved by:
>
>  - Consolidating all kmap atomic implementations in generic code
>
>  - Switching from per CPU storage of the kmap index to a per task storage
>
>  - Adding a pteval array to the per task storage which contains the ptevals
>    of the currently active temporary kmaps
>
>  - Adding context switch code which checks whether the outgoing or the
>    incoming task has active temporary kmaps. If so, the outgoing task's
>    kmaps are removed and the incoming task's kmaps are restored.
>
>  - Adding new interfaces k[un]map_temporary*() which are not disabling
>    preemption and can be called from any context (except NMI).
>
>    Contrary to kmap() which provides preemptible and "persistant" mappings,
>    these interfaces are meant to replace the temporary mappings provided by
>    kmap_atomic*() today.
>
> This allows to get rid of conditional mapping choices and allows to have
> preemptible short term mappings on 64bit which are today enforced to be
> non-preemptible due to the highmem constraints. It clearly puts overhead on
> the highmem users, but highmem is slow anyway.
>
> This is not a wholesale conversion which makes kmap_atomic magically
> preemptible because there might be usage sites which rely on the implicit
> preempt disable. So this needs to be done on a case by case basis and the
> call sites converted to kmap_temporary.
>
> Note, that this is only lightly tested on X86 and completely untested on
> all other architectures.
>
> The lot is also available from
>
>    git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git highmem

I think it should be the case, but I want to double check: Will
copy_*_user be allowed within a kmap_temporary section? This would
allow us to ditch an absolute pile of slowpaths.
-Daniel

>
> Thanks,
>
>         tglx
> ---
>  a/arch/arm/mm/highmem.c               |  121 ---------------------
>  a/arch/microblaze/mm/highmem.c        |   78 -------------
>  a/arch/nds32/mm/highmem.c             |   48 --------
>  a/arch/powerpc/mm/highmem.c           |   67 -----------
>  a/arch/sparc/mm/highmem.c             |  115 --------------------
>  arch/arc/Kconfig                      |    1
>  arch/arc/include/asm/highmem.h        |    8 +
>  arch/arc/mm/highmem.c                 |   44 -------
>  arch/arm/Kconfig                      |    1
>  arch/arm/include/asm/highmem.h        |   30 +++--
>  arch/arm/mm/Makefile                  |    1
>  arch/csky/Kconfig                     |    1
>  arch/csky/include/asm/highmem.h       |    4
>  arch/csky/mm/highmem.c                |   75 -------------
>  arch/microblaze/Kconfig               |    1
>  arch/microblaze/include/asm/highmem.h |    6 -
>  arch/microblaze/mm/Makefile           |    1
>  arch/microblaze/mm/init.c             |    6 -
>  arch/mips/Kconfig                     |    1
>  arch/mips/include/asm/highmem.h       |    4
>  arch/mips/mm/highmem.c                |   77 -------------
>  arch/mips/mm/init.c                   |    3
>  arch/nds32/Kconfig.cpu                |    1
>  arch/nds32/include/asm/highmem.h      |   21 ++-
>  arch/nds32/mm/Makefile                |    1
>  arch/powerpc/Kconfig                  |    1
>  arch/powerpc/include/asm/highmem.h    |    6 -
>  arch/powerpc/mm/Makefile              |    1
>  arch/powerpc/mm/mem.c                 |    7 -
>  arch/sparc/Kconfig                    |    1
>  arch/sparc/include/asm/highmem.h      |    7 -
>  arch/sparc/mm/Makefile                |    3
>  arch/sparc/mm/srmmu.c                 |    2
>  arch/x86/include/asm/fixmap.h         |    1
>  arch/x86/include/asm/highmem.h        |   12 +-
>  arch/x86/include/asm/iomap.h          |   29 +++--
>  arch/x86/mm/highmem_32.c              |   59 ----------
>  arch/x86/mm/init_32.c                 |   15 --
>  arch/x86/mm/iomap_32.c                |   57 ----------
>  arch/xtensa/Kconfig                   |    1
>  arch/xtensa/include/asm/highmem.h     |    9 +
>  arch/xtensa/mm/highmem.c              |   44 -------
>  b/arch/x86/Kconfig                    |    3
>  include/linux/highmem.h               |  141 +++++++++++++++---------
>  include/linux/io-mapping.h            |    2
>  include/linux/sched.h                 |    9 +
>  kernel/sched/core.c                   |   10 +
>  mm/Kconfig                            |    3
>  mm/highmem.c                          |  192 ++++++++++++++++++++++++++++++++--
>  49 files changed, 422 insertions(+), 909 deletions(-)



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
