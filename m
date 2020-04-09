Return-Path: <SRS0=Kc19=5Z=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370E9C2BA2B
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Apr 2020 02:56:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0409E20757
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Apr 2020 02:56:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l8SUXtaX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gJVPfUVo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0409E20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y7KKBHOmFkx8qGpyCo+No60nXHSSwFxXo8IFPm63fgU=; b=l8SUXtaX31mAGg
	sVeoMVj+Llyd7TwcTtFL4ePkCD/8mAJuuAnf2FkVorlI2dl5asTLxjkDcOoeeLBDztwz9ul+K/bg7
	BIHNFhFh3BpR+5qboGD/K+HfjZ/diRBBiQjuvEEvRJzeME91tKxwovLkTdp7UszdvMSAImIQWOyev
	CxiboD9TtQCL4AgBUsteg9KzYtP3gSpFPUAzQjY6VkAZipT5plKozmXTiV/S4lnms9xe7x7NrVlW+
	tqWarpD9/ELWU5sH2CLkQCVXBYFDQtcql76YMxJAKVSBUUSlnzFRofkTY3yJbbJ5/czHvCrF9Ni52
	/XZH73IEDBlhASPIHjpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMNMy-0005eS-PL; Thu, 09 Apr 2020 02:56:44 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMNMn-0005Y3-NN
 for linux-snps-arc@lists.infradead.org; Thu, 09 Apr 2020 02:56:41 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 91AE8406A9;
 Thu,  9 Apr 2020 02:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586400993; bh=RGjgoMhlEok/BmUlk6KLEjk2j3H0TZfpuS54YCIPa/g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gJVPfUVosD1TgnwAIaNs9jHNqSImIWcwvMYatRrtWjx2LYAYUsbEEW+MX7vCdAJ32
 1c7x+A4UItMA8OH2Jx1DCfrPhnrDaGb1T/1Bm5JlkFMU/HNF/WbeFfv27QE19ZO++D
 hgdTxScbP+WTVzuKjXKVlL/Kp9VUtwVE9QGy0OTtXssPzTBEHvpvh5e26cEjRCeXbN
 eDV182Cw60S7CtPtzAIJfFVyGYr/1dchbEg6RUYQUW+60eGJfEnFzK2LoqpaBLly1C
 H5/7ioklQ1RqiFGcZGRNm/mnd4yLPYRY4kYJzOeHGp++4oro3S45FnG2MKCmFKcF49
 NGz/qfhjCj4aQ==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 2A34AA00BB;
 Thu,  9 Apr 2020 02:56:32 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v5 06/14] ARC: hardware floating point support
Date: Wed,  8 Apr 2020 19:56:07 -0700
Message-Id: <20200409025615.27003-7-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409025615.27003-1-vgupta@synopsys.com>
References: <20200409025615.27003-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200408_195633_770736_5DD0A812 
X-CRM114-Status: GOOD (  14.66  )
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
 sysdeps/arc/fpu/e_sqrt.c        |  27 +++++++++
 sysdeps/arc/fpu/e_sqrtf.c       |  27 +++++++++
 sysdeps/arc/fpu/fclrexcpt.c     |  36 +++++++++++
 sysdeps/arc/fpu/fegetenv.c      |  37 ++++++++++++
 sysdeps/arc/fpu/fegetmode.c     |  31 ++++++++++
 sysdeps/arc/fpu/fegetround.c    |  32 ++++++++++
 sysdeps/arc/fpu/feholdexcpt.c   |  43 ++++++++++++++
 sysdeps/arc/fpu/fesetenv.c      |  48 +++++++++++++++
 sysdeps/arc/fpu/fesetexcept.c   |  32 ++++++++++
 sysdeps/arc/fpu/fesetmode.c     |  40 +++++++++++++
 sysdeps/arc/fpu/fesetround.c    |  40 +++++++++++++
 sysdeps/arc/fpu/feupdateenv.c   |  51 ++++++++++++++++
 sysdeps/arc/fpu/fgetexcptflg.c  |  31 ++++++++++
 sysdeps/arc/fpu/fraiseexcpt.c   |  39 ++++++++++++
 sysdeps/arc/fpu/fsetexcptflg.c  |  38 ++++++++++++
 sysdeps/arc/fpu/ftestexcept.c   |  33 +++++++++++
 sysdeps/arc/fpu/s_fma.c         |  28 +++++++++
 sysdeps/arc/fpu/s_fmaf.c        |  28 +++++++++
 sysdeps/arc/fpu_control.h       | 102 ++++++++++++++++++++++++++++++++
 sysdeps/arc/get-rounding-mode.h |  38 ++++++++++++
 sysdeps/arc/math-tests-trap.h   |  27 +++++++++
 sysdeps/arc/tininess.h          |   1 +
 22 files changed, 809 insertions(+)
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
 create mode 100644 sysdeps/arc/fpu/s_fma.c
 create mode 100644 sysdeps/arc/fpu/s_fmaf.c
 create mode 100644 sysdeps/arc/fpu_control.h
 create mode 100644 sysdeps/arc/get-rounding-mode.h
 create mode 100644 sysdeps/arc/math-tests-trap.h
 create mode 100644 sysdeps/arc/tininess.h

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
index 000000000000..1f04c2d745fa
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
+  *modep = fpcr;
+
+  return 0;
+}
diff --git a/sysdeps/arc/fpu/fegetround.c b/sysdeps/arc/fpu/fegetround.c
new file mode 100644
index 000000000000..99d4aeee31b7
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
+  return (fpcr >> __FPU_RND_SHIFT) & __FPU_RND_MASK;
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
index 000000000000..2fedaedb9e01
--- /dev/null
+++ b/sysdeps/arc/fpu/fesetmode.c
@@ -0,0 +1,40 @@
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
+  if (modep == FE_DFL_MODE)
+    {
+      fpcr = _FPU_DEFAULT;
+    }
+  else
+    {
+      /* No need to mask out reserved bits as they are IoW.  */
+      fpcr = *modep;
+    }
+
+  _FPU_SETCW (fpcr);
+
+  return 0;
+}
diff --git a/sysdeps/arc/fpu/fesetround.c b/sysdeps/arc/fpu/fesetround.c
new file mode 100644
index 000000000000..7a3526112e30
--- /dev/null
+++ b/sysdeps/arc/fpu/fesetround.c
@@ -0,0 +1,40 @@
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
+  if (((fpcr >> __FPU_RND_SHIFT) & __FPU_RND_MASK) != round)
+    {
+      fpcr &= ~(__FPU_RND_MASK << __FPU_RND_SHIFT);
+      fpcr |= (round & __FPU_RND_MASK) << __FPU_RND_SHIFT;
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
index 000000000000..f2729e732499
--- /dev/null
+++ b/sysdeps/arc/fpu/feupdateenv.c
@@ -0,0 +1,51 @@
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
+  _FPU_GETS (fpsr);
+
+  if (envp == FE_DFL_ENV)
+    {
+      fpcr = _FPU_DEFAULT;
+    }
+  else
+    {
+      fpcr = envp->__fpcr;
+
+      /* currently raised exceptions need to be preserved.  */
+      fpsr |= envp->__fpsr;
+    }
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
index 000000000000..a7cf99557b8f
--- /dev/null
+++ b/sysdeps/arc/fpu_control.h
@@ -0,0 +1,102 @@
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
+#define __FPU_RND_MASK		0x3
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
index 000000000000..cfa5c34473ac
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
+  return (fpcr >> __FPU_RND_SHIFT) & __FPU_RND_MASK;
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
