Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55F1D2069D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Oct 2024 05:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ST5CzG0P+NYwrYQjs5YmF/ceFeWMv3rlpyq7xBT/0XQ=; b=tVtl1Cbs77pC44
	nHvkuJoXuLJA5NQJGV20il2xY3lIYStivYBrR4nVtzpckUDqZyZLuKS8qNQZ/5FN+Br7YYExshNNl
	2oQ7jYhI0/ztr/LI/cK0ldMfWJFwKdUIYMZR1PBYMrTWH1GQpH8lqo5bJ5aYdqFwZ7X4Q7n4A6qjf
	1YMsXg6lV980UmPWRUTFugYyPBV2hzPEHa3OyUs1cev0/YFByp5qf2+28mv7JinCMvD51yrVTbAf8
	gb4gRDoOGQz1rKjm0XtEXYxlg+BDywsEtEKeyI7O+9FSTEJKv+0zwTKmplKNpRaJ6rAeKCEiVDGP3
	cpowip74886N159gvfEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0wYZ-0000000AZGP-15s8;
	Wed, 16 Oct 2024 05:26:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0wYW-0000000AZFq-3og5
	for linux-snps-arc@lists.infradead.org;
	Wed, 16 Oct 2024 05:26:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 87D9B5C57E6;
	Wed, 16 Oct 2024 05:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EB96C4CEC7;
	Wed, 16 Oct 2024 05:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729056403;
	bh=//4Cx99p5jogEeFkicaoyIn2GOAS1p2Dbd+QLByWjhY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kSqQHT2gjOZNysn1EopfgAqccBNoMj7muqNqhKmFUOHUhStMb3CiHHwoHRliXE2vU
	 M3ZKqUVSR8u21fSR7zn3aRu4H5MJNOmo68E8OjfcwvSU3W7U59cegE1A6HeayK5d7g
	 x88a0a+uI1lNAIappeEcoMXFt7Pt973gwIy92rJ8YbMBIFTH1sOP8/NaQVybTr6tEs
	 ad8gr1mGPNbPAWfpoK5q+La24ulPpRgQ4hvy4QVC742XNtAcrW5xkKr9DItuNPuiBh
	 7DNqTD4D3pFMcX/yRlbuTopeLJFJVOsNNZNwW1X9R0T37emyViZ7Wl5FFBurQ31j+b
	 8aTSFPxVdUMIA==
From: Vineet Gupta <vgupta@kernel.org>
To: vineetg76@gmail.com
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	kernel test robot <lkp@intel.com>,
	linux-snps-arc@lists.infradead.org,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 3/3] ARC: build: Use __force to suppress per-CPU cmpxchg warnings
Date: Tue, 15 Oct 2024 22:26:36 -0700
Message-ID: <20241016052636.1639986-4-vgupta@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241016052636.1639986-1-vgupta@kernel.org>
References: <20241016052636.1639986-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_222645_015815_9CF9CC54 
X-CRM114-Status: GOOD (  11.37  )
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

From: "Paul E. McKenney" <paulmck@kernel.org>

Currently, the cast of the first argument to cmpxchg_emu_u8() drops the
__percpu address-space designator, which results in sparse complaints
when applying cmpxchg() to per-CPU variables in ARC.  Therefore, use
__force to suppress these complaints, given that this does not pertain
to cmpxchg() semantics, which are plently well-defined on variables in
general, whether per-CPU or otherwise.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409251336.ToC0TvWB-lkp@intel.com/
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: <linux-snps-arc@lists.infradead.org>
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/cmpxchg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index 58045c898340..76f43db0890f 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -48,7 +48,7 @@
 									\
 	switch(sizeof((_p_))) {						\
 	case 1:								\
-		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
+		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
 		break;							\
 	case 4:								\
 		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
