Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F13DD2E010
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Oct 2024 05:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JnciDL25aa5o4zPMizinwg5Xz3GAOnB7XoOX/TIi9kU=; b=MmpvrboFtd9uI0
	V6qKkeqKy3ADGP9dllqF/GKHHy6jjGvhES01SF6pMBqSyFMfTzm2/W3im4t928CFt9ka5FofRHTqh
	liV1WE7D9roTPscPkcz9QU+9gijAmMtmLcpUGpjYy75o/ayj1faOw1t7u4cViI3jAdq5+/R6Q1wKN
	GjTsNY7XiVMML3qspwbqy1EbBKx1Lt+jnhkV7VbNVnq9Sorpfw01pXKt+75PHNOalKBAyfjqtatQK
	GQJqaPU5LSHJIgAZP6ZIlcP5qihdzYoO1zLXcLFeCBC0DT4PFIeseJx/2HmSLnMZU7DYDF2RZT1N1
	raNS5CiRqhTetk7T3PYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3U69-0000000D4xw-1AB0;
	Wed, 23 Oct 2024 05:39:57 +0000
Received: from 2a02-8389-2341-5b80-8c6c-e123-fc47-94a5.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:8c6c:e123:fc47:94a5] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t3U3A-0000000D4L4-25Zx;
	Wed, 23 Oct 2024 05:36:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 2/2] asm-generic: add an optional pfn_valid check to page_to_phys
Date: Wed, 23 Oct 2024 07:36:37 +0200
Message-ID: <20241023053644.311692-3-hch@lst.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023053644.311692-1-hch@lst.de>
References: <20241023053644.311692-1-hch@lst.de>
MIME-Version: 1.0
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

page_to_pfn is usually implemented by pointer arithmetics on the memory
map, which means that bogus input can lead to even more bogus output.

Powerpc had a pfn_valid check on the intermediate pfn in the page_to_phys
implementation when CONFIG_DEBUG_VIRTUAL is defined, which seems
generally useful, so add that to the generic version.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/asm-generic/memory_model.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/asm-generic/memory_model.h b/include/asm-generic/memory_model.h
index a73a140cbecd..6d1fb6162ac1 100644
--- a/include/asm-generic/memory_model.h
+++ b/include/asm-generic/memory_model.h
@@ -64,7 +64,17 @@ static inline int pfn_valid(unsigned long pfn)
 #define page_to_pfn __page_to_pfn
 #define pfn_to_page __pfn_to_page
 
+#ifdef CONFIG_DEBUG_VIRTUAL
+#define page_to_phys(page)						\
+({									\
+	unsigned long __pfn = page_to_pfn(page);			\
+									\
+	WARN_ON_ONCE(!pfn_valid(__pfn));				\
+	PFN_PHYS(__pfn);						\
+})
+#else
 #define page_to_phys(page)	PFN_PHYS(page_to_pfn(page))
+#endif /* CONFIG_DEBUG_VIRTUAL */
 #define phys_to_page(phys)	pfn_to_page(PHYS_PFN(phys))
 
 #endif /* __ASSEMBLY__ */
-- 
2.45.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
