Return-Path: <SRS0=yiNs=M3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6663C43216
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Aug 2021 19:16:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 954FE60F58
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Aug 2021 19:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 954FE60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z/gBTRXDj5ksYKMyapjEmcN2QgN7qpCWtpwNYaotppw=; b=E5EmeJacxiCX7m
	rPDPx8SR/JuZbOQdOmhGY98n4KEmDfFTPaW72IT3Y/kLjyBjJlj/pUcNyTK7X6V7iclbp8aGkfnGB
	oLhb7b8GKCKXSx5CPvoqI2AI3aegAZF5ftbmm8Y1IkzJMJ98rPMb3F0hy996AeO9qul50YU+h5eC2
	peixKueG62MHT6KndEH5de/UHad9AeeCALo12UQvMV6mW/GW1Tr5UWC4aJnXXQllRa7LCRoeyGsAH
	STHqlA7kvce/tRyTSqzaOluXujDWTSX2gs9gxLjvUl6lQAJr4fgoa1OX48SGAQCz0owHATaEGPDXu
	s6eECHeRLT9wBXwI9pQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBMNH-007HhV-Pq; Wed, 04 Aug 2021 19:16:20 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBMND-007HRC-TU
 for linux-snps-arc@lists.infradead.org; Wed, 04 Aug 2021 19:16:17 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 57A89C0CD6;
 Wed,  4 Aug 2021 19:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1628104565; bh=QNBcV08QVOLccNUG2RaWflwIhkYnYjRy+AJtEG7BCbM=;
 h=From:To:Cc:Subject:Date:From;
 b=j+zH2QZqMB8dlQi0ifUZfqfjzQb3+v7Ci6eYugBIrUptM30jGgkoH+f+5DWjc/XEw
 IbU4qIzBI2fG0Pt265Ih/kmMylP7PXIN0N1zQyQi3lsTRQJpC2v4xEfI94DbGzrbCv
 ZIRw28CDf8Rnlcx38GpDpJpTMXStH44CeQWqsAbgPzWrC1aEl4oN+OynLOUIMri5bI
 5Ov3ztKGWJf2YgzqVbUp2ZJZhQe4MrgZJtJdugc2ndbAuWmSRFpOMH2vXX8OGnTPAx
 J4683Ztg4lFNBUieT8tMLv3QyBs0ONSok5enMQyz/VKby7b6vRWmcvH09Nan7Nhruk
 8rrLMs4iX2E8w==
Received: from vineetg-Latitude-7400.internal.synopsys.com
 (snps-fugpbdpduq.internal.synopsys.com [10.202.17.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 112D3A0090;
 Wed,  4 Aug 2021 19:16:02 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Cc: Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Vladimir Isaev <Vladimir.Isaev@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 00/11] ARC atomics update
Date: Wed,  4 Aug 2021 12:15:43 -0700
Message-Id: <20210804191554.1252776-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_121616_014300_5CA34AB3 
X-CRM114-Status: GOOD (  10.61  )
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

This series contains long due update to ARC atomics, discussed back
in 2018 [1] and [2]. I had them for arc64 port and decided to post them
here for some review and inclusion, after Mark's rework.

The main changes are use of relaxed atomics and generic bitops. Latter
does cause some cogen bloat on ARC due to signed args but that can be
reviewd seperately consider cross-arch impact.

The changes survive glibc testsuite with no regressions whatsoever.

Please review and provide any feedback.

Thx,
-Vineet

[1] https://lore.kernel.org/r/20180830144344.GW24142@hirez.programming.kicks-ass.net
[2] https://lore.kernel.org/r/20180830135749.GA13005@arm.com


Vineet Gupta (10):
  ARC: atomics: disintegrate header
  ARC: atomic: !LLSC: remove hack in atomic_set() for for UP
  ARC: atomic: !LLSC: use int data type consistently
  ARC: atomic64: LLSC: elide unused atomic_{and,or,xor,andnot}_return
  ARC: atomics: implement relaxed variants
  ARC: bitops: fls/ffs to take int (vs long) per asm-generic defines
  ARC: xchg: !LLSC: remove UP micro-optimization/hack
  ARC: cmpxchg/xchg: rewrite as macros to make type safe
  ARC: cmpxchg/xchg: implement relaxed variants (LLSC config only)
  ARC: atomic_cmpxchg/atomic_xchg: implement relaxed variants

Will Deacon (1):
  ARC: switch to generic bitops

 arch/arc/include/asm/atomic-llsc.h     |  97 ++++++
 arch/arc/include/asm/atomic-spinlock.h | 102 ++++++
 arch/arc/include/asm/atomic.h          | 444 ++-----------------------
 arch/arc/include/asm/atomic64-arcv2.h  | 250 ++++++++++++++
 arch/arc/include/asm/bitops.h          | 188 +----------
 arch/arc/include/asm/cmpxchg.h         | 233 ++++++-------
 arch/arc/include/asm/smp.h             |  14 -
 arch/arc/kernel/smp.c                  |   2 -
 8 files changed, 588 insertions(+), 742 deletions(-)
 create mode 100644 arch/arc/include/asm/atomic-llsc.h
 create mode 100644 arch/arc/include/asm/atomic-spinlock.h
 create mode 100644 arch/arc/include/asm/atomic64-arcv2.h

-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
