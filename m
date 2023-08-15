Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5761FC001DB
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Aug 2023 00:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=roUfZUMzK4mxLBTozBv0FZfzSiDYGGWhq3JwUOf195A=; b=xXxSywYYNpAB4t
	DnA8HYWk47EclgnMEmVObnnKeQRHVkjR5zr8bCvhY4NP7moz7gkE2XeJV9nRTKDCOkfMXjmfauvDH
	5XxGCG1TEM+wan7RpkIBxLCpJVreVohuQ1CMh1Fef129omE+uTmbtJLD78eIOT+qJ+Bngkmh8R/73
	8tZnFc7HJFLopGA0ft/ALsi59a3j1AxOBgRe6pBpt0lu3tzTM4asWr089efsc1ajDDcE7kZGwMkqT
	JrkDgePPbbYwUD8/o8QK0lvlSBANqg/oddxO6rgOwW8W40bzGAN80Rsn77XVEsRii9TexIEXZUYI+
	S5n3ptOdiDk8pT1J8XtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qViEQ-000cVg-2m;
	Tue, 15 Aug 2023 00:48:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qViEN-000cTV-1p
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Aug 2023 00:48:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DE0A06307C;
	Tue, 15 Aug 2023 00:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118E1C433C8;
	Tue, 15 Aug 2023 00:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692060498;
	bh=bQjACPQgTLx/TQKmDG+Aq74AFzkxKsmGok6rVreNj/I=;
	h=From:To:Cc:Subject:Date:From;
	b=n4Fd5ZJ5LrtOvD2vfdvlewuTdwRxuB1BA9+hmJNqLwVUKgQvTpbeNslWmvobh4iZn
	 lbHlT6hfw7xBFww7o0SmLnhc5h2h0Xx+NWh97acnk0PYvNoJ1TyDTMNPZ/2hCRqiXp
	 pnBPx0me2gmq9RPOoWKUrYPS4UaIiB8ExBXYws8LhZUbdujt6dvcLt604W5GXokoDY
	 Lhosa55SqfHhN2Ghnzw8jCskGagTaSlz7IKvOF0nnpZG8bFYZix6IcNJwp4KXawNrY
	 3DitgqZFM9c2mlyFe9pmEoCTyyN9ihFtU1bTDIVISOEmDAG2Y5RivvFjKZgyFI8Tyu
	 bOK8tdiM5Kxgw==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 00/20] ARC updates
Date: Mon, 14 Aug 2023 17:47:53 -0700
Message-Id: <20230815004813.555115-1-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_174819_708212_B61B60EC 
X-CRM114-Status: UNSURE (   9.16  )
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

This is a pile of miscll improvements/updates sitting in one of my local trees.
Given the recent warning fix, we coudl also push them out.
@Alexey, @Shahab: care to give these a spin on hsdk (and test ARC700 build/boot on nSIM if possible).

Thx,
-Vineet

Vineet Gupta (20):
  ARC: uaccess: remove arc specific out-of-line handles for -Os
  ARC: uaccess: use optimized generic __strnlen_user/__strncpy_from_user
  ARC: uaccess: elide unaliged handling if hardware supports
  ARCv2: memset: don't prefetch for len == 0 which happens a alot
  ARC: boot log: eliminate struct cpuinfo_arc #1: mm
  ARC: boot log: eliminate struct cpuinfo_arc #2: cache
  ARC: boot log: eliminate struct cpuinfo_arc #3: don't export
  ARC: boot log: eliminate struct cpuinfo_arc #4: boot log per ISA
  ARC: entry: use gp to cache task pointer (vs. r25)
  ARC: kernel stack: INIT_THREAD need not setup @init_stack in @ksp
  ARC: __switch_to: asm with dwarf ops (vs. inline asm)
  ARC: __switch_to: move ksp to thread_info from thread_struct
  ARC: entry: rework (non-functional)
  ARC: entry: ARcompact EV_ProtV to use r10 directly
  ARC: entry: EV_MachineCheck dont re-read ECR
  ARC: entry: Add more common chores to EXCEPTION_PROLOGUE
  ARC: entry: replace 8 byte OR with 4 byte BSET
  ARC: entry: replace 8 byte ADD.ne with 4 byte ADD2.ne
  ARCv2: entry: rearrange pt_regs slightly
  ARC: pt_regs: create seperate type for ecr

 arch/arc/Kconfig                     |   8 +-
 arch/arc/Makefile                    |   6 +-
 arch/arc/include/asm/arcregs.h       |  99 ++---
 arch/arc/include/asm/current.h       |   2 +-
 arch/arc/include/asm/dwarf.h         |  32 +-
 arch/arc/include/asm/entry-arcv2.h   |  66 ++--
 arch/arc/include/asm/entry-compact.h |  50 ++-
 arch/arc/include/asm/entry.h         | 107 ++---
 arch/arc/include/asm/processor.h     |   7 +-
 arch/arc/include/asm/ptrace.h        |  62 ++-
 arch/arc/include/asm/setup.h         |   6 +-
 arch/arc/include/asm/thread_info.h   |  10 +-
 arch/arc/include/asm/uaccess.h       |  21 +-
 arch/arc/kernel/Makefile             |   9 +-
 arch/arc/kernel/asm-offsets.c        |  14 +-
 arch/arc/kernel/ctx_sw.c             | 112 ------
 arch/arc/kernel/ctx_sw_asm.S         |  76 ++--
 arch/arc/kernel/entry-arcv2.S        |  15 -
 arch/arc/kernel/entry-compact.S      |  16 +-
 arch/arc/kernel/entry.S              |  70 ++--
 arch/arc/kernel/kgdb.c               |   2 +-
 arch/arc/kernel/mcip.c               |   2 -
 arch/arc/kernel/process.c            |  17 +-
 arch/arc/kernel/ptrace.c             |   8 +-
 arch/arc/kernel/setup.c              | 561 ++++++++++++---------------
 arch/arc/kernel/traps.c              |   4 +-
 arch/arc/kernel/troubleshoot.c       |  13 +-
 arch/arc/lib/memset-archs.S          |   3 +-
 arch/arc/mm/cache.c                  | 171 +++-----
 arch/arc/mm/extable.c                |  11 -
 arch/arc/mm/fault.c                  |   6 +-
 arch/arc/mm/tlb.c                    |  94 ++---
 32 files changed, 667 insertions(+), 1013 deletions(-)
 delete mode 100644 arch/arc/kernel/ctx_sw.c

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
