Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4676EC77B73
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 May 2023 07:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MsaL+uT+DXlnxuThc6Q8EM0bsUiKCthFL0a9255xgvg=; b=b104SsoEjZRDvx
	lybGc0+somI4wIUU2i3EKh9NauptukyCz8g97X8OtmGe2YIIMyCv5yA64zkm/vIUzniqN1g+nsk/7
	kDm6EgNmF7Z/RZQrDH8plxWInCG8dmZkaoYIdjCQmhFLyCZf7UNRiNZv+3MU5Im7pq3LkwitS79O3
	ke51DG6Xh1p53LdyoBMeBy3J8nn4ls7N6Enxj6WGEphv7N69Rx4KKHfGnVWpTGgyBIqrmUfjXtQmY
	UuVem0TyOF9dh6tsOObr6EDhIkqZcZqVcbA4aL8MK7knB/9ntl1Zfp3V016q1xl4BrnYZIFVcGfHg
	fjaCZ9CKb7Cd7pHtVkIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zXc-005ZUV-1s;
	Mon, 22 May 2023 07:01:12 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0zXH-005ZHl-1Q
	for linux-snps-arc@lists.infradead.org;
	Mon, 22 May 2023 07:00:52 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2af20198f20so41912241fa.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 22 May 2023 00:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684738851; x=1687330851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=721W88MgL2sNJMPnk6EOnDreN0TGHiKcLljkK4k+Xz4=;
        b=XQtAW71u4fTNd1m3CoQ2jBdXD9/L9co0wiCGXKPV7VPHkFBkn2paLpq4u7Zun4vihP
         Jt89fVfIK/kqwIEhUG0rEaMiY9youfI2gwNHpVmFNoLUlHPTqMB+dSsLsyZ0Nud3GfbF
         dtwCWhOjSDsxmfy8EsojhF7c8s35Z8LE87tWI+GqyJFAAak2TwvLXaQdq7RckdkYTHnU
         18kKgbLJk4GVeA4A4vRYQZN2Dj0n1wcSakUxJpXVVadQkTB4oxfQonCpFh8YOMyqM+LF
         0rSyjSqVr+DzD+fnTYDbXV9mB2Zq6QefKszArXVUbAr8pzAQFYflvnoSfXBTu+vX7dJn
         HUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684738851; x=1687330851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=721W88MgL2sNJMPnk6EOnDreN0TGHiKcLljkK4k+Xz4=;
        b=cKzDOD0Z7PPvwLd7KVI4QeGI2ZfauaZAs8+5yhEo0dg6/wpDR+lOO6KYqrwnJ5T37M
         BwyjevbRCa07182CNImYNviPk8N0DuO+i/mz+WMokuzqWQzfC5gZpeQ+ko7CYaXJRwck
         iZ+eEAPJaeOLw5CyV4AWNIdHf2zMt4JctLETk0OyJ693x6WpRcflGnYNlRRjmLANneZS
         Kq86SrRsr/MKXxMI9ioo7JG0QMHwAEj+0TerIhjOFtbuU7PlQAQ1bo2Olb0RJKeIisHl
         mddVITvSWBuUuiWlVBz1Nbx+qoSnbCvif4ZRzRjH1SQj+MtDWE+qPtWztiPC38MhLeCa
         Yj7Q==
X-Gm-Message-State: AC+VfDx2vuHvmHQ+mz7mLOuIOqMX14UKE8BjX1QLGgh1SM3EDNwD8ztf
	FAc0Gag9SnreSWnGOXAT/J6DVA==
X-Google-Smtp-Source: ACHHUZ5ydZUl5A6m9S8q9aK0NB+Gru9l4ALPwz/cspLv7wmn5Xxzg3mgI231HvvSe3EG+T/ALpu70Q==
X-Received: by 2002:a2e:8e89:0:b0:2b0:259d:f670 with SMTP id z9-20020a2e8e89000000b002b0259df670mr453615ljk.4.1684738850979;
        Mon, 22 May 2023 00:00:50 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id q4-20020a2e8744000000b002adb98fdf81sm1010187ljj.7.2023.05.22.00.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 00:00:50 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 22 May 2023 09:00:46 +0200
Subject: [PATCH v2 11/12] arm64: memory: Make virt_to_pfn() a static inline
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v2-11-0948d38bddab@linaro.org>
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
X-CRM114-CacheID: sfid-20230522_000051_510713_C42DAFD1 
X-CRM114-Status: GOOD (  11.59  )
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

Since arm64 is using <asm-generic/memory_model.h> to provide
__phys_to_pfn() we need to move the inclusion of that header
up, so we can resolve the static inline at compile time.

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm64/include/asm/memory.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index c735afdf639b..4d85212b622e 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -331,6 +331,14 @@ static inline void *phys_to_virt(phys_addr_t x)
 	return (void *)(__phys_to_virt(x));
 }
 
+/* Needed already here for resolving __phys_to_pfn() in virt_to_pfn() */
+#include <asm-generic/memory_model.h>
+
+static inline unsigned long virt_to_pfn(const void *kaddr)
+{
+	return __phys_to_pfn(virt_to_phys(kaddr));
+}
+
 /*
  * Drivers should NOT use these either.
  */
@@ -339,7 +347,6 @@ static inline void *phys_to_virt(phys_addr_t x)
 #define __pa_nodebug(x)		__virt_to_phys_nodebug((unsigned long)(x))
 #define __va(x)			((void *)__phys_to_virt((phys_addr_t)(x)))
 #define pfn_to_kaddr(pfn)	__va((pfn) << PAGE_SHIFT)
-#define virt_to_pfn(x)		__phys_to_pfn(__virt_to_phys((unsigned long)(x)))
 #define sym_to_pfn(x)		__phys_to_pfn(__pa_symbol(x))
 
 /*

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
