Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD6DC54E64
	for <linux-snps-arc@archiver.kernel.org>; Thu, 28 Mar 2024 05:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vlIB2ut95IXmVjBCWMI1Xykzct17rz5oErkQqxDkWIk=; b=uVF6KdZSqTCfTW
	vo32Bn8AfqCloCkK2OvclxgyizZl+4nVMfFFIANiXJgZIKlpuCPkhLXlS+mht6y0Mx/2JQ+iCO5LQ
	ruvOso0dgHR5bLbChVl/oed3JDGukxoPA4ahGVSY3XEhgTDw+VniwKR6ZPL9F3Z/UnjpviixC7TJb
	LfUo+tFDNmd1rpyh4iJ1QDbn01jIvo8bUREorkO6licI3iRej9R/Hch0TfDYir8toaTslB6lNyZNd
	BxakY5vgZvuItKNxsmnkMFThtllCnlQCaSgn8SDFIU6dv4G3s2thop7bWrCL1tQysYcqvUPxpB8wr
	7YpqxyVH4S8VJLzV3Clg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpiUD-0000000CaPp-1kxy;
	Thu, 28 Mar 2024 05:39:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpiU4-0000000CaKz-1nGI
	for linux-snps-arc@lists.infradead.org;
	Thu, 28 Mar 2024 05:39:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C96661701;
	Thu, 28 Mar 2024 05:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 407E6C43394;
	Thu, 28 Mar 2024 05:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711604367;
	bh=OO4cjF1dzedIpZ/Rn3JEn332Jo/uK7j8W6cHjViP98o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HmNTYAeyBMc+xYkhGgFyEffcpojMOnwTOpp3ZEhfPXorHPhe+4Y0db/ReKpJ3NE71
	 PseOlyDX59lGJAfYF+9ygLX87kUap6EjvAdIU9p43PST2depQXBR077fipEChK9t0v
	 XIfFeC1nkxG2zhzkrW2d3TJW+lWyd1IBlGMXpOieQz1vWQBBm9hYYEjYIxUSmoCcYW
	 T4lET7c+TAA6oOUvkvj/mfeCJVUxcfcIVm6vDoVKFgNErIePAsVqd8y2p/jnc+cKyc
	 HPXYwfZENKwPdO4eWLXZGQuZCd6gH79fMFi5hMROh1PzlLO85zIFA9fQO3b6RX5SBM
	 EY26xcCW5/Taw==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [PATCH 2/2] ARC: mm: fix new code about cache aliasing
Date: Wed, 27 Mar 2024 22:39:19 -0700
Message-Id: <20240328053919.992821-3-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328053919.992821-1-vgupta@kernel.org>
References: <20240328053919.992821-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_223928_580629_B3814F51 
X-CRM114-Status: UNSURE (   8.41  )
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

Manual/partial revert of 8690bbcf3b70 ("Introduce cpu_dcache_is_aliasing() across all architectures")

Current generation of ARCv2/ARCv3 based HSxx cores are only PIPT (to software
at least).

Legacy ARC700 cpus could be VIPT aliasing (based on cache geometry and
PAGE_SIZE) however recently that support was ripped out so VIPT aliasing
cache is not relevant to ARC anymore.

P.S. : This has been discussed a few times on lists [1]
P.S.2: Please CC the arch maintainers and/or mailing list before adding
       such interfaces.

[1] http://lists.infradead.org/pipermail/linux-snps-arc/2023-February/006899.html

Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/Kconfig                 | 1 -
 arch/arc/include/asm/cachetype.h | 9 ---------
 2 files changed, 10 deletions(-)
 delete mode 100644 arch/arc/include/asm/cachetype.h

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 99d2845f3feb..4092bec198be 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -6,7 +6,6 @@
 config ARC
 	def_bool y
 	select ARC_TIMERS
-	select ARCH_HAS_CPU_CACHE_ALIASING
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DMA_PREP_COHERENT
diff --git a/arch/arc/include/asm/cachetype.h b/arch/arc/include/asm/cachetype.h
deleted file mode 100644
index 05fc7ed59712..000000000000
--- a/arch/arc/include/asm/cachetype.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_ARC_CACHETYPE_H
-#define __ASM_ARC_CACHETYPE_H
-
-#include <linux/types.h>
-
-#define cpu_dcache_is_aliasing()	true
-
-#endif
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
