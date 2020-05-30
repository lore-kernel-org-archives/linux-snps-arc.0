Return-Path: <SRS0=KuJb=7M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD94C433E0
	for <linux-snps-arc@archiver.kernel.org>; Sat, 30 May 2020 02:01:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BD84208A7
	for <linux-snps-arc@archiver.kernel.org>; Sat, 30 May 2020 02:01:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="azmLGfcz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="idRqvn/I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BD84208A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hoGo0cZz4Snu69rlR+8IDRjvOQxbRW7SSI9Cfr+W7n0=; b=azmLGfczZIL3+B
	WcTe2e2p7denCBWEcbJxLPEyl7GAo/iWAo+ylCx4WMYphqrKwRD1aN7m1z0o5Z3rWikpspDzsamjl
	1S5rgFW+Dm+qrWp62tjZBphF3Bj3RctNTZVg240mNAdIsm+8sQbGPgstT8emRo+nFJBqyuaIRaWIs
	cn19ijplQeRyjQHwSkty+w/C0cAFO9dz7AORCtWcJpilxOTx6XnkO6LIQKVKOviQ+rYfB/Le1w0OR
	O1QNO5BMbmHKQQ/a+0e2hpiP/ySVp9/kXTgkt+U2649BLuhzyfmHJJoSTh9bQ8iswVi1Ow8GgEgSZ
	yzDB5YTBpMGOqrS9ARAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeqny-0004uX-IN; Sat, 30 May 2020 02:00:58 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeqnt-0004rO-Lt
 for linux-snps-arc@lists.infradead.org; Sat, 30 May 2020 02:00:57 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E8F1840960;
 Sat, 30 May 2020 02:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1590804052; bh=DPRAIXAt0U1g2sFNtFryq8FcBc7J3+SoFQD7eBLyu/s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=idRqvn/IGksPm0SgynLlHuhTTTDaT52ZacIcfu/qJHfArVy5p5IYXI+5C7CYsfBoz
 zTwMvu0Ptap7t1Xo90wf1OGrgM5Cv2vcuHurPgNZ4+9q/2AyI2Pb4Gy9ZAbNCBVHox
 1aiBdnmiltSJI2Ub9rGwn5jVaFMYpZAVUUFso6GeN9iih1eM4+gkS9FN8FkAxyMXpM
 Nb4o3TwxJyaIqtYkL7tQ6vKaXjxedzXnQgYv7TjyiHFeZKY2frcgl9LlbmauXoPft6
 GPisTY061ciinZRcuAtclYpPTvHBjHF7FnMw2DCUdDP7Uh60PVoTzKL364q2xBqUlC
 0GfiWSahOV41A==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id B157DA023D;
 Sat, 30 May 2020 02:00:51 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH 4/5] aarch/fpu: use generic sqrt, fma functions
Date: Fri, 29 May 2020 19:00:46 -0700
Message-Id: <20200530020047.5490-5-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200530020047.5490-1-vgupta@synopsys.com>
References: <20200530020047.5490-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_190053_756125_B117A38E 
X-CRM114-Status: GOOD (  13.02  )
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

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 sysdeps/aarch64/fpu/e_sqrt.c            | 27 ----------
 sysdeps/aarch64/fpu/e_sqrtf.c           | 27 ----------
 sysdeps/aarch64/fpu/math-use-builtins.h | 70 +++++++++++++++++++++++++
 sysdeps/aarch64/fpu/s_fma.c             | 28 ----------
 sysdeps/aarch64/fpu/s_fmaf.c            | 28 ----------
 5 files changed, 70 insertions(+), 110 deletions(-)
 delete mode 100644 sysdeps/aarch64/fpu/e_sqrt.c
 delete mode 100644 sysdeps/aarch64/fpu/e_sqrtf.c
 create mode 100644 sysdeps/aarch64/fpu/math-use-builtins.h
 delete mode 100644 sysdeps/aarch64/fpu/s_fma.c
 delete mode 100644 sysdeps/aarch64/fpu/s_fmaf.c

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
index 000000000000..52f0a0dad6dd
--- /dev/null
+++ b/sysdeps/aarch64/fpu/math-use-builtins.h
@@ -0,0 +1,70 @@
+/* Using math gcc builtins instead of generic implementation.  aarch64 version.
+   Copyright (C) 2019-2020 Free Software Foundation, Inc.
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
+#define USE_NEARBYINT_BUILTIN 0
+#define USE_NEARBYINTF_BUILTIN 0
+#define USE_NEARBYINTL_BUILTIN 0
+#define USE_NEARBYINTF128_BUILTIN 0
+
+#define USE_RINT_BUILTIN 0
+#define USE_RINTF_BUILTIN 0
+#define USE_RINTL_BUILTIN 0
+#define USE_RINTF128_BUILTIN 0
+
+#define USE_FLOOR_BUILTIN 0
+#define USE_FLOORF_BUILTIN 0
+#define USE_FLOORL_BUILTIN 0
+#define USE_FLOORF128_BUILTIN 0
+
+#define USE_CEIL_BUILTIN 0
+#define USE_CEILF_BUILTIN 0
+#define USE_CEILL_BUILTIN 0
+#define USE_CEILF128_BUILTIN 0
+
+#define USE_TRUNC_BUILTIN 0
+#define USE_TRUNCF_BUILTIN 0
+#define USE_TRUNCL_BUILTIN 0
+#define USE_TRUNCF128_BUILTIN 0
+
+#define USE_ROUND_BUILTIN 0
+#define USE_ROUNDF_BUILTIN 0
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
+
+#endif /* math-use-builtins.h */
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
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
