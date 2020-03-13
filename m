Return-Path: <SRS0=tGlP=46=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A05C1975A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Mar 2020 03:04:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5804206E2
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Mar 2020 03:04:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z+qZGnBK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dZGq1pUK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5804206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ewxmxbGQgYEOJpC36OZWIC9BoOLc1dO5IAp7aVZq2hs=; b=Z+qZGnBKQv/VQh
	t0Az9Rp5u+3Gl8ey4eosCYlKHJ2n3GMPYQRJf1kLuxAdqK4kUyiBzEW/DdOJ9nNimmUpCCqFsvp1P
	eCUQWo33v+FME1kezOjf4Zq8ygsNsYvqvap9SuOuNniy975pVRIm73UaP02+WGO7eHqyk1Ll+ZfTX
	F9pGJcHX4nndG/TCLT0KjU45ONYkdH2eo58y1a0QwPYdTrZE7Jj3RcqmPn+3istiqiRLtZWdrtAdE
	ATijYSJ7kYciW32PW/tkiX0mcTRXQ6c6t6GxDdYKSTih0KeYp3T9wGFJNln1D3LPB2kqd8Y24TIs3
	zWDSdlpgTutZipWWo/Ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCacu-0003ad-G6; Fri, 13 Mar 2020 03:04:44 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCaci-0003U6-KM
 for linux-snps-arc@lists.infradead.org; Fri, 13 Mar 2020 03:04:42 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7BED440269;
 Fri, 13 Mar 2020 03:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1584068672; bh=NgK76Fh0cy9slg+dAwdh4+4ehDcRbjQEuuvQSgheNlQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dZGq1pUK0YyhLCUopPfnWwqwpCYiD9yzp5RFjqV8hjV+FBVOGslUhrTO0GzD8haQT
 wso//xscBVfnbRRSiwiZtul2qw95vvcla2XWE84cF4bhEURifHcX33J5et8Sp4yKw4
 OvkOEM3YL7hr8Aq0HNRdwnZf9apPsTl/kVQtA2YOB5CnGO8WwfUU2bWSGOXodJ11Dd
 G2bb+++8rTFX1Ctpwm4MQc+7bd3MrezdJOIZ8fCUwKajouTO4mAfwrgF6YINLX6HNz
 Yf8TkLPiZduksP6g36t1NSqp3P9C2FobhRek6JfnEVySKAxsuUvPQxeA3RO1E9FFrA
 IX5RrUO6WmdPA==
Received: from vineetg-Latitude-E7450.internal.synopsys.com (unknown
 [10.13.182.230])
 by mailhost.synopsys.com (Postfix) with ESMTP id 50C86A0072;
 Fri, 13 Mar 2020 03:04:32 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v4 13/15] ARC: Build Infrastructure
Date: Thu, 12 Mar 2020 20:04:17 -0700
Message-Id: <20200313030419.15843-14-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200313030419.15843-1-vgupta@synopsys.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_200432_671422_CB588EA2 
X-CRM114-Status: GOOD (  13.70  )
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
 sysdeps/arc/Implies                        |  3 +++
 sysdeps/arc/Makefile                       | 25 ++++++++++++++++++++++
 sysdeps/arc/Versions                       |  6 ++++++
 sysdeps/arc/configure                      | 14 ++++++++++++
 sysdeps/arc/configure.ac                   | 11 ++++++++++
 sysdeps/arc/nptl/Makefile                  | 22 +++++++++++++++++++
 sysdeps/arc/preconfigure                   | 15 +++++++++++++
 sysdeps/unix/sysv/linux/arc/Implies        |  3 +++
 sysdeps/unix/sysv/linux/arc/Makefile       | 20 +++++++++++++++++
 sysdeps/unix/sysv/linux/arc/Versions       | 16 ++++++++++++++
 sysdeps/unix/sysv/linux/arc/configure      |  4 ++++
 sysdeps/unix/sysv/linux/arc/configure.ac   |  4 ++++
 sysdeps/unix/sysv/linux/arc/shlib-versions |  2 ++
 13 files changed, 145 insertions(+)
 create mode 100644 sysdeps/arc/Implies
 create mode 100644 sysdeps/arc/Makefile
 create mode 100644 sysdeps/arc/Versions
 create mode 100644 sysdeps/arc/configure
 create mode 100644 sysdeps/arc/configure.ac
 create mode 100644 sysdeps/arc/nptl/Makefile
 create mode 100644 sysdeps/arc/preconfigure
 create mode 100644 sysdeps/unix/sysv/linux/arc/Implies
 create mode 100644 sysdeps/unix/sysv/linux/arc/Makefile
 create mode 100644 sysdeps/unix/sysv/linux/arc/Versions
 create mode 100644 sysdeps/unix/sysv/linux/arc/configure
 create mode 100644 sysdeps/unix/sysv/linux/arc/configure.ac
 create mode 100644 sysdeps/unix/sysv/linux/arc/shlib-versions

diff --git a/sysdeps/arc/Implies b/sysdeps/arc/Implies
new file mode 100644
index 000000000000..780c4e246769
--- /dev/null
+++ b/sysdeps/arc/Implies
@@ -0,0 +1,3 @@
+wordsize-32
+ieee754/flt-32
+ieee754/dbl-64
diff --git a/sysdeps/arc/Makefile b/sysdeps/arc/Makefile
new file mode 100644
index 000000000000..92f90798355b
--- /dev/null
+++ b/sysdeps/arc/Makefile
@@ -0,0 +1,25 @@
+# ARC Makefile
+# Copyright (C) 1993-2020 Free Software Foundation, Inc.
+# This file is part of the GNU C Library.
+
+# The GNU C Library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2.1 of the License, or (at your option) any later version.
+
+# The GNU C Library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+
+# You should have received a copy of the GNU Lesser General Public
+# License along with the GNU C Library.  If not, see
+# <https://www.gnu.org/licenses/>.
+
+# We don't support long doubles as a distinct type.  We don't need to set
+# this variable; it's here mostly for documentational purposes.
+long-double-fcts = no
+
+ifeq ($(subdir),debug)
+CFLAGS-backtrace.c += -funwind-tables
+endif
diff --git a/sysdeps/arc/Versions b/sysdeps/arc/Versions
new file mode 100644
index 000000000000..2d0f534b2aba
--- /dev/null
+++ b/sysdeps/arc/Versions
@@ -0,0 +1,6 @@
+libc {
+  GLIBC_2.32 {
+    __syscall_error;
+    __mcount;
+  }
+}
diff --git a/sysdeps/arc/configure b/sysdeps/arc/configure
new file mode 100644
index 000000000000..52e286da2ebb
--- /dev/null
+++ b/sysdeps/arc/configure
@@ -0,0 +1,14 @@
+# This file is generated from configure.ac by Autoconf.  DO NOT EDIT!
+ # Local configure fragment for sysdeps/arc.
+
+$as_echo "#define PI_STATIC_AND_HIDDEN 1" >>confdefs.h
+
+libc_cv_have_sdata_section=no
+
+# For ARC, historically ; was used for comments and not newline
+# Later # also got added to comment list, but ; couldn't be switched to
+# canonical newline as there's lots of code out there which will break
+libc_cv_asm_line_sep='`'
+cat >>confdefs.h <<_ACEOF
+#define ASM_LINE_SEP $libc_cv_asm_line_sep
+_ACEOF
diff --git a/sysdeps/arc/configure.ac b/sysdeps/arc/configure.ac
new file mode 100644
index 000000000000..1074d312f033
--- /dev/null
+++ b/sysdeps/arc/configure.ac
@@ -0,0 +1,11 @@
+GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
+# Local configure fragment for sysdeps/arc.
+
+AC_DEFINE(PI_STATIC_AND_HIDDEN)
+libc_cv_have_sdata_section=no
+
+# For ARC, historically ; was used for comments and not newline
+# Later # also got added to comment list, but ; couldn't be switched to
+# canonical newline as there's lots of code out there which will break
+libc_cv_asm_line_sep='`'
+AC_DEFINE_UNQUOTED(ASM_LINE_SEP, $libc_cv_asm_line_sep)
diff --git a/sysdeps/arc/nptl/Makefile b/sysdeps/arc/nptl/Makefile
new file mode 100644
index 000000000000..6f387c53905d
--- /dev/null
+++ b/sysdeps/arc/nptl/Makefile
@@ -0,0 +1,22 @@
+# NPTL makefile fragment for ARC.
+# Copyright (C) 2005-2020 Free Software Foundation, Inc.
+#
+# This file is part of the GNU C Library.
+#
+# The GNU C Library is free software; you can redistribute it and/or
+# modify it under the terms of the GNU Lesser General Public
+# License as published by the Free Software Foundation; either
+# version 2.1 of the License, or (at your option) any later version.
+#
+# The GNU C Library is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+# Lesser General Public License for more details.
+#
+# You should have received a copy of the GNU Lesser General Public
+# License along with the GNU C Library.  If not, see
+# <https://www.gnu.org/licenses/>.
+
+ifeq ($(subdir),csu)
+gen-as-const-headers += tcb-offsets.sym
+endif
diff --git a/sysdeps/arc/preconfigure b/sysdeps/arc/preconfigure
new file mode 100644
index 000000000000..d9c5429f4050
--- /dev/null
+++ b/sysdeps/arc/preconfigure
@@ -0,0 +1,15 @@
+case "$machine" in
+arc*)
+  base_machine=arc
+  machine=arc
+
+  gccfloat=`$CC $CFLAGS $CPPFLAGS -E -dM -xc /dev/null | grep __ARC_FPU_| wc -l`
+  if test "$gccfloat" != "0"; then
+    echo "glibc being configured for double precision floating point"
+    with_fp_cond=1
+  else
+    with_fp_cond=0
+  fi
+  ;;
+
+esac
diff --git a/sysdeps/unix/sysv/linux/arc/Implies b/sysdeps/unix/sysv/linux/arc/Implies
new file mode 100644
index 000000000000..7f739a0340b6
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/Implies
@@ -0,0 +1,3 @@
+arc/nptl
+unix/sysv/linux/generic/wordsize-32
+unix/sysv/linux/generic
diff --git a/sysdeps/unix/sysv/linux/arc/Makefile b/sysdeps/unix/sysv/linux/arc/Makefile
new file mode 100644
index 000000000000..a6c6dfc6ec64
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/Makefile
@@ -0,0 +1,20 @@
+ifeq ($(subdir),stdlib)
+gen-as-const-headers += ucontext_i.sym
+endif
+
+ifeq ($(subdir),signal)
+sysdep_routines += sigrestorer
+endif
+
+ifeq ($(subdir),misc)
+# MIPS/Tile-style cacheflush routine
+sysdep_headers += sys/cachectl.h
+sysdep_routines += cacheflush
+endif
+
+ifeq ($(subdir),elf)
+ifeq ($(build-shared),yes)
+# This is needed for DSO loading from static binaries.
+sysdep-dl-routines += dl-static
+endif
+endif
diff --git a/sysdeps/unix/sysv/linux/arc/Versions b/sysdeps/unix/sysv/linux/arc/Versions
new file mode 100644
index 000000000000..292f1974b02a
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/Versions
@@ -0,0 +1,16 @@
+ld {
+  GLIBC_PRIVATE {
+    # used for loading by static libraries
+    _dl_var_init;
+  }
+}
+libc {
+  GLIBC_2.32 {
+    _flush_cache;
+    cacheflush;
+  }
+  GLIBC_PRIVATE {
+    # A copy of sigaction lives in libpthread, and needs these.
+    __default_rt_sa_restorer;
+  }
+}
diff --git a/sysdeps/unix/sysv/linux/arc/configure b/sysdeps/unix/sysv/linux/arc/configure
new file mode 100644
index 000000000000..56ec14357507
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/configure
@@ -0,0 +1,4 @@
+# This file is generated from configure.in by Autoconf.  DO NOT EDIT!
+ # Local configure fragment for sysdeps/unix/sysv/linux/arc.
+
+arch_minimum_kernel=5.1.0
diff --git a/sysdeps/unix/sysv/linux/arc/configure.ac b/sysdeps/unix/sysv/linux/arc/configure.ac
new file mode 100644
index 000000000000..8af5a12cc248
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/configure.ac
@@ -0,0 +1,4 @@
+GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
+# Local configure fragment for sysdeps/unix/sysv/linux/arc.
+
+arch_minimum_kernel=5.1.0
diff --git a/sysdeps/unix/sysv/linux/arc/shlib-versions b/sysdeps/unix/sysv/linux/arc/shlib-versions
new file mode 100644
index 000000000000..a4b961583e95
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/shlib-versions
@@ -0,0 +1,2 @@
+DEFAULT                 GLIBC_2.32
+ld=ld-linux-arc.so.2
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
