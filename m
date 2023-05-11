Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB15C7EE2F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 May 2023 12:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rkH75OUp8BSuLxyFqmmyRBsE/0nXfQulXxdnoLomAzA=; b=A0QjqUxKDghEay
	vQmIUtg3/X5et4UrU+c/HnegsKisXGgrZxazuMCG6tvD9c/R/yljPC2iHeCA1JFiWcJw8eoGwJKBm
	Edo8pQCSQvASbrodEdPo2MROLxCD1D4pJubJqnbUgWiLhkzQZU7nhXZc2zDeUmv0z5bB6larX1nqa
	CkkiJof28XijEq/MEE7sBhQcve5f6Ly/gUfS2bqxpkJlyVkYIqvnGHg21msBIxdMLaLFPLkTK8AFD
	IYvgLo5XfAu9NrCS6GYx6C8YwCiwql3Q1YXvEsBZv8Jr4BQkWN0922HbDTMvyyZ9VUEJzuQsAWp3p
	iGXY1s+sLnQeYyT+N4TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px4yC-008hO5-12;
	Thu, 11 May 2023 12:00:28 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px4y5-008hKj-1S
	for linux-snps-arc@bombadil.infradead.org;
	Thu, 11 May 2023 12:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vHjA668SX6CTsxzYO8Z8nc4Ecy//EJfwtQFWj2t6kqU=; b=nnthXaMLTM//lgCbXolBuBXPdX
	X8FfpRtEfqa/yuEiQZ6/bchR/hE4Gaou2RTqhRLSt8lZqYh2ZGJ97VdqB3fN1dxLlW+oAyRV+XWc9
	fHFJLETrHqkcPzxLrrC6tklqodFE7LX694wOQbcJ08LqMvBWoJT+ccBVj///kmR4vSKnl7IOAnuqV
	p9TM+ox/kEZnDejg0Kl3JOkR3AO40gMtEwdIJlBDpjbMZNrNxpc2LZoraCLubVM+cizqwOMRRxFV+
	Undw+Z5DrauQjcj3tyqZ3mLEdaveqTyX5TrsFW9k32KtocCU4URqVCe7XtTaZr99nRJ+oBV3tsFcX
	dPwtV5xg==;
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px4xv-008Dk3-1b
	for linux-snps-arc@lists.infradead.org;
	Thu, 11 May 2023 12:00:16 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4eff50911bfso9475433e87.2
        for <linux-snps-arc@lists.infradead.org>; Thu, 11 May 2023 05:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683806399; x=1686398399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vHjA668SX6CTsxzYO8Z8nc4Ecy//EJfwtQFWj2t6kqU=;
        b=Kbc555pcdKJLogrS9D2fpTuZbCLYtRRslUUmtE3xLf7EzdNZYf1OzcE9wV1Z90iGk3
         NIk4MKV6b+X0k2N3VL5lQ56i9UXtaetINfk3JT4UgzFD7yBuaWIOfZWXEKT5PzupCvP/
         bamqIQqMgGCRriAPRj2xemXl7nSVYfhgFkSm0NP8XdgPgFP+JDpOUwXIwzQsFylS4IVi
         tfsy8c7iyORHTNygYljmk4DBR7XlBqGcbH84OblELC60Ek8nQDNUr7Skn4YvyNLuLFxu
         E+aTQ0Z1NbLg7cPj3DH6p8fVNfeCCf6YY3IJLOUYGk/XToeDr9UU3eGzOCWV1mI1abGA
         My9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683806399; x=1686398399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vHjA668SX6CTsxzYO8Z8nc4Ecy//EJfwtQFWj2t6kqU=;
        b=MdEFw1s4MG3PmPdfxFpXe4bhYJJNNN0qLBnY77gGmgObnVpdd5uV6HX92hgJYhiEB1
         BDyLr+MTaBwCibj/fSwryhwjheoSJroMcoeyWjCFdQ5qO+tT0rcygX4HQ73TKJYP4VII
         P/jxUfstR5HY3caS2HHCLb1lMyCYJZ2EoI7s5spoahFQyjh3k+PbTHcZWUvViGTSzLgB
         bWL4kNxZQufIKWiHRrye3HCLmJFH4kWpQjv09KkEG+oFc6hx+GF0mC1URhHYK7MDyyUt
         YYRDLbS46SgDAvnddTCKnldva3Kgiz5irHDwYmXA+2+ZGvnMiULjpEaQ60+dH4izowdJ
         NOZA==
X-Gm-Message-State: AC+VfDzG/qFzce5fSds7BXoFVL9uzsvElbr50MYpv5gmaaAkAZGkDvD8
	1qUtsOLx0w6ZYYs6it6nrl2B/A==
X-Google-Smtp-Source: ACHHUZ5Tk4UWnqnRlmgGPDZhdIZdZccQAMG3sQLb+3VXhq0OP50ACPtrgCCvBe8ZpLc4O18r3rteNw==
X-Received: by 2002:ac2:4e51:0:b0:4ee:e10f:8e5d with SMTP id f17-20020ac24e51000000b004eee10f8e5dmr2439363lfr.4.1683806398938;
        Thu, 11 May 2023 04:59:58 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f16-20020ac25090000000b004cb23904bd9sm1100841lfm.144.2023.05.11.04.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 04:59:58 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2023 13:59:29 +0200
Subject: [PATCH 12/12] m68k/mm: Make pfn accessors static inlines
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v1-12-6c4698dcf9c8@linaro.org>
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
X-CRM114-CacheID: sfid-20230511_130012_066016_BA509006 
X-CRM114-Status: UNSURE (   9.03  )
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

Making virt_to_pfn() a static inline taking a strongly typed
(const void *) makes the contract of a passing a pointer of that
type to the function explicit and exposes any misuse of the
macro virt_to_pfn() acting polymorphic and accepting many types
such as (void *), (unitptr_t) or (unsigned long) as arguments
without warnings.

For symmetry, do the same with pfn_to_virt().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/m68k/include/asm/page_mm.h | 11 +++++++++--
 arch/m68k/include/asm/page_no.h | 11 +++++++++--
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm/page_mm.h
index 3903db2e8da7..40bcc6aa33da 100644
--- a/arch/m68k/include/asm/page_mm.h
+++ b/arch/m68k/include/asm/page_mm.h
@@ -121,8 +121,15 @@ static inline void *__va(unsigned long x)
  * TODO: implement (fast) pfn<->pgdat_idx conversion functions, this makes lots
  * of the shifts unnecessary.
  */
-#define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
-#define pfn_to_virt(pfn)	__va((pfn) << PAGE_SHIFT)
+static inline unsigned long virt_to_pfn(const void *kaddr)
+{
+	return __pa(kaddr) >> PAGE_SHIFT;
+}
+
+static inline void * pfn_to_virt(unsigned long pfn)
+{
+	return __va(pfn << PAGE_SHIFT);
+}
 
 extern int m68k_virt_to_node_shift;
 
diff --git a/arch/m68k/include/asm/page_no.h b/arch/m68k/include/asm/page_no.h
index 060e4c0e7605..f1daf466a57b 100644
--- a/arch/m68k/include/asm/page_no.h
+++ b/arch/m68k/include/asm/page_no.h
@@ -19,8 +19,15 @@ extern unsigned long memory_end;
 #define __pa(vaddr)		((unsigned long)(vaddr))
 #define __va(paddr)		((void *)((unsigned long)(paddr)))
 
-#define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
-#define pfn_to_virt(pfn)	__va((pfn) << PAGE_SHIFT)
+static inline unsigned long virt_to_pfn(const void *kaddr)
+{
+	return __pa(kaddr) >> PAGE_SHIFT;
+}
+
+static inline void * pfn_to_virt(unsigned long pfn)
+{
+	return __va(pfn << PAGE_SHIFT);
+}
 
 #define virt_to_page(addr)	(mem_map + (((unsigned long)(addr)-PAGE_OFFSET) >> PAGE_SHIFT))
 #define page_to_virt(page)	__va(((((page) - mem_map) << PAGE_SHIFT) + PAGE_OFFSET))

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
