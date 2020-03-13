Return-Path: <SRS0=tGlP=46=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0172EC5ACC1
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Mar 2020 03:04:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1C53206E2
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Mar 2020 03:04:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cIH+GL2n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YM+t9G87"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1C53206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CCDRhx8VQo4N25MQ4VzPQTZqGVf0vR/DnJ4JLD4kqiY=; b=cIH+GL2nvRRwdb
	x8p1pVHw4Fm6D0WWIG8v1RxCc4j2gN1X5XWNnVjM4wquEu9ik5A/udv+Ygbjiggqz1AVo3B7LR2y+
	agy2mxCumJija6wcLFaZSzjQXcfcIQrDGx7YCCxjjZBvkDqnKr4EEHifcSnGdWF84ykzjaLRIfBgp
	AEdoxpFNH5qT59F59jFzzY5U8CRmUkrUEXGPu/qJR2+M/9DI505BAoq0bmGbCvg5OOc2GAz5Nwae0
	IFHkXyh4mqtVnADbocSVx/MktBR4hfY4rDwH9+WUrr6T4HixuL1idMR8/Rau8kWCJOYu9wmNVHhHf
	hdlsI6heJnGo1O0QhesA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCacy-0003eY-Tu; Fri, 13 Mar 2020 03:04:48 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCaci-0003RX-1T
 for linux-snps-arc@lists.infradead.org; Fri, 13 Mar 2020 03:04:46 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 13611C0F97;
 Fri, 13 Mar 2020 03:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1584068671; bh=GL3WQjMUhVVK+75hkHE39bpyRdRi3ld+O+eOD382pWs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YM+t9G87B6PAwL4TFlYKFjHayqAgJ8JU/DnMZ1y+my73z3ZnAaT+A6m17LRO1yRBG
 b+mHxU7wa9hK+IV5cFSWZCgQLneI20ZaG8Au9tLHJCj6JZI1W1Cixcd9Olau0MteU+
 4zUOdHsdqmMo1MwDe4H1shcbwALG216PuA996z2ISTTd42XrsUz901/P+Mq5pFS5OY
 ulHViDyy5GBVcZfSW22uLfloIHJWDExsidgedrFd9Q2/nR6a3hh9Ft+f7tytiKa3sb
 CnDkXi/u2JTtoTnONrt7oo33lB5ai08u4MI5xxhzUzGkzPJGWGP/jo2Je5tkJw9g4w
 OOqNWaFhrR6Mw==
Received: from vineetg-Latitude-E7450.internal.synopsys.com (unknown
 [10.13.182.230])
 by mailhost.synopsys.com (Postfix) with ESMTP id A1FBBA007F;
 Fri, 13 Mar 2020 03:04:30 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v4 07/15] ARC: hardware floating point support
Date: Thu, 12 Mar 2020 20:04:11 -0700
Message-Id: <20200313030419.15843-8-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200313030419.15843-1-vgupta@synopsys.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_200432_276610_10A2A043 
X-CRM114-Status: GOOD (  16.47  )
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
 sysdeps/arc/bits/fenv.h             |    9 +-
 sysdeps/arc/fpu/e_sqrt.c            |   27 +
 sysdeps/arc/fpu/e_sqrtf.c           |   27 +
 sysdeps/arc/fpu/fclrexcpt.c         |   36 +
 sysdeps/arc/fpu/fegetenv.c          |   37 +
 sysdeps/arc/fpu/fegetmode.c         |   31 +
 sysdeps/arc/fpu/fegetround.c        |   32 +
 sysdeps/arc/fpu/feholdexcpt.c       |   43 +
 sysdeps/arc/fpu/fesetenv.c          |   48 +
 sysdeps/arc/fpu/fesetexcept.c       |   32 +
 sysdeps/arc/fpu/fesetmode.c         |   41 +
 sysdeps/arc/fpu/fesetround.c        |   39 +
 sysdeps/arc/fpu/feupdateenv.c       |   46 +
 sysdeps/arc/fpu/fgetexcptflg.c      |   31 +
 sysdeps/arc/fpu/fraiseexcpt.c       |   39 +
 sysdeps/arc/fpu/fsetexcptflg.c      |   38 +
 sysdeps/arc/fpu/ftestexcept.c       |   33 +
 sysdeps/arc/fpu/libm-test-ulps      | 1703 +++++++++++++++++++++++++++
 sysdeps/arc/fpu/libm-test-ulps-name |    1 +
 sysdeps/arc/fpu/s_fma.c             |   28 +
 sysdeps/arc/fpu/s_fmaf.c            |   28 +
 sysdeps/arc/fpu_control.h           |  101 ++
 sysdeps/arc/get-rounding-mode.h     |   38 +
 sysdeps/arc/math-tests-trap.h       |   27 +
 sysdeps/arc/tininess.h              |    1 +
 25 files changed, 2514 insertions(+), 2 deletions(-)
 create mode 100644 sysdeps/arc/fpu/e_sqrt.c
 create mode 100644 sysdeps/arc/fpu/e_sqrtf.c
 create mode 100644 sysdeps/arc/fpu/fclrexcpt.c
 create mode 100644 sysdeps/arc/fpu/fegetenv.c
 create mode 100644 sysdeps/arc/fpu/fegetmode.c
 create mode 100644 sysdeps/arc/fpu/fegetround.c
 create mode 100644 sysdeps/arc/fpu/feholdexcpt.c
 create mode 100644 sysdeps/arc/fpu/fesetenv.c
 create mode 100644 sysdeps/arc/fpu/fesetexcept.c
 create mode 100644 sysdeps/arc/fpu/fesetmode.c
 create mode 100644 sysdeps/arc/fpu/fesetround.c
 create mode 100644 sysdeps/arc/fpu/feupdateenv.c
 create mode 100644 sysdeps/arc/fpu/fgetexcptflg.c
 create mode 100644 sysdeps/arc/fpu/fraiseexcpt.c
 create mode 100644 sysdeps/arc/fpu/fsetexcptflg.c
 create mode 100644 sysdeps/arc/fpu/ftestexcept.c
 create mode 100644 sysdeps/arc/fpu/libm-test-ulps
 create mode 100644 sysdeps/arc/fpu/libm-test-ulps-name
 create mode 100644 sysdeps/arc/fpu/s_fma.c
 create mode 100644 sysdeps/arc/fpu/s_fmaf.c
 create mode 100644 sysdeps/arc/fpu_control.h
 create mode 100644 sysdeps/arc/get-rounding-mode.h
 create mode 100644 sysdeps/arc/math-tests-trap.h
 create mode 100644 sysdeps/arc/tininess.h

diff --git a/sysdeps/arc/bits/fenv.h b/sysdeps/arc/bits/fenv.h
index 547f0103a53d..80afa50db9c6 100644
--- a/sysdeps/arc/bits/fenv.h
+++ b/sysdeps/arc/bits/fenv.h
@@ -47,7 +47,7 @@ enum
 # define FE_TOWARDZERO	(0x0)
       FE_TOWARDZERO,
     FE_TONEAREST  =
-# define FE_TONEAREST	(0x1)
+# define FE_TONEAREST	(0x1)	/* default */
       FE_TONEAREST,
     FE_UPWARD     =
 # define FE_UPWARD	(0x2)
@@ -58,7 +58,12 @@ enum
   };
 
 typedef unsigned int fexcept_t;
-typedef unsigned int fenv_t;
+
+typedef struct
+{
+  unsigned int __fpcr;
+  unsigned int __fpsr;
+} fenv_t;
 
 /* If the default argument is used we use this value.  */
 #define FE_DFL_ENV	((const fenv_t *) -1)
diff --git a/sysdeps/arc/fpu/e_sqrt.c b/sysdeps/arc/fpu/e_sqrt.c
new file mode 100644
index 000000000000..abb67ef7b061
--- /dev/null
+++ b/sysdeps/arc/fpu/e_sqrt.c
@@ -0,0 +1,27 @@
+/* Square root of floating point number.
+   Copyright (C) 2015-2020 Free Software Foundation, Inc.
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
+#include <math_private.h>
+#include <libm-alias-finite.h>
+
+double
+__ieee754_sqrt (double d)
+{
+  return __builtin_sqrt (d);
+}
+libm_alias_finite (__ieee754_sqrt, __sqrt)
diff --git a/sysdeps/arc/fpu/e_sqrtf.c b/sysdeps/arc/fpu/e_sqrtf.c
new file mode 100644
index 000000000000..13008a4f45d6
--- /dev/null
+++ b/sysdeps/arc/fpu/e_sqrtf.c
@@ -0,0 +1,27 @@
+/* Single-precision floating point square root.
+   Copyright (C) 2015-2020 Free Software Foundation, Inc.
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
+#include <math_private.h>
+#include <libm-alias-finite.h>
+
+float
+__ieee754_sqrtf (float s)
+{
+  return __builtin_sqrtf (s);
+}
+libm_alias_finite (__ieee754_sqrtf, __sqrtf)
diff --git a/sysdeps/arc/fpu/fclrexcpt.c b/sysdeps/arc/fpu/fclrexcpt.c
new file mode 100644
index 000000000000..549968dcd465
--- /dev/null
+++ b/sysdeps/arc/fpu/fclrexcpt.c
@@ -0,0 +1,36 @@
+/* Clear given exceptions in current floating-point environment.
+   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
+#include <fenv.h>
+#include <fpu_control.h>
+
+int
+feclearexcept (int excepts)
+{
+  unsigned int fpsr;
+
+  _FPU_GETS (fpsr);
+
+  /* Clear the relevant bits, FWE is preserved.  */
+  fpsr &= ~excepts;
+
+  _FPU_SETS (fpsr);
+
+  return 0;
+}
+libm_hidden_def (feclearexcept)
diff --git a/sysdeps/arc/fpu/fegetenv.c b/sysdeps/arc/fpu/fegetenv.c
new file mode 100644
index 000000000000..058652aeb685
--- /dev/null
+++ b/sysdeps/arc/fpu/fegetenv.c
@@ -0,0 +1,37 @@
+/* Store current floating-point environment.
+   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
+#include <fenv.h>
+#include <fpu_control.h>
+
+int
+__fegetenv (fenv_t *envp)
+{
+  unsigned int fpcr;
+  unsigned int fpsr;
+
+  _FPU_GETCW (fpcr);
+  _FPU_GETS (fpsr);
+  envp->__fpcr = fpcr;
+  envp->__fpsr = fpsr;
+
+  return 0;
+}
+libm_hidden_def (__fegetenv)
+weak_alias (__fegetenv, fegetenv)
+libm_hidden_weak (fegetenv)
diff --git a/sysdeps/arc/fpu/fegetmode.c b/sysdeps/arc/fpu/fegetmode.c
new file mode 100644
index 000000000000..30d809552fbc
--- /dev/null
+++ b/sysdeps/arc/fpu/fegetmode.c
@@ -0,0 +1,31 @@
+/* Store current floating-point control modes.
+   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
+#include <fenv.h>
+#include <fpu_control.h>
+
+int
+fegetmode (femode_t *modep)
+{
+  unsigned int fpcr;
+
+  _FPU_GETCW (fpcr);
+  *modep = fpcr >> __FPU_RND_SHIFT;
+
+  return 0;
+}
diff --git a/sysdeps/arc/fpu/fegetround.c b/sysdeps/arc/fpu/fegetround.c
new file mode 100644
index 000000000000..ebb3b34e65f3
--- /dev/null
+++ b/sysdeps/arc/fpu/fegetround.c
@@ -0,0 +1,32 @@
+/* Return current rounding direction.
+   Copyright (C) 1998-2020 Free Software Foundation, Inc.
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
+#include <fenv.h>
+#include <fenv_private.h>
+
+int
+__fegetround (void)
+{
+  unsigned int fpcr;
+  _FPU_GETCW (fpcr);
+
+  return fpcr >> __FPU_RND_SHIFT;
+}
+libm_hidden_def (__fegetround)
+weak_alias (__fegetround, fegetround)
+libm_hidden_weak (fegetround)
diff --git a/sysdeps/arc/fpu/feholdexcpt.c b/sysdeps/arc/fpu/feholdexcpt.c
new file mode 100644
index 000000000000..4b849a3cf05b
--- /dev/null
+++ b/sysdeps/arc/fpu/feholdexcpt.c
@@ -0,0 +1,43 @@
+/* Store current floating-point environment and clear exceptions.
+   Copyright (C) 2000-2020 Free Software Foundation, Inc.
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
+#include <fenv.h>
+#include <fenv_private.h>
+
+int
+__feholdexcept (fenv_t *envp)
+{
+  unsigned int fpcr;
+  unsigned int fpsr;
+
+  _FPU_GETCW (fpcr);
+  _FPU_GETS (fpsr);
+
+  envp->__fpcr = fpcr;
+  envp->__fpsr = fpsr;
+
+  fpsr &= ~FE_ALL_EXCEPT;
+
+  _FPU_SETCW (fpcr);
+  _FPU_SETS (fpsr);
+
+  return 0;
+}
+libm_hidden_def (__feholdexcept)
+weak_alias (__feholdexcept, feholdexcept)
+libm_hidden_weak (feholdexcept)
diff --git a/sysdeps/arc/fpu/fesetenv.c b/sysdeps/arc/fpu/fesetenv.c
new file mode 100644
index 000000000000..828b51cf8afa
--- /dev/null
+++ b/sysdeps/arc/fpu/fesetenv.c
@@ -0,0 +1,48 @@
+/* Install given floating-point environment (doesnot raise exceptions).
+   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
+#include <fenv.h>
+#include <fpu_control.h>
+
+int
+__fesetenv (const fenv_t *envp)
+{
+  unsigned int fpcr;
+  unsigned int fpsr;
+
+  if (envp == FE_DFL_ENV)
+    {
+      fpcr = _FPU_DEFAULT;
+      fpsr = _FPU_FPSR_DEFAULT;
+    }
+  else
+    {
+      /* No need to mask out reserved bits as they are IoW.  */
+      fpcr = envp->__fpcr;
+      fpsr = envp->__fpsr;
+    }
+
+  _FPU_SETCW (fpcr);
+  _FPU_SETS (fpsr);
+
+  /* Success.  */
+  return 0;
+}
+libm_hidden_def (__fesetenv)
+weak_alias (__fesetenv, fesetenv)
+libm_hidden_weak (fesetenv)
diff --git a/sysdeps/arc/fpu/fesetexcept.c b/sysdeps/arc/fpu/fesetexcept.c
new file mode 100644
index 000000000000..0a1bcf763bee
--- /dev/null
+++ b/sysdeps/arc/fpu/fesetexcept.c
@@ -0,0 +1,32 @@
+/* Set given exception flags.
+   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
+#include <fenv.h>
+#include <fpu_control.h>
+
+int
+fesetexcept (int excepts)
+{
+  unsigned int fpsr;
+
+  _FPU_GETS (fpsr);
+  fpsr |= excepts;
+  _FPU_SETS (fpsr);
+
+  return 0;
+}
diff --git a/sysdeps/arc/fpu/fesetmode.c b/sysdeps/arc/fpu/fesetmode.c
new file mode 100644
index 000000000000..473a8d176b6a
--- /dev/null
+++ b/sysdeps/arc/fpu/fesetmode.c
@@ -0,0 +1,41 @@
+/* Install given floating-point control modes.
+   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
+#include <fenv.h>
+#include <fpu_control.h>
+
+int
+fesetmode (const femode_t *modep)
+{
+  unsigned int fpcr;
+
+
+  if (modep == FE_DFL_MODE)
+    {
+      fpcr = _FPU_DEFAULT;
+    }
+  else
+    {
+      _FPU_GETCW (fpcr);
+      fpcr = (fpcr & ~(FE_DOWNWARD << __FPU_RND_SHIFT)) | (*modep << __FPU_RND_SHIFT);
+    }
+
+  _FPU_SETCW (fpcr);
+
+  return 0;
+}
diff --git a/sysdeps/arc/fpu/fesetround.c b/sysdeps/arc/fpu/fesetround.c
new file mode 100644
index 000000000000..3b4a34b4f6f4
--- /dev/null
+++ b/sysdeps/arc/fpu/fesetround.c
@@ -0,0 +1,39 @@
+/* Set current rounding direction.
+   Copyright (C) 1998-2020 Free Software Foundation, Inc.
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
+#include <fenv.h>
+#include <fenv_private.h>
+
+int
+__fesetround (int round)
+{
+  unsigned int fpcr;
+
+  _FPU_GETCW (fpcr);
+
+  if (__glibc_unlikely (((fpcr >> __FPU_RND_SHIFT) & FE_DOWNWARD) != round))
+    {
+      fpcr = (fpcr & ~(FE_DOWNWARD << __FPU_RND_SHIFT)) | (round << __FPU_RND_SHIFT);
+      _FPU_SETCW (fpcr);
+    }
+
+  return 0;
+}
+libm_hidden_def (__fesetround)
+weak_alias (__fesetround, fesetround)
+libm_hidden_weak (fesetround)
diff --git a/sysdeps/arc/fpu/feupdateenv.c b/sysdeps/arc/fpu/feupdateenv.c
new file mode 100644
index 000000000000..09c0dff79d17
--- /dev/null
+++ b/sysdeps/arc/fpu/feupdateenv.c
@@ -0,0 +1,46 @@
+/* Install given floating-point environment and raise exceptions,
+   without clearing currently raised exceptions.
+   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
+#include <fenv.h>
+#include <fpu_control.h>
+
+int
+__feupdateenv (const fenv_t *envp)
+{
+  unsigned int fpcr;
+  unsigned int fpsr;
+
+  _FPU_GETCW (fpcr);
+  _FPU_GETS (fpsr);
+
+  /* rounding mode set to what is in env.  */
+  fpcr = envp->__fpcr;
+
+  /* currently raised exceptions are OR'ed with env.  */
+  fpsr |= envp->__fpsr;
+
+  _FPU_SETCW (fpcr);
+  _FPU_SETS (fpsr);
+
+  /* Success.  */
+  return 0;
+}
+libm_hidden_def (__feupdateenv)
+weak_alias (__feupdateenv, feupdateenv)
+libm_hidden_weak (feupdateenv)
diff --git a/sysdeps/arc/fpu/fgetexcptflg.c b/sysdeps/arc/fpu/fgetexcptflg.c
new file mode 100644
index 000000000000..9d1423eaeecb
--- /dev/null
+++ b/sysdeps/arc/fpu/fgetexcptflg.c
@@ -0,0 +1,31 @@
+/* Store current representation for exceptions, ARC version.
+   Copyright (C) 1998-2020 Free Software Foundation, Inc.
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
+#include <fenv.h>
+#include <fenv_private.h>
+
+int
+fegetexceptflag (fexcept_t *flagp, int excepts)
+{
+  unsigned int fpsr;
+
+  _FPU_GETS (fpsr);
+  *flagp = fpsr & excepts;
+
+  return 0;
+}
diff --git a/sysdeps/arc/fpu/fraiseexcpt.c b/sysdeps/arc/fpu/fraiseexcpt.c
new file mode 100644
index 000000000000..9b9d6a951f42
--- /dev/null
+++ b/sysdeps/arc/fpu/fraiseexcpt.c
@@ -0,0 +1,39 @@
+/* Raise given exceptions.
+   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
+#include <fenv.h>
+#include <fpu_control.h>
+#include <float.h>
+#include <math.h>
+
+int
+__feraiseexcept (int excepts)
+{
+  unsigned int fpsr;
+
+  /* currently raised exceptions are not cleared.  */
+  _FPU_GETS (fpsr);
+  fpsr |= excepts;
+
+  _FPU_SETS (fpsr);
+
+  return 0;
+}
+libm_hidden_def (__feraiseexcept)
+weak_alias (__feraiseexcept, feraiseexcept)
+libm_hidden_weak (feraiseexcept)
diff --git a/sysdeps/arc/fpu/fsetexcptflg.c b/sysdeps/arc/fpu/fsetexcptflg.c
new file mode 100644
index 000000000000..b8e495692145
--- /dev/null
+++ b/sysdeps/arc/fpu/fsetexcptflg.c
@@ -0,0 +1,38 @@
+/* Set floating-point environment exception handling, ARC version.
+   Copyright (C) 1998-2020 Free Software Foundation, Inc.
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
+#include <fenv.h>
+#include <fpu_control.h>
+
+int
+fesetexceptflag (const fexcept_t *flagp, int excepts)
+{
+  unsigned int fpsr;
+
+  _FPU_GETS (fpsr);
+
+  /* Clear the bits first.  */
+  fpsr &= ~excepts;
+
+  /* Now set those bits, copying them over from @flagp.  */
+  fpsr |= *flagp & excepts;
+
+  _FPU_SETS (fpsr);
+
+  return 0;
+}
diff --git a/sysdeps/arc/fpu/ftestexcept.c b/sysdeps/arc/fpu/ftestexcept.c
new file mode 100644
index 000000000000..84fd3cf0469c
--- /dev/null
+++ b/sysdeps/arc/fpu/ftestexcept.c
@@ -0,0 +1,33 @@
+/* Test exception in current environment.
+   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
+#include <fenv.h>
+#include <fpu_control.h>
+#include <fenv_private.h>
+#include <stdio.h>
+
+int
+fetestexcept (int excepts)
+{
+  unsigned int fpsr;
+
+  _FPU_GETS (fpsr);
+
+  return fpsr & excepts;
+}
+libm_hidden_def (fetestexcept)
diff --git a/sysdeps/arc/fpu/libm-test-ulps b/sysdeps/arc/fpu/libm-test-ulps
new file mode 100644
index 000000000000..4883d1c8f528
--- /dev/null
+++ b/sysdeps/arc/fpu/libm-test-ulps
@@ -0,0 +1,1703 @@
+# Begin of automatic generation
+
+# Maximal error of functions:
+Function: "acos":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "acos_downward":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "acos_towardzero":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "acos_upward":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "acosh":
+double: 3
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "acosh_downward":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "acosh_towardzero":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "acosh_upward":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: "asin":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "asin_downward":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "asin_towardzero":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "asin_upward":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "asinh":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: "asinh_downward":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: "asinh_towardzero":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "asinh_upward":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: "atan":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "atan2":
+double: 7
+float: 2
+idouble: 7
+ifloat: 2
+
+Function: "atan2_downward":
+double: 5
+float: 2
+idouble: 5
+ifloat: 2
+
+Function: "atan2_towardzero":
+double: 5
+float: 2
+idouble: 5
+ifloat: 2
+
+Function: "atan2_upward":
+double: 8
+float: 2
+idouble: 8
+ifloat: 2
+
+Function: "atan_downward":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: "atan_towardzero":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "atan_upward":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "atanh":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "atanh_downward":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: "atanh_towardzero":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "atanh_upward":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: "cabs":
+double: 1
+float: 1
+idouble: 1
+
+Function: "cabs_downward":
+double: 1
+idouble: 1
+
+Function: "cabs_towardzero":
+double: 1
+idouble: 1
+
+Function: "cabs_upward":
+double: 2
+float: 1
+idouble: 2
+ifloat: 1
+
+Function: Real part of "cacos":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: Imaginary part of "cacos":
+double: 5
+float: 3
+idouble: 5
+ifloat: 4
+
+Function: Real part of "cacos_downward":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: Imaginary part of "cacos_downward":
+double: 5
+float: 3
+idouble: 5
+ifloat: 3
+
+Function: Real part of "cacos_towardzero":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: Imaginary part of "cacos_towardzero":
+double: 4
+float: 2
+idouble: 4
+ifloat: 2
+
+Function: Real part of "cacos_upward":
+double: 2
+float: 3
+idouble: 2
+ifloat: 3
+
+Function: Imaginary part of "cacos_upward":
+double: 5
+float: 5
+idouble: 5
+ifloat: 5
+
+Function: Real part of "cacosh":
+double: 5
+float: 4
+idouble: 5
+ifloat: 3
+
+Function: Imaginary part of "cacosh":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: Real part of "cacosh_downward":
+double: 4
+float: 2
+idouble: 4
+ifloat: 2
+
+Function: Imaginary part of "cacosh_downward":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Real part of "cacosh_towardzero":
+double: 4
+float: 2
+idouble: 4
+ifloat: 2
+
+Function: Imaginary part of "cacosh_towardzero":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: Real part of "cacosh_upward":
+double: 5
+float: 3
+idouble: 5
+ifloat: 3
+
+Function: Imaginary part of "cacosh_upward":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: "carg":
+double: 7
+float: 2
+idouble: 7
+ifloat: 2
+
+Function: "carg_downward":
+double: 5
+float: 2
+idouble: 5
+ifloat: 2
+
+Function: "carg_towardzero":
+double: 5
+float: 2
+idouble: 5
+ifloat: 2
+
+Function: "carg_upward":
+double: 8
+float: 2
+idouble: 8
+ifloat: 2
+
+Function: Real part of "casin":
+double: 3
+float: 1
+idouble: 3
+ifloat: 1
+
+Function: Imaginary part of "casin":
+double: 5
+float: 4
+idouble: 5
+ifloat: 3
+
+Function: Real part of "casin_downward":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: Imaginary part of "casin_downward":
+double: 5
+float: 3
+idouble: 5
+ifloat: 3
+
+Function: Real part of "casin_towardzero":
+double: 3
+float: 1
+idouble: 3
+ifloat: 1
+
+Function: Imaginary part of "casin_towardzero":
+double: 4
+float: 2
+idouble: 4
+ifloat: 2
+
+Function: Real part of "casin_upward":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: Imaginary part of "casin_upward":
+double: 5
+float: 5
+idouble: 5
+ifloat: 5
+
+Function: Real part of "casinh":
+double: 5
+float: 4
+idouble: 5
+ifloat: 3
+
+Function: Imaginary part of "casinh":
+double: 3
+float: 2
+idouble: 3
+ifloat: 1
+
+Function: Real part of "casinh_downward":
+double: 5
+float: 3
+idouble: 5
+ifloat: 3
+
+Function: Imaginary part of "casinh_downward":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: Real part of "casinh_towardzero":
+double: 4
+float: 2
+idouble: 4
+ifloat: 2
+
+Function: Imaginary part of "casinh_towardzero":
+double: 3
+float: 1
+idouble: 3
+ifloat: 1
+
+Function: Real part of "casinh_upward":
+double: 5
+float: 5
+idouble: 5
+ifloat: 5
+
+Function: Imaginary part of "casinh_upward":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: Real part of "catan":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: Imaginary part of "catan":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Real part of "catan_downward":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: Imaginary part of "catan_downward":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: Real part of "catan_towardzero":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: Imaginary part of "catan_towardzero":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Real part of "catan_upward":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: Imaginary part of "catan_upward":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Real part of "catanh":
+double: 4
+float: 4
+idouble: 4
+ifloat: 2
+
+Function: Imaginary part of "catanh":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: Real part of "catanh_downward":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: Imaginary part of "catanh_downward":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: Real part of "catanh_towardzero":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Imaginary part of "catanh_towardzero":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: Real part of "catanh_upward":
+double: 4
+float: 4
+idouble: 4
+ifloat: 4
+
+Function: Imaginary part of "catanh_upward":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "cbrt":
+double: 4
+float: 1
+idouble: 4
+ifloat: 1
+
+Function: "cbrt_downward":
+double: 4
+float: 1
+idouble: 4
+ifloat: 1
+
+Function: "cbrt_towardzero":
+double: 3
+float: 1
+idouble: 3
+ifloat: 1
+
+Function: "cbrt_upward":
+double: 5
+float: 1
+idouble: 5
+ifloat: 1
+
+Function: Real part of "ccos":
+double: 3
+float: 3
+idouble: 3
+ifloat: 2
+
+Function: Imaginary part of "ccos":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Real part of "ccos_downward":
+double: 3
+float: 1
+idouble: 3
+ifloat: 1
+
+Function: Imaginary part of "ccos_downward":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Real part of "ccos_towardzero":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: Imaginary part of "ccos_towardzero":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Real part of "ccos_upward":
+double: 4
+float: 2
+idouble: 4
+ifloat: 2
+
+Function: Imaginary part of "ccos_upward":
+double: 4
+float: 4
+idouble: 4
+ifloat: 4
+
+Function: Real part of "ccosh":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Imaginary part of "ccosh":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Real part of "ccosh_downward":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: Imaginary part of "ccosh_downward":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Real part of "ccosh_towardzero":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Imaginary part of "ccosh_towardzero":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Real part of "ccosh_upward":
+double: 4
+float: 3
+idouble: 4
+ifloat: 3
+
+Function: Imaginary part of "ccosh_upward":
+double: 4
+float: 4
+idouble: 4
+ifloat: 4
+
+Function: Real part of "cexp":
+double: 4
+float: 3
+idouble: 4
+ifloat: 2
+
+Function: Imaginary part of "cexp":
+double: 4
+float: 3
+idouble: 4
+ifloat: 3
+
+Function: Real part of "cexp_downward":
+double: 4
+float: 2
+idouble: 4
+ifloat: 2
+
+Function: Imaginary part of "cexp_downward":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Real part of "cexp_towardzero":
+double: 4
+float: 2
+idouble: 4
+ifloat: 2
+
+Function: Imaginary part of "cexp_towardzero":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Real part of "cexp_upward":
+double: 5
+float: 3
+idouble: 5
+ifloat: 3
+
+Function: Imaginary part of "cexp_upward":
+double: 4
+float: 4
+idouble: 4
+ifloat: 4
+
+Function: Real part of "clog":
+double: 5
+float: 4
+idouble: 5
+ifloat: 4
+
+Function: Imaginary part of "clog":
+double: 7
+float: 2
+idouble: 7
+ifloat: 2
+
+Function: Real part of "clog10":
+double: 6
+float: 5
+idouble: 6
+ifloat: 5
+
+Function: Imaginary part of "clog10":
+double: 8
+float: 4
+idouble: 8
+ifloat: 4
+
+Function: Real part of "clog10_downward":
+double: 5
+float: 5
+idouble: 5
+ifloat: 5
+
+Function: Imaginary part of "clog10_downward":
+double: 8
+float: 4
+idouble: 8
+ifloat: 4
+
+Function: Real part of "clog10_towardzero":
+double: 6
+float: 6
+idouble: 6
+ifloat: 6
+
+Function: Imaginary part of "clog10_towardzero":
+double: 9
+float: 4
+idouble: 9
+ifloat: 4
+
+Function: Real part of "clog10_upward":
+double: 6
+float: 6
+idouble: 6
+ifloat: 6
+
+Function: Imaginary part of "clog10_upward":
+double: 9
+float: 5
+idouble: 9
+ifloat: 5
+
+Function: Real part of "clog_downward":
+double: 4
+float: 3
+idouble: 4
+ifloat: 3
+
+Function: Imaginary part of "clog_downward":
+double: 5
+float: 2
+idouble: 5
+ifloat: 2
+
+Function: Real part of "clog_towardzero":
+double: 5
+float: 4
+idouble: 5
+ifloat: 4
+
+Function: Imaginary part of "clog_towardzero":
+double: 5
+float: 3
+idouble: 5
+ifloat: 3
+
+Function: Real part of "clog_upward":
+double: 5
+float: 4
+idouble: 5
+ifloat: 4
+
+Function: Imaginary part of "clog_upward":
+double: 8
+float: 2
+idouble: 8
+ifloat: 2
+
+Function: "cos":
+double: 4
+float: 1
+idouble: 4
+ifloat: 1
+
+Function: "cos_downward":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "cos_towardzero":
+double: 4
+float: 2
+idouble: 4
+ifloat: 2
+
+Function: "cos_upward":
+double: 4
+float: 2
+idouble: 4
+ifloat: 2
+
+Function: "cosh":
+double: 3
+float: 3
+idouble: 3
+ifloat: 2
+
+Function: "cosh_downward":
+double: 2
+float: 1
+idouble: 2
+ifloat: 1
+
+Function: "cosh_towardzero":
+double: 2
+float: 1
+idouble: 2
+ifloat: 1
+
+Function: "cosh_upward":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: Real part of "cpow":
+double: 9
+float: 8
+idouble: 9
+ifloat: 8
+
+Function: Imaginary part of "cpow":
+double: 3
+float: 6
+idouble: 3
+ifloat: 6
+
+Function: Real part of "cpow_downward":
+double: 5
+float: 8
+idouble: 5
+ifloat: 8
+
+Function: Imaginary part of "cpow_downward":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: Real part of "cpow_towardzero":
+double: 5
+float: 8
+idouble: 5
+ifloat: 8
+
+Function: Imaginary part of "cpow_towardzero":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: Real part of "cpow_upward":
+double: 5
+float: 8
+idouble: 5
+ifloat: 8
+
+Function: Imaginary part of "cpow_upward":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: Real part of "csin":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Imaginary part of "csin":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Real part of "csin_downward":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Imaginary part of "csin_downward":
+double: 3
+float: 1
+idouble: 3
+ifloat: 1
+
+Function: Real part of "csin_towardzero":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Imaginary part of "csin_towardzero":
+double: 3
+float: 1
+idouble: 3
+ifloat: 1
+
+Function: Real part of "csin_upward":
+double: 4
+float: 4
+idouble: 4
+ifloat: 4
+
+Function: Imaginary part of "csin_upward":
+double: 4
+float: 2
+idouble: 4
+ifloat: 2
+
+Function: Real part of "csinh":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Imaginary part of "csinh":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Real part of "csinh_downward":
+double: 3
+float: 1
+idouble: 3
+ifloat: 1
+
+Function: Imaginary part of "csinh_downward":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Real part of "csinh_towardzero":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: Imaginary part of "csinh_towardzero":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: Real part of "csinh_upward":
+double: 4
+float: 2
+idouble: 4
+ifloat: 2
+
+Function: Imaginary part of "csinh_upward":
+double: 4
+float: 4
+idouble: 4
+ifloat: 4
+
+Function: Real part of "csqrt":
+double: 4
+float: 3
+idouble: 4
+ifloat: 3
+
+Function: Imaginary part of "csqrt":
+double: 4
+float: 3
+idouble: 4
+ifloat: 3
+
+Function: Real part of "csqrt_downward":
+double: 5
+float: 4
+idouble: 5
+ifloat: 4
+
+Function: Imaginary part of "csqrt_downward":
+double: 4
+float: 3
+idouble: 4
+ifloat: 3
+
+Function: Real part of "csqrt_towardzero":
+double: 5
+float: 4
+idouble: 5
+ifloat: 4
+
+Function: Imaginary part of "csqrt_towardzero":
+double: 4
+float: 4
+idouble: 4
+ifloat: 4
+
+Function: Real part of "csqrt_upward":
+double: 5
+float: 4
+idouble: 5
+ifloat: 4
+
+Function: Imaginary part of "csqrt_upward":
+double: 4
+float: 4
+idouble: 4
+ifloat: 4
+
+Function: Real part of "ctan":
+double: 4
+float: 6
+idouble: 4
+ifloat: 6
+
+Function: Imaginary part of "ctan":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: Real part of "ctan_downward":
+double: 6
+float: 5
+idouble: 6
+ifloat: 5
+
+Function: Imaginary part of "ctan_downward":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: Real part of "ctan_towardzero":
+double: 5
+float: 6
+idouble: 5
+ifloat: 6
+
+Function: Imaginary part of "ctan_towardzero":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: Real part of "ctan_upward":
+double: 5
+float: 6
+idouble: 5
+ifloat: 6
+
+Function: Imaginary part of "ctan_upward":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: Real part of "ctanh":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: Imaginary part of "ctanh":
+double: 4
+float: 6
+idouble: 4
+ifloat: 6
+
+Function: Real part of "ctanh_downward":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: Imaginary part of "ctanh_downward":
+double: 6
+float: 5
+idouble: 6
+ifloat: 5
+
+Function: Real part of "ctanh_towardzero":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: Imaginary part of "ctanh_towardzero":
+double: 5
+float: 6
+idouble: 5
+ifloat: 6
+
+Function: Real part of "ctanh_upward":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: Imaginary part of "ctanh_upward":
+double: 5
+float: 6
+idouble: 5
+ifloat: 6
+
+Function: "erf":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "erf_downward":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "erf_towardzero":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: "erf_upward":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "erfc":
+double: 5
+float: 5
+idouble: 5
+ifloat: 5
+
+Function: "erfc_downward":
+double: 4
+float: 4
+idouble: 4
+ifloat: 4
+
+Function: "erfc_towardzero":
+double: 4
+float: 4
+idouble: 4
+ifloat: 4
+
+Function: "erfc_upward":
+double: 5
+float: 5
+idouble: 5
+ifloat: 5
+
+Function: "exp":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "exp10":
+double: 4
+float: 1
+idouble: 4
+ifloat: 1
+
+Function: "exp10_downward":
+double: 3
+idouble: 3
+
+Function: "exp10_towardzero":
+double: 3
+idouble: 3
+
+Function: "exp10_upward":
+double: 4
+float: 1
+idouble: 4
+ifloat: 1
+
+Function: "exp2":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "exp2_downward":
+double: 1
+idouble: 1
+
+Function: "exp2_towardzero":
+double: 1
+idouble: 1
+
+Function: "exp2_upward":
+double: 2
+float: 1
+idouble: 2
+ifloat: 1
+
+Function: "exp_downward":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "exp_towardzero":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "exp_upward":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "expm1":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "expm1_downward":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "expm1_towardzero":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: "expm1_upward":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "gamma":
+double: 7
+float: 6
+idouble: 7
+ifloat: 6
+
+Function: "gamma_downward":
+double: 6
+float: 5
+idouble: 6
+ifloat: 5
+
+Function: "gamma_towardzero":
+double: 7
+float: 6
+idouble: 7
+ifloat: 6
+
+Function: "gamma_upward":
+double: 7
+float: 6
+idouble: 7
+ifloat: 6
+
+Function: "hypot":
+double: 2
+float: 1
+idouble: 2
+ifloat: 1
+
+Function: "hypot_downward":
+double: 1
+idouble: 1
+
+Function: "hypot_towardzero":
+double: 1
+idouble: 1
+
+Function: "hypot_upward":
+double: 2
+float: 1
+idouble: 2
+ifloat: 1
+
+Function: "j0":
+double: 4
+float: 4
+idouble: 4
+ifloat: 4
+
+Function: "j0_downward":
+double: 2
+float: 4
+idouble: 2
+ifloat: 4
+
+Function: "j0_towardzero":
+double: 3
+float: 5
+idouble: 3
+ifloat: 5
+
+Function: "j0_upward":
+double: 3
+float: 5
+idouble: 3
+ifloat: 5
+
+Function: "j1":
+double: 5
+float: 5
+idouble: 5
+ifloat: 5
+
+Function: "j1_downward":
+double: 4
+float: 3
+idouble: 4
+ifloat: 3
+
+Function: "j1_towardzero":
+double: 4
+float: 3
+idouble: 4
+ifloat: 3
+
+Function: "j1_upward":
+double: 5
+float: 5
+idouble: 5
+ifloat: 5
+
+Function: "jn":
+double: 9
+float: 8
+idouble: 9
+ifloat: 8
+
+Function: "jn_downward":
+double: 7
+float: 9
+idouble: 7
+ifloat: 9
+
+Function: "jn_towardzero":
+double: 7
+float: 9
+idouble: 7
+ifloat: 9
+
+Function: "jn_upward":
+double: 9
+float: 9
+idouble: 9
+ifloat: 9
+
+Function: "lgamma":
+double: 7
+float: 6
+idouble: 7
+ifloat: 6
+
+Function: "lgamma_downward":
+double: 6
+float: 5
+idouble: 6
+ifloat: 5
+
+Function: "lgamma_towardzero":
+double: 7
+float: 6
+idouble: 7
+ifloat: 6
+
+Function: "lgamma_upward":
+double: 7
+float: 6
+idouble: 7
+ifloat: 6
+
+Function: "log":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "log10":
+double: 2
+float: 3
+idouble: 2
+ifloat: 3
+
+Function: "log10_downward":
+double: 2
+float: 3
+idouble: 2
+ifloat: 3
+
+Function: "log10_towardzero":
+double: 2
+float: 4
+idouble: 2
+ifloat: 4
+
+Function: "log10_upward":
+double: 3
+float: 4
+idouble: 3
+ifloat: 4
+
+Function: "log1p":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "log1p_downward":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: "log1p_towardzero":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "log1p_upward":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "log2":
+double: 2
+float: 1
+idouble: 2
+ifloat: 1
+
+Function: "log2_towardzero":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "log2_upward":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "log_towardzero":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "log_upward":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "pow":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "pow_downward":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "pow_towardzero":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "pow_upward":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "sin":
+double: 7
+float: 1
+idouble: 7
+ifloat: 1
+
+Function: "sin_downward":
+double: 4
+float: 1
+idouble: 4
+ifloat: 1
+
+Function: "sin_towardzero":
+double: 3
+float: 1
+idouble: 3
+ifloat: 1
+
+Function: "sin_upward":
+double: 7
+float: 1
+idouble: 7
+ifloat: 1
+
+Function: "sincos":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "sincos_downward":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "sincos_towardzero":
+double: 4
+float: 1
+idouble: 4
+ifloat: 1
+
+Function: "sincos_upward":
+double: 2
+float: 1
+idouble: 2
+ifloat: 1
+
+Function: "sinh":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: "sinh_downward":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: "sinh_towardzero":
+double: 2
+float: 2
+idouble: 2
+ifloat: 2
+
+Function: "sinh_upward":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: "tan":
+double: 1
+float: 1
+idouble: 1
+ifloat: 1
+
+Function: "tan_downward":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: "tan_towardzero":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: "tan_upward":
+double: 1
+float: 2
+idouble: 1
+ifloat: 2
+
+Function: "tanh":
+double: 3
+float: 2
+idouble: 3
+ifloat: 2
+
+Function: "tanh_downward":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: "tanh_towardzero":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: "tanh_upward":
+double: 3
+float: 3
+idouble: 3
+ifloat: 3
+
+Function: "tgamma":
+double: 9
+float: 9
+idouble: 9
+ifloat: 9
+
+Function: "tgamma_downward":
+double: 9
+float: 9
+idouble: 9
+ifloat: 9
+
+Function: "tgamma_towardzero":
+double: 9
+float: 8
+idouble: 9
+ifloat: 8
+
+Function: "tgamma_upward":
+double: 9
+float: 9
+idouble: 9
+ifloat: 9
+
+Function: "y0":
+double: 3
+float: 6
+idouble: 3
+ifloat: 6
+
+Function: "y0_downward":
+double: 3
+float: 4
+idouble: 3
+ifloat: 4
+
+Function: "y0_towardzero":
+double: 3
+float: 4
+idouble: 3
+ifloat: 4
+
+Function: "y0_upward":
+double: 4
+float: 5
+idouble: 4
+ifloat: 5
+
+Function: "y1":
+double: 7
+float: 6
+idouble: 7
+ifloat: 6
+
+Function: "y1_downward":
+double: 6
+float: 6
+idouble: 6
+ifloat: 6
+
+Function: "y1_towardzero":
+double: 7
+float: 7
+idouble: 7
+ifloat: 7
+
+Function: "y1_upward":
+double: 7
+float: 7
+idouble: 7
+ifloat: 7
+
+Function: "yn":
+double: 9
+float: 9
+idouble: 9
+ifloat: 9
+
+Function: "yn_downward":
+double: 8
+float: 8
+idouble: 8
+ifloat: 8
+
+Function: "yn_towardzero":
+double: 9
+float: 9
+idouble: 9
+ifloat: 9
+
+Function: "yn_upward":
+double: 9
+float: 9
+idouble: 9
+ifloat: 9
+
+# end of automatic generation
diff --git a/sysdeps/arc/fpu/libm-test-ulps-name b/sysdeps/arc/fpu/libm-test-ulps-name
new file mode 100644
index 000000000000..8c4fba4f9ae0
--- /dev/null
+++ b/sysdeps/arc/fpu/libm-test-ulps-name
@@ -0,0 +1 @@
+ARC
diff --git a/sysdeps/arc/fpu/s_fma.c b/sysdeps/arc/fpu/s_fma.c
new file mode 100644
index 000000000000..48bb40482dc9
--- /dev/null
+++ b/sysdeps/arc/fpu/s_fma.c
@@ -0,0 +1,28 @@
+/* Copyright (C) 1996-2020 Free Software Foundation, Inc.
+
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
+#include <math.h>
+#include <libm-alias-double.h>
+
+double
+__fma (double x, double y, double z)
+{
+  return __builtin_fma (x, y, z);
+}
+
+libm_alias_double (__fma, fma)
diff --git a/sysdeps/arc/fpu/s_fmaf.c b/sysdeps/arc/fpu/s_fmaf.c
new file mode 100644
index 000000000000..544f32e27aec
--- /dev/null
+++ b/sysdeps/arc/fpu/s_fmaf.c
@@ -0,0 +1,28 @@
+/* Copyright (C) 2011-2020 Free Software Foundation, Inc.
+
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public License as
+   published by the Free Software Foundation; either version 2.1 of the
+   License, or (at your option) any later version.
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
+#include <math.h>
+#include <libm-alias-float.h>
+
+float
+__fmaf (float x, float y, float z)
+{
+  return __builtin_fmaf (x, y, z);
+}
+
+libm_alias_float (__fma, fma)
diff --git a/sysdeps/arc/fpu_control.h b/sysdeps/arc/fpu_control.h
new file mode 100644
index 000000000000..c318cc894871
--- /dev/null
+++ b/sysdeps/arc/fpu_control.h
@@ -0,0 +1,101 @@
+/* FPU control word bits.  ARC version.
+   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
+#ifndef _FPU_CONTROL_H
+#define _FPU_CONTROL_H
+
+/* ARC FPU control register bits.
+
+  [  0] -> IVE: Enable invalid operation exception.
+           if 0, soft exception: status register IV flag set.
+           if 1, hardware exception trap (not supported in Linux yet).
+  [  1] -> DZE: Enable division by zero exception.
+           if 0, soft exception: status register IV flag set.
+           if 1, hardware exception: (not supported in Linux yet).
+  [9:8] -> RM: Rounding Mode:
+           00 - Rounding toward zero.
+           01 - Rounding to nearest (default).
+           10 - Rounding (up) toward plus infinity.
+           11 - Rounding (down)toward minus infinity.
+
+   ARC FPU status register bits.
+
+   [ 0]  -> IV: flag invalid operation.
+   [ 1]  -> DZ: flag division by zero.
+   [ 2]  -> OV: flag Overflow operation.
+   [ 3]  -> UV: flag Underflow operation.
+   [ 4]  -> IX: flag Inexact operation.
+   [31]  -> FWE: Flag Write Enable.
+            If 1, above flags writable explicitly (clearing),
+            else IoW and only writable indirectly via bits [12:7].  */
+
+#include <features.h>
+
+#if !defined(__ARC_FPU_SP__) &&  !defined(__ARC_FPU_DP__)
+
+# define _FPU_RESERVED 0xffffffff
+# define _FPU_DEFAULT  0x00000000
+typedef unsigned int fpu_control_t;
+# define _FPU_GETCW(cw) (cw) = 0
+# define _FPU_SETCW(cw) (void) (cw)
+# define _FPU_GETS(cw) (cw) = 0
+# define _FPU_SETS(cw) (void) (cw)
+extern fpu_control_t __fpu_control;
+
+#else
+
+#define _FPU_RESERVED		0
+
+/* The fdlibm code requires strict IEEE double precision arithmetic,
+   and no interrupts for exceptions, rounding to nearest.
+   So only RM set to b'01.  */
+# define _FPU_DEFAULT		0x00000100
+
+/* Actually default needs to have FWE bit as 1 but that is already
+   ingrained into _FPU_SETS macro below.  */
+#define  _FPU_FPSR_DEFAULT	0x00000000
+
+#define __FPU_RND_SHIFT		8
+
+/* Type of the control word.  */
+typedef unsigned int fpu_control_t;
+
+/* Macros for accessing the hardware control word.  */
+#  define _FPU_GETCW(cw) __asm__ volatile ("lr %0, [0x300]" : "=r" (cw))
+#  define _FPU_SETCW(cw) __asm__ volatile ("sr %0, [0x300]" : : "r" (cw))
+
+/*  Macros for accessing the hardware status word.
+    FWE bit is special as it controls if actual status bits could be wrritten
+    explicitly (other than FPU instructions). We handle it here to keep the
+    callers agnostic of it:
+      - clear it out when reporting status bits
+      - always set it when changing status bits.  */
+#  define _FPU_GETS(cw) __asm__ volatile ("lr   %0, [0x301]	\r\n" \
+                                          "bclr %0, %0, 31	\r\n" \
+                                          : "=r" (cw))
+
+#  define _FPU_SETS(cw) __asm__ volatile ("bset %0, %0, 31	\r\n" \
+					  "sr   %0, [0x301]	\r\n" \
+                                          : : "r" (cw))
+
+/* Default control word set at startup.  */
+extern fpu_control_t __fpu_control;
+
+#endif
+
+#endif /* fpu_control.h */
diff --git a/sysdeps/arc/get-rounding-mode.h b/sysdeps/arc/get-rounding-mode.h
new file mode 100644
index 000000000000..146290e3e0b9
--- /dev/null
+++ b/sysdeps/arc/get-rounding-mode.h
@@ -0,0 +1,38 @@
+/* Determine floating-point rounding mode within libc.  ARC version.
+   Copyright (C) 1998-2020 Free Software Foundation, Inc.
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
+#ifndef _ARC_GET_ROUNDING_MODE_H
+#define _ARC_GET_ROUNDING_MODE_H	1
+
+#include <fenv.h>
+#include <fpu_control.h>
+
+static inline int
+get_rounding_mode (void)
+{
+#if defined(__ARC_FPU_SP__) ||  defined(__ARC_FPU_DP__)
+  unsigned int fpcr;
+  _FPU_GETCW (fpcr);
+
+  return fpcr >> __FPU_RND_SHIFT;
+#else
+  return FE_TONEAREST;
+#endif
+}
+
+#endif /* get-rounding-mode.h */
diff --git a/sysdeps/arc/math-tests-trap.h b/sysdeps/arc/math-tests-trap.h
new file mode 100644
index 000000000000..1a3581396573
--- /dev/null
+++ b/sysdeps/arc/math-tests-trap.h
@@ -0,0 +1,27 @@
+/* Configuration for math tests: support for enabling exception traps.
+   ARC version.
+   Copyright (C) 2014-2020 Free Software Foundation, Inc.
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
+#ifndef ARC_MATH_TESTS_TRAP_H
+#define ARC_MATH_TESTS_TRAP_H 1
+
+/* Trapping exceptions are optional on ARC
+   and not supported in Linux kernel just yet.  */
+#define EXCEPTION_ENABLE_SUPPORTED(EXCEPT)	((EXCEPT) == 0)
+
+#endif /* math-tests-trap.h.  */
diff --git a/sysdeps/arc/tininess.h b/sysdeps/arc/tininess.h
new file mode 100644
index 000000000000..1db37790f881
--- /dev/null
+++ b/sysdeps/arc/tininess.h
@@ -0,0 +1 @@
+#define TININESS_AFTER_ROUNDING	1
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
