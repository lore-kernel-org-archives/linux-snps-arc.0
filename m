Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD8DC7EE2D
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 May 2023 15:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEE6tsuQ73z5tRx4dfU+sOXyX+r+tduPo4cmBSef4YA=; b=H9DOJAkuZpudrP
	oO3ur88Lhhhzs/I95XGWuq8u4jhv97VtLm5rmC3AmGWMNZ5pFyY2yZDxqxtZRxo2kNn5GRsn4U8Zc
	n89q7+glqppHO/cql12cDNLciO44ZgyVr0jDfFXaHSjHI1tK0D046upI5dZtTeBPY0PYUScLC1UrX
	FlLT+cJUJmvDRavUrvhz51rozEsT3AG4enrxUKdbiaFxFEQLJ5R72MRQqoSbiluIeE9m3xzjaCgSP
	jEubd7P5g4K+mukGJKsrxs5Z7ffqHGpDfrY+saIgBLxnIkH8ouHfKH9SIM6sORZf2xQPHWJSqoOfA
	JB0bs6+AhYe4KpDesWQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Tnv-00AcP4-20;
	Tue, 23 May 2023 15:20:03 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Sf5-00ASLG-0H
	for linux-snps-arc@lists.infradead.org;
	Tue, 23 May 2023 14:06:52 +0000
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-4f3bb395e69so3564108e87.2
        for <linux-snps-arc@lists.infradead.org>; Tue, 23 May 2023 07:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850749; x=1687442749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZOtWVS1lCOxds2QCY7M+hAIKv6XvV3Hqis31ERV0mU=;
        b=jQFz6Zi2QlqzFhgg609+OdU2cVzXhTGama6kh7r3qdlPmt1t9W7hOhsu94u+OwaOb4
         qZCyO9HFjWxC1UNvj7aH4gjawmqX/FfvnrnEMqAdWBJ1gKgK3OsCh2be1l8goABkGeca
         4qq5vjGppvB0Ff3wZVKpQwbjqPgJrSjep7pLQRAqJ0vCR1bSNUwj/9E5GGjNWZG6UBIQ
         laVwoCR2Q+OLiyyzutCe6jstO9ARgNPtspYX4FMnjz5PkCuGHkQ+phxAPeufD6G8i1or
         2yIWRKaSDcAN6pWjBjwXMvm/DRKg3Ys05cggpxTJlPQbn2mQmxpWJNhzydJrgvcQ4AmW
         jBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850749; x=1687442749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZOtWVS1lCOxds2QCY7M+hAIKv6XvV3Hqis31ERV0mU=;
        b=KmLm7pzKAI82r6h69+R8pW32yE6lMTmQZNhpady056zZ0yzAdf+Y2JaQuZBKRisECw
         Qjft/96xmVThMCngu7CdChQ3bFD1bMT1FzpLnIXCrSsIIwPXyolMgOYL7QqFor6u2ukM
         u6OPo7CMdMUYKb5Y9UxNQ8yKSLJIVyRfhTqzL3JAFJwMDbBN+HlIQqiWmRhJVPntLEVE
         z/TzFc8aV/k0hq3lpVpLfG0dv8uAieNQnqD0LXSh3S4YFh3fSNmXiMC2hjGW/yOB0B1C
         dRchO/xfzF/kjbTEDk668wjF2SK+okV+KFElehTw/eo6MPcBHzdHlICsjowAB1dt0Bu1
         LdEQ==
X-Gm-Message-State: AC+VfDwGioihIJc4eV4Y7K/nUwSlgmKr/6IFI3QJ0/+rx7bfnkEZ4Zvu
	gEOxeHwYmr+26bWkkVtMxjxidw==
X-Google-Smtp-Source: ACHHUZ7//7IWxqZNm6Gka+LjfJMyuUS9SSINKAocHmPnom7yVCqmEeps0sj76NQaN9sPKxOw8HiGaQ==
X-Received: by 2002:ac2:593c:0:b0:4f3:b588:48d0 with SMTP id v28-20020ac2593c000000b004f3b58848d0mr3291847lfi.14.1684850749081;
        Tue, 23 May 2023 07:05:49 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id h28-20020ac2597c000000b004e9bf853c27sm1346562lfp.70.2023.05.23.07.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:05:48 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 May 2023 16:05:28 +0200
Subject: [PATCH v3 04/12] riscv: mm: init: Pass a pointer to virt_to_page()
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v3-4-a16c19c03583@linaro.org>
References: <20230503-virt-to-pfn-v6-4-rc1-v3-0-a16c19c03583@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v3-0-a16c19c03583@linaro.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-mm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-snps-arc@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_070651_148210_09C8E99A 
X-CRM114-Status: GOOD (  13.14  )
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

Functions that work on a pointer to virtual memory such as
virt_to_pfn() and users of that function such as
virt_to_page() are supposed to pass a pointer to virtual
memory, ideally a (void *) or other pointer. However since
many architectures implement virt_to_pfn() as a macro,
this function becomes polymorphic and accepts both a
(unsigned long) and a (void *).

Fix this in the RISCV mm init code, so we can implement
a strongly typed virt_to_pfn().

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/riscv/mm/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 747e5b1ef02d..2f7a7c345a6a 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -356,7 +356,7 @@ static phys_addr_t __init alloc_pte_late(uintptr_t va)
 	unsigned long vaddr;
 
 	vaddr = __get_free_page(GFP_KERNEL);
-	BUG_ON(!vaddr || !pgtable_pte_page_ctor(virt_to_page(vaddr)));
+	BUG_ON(!vaddr || !pgtable_pte_page_ctor(virt_to_page((void *)vaddr)));
 
 	return __pa(vaddr);
 }
@@ -439,7 +439,7 @@ static phys_addr_t __init alloc_pmd_late(uintptr_t va)
 	unsigned long vaddr;
 
 	vaddr = __get_free_page(GFP_KERNEL);
-	BUG_ON(!vaddr || !pgtable_pmd_page_ctor(virt_to_page(vaddr)));
+	BUG_ON(!vaddr || !pgtable_pmd_page_ctor(virt_to_page((void *)vaddr)));
 
 	return __pa(vaddr);
 }

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
