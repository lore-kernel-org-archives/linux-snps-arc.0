Return-Path: <SRS0=jMyS=7P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746A5C433E4
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 21:32:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AA14206E2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Jun 2020 21:32:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nbBmlzEP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WjuaX3+/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AA14206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RXDSkOEE5ETq0rlzuXlBmW8gghY817ZnthC0U9hMU7Y=; b=nbBmlzEP8Bl9nX
	Jmk1sHms67u8NXetz7yICyfDAZ6XKq7thS+CI6zNL3BoxfNPtrrhzUFokoXdbOvPNaH5xTTvEakPW
	DRDSN+b1nA3+jXlHEseb1+ZlN2JLqbGoiziHYKrnSgvqfJ322aUK58W2hS9y8rfwp84teqnit4ojz
	BMSeu7EZAU4XuKEVQz6RjCoyOdzCXOXNlDSFz7emxyoUZ3uO9UFIGTMGarVkqtprLZf2b6wUExDpO
	H6cjpkDkCnicEjWDvodhT/b+G19Xj1DLeeLOzc9KI6YujNA1QJqwsFRguju0eEN3oN7GKxhFkJUNC
	ce+T39bDuzsg1B0NO9Pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgEWP-0005qY-NN; Tue, 02 Jun 2020 21:32:33 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgEWK-0005o3-FF
 for linux-snps-arc@lists.infradead.org; Tue, 02 Jun 2020 21:32:31 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 96329406F7;
 Tue,  2 Jun 2020 21:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591133544; bh=wMmnj7PG67rqSqhgCZzNXwGSVm5Ujqna+wg6DUW2Hmo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WjuaX3+/xBOg1xkyRK56taeQj/C/XdNICEBZZiR0TBTi6vMR/ksqrOPpSbrqxGSNd
 oEPihqjVYzV5kdR5FhYmclegPhOqv5/ytIwQF0p/DWTMVgq2TCU19yKuGWhPbc+wTR
 97zJnG8gRNl3sp9lhYqiG/VWO/UioKXyyO0pMBl5xzFUfiUdrPr9sDhpN8trC8nccP
 xNi0YzSKeg7UQx/qTcRXOHZ5CbJuXWkTRhkGnBAeKxeNpCb1epOjzQyuRkhD5zhyC0
 rCTfqdnO0TxAZ4heiCtUH3GFPfD8vj8GLFVFmn8GMnv8/zKG9TR+6kVmCc3JwiYhDc
 ve/LE6acXoDVQ==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 21B67A00A2;
 Tue,  2 Jun 2020 21:32:24 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v3 4/4] powerpc/fpu: use generic fma functions
Date: Tue,  2 Jun 2020 14:32:20 -0700
Message-Id: <20200602213220.6201-5-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200602213220.6201-1-vgupta@synopsys.com>
References: <20200602213220.6201-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_143228_521235_4016D3D6 
X-CRM114-Status: GOOD (  13.06  )
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

Tested with build-many-glibcs for powerpc-linux-gnu

This is a non functional change and powerpc libm before/after was
byte invariant as compared below:

| cd /SCRATCH/vgupta/gnu/install-glibc-A-baseline
| for i in `find . -name libm-2.31.9000.so`; do
|   echo $i; diff $i /SCRATCH/vgupta/gnu/install-glibc-C-reduce-scope/$i ;
|   echo $?;
| done

| ./aarch64-linux-gnu/lib64/libm-2.31.9000.so
| 0
| ./arm-linux-gnueabi/lib/libm-2.31.9000.so
| 0
| ./x86_64-linux-gnu/lib64/libm-2.31.9000.so
| 0
| ./arm-linux-gnueabihf/lib/libm-2.31.9000.so
| 0
| ./riscv64-linux-gnu-rv64imac-lp64/lib64/lp64/libm-2.31.9000.so
| 0
| ./riscv64-linux-gnu-rv64imafdc-lp64/lib64/lp64/libm-2.31.9000.so
| 0
| ./powerpc-linux-gnu/lib/libm-2.31.9000.so
| 0
| ./microblaze-linux-gnu/lib/libm-2.31.9000.so
| 0
| ./nios2-linux-gnu/lib/libm-2.31.9000.so
| 0
| ./hppa-linux-gnu/lib/libm-2.31.9000.so
| 0
| ./s390x-linux-gnu/lib64/libm-2.31.9000.so
| 0

Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>

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
