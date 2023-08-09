Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D13C41513
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Aug 2023 08:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79ky5j617C7gwBrBeoTqNhemeCaz7pLOgenH+QiUeIA=; b=zU+Sjmk/5KLSLQ
	9xnzejfLIFYxMZF59QnH5wTNpyat/+s13sTZSAO2w/ZqpPKNwL96m8r64DB8l4PvuOpc3yqSktQzA
	TXANI40ANRUn3k6RkLVE+4qUasFUjNauRAKoNN1XVeHQZVKZ/DYfCmICx3ozkEtewVcBrpE3vBHfS
	IuSip5CbeiH925WJtgq17AYo2IikQ0CrpHWupX5tmUXx6Y4vqWFAHSFhhT61kNF2bfPvWmIGeK2wV
	TwatRBk2NZKOq45pah5ufgFauFEMHGeNhQ4RNnbhX1nIbRPnrHoyeHCsw+bw87ZUYST2UaIB+Y12p
	k73MqvleYsmjqotKtTlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTeKZ-004LCV-29;
	Wed, 09 Aug 2023 08:14:11 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTeKX-004LAF-0O
	for linux-snps-arc@lists.infradead.org;
	Wed, 09 Aug 2023 08:14:11 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so10569861e87.2
        for <linux-snps-arc@lists.infradead.org>; Wed, 09 Aug 2023 01:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691568845; x=1692173645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zTXAtK4LyKDOWesDbd7G0no9IFm0HYr1YL9cGl87EzQ=;
        b=AaZNvaOLHpTrWuNHOIAzKFkJD8Yhj84hT19T1S7uT/t4tAzdb7OJkojkl/IfOZM0ZT
         9OINRO5D+ZqlDOHj1/yMIimjGzifYxI4yS9+jjO4Xn+E6Vya6HLMzKt3k76Dg/VjFSMI
         PvMctNeBYwj67QOe5HCfNpg6SS6/OFsOV5WrJIYEy4YlQhsGyTgb2yhcsak2KrWHzLtr
         KVOcpMyQfhALHBin9A/U1b/I5aJw2ovXVaIN6hjIeRn7l1HHNMV3eZ9i7JiLNF6zYT9v
         O1a1qb9IK2i/+JXmfbv24ygVsmeoyP4XXvc1d+Q636+IwmVApXCHvdX5yKKaco2Q556t
         ONfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691568845; x=1692173645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTXAtK4LyKDOWesDbd7G0no9IFm0HYr1YL9cGl87EzQ=;
        b=izMJicisidDPT8XMQLjx0G2FJc6vZTKO3/xVyLfDppx8hquG2mtkZz/chxlevkqYhY
         L2HMhq/jujXfAvmNWtexMwBgmclBYbn9FjXn/S//cssWRWtnM2loofCCwvKw/7IUjLKk
         TOVMYU2huFuwuiMqzKiDb1GUv722fMORKgzrcYm+HpUh+vfJ851sY0bJCapg439N4M3d
         QHr48CQa6CFSwJdj6YWoZOks3ti2feMURtmXMQMoePOg/uLGApd2xkcUUKckpApLlsXK
         SGFN7F/0tKdOYMLCjfNz4LOUmDQU/jS+ZALXNGkK5ur/UJf/se47QioM8qPC64iqHJ2T
         3tWQ==
X-Gm-Message-State: AOJu0YwBYdBjxbNgaN+WH9CWJdM+4xxddLtemOavds4vSYwtdX/Q1gtC
	H5cJE9F1GunVXioVaF2ns++7IIrDFPoDW4NWxWo=
X-Google-Smtp-Source: AGHT+IEo8krRs8F/gpp8zmi1UGtwXUgDYy/Wh4w3IdCIabujY5wZOYPZK6TC/S1L29E7S+3sft7jKA==
X-Received: by 2002:a05:6512:2507:b0:4f8:770f:1b08 with SMTP id be7-20020a056512250700b004f8770f1b08mr1528563lfb.13.1691568844988;
        Wed, 09 Aug 2023 01:14:04 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id w12-20020ac25d4c000000b004f84a92ba75sm2196916lfd.65.2023.08.09.01.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 01:14:04 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 09 Aug 2023 10:14:02 +0200
Subject: [PATCH v2 2/2] csky: Make pfn accessors static inlines
MIME-Version: 1.0
Message-Id: <20230809-csky-virt-to-phys-v2-2-2697c93f60cf@linaro.org>
References: <20230809-csky-virt-to-phys-v2-0-2697c93f60cf@linaro.org>
In-Reply-To: <20230809-csky-virt-to-phys-v2-0-2697c93f60cf@linaro.org>
To: Vineet Gupta <vgupta@kernel.org>, Guo Ren <guoren@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-csky@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_011409_180458_EEEA2B5E 
X-CRM114-Status: GOOD (  10.01  )
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

For symmetry to the same thing with pfn_to_virt().

In order to do this we move the virt_to_phys() and
phys_to_virt() below the definitions of the __pa()
and __va() macros so it compiles. The macro version was also
able to do recursive symbol resolution.

Acked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/csky/include/asm/page.h | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/csky/include/asm/page.h b/arch/csky/include/asm/page.h
index b23e3006a9e0..57b3f106ae77 100644
--- a/arch/csky/include/asm/page.h
+++ b/arch/csky/include/asm/page.h
@@ -34,9 +34,6 @@
 
 #include <linux/pfn.h>
 
-#define virt_to_pfn(kaddr)      (__pa(kaddr) >> PAGE_SHIFT)
-#define pfn_to_virt(pfn)        __va((pfn) << PAGE_SHIFT)
-
 #define virt_addr_valid(kaddr)  ((void *)(kaddr) >= (void *)PAGE_OFFSET && \
 			(void *)(kaddr) < high_memory)
 
@@ -80,6 +77,16 @@ extern unsigned long va_pa_offset;
 
 #define __pa_symbol(x)	__pa(RELOC_HIDE((unsigned long)(x), 0))
 
+static inline unsigned long virt_to_pfn(const void *kaddr)
+{
+	return __pa(kaddr) >> PAGE_SHIFT;
+}
+
+static inline const void * pfn_to_virt(unsigned long pfn)
+{
+	return (const void *)((unsigned long)__va(pfn) << PAGE_SHIFT);
+}
+
 #define MAP_NR(x)	PFN_DOWN((unsigned long)(x) - PAGE_OFFSET - \
 				 PHYS_OFFSET_OFFSET)
 #define virt_to_page(x)	(mem_map + MAP_NR(x))

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
