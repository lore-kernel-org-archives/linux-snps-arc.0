Return-Path: <SRS0=uxeU=EH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E896C2D0A3
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Nov 2020 17:07:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3CEF22246
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Nov 2020 17:07:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UlA1jMI8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbgIlDSc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3CEF22246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LQk9p5aW/LJIQDs7Ev8j6mdE388nqCK6EzKG/uDfnmk=; b=UlA1jMI8/Z8JwCEWmNRD+V9ww
	DP9ypIofiklF8zmWMs+nAbIwvZcH3eJGb/hc/kqdf9gvvwZ33xaTLJlIVx18cAepBn2C1+B5i+y2k
	3P2tztFxzEg5aClcQzTpAktRafSW7KmzfqA4zd0r8NzXvxbK1BQYSJM2lJYusVI6A6ASzkqs5bQEt
	B5vxDvNydsMi0FnJhHP6xRrJuV094ehNmRyIV/yWqWcfTaSSaQN5jRyxV2lYzJnVOM2HZVVypvQXR
	xQf/W6Ys5W+QB+rUZ0lwBGgspSL+DQ0Wj0dcDw0NSr7rq96HcHUSU7G/XxV7av5WuhezhjMpGnTM5
	1zZlpqIaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZGop-00039T-6e; Sun, 01 Nov 2020 17:07:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZGo2-0002lA-GW; Sun, 01 Nov 2020 17:06:16 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 22A6A208B6;
 Sun,  1 Nov 2020 17:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604250373;
 bh=ouvzP4AFjIGI/yJrmkEg4n9C1UOCnAtkBTTB0afK7Hc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WbgIlDSc8TGHbjxY7AvWdX2xlhItXwhXnkeSOegk0NJEn+PcsRhLpK58Wct05EpuF
 QIbQDDYSNWr0CFyzs6q38T5WgbsWrY+rcsYZ8i4z+8++/7SB9ksnVuGBzDEnj48jdO
 J85KeQCD/LWeoB5ASzK66AYQTGc+5DryB0pSWNWY=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 11/13] m68k/mm: make node data and node setup depend on
 CONFIG_DISCONTIGMEM
Date: Sun,  1 Nov 2020 19:04:52 +0200
Message-Id: <20201101170454.9567-12-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201101170454.9567-1-rppt@kernel.org>
References: <20201101170454.9567-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_120614_750558_F6B9D827 
X-CRM114-Status: GOOD (  16.37  )
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
 arch/m68k/Kconfig.cpu               | 4 ++--
 arch/m68k/include/asm/page_mm.h     | 2 +-
 arch/m68k/include/asm/virtconvert.h | 2 +-
 arch/m68k/mm/init.c                 | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 694c4fca9f5d..e8ad721e52f6 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -373,7 +373,7 @@ config RMW_INSNS
 config SINGLE_MEMORY_CHUNK
 	bool "Use one physical chunk of memory only" if ADVANCED && !SUN3
 	depends on MMU
-	default y if SUN3
+	default y if SUN3 || MMU_COLDFIRE
 	select NEED_MULTIPLE_NODES
 	help
 	  Ignore all but the first contiguous chunk of physical memory for VM
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
diff --git a/arch/m68k/include/asm/virtconvert.h b/arch/m68k/include/asm/virtconvert.h
index dfe43083b579..eb9eb5cb23a6 100644
--- a/arch/m68k/include/asm/virtconvert.h
+++ b/arch/m68k/include/asm/virtconvert.h
@@ -29,7 +29,7 @@ static inline void *phys_to_virt(unsigned long address)
 }
 
 /* Permanent address of a page. */
-#if defined(CONFIG_MMU) && defined(CONFIG_SINGLE_MEMORY_CHUNK)
+#if defined(CONFIG_MMU) && !defined(CONFIG_DISCONTIGMEM)
 #define page_to_phys(page) \
 	__pa(PAGE_OFFSET + (((page) - pg_data_map[0].node_mem_map) << PAGE_SHIFT))
 #else
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
