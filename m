Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71920C6FD1C
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Mar 2023 13:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XTQqPJYIvCgSIJd40FDRgKX8aMS90BBNnBFdzAW4Qi4=; b=ejDogDhd3GCHfL
	5XAdsaILAEdSfjZ87Hx10LMOvWaEVbjFFUMQCSRkZOprOxRzp6IP2TBoBaNXpCru9AAp0Ij17etjs
	DtjWuxQ4vqp4fCKCfdzWbKX1kkjIQb8jAM6TjMP8gnh3HIZN3RvIkRdIWOLzzRkBwOE+AMnXvcjZA
	FJPYjh7/tMjArmRgXu9z34M11OYIUj16EsqHDlpuN1CFg5sDTQENwf/K2gjnYi5k3XmY9iHul2lV5
	/j0O7UFmw7gzpCLPy08TaaIzJx6/ZSRZHSY+6v3pQW4wGE7oAAbSsYlvEsDbhFouElBvGOKbWb2Wt
	5WvFiXRKXUin7AA8O/oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLBJ-002401-1u;
	Thu, 23 Mar 2023 13:40:41 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfLBG-0023yT-2r
	for linux-snps-arc@lists.infradead.org;
	Thu, 23 Mar 2023 13:40:40 +0000
Received: by mail-lf1-x130.google.com with SMTP id x17so27793299lfu.5
        for <linux-snps-arc@lists.infradead.org>; Thu, 23 Mar 2023 06:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679578835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9TeKkKuY/b7j2FNb4zlTCj8CxrbWwdEzxFSjzpUVSyQ=;
        b=Lp20LgdemxeHB/C/5ft8NncQJTDqx/hj8fkSl5a7IzC1dD++NFeG1CRZAibm9inyMD
         DkbqybUVtA99rA9zlvFFdrJvCbTLNVc43RmM8/uvkK4/mUMqn9EzrqCaNIwos58perWY
         5SUULHsrox2tC1A/O266ruDQexr7cYbvFGxxFNkb/YmKPfHm2/3jDun43DYzAU9obNR5
         v47x9ga5enHwqaQNikP5Fjo/F6D7aUiQO3xStpTQ8om+WmBz5daz+hRVsZkleGsBAh1I
         eWuPRVJsyD/tR9VPQK8d10rC5Lba6TswvUrs3AUHS7NePdq5Jy9ZbDpebsnr1RuxSSPr
         z5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679578835;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9TeKkKuY/b7j2FNb4zlTCj8CxrbWwdEzxFSjzpUVSyQ=;
        b=5RF5YIL4woVLsNHOcrIYo67xDOZhDGbQAYqs7lgtG+hYOb97LxIzWYB7BfLLaKtuAA
         tGVWIjnHiXEzD9OYbKxbTuOAvEUCqy87kU+kiHgoVnYz0ZOwNEQz94BIYVn7C1N3B3We
         cVKjfuK3lmJaFbWSftugTXuVtfnq+fV8x0PvlWN+1kfATdmkHqdPyz2TFF/8uk1GPNy4
         tNlFbPLq8TnQYmSzegkt7SPq75A4+GqPzTFg5IuEHZ1Tj3Scdk00D3Ue4ah13aI681tu
         P4Cuy805s6i0ZxpfCCcoMhWFE2Az+Ie0IZ4SDWlhojuMHxRhOM0OVRJ3eZzn8synjNpv
         ErvQ==
X-Gm-Message-State: AO0yUKXe2dsyZsUAAw9YyQEKRBC6p/U52Wl9Q49sYnZThnZr5xNCobwf
	y3YBl7VgS6QxOIXK7RMO5G9xXQ==
X-Google-Smtp-Source: AK7set/VO3MIYghsSix3ZVroRwsEQYk28CWTDbRmr1tlyDjCoZ/l2yBKL0vntxglTVRVAqMxofBdEQ==
X-Received: by 2002:ac2:5d4e:0:b0:4dc:537c:9229 with SMTP id w14-20020ac25d4e000000b004dc537c9229mr3685850lfd.30.1679578834957;
        Thu, 23 Mar 2023 06:40:34 -0700 (PDT)
Received: from fedora.. ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id f26-20020ac2533a000000b004eafa060a6fsm434744lfh.145.2023.03.23.06.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 06:40:34 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARC: init: Pass a pointer to virt_to_pfn() in init
Date: Thu, 23 Mar 2023 14:40:31 +0100
Message-Id: <20230323134031.679656-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_064038_922023_ADA24FC1 
X-CRM114-Status: GOOD (  11.22  )
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
index ce4e939a7f07..d8688f61c61b 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -92,7 +92,7 @@ void __init setup_arch_memory(void)
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
