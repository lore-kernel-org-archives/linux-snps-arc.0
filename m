Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A610CC61D85
	for <linux-snps-arc@archiver.kernel.org>; Tue, 21 Nov 2023 14:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJkdjcKsKgkrqWaNs1lmeDJGw11qe8fmuxTmad69vZk=; b=ZW1hr652ctpwHs
	gM6fkl/Slw5S6E9x8QjLGlcU7VMy4zfStd6Ju1ofITT06x/uQau/SQBnMqFUd9WiiS91oIzmVzRbF
	ZzpJ36MzSkAhiATmcSN0yefinulv1gdaJNrAE44B0a8qIH1jegFaoG4VxU0UQWsO51k1gp2J0bRMM
	sZ+Rde+aNLoxSFUO297MHGCxRX3Mca56pI7MEVt5HEG0xQEVsseM1pM1pwraGVdrxMP1+4JkaB9QB
	B2EOOMekZH6MiOzWAl5WEqfc7VdzTO58SJc+2pBwH20edDWaxCRpN8J1UNxYPGHrUIGWf/22CSHBd
	5FILWcFG1ifXrKhNcFLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Rgh-00H0tE-0i;
	Tue, 21 Nov 2023 14:25:15 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Rgd-00H0sH-2g
	for linux-snps-arc@lists.infradead.org;
	Tue, 21 Nov 2023 14:25:13 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6cb66fbc63dso1968707b3a.0
        for <linux-snps-arc@lists.infradead.org>; Tue, 21 Nov 2023 06:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1700576710; x=1701181510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtVyhAGSgxoCUXjWEvR6JSaSck3SbghSEmVuA82Ner4=;
        b=c3s1nHsYqekJJS4OIv7r8ORn2sCnBJZWKWFPTKRTPNq476hSiGxlfBHABwizVKpdjv
         T+D667DtWXbfPK0eSTqTnxu1k8jlvbbHIXkOngtnMqn/ouKeay9IrPO4wOO4YG8kJi8y
         +24ZHXZPSOl795eQS6ndl/7N42dbohH+PrafHst+Kd5/KDCdRGLLjnfa4CNmXhp64ZGe
         BXKH7U44X2Lwn5f2vbVN/d9BemibV5z5Cxg61BX2Nq/wGdUXrAmjV+Rjrqmx2sI8C4XB
         U5S7ISs5ZPJytE7Q7Ddegz//FSC0uG1aZhSibO99rTr4Vr1hBJ1f+1td5dzNluO1NOOn
         PJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700576710; x=1701181510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtVyhAGSgxoCUXjWEvR6JSaSck3SbghSEmVuA82Ner4=;
        b=MGA9oCzgohwtSVSHLIib7vWj8+Epi/ZVoeiSOPTx5352oDuXJ+6JES6BYW6W0psQvk
         gDE3YWtbRIq7T7GaAgmt4MgsJBmjusIXgzG+zgb/TnwTtZ/Z2dJXM3ebDyauF2Sq3vaY
         +XG3B08dPKU0vzDUwvJxk1RvdzMHA0z5yLj0Vuzlgmj3JfIe61DpnnXBNKstuS2gocBm
         7VufAK8rLnpW2Jjb/9dewdnRIUILJN9S6V/DQUThfgFhdOwis6F072o9c5f/oY5nf9+t
         QhH/kOIUcw7hM6AU3CAtjDzLAFA1Y88OmkyqfhsoG2CywEpIohvAd393mpIBkhzoPbNG
         b4Gw==
X-Gm-Message-State: AOJu0Yyuxrs9z3T1GfGfUSgS/9by2OJxAQ5nFi4Detc6trK+Nr12JmOm
	rKoiIBrDtmReH66EdD4pzvdKHA==
X-Google-Smtp-Source: AGHT+IGFtHc4qKqJVnN1XjVMkiinlk0jG07pQ1wbI9nowl9FuK5wiYNBs1I2uzxLrjyzw/P8FvB74A==
X-Received: by 2002:a05:6a00:1d8c:b0:6cb:ba8d:96a7 with SMTP id z12-20020a056a001d8c00b006cbba8d96a7mr4393242pfw.14.1700576710440;
        Tue, 21 Nov 2023 06:25:10 -0800 (PST)
Received: from devz1.bytedance.net ([203.208.167.146])
        by smtp.gmail.com with ESMTPSA id d13-20020a056a00244d00b0068842ebfd10sm7923193pfj.160.2023.11.21.06.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 06:25:10 -0800 (PST)
From: "wuqiang.matt" <wuqiang.matt@bytedance.com>
To: ubizjak@gmail.com,
	mark.rutland@arm.com,
	vgupta@kernel.org,
	bcain@quicinc.com,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	geert@linux-m68k.org,
	andi.shyti@linux.intel.com,
	mingo@kernel.org,
	palmer@rivosinc.com,
	andrzej.hajda@intel.com,
	arnd@arndb.de,
	peterz@infradead.org,
	mhiramat@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	mattwu@163.com,
	linux@roeck-us.net,
	"wuqiang.matt" <wuqiang.matt@bytedance.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3 4/5] arch,locking/atomic: hexagon: add arch_cmpxchg[64]_local
Date: Tue, 21 Nov 2023 22:23:46 +0800
Message-Id: <20231121142347.241356-5-wuqiang.matt@bytedance.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231121142347.241356-1-wuqiang.matt@bytedance.com>
References: <20231121142347.241356-1-wuqiang.matt@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_062511_868486_41869551 
X-CRM114-Status: GOOD (  11.21  )
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

hexagonc hasn't arch_cmpxhg_local implemented, which causes
building failures for any references of try_cmpxchg_local,
reported by the kernel test robot.

This patch implements arch_cmpxchg[64]_local with the native
cmpxchg variant if the corresponding data size is supported,
otherwise generci_cmpxchg[64]_local is to be used.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310272207.tLPflya4-lkp@intel.com/

Signed-off-by: wuqiang.matt <wuqiang.matt@bytedance.com>
Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 arch/hexagon/include/asm/cmpxchg.h | 51 +++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/arch/hexagon/include/asm/cmpxchg.h b/arch/hexagon/include/asm/cmpxchg.h
index bf6cf5579cf4..302fa30f25aa 100644
--- a/arch/hexagon/include/asm/cmpxchg.h
+++ b/arch/hexagon/include/asm/cmpxchg.h
@@ -8,6 +8,8 @@
 #ifndef _ASM_CMPXCHG_H
 #define _ASM_CMPXCHG_H
 
+#include <linux/build_bug.h>
+
 /*
  * __arch_xchg - atomically exchange a register and a memory location
  * @x: value to swap
@@ -51,13 +53,15 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
  *  variable casting.
  */
 
-#define arch_cmpxchg(ptr, old, new)				\
+#define __cmpxchg_32(ptr, old, new)				\
 ({								\
 	__typeof__(ptr) __ptr = (ptr);				\
 	__typeof__(*(ptr)) __old = (old);			\
 	__typeof__(*(ptr)) __new = (new);			\
 	__typeof__(*(ptr)) __oldval = 0;			\
 								\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 4);			\
+								\
 	asm volatile(						\
 		"1:	%0 = memw_locked(%1);\n"		\
 		"	{ P0 = cmp.eq(%0,%2);\n"		\
@@ -72,4 +76,49 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
 	__oldval;						\
 })
 
+#define __cmpxchg(ptr, old, val, size)				\
+({								\
+	__typeof__(*(ptr)) oldval;				\
+								\
+	switch (size) {						\
+	case 4:							\
+		oldval = __cmpxchg_32(ptr, old, val);		\
+		break;						\
+	default:						\
+		BUILD_BUG();					\
+		oldval = val;					\
+		break;						\
+	}							\
+								\
+	oldval;							\
+})
+
+#define arch_cmpxchg(ptr, o, n)	__cmpxchg((ptr), (o), (n), sizeof(*(ptr)))
+
+/*
+ * always make arch_cmpxchg[64]_local available, native cmpxchg
+ * will be used if available, then generic_cmpxchg[64]_local
+ */
+#include <asm-generic/cmpxchg-local.h>
+
+#define arch_cmpxchg_local(ptr, old, val)			\
+({								\
+	__typeof__(*(ptr)) __retval;				\
+	int __size = sizeof(*(ptr));				\
+								\
+	switch (__size) {					\
+	case 4:							\
+		__retval = __cmpxchg_32(ptr, old, val);		\
+		break;						\
+	default:						\
+		__retval = __generic_cmpxchg_local(ptr, old,	\
+						val, __size);	\
+		break;						\
+	}							\
+								\
+	__retval;						\
+})
+
+#define arch_cmpxchg64_local(ptr, o, n) __generic_cmpxchg64_local((ptr), (o), (n))
+
 #endif /* _ASM_CMPXCHG_H */
-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
