Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05736C001DB
	for <linux-snps-arc@archiver.kernel.org>; Tue,  8 Aug 2023 08:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOmgAiToDpG1kqKIrHHbW3WhcAXaFX76P6uyn6UxTjE=; b=EDjxjatVPHobSj
	XvC57LNrxF8lPa70U8BOxHePr2Sa1bPja3yLQX7vvRTRLTxPW3uYMU9HnqIvLSmhyb4aQtzyxAeEU
	kQNcxN9JIATUc7K/oqBaT5K789tMEoKbrA1cwgCw4zpz5ObVzZDlEa8CySlHfNU5+poq0g+OXgWZr
	GClXaoLKxcOfm3FncHMpDsen0T22Ikcw2nsTLqcPx5EnFZfaNnqt6MIvRyFgomwCSFCdEnKwDN4zK
	Pq31ecM3GuhnWFa+iREQcUpH8GZUDQ6D0lj3sbfpMaVH9ZCR44M8YLJwohpiZ2OWSYFpzQ4dRoO80
	b3wI/C97PPngq0eC0wzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTI2i-0020Zb-2Z;
	Tue, 08 Aug 2023 08:26:16 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTI2g-0020Y2-1Y
	for linux-snps-arc@lists.infradead.org;
	Tue, 08 Aug 2023 08:26:15 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fe28f92d8eso8484635e87.1
        for <linux-snps-arc@lists.infradead.org>; Tue, 08 Aug 2023 01:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691483164; x=1692087964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bRPNurCVUK+kZN7q7E8TsOpZ2X9nLclQ5Lcqn45M43Y=;
        b=hz7inHqPMxQys07qT3nqlSEPLWx15tKX1J/eGUpHcE+EVO86JTXa730w5Woq02rxPz
         CtorclF+1/jQQZb75qnphEJXS0HUq7jqACvhPNFCUAd9KJdltGqIwo+lDNugxOOxGpCx
         Bdpp6ryI56DMCAXsR3J3xK8DfK4OZaSYKgLV5JiGNXUhb9iKZhFn8scYjyHdZTEBCTge
         r8/Rz8WaUo0wfD/viAKzR2IdhyMJOpV74XLReoy/73N0Xb/1E7Q7zBXMzkJIaCgYm/OM
         h0Kw6zb5DXrz0Q68YDt9qOmJ7p5TCeTTyRNyBJxv+QiSAmrU+3sH7l+u2JXwT9kt8Yv9
         q5Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691483164; x=1692087964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bRPNurCVUK+kZN7q7E8TsOpZ2X9nLclQ5Lcqn45M43Y=;
        b=WKA683QgmCg/ZqNgaPNZMtDRVC0fNd1lLBozIOtsAjzzRnC4QkZordy2oItBQJfxjc
         WfsdqkJmYNKbZkPI8ZAlphIGivX0Q4mIWZ0x4qL7sDgb02w3hqHglO2v0+m/in5D1RQr
         CaFEgzAxZs56Upy081r7R/Qtp0KFk1VfA8okRXE2r+FwkgfmHexJL8ocIgkGnpQYiEIh
         KBKNro4wXVBy7+X4+M76R/rxDoEjatEn+fzUkID95VTiMw2GfHXs0pp1K6mJED3wIx3J
         Je81O+szQFBVwpoYEErdZwTW2bOssFgb2qDH41/+lI2AT0EUN+BD/fBE4qKI0QcyEcJE
         4UDA==
X-Gm-Message-State: AOJu0YyIy7SXzFTKhVN/hzV75uYFm8aP0gRL184sf/9qAtE2Jt3XA7c5
	LMnDGULhOC/dQYzLNL29xsJoG42uqdNuoxv5W8c=
X-Google-Smtp-Source: AGHT+IFcKitgCUMDjTXmYFgGTjati7nhjKf1RmPJEXoKcYA78VEzCeeOhe2OLLR3Pt79LBJFdpGryg==
X-Received: by 2002:a05:6512:358b:b0:4fd:d4b4:faba with SMTP id m11-20020a056512358b00b004fdd4b4fabamr7004297lfr.51.1691483164349;
        Tue, 08 Aug 2023 01:26:04 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id t13-20020a19ad0d000000b004fbae18984dsm1787087lfc.255.2023.08.08.01.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 01:26:03 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 08 Aug 2023 10:25:56 +0200
Subject: [PATCH 2/2] csky: Make pfn accessors static inlines
MIME-Version: 1.0
Message-Id: <20230808-csky-virt-to-phys-v1-2-ac727f8def2f@linaro.org>
References: <20230808-csky-virt-to-phys-v1-0-ac727f8def2f@linaro.org>
In-Reply-To: <20230808-csky-virt-to-phys-v1-0-ac727f8def2f@linaro.org>
To: Vineet Gupta <vgupta@kernel.org>, Guo Ren <guoren@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-csky@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_012614_545608_2ABCBDEF 
X-CRM114-Status: UNSURE (   9.90  )
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

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/csky/include/asm/page.h | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/csky/include/asm/page.h b/arch/csky/include/asm/page.h
index b23e3006a9e0..80da7e96a8fa 100644
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
+	return __va(pfn) << PAGE_SHIFT;
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
