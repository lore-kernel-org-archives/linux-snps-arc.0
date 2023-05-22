Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3973CC77B75
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 May 2023 07:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEE6tsuQ73z5tRx4dfU+sOXyX+r+tduPo4cmBSef4YA=; b=RGmEgIdTaHTHqc
	c9k0BnSix1aBqBs8MITJgRM1jZ0oFhQ39reBu9mo7DMvo3ngBbqGv8BtIRW249Jgt+TJtA6QmSXrG
	feFwci6rLJbkvj3w+vUlptnJk8heWR8ePsgfe/JWwAuX099F0bLz2e84bFUYJk0o8TfVMfvM1yopk
	2gItUClZlYqV8ZHUpLVTLN3LYF+QXSAflTaIO+y2ltlRbFKzLcLlsburwx+Uriu6TGA0vGV/kMajh
	2DMHqsYhovrTTU4UeoOrJFZwlLKUGMFpRSRbrsfMuuEU3dHeciZWcH920+sbWEOnYADZxBhDeeHgf
	JhQRYPBfKa3cYGOS6J2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zXb-005ZTA-0Q;
	Mon, 22 May 2023 07:01:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zXH-005ZIr-2C
	for linux-snps-arc@bombadil.infradead.org;
	Mon, 22 May 2023 07:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=SZOtWVS1lCOxds2QCY7M+hAIKv6XvV3Hqis31ERV0mU=; b=dmoOPWeczO3uul7iHJ9JTRI7Xz
	klgTZM+zvP0ByQ0Rw10Nh4ecMPo4qWRHtmkTKdtbAJ14qRayEmkVZAJwKE5TY4dj7/Gdw0RA2lXQ7
	yLJnHVd1I3ER1yLAV/s0h+kkXvTuf02vzVd2AxTS+sWFO/qvVF/i6P/faZQJFQDSslIkZsKK1kUTn
	/C1VlVZQ3VpSS/Of3XEumG/rWaHfNEZ+3p1yuFflI5TNn0AHoVDJit8MQEM5cyix+cMKkhrhNl/DR
	D/TuUslC79G2DhFTZ+9LXWzgHY5N/5ngzqP47ClL+qHy4nWB1Rv9rAqokaBiHrcrskEVEBNtIkbJr
	npendrWA==;
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zXD-001xbh-1L
	for linux-snps-arc@lists.infradead.org;
	Mon, 22 May 2023 07:00:49 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2af2db78b38so22152531fa.3
        for <linux-snps-arc@lists.infradead.org>; Mon, 22 May 2023 00:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684738842; x=1687330842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SZOtWVS1lCOxds2QCY7M+hAIKv6XvV3Hqis31ERV0mU=;
        b=HPynyF9dBnm8kzZsPMGuzG4tGQ0wQ3Xr3WZ6xD7T/LfVcLe2V89yhp9749clY9crPm
         qG+Ir4rpDSBK6txtleKSHHAoDkcHodUiVZEGspM78lo5oN/1e608teWeY9dzCA81mmGY
         3yD/wym5h4WqSG+LrMozqn4fKUqn/qUP59x8v5zFk9cHktPKlbrYTkPbim+gsAhI7K0m
         5w8V6qXvcsdSkuS2CIyEV8/smObrHzuoNcRONSSEORXDMznpyIH08pgdb9ej7EcewhPn
         nAN3lOIxQfwpuzpgrFnVMITkhgAvyIakdv0L6ph868VTBX1lS5f2Q1HzQjhTiA+la9hW
         2/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684738842; x=1687330842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZOtWVS1lCOxds2QCY7M+hAIKv6XvV3Hqis31ERV0mU=;
        b=C+WxTM2rjPDj6vz+l7AHFOQk3ZIvMLdG66n7gRSaHLtkav3U16pgi8SrCOdd3u1k0r
         CIguOLTk8JXKi3SAGHudcqDqk2V4qtzJyDvGZbx2r18ZBpu/9+/JRSX6WogaPY+SC/UD
         1Yz/CmHFicfVKucJZUeP1XTgsu77yPtbJ0nhL29KO31mDXQF9tgRdi1ADFix9yhpXBRM
         mDwB0F46Yl4aCz2LslZVa0Gg9s77maYy5IXvPF5OZ4Nc+GZiKikDXv5Wz61y/08Q844u
         q3ItvjbHNfRBcCEd0mCNDzNVobU3G9RXOXZoVccfHj61v9rrIotcp6dQ1QBhIEcHV+JQ
         H0wg==
X-Gm-Message-State: AC+VfDx/11ngT+GA/XQWEj8WHqPHZqSCWl2no9HbAduC8VFyK8kLi8Xc
	ddfbEKXH7wZqiVTw3gjldqpWVuJ/pQYfXqmgl9Q=
X-Google-Smtp-Source: ACHHUZ5zHTlDIUBFfM+ANh6yrJchD5XWnUCxgGUoFmdvR1n+C8XuEEFdLcvym28BDAgE2gGiolXH+A==
X-Received: by 2002:a2e:a40d:0:b0:2a8:bd1f:a377 with SMTP id p13-20020a2ea40d000000b002a8bd1fa377mr3256924ljn.20.1684738842484;
        Mon, 22 May 2023 00:00:42 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id q4-20020a2e8744000000b002adb98fdf81sm1010187ljj.7.2023.05.22.00.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 00:00:41 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 May 2023 09:00:39 +0200
Subject: [PATCH v2 04/12] riscv: mm: init: Pass a pointer to virt_to_page()
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v2-4-0948d38bddab@linaro.org>
References: <20230503-virt-to-pfn-v6-4-rc1-v2-0-0948d38bddab@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v2-0-0948d38bddab@linaro.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-mm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-snps-arc@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org, 
 samba-technical@lists.samba.org, linux-arm-kernel@lists.infradead.org, 
 linux-arch@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_080048_168247_14232529 
X-CRM114-Status: GOOD (  12.65  )
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
