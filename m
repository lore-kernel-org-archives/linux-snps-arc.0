Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B41C77B7C
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 May 2023 13:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ImyzVDnoPp1+QID6Xxuj5o09rhKRMKkHxm5Dtk2YwmU=; b=bWilZLYeKH99w+
	IhudOnXkgn5eGbUFQW0RSqG0o8C6tOJFYwo3rkoT5hpTmk8pqIl8Fsa73IqtYplzi7WPsmwi8GeGh
	sO0KKf/b9/0YiNxNxNSYj4gYlyiP9ZhQ1kt8ANIshatFVGboz0AxdUAkR0hCfBaOsNwNMfJiMawZk
	hi6I4/V+C1s5lxryxfxKjfc+alH06ORP0vpocLOdej2ROrdWr4/Bf0wxuwdkfRcQYdw5am9Pb6oV6
	OV6ULVmYt1CfRy1kA/+ia3XSZKBN02Itl4SGEvw85RO4O5N1XyqneryNrgtUWykMGS6rcA8qgp55b
	kD5dcYDlSmpxYZ6m2z/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px5ux-008nNa-2T;
	Thu, 11 May 2023 13:01:11 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px4xf-008hAZ-1u
	for linux-snps-arc@lists.infradead.org;
	Thu, 11 May 2023 11:59:57 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f004cc54f4so9640096e87.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 11 May 2023 04:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683806393; x=1686398393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbjvTSrc7JXib/jYCtsnbT8Pj+twUmj4f7HYrh8lbjo=;
        b=lVyXp4k3KTmo8RdF9FjbrH3Tv6c0bVkXtZywPccWNYeyjQtpi+z8J9YOLY5+sc8Eee
         9TxIZcqfBkHZCR5W/lS4SlBkIqbWGSAPlS7Lr3r/I9TrjHIt12ePBNQQByXKE9XA5W82
         Lp1d5/+LzKSwENiuYylfIRK6jrTQr4Zv4h1kXRVaE4hxsuTMNFh3hlQ2qHWkX+6kY0EG
         T5bDIgWzHhDoq1MM/WpZ20V/MaFu2pz8FMs/SVRMPgnQO5dguxAOe06YAfd7vgPdzNUJ
         UXbg5YSTuY6yxPVV9orezsqTc3SK9pkouhcNBUYohSwcaCiNBsVhx46K7y7sjmIKo1cO
         FxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683806393; x=1686398393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbjvTSrc7JXib/jYCtsnbT8Pj+twUmj4f7HYrh8lbjo=;
        b=Sa4c9zHoso++rljki74S57QsJMLg0s4QNVh5d3ZToe/GHFcOU1Qy8ABHKyz1G9nYt/
         XCe8qp5kXI5d9YcEwr+ZGk8jzQK3FSRmb7+LVRckgkh/b9aHdWNSSTo3ZugIXlba+Tsb
         MipvGYop1vT1WwCv84rN45r5qYfXbDZpbmSgrWRaUZCtNMsoyL1XXaRLDweZ6oHy3gB2
         Wh+hbxSFYG7qLhzcfWgcmudp/phrO/WJ9Z9koP4iduhsas76EZOAmwvZU7DjMHpSQoXu
         NS0UZ93x7adXLeyXDec0CRKXrRLUWv5o/Gn9kPCidq+SALlb99ScsnU5WfAnffOvC/ri
         KMNQ==
X-Gm-Message-State: AC+VfDxyGqasonaYdbWvvNN6XYQ9ahlpNNaxJyyI1bTOVyMub2UNBst8
	DB1FR+aNol6ugQvM0v7kfNi8dg==
X-Google-Smtp-Source: ACHHUZ6yAIRSU1J7hff/jjZVil2cXfRcnI2cjw81Jl+2uJZmlGorTrbKTJFSuRdrBVeZHWDMCRrMKw==
X-Received: by 2002:ac2:4f8e:0:b0:4f1:3eea:eaf9 with SMTP id z14-20020ac24f8e000000b004f13eeaeaf9mr2642443lfs.24.1683806393661;
        Thu, 11 May 2023 04:59:53 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f16-20020ac25090000000b004cb23904bd9sm1100841lfm.144.2023.05.11.04.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 04:59:53 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2023 13:59:24 +0200
Subject: [PATCH 07/12] netfs: Pass a pointer to virt_to_page()
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v1-7-6c4698dcf9c8@linaro.org>
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
X-CRM114-CacheID: sfid-20230511_045955_652794_D968070A 
X-CRM114-Status: GOOD (  11.08  )
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

Like the other calls in this function virt_to_page() expects
a pointer, not an integer.

However since many architectures implement virt_to_pfn() as
a macro, this function becomes polymorphic and accepts both a
(unsigned long) and a (void *).

Fix this up with an explicit cast.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 fs/netfs/iterator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/netfs/iterator.c b/fs/netfs/iterator.c
index 8a4c86687429..0431ec4a7298 100644
--- a/fs/netfs/iterator.c
+++ b/fs/netfs/iterator.c
@@ -240,7 +240,7 @@ static ssize_t netfs_extract_kvec_to_sg(struct iov_iter *iter,
 			if (is_vmalloc_or_module_addr((void *)kaddr))
 				page = vmalloc_to_page((void *)kaddr);
 			else
-				page = virt_to_page(kaddr);
+				page = virt_to_page((void *)kaddr);
 
 			sg_set_page(sg, page, len, off);
 			sgtable->nents++;

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
