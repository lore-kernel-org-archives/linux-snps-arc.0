Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013DCC77B75
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 May 2023 14:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqEDlnEkJ7SNYSni10d072QDnlRGJQeQU7W88SSvKhw=; b=lJnUmDwx9l4vYf
	MCKEvfqf+isV2s5ILHQDYjTcbK8iWum7WpNkAUuZhKEX3M0j15Da5ItWy0wrSNGIIODcpfgAs8WGh
	w+8cQ844UatT7DtgzgcbZCgr9WI1MRJpJYCCerZDyq93EdWUwmjPeYYIS23t0NW8DPP0R/eQBhPom
	CIPuakGXIhz9yHkBctt0lf9fJRv89Ez8PIurfQ/d/S/g9pABV1dqDAsfNtRmAh4qN7IAu+LvQqn4M
	Q03+K2363CgrMsB4en9GlkDVUzQyY+KgnxuKII4ImCyVx9T+DCr6Ks33BKhe3PTffGJXacGl7lp/p
	vswnwjKXDJrQ5dZsI/Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1TDo-00AWxZ-0d;
	Tue, 23 May 2023 14:42:44 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1TDa-00AWsF-2a
	for linux-snps-arc@bombadil.infradead.org;
	Tue, 23 May 2023 14:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UDtU5Jqmt1rhTrWGvrFpFNAhujSWuurCg4wxa03/anU=; b=LaMV4Oc6FfjA1rk/c2iub2V/Qk
	H+p6LLBKib8FF1so+AvmRIDmRmCW5dN3U4z7vL5e50e2P/n3yNoDA9urSkdzGerZ9bz1WacZUkFTU
	ZVJctbdvBFUZP0GVEVUZGVCktWtwMaI6k+chHf/lYe5hClOkym/EnpqK4zrV3Tu+wQ+9cXozdnqeZ
	tWob3b36aOtcGA+9S4Y6wz//aGDqkhu3puKHEl0R/xV8qUc3Zc/RnXgwRqbPG0d+q+X7dT2DHep8K
	6x5Yys4hfMrGNPEqO4+2ijYiN65UxRcxuVpofGV3Ux2XQvpvH3TMTQ+Ae0Br6tG8+yPBZNo3Rmsw/
	Zq2t5VRw==;
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Sf9-003Xxl-06
	for linux-snps-arc@lists.infradead.org;
	Tue, 23 May 2023 14:06:58 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f3edc05aa5so3196230e87.3
        for <linux-snps-arc@lists.infradead.org>; Tue, 23 May 2023 07:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684850754; x=1687442754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDtU5Jqmt1rhTrWGvrFpFNAhujSWuurCg4wxa03/anU=;
        b=HpmD5IFXXBYh79hB/QdHKbKxuFRZSDMi4b5OZGTylI/XbzqUU0nz4W2BvN6yvKss7I
         K1cwCwlsNLZKWtwDIbEgnBIwLeSRk9MusgogzqpLIGkeV6I3IpHf5ZImCV1dO7TmBmQd
         Jxo5lBjORGSyxFQpYfuSMr3vb6XHB27JbLUYvAKRm5hN6Vx2cqGdrc5nBtxembJzIGb+
         XkA5TOH4FTAGjGGX8LhKx2vDYw5pSIfYWUjWXmA8zVjBOfrxf/vDnuKaKLU2/n/3jNel
         W+4yMbxUSUGgrAJBjS8Un11ko0kSEr5ibGVEHRlBzUWYgh4gIdzzchv9ZLkOCYx4CEzT
         1cyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850754; x=1687442754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDtU5Jqmt1rhTrWGvrFpFNAhujSWuurCg4wxa03/anU=;
        b=DPZBvGmN7g3SXmHEalLQXCUueR/WkqMEIzHQDS8i/i3Hhw6GLEUEkdwAC9FAWCdm6Q
         EhbT4L08keP/5601pWRq1OpmqLsIJRqFFxznQw+/Xj7kcS/6ZUg1WX0sc4DEVcaIcpKc
         vHpIW3SDPYmVZCJ+RJM+k5DygDIbowVf5RgiRYA7cRM9ROtcC/1UFcWE0/F2zxugDzrP
         dff6Jwc0NqXlw29v5u3l9XZqV+j5/M4GlSMH/fL82rrvIpa5O/Cl48gilGmcEm0pCaR5
         U16Ecu4pKHtA6Cp4WuogIIlux4c69+SSg1Xij1acVqvwCZgjy2/j5ief9a4/t78/dWAf
         x6wQ==
X-Gm-Message-State: AC+VfDyaINyjGMRy2oeFvhZASsNqqquoOBQ5IVDo4HgjU983TDGWLOQA
	f9Jrebp7KIwANKFtQr8eYTHQVg==
X-Google-Smtp-Source: ACHHUZ7lHZmUmrpa6AszHCZQHgR8jjoC1zWdiC0X3jOoWePtInb6ZlpLCgb3B/kHs0cj9MvDG7f8Ew==
X-Received: by 2002:ac2:51a9:0:b0:4f3:b9bc:9d68 with SMTP id f9-20020ac251a9000000b004f3b9bc9d68mr2955818lfk.18.1684850754250;
        Tue, 23 May 2023 07:05:54 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id h28-20020ac2597c000000b004e9bf853c27sm1346562lfp.70.2023.05.23.07.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 07:05:53 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 May 2023 16:05:33 +0200
Subject: [PATCH v3 09/12] asm-generic/page.h: Make pfn accessors static
 inlines
MIME-Version: 1.0
Message-Id: <20230503-virt-to-pfn-v6-4-rc1-v3-9-a16c19c03583@linaro.org>
References: <20230503-virt-to-pfn-v6-4-rc1-v3-0-a16c19c03583@linaro.org>
In-Reply-To: <20230503-virt-to-pfn-v6-4-rc1-v3-0-a16c19c03583@linaro.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, 
 Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-mm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-snps-arc@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_150656_298605_58C5834F 
X-CRM114-Status: GOOD (  10.80  )
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

For symmetry we do the same change for pfn_to_virt.

Immediately define virt_to_pfn and pfn_to_virt to the static
inline after the static inline since this style of defining
functions is used for the generic helpers.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/asm-generic/page.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/asm-generic/page.h b/include/asm-generic/page.h
index c0be2edeb484..9773582fd96e 100644
--- a/include/asm-generic/page.h
+++ b/include/asm-generic/page.h
@@ -74,8 +74,16 @@ extern unsigned long memory_end;
 #define __va(x) ((void *)((unsigned long) (x)))
 #define __pa(x) ((unsigned long) (x))
 
-#define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
-#define pfn_to_virt(pfn)	__va((pfn) << PAGE_SHIFT)
+static inline unsigned long virt_to_pfn(const void *kaddr)
+{
+	return __pa(kaddr) >> PAGE_SHIFT;
+}
+#define virt_to_pfn virt_to_pfn
+static inline void *pfn_to_virt(unsigned long pfn)
+{
+	return __va(pfn) << PAGE_SHIFT;
+}
+#define pfn_to_virt pfn_to_virt
 
 #define virt_to_page(addr)	pfn_to_page(virt_to_pfn(addr))
 #define page_to_virt(page)	pfn_to_virt(page_to_pfn(page))

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
