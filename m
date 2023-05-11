Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B76C7EE22
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 May 2023 13:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8r7j+p60e+ME238esxX3utd4wshgKLl29DGgK3g2Z80=; b=oxCTs5YobgFdE+
	ICOpL7pmOEB/6eaSFIRCr8X8e1+JHOBiaGd84Ds2E1X6VRMG4JJm488JLD5cpr7j0qaXwzkTUbaZm
	qXZJJbhS7aRio7Qi9NscvvJftsrMzY+xirpgcJAY8ZXf6CF0QnoNTRq7nbEulKG1zR0uXD52VuU9a
	NnOpWUP6nvYqmsOg8+w8DItIZiJF98sVLOCGyAHMN9siAA6EGRLVJ7lHkMVpinQK3JqRUIwm0p2T7
	AoNTHBPgM+LrXeCBnhdqeeX+lbagT5l5761njJk24kH2cd6XoDTaEbWYbLJa8wLkCWzdExUz6sJp+
	AeLoIfIcdtdcRla+y+fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px5uy-008nOY-2a;
	Thu, 11 May 2023 13:01:12 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px4xh-008h7J-2j
	for linux-snps-arc@lists.infradead.org;
	Thu, 11 May 2023 11:59:59 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f26f437b30so501326e87.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 11 May 2023 04:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683806397; x=1686398397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJU163QagIQsrvP5Rw+8jaAtPEKkrWxHz6dgH9Ny+pM=;
        b=OVzygYKFGH1TTuxbFUj+CoSj3NrTaizXuR71JpjrxDkWl2PVUYhH5JT70fm6co/+NH
         tgSpK7iB7XOIFx/oZ27wrlRvxiiOU0TkhphL4Cjxz38b+G77ryH+u4qiryaQVZOcLNF0
         H0/G73Db2ZLdNZ+R+FwIBPtPTT8FO9chca9MkRhxDx0g0MNcweB6mimyP670IWhPwMJJ
         Zi33byy7BPYmwDP7tGDqy3rZxw7unhbkfjS7DQcxkZzUfpvfhpgVrM2yoH5+zUDj/FTE
         k6lQKniemblf8dnVu3vStZsdx03og3rxM39S2DuvQLZfuDbOnEOTZqUyvlVqW9qAn7Vc
         1b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683806397; x=1686398397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJU163QagIQsrvP5Rw+8jaAtPEKkrWxHz6dgH9Ny+pM=;
        b=O9w66mCnRj0VwKXnTk/XZjc2yZTzjJQG0792ADLft/KgVpjaQ5JzKb9liy/KhxCxe8
         3hB1dzszz81mEtf5xhItlGLz/D0+pKJO0md3eGrBV+CuO7gW2DWSkiGr2TAmLfqs1McN
         rvqUtG+/fKfqsgZYCkAqVId6qDOsq/imz9H+NmrpFhytBD4/UU3zjFwvCh/NYCCbXWeD
         BiY0ldj2Dl17UyxAVcVUDnFRCnYoWqZIQGshS2fADTfHpSx+k6Zvy4CwOMvHmpi48PAH
         hfQ0xd5CdlVJE9xeFp61kwSV6Em+q7tohD0x4VHJVZLbEoJnzp1A4JXOBl5krUzxPRqk
         V7Jw==
X-Gm-Message-State: AC+VfDyoewVdtxf9VeapxNFpM7sGE5xm7BrjOe2VHpJ24pQeHNhWZGcq
	IjR4IYAxZOY3kkq/fPst+ImljQ==
X-Google-Smtp-Source: ACHHUZ7ZE/nf3YvAX+fWh9Dbm/hshMVwzXisVNx+UvqRN2YZL2q+Z1orbXsbt6AiZ+R2G9hM4ez+dQ==
X-Received: by 2002:a19:ad43:0:b0:4ef:d5fb:c37c with SMTP id s3-20020a19ad43000000b004efd5fbc37cmr2214552lfd.69.1683806397378;
        Thu, 11 May 2023 04:59:57 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f16-20020ac25090000000b004cb23904bd9sm1100841lfm.144.2023.05.11.04.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 04:59:57 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2023 13:59:28 +0200
Subject: [PATCH 11/12] arm64: memory: Make virt_to_pfn() a static inline
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v1-11-6c4698dcf9c8@linaro.org>
References: <20230503-virt-to-pfn-v6-4-rc1-v1-0-6c4698dcf9c8@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v1-0-6c4698dcf9c8@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
 Vineet Gupta <vgupta@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Russell King <linux@armlinux.org.uk>, Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 linux-snps-arc@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_045957_909958_6334B0F0 
X-CRM114-Status: GOOD (  10.42  )
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

Since arm64 is using <asm-generic/memory_model.h> to provide
__phys_to_pfn() we need to move the inclusion of that header
up, so we can resolve the static inline at compile time.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm64/include/asm/memory.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index c735afdf639b..4d85212b622e 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -331,6 +331,14 @@ static inline void *phys_to_virt(phys_addr_t x)
 	return (void *)(__phys_to_virt(x));
 }
 
+/* Needed already here for resolving __phys_to_pfn() in virt_to_pfn() */
+#include <asm-generic/memory_model.h>
+
+static inline unsigned long virt_to_pfn(const void *kaddr)
+{
+	return __phys_to_pfn(virt_to_phys(kaddr));
+}
+
 /*
  * Drivers should NOT use these either.
  */
@@ -339,7 +347,6 @@ static inline void *phys_to_virt(phys_addr_t x)
 #define __pa_nodebug(x)		__virt_to_phys_nodebug((unsigned long)(x))
 #define __va(x)			((void *)__phys_to_virt((phys_addr_t)(x)))
 #define pfn_to_kaddr(pfn)	__va((pfn) << PAGE_SHIFT)
-#define virt_to_pfn(x)		__phys_to_pfn(__virt_to_phys((unsigned long)(x)))
 #define sym_to_pfn(x)		__phys_to_pfn(__pa_symbol(x))
 
 /*

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
