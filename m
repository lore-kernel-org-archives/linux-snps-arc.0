Return-Path: <SRS0=62Of=YK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA4FEECE58E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Oct 2019 17:47:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9572E21925
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Oct 2019 17:47:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FcSyOyrp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9572E21925
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c8rR6I0qeZLsqBJ8bzK52/2E6ws0evqWdEhAwBdnIDs=; b=FcSyOyrp3i6Wkg
	9ImfaUsZcjJCa34aqiWa/CBJlLfwrNefijQkWG1L+Nzf1WdJhpbhMJrAHAWX5Xr4/vkeITGakcwbl
	//6Uf4fV+8RMQSsERaigxqTvez3BmrHAUsnQYAX2WVIQR5NL/FYX9TdeRpmGj0lxDStmOT4YMYEHO
	+7oCZKwQo7OYsv9GEO0THeMYXNd+32GDls1LJ2ZOpLyifY/DtTyrYG1DQSIqjjV3KE028cBsuCjvH
	auRtaY6M4Ev1hQ7Cs+895ZaKxS2x53gBDSHAIX0yCUjzQydYckfXuto/88E6oQX++H8KRvIHIG2Oa
	3JwaYwNLp4J8e0GO+RfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL9sH-00079Y-FV; Thu, 17 Oct 2019 17:47:45 +0000
Received: from [2001:4bb8:18c:d7b:c70:4a89:bc61:3] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL9qb-0005Rn-DA; Thu, 17 Oct 2019 17:46:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 x86@kernel.org
Subject: [PATCH 02/21] unicore32: remove ioremap_cached
Date: Thu, 17 Oct 2019 19:45:35 +0200
Message-Id: <20191017174554.29840-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017174554.29840-1-hch@lst.de>
References: <20191017174554.29840-1-hch@lst.de>
MIME-Version: 1.0
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-mtd@lists.infradead.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 nios2-dev@lists.rocketboards.org, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

No users of ioremap_cached are left, remove it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/unicore32/include/asm/io.h | 4 +---
 arch/unicore32/mm/ioremap.c     | 8 --------
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/unicore32/include/asm/io.h b/arch/unicore32/include/asm/io.h
index c71aa4b95996..4b460e01acfa 100644
--- a/arch/unicore32/include/asm/io.h
+++ b/arch/unicore32/include/asm/io.h
@@ -18,10 +18,9 @@
 #include <asm-generic/io.h>
 
 /*
- * __uc32_ioremap and __uc32_ioremap_cached takes CPU physical address.
+ * __uc32_ioremap takes CPU physical address.
  */
 extern void __iomem *__uc32_ioremap(unsigned long, size_t);
-extern void __iomem *__uc32_ioremap_cached(unsigned long, size_t);
 extern void __uc32_iounmap(volatile void __iomem *addr);
 
 /*
@@ -32,7 +31,6 @@ extern void __uc32_iounmap(volatile void __iomem *addr);
  *
  */
 #define ioremap(cookie, size)		__uc32_ioremap(cookie, size)
-#define ioremap_cached(cookie, size)	__uc32_ioremap_cached(cookie, size)
 #define ioremap_nocache(cookie, size)	__uc32_ioremap(cookie, size)
 #define iounmap(cookie)			__uc32_iounmap(cookie)
 
diff --git a/arch/unicore32/mm/ioremap.c b/arch/unicore32/mm/ioremap.c
index cf6d656f240c..46a64bd6156a 100644
--- a/arch/unicore32/mm/ioremap.c
+++ b/arch/unicore32/mm/ioremap.c
@@ -220,14 +220,6 @@ __uc32_ioremap(unsigned long phys_addr, size_t size)
 }
 EXPORT_SYMBOL(__uc32_ioremap);
 
-void __iomem *
-__uc32_ioremap_cached(unsigned long phys_addr, size_t size)
-{
-	return __uc32_ioremap_caller(phys_addr, size, MT_DEVICE_CACHED,
-			__builtin_return_address(0));
-}
-EXPORT_SYMBOL(__uc32_ioremap_cached);
-
 void __uc32_iounmap(volatile void __iomem *io_addr)
 {
 	void *addr = (void *)(PAGE_MASK & (unsigned long)io_addr);
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
