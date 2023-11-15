Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C06C48BFA
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Nov 2023 13:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CrhZVZxLFrI4F9SNUjdonfRYTj2AsfPkYFzLqwPu8Fs=; b=YJYtE2+REeQHVR
	5yhGTuMqT337aVYj1MSNaNb9vnoZrKeFpB6AT4L+l9UtxlWwpx+WQjdT5zTcyybjiOvVR8qhY2pme
	xLCS0KkCXqM51YsT7GZIVvm7umAGV8T69mGKdaM5NGxEIEUF/X5seXHi71gNZRPTDXcKDl34wfwNm
	OU4JrmY250nNQbmK3DIL235Neyt/wyC57vha2XPUTawVaTFcDuGbsQp4WMMusC5zhQimoUYguE5Ay
	6Lb+emSHivC7E3xc0IaEj+QffsgxlsLyFS2X01aBBDay0px4aThe6jJep0Q1ffq5TOzlJAEFVdnGo
	budSHwGS0zcogd+cEqDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3FwS-000s9K-2u;
	Wed, 15 Nov 2023 13:28:28 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3FwI-000rya-39
	for linux-snps-arc@lists.infradead.org;
	Wed, 15 Nov 2023 13:28:21 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-507a55302e0so9579150e87.0
        for <linux-snps-arc@lists.infradead.org>; Wed, 15 Nov 2023 05:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700054897; x=1700659697; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrVNEt2cc/SjP2EDNi8Ypx4BpRW+YQfrsXMUopTWpaU=;
        b=l9hZOfTd3fVMQiWvGQMV+oeSlAHr95hLlHSpsHY5m8p5asT0H+cXra8CRIxRlQgAX1
         fl7xuFngpKl8+jtsjEbR315H1x7QUL33TIP+4ikGH45ab72RHCd9IcPZoOWp3ysDaQID
         5Wf0aRyXp+fgrCJP/azaxk4NHIHUeM+OkK9Sl0v4FCQ4BdHUF3gGIVBnNrgyH0O97aiQ
         m2z96s2kDkgt0Z75DTR89V0AujLQzdNOamwilTwr+WQrGol2Z+zNgWiJwpQeHS3tntrA
         GYPqBexOkfRYrVWC3f3j6NB4KK6xthQIzUjT1dQXMwJQUaaJHBovH0RBNpGNqTTSsHzi
         hwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700054897; x=1700659697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrVNEt2cc/SjP2EDNi8Ypx4BpRW+YQfrsXMUopTWpaU=;
        b=MO45R53geoGCXusBGTx1XALYXmM00qSt/tAzxcjSgX2ISlzbGQlE35+6UIREpjOiFK
         V5jTsPddoaVhJf/xOzKPBIqQCClOvVBaF77XKEBH7a5mz94O6mpWMHvB2rrBbULInO+x
         O58VIHiPubJw4eGu2JCSfnj5zxnbc6Yz86nB35cwPUX0UXEZaCXCxKOVSS6WmiVfScky
         H5hbzKuzqFkWvKZd5fK/U5YRMECS6qohOHRHa2+Bz9zy0s46BcKlEj7FSml73cARmZ4I
         rANTg4EYABU3F+/yg9t7ibUtaeksSzD+ay194Yz2lP08CTl9g0LqL0B9C2fX6AvcpJY2
         GcfQ==
X-Gm-Message-State: AOJu0Yx+i4e5Fblj09yi5McIyXLNFygLVwAA/9PkVR1WqWKxuTt95zeO
	w1uxn/W21yF5rGjOPM+GygqyAA==
X-Google-Smtp-Source: AGHT+IEZfdzsNM4pOVpdQmBfJck2ud0jjVkPzsGxSYAG5htEb3fgmCm3DK8SVrja4wL8Daoz/Qy5GA==
X-Received: by 2002:a05:6512:4846:b0:507:9702:8e09 with SMTP id ep6-20020a056512484600b0050797028e09mr8331107lfb.2.1700054896889;
        Wed, 15 Nov 2023 05:28:16 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id l12-20020a19c20c000000b00507b1da672bsm1648705lfc.174.2023.11.15.05.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 05:28:16 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Nov 2023 14:28:14 +0100
Subject: [PATCH 1/2] ARC: mm: Make virt_to_pfn() a static inline
MIME-Version: 1.0
Message-Id: <20231115-virt-to-phy-arch-tree-v1-1-8b61296eae73@linaro.org>
References: <20231115-virt-to-phy-arch-tree-v1-0-8b61296eae73@linaro.org>
In-Reply-To: <20231115-virt-to-phy-arch-tree-v1-0-8b61296eae73@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, 
 Brian Cain <bcain@quicinc.com>
Cc: linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-hexagon@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_052819_036942_A2E31F25 
X-CRM114-Status: GOOD (  14.98  )
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
 

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
