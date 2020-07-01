Return-Path: <SRS0=/nRw=AM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBF1C433E0
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Jul 2020 00:08:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 096F520722
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Jul 2020 00:08:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fh34Jmtc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Bln+yl1O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 096F520722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yXkCyEuntJGH+2eyZzTOQM/qGHBhNit4CExPmWv3d78=; b=Fh34Jmtcpoubl0G4DuLKlVSS2
	tFCrpOwKzv7xmiQmdQd+xUhrDuAiElmGTXLEtfqE00oKFFzvAaBXX5JeJQLFO0Q4eQpbHYg9rfdXQ
	8Pvpl7AdTewMeg1roGf2Z63UbeBjY635xviP2sMy3z+aweFzsGWanYiuM/tXYxg4z5DXTdgvGhLAL
	yzKAVo/IgRRYY1RIxX+8lFYLJGtuo0bQTKamjgv03GT9b8UOUuCH7ouQDdh24Rq4x0NLDFsS5C2wG
	TIPz4Qzoh4FYCthXyat0YkhqaSCVug/38ZOGATSZdsqWV8KeVyiLujXlu5ztS8cqk+OXM4a2pSAeY
	zNTOsGxzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqQIc-0005Ml-3I; Wed, 01 Jul 2020 00:08:26 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqQIX-0005LU-9e
 for linux-snps-arc@lists.infradead.org; Wed, 01 Jul 2020 00:08:23 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8C3FF40066;
 Wed,  1 Jul 2020 00:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1593562100; bh=stvmDcO0+0YDroSfEDTcbxQ1Nwybks6V/qZEMBOlr+w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bln+yl1OcA4f7yLer0jGeYiT690GdrbjC8G13bmVJsq1HIRPUElangSZKT8JtBlAc
 I+HOQRZgsW+H5p6WKEelqdeoDdpYelmsVtb12i+YLhpfL72kXDV5mRE9ye+FRcTfJ9
 MwF/pOgxWw3xlLeXzYj4NnV9ZmctG1hqf+j1zOZjcyJlzYtDrye2onOemWllDuTPCt
 AoTPF+QXISv6KtwnSlNl3fssbQ7wd9mP9LYGUCKzH26qITAqGIEEAftSKHz+xMdwsm
 F50tS1e5PamDScOw/d+qVnGr38IWgK6IQV1TpnYHdNGsj3/VieyPPxOE5QM6N+HJib
 59ihKXuADwAkw==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 41BF9A0070;
 Wed,  1 Jul 2020 00:08:17 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v7.1 06/13] ARC: hardware floating point support
Date: Tue, 30 Jun 2020 17:08:16 -0700
Message-Id: <20200701000816.19309-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200615201441.31820-7-vgupta@synopsys.com>
References: <20200615201441.31820-7-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_200821_550664_69826D87 
X-CRM114-Status: GOOD (  18.76  )
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

---
   Changes since v7:
     - Disintegrated math-use-builtins.h (deleted) and added
       math-use-builtins-{fma,sqrt}.h
---
 sysdeps/arc/fpu/fclrexcpt.c              |  36 ++++++++
 sysdeps/arc/fpu/fegetenv.c               |  37 ++++++++
 sysdeps/arc/fpu/fegetmode.c              |  31 +++++++
 sysdeps/arc/fpu/fegetround.c             |  32 +++++++
 sysdeps/arc/fpu/feholdexcpt.c            |  43 +++++++++
 sysdeps/arc/fpu/fesetenv.c               |  48 ++++++++++
 sysdeps/arc/fpu/fesetexcept.c            |  32 +++++++
 sysdeps/arc/fpu/fesetmode.c              |  40 +++++++++
 sysdeps/arc/fpu/fesetround.c             |  40 +++++++++
 sysdeps/arc/fpu/feupdateenv.c            |  51 +++++++++++
 sysdeps/arc/fpu/fgetexcptflg.c           |  31 +++++++
 sysdeps/arc/fpu/fraiseexcpt.c            |  39 +++++++++
 sysdeps/arc/fpu/fsetexcptflg.c           |  38 ++++++++
 sysdeps/arc/fpu/ftestexcept.c            |  33 +++++++
 sysdeps/arc/fpu/math-use-builtins-fma.h  |   4 +
 sysdeps/arc/fpu/math-use-builtins-sqrt.h |   4 +
 sysdeps/arc/fpu_control.h                | 106 +++++++++++++++++++++++
 sysdeps/arc/get-rounding-mode.h          |  38 ++++++++
 sysdeps/arc/math-tests-trap.h            |  27 ++++++
 sysdeps/arc/tininess.h                   |   1 +
 20 files changed, 711 insertions(+)
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
 create mode 100644 sysdeps/arc/fpu/math-use-builtins-fma.h
 create mode 100644 sysdeps/arc/fpu/math-use-builtins-sqrt.h
 create mode 100644 sysdeps/arc/fpu_control.h
 create mode 100644 sysdeps/arc/get-rounding-mode.h
 create mode 100644 sysdeps/arc/math-tests-trap.h
 create mode 100644 sysdeps/arc/tininess.h

diff --git a/sysdeps/arc/fpu/fclrexcpt.c b/sysdeps/arc/fpu/fclrexcpt.c
new file mode 100644
index 000000000000..7653d99a008c
--- /dev/null
+++ b/sysdeps/arc/fpu/fclrexcpt.c
@@ -0,0 +1,36 @@
+/* Clear given exceptions in current floating-point environment.
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
index 000000000000..bbb3b477b423
--- /dev/null
+++ b/sysdeps/arc/fpu/fegetenv.c
@@ -0,0 +1,37 @@
+/* Store current floating-point environment.
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
index 000000000000..f02c9119f222
--- /dev/null
+++ b/sysdeps/arc/fpu/fegetmode.c
@@ -0,0 +1,31 @@
+/* Store current floating-point control modes.
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
index 000000000000..c5496bcbf7b4
--- /dev/null
+++ b/sysdeps/arc/fpu/fegetround.c
@@ -0,0 +1,32 @@
+/* Return current rounding direction.
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
index 000000000000..59527ee25a66
--- /dev/null
+++ b/sysdeps/arc/fpu/feholdexcpt.c
@@ -0,0 +1,43 @@
+/* Store current floating-point environment and clear exceptions.
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
index 000000000000..4ef858fc10a9
--- /dev/null
+++ b/sysdeps/arc/fpu/fesetenv.c
@@ -0,0 +1,48 @@
+/* Install given floating-point environment (doesnot raise exceptions).
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
index 000000000000..77517d0b25ab
--- /dev/null
+++ b/sysdeps/arc/fpu/fesetexcept.c
@@ -0,0 +1,32 @@
+/* Set given exception flags.
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
index 000000000000..c4ea02d8d15b
--- /dev/null
+++ b/sysdeps/arc/fpu/fesetmode.c
@@ -0,0 +1,40 @@
+/* Install given floating-point control modes.
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
index 000000000000..701c0b2dcb42
--- /dev/null
+++ b/sysdeps/arc/fpu/fesetround.c
@@ -0,0 +1,40 @@
+/* Set current rounding direction.
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
index 000000000000..c63aefb25463
--- /dev/null
+++ b/sysdeps/arc/fpu/feupdateenv.c
@@ -0,0 +1,51 @@
+/* Install given floating-point environment and raise exceptions,
+   without clearing currently raised exceptions.
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
index 000000000000..a816121fd9b7
--- /dev/null
+++ b/sysdeps/arc/fpu/fgetexcptflg.c
@@ -0,0 +1,31 @@
+/* Store current representation for exceptions, ARC version.
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
index 000000000000..067c0607784f
--- /dev/null
+++ b/sysdeps/arc/fpu/fraiseexcpt.c
@@ -0,0 +1,39 @@
+/* Raise given exceptions.
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
index 000000000000..f9e08d504418
--- /dev/null
+++ b/sysdeps/arc/fpu/fsetexcptflg.c
@@ -0,0 +1,38 @@
+/* Set floating-point environment exception handling, ARC version.
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
index 000000000000..bb8ed27ab22b
--- /dev/null
+++ b/sysdeps/arc/fpu/ftestexcept.c
@@ -0,0 +1,33 @@
+/* Test exception in current environment.
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
diff --git a/sysdeps/arc/fpu/math-use-builtins-fma.h b/sysdeps/arc/fpu/math-use-builtins-fma.h
new file mode 100644
index 000000000000..eede75aa41be
--- /dev/null
+++ b/sysdeps/arc/fpu/math-use-builtins-fma.h
@@ -0,0 +1,4 @@
+#define USE_FMA_BUILTIN 1
+#define USE_FMAF_BUILTIN 1
+#define USE_FMAL_BUILTIN 0
+#define USE_FMAF128_BUILTIN 0
diff --git a/sysdeps/arc/fpu/math-use-builtins-sqrt.h b/sysdeps/arc/fpu/math-use-builtins-sqrt.h
new file mode 100644
index 000000000000..e94c915ba66a
--- /dev/null
+++ b/sysdeps/arc/fpu/math-use-builtins-sqrt.h
@@ -0,0 +1,4 @@
+#define USE_SQRT_BUILTIN 1
+#define USE_SQRTF_BUILTIN 1
+#define USE_SQRTL_BUILTIN 0
+#define USE_SQRTF128_BUILTIN 0
diff --git a/sysdeps/arc/fpu_control.h b/sysdeps/arc/fpu_control.h
new file mode 100644
index 000000000000..64457972d637
--- /dev/null
+++ b/sysdeps/arc/fpu_control.h
@@ -0,0 +1,106 @@
+/* FPU control word bits.  ARC version.
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
+#  define _FPU_GETS(cw)				\
+    __asm__ volatile ("lr   %0, [0x301]	\r\n" 	\
+                      "bclr %0, %0, 31	\r\n" 	\
+                      : "=r" (cw))
+
+#  define _FPU_SETS(cw)				\
+    do {					\
+      unsigned int __tmp = 0x80000000 | (cw);	\
+      __asm__ volatile ("sr  %0, [0x301] \r\n" 	\
+                        : : "r" (__tmp));	\
+    } while (0)
+
+/* Default control word set at startup.  */
+extern fpu_control_t __fpu_control;
+
+#endif
+
+#endif /* fpu_control.h */
diff --git a/sysdeps/arc/get-rounding-mode.h b/sysdeps/arc/get-rounding-mode.h
new file mode 100644
index 000000000000..15173e37aa4f
--- /dev/null
+++ b/sysdeps/arc/get-rounding-mode.h
@@ -0,0 +1,38 @@
+/* Determine floating-point rounding mode within libc.  ARC version.
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
index 000000000000..08b16f57976a
--- /dev/null
+++ b/sysdeps/arc/math-tests-trap.h
@@ -0,0 +1,27 @@
+/* Configuration for math tests: support for enabling exception traps.
+   ARC version.
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
