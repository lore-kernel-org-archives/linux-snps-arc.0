Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE3BDC10F04
	for <linux-snps-arc@archiver.kernel.org>; Sat,  9 Dec 2023 00:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eb8VZkiCrFL2Hy6lY425yluAiQ6uIBLChzNn/cCeaPQ=; b=NSIuC9NgoMVDlb
	shQnB2rXlrKdIbNIhtKhgd9Fz1zMrLzqmSSM0Czk9zfH2UG/ruOOCVD3cENS7k18Y8Bb7C+9OQ7kq
	R80Tlt4T4txfsdbUrNAOG/VWFhv4/6HvzmTiZnRdzobVldcYd+IUTnowzT7Y+9zzKjcmo2AznbhQN
	mh0Wk+1DZkWND3RUBPyXhnikTvPq8I8/iTXEqNVMrI2fB5WOWDHVZBrd9i3jS1QoFZeXBNwk96+pj
	8vmbu1dKDQytfFvP3PIPQGjpxkvreKaFvLW/RCTUpExFsxn7k6EhQrFrRus7ZA1Hv4/CXJdQnZGF4
	bJtBn34J0NzPDNmMk2uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBlHV-00GpWY-2Z;
	Sat, 09 Dec 2023 00:33:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBlHQ-00GpTM-0r
	for linux-snps-arc@lists.infradead.org;
	Sat, 09 Dec 2023 00:33:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D77DACE2A3A;
	Sat,  9 Dec 2023 00:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6555C433C7;
	Sat,  9 Dec 2023 00:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702081993;
	bh=3Z8YdkNLvvbina63xYK5Sl+tNJdnGJfRB2Ip9dtMGMQ=;
	h=From:To:Cc:Subject:Date:From;
	b=r0o8/TKUMJ/Roj1bQ9tBX/3SrKZ/N7tZNY9AsWK9S/roVZ7UYPf489jxogIlZeWVz
	 fIWMnr2YwyEBieku7+k7nEXWrK8tufI4rqqYm2GkGxx57v208QL3bbOKBllL/zVcMY
	 1D222pM52kJ1qF41PCBs+ZMrtJZzRZbv80NQ6PCaGB42L1tU8ggungF8UmL/bcPPTy
	 i4sFiIpwzADjESecIG7d8cmUAdeK2PhLFroCck1muBXJfES60kf95wAVlbgAIL0gTl
	 Dfd8rOssktbDR8kg5XOVgcHaRCe5l2wH2i5hRCmt1bTG15DxtBwqdm4f4D/gtSWrg+
	 2KirlS1mFICNA==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Pavel.Kozlov@synopsys.com,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 0/5] ARC updates
Date: Fri,  8 Dec 2023 16:33:02 -0800
Message-Id: <20231209003307.480051-1-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_163316_574360_5F5AB2D7 
X-CRM114-Status: UNSURE (   4.38  )
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

A pile of accrued changes, compile tested only.
Please test.

Thx,
-Vineet

Vineet Gupta (5):
  ARC: entry: SAVE_ABI_CALLEE_REG: ISA/ABI specific helper
  ARC: entry: move ARCompact specific bits out of entry.h
  ARC: mm: retire support for aliasing VIPT D$
  ARC: fix spare error
  ARC: fix smatch warning

 arch/arc/Kconfig                     |   5 -
 arch/arc/include/asm/cacheflush.h    |  43 ---------
 arch/arc/include/asm/entry-arcv2.h   |  32 +++++++
 arch/arc/include/asm/entry-compact.h |  87 ++++++++++++++++-
 arch/arc/include/asm/entry.h         | 110 +---------------------
 arch/arc/include/asm/ptrace.h        |  14 +--
 arch/arc/kernel/setup.c              |   4 +-
 arch/arc/kernel/signal.c             |   6 +-
 arch/arc/mm/cache.c                  | 136 ++-------------------------
 arch/arc/mm/mmap.c                   |  21 +----
 arch/arc/mm/tlb.c                    |  16 +---
 11 files changed, 148 insertions(+), 326 deletions(-)

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
