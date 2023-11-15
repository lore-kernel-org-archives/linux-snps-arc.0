Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711DAC531AC
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Nov 2023 13:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=De0Rj007lI5yQGK7/idAAIKtlyvCodOoB+dHvU4T9Js=; b=lXDICr8ztOBNxu
	f9AcifFgdBz9k2+LiZbbaBx2Xt6/3N/vFWgnjSrF+FnV+HmjI2w3+2WC93laDDwpKBhje0DRANJ9r
	VzXcViraEp5ME6U7cRhSaxc4f8gBBF7k/DRKP4LMbktXO6gU9IyZ4fo7pC7bslC4dxSns5VKoz6xs
	EDwtuIdlTB5b+eZCl7dd1RGus/ow3pz4bp+/yH9+wNYLVgd0MGRLGLqJift5lAw+ol1xwvSCr+l9p
	XVIkvOoiZGO5tNP4uEUG6FkHENhhXrtGsB+bjiQ6IYBiymirjND7RgPIu0ilD0fjGeS7fIoisXlwO
	+qPMoGTljp58YSSCtdMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3FwT-000sAG-2E;
	Wed, 15 Nov 2023 13:28:29 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3FwJ-000rzM-2c
	for linux-snps-arc@lists.infradead.org;
	Wed, 15 Nov 2023 13:28:21 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-507a5f2193bso920598e87.1
        for <linux-snps-arc@lists.infradead.org>; Wed, 15 Nov 2023 05:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700054898; x=1700659698; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27kbaYc9o/j9wTLBAVP45tsETwTbQIy8zKNs3tAOssU=;
        b=hEoTrGl3yzHtHo6RCF2G/+39GwCg2E87ygnmlMibAIMNfxU1daKqAyq09XnHiv17tK
         Dh0XeKNJHliUT0vv4nDcSVr5CuGqJFCE6bpiTT2qRgOgEb2FGNGWNvDX0laLnoNGJwZH
         0qqB2QRivmqJnqlV8iye/qtROWHIUG0nsJLvFbFeb0Z8MXFumxk9NC/R4JhpVG4l4dyQ
         Eya6SOBxa1ZyprYVExEk5ke2LGvZI42LQDo3AGT+wZCHs21by0cJr0ee3yojsfhumWut
         ux/+iGX8mkgVIL5vCiSuudB81tkyWEzdKq7BvNDndx0vA6CzNzhtPZq/z0mgi9vCszW1
         FddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700054898; x=1700659698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27kbaYc9o/j9wTLBAVP45tsETwTbQIy8zKNs3tAOssU=;
        b=diPFNfVFfTnU8LNwN055CtmLisrGj1PNASfXK81232GVTsyjrDyJsoe7KJ8NZVXf+b
         ImiRCqt0LBSYyB3Jk4y4wlslAQ2SmKmx2hAfKsAMkpbGGVQJd1Z/te56+CYxdlYHag/j
         pyR9eXvVHNuJd5SjlWntcYfQqsrtYts61dYQSvZ2iQIUg5GYZOugm27SEz2YAx65dXEv
         UwRN4DKoad+QPQ3rJM0QsuZ9cTILPFqn1nhkxLKMRut/9J6g5DPtfPDKfN2YyjWd1We7
         5kh01VZWl2AuTTHWTi79JsvFpiblxzK+r6uJDoeg35jDAXm96LeY52Si80EmOcp4klAk
         ag5g==
X-Gm-Message-State: AOJu0Yz66HGK5qdKSy2Ky+p9XGh5FoAaus0fe/vgRbr50crN+7Mz55GB
	HPJhpCN5uS0EYPHpI9aWbHlhdw==
X-Google-Smtp-Source: AGHT+IF1ifJjaPJepmn4jpc4ZHMqCS1sjn+6cBfSpPYvLaA1BjCWNuLVV5igC58y6bNOjVoqNakptg==
X-Received: by 2002:a05:6512:2248:b0:4fe:4896:b6ab with SMTP id i8-20020a056512224800b004fe4896b6abmr2401582lfu.15.1700054897725;
        Wed, 15 Nov 2023 05:28:17 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id l12-20020a19c20c000000b00507b1da672bsm1648705lfc.174.2023.11.15.05.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 05:28:17 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Nov 2023 14:28:15 +0100
Subject: [PATCH 2/2] Hexagon: Make pfn accessors statics inlines
MIME-Version: 1.0
Message-Id: <20231115-virt-to-phy-arch-tree-v1-2-8b61296eae73@linaro.org>
References: <20231115-virt-to-phy-arch-tree-v1-0-8b61296eae73@linaro.org>
In-Reply-To: <20231115-virt-to-phy-arch-tree-v1-0-8b61296eae73@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, 
 Brian Cain <bcain@quicinc.com>
Cc: linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-hexagon@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_052819_875916_91B3DE23 
X-CRM114-Status: GOOD (  10.50  )
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

For symmetry do the same with pfn_to_virt().

For compiletime resolution of __pa() we need PAGE_OFFSET which
was not available to __pa() and resolved by the preprocessor
wherever __pa() was used. Fix this by explicitly including
<asm/mem-layout.h> where required, following the pattern of the
architectures page.h file.

Acked-by: Brian Cain <bcain@quicinc.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/hexagon/include/asm/page.h | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/hexagon/include/asm/page.h b/arch/hexagon/include/asm/page.h
index 9c03b9965f07..10f1bc07423c 100644
--- a/arch/hexagon/include/asm/page.h
+++ b/arch/hexagon/include/asm/page.h
@@ -78,6 +78,9 @@ typedef struct page *pgtable_t;
 #define __pgd(x)       ((pgd_t) { (x) })
 #define __pgprot(x)    ((pgprot_t) { (x) })
 
+/* Needed for PAGE_OFFSET used in the macro right below */
+#include <asm/mem-layout.h>
+
 /*
  * We need a __pa and a __va routine for kernel space.
  * MIPS says they're only used during mem_init.
@@ -125,8 +128,16 @@ static inline void clear_page(void *page)
  */
 #define page_to_phys(page)      (page_to_pfn(page) << PAGE_SHIFT)
 
-#define virt_to_pfn(kaddr)      (__pa(kaddr) >> PAGE_SHIFT)
-#define pfn_to_virt(pfn)        __va((pfn) << PAGE_SHIFT)
+static inline unsigned long virt_to_pfn(const void *kaddr)
+{
+	return __pa(kaddr) >> PAGE_SHIFT;
+}
+
+static inline void *pfn_to_virt(unsigned long pfn)
+{
+	return (void *)((unsigned long)__va(pfn) << PAGE_SHIFT);
+}
+
 
 #define page_to_virt(page)	__va(page_to_phys(page))
 

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
