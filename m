Return-Path: <SRS0=ka13=4M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9517EC11D2F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 18:23:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42CAB20838
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 18:23:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="igBJGEjs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gdn3vL62"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42CAB20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8afKvHOcGhp8sxvJ2QvsV/CXE5qSGlL9nnPtlTUZJDM=; b=igBJGEjsbTS5Rt
	zslBPVarIbrE2BbSY5wvzKNb+OaLEdObwZ6GrxQN5dlaj8WyEM9H4nuwTwKuxFFEIyGZNjuo7ktuW
	44x9RFBuD7kU00FfmGGHV33KROzTm6pjqzuI+TD0E27CqE7Rb3PNix5FHe8PXVU/sRuGJZl85wGNU
	9QBOO0VXFXFoM9Yx623hPgHBcp1a5NTpMziU+ZjCOuPTeUMUjFMPeERiHZAj1GtObiY4cYjnFj6Ot
	XwHg8D7jlo3rWSAmiRCvXnWXPkYeaz9OY0LHFxa8AT0cA+g8FxmlOmsVe5vZ1TFOYjnAbhrfgU3ej
	cKGj5h/DHT5QvpI13iFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6INz-0005Od-VA; Mon, 24 Feb 2020 18:23:19 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6INx-0005OH-JI
 for linux-snps-arc@lists.infradead.org; Mon, 24 Feb 2020 18:23:19 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D5D3240527;
 Mon, 24 Feb 2020 18:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582568595; bh=R6N92sCSOTxoo7IJxc7Xf3Hxi3uw0Q9D8RbjHSITWjU=;
 h=From:To:Cc:Subject:Date:From;
 b=gdn3vL625KIbATwKLyIus9MqTgnUjHMtsKXzzSE7G+k97tZ38QzOqqZR1UbNDpFEQ
 eG+SJkesS/S204e09V8AoL9C2xHmHrehErlo6FKzYMzwX430iDf9ztP6bCF6wtTb20
 VciAh3//Q1aW8QgRkqlongG21N6/7FDESyuq4Q5zVIpyjYM9sagQEPhrGq1SeGk6+u
 z++d6ucacwWql5wZXeNO3H3rrvn2wfJrh1sr1OpdBDbUVQjVXU1ed0FRTbtW67d7T2
 NxJ8eZ5epAw5J07WHYN3h8t5HsXhSlsOyvMHBTXmjvqLOyY1IBbz+hARPq+dlXDIAF
 X0/1Sn+NquuKQ==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.26])
 by mailhost.synopsys.com (Postfix) with ESMTP id 2D77DA005E;
 Mon, 24 Feb 2020 18:23:10 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org,
	arnd@arndb.de
Subject: [PATCH] asm-generic ABI: Allow statx syscall despite fstatat64,
 fstat64
Date: Mon, 24 Feb 2020 10:23:05 -0800
Message-Id: <20200224182305.28027-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_102317_647691_F1169B6C 
X-CRM114-Status: GOOD (  12.40  )
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
Cc: alistair23@gmail.com, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org, lukma@denx.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

An old version of asm-generic syscall ABI (e.g. ARC 2013) provided
fstat[at]64 syscalls for implementing the stat family.

These sycalls are passthru (no interworking/itemized-copy needed
between kernel and user structs since they are binary comaptible).
However with switch to 64-bit time_t the compatibily goes away so we
need explicit interworking. Luckily such code already exists albeit it
uses the statx syscall.

So this patch reworks the asm-generic based stat functions to use the
statx code-path if the arch so desires. It essentially reworks the commit
6bbfc5c09fc5b5e3 ("Add statx conditionals for wordsize-32 *xstat.c")

This will be used by ARC port for 64-bit time_t. But it has no real
bearing on 64-bit and can just be independently opted-in by an arch port
provided the ABI supports it.

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 sysdeps/unix/sysv/linux/fxstat64.c                     |  8 ++++----
 sysdeps/unix/sysv/linux/fxstatat64.c                   |  6 +++---
 sysdeps/unix/sysv/linux/generic/kernel_stat.h          |  7 +++++++
 sysdeps/unix/sysv/linux/generic/wordsize-32/fxstat.c   |  6 +++---
 sysdeps/unix/sysv/linux/generic/wordsize-32/fxstatat.c |  6 +++---
 sysdeps/unix/sysv/linux/generic/wordsize-32/lxstat.c   | 10 +++++-----
 sysdeps/unix/sysv/linux/generic/wordsize-32/lxstat64.c |  8 ++++----
 sysdeps/unix/sysv/linux/generic/wordsize-32/xstat.c    |  6 +++---
 sysdeps/unix/sysv/linux/generic/wordsize-32/xstat64.c  |  6 +++---
 sysdeps/unix/sysv/linux/statx_cp.c                     |  2 +-
 10 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/sysdeps/unix/sysv/linux/fxstat64.c b/sysdeps/unix/sysv/linux/fxstat64.c
index 9133a0a29b8e..d4da85f7949c 100644
--- a/sysdeps/unix/sysv/linux/fxstat64.c
+++ b/sysdeps/unix/sysv/linux/fxstat64.c
@@ -33,15 +33,15 @@ int
 ___fxstat64 (int vers, int fd, struct stat64 *buf)
 {
   int result;
-#ifdef __NR_fstat64
-  result = INLINE_SYSCALL (fstat64, 2, fd, buf);
-#else
+# if defined(STAT64_IS_NOT_KERNEL_STAT64) || !defined(__NR_fstat64)
   struct statx tmp;
   result = INLINE_SYSCALL (statx, 5, fd, "", AT_EMPTY_PATH, STATX_BASIC_STATS,
                            &tmp);
   if (result == 0)
     __cp_stat64_statx (buf, &tmp);
-#endif
+# else
+  result = INLINE_SYSCALL (fstat64, 2, fd, buf);
+# endif
   return result;
 }
 
diff --git a/sysdeps/unix/sysv/linux/fxstatat64.c b/sysdeps/unix/sysv/linux/fxstatat64.c
index e24b456604ff..eb59c8be845f 100644
--- a/sysdeps/unix/sysv/linux/fxstatat64.c
+++ b/sysdeps/unix/sysv/linux/fxstatat64.c
@@ -38,15 +38,15 @@ __fxstatat64 (int vers, int fd, const char *file, struct stat64 *st, int flag)
 
   int result;
 
-#ifdef __NR_fstatat64
-  result = INTERNAL_SYSCALL_CALL (fstatat64, fd, file, st, flag);
-#else
+# if defined(STAT64_IS_NOT_KERNEL_STAT64) || !defined(__NR_fstatat64)
   struct statx tmp;
 
   result = INTERNAL_SYSCALL_CALL (statx, fd, file, AT_NO_AUTOMOUNT | flag,
 				  STATX_BASIC_STATS, &tmp);
   if (result == 0)
     __cp_stat64_statx (st, &tmp);
+#else
+  result = INTERNAL_SYSCALL_CALL (fstatat64, fd, file, st, flag);
 #endif
   if (!__glibc_likely (INTERNAL_SYSCALL_ERROR_P (result)))
     return 0;
diff --git a/sysdeps/unix/sysv/linux/generic/kernel_stat.h b/sysdeps/unix/sysv/linux/generic/kernel_stat.h
index 2eed3596c0ed..916deb7ed8c1 100644
--- a/sysdeps/unix/sysv/linux/generic/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/generic/kernel_stat.h
@@ -28,3 +28,10 @@
 #endif
 
 #define STATFS_IS_STATFS64 0
+
+/* Ports define to 1 when glibc struct stat64 is not compatible with
+   kernel stat64. This forces use of statx syscall (and explicit interworking)
+   even when fstat64 syscall is available. For asm-generic ABI this happened
+   with switch to 64-bit time_t.  */
+
+# undef STAT64_IS_NOT_KERNEL_STAT64
diff --git a/sysdeps/unix/sysv/linux/generic/wordsize-32/fxstat.c b/sysdeps/unix/sysv/linux/generic/wordsize-32/fxstat.c
index 850450e1e8a1..8ab11c62d1b3 100644
--- a/sysdeps/unix/sysv/linux/generic/wordsize-32/fxstat.c
+++ b/sysdeps/unix/sysv/linux/generic/wordsize-32/fxstat.c
@@ -36,14 +36,14 @@ __fxstat (int vers, int fd, struct stat *buf)
 {
   if (vers == _STAT_VER_KERNEL)
     {
-# ifdef __NR_fstat64
-      int rc = INLINE_SYSCALL (fstat64, 2, fd, buf);
-# else
+# if defined(STAT64_IS_NOT_KERNEL_STAT64) || !defined(__NR_fstat64)
       struct statx tmp;
       int rc = INLINE_SYSCALL (statx, 5, fd, "", AT_EMPTY_PATH,
                                STATX_BASIC_STATS, &tmp);
       if (rc == 0)
         __cp_stat64_statx ((struct stat64 *)buf, &tmp);
+# else
+      int rc = INLINE_SYSCALL (fstat64, 2, fd, buf);
 # endif
       return rc ?: stat_overflow (buf);
     }
diff --git a/sysdeps/unix/sysv/linux/generic/wordsize-32/fxstatat.c b/sysdeps/unix/sysv/linux/generic/wordsize-32/fxstatat.c
index 8df65ebea084..19446a6cd917 100644
--- a/sysdeps/unix/sysv/linux/generic/wordsize-32/fxstatat.c
+++ b/sysdeps/unix/sysv/linux/generic/wordsize-32/fxstatat.c
@@ -36,15 +36,15 @@ __fxstatat (int vers, int fd, const char *file, struct stat *buf, int flag)
 {
   if (vers == _STAT_VER_KERNEL)
     {
-# ifdef __NR_fstatat64
-      int rc = INLINE_SYSCALL (fstatat64, 4, fd, file, buf, flag);
-# else
+# if defined(STAT64_IS_NOT_KERNEL_STAT64) || !defined(__NR_fstat64)
       struct statx tmp;
       int rc = INLINE_SYSCALL (statx, 5, fd, file,
                                AT_NO_AUTOMOUNT | flag,
                                STATX_BASIC_STATS, &tmp);
       if (rc == 0)
         __cp_stat64_statx ((struct stat64 *)buf, &tmp);
+# else
+      int rc = INLINE_SYSCALL (fstatat64, 4, fd, file, buf, flag);
 # endif
       return rc ?: stat_overflow (buf);
     }
diff --git a/sysdeps/unix/sysv/linux/generic/wordsize-32/lxstat.c b/sysdeps/unix/sysv/linux/generic/wordsize-32/lxstat.c
index bd02631d68cd..63fba924d14e 100644
--- a/sysdeps/unix/sysv/linux/generic/wordsize-32/lxstat.c
+++ b/sysdeps/unix/sysv/linux/generic/wordsize-32/lxstat.c
@@ -35,17 +35,17 @@ __lxstat (int vers, const char *name, struct stat *buf)
 {
   if (vers == _STAT_VER_KERNEL)
     {
-#ifdef __NR_fstatat64
-      int rc = INLINE_SYSCALL (fstatat64, 4, AT_FDCWD, name, buf,
-                               AT_SYMLINK_NOFOLLOW);
-#else
+# if defined(STAT64_IS_NOT_KERNEL_STAT64) || !defined(__NR_fstat64)
       struct statx tmp;
       int rc = INLINE_SYSCALL (statx, 5, AT_FDCWD, name,
                                AT_NO_AUTOMOUNT | AT_SYMLINK_NOFOLLOW,
                                STATX_BASIC_STATS, &tmp);
       if (rc == 0)
         __cp_stat64_statx ((struct stat64 *)buf, &tmp);
-#endif
+# else
+      int rc = INLINE_SYSCALL (fstatat64, 4, AT_FDCWD, name, buf,
+                               AT_SYMLINK_NOFOLLOW);
+# endif
       return rc ?: stat_overflow (buf);
     }
   errno = EINVAL;
diff --git a/sysdeps/unix/sysv/linux/generic/wordsize-32/lxstat64.c b/sysdeps/unix/sysv/linux/generic/wordsize-32/lxstat64.c
index 3eab0a184751..5f8361361e04 100644
--- a/sysdeps/unix/sysv/linux/generic/wordsize-32/lxstat64.c
+++ b/sysdeps/unix/sysv/linux/generic/wordsize-32/lxstat64.c
@@ -40,10 +40,7 @@ __lxstat64 (int vers, const char *name, struct stat64 *buf)
 {
   if (vers == _STAT_VER_KERNEL)
     {
-#ifdef __NR_fstatat64
-      return INLINE_SYSCALL (fstatat64, 4, AT_FDCWD, name, buf,
-                             AT_SYMLINK_NOFOLLOW);
-#else
+# if defined(STAT64_IS_NOT_KERNEL_STAT64) || !defined(__NR_fstat64)
       struct statx tmp;
       int rc = INLINE_SYSCALL (statx, 5, AT_FDCWD, name,
                                AT_NO_AUTOMOUNT | AT_SYMLINK_NOFOLLOW,
@@ -51,6 +48,9 @@ __lxstat64 (int vers, const char *name, struct stat64 *buf)
       if (rc == 0)
         __cp_stat64_statx (buf, &tmp);
       return rc;
+#else
+      return INLINE_SYSCALL (fstatat64, 4, AT_FDCWD, name, buf,
+                             AT_SYMLINK_NOFOLLOW);
 #endif
     }
 
diff --git a/sysdeps/unix/sysv/linux/generic/wordsize-32/xstat.c b/sysdeps/unix/sysv/linux/generic/wordsize-32/xstat.c
index a4a921c1ea6c..43b3e0b7b638 100644
--- a/sysdeps/unix/sysv/linux/generic/wordsize-32/xstat.c
+++ b/sysdeps/unix/sysv/linux/generic/wordsize-32/xstat.c
@@ -35,14 +35,14 @@ __xstat (int vers, const char *name, struct stat *buf)
 {
   if (vers == _STAT_VER_KERNEL)
     {
-# ifdef __NR_fstatat64
-      int rc = INLINE_SYSCALL (fstatat64, 4, AT_FDCWD, name, buf, 0);
-# else
+# if defined(STAT64_IS_NOT_KERNEL_STAT64) || !defined(__NR_fstat64)
       struct statx tmp;
       int rc = INLINE_SYSCALL (statx, 5, AT_FDCWD, name, AT_NO_AUTOMOUNT,
                                STATX_BASIC_STATS, &tmp);
       if (rc == 0)
         __cp_stat64_statx ((struct stat64 *)buf, &tmp);
+# else
+      int rc = INLINE_SYSCALL (fstatat64, 4, AT_FDCWD, name, buf, 0);
 # endif
       return rc ?: stat_overflow (buf);
     }
diff --git a/sysdeps/unix/sysv/linux/generic/wordsize-32/xstat64.c b/sysdeps/unix/sysv/linux/generic/wordsize-32/xstat64.c
index 0848b5a4b4b1..e999bd2ffad5 100644
--- a/sysdeps/unix/sysv/linux/generic/wordsize-32/xstat64.c
+++ b/sysdeps/unix/sysv/linux/generic/wordsize-32/xstat64.c
@@ -40,15 +40,15 @@ __xstat64 (int vers, const char *name, struct stat64 *buf)
 {
   if (vers == _STAT_VER_KERNEL)
     {
-#ifdef __NR_fstatat64
-      return INLINE_SYSCALL (fstatat64, 4, AT_FDCWD, name, buf, 0);
-#else
+# if defined(STAT64_IS_NOT_KERNEL_STAT64) || !defined(__NR_fstat64)
       struct statx tmp;
       int rc = INLINE_SYSCALL (statx, 5, AT_FDCWD, name, AT_NO_AUTOMOUNT,
                                STATX_BASIC_STATS, &tmp);
       if (rc == 0)
         __cp_stat64_statx (buf, &tmp);
       return rc;
+#else
+      return INLINE_SYSCALL (fstatat64, 4, AT_FDCWD, name, buf, 0);
 #endif
     }
   errno = EINVAL;
diff --git a/sysdeps/unix/sysv/linux/statx_cp.c b/sysdeps/unix/sysv/linux/statx_cp.c
index cc6e17929ea0..faba286d963c 100644
--- a/sysdeps/unix/sysv/linux/statx_cp.c
+++ b/sysdeps/unix/sysv/linux/statx_cp.c
@@ -22,7 +22,7 @@
 
 #include <statx_cp.h>
 
-#if !defined(__NR_fstat64) || !defined(__NR_fstatat64)
+#if !defined(__NR_fstat64) || !defined(__NR_fstatat64) || defined(STAT64_IS_NOT_KERNEL_STAT64)
 void
 __cp_stat64_statx (struct stat64 *to, struct statx *from)
 {
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
