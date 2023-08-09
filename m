Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB788C001B0
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Aug 2023 08:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbK5WjNGweMS8pt6l6hXo0IUazwd02EPIj+AYjWLwaw=; b=srPJALKVfHgupJ
	0xe+lWocvcBgxFR7f4AHYw+jn7coyQFyhall+5cX1OqkqDrPm6k7BoOT+nXGvyzpxgLyDjrTof3Lb
	LC3p7KoWB8t69ApdEFjzw0QxShRjOPCtyuOWNk6Dc1fVDhIvpMnkktsIAORUI373EP8IhEhdrhzaA
	yo2MxNU0HKkA+WmDjj9AWPKlucn8d7iHOW3IWOnhfV5yVNIiK31DcsLGzwscdmsKfUFGSldnL1zIm
	QisFZB/34ZhfNEn8VfJxx937Elq5l6sZszhtM2i+pwkB3jxTXVT22DfpIUOw7u5w7Za9c38UtrejP
	Ouj0Dk8I62uaBE2rrBFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTeKZ-004LCG-17;
	Wed, 09 Aug 2023 08:14:11 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTeKX-004LAB-0N
	for linux-snps-arc@lists.infradead.org;
	Wed, 09 Aug 2023 08:14:10 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fe21e7f3d1so10767380e87.3
        for <linux-snps-arc@lists.infradead.org>; Wed, 09 Aug 2023 01:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691568844; x=1692173644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPNuwr8BV2crYdR1HSxa9CVFwtJ2x4ORzKRyFk7VJAs=;
        b=S3NUfjB4bsVe9j6vOvkgbzCiTwC+/LUZKHOJA+DVd1hF79XKEdcJLk5HeANwSJMNbE
         wFpiDbSv79eoDUKbFvABoRC4bzoj14hmJCAJZ+IEaSBva/ry7TZMziatdW3YEqIdCjgB
         YulVLM079c0A02u23M9dDfoB9cMLWz0IkCBNCjYoMH6qyb1qOSwKadguXMuWw3CgQUVQ
         0+9kRZjClq3de5Y0DtfavbxvkIy/dspo/iG+vratIzTwZtvaM+YMiU76D9uExhAgJoxH
         7UE9kG79yVX/aXKS7E+0xBKcFA0aQMmaJjFSi5930Xbdy/54AMjv26QFYnm5g9zPIY59
         7OpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691568844; x=1692173644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPNuwr8BV2crYdR1HSxa9CVFwtJ2x4ORzKRyFk7VJAs=;
        b=PfVVS9mPh3c0r8i0ZNHbKO9WMBP1f12odHYxyzu+mjz9KfX+8xSXmvkLhoNllBNTgG
         zfns6vLV/wtBj1q+qQiQgGY5DcIxCJvFM/jMUs50yeFXdUFr3XlRKWk+KQvL/aXtPmXl
         rVMSIR9Xer6A9tNWEcpnPArvVt/OXKlWoJH+1A9YQpBGjGXXgeuQ1T47X5KzQ9y7cu+P
         7Tu9LHQRfcnHS9NHbop/DPahSliEZdMqDwBd33+PfluiJ6l/bvP4Ny/LzGwxnpg3krwu
         Jih1kqjI7dbZhuwtDymSQuWYNf4Ona0FPINV8N57E40RyPhRLuBbPp6IKzZ7kQ7Bkdod
         +AWA==
X-Gm-Message-State: AOJu0YwSdp31PxezgcI/ErIL3yYS9WyyXSGorEEN+5ns1dlepCTNmtY6
	2hiRr9NKkBZhbeaA56H33sD+Ow==
X-Google-Smtp-Source: AGHT+IGFV6oMEHkHKUKwQzLqMtPfeM/T6iurCa7KQ+Aco/96KR8LzXnX/g855E8IYulDBfcHTtWs6Q==
X-Received: by 2002:a05:6512:3d24:b0:4f9:571d:c50e with SMTP id d36-20020a0565123d2400b004f9571dc50emr1501208lfv.36.1691568843947;
        Wed, 09 Aug 2023 01:14:03 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id w12-20020ac25d4c000000b004f84a92ba75sm2196916lfd.65.2023.08.09.01.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 01:14:03 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 09 Aug 2023 10:14:01 +0200
Subject: [PATCH v2 1/2] csky: Cast argument to virt_to_pfn() to (void *)
MIME-Version: 1.0
Message-Id: <20230809-csky-virt-to-phys-v2-1-2697c93f60cf@linaro.org>
References: <20230809-csky-virt-to-phys-v2-0-2697c93f60cf@linaro.org>
In-Reply-To: <20230809-csky-virt-to-phys-v2-0-2697c93f60cf@linaro.org>
To: Vineet Gupta <vgupta@kernel.org>, Guo Ren <guoren@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-csky@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_011409_180304_E738765B 
X-CRM114-Status: GOOD (  10.97  )
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

The virt_to_pfn() function takes a (void *) as argument, fix
this up to avoid exploiting the unintended polymorphism of
virt_to_pfn.

Acked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arc/include/asm/page.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
index e43fe27ec54d..02b53ad811fb 100644
--- a/arch/arc/include/asm/page.h
+++ b/arch/arc/include/asm/page.h
@@ -108,7 +108,7 @@ extern int pfn_valid(unsigned long pfn);
 
 #else /* CONFIG_HIGHMEM */
 
-#define ARCH_PFN_OFFSET		virt_to_pfn(CONFIG_LINUX_RAM_BASE)
+#define ARCH_PFN_OFFSET		virt_to_pfn((void *)CONFIG_LINUX_RAM_BASE)
 
 #endif /* CONFIG_HIGHMEM */
 

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
