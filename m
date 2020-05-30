Return-Path: <SRS0=KuJb=7M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97ECFC433DF
	for <linux-snps-arc@archiver.kernel.org>; Sat, 30 May 2020 02:01:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3879420810
	for <linux-snps-arc@archiver.kernel.org>; Sat, 30 May 2020 02:01:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mPW9AAk9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mXHsetQR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3879420810
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Q/T3uKdWxU4CVoCtdKj+HNO3laSg8KuRge5HLwiZk4=; b=mPW9AAk9w1trcn
	C/C49Xy5pu+5E01qiCl2vqPd1IawUcqW1OXApODujuCcKZEEjFdXA60gy1w439u/PXgGpvFktlwBk
	MshVYBtK7ZqzLmYUsmLE8BO0yzQ1+5PsHvqcABqR/x97fYiOuMti3Ig/xbJam8gyN1a8DpLI8dHry
	w36TwpOKt8aEy3xATTqovZeGKUZ4ezfrvnAlwFe2OXDv2qMkhBD/Y9CCNRiyRoDaKxUJR6wy1Oj2C
	h1ediIcXbkwvcYqMJy1l9C4Y/eozBARpMYNHyL3uFM9lKtPoBxj9Zvac5tAhkHwlNtoYxrmFHW6XQ
	2nIQxogz5oZc0J9zIF4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeqny-0004tz-8y; Sat, 30 May 2020 02:00:58 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeqnt-0004rI-Lu
 for linux-snps-arc@lists.infradead.org; Sat, 30 May 2020 02:00:56 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B24F04095F;
 Sat, 30 May 2020 02:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1590804051; bh=VWA5Oop2Q1Ex/g7HD7ms4DnZaHTvZz/x1ZPyhcIxmL4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mXHsetQRB6IehklWKNUB/pTvFtaS4IjRMNSrRlwBxFIDre7+OqIN9nKUkSWhSB7s5
 x2LFJGHWxdSaoFg9+wB7EqVOnp2zPy3Git8J9rtNiJ1fpsFYRdi4f/Fz+zYBZJcOHC
 LJDcuMLlOFmWY9MtHPh0HLOdl0cew7ccaEggpAsMXYHHVn6fleL1zz3NsYv7IKlhw4
 tQk5yFjgqvb+y11SOc1a3VwH+q5v3L/Ha1u6uIqqNEUj23h7mdAlXY9FFINYyUOXuy
 MLsdhqV16LYxd1+yQbnA0yNg5l3bHaO8qLd5pzYMiCNYttOiBrwLj6UrdcXO988kJ8
 4WvzNuhQyAlQQ==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 7CA31A023C;
 Sat, 30 May 2020 02:00:51 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH 3/5] iee754: prvoide gcc builtins based generic fma functions
Date: Fri, 29 May 2020 19:00:45 -0700
Message-Id: <20200530020047.5490-4-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200530020047.5490-1-vgupta@synopsys.com>
References: <20200530020047.5490-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_190053_753686_9E3AA53C 
X-CRM114-Status: UNSURE (   8.82  )
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

---
 sysdeps/generic/math-use-builtins.h         | 4 ++++
 sysdeps/ieee754/dbl-64/s_fma.c              | 6 ++++++
 sysdeps/ieee754/dbl-64/s_fmaf.c             | 6 ++++++
 sysdeps/ieee754/float128/float128_private.h | 2 ++
 sysdeps/ieee754/ldbl-128/s_fmal.c           | 5 +++++
 5 files changed, 23 insertions(+)

diff --git a/sysdeps/generic/math-use-builtins.h b/sysdeps/generic/math-use-builtins.h
index fc724c824a17..9e96807a3370 100644
--- a/sysdeps/generic/math-use-builtins.h
+++ b/sysdeps/generic/math-use-builtins.h
@@ -63,4 +63,8 @@
 #define USE_SQRT_BUILTIN 0
 #define USE_SQRTF_BUILTIN 0
 
+#define USE_FMA_BUILTIN 0
+#define USE_FMAF_BUILTIN 0
+#define USE_FMAL_BUILTIN 0
+
 #endif /* math-use-builtins.h */
diff --git a/sysdeps/ieee754/dbl-64/s_fma.c b/sysdeps/ieee754/dbl-64/s_fma.c
index 876df6e78bdc..1e4b2da1511d 100644
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
+  return __builtin_fma (x);
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
index 57329d0a87fe..f15b18262124 100644
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
+  return __builtin_fmaf (x);
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
index f97463d9dc1b..a697a7c29038 100644
--- a/sysdeps/ieee754/float128/float128_private.h
+++ b/sysdeps/ieee754/float128/float128_private.h
@@ -154,6 +154,8 @@
 #define USE_ROUNDL_BUILTIN USE_ROUNDF128_BUILTIN
 #undef USE_COPYSIGNL_BUILTIN
 #define USE_COPYSIGNL_BUILTIN USE_COPYSIGNF128_BUILTIN
+#undef USE_FMAL_BUILTIN
+#define USE_FMAL_BUILTIN USE_FMA128_BUILTIN
 
 /* IEEE function renames.  */
 #define __ieee754_acoshl __ieee754_acoshf128
diff --git a/sysdeps/ieee754/ldbl-128/s_fmal.c b/sysdeps/ieee754/ldbl-128/s_fmal.c
index 7475015bcec6..1403734a5aeb 100644
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
+  return __builtin_fmal (x);
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
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
