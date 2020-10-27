Return-Path: <SRS0=oLQF=EC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E1BC388F9
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Oct 2020 11:36:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7B2A22263
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Oct 2020 11:36:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V3+XXPug";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="b99+t/zx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7B2A22263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0uUtywVJc0d5RcGR3TMxKjWj9n539ogjFsCvOH1a8gw=; b=V3+XXPug7E3gjJqjCyLkUoD6J
	CldK/Kftz5hE6g6s0+aQW58lBVZKhm7eHWIMwGt5tE9juERb/L11YvfzgG1RlS6FZjRzTV8onYHdx
	iGj/ndqKH4wBvlvwVwsg4cjAAfJGV2Naly/PonrWKlHaC6bEuuwR2dW9J+pkVS/HAZE0UIBzeK5ee
	uEfJSi6k3SacrVeMeUZRxWTNx5syGTriYWALTDEJ3q4pDaOYjOuSf6ssbuNjAwhtYf7b/9yAlO79e
	waoGGus1GF7Hsbf+mxfTCH4iPK23Q+5BKcQQR9haflrBDr2/IgILRmxCnOmirFpB6Rq6gEox7zYIM
	jrewBiiNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXNGl-0005Cx-E6; Tue, 27 Oct 2020 11:36:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXNCE-0002yz-GU; Tue, 27 Oct 2020 11:31:32 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB89C222EA;
 Tue, 27 Oct 2020 11:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603798281;
 bh=vmfZroUJkM1m/TwoHTzOGMJv9COTYCqEs/vywYSaGqw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b99+t/zxGqKiY0mVd3nJ3Tgx7pRC8vULcERZWWim4VU/p2KOdYSgzDcp37EYbEZ5P
 yhNXHW5NtywekjpZmFjC59aCK4DAfJMCVRblemDs9VsDADb3t796dHIC0QTog4K72o
 7yMQbMVOPOhuXQSLboUbgAIZVy6+GCPxbtTOy5YU=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 11/13] m68k/mm: make node data and node setup depend on
 CONFIG_DISCONTIGMEM
Date: Tue, 27 Oct 2020 13:29:53 +0200
Message-Id: <20201027112955.14157-12-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201027112955.14157-1-rppt@kernel.org>
References: <20201027112955.14157-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_073122_877582_9540B008 
X-CRM114-Status: GOOD (  17.49  )
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
Cc: linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-m68k@lists.linux-m68k.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-arm-kernel@lists.infradead.org, Michael Schmitz <schmitzmic@gmail.com>,
 Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

The pg_data_t node structures and their initialization currently depends on
!CONFIG_SINGLE_MEMORY_CHUNK. Since they are required only for DISCONTIGMEM
make this dependency explicit and replace usage of
CONFIG_SINGLE_MEMORY_CHUNK with CONFIG_DISCONTIGMEM where appropriate.

The CONFIG_SINGLE_MEMORY_CHUNK was implicitly disabled on the ColdFire MMU
variant, although it always presumed a single memory bank. As there is no
actual need for DISCONTIGMEM in this case, make sure that ColdFire MMU
systems set CONFIG_SINGLE_MEMORY_CHUNK to 'y'.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/m68k/Kconfig.cpu           | 6 +++---
 arch/m68k/include/asm/page_mm.h | 2 +-
 arch/m68k/mm/init.c             | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 694c4fca9f5d..3af0fca03803 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -20,6 +20,7 @@ choice
 
 config M68KCLASSIC
 	bool "Classic M68K CPU family support"
+	select NEED_MULTIPLE_NODES if DISCONTIGMEM
 
 config COLDFIRE
 	bool "Coldfire CPU family support"
@@ -373,8 +374,7 @@ config RMW_INSNS
 config SINGLE_MEMORY_CHUNK
 	bool "Use one physical chunk of memory only" if ADVANCED && !SUN3
 	depends on MMU
-	default y if SUN3
-	select NEED_MULTIPLE_NODES
+	default y if SUN3 || MMU_COLDFIRE
 	help
 	  Ignore all but the first contiguous chunk of physical memory for VM
 	  purposes.  This will save a few bytes kernel size and may speed up
@@ -406,7 +406,7 @@ config M68K_L2_CACHE
 config NODES_SHIFT
 	int
 	default "3"
-	depends on !SINGLE_MEMORY_CHUNK
+	depends on DISCONTIGMEM
 
 config CPU_HAS_NO_BITFIELDS
 	bool
diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index e6b75992192b..0e794051d3bb 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -126,7 +126,7 @@ static inline void *__va(unsigned long x)
 
 extern int m68k_virt_to_node_shift;
 
-#ifdef CONFIG_SINGLE_MEMORY_CHUNK
+#ifndef CONFIG_DISCONTIGMEM
 #define __virt_to_node(addr)	(&pg_data_map[0])
 #else
 extern struct pglist_data *pg_data_table[];
diff --git a/arch/m68k/mm/init.c b/arch/m68k/mm/init.c
index 53040857a9ed..4b46ceace3d3 100644
--- a/arch/m68k/mm/init.c
+++ b/arch/m68k/mm/init.c
@@ -47,14 +47,14 @@ EXPORT_SYMBOL(pg_data_map);
 
 int m68k_virt_to_node_shift;
 
-#ifndef CONFIG_SINGLE_MEMORY_CHUNK
+#ifdef CONFIG_DISCONTIGMEM
 pg_data_t *pg_data_table[65];
 EXPORT_SYMBOL(pg_data_table);
 #endif
 
 void __init m68k_setup_node(int node)
 {
-#ifndef CONFIG_SINGLE_MEMORY_CHUNK
+#ifdef CONFIG_DISCONTIGMEM
 	struct m68k_mem_info *info = m68k_memory + node;
 	int i, end;
 
-- 
2.28.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
