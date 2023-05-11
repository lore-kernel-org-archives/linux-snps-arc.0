Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DDCC77B7C
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 May 2023 13:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s95nRFUPmUbXnXooUqFEAaOM8ktBPDPwz47V0YEnSyY=; b=M1ukVTUDIs3i7w
	dh+9pJbHwHVPlE1490mrZ8bxZVo+GDiHVrRZGHYEjGn6g8VVwXVnFTwQ+2J+pdo1deEapjrL+7HsH
	BrXOZkxdBGQX605nko+vWLMhFo72GhfLVB1KoePbDJmx1s6VZEuDnoZdDp73ljqeebKZ+gKK4JKus
	bcbhacTHn8IwNR+LdUg6251iiSEDiJtwxsnoNy7LUIoJqxrxomL2nK8DenzkgsHX0cvAWutWOCeXD
	y4xzXLskRydOhtecsYC4q91ueqb71efdiLjvlJH62Ya7KVANOg4bZTCNabhv64mzuSXhmUxT1QnPu
	PtCFnYQm8vWsHfsuAsKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px5uu-008nKq-20;
	Thu, 11 May 2023 13:01:08 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px4xc-008h8m-2O
	for linux-snps-arc@lists.infradead.org;
	Thu, 11 May 2023 11:59:54 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f24cfb8539so6056603e87.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 11 May 2023 04:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683806391; x=1686398391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZKz9AzIS+RysB0OU8OUcujwHN84YucEXXNOUbLloVVs=;
        b=yiGUAJSVd27ej3NuIk3vnvK3fS1qO3n93XWDO7/QSlEw5RHl7TlckkvSbtgAGMT7rs
         8gcQLXhS79sxLG00vev3Tm+FL9DZK5f2fjYO2/9Es7JV+ZV8EPjwXP4D0JU15a2xS+1A
         jqCUYx4wQDDuhH0tj93gaLE2O4RLjJkMa8aSjU9Ljzc00Ea6CAC5lgOQ8Gs28oI/UYpG
         DmkJW9Uw1afeErc6qgHpSrInmF3KaA9OR4no4iWYo/uDwZIfqMxDi6oFiLi1PWZfKQr2
         u9TrLhqEgUGyGiPpMj49YARpaWJ9QLLB5f4psSVnHsptmTvb1WU9bQQ+74/xGlNqIVr1
         gQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683806391; x=1686398391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZKz9AzIS+RysB0OU8OUcujwHN84YucEXXNOUbLloVVs=;
        b=SGSon5pY8wKXIidNYrTWLc5PkMqzbqfvW6VuL7RWXlwE1ZAqLv6f34UYFdUHW09ZLw
         F1WUr7aBVzWpmNVJOBc1DV69NzBidOPsm36LtfNc+fvuBkLTEav1vFlVsjEcwh+oy9ik
         J2BZ4KD4FukQOAzaY15yLudpaiOvCmv9I/LXQmGWkCfCuuFmtVMAG5QAsYrXJiOGFe7n
         tUv0UUHOaBQqckMhKr191LJe/dWjGFXR2GG0WNFOFzcMHPNwlFDcBosnUzt+nWNwoXbx
         WwD9EWTbqYgx5FbxjZAYlTIc5iCNjS1njBlGMesXWdGrSl0MMva4ErBWDjIJbEn/VP7I
         gXKQ==
X-Gm-Message-State: AC+VfDzLZhrqcEO2ldjGGkMrQM0GBxl0BPu3CmVmtPIZkRKdCldIVzpY
	S4a58xPZLJXu58z3znE3PF4Jww==
X-Google-Smtp-Source: ACHHUZ6oDkafp6RNma4b/blEY3A9k2zKUGZwC+dKiYwvUH5MmrRALfBC+Lhl+x+E1iIOKclp+sZWBA==
X-Received: by 2002:ac2:46d4:0:b0:4dd:ac8d:671f with SMTP id p20-20020ac246d4000000b004ddac8d671fmr2858782lfo.34.1683806391327;
        Thu, 11 May 2023 04:59:51 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f16-20020ac25090000000b004cb23904bd9sm1100841lfm.144.2023.05.11.04.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 04:59:50 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2023 13:59:22 +0200
Subject: [PATCH 05/12] cifs: Pass a pointer to virt_to_page()
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v1-5-6c4698dcf9c8@linaro.org>
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
X-CRM114-CacheID: sfid-20230511_045952_780469_5DFC83AA 
X-CRM114-Status: GOOD (  11.18  )
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
 fs/cifs/smbdirect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
index 0362ebd4fa0f..964f07375a8d 100644
--- a/fs/cifs/smbdirect.c
+++ b/fs/cifs/smbdirect.c
@@ -2500,7 +2500,7 @@ static ssize_t smb_extract_kvec_to_rdma(struct iov_iter *iter,
 			if (is_vmalloc_or_module_addr((void *)kaddr))
 				page = vmalloc_to_page((void *)kaddr);
 			else
-				page = virt_to_page(kaddr);
+				page = virt_to_page((void *)kaddr);
 
 			if (!smb_set_sge(rdma, page, off, seg))
 				return -EIO;

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
