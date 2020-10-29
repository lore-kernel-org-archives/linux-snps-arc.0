Return-Path: <SRS0=3YnE=EE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CAF5C55178
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Oct 2020 22:32:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B18112076B
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Oct 2020 22:32:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ADw/3HEM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QSHJIt7L";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bG4zbqkg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B18112076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:Message-Id:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bpli/KcKGwNeM4K0YyNBB2pxhLoRjqQFoqpqGfl8yqQ=; b=ADw/3HEMQ/gwAEi9fTbnSqCil9
	w0CfXzaVpfdJwRxEHbPJ2XJeGNHYa2L4uWH7pLCsnKApUG+dS8R4JsTwUhT4Vup+VPK2vFgJUCTwr
	nH8ob0BUuCLhtfZ3+7zuFyIWUivMv/5w/EALhI83GPCeB7C96k7PzNl3rnVvMd0Jxb1SCfp9KPowe
	HDcKJDXtsRhfZ7UQ/Fp45D1BBnKV4G0z+1O+NZ6FIQ9DkeiRq7fA7Iw0X0pH8ekPcP/8FNmsc5CzD
	/YECCo2BRzXfuAfVIKrMwU5oCAbr83vzbRo/0L0X+vGoneFIGyDxmVFnQPGdCzIZlraHtM0KWhchb
	bV0JnlgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYGT3-0004j8-JS; Thu, 29 Oct 2020 22:32:26 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYGSq-0004ax-5L; Thu, 29 Oct 2020 22:32:14 +0000
Message-Id: <20201029221806.189523375@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604010728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dHsj3bB6txbW51auQ1NY6Tbn9YUEP9hPQj+cerV4cH0=;
 b=QSHJIt7LvlxNN9hJ0pBq2tvQAj6s9PRKwf9DDs+9wLl0TB3D07XB2aNc/P+jBNvq3OKdlB
 9uImGW8KQrL2/v2DDWGmYr3ItyplTubI+62xRgbsyi4IeFKyTQeBZLSpOp/k//RoMYNU0D
 MRXq2PcsrvKw8tKj6JtpzI7I7c+m0/l1rgAB1Q7e0HTSfRHwiF/OYPDVhjJi/t5CuooKwL
 72rzQkellKlgnCIrCAJFk+1lKoYhevy2jnE7fElUwMoYj2u61NhwHpz39yR1AKfSxC9hiI
 tHhi3pMD0MqXztTmwu1jN5JS5hiXfWpnm7xNyzYqMOICUggRy8lWVYhFp7D5AA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604010728;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dHsj3bB6txbW51auQ1NY6Tbn9YUEP9hPQj+cerV4cH0=;
 b=bG4zbqkg1p92+Z0M4jQM3XbBv8SsS1VZa551XHoVYcBtO5FLMANBcd4TnLvpnuGvnhoALG
 sOxX2o7Ksc9Qt8DQ==
Date: Thu, 29 Oct 2020 23:18:06 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic &
 friends
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_183212_432479_BEBBF724 
X-CRM114-Status: GOOD (  19.61  )
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
 Ben Segall <bsegall@google.com>, linux-mm@kvack.org,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 linux-arch@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, David Airlie <airlied@linux.ie>,
 Mel Gorman <mgorman@suse.de>, linux-snps-arc@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>, Paul McKenney <paulmck@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Greentime Hu <green.hu@gmail.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Following up to the discussion in:

  https://lore.kernel.org/r/20200914204209.256266093@linutronix.de

and the initial version of this:

  https://lore.kernel.org/r/20200919091751.011116649@linutronix.de

this series provides a preemptible variant of kmap_atomic & related
interfaces.

Now that the scheduler folks have wrapped their heads around the migration
disable scheduler woes, there is not a real reason anymore to confine
migration disabling to RT.

As expressed in the earlier discussion by graphics and crypto folks, there
is interest to get rid of their kmap_atomic* usage because they need only a
temporary stable map and not all the bells and whistels of kmap_atomic*.

This series provides kmap_local.* iomap_local variants which only disable
migration to keep the virtual mapping address stable accross preemption,
but do neither disable pagefaults nor preemption. The new functions can be
used in any context, but if used in atomic context the caller has to take
care of eventually disabling pagefaults.

This is achieved by:

 - Removing the RT dependency from migrate_disable/enable()

 - Consolidating all kmap atomic implementations in generic code

 - Switching from per CPU storage of the kmap index to a per task storage

 - Adding a pteval array to the per task storage which contains the ptevals
   of the currently active temporary kmaps

 - Adding context switch code which checks whether the outgoing or the
   incoming task has active temporary kmaps. If so, the outgoing task's
   kmaps are removed and the incoming task's kmaps are restored.

 - Adding new interfaces k[un]map_temporary*() which are not disabling
   preemption and can be called from any context (except NMI).

   Contrary to kmap() which provides preemptible and "persistant" mappings,
   these interfaces are meant to replace the temporary mappings provided by
   kmap_atomic*() today.

This allows to get rid of conditional mapping choices and allows to have
preemptible short term mappings on 64bit which are today enforced to be
non-preemptible due to the highmem constraints. It clearly puts overhead on
the highmem users, but highmem is slow anyway.

This is not a wholesale conversion which makes kmap_atomic magically
preemptible because there might be usage sites which rely on the implicit
preempt disable. So this needs to be done on a case by case basis and the
call sites converted to kmap_temporary.

Note, that this is only lightly tested on X86 and completely untested on
all other architectures.

There is also a still to be investigated question from Linus on the initial
posting versus the per cpu / per task mapping stack depth which might need
to be made larger due to the ability to take page faults within a mapping
region.

Though I wanted to share the current state of affairs before investigating
that further. If there is consensus in going forward with this, I'll have a
deeper look into this issue.

The lot is available from

   git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git highmem

It is based on Peter Zijlstras migrate disable branch which is close to be
merged into the tip tree, but still not finalized:

   git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/migrate-disable

Changes vs. V1:

  - Make it truly functional by depending on migrate disable/enable (Brown paperbag)
  - Rename to kmap_local.* (Linus)
  - Fix the sched in/out issue Linus pointed out
  - Fix a few style issues (Christoph)
  - Split a few things out into seperate patches to make review simpler
  - Pick up acked/reviewed tags as appropriate

Thanks,

	tglx
---
 a/arch/arm/mm/highmem.c               |  121 ------------------
 a/arch/microblaze/mm/highmem.c        |   78 ------------
 a/arch/nds32/mm/highmem.c             |   48 -------
 a/arch/powerpc/mm/highmem.c           |   67 ----------
 a/arch/sparc/mm/highmem.c             |  115 -----------------
 arch/arc/Kconfig                      |    1 
 arch/arc/include/asm/highmem.h        |    8 +
 arch/arc/mm/highmem.c                 |   44 ------
 arch/arm/Kconfig                      |    1 
 arch/arm/include/asm/highmem.h        |   31 +++-
 arch/arm/mm/Makefile                  |    1 
 arch/csky/Kconfig                     |    1 
 arch/csky/include/asm/highmem.h       |    4 
 arch/csky/mm/highmem.c                |   75 -----------
 arch/microblaze/Kconfig               |    1 
 arch/microblaze/include/asm/highmem.h |    6 
 arch/microblaze/mm/Makefile           |    1 
 arch/microblaze/mm/init.c             |    6 
 arch/mips/Kconfig                     |    1 
 arch/mips/include/asm/highmem.h       |    4 
 arch/mips/mm/highmem.c                |   77 ------------
 arch/mips/mm/init.c                   |    3 
 arch/nds32/Kconfig.cpu                |    1 
 arch/nds32/include/asm/highmem.h      |   21 ++-
 arch/nds32/mm/Makefile                |    1 
 arch/powerpc/Kconfig                  |    1 
 arch/powerpc/include/asm/highmem.h    |    6 
 arch/powerpc/mm/Makefile              |    1 
 arch/powerpc/mm/mem.c                 |    7 -
 arch/sparc/Kconfig                    |    1 
 arch/sparc/include/asm/highmem.h      |    7 -
 arch/sparc/mm/Makefile                |    3 
 arch/sparc/mm/srmmu.c                 |    2 
 arch/x86/include/asm/fixmap.h         |    1 
 arch/x86/include/asm/highmem.h        |   12 +
 arch/x86/include/asm/iomap.h          |   13 --
 arch/x86/mm/highmem_32.c              |   59 ---------
 arch/x86/mm/init_32.c                 |   15 --
 arch/x86/mm/iomap_32.c                |   57 --------
 arch/xtensa/Kconfig                   |    1 
 arch/xtensa/include/asm/highmem.h     |    9 +
 arch/xtensa/mm/highmem.c              |   44 ------
 b/arch/x86/Kconfig                    |    3 
 include/linux/highmem.h               |  203 ++++++++++++++++++++++---------
 include/linux/io-mapping.h            |   42 +++++-
 include/linux/preempt.h               |   38 -----
 include/linux/sched.h                 |   11 +
 kernel/entry/common.c                 |    2 
 kernel/fork.c                         |    1 
 kernel/sched/core.c                   |   30 +++-
 kernel/sched/sched.h                  |    2 
 lib/smp_processor_id.c                |    2 
 mm/Kconfig                            |    3 
 mm/highmem.c                          |  218 ++++++++++++++++++++++++++++++++--
 54 files changed, 542 insertions(+), 969 deletions(-)

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
