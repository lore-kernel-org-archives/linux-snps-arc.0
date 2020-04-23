Return-Path: <SRS0=M/q7=6H=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDEACC55189
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Apr 2020 01:41:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C37E20787
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Apr 2020 01:41:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oolVJJvC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TTVxgU4C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C37E20787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5QK01N2/thYiUcYk5nt1KjD5MfSDseLx9PuCNBEJyc=; b=oolVJJvCFOYslI
	5jSm+SN2J6VQtn36x/jeUzCktzcTIYCZy2/9aws9C8TsOKS9UzCCecU+4qOXDgw7Dsz0319AsMhTH
	IkSr8Gu7O6KmgqNUU7/Ci/9QBVMQs5ec2JCPgaLo7UP5dO0bSI6C6/UR6LXVFBajQpPUNMhKEe6Ru
	eC14/C76dL07s5H9uqwiaqRFpOF4vXSAr0CttRto9lDxS+TD/MWdQaFAO44vkBylYiCrWWnlVKIB9
	ulpisx3HnPww2332pyaM26Kk9ddXeKfS1p9vDsxzNIfsBL0N8tO67OUZAlF7Q4icAd4US1JrHYFRs
	cIjLtIlM37vs76K26aEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRQrv-0004lE-UD; Thu, 23 Apr 2020 01:41:35 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRQrs-0004hh-F3
 for linux-snps-arc@lists.infradead.org; Thu, 23 Apr 2020 01:41:34 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A6E6E400B9;
 Thu, 23 Apr 2020 01:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587606092; bh=QAf2agrVgPLUdXhdIp6OKDjJRxSPnSL3NIZoJ1Sa54E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TTVxgU4CxPft8VJwtHwVMIYoLnfkP0Bzf/5xJZFxiV2uW60pP+S+mWqh/MPn2cY7d
 5xZ68HMzVAKfepHHMRQg7BhKDYx0bvTRs74rOPrKb4u0LCyIMfpIG2Psp38GwecbfK
 iE+/qBu456QFNYTR5TzxDLCiBOKsQBCcS/XEBsYtX71k+J7/+M9EpNvoPBricUfEGl
 uc7xfIlhgK7DqOa0qPQerkpsxabwAkg0pLTsYTCtjYF6tCKB8ei0eZpum5nY0qeF3W
 xVjY0ZItHQ2mtkOoJeqjCi953IyY3D/2oQTZk2cZ3cv/nNzdAid+3nWJLeiQn4vsIw
 2+Xq36+wfVNqw==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 7836DA0099;
 Thu, 23 Apr 2020 01:41:31 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v6 05/13] ARC: math soft float support
Date: Wed, 22 Apr 2020 18:41:18 -0700
Message-Id: <20200423014126.10417-6-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200423014126.10417-1-vgupta@synopsys.com>
References: <20200423014126.10417-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_184132_521650_60DF6E5B 
X-CRM114-Status: GOOD (  16.04  )
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
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 sysdeps/arc/bits/fenv.h                   | 77 +++++++++++++++++++++++
 sysdeps/arc/nofpu/Implies                 |  1 +
 sysdeps/arc/nofpu/math-tests-exceptions.h | 27 ++++++++
 sysdeps/arc/nofpu/math-tests-rounding.h   | 27 ++++++++
 sysdeps/arc/sfp-machine.h                 | 73 +++++++++++++++++++++
 5 files changed, 205 insertions(+)
 create mode 100644 sysdeps/arc/bits/fenv.h
 create mode 100644 sysdeps/arc/nofpu/Implies
 create mode 100644 sysdeps/arc/nofpu/math-tests-exceptions.h
 create mode 100644 sysdeps/arc/nofpu/math-tests-rounding.h
 create mode 100644 sysdeps/arc/sfp-machine.h

diff --git a/sysdeps/arc/bits/fenv.h b/sysdeps/arc/bits/fenv.h
new file mode 100644
index 000000000000..80afa50db9c6
--- /dev/null
+++ b/sysdeps/arc/bits/fenv.h
@@ -0,0 +1,77 @@
+/* Copyright (C) 2012-2020 Free Software Foundation, Inc.
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
+   License along with the GNU C Library.  If not, see
+   <https://www.gnu.org/licenses/>.  */
+
+#ifndef _FENV_H
+# error "Never use <bits/fenv.h> directly; include <fenv.h> instead."
+#endif
+
+enum
+  {
+    FE_INVALID   =
+# define FE_INVALID	(0x01)
+      FE_INVALID,
+    FE_DIVBYZERO =
+# define FE_DIVBYZERO	(0x02)
+      FE_DIVBYZERO,
+    FE_OVERFLOW  =
+# define FE_OVERFLOW	(0x04)
+      FE_OVERFLOW,
+    FE_UNDERFLOW =
+# define FE_UNDERFLOW	(0x08)
+      FE_UNDERFLOW,
+    FE_INEXACT   =
+# define FE_INEXACT	(0x10)
+      FE_INEXACT
+  };
+
+# define FE_ALL_EXCEPT \
+	(FE_INVALID | FE_DIVBYZERO | FE_OVERFLOW | FE_UNDERFLOW | FE_INEXACT)
+
+enum
+  {
+    FE_TOWARDZERO =
+# define FE_TOWARDZERO	(0x0)
+      FE_TOWARDZERO,
+    FE_TONEAREST  =
+# define FE_TONEAREST	(0x1)	/* default */
+      FE_TONEAREST,
+    FE_UPWARD     =
+# define FE_UPWARD	(0x2)
+      FE_UPWARD,
+    FE_DOWNWARD   =
+# define FE_DOWNWARD	(0x3)
+      FE_DOWNWARD
+  };
+
+typedef unsigned int fexcept_t;
+
+typedef struct
+{
+  unsigned int __fpcr;
+  unsigned int __fpsr;
+} fenv_t;
+
+/* If the default argument is used we use this value.  */
+#define FE_DFL_ENV	((const fenv_t *) -1)
+
+#if __GLIBC_USE (IEC_60559_BFP_EXT)
+/* Type representing floating-point control modes.  */
+typedef unsigned int femode_t;
+
+/* Default floating-point control modes.  */
+# define FE_DFL_MODE	((const femode_t *) -1L)
+#endif
diff --git a/sysdeps/arc/nofpu/Implies b/sysdeps/arc/nofpu/Implies
new file mode 100644
index 000000000000..abcbadb25f22
--- /dev/null
+++ b/sysdeps/arc/nofpu/Implies
@@ -0,0 +1 @@
+ieee754/soft-fp
diff --git a/sysdeps/arc/nofpu/math-tests-exceptions.h b/sysdeps/arc/nofpu/math-tests-exceptions.h
new file mode 100644
index 000000000000..2ec58e088ebf
--- /dev/null
+++ b/sysdeps/arc/nofpu/math-tests-exceptions.h
@@ -0,0 +1,27 @@
+/* Configuration for math tests. exceptions support ARC version.
+   Copyright (C) 2017-2020 Free Software Foundation, Inc.
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
+#ifndef ARC_NOFPU_MATH_TESTS_EXCEPTIONS_H
+#define ARC_NOFPU_MATH_TESTS_EXCEPTIONS_H 1
+
+/* Soft-float does not support exceptions.  */
+#define EXCEPTION_TESTS_float		0
+#define EXCEPTION_TESTS_double		0
+#define EXCEPTION_TESTS_long_double	0
+
+#endif
diff --git a/sysdeps/arc/nofpu/math-tests-rounding.h b/sysdeps/arc/nofpu/math-tests-rounding.h
new file mode 100644
index 000000000000..6e5376cb35b5
--- /dev/null
+++ b/sysdeps/arc/nofpu/math-tests-rounding.h
@@ -0,0 +1,27 @@
+/* Configuration for math tests: rounding mode support.  ARC version.
+   Copyright (C) 2017-2020 Free Software Foundation, Inc.
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
+#ifndef ARC_NOFPU_MATH_TESTS_ROUNDING_H
+#define ARC_NOFPU_MATH_TESTS_ROUNDING_H 1
+
+/* Soft-float only supports to-nearest rounding mode.  */
+#define ROUNDING_TESTS_float(MODE)		((MODE) == FE_TONEAREST)
+#define ROUNDING_TESTS_double(MODE)		((MODE) == FE_TONEAREST)
+#define ROUNDING_TESTS_long_double(MODE)	((MODE) == FE_TONEAREST)
+
+#endif
diff --git a/sysdeps/arc/sfp-machine.h b/sysdeps/arc/sfp-machine.h
new file mode 100644
index 000000000000..b2bfd33e944c
--- /dev/null
+++ b/sysdeps/arc/sfp-machine.h
@@ -0,0 +1,73 @@
+/* Machine-dependent software floating-point definitions.  ARC version.
+   Copyright (C) 2004-2020 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+   Contributed by Richard Henderson (rth@cygnus.com),
+		  Jakub Jelinek (jj@ultra.linux.cz) and
+		  David S. Miller (davem@redhat.com).
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
+   License along with the GNU C Library.  If not, see
+   <https://www.gnu.org/licenses/>.  */
+
+
+#define _FP_W_TYPE_SIZE		32
+#define _FP_W_TYPE		unsigned long
+#define _FP_WS_TYPE		signed long
+#define _FP_I_TYPE		long
+
+#define _FP_MUL_MEAT_S(R,X,Y)				\
+  _FP_MUL_MEAT_1_wide(_FP_WFRACBITS_S,R,X,Y,umul_ppmm)
+#define _FP_MUL_MEAT_D(R,X,Y)				\
+  _FP_MUL_MEAT_2_wide(_FP_WFRACBITS_D,R,X,Y,umul_ppmm)
+#define _FP_MUL_MEAT_Q(R,X,Y)				\
+  _FP_MUL_MEAT_4_wide(_FP_WFRACBITS_Q,R,X,Y,umul_ppmm)
+
+#define _FP_MUL_MEAT_DW_S(R,X,Y)				\
+  _FP_MUL_MEAT_DW_1_wide(_FP_WFRACBITS_S,R,X,Y,umul_ppmm)
+#define _FP_MUL_MEAT_DW_D(R,X,Y)				\
+  _FP_MUL_MEAT_DW_2_wide(_FP_WFRACBITS_D,R,X,Y,umul_ppmm)
+#define _FP_MUL_MEAT_DW_Q(R,X,Y)				\
+  _FP_MUL_MEAT_DW_4_wide(_FP_WFRACBITS_Q,R,X,Y,umul_ppmm)
+
+#define _FP_DIV_MEAT_S(R,X,Y)	_FP_DIV_MEAT_1_loop(S,R,X,Y)
+#define _FP_DIV_MEAT_D(R,X,Y)	_FP_DIV_MEAT_2_udiv(D,R,X,Y)
+#define _FP_DIV_MEAT_Q(R,X,Y)	_FP_DIV_MEAT_4_udiv(Q,R,X,Y)
+
+#define _FP_NANFRAC_S		((_FP_QNANBIT_S << 1) - 1)
+#define _FP_NANFRAC_D		((_FP_QNANBIT_D << 1) - 1), -1
+#define _FP_NANFRAC_Q		((_FP_QNANBIT_Q << 1) - 1), -1, -1, -1
+#define _FP_NANSIGN_S		0
+#define _FP_NANSIGN_D		0
+#define _FP_NANSIGN_Q		0
+
+#define _FP_KEEPNANFRACP 1
+#define _FP_QNANNEGATEDP 0
+
+/* This is arbitrarily taken from the PowerPC version.  */
+#define _FP_CHOOSENAN(fs, wc, R, X, Y, OP)			\
+  do {								\
+    if ((_FP_FRAC_HIGH_RAW_##fs(X) & _FP_QNANBIT_##fs)		\
+	&& !(_FP_FRAC_HIGH_RAW_##fs(Y) & _FP_QNANBIT_##fs))	\
+      {								\
+	R##_s = Y##_s;						\
+	_FP_FRAC_COPY_##wc(R,Y);				\
+      }								\
+    else							\
+      {								\
+	R##_s = X##_s;						\
+	_FP_FRAC_COPY_##wc(R,X);				\
+      }								\
+    R##_c = FP_CLS_NAN;						\
+  } while (0)
+
+#define _FP_TININESS_AFTER_ROUNDING 1
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
