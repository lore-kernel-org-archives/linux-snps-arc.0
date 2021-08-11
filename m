Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 505B2C43214
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15C296108C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15C296108C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CyQb3cvH3oleHKEKtBlDuTQP2maDAQmk+ljFuF/tBjQ=; b=ug7wAEW8FQyVql
	/dkP+bp+n+Tp3m+OfgiYA5fPJ0ZOZnMjdJgvefWI2wqG+aSGLmqXB49G0IEepB2feNcDcf8Jr8WpM
	d9VtPG72M0Rg41NMbU0wEIUVi/5JWa8K3tr5aAK0ZFcTGK+d7+Wv1RDhOcG/4C7GL/YBy+lNIKR5F
	wKJJ1OWkuDhOmLqRML/6C8EjQSNjAAzUjXWEoIFsJkyDjDoKVM15aDtAQT3omE3OSc9awfRQ4q/rk
	UbPK4BSlX8TSqoePuE/RxJNy4WSyNhBB8+vWv43LMm1I3ethzhTp8MvNq7gMHGCt6ibenWLrxyrii
	wFojm7Nvhg5EPJUU6Zxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDcL1-0056dZ-VR; Wed, 11 Aug 2021 00:43:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDcKz-0056bT-5f
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 00:43:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E99A06056C;
 Wed, 11 Aug 2021 00:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628642596;
 bh=dhUncP/4+yqpzI3mayz8xRr13F3WjLadA+iK0UX3tsc=;
 h=From:To:Cc:Subject:Date:From;
 b=FcOe5AdnPi+ivIsFrXpVskA7CT3OaYgFY5uwIoLAnmXpOiqmJZJnHEH/dgzhzIiFA
 daQatxU1WOJoqbIL+k2/lxbO+HEt4fYjku5bG5xZZqQZ+JXaqsEVhyCDfEOQXiu6Lw
 vl3/QTj3whmwV/eTM64Bl7RuxmKYZ+OVENOqIHvCbDqJsc30kBjiwLfAzaaiV/wCKu
 34kQTz/ugSPNSV8ljWdTuXUx1gU83pfFnhE55F7dDYV0Nt62JXvnEReo3bEmJgm0sE
 4xrZoVBsn8BoefU+dLOQ77RqwcILcZ1W4JmyNvj5gI7r6J+KuPyXtn7gDaxTnW1aEt
 oTpe7tKHWmUrg==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 00/18] ARC mm updates to support 3 or 4 levels of paging
Date: Tue, 10 Aug 2021 17:42:40 -0700
Message-Id: <20210811004258.138075-1-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_174317_275295_5C5F5883 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
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

Hi,

Big pile of ARC mm changes to prepare for 3 or 4 levels of paging (from
current 2) needed for new hardware page walked MMUv6 (in aRCv3 ISA based
cores).

Most of these changes are incremental cleanups to make way for 14/18 and
15/18 which actually imeplement the new levels (in existing ARCv2 port)
and worth a critical eye.

CC'ing some of you guys dealing with page tables for a while :-)
to spot any obvious gotchas.

Thx,
-Vineet

Vineet Gupta (18):
  ARC: mm: simplify mmu scratch register assingment to mmu needs
  ARC: mm: remove tlb paranoid code
  ARC: mm: move mmu/cache externs out to setup.h
  ARC: mm: remove pgd_offset_fast
  ARC: mm: Fixes to allow STRICT_MM_TYPECHECKS
  ARC: mm: Enable STRICT_MM_TYPECHECKS
  ARC: ioremap: use more commonly used PAGE_KERNEL based uncached flag
  ARC: mm: pmd_populate* to use the canonical set_pmd (and drop pmd_set)
  ARC: mm: non-functional code cleanup ahead of 3 levels
  ARC: mm: move MMU specific bits out of ASID allocator
  ARC: mm: move MMU specific bits out of entry code
  ARC: mm: disintegrate mmu.h (arcv2 bits out)
  ARC: mm: disintegrate pgtable.h into levels and flags
  ARC: mm: hack to allow 2 level build with 4 level code
  ARC: mm: support 3 levels of page tables
  ARC: mm: support 4 levels of page tables
  ARC: mm: vmalloc sync from kernel to user table to update PMD ...
  ARC: mm: introduce _PAGE_TABLE to explicitly link pgd,pud,pmd entries

 arch/arc/Kconfig                          |   7 +-
 arch/arc/include/asm/cache.h              |   4 -
 arch/arc/include/asm/entry-compact.h      |   8 -
 arch/arc/include/asm/mmu-arcv2.h          |  94 +++++++
 arch/arc/include/asm/mmu.h                |  73 +----
 arch/arc/include/asm/mmu_context.h        |  29 +-
 arch/arc/include/asm/page.h               |  72 +++--
 arch/arc/include/asm/pgalloc.h            |  70 ++++-
 arch/arc/include/asm/pgtable-bits-arcv2.h | 151 +++++++++++
 arch/arc/include/asm/pgtable-levels.h     | 179 ++++++++++++
 arch/arc/include/asm/pgtable.h            | 315 +---------------------
 arch/arc/include/asm/processor.h          |   2 +-
 arch/arc/include/asm/setup.h              |  12 +-
 arch/arc/kernel/entry.S                   |   6 -
 arch/arc/mm/fault.c                       |  20 +-
 arch/arc/mm/ioremap.c                     |   3 +-
 arch/arc/mm/tlb.c                         |  71 ++---
 arch/arc/mm/tlbex.S                       |  80 ++----
 18 files changed, 617 insertions(+), 579 deletions(-)
 create mode 100644 arch/arc/include/asm/mmu-arcv2.h
 create mode 100644 arch/arc/include/asm/pgtable-bits-arcv2.h
 create mode 100644 arch/arc/include/asm/pgtable-levels.h

-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
