Return-Path: <SRS0=jMyS=7P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F33CDC433E3
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 00:35:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3AC2207DF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 00:35:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HimKxhLQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="QdLE88Vc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3AC2207DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ILgO9JtSjKHjY2YllaKMUOWrprMBAUrIC9OHOfVjzVw=; b=HimKxhLQLojz77
	hbWGYOz+Z6G7PDJfmhE8VR/kVKoP8Nt2chh4u2a68inYyeIUpKgxX0q+qTXBu/RT4OXkwQ8CXaxIL
	wyISEPx5MShrpuHV3rqBu4C++YMNwy9f+KwOIQEMNaeoNqfMSLG83MnoglR0e0cjarsd0Xn1XcAXX
	G/WMm9GEO2EkrSBZcgcmJFSQQXG4RbVJq+SblYjPjKrEhHy0YIL5G743CejEvXVMKlpbI3WdjnnyK
	/+RibiuC1tmOZVNZBBADep+EE0qoagzajeeGAG1y1uvqwtkpicUSqbpcF5enMhZzRkz/tCdS1OyYU
	T+BUtzbos64nPvmRIf0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfuuJ-00076x-PY; Tue, 02 Jun 2020 00:35:55 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfuuF-00074V-J2
 for linux-snps-arc@lists.infradead.org; Tue, 02 Jun 2020 00:35:54 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8DE06C008F;
 Tue,  2 Jun 2020 00:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591058149; bh=RInbKHOIe9ey7HzYvloKRGhmGYBw7UjsqeUex7AI1Bo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QdLE88VcTa6LwNre2iapyzU9Ve3L0Z3VOsBB6hi+x8TyoE3SGJr6gaovCHi1COHqS
 XfnbVPeNVAeira/WaEsC1GhrC+BSuiOVx76Lsjnv3dRIJWQtdmkvpWCvhNhs2WMkpW
 Zsr/ms016+bTMZRAU6q838VqoE8dtCCFgPo6GoC+gT80SPibVgvPUPs10dYv6+jMZ7
 PBjCyfGf/Dip+9pNtfYajLkDb8+PTJXDUOmaOMM6ycUIpGOOKYflgivGwje1NCu0HR
 j6KbE9Ny2ngikpT+sy+kFY0BQc7QExIZdQK2Y56WTdp+SWTMTaikcLbj0HZP3CkEtK
 d3Mva551f390A==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 289D2A00A2;
 Tue,  2 Jun 2020 00:35:49 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v2 3/4] aarch/fpu: use generic builtins based math functions
Date: Mon,  1 Jun 2020 17:35:40 -0700
Message-Id: <20200602003541.21005-4-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200602003541.21005-1-vgupta@synopsys.com>
References: <20200602003541.21005-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_173551_744358_CC1301C1 
X-CRM114-Status: GOOD (  13.57  )
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

introduce sysdep header math-use-builtins.h to replace aarch64
impementations with corresponding generic ones

 - newly inroduced generic sqrt{,f}, fma{,f}
 - existing floor{,f}, nearbyint{,f}, rint{,f}, round{,f}, trunc{,f}
 - Note that generic copysign was already enabled (via generic
   math-use-builtins.h) now thru sysdep header

This is supposed to be a non functional change
Passes build-many for aarch64-linux-gnu
---
 sysdeps/aarch64/fpu/e_sqrt.c            | 27 ----------
 sysdeps/aarch64/fpu/e_sqrtf.c           | 27 ----------
 sysdeps/aarch64/fpu/math-use-builtins.h | 71 +++++++++++++++++++++++++
 sysdeps/aarch64/fpu/s_floor.c           | 29 ----------
 sysdeps/aarch64/fpu/s_floorf.c          | 29 ----------
 sysdeps/aarch64/fpu/s_fma.c             | 28 ----------
 sysdeps/aarch64/fpu/s_fmaf.c            | 28 ----------
 sysdeps/aarch64/fpu/s_nearbyint.c       | 28 ----------
 sysdeps/aarch64/fpu/s_nearbyintf.c      | 28 ----------
 sysdeps/aarch64/fpu/s_rint.c            | 29 ----------
 sysdeps/aarch64/fpu/s_rintf.c           | 29 ----------
 sysdeps/aarch64/fpu/s_round.c           | 29 ----------
 sysdeps/aarch64/fpu/s_roundf.c          | 29 ----------
 sysdeps/aarch64/fpu/s_trunc.c           | 29 ----------
 sysdeps/aarch64/fpu/s_truncf.c          | 29 ----------
 15 files changed, 71 insertions(+), 398 deletions(-)
 delete mode 100644 sysdeps/aarch64/fpu/e_sqrt.c
 delete mode 100644 sysdeps/aarch64/fpu/e_sqrtf.c
 create mode 100644 sysdeps/aarch64/fpu/math-use-builtins.h
 delete mode 100644 sysdeps/aarch64/fpu/s_floor.c
 delete mode 100644 sysdeps/aarch64/fpu/s_floorf.c
 delete mode 100644 sysdeps/aarch64/fpu/s_fma.c
 delete mode 100644 sysdeps/aarch64/fpu/s_fmaf.c
 delete mode 100644 sysdeps/aarch64/fpu/s_nearbyint.c
 delete mode 100644 sysdeps/aarch64/fpu/s_nearbyintf.c
 delete mode 100644 sysdeps/aarch64/fpu/s_rint.c
 delete mode 100644 sysdeps/aarch64/fpu/s_rintf.c
 delete mode 100644 sysdeps/aarch64/fpu/s_round.c
 delete mode 100644 sysdeps/aarch64/fpu/s_roundf.c
 delete mode 100644 sysdeps/aarch64/fpu/s_trunc.c
 delete mode 100644 sysdeps/aarch64/fpu/s_truncf.c

diff --git a/sysdeps/aarch64/fpu/e_sqrt.c b/sysdeps/aarch64/fpu/e_sqrt.c
deleted file mode 100644
index abb67ef7b061..000000000000
--- a/sysdeps/aarch64/fpu/e_sqrt.c
+++ /dev/null
@@ -1,27 +0,0 @@
-/* Square root of floating point number.
-   Copyright (C) 2015-2020 Free Software Foundation, Inc.
-   This file is part of the GNU C Library.
-
-   The GNU C Library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public
-   License as published by the Free Software Foundation; either
-   version 2.1 of the License, or (at your option) any later version.
-
-   The GNU C Library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library; if not, see
-   <https://www.gnu.org/licenses/>.  */
-
-#include <math_private.h>
-#include <libm-alias-finite.h>
-
-double
-__ieee754_sqrt (double d)
-{
-  return __builtin_sqrt (d);
-}
-libm_alias_finite (__ieee754_sqrt, __sqrt)
diff --git a/sysdeps/aarch64/fpu/e_sqrtf.c b/sysdeps/aarch64/fpu/e_sqrtf.c
deleted file mode 100644
index 13008a4f45d6..000000000000
--- a/sysdeps/aarch64/fpu/e_sqrtf.c
+++ /dev/null
@@ -1,27 +0,0 @@
-/* Single-precision floating point square root.
-   Copyright (C) 2015-2020 Free Software Foundation, Inc.
-   This file is part of the GNU C Library.
-
-   The GNU C Library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public
-   License as published by the Free Software Foundation; either
-   version 2.1 of the License, or (at your option) any later version.
-
-   The GNU C Library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library; if not, see
-   <https://www.gnu.org/licenses/>.  */
-
-#include <math_private.h>
-#include <libm-alias-finite.h>
-
-float
-__ieee754_sqrtf (float s)
-{
-  return __builtin_sqrtf (s);
-}
-libm_alias_finite (__ieee754_sqrtf, __sqrtf)
diff --git a/sysdeps/aarch64/fpu/math-use-builtins.h b/sysdeps/aarch64/fpu/math-use-builtins.h
new file mode 100644
index 000000000000..50a1ba0db5ea
--- /dev/null
+++ b/sysdeps/aarch64/fpu/math-use-builtins.h
@@ -0,0 +1,71 @@
+/* Using math gcc builtins instead of generic implementation.  aarch64 version.
+   Copyright (C) 2020 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, see
+   <https://www.gnu.org/licenses/>.  */
+
+#ifndef MATH_USE_BUILTINS_H
+#define MATH_USE_BUILTINS_H	1
+
+#include <features.h> /* For __GNUC_PREREQ.  */
+
+/* Define these macros to 1 to use __builtin_xyz instead of the
+   generic implementation.  */
+#define USE_NEARBYINT_BUILTIN 1
+#define USE_NEARBYINTF_BUILTIN 1
+#define USE_NEARBYINTL_BUILTIN 0
+#define USE_NEARBYINTF128_BUILTIN 0
+
+#define USE_RINT_BUILTIN 1
+#define USE_RINTF_BUILTIN 1
+#define USE_RINTL_BUILTIN 0
+#define USE_RINTF128_BUILTIN 0
+
+#define USE_FLOOR_BUILTIN 1
+#define USE_FLOORF_BUILTIN 1
+#define USE_FLOORL_BUILTIN 0
+#define USE_FLOORF128_BUILTIN 0
+
+#define USE_CEIL_BUILTIN 1
+#define USE_CEILF_BUILTIN 1
+#define USE_CEILL_BUILTIN 0
+#define USE_CEILF128_BUILTIN 0
+
+#define USE_TRUNC_BUILTIN 1
+#define USE_TRUNCF_BUILTIN 1
+#define USE_TRUNCL_BUILTIN 0
+#define USE_TRUNCF128_BUILTIN 0
+
+#define USE_ROUND_BUILTIN 1
+#define USE_ROUNDF_BUILTIN 1
+#define USE_ROUNDL_BUILTIN 0
+#define USE_ROUNDF128_BUILTIN 0
+
+#define USE_COPYSIGNL_BUILTIN 1
+#if __GNUC_PREREQ (7, 0)
+# define USE_COPYSIGNF128_BUILTIN 1
+#else
+# define USE_COPYSIGNF128_BUILTIN 0
+#endif
+
+#define USE_SQRT_BUILTIN 1
+#define USE_SQRTF_BUILTIN 1
+
+#define USE_FMA_BUILTIN 1
+#define USE_FMAF_BUILTIN 1
+#define USE_FMAL_BUILTIN 0
+#define USE_FMAF128_BUILTIN 0
+
+#endif
diff --git a/sysdeps/aarch64/fpu/s_floor.c b/sysdeps/aarch64/fpu/s_floor.c
deleted file mode 100644
index d7d3e9336a6e..000000000000
--- a/sysdeps/aarch64/fpu/s_floor.c
+++ /dev/null
@@ -1,29 +0,0 @@
-/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
-
-   This file is part of the GNU C Library.
-
-   The GNU C Library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public License as
-   published by the Free Software Foundation; either version 2.1 of the
-   License, or (at your option) any later version.
-
-   The GNU C Library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library; if not, see
-   <https://www.gnu.org/licenses/>.  */
-
-#define NO_MATH_REDIRECT
-#include <math.h>
-#include <libm-alias-double.h>
-
-double
-__floor (double x)
-{
-  return __builtin_floor (x);
-}
-
-libm_alias_double (__floor, floor)
diff --git a/sysdeps/aarch64/fpu/s_floorf.c b/sysdeps/aarch64/fpu/s_floorf.c
deleted file mode 100644
index 625ff4375702..000000000000
--- a/sysdeps/aarch64/fpu/s_floorf.c
+++ /dev/null
@@ -1,29 +0,0 @@
-/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
-
-   This file is part of the GNU C Library.
-
-   The GNU C Library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public License as
-   published by the Free Software Foundation; either version 2.1 of the
-   License, or (at your option) any later version.
-
-   The GNU C Library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library; if not, see
-   <https://www.gnu.org/licenses/>.  */
-
-#define NO_MATH_REDIRECT
-#include <math.h>
-#include <libm-alias-float.h>
-
-float
-__floorf (float x)
-{
-  return __builtin_floorf (x);
-}
-
-libm_alias_float (__floor, floor)
diff --git a/sysdeps/aarch64/fpu/s_fma.c b/sysdeps/aarch64/fpu/s_fma.c
deleted file mode 100644
index 48bb40482dc9..000000000000
--- a/sysdeps/aarch64/fpu/s_fma.c
+++ /dev/null
@@ -1,28 +0,0 @@
-/* Copyright (C) 1996-2020 Free Software Foundation, Inc.
-
-   This file is part of the GNU C Library.
-
-   The GNU C Library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public
-   License as published by the Free Software Foundation; either
-   version 2.1 of the License, or (at your option) any later version.
-
-   The GNU C Library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library; if not, see
-   <https://www.gnu.org/licenses/>.  */
-
-#include <math.h>
-#include <libm-alias-double.h>
-
-double
-__fma (double x, double y, double z)
-{
-  return __builtin_fma (x, y, z);
-}
-
-libm_alias_double (__fma, fma)
diff --git a/sysdeps/aarch64/fpu/s_fmaf.c b/sysdeps/aarch64/fpu/s_fmaf.c
deleted file mode 100644
index 544f32e27aec..000000000000
--- a/sysdeps/aarch64/fpu/s_fmaf.c
+++ /dev/null
@@ -1,28 +0,0 @@
-/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
-
-   This file is part of the GNU C Library.
-
-   The GNU C Library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public License as
-   published by the Free Software Foundation; either version 2.1 of the
-   License, or (at your option) any later version.
-
-   The GNU C Library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library; if not, see
-   <https://www.gnu.org/licenses/>.  */
-
-#include <math.h>
-#include <libm-alias-float.h>
-
-float
-__fmaf (float x, float y, float z)
-{
-  return __builtin_fmaf (x, y, z);
-}
-
-libm_alias_float (__fma, fma)
diff --git a/sysdeps/aarch64/fpu/s_nearbyint.c b/sysdeps/aarch64/fpu/s_nearbyint.c
deleted file mode 100644
index 59a57dd39ba1..000000000000
--- a/sysdeps/aarch64/fpu/s_nearbyint.c
+++ /dev/null
@@ -1,28 +0,0 @@
-/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
-
-   This file is part of the GNU C Library.
-
-   The GNU C Library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public License as
-   published by the Free Software Foundation; either version 2.1 of the
-   License, or (at your option) any later version.
-
-   The GNU C Library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library; if not, see
-   <https://www.gnu.org/licenses/>.  */
-
-#include <math.h>
-#include <libm-alias-double.h>
-
-double
-__nearbyint (double x)
-{
-  return __builtin_nearbyint (x);
-}
-
-libm_alias_double (__nearbyint, nearbyint)
diff --git a/sysdeps/aarch64/fpu/s_nearbyintf.c b/sysdeps/aarch64/fpu/s_nearbyintf.c
deleted file mode 100644
index f52968ae2bbd..000000000000
--- a/sysdeps/aarch64/fpu/s_nearbyintf.c
+++ /dev/null
@@ -1,28 +0,0 @@
-/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
-
-   This file is part of the GNU C Library.
-
-   The GNU C Library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public License as
-   published by the Free Software Foundation; either version 2.1 of the
-   License, or (at your option) any later version.
-
-   The GNU C Library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library; if not, see
-   <https://www.gnu.org/licenses/>.  */
-
-#include <math.h>
-#include <libm-alias-float.h>
-
-float
-__nearbyintf (float x)
-{
-  return __builtin_nearbyintf (x);
-}
-
-libm_alias_float (__nearbyint, nearbyint)
diff --git a/sysdeps/aarch64/fpu/s_rint.c b/sysdeps/aarch64/fpu/s_rint.c
deleted file mode 100644
index bdd757167e0c..000000000000
--- a/sysdeps/aarch64/fpu/s_rint.c
+++ /dev/null
@@ -1,29 +0,0 @@
-/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
-
-   This file is part of the GNU C Library.
-
-   The GNU C Library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public License as
-   published by the Free Software Foundation; either version 2.1 of the
-   License, or (at your option) any later version.
-
-   The GNU C Library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library; if not, see
-   <https://www.gnu.org/licenses/>.  */
-
-#define NO_MATH_REDIRECT
-#include <math.h>
-#include <libm-alias-double.h>
-
-double
-__rint (double x)
-{
-  return __builtin_rint (x);
-}
-
-libm_alias_double (__rint, rint)
diff --git a/sysdeps/aarch64/fpu/s_rintf.c b/sysdeps/aarch64/fpu/s_rintf.c
deleted file mode 100644
index 8cf7c63d6dda..000000000000
--- a/sysdeps/aarch64/fpu/s_rintf.c
+++ /dev/null
@@ -1,29 +0,0 @@
-/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
-
-   This file is part of the GNU C Library.
-
-   The GNU C Library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public License as
-   published by the Free Software Foundation; either version 2.1 of the
-   License, or (at your option) any later version.
-
-   The GNU C Library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library; if not, see
-   <https://www.gnu.org/licenses/>.  */
-
-#define NO_MATH_REDIRECT
-#include <math.h>
-#include <libm-alias-float.h>
-
-float
-__rintf (float x)
-{
-  return __builtin_rintf (x);
-}
-
-libm_alias_float (__rint, rint)
diff --git a/sysdeps/aarch64/fpu/s_round.c b/sysdeps/aarch64/fpu/s_round.c
deleted file mode 100644
index d2fd5f34117a..000000000000
--- a/sysdeps/aarch64/fpu/s_round.c
+++ /dev/null
@@ -1,29 +0,0 @@
-/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
-
-   This file is part of the GNU C Library.
-
-   The GNU C Library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public License as
-   published by the Free Software Foundation; either version 2.1 of the
-   License, or (at your option) any later version.
-
-   The GNU C Library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library; if not, see
-   <https://www.gnu.org/licenses/>.  */
-
-#define NO_MATH_REDIRECT
-#include <math.h>
-#include <libm-alias-double.h>
-
-double
-__round (double x)
-{
-  return __builtin_round (x);
-}
-
-libm_alias_double (__round, round)
diff --git a/sysdeps/aarch64/fpu/s_roundf.c b/sysdeps/aarch64/fpu/s_roundf.c
deleted file mode 100644
index e51214e86cd2..000000000000
--- a/sysdeps/aarch64/fpu/s_roundf.c
+++ /dev/null
@@ -1,29 +0,0 @@
-/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
-
-   This file is part of the GNU C Library.
-
-   The GNU C Library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public License as
-   published by the Free Software Foundation; either version 2.1 of the
-   License, or (at your option) any later version.
-
-   The GNU C Library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library; if not, see
-   <https://www.gnu.org/licenses/>.  */
-
-#define NO_MATH_REDIRECT
-#include <math.h>
-#include <libm-alias-float.h>
-
-float
-__roundf (float x)
-{
-  return __builtin_roundf (x);
-}
-
-libm_alias_float (__round, round)
diff --git a/sysdeps/aarch64/fpu/s_trunc.c b/sysdeps/aarch64/fpu/s_trunc.c
deleted file mode 100644
index bac23a5e269d..000000000000
--- a/sysdeps/aarch64/fpu/s_trunc.c
+++ /dev/null
@@ -1,29 +0,0 @@
-/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
-
-   This file is part of the GNU C Library.
-
-   The GNU C Library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public License as
-   published by the Free Software Foundation; either version 2.1 of the
-   License, or (at your option) any later version.
-
-   The GNU C Library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library; if not, see
-   <https://www.gnu.org/licenses/>.  */
-
-#define NO_MATH_REDIRECT
-#include <math.h>
-#include <libm-alias-double.h>
-
-double
-__trunc (double x)
-{
-  return __builtin_trunc (x);
-}
-
-libm_alias_double (__trunc, trunc)
diff --git a/sysdeps/aarch64/fpu/s_truncf.c b/sysdeps/aarch64/fpu/s_truncf.c
deleted file mode 100644
index 6a025c084a5a..000000000000
--- a/sysdeps/aarch64/fpu/s_truncf.c
+++ /dev/null
@@ -1,29 +0,0 @@
-/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
-
-   This file is part of the GNU C Library.
-
-   The GNU C Library is free software; you can redistribute it and/or
-   modify it under the terms of the GNU Lesser General Public License as
-   published by the Free Software Foundation; either version 2.1 of the
-   License, or (at your option) any later version.
-
-   The GNU C Library is distributed in the hope that it will be useful,
-   but WITHOUT ANY WARRANTY; without even the implied warranty of
-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-   Lesser General Public License for more details.
-
-   You should have received a copy of the GNU Lesser General Public
-   License along with the GNU C Library; if not, see
-   <https://www.gnu.org/licenses/>.  */
-
-#define NO_MATH_REDIRECT
-#include <math.h>
-#include <libm-alias-float.h>
-
-float
-__truncf (float x)
-{
-  return __builtin_truncf (x);
-}
-
-libm_alias_float (__trunc, trunc)
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
