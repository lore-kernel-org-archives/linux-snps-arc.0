Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3627C7EE22
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 May 2023 13:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7HJ+1r7Snzxj5iOtNZd6Nx8M8qA5imXJO3M2ZkaSx8c=; b=KKM2fazGBSJXC5
	6ucmphrR9t4Nt4Ym9xwuRinbLeFstJpkoxT1hR04RnyQF8Z4iRoqiXBsjkauHy17cbEFMQMEO86R7
	uJdpSqamr268ZC5CTcueYxhEngGjRYJWn4V6KPpqdyyc8zNyvmeG7txhtF76XfpfUn8xehaVLd/gL
	eITpnQtkcR3RrvvYpahWLliddph+dhL7rp0t6tDftp7s3TICo1YdSibQpgKs+toHOiMubBECmpaZ5
	4SMzakqArhdepppIhad/R7lgqYg4hf6G5Ij2WYrzvqp8JARjx4inaGJdbg65g+BHFsJB8mwA9ZvHm
	EW+DfPAvk4n6aYCSM/Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px5uv-008nLP-1F;
	Thu, 11 May 2023 13:01:09 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px4xc-008h8E-31
	for linux-snps-arc@lists.infradead.org;
	Thu, 11 May 2023 11:59:55 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ad1ba5dff7so64798061fa.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 11 May 2023 04:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683806390; x=1686398390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AULvzv+57dD5HpSWPkpxyceRhii29y9Rzv9p/7gtLz8=;
        b=soo7gel61xLJPPvWmBpSRpISycpQ4XMSOLDpuxsIg8UcYukLYcg7kMmXk/2zJzG1nW
         dsU8I+b6+EeJC/RPFjsri77SgRQ6hq2riwqwbxPxb9BPmFrHaOXA8XlBqwiqx0GubS/i
         Mhuqa/PtIduAVK1dEpaA3MpUlLbL32Xbmw+sH+jktUlv+lmF4kpGzKSikAVGP0VgKPOp
         YCj4v5oEg1jhayDSX8iKc90tIlislQLi37GCRWiSDvFSwFEkSlw0s6Y42ltaRe+/B46x
         HB3CKfzsllSPT5KE0DczkqM0Ns6TrGXqPqX3xl8eTKyXRx+KvTrVcbjwXkVi5//X0Zuv
         BYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683806390; x=1686398390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AULvzv+57dD5HpSWPkpxyceRhii29y9Rzv9p/7gtLz8=;
        b=E/uOIk3T5KgjTf0pLd8HjgENAQ9wzi0PSpdD6CS9VR2Dv3neQrZn8WPMsz/jWi9k1Z
         e5cxnZggza9SdQSFNZDwrySDRmvtWO4H/ht4rrAQ3lo5FDm81KYGE7acr8gl+SwxuBFf
         0p8KltVsQ738FZ8LfXN4dGtPRpOm1u5KwzGuquga5uKueJBaT18Yu1q2QBVqLqKhssv+
         zauRSRieI4Asq3QC6r3DhUDSwSi95T9BfqxdsQzetgrFUmEqhxeo2SckiqTN8zwATFwu
         uAYcNRhs7yTJWsvEWPvtoqZV+xmRR7z8UMc2XYgKR8930mw+ghqktFSsacoxzVNnw+tA
         IiMA==
X-Gm-Message-State: AC+VfDyuJnviuUVcyB3o481+xxkMHyVsD4gXg017HMNvfmsXJlfkJ1UI
	sGrDJ7GuDDcJT/P7dkZFteEpefNtyIVczSWXqG4=
X-Google-Smtp-Source: ACHHUZ4YcTu6FF7odIThWKYfIjWHhaQ1ovlMhVuhR/qJ6RT8psLdgX3PwvbGJutv6zmhIytcpYTEfA==
X-Received: by 2002:a05:6512:3744:b0:4e7:dd1e:e521 with SMTP id a4-20020a056512374400b004e7dd1ee521mr2323684lfs.9.1683806390306;
        Thu, 11 May 2023 04:59:50 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id f16-20020ac25090000000b004cb23904bd9sm1100841lfm.144.2023.05.11.04.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 04:59:50 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2023 13:59:21 +0200
Subject: [PATCH 04/12] riscv: mm: init: Pass a pointer to virt_to_page()
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v1-4-6c4698dcf9c8@linaro.org>
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
X-CRM114-CacheID: sfid-20230511_045952_969313_2133A832 
X-CRM114-Status: GOOD (  11.32  )
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

Fix this in the RISCV mm init code, so we can implement
a strongly typed virt_to_pfn().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/riscv/mm/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 747e5b1ef02d..2f7a7c345a6a 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -356,7 +356,7 @@ static phys_addr_t __init alloc_pte_late(uintptr_t va)
 	unsigned long vaddr;
 
 	vaddr = __get_free_page(GFP_KERNEL);
-	BUG_ON(!vaddr || !pgtable_pte_page_ctor(virt_to_page(vaddr)));
+	BUG_ON(!vaddr || !pgtable_pte_page_ctor(virt_to_page((void *)vaddr)));
 
 	return __pa(vaddr);
 }
@@ -439,7 +439,7 @@ static phys_addr_t __init alloc_pmd_late(uintptr_t va)
 	unsigned long vaddr;
 
 	vaddr = __get_free_page(GFP_KERNEL);
-	BUG_ON(!vaddr || !pgtable_pmd_page_ctor(virt_to_page(vaddr)));
+	BUG_ON(!vaddr || !pgtable_pmd_page_ctor(virt_to_page((void *)vaddr)));
 
 	return __pa(vaddr);
 }

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
