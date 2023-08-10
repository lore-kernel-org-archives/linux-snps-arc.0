Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4D5C04E69
	for <linux-snps-arc@archiver.kernel.org>; Thu, 10 Aug 2023 07:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PxACj2lgK7Ukba6ExbVsBjQLpxwOXRR4L/PN+v0a+Hg=; b=Iy9c17pV5/gV5A
	adp0arxtq60vI9mZWYEhaeVXHEfY0cLu8pqgXAIBU1JkbUsXHZoPTTFw7KaHY5uc1BpdLhBWKjiSP
	49/hsBsFbMcVw8U9ifb6zaBon8tuTfxCOFoj4gH33p21lg9jx/mT6EPR69CcXmvZyfM/W6Rqy/Agt
	K/SOyAcMEWCjnh0xjKEb5OS7B4XTry4MSxf1CxiowRGX6E6D60ZHImNEf6XhloxOtuoWZC5yXJrze
	RTFRHauAXynKv2Qo4g6zMpoOxPrBmYOY9/Y+MGE1PoXjG8WGJkEg3Lv20FJfhBgloHNcOa3MDHLmz
	dgt+U9akZQtM1RTcF+WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0Hd-006lkO-2P;
	Thu, 10 Aug 2023 07:40:37 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0Hb-006ljI-0j
	for linux-snps-arc@lists.infradead.org;
	Thu, 10 Aug 2023 07:40:36 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b9ab1725bbso9592211fa.0
        for <linux-snps-arc@lists.infradead.org>; Thu, 10 Aug 2023 00:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691653232; x=1692258032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JE+tuaEjTOobPVuUoR018Dq94fxPMbAMe7BcedomcTI=;
        b=WnmBDlQNs2BhfbzgpjkxvyonZEj2KENAKRPJCd6GxuoNAbLIb/BsmV45oj5T2IzBwu
         efwKJ+BHHwpYOXdX9wtBsU0r6j00Y4rFnM1DNNd8g+8J7KfnJhVetrbExXYhBvpDftIc
         P+jlxgZDoevp5MpQCxV99jQU7N3UGViCeW8VeuCpwI5W8Lxg8JQSIRgouBbOMu2cVWlZ
         qVzbGHLyD4hcTKwGmY5CxC8JVdhSV00OZyt7JqD9WNu4BES5SrPRKmZInUsKVgvcmyzq
         j/bjj3XjtQqB/qtaaPkLSVbIGaSZarxdbquiowkUuRzIAZpPddxnpZla5MuIdu3VFkrt
         EdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691653232; x=1692258032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JE+tuaEjTOobPVuUoR018Dq94fxPMbAMe7BcedomcTI=;
        b=G6ilnTMG+sxGeB2DJtFyTttY5cHW1nX7dOxnOW82KrC9A15NIhTOEJxGPmRJ8bFPRV
         RSozXfaKvjeG77dLb8ZjKOA6rJbJPii0gD8PHd2YzM6JvjBV9eco3C9pThOJYXzHkRGK
         lCTO3Y2eL+SqDpPZZG9KpQ+mFFtYMozhzj1Wh4qUtLH1PPXhTw+iWCMi5e2cPNVtoWnP
         8zgrNKQQaXN9l+8Kdng/kl0y8FlOhjzY2k/J5QSs3Yj0lE7A2ZhVRTipUIg8r7t9eB97
         QLvudqnRwyHamw4cM6IwQPAsN+TTtSqZXf3BR+bA3fepqxVwWzVfHVrsy7wyG+dEBfop
         +hog==
X-Gm-Message-State: AOJu0YzT9M4Vs4dzXv2XbwCrlshAvLZCl8e7XBPJLDWCdVUrOZ7nOnKN
	jeWGmUw2QPo6TIyLsyDtu0SR2w==
X-Google-Smtp-Source: AGHT+IGTCkUJ2WjN0231+Tnp6zfFH1j+DrdjHXon19Cy+1wCYY/UtmjxyKbtrGQCc+k6kJZn6bv71Q==
X-Received: by 2002:a2e:9f4b:0:b0:2b7:3656:c594 with SMTP id v11-20020a2e9f4b000000b002b73656c594mr1272196ljk.3.1691653232743;
        Thu, 10 Aug 2023 00:40:32 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id e4-20020a2e9844000000b002b9ff8450aesm234500ljj.91.2023.08.10.00.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 00:40:32 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Aug 2023 09:40:31 +0200
Subject: [PATCH v3 2/2] csky: Make pfn accessors static inlines
MIME-Version: 1.0
Message-Id: <20230810-csky-virt-to-phys-v3-2-f443cd2fc050@linaro.org>
References: <20230810-csky-virt-to-phys-v3-0-f443cd2fc050@linaro.org>
In-Reply-To: <20230810-csky-virt-to-phys-v3-0-f443cd2fc050@linaro.org>
To: Vineet Gupta <vgupta@kernel.org>, Guo Ren <guoren@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-csky@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_004035_264198_1B5B8945 
X-CRM114-Status: UNSURE (   9.99  )
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
index b23e3006a9e0..4a0502e324a6 100644
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
+static inline void * pfn_to_virt(unsigned long pfn)
+{
+	return (void *)((unsigned long)__va(pfn) << PAGE_SHIFT);
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
