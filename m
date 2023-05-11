Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64123C7EE2E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 May 2023 12:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a4J9vzjZSmrRwmWtBgltESxk0am1C6EUPI1UENUq648=; b=X7iZTF40s5TNsM
	uqL7Zc9e+SLC1lFmgsVA8QkSU5G9gHQAXFUylol+SMANG1darUwa+j1p0h6Pz9fW/G9e5T9i9xcW9
	9de6FqW4KeReXRUZKm+vVmsStZCEk0NxYvWYfBuGiC1Ut5GzeOL49W9h050j71g0y8l/zFFTbO1dq
	71R3MDm+Eyd5FHzy8uoJ5sH4jbiGrfbmUDQhJxC0CD0BKNQlULJyjcoouZXqF/86N5OKM6+mh7XXX
	P94di7JtP6UBLeEIk/qljbuVSKjtO8s8Rkcx9uhG7KoXD2WhyTyoegUQ5H9BnIBgFbpFwVfXmj4dp
	57uAU2T54EhXmDS7cAiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px4yC-008hNH-04;
	Thu, 11 May 2023 12:00:28 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px4y3-008hKj-1j
	for linux-snps-arc@bombadil.infradead.org;
	Thu, 11 May 2023 12:00:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xp9YXKX/mdPfR3Groy/h2+S4HOih/XO/GthWPwB3ikY=; b=CZgjtl1BOdSxZFn6zY7buCh51E
	ymGaVEs3DyTSpfXQa/3RXivSiQTfR0K49DaCGyC/Lf8KnWFAb+gZPxvd5E9TE8ZH++K3aayncdbcG
	dEFfckc1ZuecXgovBNJTBY2NKgdfWupHAVm5JxWvgkrJsfghvKDvyHlWChHVbttP9/PydpxvtWxZG
	ARfoVqvqnBecAl771Dr237d8JB6k57/bMUW+FtVtyMTEIwwmmz+WeLFtzEN3MHIrVDeM1t3XhgINK
	u8P3ACF9SwBO4Wa3WXZCFEkvc3iGhOlgr+DqbwczK3qMP+VlyAexFaJ6/rQ0rXkVuTBgiyMNVO/do
	dVjO6n6w==;
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px4xv-008Djv-2n
	for linux-snps-arc@lists.infradead.org;
	Thu, 11 May 2023 12:00:16 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4f00d41df22so46715436e87.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 11 May 2023 04:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683806394; x=1686398394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xp9YXKX/mdPfR3Groy/h2+S4HOih/XO/GthWPwB3ikY=;
        b=VET6NG7wZTvecZWmT897hwjurDC79ewy9skuHZ0BAg8j6WG0HpKT+cKQYjlNZZqhS9
         ZBHD1UegBUAZIn6kmSpxYJxUFcYOnfNE4nWrjQj8Sh+Uyggour6jRxMf7LS9/IF5rBFy
         W4iB0k1o3MdtFYsa9QEggKETjWUSzFkIw+N/2yuZwaQ++xxuXjedgdW2WIuJ65DMFPN/
         e/9mK8nx3Y3hIAMMKkRttccO2avl3pany6MQBtJ/no8qfzNa5YL3EsRjrPJBi0xnB1Ix
         DgFTea1Sh8U9UP6E0E8bSwiu4w89Knjloaax/XSVZRxAotV+hiMJu+jl4YaOwMPz+gGa
         V0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683806394; x=1686398394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xp9YXKX/mdPfR3Groy/h2+S4HOih/XO/GthWPwB3ikY=;
        b=RJttz5qKfTtSJ1eBN5VBDaoV1HGWPuU9fW7Vf1IY0cAUuQMKa9SuKtUgtqA6jtznBx
         nbKOTQC28mF37/HY91XIl9xOMu0VR4cMequQIEOC/ZEzpvp2aAhbGmCKEWu5igCS9Tzu
         uiC5oKYlSYX9ij7DV5HaTf7EHRXMS33NRXY8QwILR0AYb9cm2p3Cdb4VEWr40L8jQOAR
         LYg8wVTnfy7ZS2qIiM2kIaLHP/lhvbdaI6kwuMekzWaI5k56zJAZiq9uvQaDg6kXkjuS
         QaipssGBUxLH6CTaw0pEu05lJKw4UOhe9b2WOxjjQy7IJQwxqtcQE7u8KHmIkZSZ5P2t
         27LQ==
X-Gm-Message-State: AC+VfDzXiY7Bi15X61n2PNqztnvTJnfvr/Bpt1WEF7449K9RGkJ+x3MH
	80qZnzLX5hx54j2byFTexoX6og==
X-Google-Smtp-Source: ACHHUZ6xiVVkKCB96YSXNRCjX6NTy5gQRqNaBw4Zi8UyRnMiRA1OZALXLSyHrKhvlITGQwt4AiY7kw==
X-Received: by 2002:ac2:4d03:0:b0:4ef:ebbb:2cf5 with SMTP id r3-20020ac24d03000000b004efebbb2cf5mr3050896lfi.17.1683806394609;
        Thu, 11 May 2023 04:59:54 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f16-20020ac25090000000b004cb23904bd9sm1100841lfm.144.2023.05.11.04.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 04:59:54 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2023 13:59:25 +0200
Subject: [PATCH 08/12] arm64: vdso: Pass (void *) to virt_to_page()
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v1-8-6c4698dcf9c8@linaro.org>
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
X-CRM114-CacheID: sfid-20230511_130012_340940_87DE1DB2 
X-CRM114-Status: GOOD (  11.23  )
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
 arch/arm64/kernel/vdso.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 0119dc91abb5..d9e1355730ef 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -288,7 +288,7 @@ static int aarch32_alloc_kuser_vdso_page(void)
 
 	memcpy((void *)(vdso_page + 0x1000 - kuser_sz), __kuser_helper_start,
 	       kuser_sz);
-	aarch32_vectors_page = virt_to_page(vdso_page);
+	aarch32_vectors_page = virt_to_page((void *)vdso_page);
 	return 0;
 }
 

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
