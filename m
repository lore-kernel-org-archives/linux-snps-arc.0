Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CF3C77B75
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 May 2023 07:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7r5uslQUBPSgoofl7v0KoIV2HBLdO3InT9pYQoI21hE=; b=xQRvSI5zgIPzUD
	kNJTxc/WNpRsWbKXQYgkhQeV6CD1O02UgBYuM9tDecdjqeyCjUmNDQjS9Tyb3ZVIZ4YN4ua5xdOSe
	lRgOHssn3ukeFwXs9MZ0l/HovVQSly036rrhz/rwcLktDyc0u4jZQRt5/gfbZpw2I9EC71wzutLGl
	CEuASRwVabKMXHfgewtVqmJR6+n1Prie92ddJIU5fzBmhFVLdHvLzh4wRQ/ifxFrg/DhUq8WAY/sC
	42FdeE9veqj7Xny1EZf+Bhk+vjD0vbtyLcWQ4908JGcOTUeDUZ6CWhePMwniVkxUPVOFjFjMPZ6xs
	iq8pHMq6gGIJpGR264lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zXe-005ZWS-2G;
	Mon, 22 May 2023 07:01:14 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zXI-005ZH4-03
	for linux-snps-arc@lists.infradead.org;
	Mon, 22 May 2023 07:00:55 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2af316b4515so17193801fa.1
        for <linux-snps-arc@lists.infradead.org>; Mon, 22 May 2023 00:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684738847; x=1687330847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H1mJE8PBb75X4TbUyJXZ6L55Fw+NsuGtTu+nI/l3Cvc=;
        b=FMR+Qlxwuc8HLvz2Un+03lMzADefhZtZYcE4XHeTZEM0NlyayLDLr/ghrIPr4wOfsn
         hd18jrfSt0sSLwyi2R+kpdFTUKZrJ+BZ/C8tqM3Dro15MT0Bz2r43LqkO6JTuURAVyjo
         Hb5ibuaMMZUbyrbu0TGj+c4eZkPKyBY2Q7Hmx1HpmabTY9nj/7nqGyXR7uNb2h4G+5o+
         IbpEDIbdkQb08eN8cpfyD7jW1r5UTuEKzmsjHWQMxcDTMqfGNaZaaT25Z3ATIrIWcChT
         9UniGw6vl1lHpSHdcRd6BKV3duDmePJf14FnN89u8aN1cFzRNUW+g2/WjLxXlTSI3LHB
         9xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684738847; x=1687330847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H1mJE8PBb75X4TbUyJXZ6L55Fw+NsuGtTu+nI/l3Cvc=;
        b=IUB+Vm00TTuAJS7h30zqgUwTXoq1GT/g8DB0Bos9QXvKGgYyNvgaoUAoWlEvxo4/z8
         EOKO2DsIb8fje+THxy+9nil21sXsmR5RWsa6YU3ZGWrL4kyqAt3kdqpwB1w1SikQasgm
         gfomypdN5s6mAS07xVlYdYrvwaW1gqUaOKKT8hMCGpTtppPyS6q6wswTNYD7de1HqnHa
         qQIWNVAgpyqScRmPJbHrUqsiw4kekgc7Hd3Do9v9b8e703nmpMcK2rOoTVfwQha4GJKq
         E+tsf2tPqoO5lNEtT7kXD144jhvPS4x5Msp7boVgeUcJ9IgjWSSxp0U/IJ0rrTUTMmtr
         IK0Q==
X-Gm-Message-State: AC+VfDy/dUYZXeF4iaR8gHltNqxaubLmvPZ6FmRzY7gsbUw6CjaFu07c
	CGrtexD/KxKONvcQYWVg+rIKkg==
X-Google-Smtp-Source: ACHHUZ7XAOeJkx3YfYjjDjWz6wE7VkRRqoG7K82VPNW1yh4/nnHy6HvJwsWKnI+O4aT1Pb2S2e5j6A==
X-Received: by 2002:a2e:a40d:0:b0:2a8:a5b8:184a with SMTP id p13-20020a2ea40d000000b002a8a5b8184amr3297249ljn.40.1684738847083;
        Mon, 22 May 2023 00:00:47 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id q4-20020a2e8744000000b002adb98fdf81sm1010187ljj.7.2023.05.22.00.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 00:00:46 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 May 2023 09:00:43 +0200
Subject: [PATCH v2 08/12] arm64: vdso: Pass (void *) to virt_to_page()
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v2-8-0948d38bddab@linaro.org>
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
 linux-arch@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_000052_097734_FC700BFF 
X-CRM114-Status: GOOD (  12.23  )
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

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
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
