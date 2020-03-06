Return-Path: <SRS0=e3HE=4X=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A0AC3F2D6
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Mar 2020 18:24:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23DB420665
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Mar 2020 18:24:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K9ns+gmz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IJN8KpTa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23DB420665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Roc0Xhu4+0fKqHrEBNagys+TnOnTcIl2Lla/zd2+/Fw=; b=K9ns+gmzuzx9C3
	dFH8znoZfHpDUm8k4OEgAscuXV3FUFDpCgwk0bNMFGd1X49szJSnBObFJUJcl7cQcldyoSmCjacf+
	KM6zduC/yOgkZxnBd3j7tS7QwAqie+StAhSDvoB/BVKJ9C6Eb9dl/szLgFl3PQvrHQGYpHP03NZ2H
	fb4ipCQxXg3Su5Xkdv5tWzE7xaubfQvpuIO9/SfDk/H4SY1HrR5CSNqZ0vJZiCSv7ge8McKSq1FMk
	PlUV99nwZP5FSvl4Bzvhg/Y3o9+cmmBmePQk6kik6Lt8w2vVHMUwKsZ/C3Z8jBF4AhCRSiPO2TtJs
	kfQv7ZUHRUkk6xzFIdHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAHeH-0001Vo-SC; Fri, 06 Mar 2020 18:24:37 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAHeA-0001P2-A8
 for linux-snps-arc@lists.infradead.org; Fri, 06 Mar 2020 18:24:34 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9E7404033D;
 Fri,  6 Mar 2020 18:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583519068; bh=bLPhwK/uyXv5STMjWdMbYozeJaQn/2CfXOn2ABQU+zQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IJN8KpTanhzIwUiSJqMKhsJJbyb3/GXASBP+QsuXM3LhtCt0vfR3l8K2SLQE4Kay3
 Utj97rkeSD1eeLYw2zPDW09b7dBhUK6isFt4o/9m6SC7F2xg6nXVEuEqtaXaOPiWRr
 Nrg8Kjf0HBRizL7nzJZa9fjEsMWEpstOXyc3B4wrwyQvRKGi4OyYHxQLyuNnDt8xmP
 Y10x7r14Xtf4PPeJCG9Y+w81bSV9tFdkGuSqMCtAHyT+CajUH/6kF/wLFopR4UtgU3
 QNosS6lMEuolY4h4s5c+xFUpFqOBqMsDY2efsKVEiT4oiww9vBI/oOQG/XoSPjCdcl
 z1mlWUx5HvLNw==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.28])
 by mailhost.synopsys.com (Postfix) with ESMTP id 76D6DA0075;
 Fri,  6 Mar 2020 18:24:28 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v3 17/17] ARC: changes to enable 64-bit time_t, off_t,
 ino_t etc
Date: Fri,  6 Mar 2020 10:24:19 -0800
Message-Id: <20200306182419.13945-18-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200306182419.13945-1-vgupta@synopsys.com>
References: <20200306182419.13945-1-vgupta@synopsys.com>
MIME-Version: 1.0
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
 .../sysv/linux/arc/bits/socket-constants.h    |  4 +--
 sysdeps/unix/sysv/linux/arc/bits/timesize.h   | 21 +++++++++++++++
 sysdeps/unix/sysv/linux/arc/c++-types.data    | 16 ++++++------
 sysdeps/unix/sysv/linux/arc/configure         |  2 +-
 sysdeps/unix/sysv/linux/arc/configure.ac      |  2 +-
 sysdeps/unix/sysv/linux/arc/kernel_stat.h     | 26 +++++++++++++++++++
 sysdeps/unix/sysv/linux/arc/libc.abilist      |  6 ++---
 sysdeps/unix/sysv/linux/arc/sysdep.h          | 12 +++++++++
 8 files changed, 74 insertions(+), 15 deletions(-)
 create mode 100644 sysdeps/unix/sysv/linux/arc/bits/timesize.h
 create mode 100644 sysdeps/unix/sysv/linux/arc/kernel_stat.h

diff --git a/sysdeps/unix/sysv/linux/arc/bits/socket-constants.h b/sysdeps/unix/sysv/linux/arc/bits/socket-constants.h
index 053b5cee399a..74b0c06edb36 100644
--- a/sysdeps/unix/sysv/linux/arc/bits/socket-constants.h
+++ b/sysdeps/unix/sysv/linux/arc/bits/socket-constants.h
@@ -30,9 +30,9 @@
 #define SO_OOBINLINE 10
 #define SO_RCVBUF 8
 #define SO_RCVLOWAT 18
-#define SO_RCVTIMEO 20
+#define SO_RCVTIMEO 66
 #define SO_REUSEADDR 2
 #define SO_SNDBUF 7
 #define SO_SNDLOWAT 19
-# define SO_SNDTIMEO 21
+# define SO_SNDTIMEO 67
 #define SO_TYPE 3
diff --git a/sysdeps/unix/sysv/linux/arc/bits/timesize.h b/sysdeps/unix/sysv/linux/arc/bits/timesize.h
new file mode 100644
index 000000000000..1259077c6412
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/bits/timesize.h
@@ -0,0 +1,21 @@
+/* Bit size of the time_t type at glibc build time, general case.
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
+   <http://www.gnu.org/licenses/>.  */
+
+#include <bits/wordsize.h>
+
+#define __TIMESIZE	64
diff --git a/sysdeps/unix/sysv/linux/arc/c++-types.data b/sysdeps/unix/sysv/linux/arc/c++-types.data
index 303f4570c8ee..0fb0143ae746 100644
--- a/sysdeps/unix/sysv/linux/arc/c++-types.data
+++ b/sysdeps/unix/sysv/linux/arc/c++-types.data
@@ -1,5 +1,5 @@
 blkcnt64_t:x
-blkcnt_t:l
+blkcnt_t:x
 blksize_t:i
 caddr_t:Pc
 clockid_t:i
@@ -8,14 +8,14 @@ daddr_t:i
 dev_t:y
 fd_mask:l
 fsblkcnt64_t:y
-fsblkcnt_t:m
+fsblkcnt_t:y
 fsfilcnt64_t:y
-fsfilcnt_t:m
+fsfilcnt_t:y
 fsid_t:8__fsid_t
 gid_t:j
 id_t:j
 ino64_t:y
-ino_t:m
+ino_t:y
 int16_t:s
 int32_t:i
 int64_t:x
@@ -26,7 +26,7 @@ loff_t:x
 mode_t:j
 nlink_t:j
 off64_t:x
-off_t:l
+off_t:x
 pid_t:i
 pthread_attr_t:14pthread_attr_t
 pthread_barrier_t:17pthread_barrier_t
@@ -44,13 +44,13 @@ pthread_t:m
 quad_t:x
 register_t:i
 rlim64_t:y
-rlim_t:m
+rlim_t:y
 sigset_t:10__sigset_t
 size_t:j
 socklen_t:j
 ssize_t:i
-suseconds_t:l
-time_t:l
+suseconds_t:x
+time_t:x
 u_char:h
 uid_t:j
 uint:j
diff --git a/sysdeps/unix/sysv/linux/arc/configure b/sysdeps/unix/sysv/linux/arc/configure
index f74fa7cb0259..56ec14357507 100644
--- a/sysdeps/unix/sysv/linux/arc/configure
+++ b/sysdeps/unix/sysv/linux/arc/configure
@@ -1,4 +1,4 @@
 # This file is generated from configure.in by Autoconf.  DO NOT EDIT!
  # Local configure fragment for sysdeps/unix/sysv/linux/arc.
 
-arch_minimum_kernel=3.9.0
+arch_minimum_kernel=5.1.0
diff --git a/sysdeps/unix/sysv/linux/arc/configure.ac b/sysdeps/unix/sysv/linux/arc/configure.ac
index a9528032d32a..8af5a12cc248 100644
--- a/sysdeps/unix/sysv/linux/arc/configure.ac
+++ b/sysdeps/unix/sysv/linux/arc/configure.ac
@@ -1,4 +1,4 @@
 GLIBC_PROVIDES dnl See aclocal.m4 in the top level source directory.
 # Local configure fragment for sysdeps/unix/sysv/linux/arc.
 
-arch_minimum_kernel=3.9.0
+arch_minimum_kernel=5.1.0
diff --git a/sysdeps/unix/sysv/linux/arc/kernel_stat.h b/sysdeps/unix/sysv/linux/arc/kernel_stat.h
new file mode 100644
index 000000000000..8fdd86b9e843
--- /dev/null
+++ b/sysdeps/unix/sysv/linux/arc/kernel_stat.h
@@ -0,0 +1,26 @@
+/* Copyright (C) 2020 Free Software Foundation, Inc.
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
+#include <bits/wordsize.h>
+
+/* Needed to elide the itemized copy code in common xstatconv.c.  */
+#define STAT_IS_KERNEL_STAT 1
+
+/* Nice side-effect of 64-bit time_t switch is these are same.  */
+#define XSTAT_IS_XSTAT64 1
+
+#define STATFS_IS_STATFS64 0
diff --git a/sysdeps/unix/sysv/linux/arc/libc.abilist b/sysdeps/unix/sysv/linux/arc/libc.abilist
index a95b31434496..1e554c5be072 100644
--- a/sysdeps/unix/sysv/linux/arc/libc.abilist
+++ b/sysdeps/unix/sysv/linux/arc/libc.abilist
@@ -1,7 +1,7 @@
 GLIBC_2.32 _Exit F
-GLIBC_2.32 _IO_2_1_stderr_ D 0x98
-GLIBC_2.32 _IO_2_1_stdin_ D 0x98
-GLIBC_2.32 _IO_2_1_stdout_ D 0x98
+GLIBC_2.32 _IO_2_1_stderr_ D 0x9c
+GLIBC_2.32 _IO_2_1_stdin_ D 0x9c
+GLIBC_2.32 _IO_2_1_stdout_ D 0x9c
 GLIBC_2.32 _IO_adjust_column F
 GLIBC_2.32 _IO_adjust_wcolumn F
 GLIBC_2.32 _IO_default_doallocate F
diff --git a/sysdeps/unix/sysv/linux/arc/sysdep.h b/sysdeps/unix/sysv/linux/arc/sysdep.h
index 77d815e882e5..9cd12a86a950 100644
--- a/sysdeps/unix/sysv/linux/arc/sysdep.h
+++ b/sysdeps/unix/sysv/linux/arc/sysdep.h
@@ -22,6 +22,18 @@
 #include <sysdeps/arc/sysdep.h>
 #include <sysdeps/unix/sysv/linux/generic/sysdep.h>
 
+/* ARC's version of asm-generic syscall ABI does provide fstat64 and fstatat64
+   but it not compatible with glibc 64-bit time_t based stat64. So undef them
+   to allow generic code to pick up statx syscall based wrappers which do the
+   explict interworking.
+   Similarly futex32 exists and works but we'd rather use futex64. But lll code
+   using futex expects __NR_futex hence the forced redefine
+   */
+#undef __NR_fstat64
+#undef __NR_fstatat64
+#undef __NR_futex
+#define __NR_futex __NR_futex_time64
+
 /* For RTLD_PRIVATE_ERRNO.  */
 #include <dl-sysdep.h>
 
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
