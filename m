Return-Path: <SRS0=jMyS=7P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B42C433DF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 00:35:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0615207BB
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 00:35:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hEJLJmj6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="RqNh4I5j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0615207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IZ7lMuicx6fV2ErebGzxdeANdypuxd9SQD/DWFNviuM=; b=hEJLJmj64AlNch
	it/ylmg/Il/7mqBfAPZBz8PnSZsDaahS9bG1Q9JpKPqZw42m813rSao+uc6hXSqZe0KdsP2x8xBn8
	wzb0v7iKMSwSblbMla9h36BGlrSBlcY4/8jCZnsjZ9VDEsukMg/tl0rVr8Tlo6d4A8hDcI1vDNeWM
	Qn9OHqlZp0PSLR2RTYWomjWrnKrut3oo3DJ1H+VtQ/rySoFqZUitt94s70rIl2mHxtOi85AN5cDsr
	ZuPNX4AScv4fMuC6LBzP6Ci2cnH9CMZDt1Y7JkkjXEFmklt2pDcIR2pCbGzIPegFyGrEFKBdXb76C
	Z2bte3J08aSfN8e2LUkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfuuJ-00076g-Il; Tue, 02 Jun 2020 00:35:55 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfuuF-00074U-J2
 for linux-snps-arc@lists.infradead.org; Tue, 02 Jun 2020 00:35:53 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CF340C00BC;
 Tue,  2 Jun 2020 00:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591058149; bh=JfPYIG87buvXS7QeOPPTAY+CIHNxaUrodQjUaOyh2E0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RqNh4I5jA031gpkcFS5Mhl9zkQcjP5fhyu99YjYFU40UeudvLeRc6LmxYmQBDG3Rl
 dlr+nrhOiaJzFdXE5Vq/4SH3Jg6zSMIqWY+XpQIA2oNDZJiiUzVeAgKkwjhX+/074z
 QeIRYvg/RsAOzSiqUz87TnQwRW9S7txxL7rlXySwQHPt1bhRndQALfQ3oqRsuLSeJh
 g6lkH4sHw/yrS3ThVTviiPWlm9QSqu7DscEZBhZljynXJ0f3oq5NgfgQ4RGWXG4qoG
 0KHLsPD1Hk/5X1BibJtZ/3vkG9C75l2J9Jy7Q6er2TscpukDyqRFbeOOsCakeLFL5u
 4pJ6Pr5DGFLNQ==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 736BEA00A4;
 Tue,  2 Jun 2020 00:35:49 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v2 4/4] powerpc/fpu: use generic fma functions
Date: Mon,  1 Jun 2020 17:35:41 -0700
Message-Id: <20200602003541.21005-5-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200602003541.21005-1-vgupta@synopsys.com>
References: <20200602003541.21005-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_173551_925868_097C9E89 
X-CRM114-Status: GOOD (  13.37  )
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

This is supposed to be a non functional change
Passes build-many for powerpc-linux-gnu

Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
---
 sysdeps/powerpc/fpu/math-use-builtins.h | 69 +++++++++++++++++++++++++
 sysdeps/powerpc/fpu/s_fma.c             | 27 ----------
 sysdeps/powerpc/fpu/s_fmaf.c            | 27 ----------
 3 files changed, 69 insertions(+), 54 deletions(-)
 create mode 100644 sysdeps/powerpc/fpu/math-use-builtins.h
 delete mode 100644 sysdeps/powerpc/fpu/s_fma.c
 delete mode 100644 sysdeps/powerpc/fpu/s_fmaf.c

diff --git a/sysdeps/powerpc/fpu/math-use-builtins.h b/sysdeps/powerpc/fpu/math-use-builtins.h
new file mode 100644
index 000000000000..4780934379ba
--- /dev/null
+++ b/sysdeps/powerpc/fpu/math-use-builtins.h
@@ -0,0 +1,69 @@
+/* Using math gcc builtins instead of generic implementation.  PowerPC version.
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
+#define USE_SQRT_BUILTIN 0
+#define USE_SQRTF_BUILTIN 0
+
+#define USE_FMA_BUILTIN 1
+#define USE_FMAF_BUILTIN 1
+
+#endif
diff --git a/sysdeps/powerpc/fpu/s_fma.c b/sysdeps/powerpc/fpu/s_fma.c
deleted file mode 100644
index 9ddd13253485..000000000000
--- a/sysdeps/powerpc/fpu/s_fma.c
+++ /dev/null
@@ -1,27 +0,0 @@
-/* Compute x * y + z as ternary operation.  PowerPC version.
-   Copyright (C) 2019-2020 Free Software Foundation, Inc.
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
-#include <sysdep.h>
-#include <libm-alias-double.h>
-
-double
-__fma (double x, double y, double z)
-{
-  return __builtin_fma (x, y, z);
-}
-libm_alias_double (__fma, fma)
diff --git a/sysdeps/powerpc/fpu/s_fmaf.c b/sysdeps/powerpc/fpu/s_fmaf.c
deleted file mode 100644
index d132c20125bb..000000000000
--- a/sysdeps/powerpc/fpu/s_fmaf.c
+++ /dev/null
@@ -1,27 +0,0 @@
-/* Compute x * y + z as ternary operation.  PowerPC version.
-   Copyright (C) 2019-2020 Free Software Foundation, Inc.
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
-#include <sysdep.h>
-#include <libm-alias-float.h>
-
-float
-__fmaf (float x, float y, float z)
-{
-  return __builtin_fmaf (x, y, z);
-}
-libm_alias_float (__fma, fma)
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
