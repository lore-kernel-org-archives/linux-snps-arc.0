Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585E6C04A94
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Aug 2023 08:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n0XlBzx6KBzeRR482RQfBk3e92YgMsCu83ipaurHSPE=; b=hGIW4Fdac2UJNQ
	L7lWhS/LCc7cWp7cqA0193C3OzVhB2rgpPDuKSQsEl59RBnD1JWsl/SFApwfLWGlPFEaQ36mvpbQF
	qNPHm8N7VPCNasyk4vf6iSOUkFMys+GifviwMP1mTgVdbFqgGmFIUeHM/C6ct3YWxc+NjE12QqYKN
	4yXejHbjGsdyOy7hYqs1z15CwNWglxS2klxDkUUoXXf6eMo5qUQBfJviAh561SLbwtdYKkte3yztx
	qlodpcF8fL6Q3hSgxDbHnJPcFyCt5fXvypIRTDzLNJHATyAitQ9k9QJlha8Am+eNVkT3plt66s8CO
	dzAGphgPwV0lJb88HIjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTI2k-0020aF-1K;
	Tue, 08 Aug 2023 08:26:18 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTI2g-0020Y0-2g
	for linux-snps-arc@lists.infradead.org;
	Tue, 08 Aug 2023 08:26:16 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fe383c1a26so8810491e87.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 08 Aug 2023 01:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691483163; x=1692087963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6m3K/inEtRmdGEBBt/pEMpMfJWtxVrjJEBC47w+pHA=;
        b=poS32QQW6rxur8wMYSQ1qs+nmxmlma555jq7qWtu82oIIbILOTk6f+fZXxCv6BxbSw
         gPZYrZdfRYij6NVdM4nhlJghZ4wLmNiuur1F4oRBrvjsb8Nv6V5oiNVEceTDzq1DlpvC
         x8mv0oB+7KtwR+JNbX0/kqa9AYBVDy7eb0I6auWSlxGUH/dm9Vz3fQAJAEgQ3ZuZyPGk
         tLrA0viV/HsSml+wHJJMJwsH3IvUpk5Clddo3YwEUThnEFvrMy0QSpfgN88fz/nyVtgz
         Z1a7msd635NK1egLm0QKZsms8/yVzutMhK3wcJTJmLyYbMC8uuzPsvKIU9sBF/YDvOBO
         8sBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691483163; x=1692087963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6m3K/inEtRmdGEBBt/pEMpMfJWtxVrjJEBC47w+pHA=;
        b=H3pbidOLnlfXqelG20mr1KD1vRmEqDNvzC2O1zyTA02C2W/lxBeoqAMx/DrPbRdQMw
         ryQqaomHJ0nU0enMmYWTS+yu2oNpPtmeNOTxP9mXquMge6S/EckHtFdZviwr2vT8KIHg
         YvBgN4haERA0mmeCPn0Uavq+zYc1hcp6TZxnj4e/AGcN3y3BDWH10h/P3dmUZnL2jlfK
         54Xyc2zH8nNHUlFpWHCl6ouCuh9H5SJbaYPvoYaTpGlv8BujbtpJEmAvlDb3+EqHq7Ni
         jiprnEXNyxiVctOpiOh0JPcYykVuon54GnjAO8bX1MZ0yWL8SC7hQau8z7uYRflqGsHy
         /roA==
X-Gm-Message-State: AOJu0YxMf+E+ABql2ABKOu/oIlyal0QPOe2QQbT2eEN9sA5lWG4dJthM
	T0V2y34hwi10tvzj2SkzE29XqlJwRdB9sdQtDEo=
X-Google-Smtp-Source: AGHT+IHxDCh1uiQfUmmrydV7nAhXgfZ1Kwvcz0RMY0OKmPWNtnQhD201bB37ZY0n1WH7gHW98TyYVg==
X-Received: by 2002:a05:6512:ad5:b0:4fb:9050:1d92 with SMTP id n21-20020a0565120ad500b004fb90501d92mr8131994lfu.51.1691483163361;
        Tue, 08 Aug 2023 01:26:03 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id t13-20020a19ad0d000000b004fbae18984dsm1787087lfc.255.2023.08.08.01.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 01:26:02 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 08 Aug 2023 10:25:55 +0200
Subject: [PATCH 1/2] csky: Cast argument to virt_to_pfn() to (void *)
MIME-Version: 1.0
Message-Id: <20230808-csky-virt-to-phys-v1-1-ac727f8def2f@linaro.org>
References: <20230808-csky-virt-to-phys-v1-0-ac727f8def2f@linaro.org>
In-Reply-To: <20230808-csky-virt-to-phys-v1-0-ac727f8def2f@linaro.org>
To: Vineet Gupta <vgupta@kernel.org>, Guo Ren <guoren@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-csky@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_012614_889420_6C5EA52B 
X-CRM114-Status: GOOD (  10.91  )
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
