Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5464C7EE22
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 May 2023 11:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S8c4K/pvXMARlP06nLeQmPJqg4PPJ7tmNDPfusSkhH4=; b=enycg0Ye6sZT3J
	Sbxz46htoEeb3L6R0HP5SadoS0EAmL7UWuPjfcHKbzBHuIo0EFJEiAd2ALtaKipOokA7Xe2jOJUsG
	rwIMfTB772I3IEUkmYOtzN1q4cBfytknV5eVGGm4wQQQUvGIg5FuFIDWgPyYSXejwvyaaENj1YJDS
	KvzEQh+ylxG0mcOvjBs9Mnr9wZbARrtEtTYGudKtFnF5UvFj8yY4tXHTafHP37aOZMHSayob4Kc5e
	JoZhTIAQzO78Q/xNS++kOe/ldrLGmm6XiftmpG+jKLoeo6Jzlm7nlFDvufx0drNioPhNO/kOCfLsp
	5IV1qACv3sL/FRPwVbWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px4xf-008hCl-2M;
	Thu, 11 May 2023 11:59:55 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px4xa-008h7J-2C
	for linux-snps-arc@lists.infradead.org;
	Thu, 11 May 2023 11:59:53 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f26f437b30so501130e87.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 11 May 2023 04:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683806389; x=1686398389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2CPc/Vm/Ur0JOy8kF/L6fs0qWXc+VKBrwCqiZQE3hiQ=;
        b=us1qr2gpwQ3bBAky0xvbHlSTRCtb1nydasm8z39XkazIJzESLaqNzEYvSDrqWvBqBX
         4xcES64hit/N9fYugYwoV5W3g4eBVSitwsbnnifZ0lNM9KhPgKlQsFulFvXvE2t+KR4U
         ORQ5OFqloYcfrHKwTO12OVVscWtd5hVcDmECRKCgjTthI9wyAS5zhkAj5RdT8DId2mTE
         5+ejX9H2q5kq1KWIA7iOUhoaa7GyZwuQHvQ3gEGe/NTiXYuogO2QROPtUakEjm0CnwbK
         kvsZHLKeUbzU9xoleFgHTrQZPpPyif74SXwCAcrOuKmxwemz6uMXGapYyPfo5nL/aCgI
         pNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683806389; x=1686398389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2CPc/Vm/Ur0JOy8kF/L6fs0qWXc+VKBrwCqiZQE3hiQ=;
        b=Gik4wCn/hsPH0oHbKGlthiUDqLyqQimPfg7Yt3aBkmSFMs6iR84sdqdGsAmxZsi86O
         sDpet2pJGUfP//opB/rjJ4jCJ56vl33b9swdAEHeAxCMXi215mv+QZkZoL+5boAWVj1J
         U+FZRdh/SHZGaP3rX50RxV8fXHP6/gHIHXks23CTCj9V1bUhdlu+RoALb2GJuyXxuY9J
         ffX5EY0Mx++d9nplmhs9Bzis5XoEKs84nYK9mqK4cNtyKGSgHzNNF0mhDdi1gmI0E1Cd
         ZRopjL68MOp3DWCXt2aqEAJTg9/6dQn5IbCaKtr0G66CzzTk9vVvPC/rvlxD/vEaitjn
         7g5w==
X-Gm-Message-State: AC+VfDwOXWw2s8DBXELEFBqBY87eQHZkeHq1ovy29fcvW7JQDBnUqlKx
	r7JilZ2oE674zt6pTIza4+DeYg==
X-Google-Smtp-Source: ACHHUZ4QkE8eS3TpZoQ27rQu2+0fhZ0L6/1Hi4I8nOp2Q9+9XqczCBc3KV8aWbi1HyhYGQflHWz/3A==
X-Received: by 2002:ac2:5fae:0:b0:4ea:fa07:1182 with SMTP id s14-20020ac25fae000000b004eafa071182mr2670102lfe.14.1683806389365;
        Thu, 11 May 2023 04:59:49 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f16-20020ac25090000000b004cb23904bd9sm1100841lfm.144.2023.05.11.04.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 04:59:49 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2023 13:59:20 +0200
Subject: [PATCH 03/12] ARC: init: Pass a pointer to virt_to_pfn() in init
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v1-3-6c4698dcf9c8@linaro.org>
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
X-CRM114-CacheID: sfid-20230511_045950_776703_F389123F 
X-CRM114-Status: GOOD (  11.66  )
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

Fix up the offending call in arch/arc with an explicit cast.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arc/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index 2b89b6c53801..9f64d729c9f8 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -87,7 +87,7 @@ void __init setup_arch_memory(void)
 	setup_initial_init_mm(_text, _etext, _edata, _end);
 
 	/* first page of system - kernel .vector starts here */
-	min_low_pfn = virt_to_pfn(CONFIG_LINUX_RAM_BASE);
+	min_low_pfn = virt_to_pfn((void *)CONFIG_LINUX_RAM_BASE);
 
 	/* Last usable page of low mem */
 	max_low_pfn = max_pfn = PFN_DOWN(low_mem_start + low_mem_sz);

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
