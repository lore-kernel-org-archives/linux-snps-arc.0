Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1569EDE988
	for <linux-snps-arc@archiver.kernel.org>; Thu, 14 Sep 2023 06:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DvrhjOFbELl7lZvXZamdYE1GxarSGexghwG+obE/PJw=; b=hLyGZxJ8iJ+5tc
	hUq2nRCd/UZAIeKyc3YtUwGrS/W917kcHGR/nKZjEm8GU5beqxyOGohRsXH3v9U7baKqDXRJHcAmJ
	nOf8pGzLSMmpROQKt19gobNsAv4LXv+I37m7KsxayD75FTl9eKquyT73/K0Zn6fHRmBhE8PaQvalZ
	7HxJIbm5LYI9pTqkjQQkvY2jGmAraTjoEn/6i96Hl0EiIlH7RiiTlLx8IyHppEb+5lpcUoD03DGlp
	T4vaYEDt5lhgS8K0XOQ3JoJikP8rjumhbNbnDuTdPzyKejGIHDHfzS1kXr9MlqLc5iyxQzsgeplhk
	47PqVYC2ZnidhDA1MVzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgftA-007W6R-0R;
	Thu, 14 Sep 2023 06:31:44 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgft6-007W62-26
	for linux-snps-arc@lists.infradead.org;
	Thu, 14 Sep 2023 06:31:42 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-502d9ce31cbso925096e87.3
        for <linux-snps-arc@lists.infradead.org>; Wed, 13 Sep 2023 23:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694673097; x=1695277897; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V9y3W4w8Vrvb3itSQ1aZxY0flcAM2wszFYoNzBZyBoc=;
        b=KVYUjnNptiWXdOAB1RqigBSSsaey2m8M6fSJv6EdVHJEJYKUWeL7Ym87q8bbP4Eba2
         qalKGmPdGysmkNNF/7sKS7fxV4dJcMnEUAC6zaSEv8wN4Rj8xhbh5M2cVe3UQRLDoL5D
         TMqBpn2OXwUB3mh6bRRkXS1J/3kQM0PcootQJhnWKY5Z6tly5nkm7/fw+dNoTDtwQipP
         FJzSBd/14lWq5Ugh7B5hFCmd83ybMiMoGKZXWAk9UU5DXDGvk1CwU31m98K5YUFhQYwU
         bzvGiQEtzZQM8rmjgGS3oI1soZsmu1gjc23eNB5Me5rMot8h/Xg7Wo7rj2UehSG1stmS
         zYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694673097; x=1695277897;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9y3W4w8Vrvb3itSQ1aZxY0flcAM2wszFYoNzBZyBoc=;
        b=eShr/hx1sLmWbVpnjr+UYWB4pcz/5vQZc18pNz1oezCgiR8hqNaU6VS/q60WRtuKBr
         JmZDbK1r6aTDnTjmy0yDnBSEh//eiuRlmPUy5uBaBSwL2iIGVtqoKlFHqpkJlH9GQWff
         X5n78+HDx58jrHy2vu3I0Ce4QdvwuPzIUHHiGnO/FMO5UYp1nt26o2HOTn5KKPZc8oNe
         lfeKf8rdlSADr/0lHXZIf160ww1ldnWSdInDKhyfzD1XTeKIWu+wbVMg5t2WT/bttNxW
         3ezJhIL8A/o5F57jFOdlmdn5afdrKZcDpzOTwLpspDyLGQ4IfNlxw4z44efQ0gubw2YP
         Pvxg==
X-Gm-Message-State: AOJu0Yxcm8r37kLIUUGBEbip29l6Cnow7f/r0CbR2hhY7q95wc1UuZym
	4cqdecy37de4DLDfVRY1PmiAmg==
X-Google-Smtp-Source: AGHT+IEZbGELgFj+ivRiRQ+TIEYto5EpOmtl+6TCMIpbdj0vBdu2MWWww5vUgZ71rmW/zJdr3albrg==
X-Received: by 2002:a05:6512:2311:b0:500:7cab:efc3 with SMTP id o17-20020a056512231100b005007cabefc3mr4731734lfu.11.1694673096532;
        Wed, 13 Sep 2023 23:31:36 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id a26-20020a056512021a00b004ffad0ec2d5sm145003lfo.111.2023.09.13.23.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 23:31:36 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Sep 2023 08:31:35 +0200
Subject: [PATCH] ARC: mm: Make virt_to_pfn() a static inline
MIME-Version: 1.0
Message-Id: <20230914-virt-to-phys-arc-v1-1-9dc0008dc0b0@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMaoAmUC/x3MQQqAIBBA0avErBvQBMmuEi3SppxNxRhRiHdPW
 r7F/xkSCVOCockgdHPiY6/QbQMhzvtGyEs1dKozymmDN8uF14FnfBPOEtArb7UJtndeQc1OoZW
 ffzlOpXwV57JzYgAAAA==
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_233140_712509_5C9C37AA 
X-CRM114-Status: GOOD (  14.34  )
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

Making virt_to_pfn() a static inline taking a strongly typed
(const void *) makes the contract of a passing a pointer of that
type to the function explicit and exposes any misuse of the
macro virt_to_pfn() acting polymorphic and accepting many types
such as (void *), (unitptr_t) or (unsigned long) as arguments
without warnings.

In order to do this we move the virt_to_phys() and
below the definition of the __pa() and __va() macros so it
compiles. The macro version was also able to do recursive
symbol resolution.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arc/include/asm/page.h           | 21 ++++++++++++---------
 arch/arc/include/asm/pgtable-levels.h |  2 +-
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
index 02b53ad811fb..def0dfb95b43 100644
--- a/arch/arc/include/asm/page.h
+++ b/arch/arc/include/asm/page.h
@@ -84,15 +84,6 @@ typedef struct {
 
 typedef struct page *pgtable_t;
 
-/*
- * Use virt_to_pfn with caution:
- * If used in pte or paddr related macros, it could cause truncation
- * in PAE40 builds
- * As a rule of thumb, only use it in helpers starting with virt_
- * You have been warned !
- */
-#define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
-
 /*
  * When HIGHMEM is enabled we have holes in the memory map so we need
  * pfn_valid() that takes into account the actual extents of the physical
@@ -122,6 +113,18 @@ extern int pfn_valid(unsigned long pfn);
 #define __pa(vaddr)  		((unsigned long)(vaddr))
 #define __va(paddr)  		((void *)((unsigned long)(paddr)))
 
+/*
+ * Use virt_to_pfn with caution:
+ * If used in pte or paddr related macros, it could cause truncation
+ * in PAE40 builds
+ * As a rule of thumb, only use it in helpers starting with virt_
+ * You have been warned !
+ */
+static inline unsigned long virt_to_pfn(const void *kaddr)
+{
+	return __pa(kaddr) >> PAGE_SHIFT;
+}
+
 #define virt_to_page(kaddr)	pfn_to_page(virt_to_pfn(kaddr))
 #define virt_addr_valid(kaddr)  pfn_valid(virt_to_pfn(kaddr))
 
diff --git a/arch/arc/include/asm/pgtable-levels.h b/arch/arc/include/asm/pgtable-levels.h
index fc417c75c24d..86e148226463 100644
--- a/arch/arc/include/asm/pgtable-levels.h
+++ b/arch/arc/include/asm/pgtable-levels.h
@@ -159,7 +159,7 @@
 #define pmd_clear(xp)		do { pmd_val(*(xp)) = 0; } while (0)
 #define pmd_page_vaddr(pmd)	(pmd_val(pmd) & PAGE_MASK)
 #define pmd_pfn(pmd)		((pmd_val(pmd) & PAGE_MASK) >> PAGE_SHIFT)
-#define pmd_page(pmd)		virt_to_page(pmd_page_vaddr(pmd))
+#define pmd_page(pmd)		virt_to_page((void *)pmd_page_vaddr(pmd))
 #define set_pmd(pmdp, pmd)	(*(pmdp) = pmd)
 #define pmd_pgtable(pmd)	((pgtable_t) pmd_page(pmd))
 

---
base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
change-id: 20230913-virt-to-phys-arc-b0b613c689b0

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
