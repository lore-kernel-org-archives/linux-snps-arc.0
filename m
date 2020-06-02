Return-Path: <SRS0=jMyS=7P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCCDC433DF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 21:32:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FD82207FB
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 21:32:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UuSgcg7h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TSHtH1zu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FD82207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/uSuvrYxqyOo7d5y4Q5eukPqdMyFDOqrD9O3/H8cSb0=; b=UuSgcg7homJLfD
	5Y3ot12XmwMqlzrTahwqCGi+W8XrkUK3mby9jLxx7PZUq/8bwQkUJaq4T7FOIqgb7cnHF0uQhZu1j
	2xMLDEW76fz/6U3e1yEsvkql2pOXZR+EC8G9RAbBudNy425ra9FqiZTCnFexHC421ItoyS3Pxysj/
	pOUHk76oFD96jZ/2pkHOWX2R1zsbrrQhmEHqftay8CeVaz9cPBAm6YhqBEGICR14ji1lJXDrLY0OC
	IiwFB+O6pvKY1cFipKQfzDT3fL4oMLbgcC44KohOd+OaxMBbKHZ1hDM9iFGhsrn6H02aDtM3qm1RK
	yESDnlUQbZzoty96eEjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgEWR-0005r9-5i; Tue, 02 Jun 2020 21:32:35 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgEWK-0005o2-ET
 for linux-snps-arc@lists.infradead.org; Tue, 02 Jun 2020 21:32:33 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B0A7AC041E;
 Tue,  2 Jun 2020 21:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591133544; bh=aQv1Yi9jCBXSfwZmH8wJD9uuH0q5pMyK17z1Z8frnz4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TSHtH1zuYjXE+lUZ267YqUN/4Cmc07W99+YxfcbNHXTaTSJETP4jdjTtFlM2tTb7F
 Fr/iScESMaY/6wISNmyV+H+2IRZTswYLdqrBwH/KJO/xcstTTXoNI+T8KasNolFJq8
 2GeBdNO0DE7kx54pUly/A4XoOWHxjbA0xN1zmis35vaeHnXCdgw8gX4214nLW+l2Cj
 36qppDFbh0c944DyNfgbrowv7RLeUenNPMrCWzQUcp2PvKKuwgOSfAcENUjRZttXMc
 Rt+oXM0KXYkYwzlXsHW3+GiYGuu34wih4TGi8AWMblxp0H+DDBE3ZQYhR9HurFmfTo
 NuJQjKKneWxjg==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 4AC98A00A2;
 Tue,  2 Jun 2020 21:32:23 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v3 2/4] iee754: provide gcc builtins based generic fma
 functions
Date: Tue,  2 Jun 2020 14:32:18 -0700
Message-Id: <20200602213220.6201-3-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200602213220.6201-1-vgupta@synopsys.com>
References: <20200602213220.6201-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_143228_550349_44A7692D 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
---
 sysdeps/generic/math-use-builtins.h         | 5 +++++
 sysdeps/ieee754/dbl-64/s_fma.c              | 6 ++++++
 sysdeps/ieee754/dbl-64/s_fmaf.c             | 6 ++++++
 sysdeps/ieee754/float128/float128_private.h | 2 ++
 sysdeps/ieee754/ldbl-128/s_fma.c            | 5 +++++
 sysdeps/ieee754/ldbl-128/s_fmal.c           | 5 +++++
 sysdeps/s390/fpu/math-use-builtins.h        | 5 +++++
 7 files changed, 34 insertions(+)

diff --git a/sysdeps/generic/math-use-builtins.h b/sysdeps/generic/math-use-builtins.h
index fc724c824a17..cf25ed8a2138 100644
--- a/sysdeps/generic/math-use-builtins.h
+++ b/sysdeps/generic/math-use-builtins.h
@@ -63,4 +63,9 @@
 #define USE_SQRT_BUILTIN 0
 #define USE_SQRTF_BUILTIN 0
 
+#define USE_FMA_BUILTIN 0
+#define USE_FMAF_BUILTIN 0
+#define USE_FMAL_BUILTIN 0
+#define USE_FMAF128_BUILTIN 0
+
 #endif /* math-use-builtins.h */
diff --git a/sysdeps/ieee754/dbl-64/s_fma.c b/sysdeps/ieee754/dbl-64/s_fma.c
index 876df6e78bdc..9dc5b132b9ee 100644
--- a/sysdeps/ieee754/dbl-64/s_fma.c
+++ b/sysdeps/ieee754/dbl-64/s_fma.c
@@ -25,6 +25,7 @@
 #include <fenv_private.h>
 #include <libm-alias-double.h>
 #include <tininess.h>
+#include <math-use-builtins.h>
 
 /* This implementation uses rounding to odd to avoid problems with
    double rounding.  See a paper by Boldo and Melquiond:
@@ -33,6 +34,10 @@
 double
 __fma (double x, double y, double z)
 {
+#if USE_FMA_BUILTIN
+  return __builtin_fma (x, y, z);
+#else
+  /* Use generic implementation.  */
   union ieee754_double u, v, w;
   int adjust = 0;
   u.d = x;
@@ -292,6 +297,7 @@ __fma (double x, double y, double z)
       v.ieee.mantissa1 |= j;
       return v.d * 0x1p-108;
     }
+#endif /* ! USE_FMA_BUILTIN  */
 }
 #ifndef __fma
 libm_alias_double (__fma, fma)
diff --git a/sysdeps/ieee754/dbl-64/s_fmaf.c b/sysdeps/ieee754/dbl-64/s_fmaf.c
index 57329d0a87fe..93b8660d5242 100644
--- a/sysdeps/ieee754/dbl-64/s_fmaf.c
+++ b/sysdeps/ieee754/dbl-64/s_fmaf.c
@@ -23,6 +23,7 @@
 #include <math-barriers.h>
 #include <fenv_private.h>
 #include <libm-alias-float.h>
+#include <math-use-builtins.h>
 
 /* This implementation relies on double being more than twice as
    precise as float and uses rounding to odd in order to avoid problems
@@ -33,6 +34,10 @@
 float
 __fmaf (float x, float y, float z)
 {
+#if USE_FMAF_BUILTIN
+  return __builtin_fmaf (x, y, z);
+#else
+  /* Use generic implementation.  */
   fenv_t env;
 
   /* Multiplication is always exact.  */
@@ -60,6 +65,7 @@ __fmaf (float x, float y, float z)
 
   /* And finally truncation with round to nearest.  */
   return (float) u.d;
+#endif /* ! USE_FMAF_BUILTIN  */
 }
 #ifndef __fmaf
 libm_alias_float (__fma, fma)
diff --git a/sysdeps/ieee754/float128/float128_private.h b/sysdeps/ieee754/float128/float128_private.h
index f97463d9dc1b..ab6fc9f3c9cf 100644
--- a/sysdeps/ieee754/float128/float128_private.h
+++ b/sysdeps/ieee754/float128/float128_private.h
@@ -154,6 +154,8 @@
 #define USE_ROUNDL_BUILTIN USE_ROUNDF128_BUILTIN
 #undef USE_COPYSIGNL_BUILTIN
 #define USE_COPYSIGNL_BUILTIN USE_COPYSIGNF128_BUILTIN
+#undef USE_FMAL_BUILTIN
+#define USE_FMAL_BUILTIN USE_FMAF128_BUILTIN
 
 /* IEEE function renames.  */
 #define __ieee754_acoshl __ieee754_acoshf128
diff --git a/sysdeps/ieee754/ldbl-128/s_fma.c b/sysdeps/ieee754/ldbl-128/s_fma.c
index 13f8ed3b87eb..0feff0a71cd1 100644
--- a/sysdeps/ieee754/ldbl-128/s_fma.c
+++ b/sysdeps/ieee754/ldbl-128/s_fma.c
@@ -21,6 +21,7 @@
 #include <fenv.h>
 #include <ieee754.h>
 #include <libm-alias-double.h>
+#include <math-use-builtins.h>
 
 /* This implementation relies on long double being more than twice as
    precise as double and uses rounding to odd in order to avoid problems
@@ -31,6 +32,9 @@
 double
 __fma (double x, double y, double z)
 {
+#if USE_FMA_BUILTIN
+  return __builtin_fma (x, y, z);
+#else
   fenv_t env;
   /* Multiplication is always exact.  */
   long double temp = (long double) x * (long double) y;
@@ -50,6 +54,7 @@ __fma (double x, double y, double z)
   feupdateenv (&env);
   /* And finally truncation with round to nearest.  */
   return (double) u.d;
+#endif /* ! USE_FMA_BUILTIN  */
 }
 #ifndef __fma
 libm_alias_double (__fma, fma)
diff --git a/sysdeps/ieee754/ldbl-128/s_fmal.c b/sysdeps/ieee754/ldbl-128/s_fmal.c
index 7475015bcec6..a610499e47c7 100644
--- a/sysdeps/ieee754/ldbl-128/s_fmal.c
+++ b/sysdeps/ieee754/ldbl-128/s_fmal.c
@@ -25,6 +25,7 @@
 #include <math_private.h>
 #include <libm-alias-ldouble.h>
 #include <tininess.h>
+#include <math-use-builtins.h>
 
 /* This implementation uses rounding to odd to avoid problems with
    double rounding.  See a paper by Boldo and Melquiond:
@@ -33,6 +34,9 @@
 _Float128
 __fmal (_Float128 x, _Float128 y, _Float128 z)
 {
+#if USE_FMAL_BUILTIN
+  return __builtin_fmal (x, y, z);
+#else
   union ieee854_long_double u, v, w;
   int adjust = 0;
   u.d = x;
@@ -296,5 +300,6 @@ __fmal (_Float128 x, _Float128 y, _Float128 z)
       v.ieee.mantissa3 |= j;
       return v.d * L(0x1p-228);
     }
+#endif /* ! USE_FMAL_BUILTIN  */
 }
 libm_alias_ldouble (__fma, fma)
diff --git a/sysdeps/s390/fpu/math-use-builtins.h b/sysdeps/s390/fpu/math-use-builtins.h
index eb87b6b0b16b..3a80f86b2e29 100644
--- a/sysdeps/s390/fpu/math-use-builtins.h
+++ b/sysdeps/s390/fpu/math-use-builtins.h
@@ -111,4 +111,9 @@
 #define USE_SQRT_BUILTIN 0
 #define USE_SQRTF_BUILTIN 0
 
+#define USE_FMA_BUILTIN 0
+#define USE_FMAF_BUILTIN 0
+#define USE_FMAL_BUILTIN 0
+#define USE_FMAF128_BUILTIN 0
+
 #endif /* math-use-builtins.h */
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
