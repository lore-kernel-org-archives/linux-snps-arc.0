Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EADBC19F3A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D325C6056C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D325C6056C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHICZQLSJuqGc0BNsTPkLfFTiRL4TQTVjkfkzBWFBEg=; b=2Oljs20zIU+qoe
	cWygaGYqQdY8G+urtOxAXON646vAgla/I/dzwIhd2KOHG6tMBR9Vyk9eAlxPJFKy5mlSqgWN6DIJf
	iAgJr68z4Zopl459+x9ks3sG5j+BA8hHOHmjGK0ekS/Io7gs7BsKJdLmDZrN8fy82411GtkRKdYrw
	DjvA4gX+MFcG4tzTFMA/S+oDH670nSX66Jm7d+uFMs48UTq+3vHNMHxI2aZg6BGQtzs+lNCq2zCZv
	wfW10slE4EHLvdCdYryK1JsDzz284a7hk6xoy+5SNkAQayNG32IjCCeJJBfBoUSTHrKtOdo2l5jzb
	N7lBlh+WAMzGAuDmdeWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDcL7-0056kE-31; Wed, 11 Aug 2021 00:43:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDcL0-0056c8-3I
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 00:43:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4815A60C40;
 Wed, 11 Aug 2021 00:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628642597;
 bh=ErFVGLefxP4MHVDH8Q7kswgyJ2BqPsS+5BKbLRJMXC0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=egE2spqBx9LY1O7g9Vel5aVr2I9KAWdVGpTZz7DgmNWefl5hyvv2tvPorFxHkRDM6
 71q003FAcfpShb9J3ju2shYDhiSXfgvywX1nA6koVInrgfrBNwBCZCDXr3f7iqGnGk
 wOWsQuPFRv7iEzuOIANE9FD5R1TosNU3At/HgbrtDMrxyQdmOXDghsduu2L9ilt14G
 qAGZuuhrLvsYi5uN86y5YuDxQK+if4ld8+jYDyb90HcE5WSW+GXfQHPr8D43pX0abq
 dz+hrCoqbVnJwkM/RlUwdmYnwPxroHVgLApEPTTYHjfz1UO4oTLFrD+5HFlwoMesVi
 4WVmPOy3cmk1g==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>,
 Vineet Gupta <vgupta@kernel.com>
Subject: [PATCH 03/18] ARC: mm: move mmu/cache externs out to setup.h
Date: Tue, 10 Aug 2021 17:42:43 -0700
Message-Id: <20210811004258.138075-4-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811004258.138075-1-vgupta@kernel.org>
References: <20210811004258.138075-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_174318_192883_626C4E38 
X-CRM114-Status: UNSURE (   8.78  )
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

Signed-off-by: Vineet Gupta <vgupta@kernel.com>
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/cache.h |  4 ----
 arch/arc/include/asm/mmu.h   |  4 ----
 arch/arc/include/asm/setup.h | 12 ++++++++++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arc/include/asm/cache.h b/arch/arc/include/asm/cache.h
index d8ece4292388..f0f1fc5d62b6 100644
--- a/arch/arc/include/asm/cache.h
+++ b/arch/arc/include/asm/cache.h
@@ -62,10 +62,6 @@
 #define ARCH_SLAB_MINALIGN	8
 #endif
 
-extern void arc_cache_init(void);
-extern char *arc_cache_mumbojumbo(int cpu_id, char *buf, int len);
-extern void read_decode_cache_bcr(void);
-
 extern int ioc_enable;
 extern unsigned long perip_base, perip_end;
 
diff --git a/arch/arc/include/asm/mmu.h b/arch/arc/include/asm/mmu.h
index 38a036508699..762cfe66e16b 100644
--- a/arch/arc/include/asm/mmu.h
+++ b/arch/arc/include/asm/mmu.h
@@ -64,10 +64,6 @@ typedef struct {
 	unsigned long asid[NR_CPUS];	/* 8 bit MMU PID + Generation cycle */
 } mm_context_t;
 
-void arc_mmu_init(void);
-extern char *arc_mmu_mumbojumbo(int cpu_id, char *buf, int len);
-void read_decode_mmu_bcr(void);
-
 static inline int is_pae40_enabled(void)
 {
 	return IS_ENABLED(CONFIG_ARC_HAS_PAE40);
diff --git a/arch/arc/include/asm/setup.h b/arch/arc/include/asm/setup.h
index 01f85478170d..028a8cf76206 100644
--- a/arch/arc/include/asm/setup.h
+++ b/arch/arc/include/asm/setup.h
@@ -2,8 +2,8 @@
 /*
  * Copyright (C) 2004, 2007-2010, 2011-2012 Synopsys, Inc. (www.synopsys.com)
  */
-#ifndef __ASMARC_SETUP_H
-#define __ASMARC_SETUP_H
+#ifndef __ASM_ARC_SETUP_H
+#define __ASM_ARC_SETUP_H
 
 
 #include <linux/types.h>
@@ -34,4 +34,12 @@ long __init arc_get_mem_sz(void);
 #define IS_AVAIL2(v, s, cfg)	IS_AVAIL1(v, s), IS_AVAIL1(v, IS_USED_CFG(cfg))
 #define IS_AVAIL3(v, v2, s)	IS_AVAIL1(v, s), IS_AVAIL1(v, IS_DISABLED_RUN(v2))
 
+extern void arc_mmu_init(void);
+extern char *arc_mmu_mumbojumbo(int cpu_id, char *buf, int len);
+extern void read_decode_mmu_bcr(void);
+
+extern void arc_cache_init(void);
+extern char *arc_cache_mumbojumbo(int cpu_id, char *buf, int len);
+extern void read_decode_cache_bcr(void);
+
 #endif /* __ASMARC_SETUP_H */
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
