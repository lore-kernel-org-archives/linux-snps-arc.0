Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D5FC4332F
	for <linux-snps-arc@archiver.kernel.org>; Sat,  4 Nov 2023 09:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOWyLLJX/maRuCoX+Q2kvOqUJZ59TmE1wYXVcJGTJ90=; b=H8qMTJNWYQkl9U
	xEPCmuDMXeOIXI2586FZOUh8VGD3tS76jBFLznv93Kp95x7nkUXkD7vCY5ygG3rZRfErMPyx/KjFK
	BTgMaZBcrymAw+5tDGg46atu9Ll69HEn1UZLGR8dqQ4gZm1cqHbwo+5EvCXNCXVG/5N65nkpTvuP4
	x0K4wERnXJxDEnyvLFcVqb+7LkSSdy6m36zs7ChQ+jKD+14yVnqpSSxT3wqPCbQN3jEz/pvkEqzU8
	IvLcHpVfDGXG+vLCW4rOjATomedYupfb8iS0hXWMWJwH7COQ5oRsk4H5LYOxlNpQ21GNUID/+TjZY
	2a1pFSD9hKVJ7QVGgpbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzClq-00Cxkt-04;
	Sat, 04 Nov 2023 09:16:46 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzClm-00CxkK-32
	for linux-snps-arc@lists.infradead.org;
	Sat, 04 Nov 2023 09:16:44 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cc7077d34aso22456395ad.2
        for <linux-snps-arc@lists.infradead.org>; Sat, 04 Nov 2023 02:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1699089401; x=1699694201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnHn4ZqYSv6UF9nJWzupxlkq5TCbHngLtT+ZAjUP9Mk=;
        b=aryHg/1Je+DJUmwcK2YvSYOZ7354dVhNHAXBQaaUZ47cmxYFC68KMva+S7jUIXeTEh
         /WTbVqgGxg4qSbk8/GkAjVLLvb3ZXRmtylqrrkuOdN9HkHDqx2BJJRBC5t0mh1FF/NQE
         rD/b//cWFv6mdl6FU9SubzRZwf3gPKpUP9RRQ31e5Q4k39hES9lYn2blDRH0CleZOSvn
         Vz6/F/ZoeD9v3KWz4RSpmXmSjhHBZnjCTRfZYJMFGTKzyu7yoTZ0fruRpZfLRxn3Yfpn
         WOFnz1GVaD7Y153Wp8tRqOkx0RgboH+orJoPl/4CgRNPzjjvL6O80ekknOOPm1SZc0eW
         0YKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699089401; x=1699694201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NnHn4ZqYSv6UF9nJWzupxlkq5TCbHngLtT+ZAjUP9Mk=;
        b=Nx/FJde7IamXTcrewPvwSklz2VGgeHfwj2FcOVs3iXrgV0+K2ueNDY+z8sjOeN+uIT
         VVCmDsq37fpSJkciK4S5eX2GiQBoNkKO/B3xFN5Utcx6H0iWq2DDfWIpAoBLkCnHYP5T
         nSSxavCF/05VBJMLnsXLUy0PaRwe5H8UDc97T8z8VJoBE93KRa80IQrkvrQofTaJzvH+
         Lm26ZE6zhoCTFiUDpCkdXCxqdVQp/W9LipVy3g2rhdq0mvtFHPgpfi3slS7FG6uAP6Oo
         1sYAeDIHA0+SAkgY2ED1pmrF+Yvd0Oj7iCMDv9FXwhP4pK61Y7n/YUcpzR6R1DMbl8kQ
         GrVw==
X-Gm-Message-State: AOJu0Yxl+N9p/avYBMXXvcHEfSBCSaco6Cs/sjYtRYrNYXAizREP+ppV
	+FS+jR8goSZGnsitdjrmMDhCYQ==
X-Google-Smtp-Source: AGHT+IE936bciD6jxw/aPE7Ri4Nchb1ZjhcSOeC+o89C0cd9w4WgJ6Zblfg0CycLSJlNDrYYtwFiUA==
X-Received: by 2002:a17:902:d28b:b0:1cc:13d0:d515 with SMTP id t11-20020a170902d28b00b001cc13d0d515mr17598501plc.20.1699089401491;
        Sat, 04 Nov 2023 02:16:41 -0700 (PDT)
Received: from devz1.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d4-20020a170903230400b001cc54202429sm2585127plh.288.2023.11.04.02.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 02:16:41 -0700 (PDT)
From: "wuqiang.matt" <wuqiang.matt@bytedance.com>
To: vgupta@kernel.org,
	bcain@quicinc.com,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com,
	geert@linux-m68k.org,
	andi.shyti@linux.intel.com,
	mingo@kernel.org,
	palmer@rivosinc.com,
	andrzej.hajda@intel.com,
	arnd@arndb.de,
	peterz@infradead.orgm,
	mhiramat@kernel.org
Cc: linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	mattwu@163.com,
	linux@roeck-us.ne,
	"wuqiang.matt" <wuqiang.matt@bytedance.com>
Subject: [PATCH v2 2/4] locking/atomic: arc: arch_cmpxchg[64]_local undefined
Date: Sat,  4 Nov 2023 17:16:13 +0800
Message-Id: <20231104091615.4884-3-wuqiang.matt@bytedance.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231104091615.4884-1-wuqiang.matt@bytedance.com>
References: <20231104091615.4884-1-wuqiang.matt@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231104_021643_018943_72413F34 
X-CRM114-Status: UNSURE (   9.18  )
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

For architectures that support native cmpxchg, we'd like to
implement arch_cmpxchg[64]_local with the native variants of
supported data size. If not, the generci_cmpxchg[64]_local
will be used.

Signed-off-by: wuqiang.matt <wuqiang.matt@bytedance.com>
---
 arch/arc/include/asm/cmpxchg.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index bf46514f6f12..91429f2350df 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -80,6 +80,34 @@
 
 #endif
 
+/*
+ * always make arch_cmpxchg[64]_local available, native cmpxchg
+ * will be used if available, then generic_cmpxchg[64]_local
+ */
+#include <asm-generic/cmpxchg-local.h>
+static inline unsigned long __cmpxchg_local(volatile void *ptr,
+				      unsigned long old,
+				      unsigned long new, int size)
+{
+	switch (size) {
+#ifdef CONFIG_ARC_HAS_LLSC
+	case 4:
+		return __cmpxchg_32((int32_t *)ptr, old, new);
+#endif
+	default:
+		return __generic_cmpxchg_local(ptr, old, new, size);
+	}
+
+	return old;
+}
+#define arch_cmpxchg_local(ptr, o, n) ({				\
+	(__typeof__(*ptr))__cmpxchg_local((ptr),			\
+					(unsigned long)(o),		\
+					(unsigned long)(n),		\
+					sizeof(*(ptr)));		\
+})
+#define arch_cmpxchg64_local(ptr, o, n) __generic_cmpxchg64_local((ptr), (o), (n))
+
 /*
  * xchg
  */
-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
