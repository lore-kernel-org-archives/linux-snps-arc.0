Return-Path: <SRS0=AhAi=4N=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E76FC35DEA
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Feb 2020 00:29:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02BD2218AC
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Feb 2020 00:29:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rb82dABE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TAh99eiI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02BD2218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VfSNRRrAJp7dtxJYBpOHhYJK6Cr3mPZ8Nzng8PJsHmo=; b=rb82dABEQdpGJG
	yNHElY6yliPKGfa0sCj1DO5fQKCfsZsJ7hksG3kPTgpcMf6j5wrRuN3oypK6PDx6dgehXPoNoSF37
	zBqk3XahvJ5nV78gqcP2u3simMvG5+gc/ZJLE9XKlj3BEcmrU5lWD+TPinrwy9GN47RpNbklKnBaL
	+C9R0ET148GYbXUr/I5y20C9fEnXMcBkuu6bOA8PpOfvTIC133TvOcWEtQr9uXof2lyhfJJA/NqAy
	b6SoZJ22I6wyjXBDYXeO8AenJvaqgwzbFrMaf4SB89jNvw64ozlWAkLVVUgqt8EkSTPcPXT0jDmu8
	myeTsq883yOAKX0HsDeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6O6m-0005V6-RA; Tue, 25 Feb 2020 00:29:56 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6O6j-0005Ui-66
 for linux-snps-arc@lists.infradead.org; Tue, 25 Feb 2020 00:29:55 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 568CA404FD;
 Tue, 25 Feb 2020 00:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582590588; bh=gI26HNliZzzDD8L/GTxc74ZYbGsFwwl26MpwYjRyiTI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TAh99eiIhYLLJjLytbnaqU842NLIj/bCTU0DU30xWBnkOWMDO4MAxPtZBSqg/fKAT
 c9sK6oRcuR0TGtkM4f4SLxOu+s/azc6jKQIfpVeSrmewhH/ksh6NAW01hnI2YRBpve
 GGmtrvc4eKCJ7pdcvBLSYHp2tijcQcPjWp0TW2XmdzTjt34xV1NKW7quN1MNSF73RL
 4O8+FoXirgLSsSKSuiMxzYautLQt7hxsWo+P1ID6DlCi1wLGkwSRaPhxCUn8vJHRhg
 XMFrF4P4tsOp8Sy1iM9k4AJFr5YqNA70t4ZK1rGJjq5Lr3Iwr5P0TN9wv5lxcxuOLk
 +MdQIjhXBwNcg==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.26])
 by mailhost.synopsys.com (Postfix) with ESMTP id C3601A028B;
 Tue, 25 Feb 2020 00:29:42 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v3] asm-generic ABI: Allow statx syscall despite fstatat64,
 fstat64
Date: Mon, 24 Feb 2020 16:29:41 -0800
Message-Id: <20200225002941.20951-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <alpine.DEB.2.21.2002250008160.23654@digraph.polyomino.org.uk>
References: <alpine.DEB.2.21.2002250008160.23654@digraph.polyomino.org.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_162953_239329_C5667B04 
X-CRM114-Status: GOOD (  14.26  )
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
 linux-snps-arc@lists.infradead.org, alistair.francis@wdc.com
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
Changes since v2
  * Fixup coding style for #if and defined
Changes since v1
  * make the toggle #if style rather than #ifdef style
  * define to 0 in all arches which don't use it
---
 sysdeps/unix/sysv/linux/alpha/kernel_stat.h            |  1 +
 sysdeps/unix/sysv/linux/fxstat64.c                     |  6 +++---
 sysdeps/unix/sysv/linux/fxstatat64.c                   |  6 +++---
 sysdeps/unix/sysv/linux/generic/kernel_stat.h          |  7 +++++++
 sysdeps/unix/sysv/linux/generic/wordsize-32/fxstat.c   |  6 +++---
 sysdeps/unix/sysv/linux/generic/wordsize-32/fxstatat.c |  6 +++---
 sysdeps/unix/sysv/linux/generic/wordsize-32/lxstat.c   | 10 +++++-----
 sysdeps/unix/sysv/linux/generic/wordsize-32/lxstat64.c |  8 ++++----
 sysdeps/unix/sysv/linux/generic/wordsize-32/xstat.c    |  6 +++---
 sysdeps/unix/sysv/linux/generic/wordsize-32/xstat64.c  |  6 +++---
 sysdeps/unix/sysv/linux/hppa/kernel_stat.h             |  1 +
 sysdeps/unix/sysv/linux/ia64/kernel_stat.h             |  1 +
 sysdeps/unix/sysv/linux/kernel_stat.h                  |  1 +
 sysdeps/unix/sysv/linux/microblaze/kernel_stat.h       |  1 +
 sysdeps/unix/sysv/linux/mips/kernel_stat.h             |  1 +
 .../unix/sysv/linux/powerpc/powerpc32/kernel_stat.h    |  1 +
 .../unix/sysv/linux/powerpc/powerpc64/kernel_stat.h    |  1 +
 sysdeps/unix/sysv/linux/s390/s390-64/kernel_stat.h     |  1 +
 sysdeps/unix/sysv/linux/sparc/sparc32/kernel_stat.h    |  1 +
 sysdeps/unix/sysv/linux/sparc/sparc64/kernel_stat.h    |  1 +
 sysdeps/unix/sysv/linux/statx_cp.c                     |  2 +-
 sysdeps/unix/sysv/linux/x86_64/kernel_stat.h           |  1 +
 22 files changed, 47 insertions(+), 28 deletions(-)

diff --git a/sysdeps/unix/sysv/linux/alpha/kernel_stat.h b/sysdeps/unix/sysv/linux/alpha/kernel_stat.h
index d637e099cfe4..437b56098ecd 100644
--- a/sysdeps/unix/sysv/linux/alpha/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/alpha/kernel_stat.h
@@ -87,3 +87,4 @@ struct glibc21_stat
 
 #define XSTAT_IS_XSTAT64 1
 #define STATFS_IS_STATFS64 0
+#define STAT64_IS_NOT_KERNEL_STAT64 0
diff --git a/sysdeps/unix/sysv/linux/fxstat64.c b/sysdeps/unix/sysv/linux/fxstat64.c
index 9133a0a29b8e..dc0edec4bd8e 100644
--- a/sysdeps/unix/sysv/linux/fxstat64.c
+++ b/sysdeps/unix/sysv/linux/fxstat64.c
@@ -33,14 +33,14 @@ int
 ___fxstat64 (int vers, int fd, struct stat64 *buf)
 {
   int result;
-#ifdef __NR_fstat64
-  result = INLINE_SYSCALL (fstat64, 2, fd, buf);
-#else
+#if STAT64_IS_NOT_KERNEL_STAT64 || !defined (__NR_fstat64)
   struct statx tmp;
   result = INLINE_SYSCALL (statx, 5, fd, "", AT_EMPTY_PATH, STATX_BASIC_STATS,
                            &tmp);
   if (result == 0)
     __cp_stat64_statx (buf, &tmp);
+#else
+  result = INLINE_SYSCALL (fstat64, 2, fd, buf);
 #endif
   return result;
 }
diff --git a/sysdeps/unix/sysv/linux/fxstatat64.c b/sysdeps/unix/sysv/linux/fxstatat64.c
index e24b456604ff..393b2b8ef87f 100644
--- a/sysdeps/unix/sysv/linux/fxstatat64.c
+++ b/sysdeps/unix/sysv/linux/fxstatat64.c
@@ -38,15 +38,15 @@ __fxstatat64 (int vers, int fd, const char *file, struct stat64 *st, int flag)
 
   int result;
 
-#ifdef __NR_fstatat64
-  result = INTERNAL_SYSCALL_CALL (fstatat64, fd, file, st, flag);
-#else
+#if STAT64_IS_NOT_KERNEL_STAT64 || !defined (__NR_fstatat64)
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
index 2eed3596c0ed..fb97832f213f 100644
--- a/sysdeps/unix/sysv/linux/generic/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/generic/kernel_stat.h
@@ -28,3 +28,10 @@
 #endif
 
 #define STATFS_IS_STATFS64 0
+
+/* Allows asm-generic ABI ports with fstat64 syscall to use statx syscall for
+   implement stat* wrappers. This is needed when glibc stat64 is not compatible
+   with kernel stat64 (due to 64-bit time_t). By default it is off unless
+   arch opts-in.  */
+
+#define STAT64_IS_NOT_KERNEL_STAT64 0
diff --git a/sysdeps/unix/sysv/linux/generic/wordsize-32/fxstat.c b/sysdeps/unix/sysv/linux/generic/wordsize-32/fxstat.c
index 850450e1e8a1..b20956049a01 100644
--- a/sysdeps/unix/sysv/linux/generic/wordsize-32/fxstat.c
+++ b/sysdeps/unix/sysv/linux/generic/wordsize-32/fxstat.c
@@ -36,14 +36,14 @@ __fxstat (int vers, int fd, struct stat *buf)
 {
   if (vers == _STAT_VER_KERNEL)
     {
-# ifdef __NR_fstat64
-      int rc = INLINE_SYSCALL (fstat64, 2, fd, buf);
-# else
+# if STAT64_IS_NOT_KERNEL_STAT64 || !defined (__NR_fstat64)
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
index 8df65ebea084..3a1d01618225 100644
--- a/sysdeps/unix/sysv/linux/generic/wordsize-32/fxstatat.c
+++ b/sysdeps/unix/sysv/linux/generic/wordsize-32/fxstatat.c
@@ -36,15 +36,15 @@ __fxstatat (int vers, int fd, const char *file, struct stat *buf, int flag)
 {
   if (vers == _STAT_VER_KERNEL)
     {
-# ifdef __NR_fstatat64
-      int rc = INLINE_SYSCALL (fstatat64, 4, fd, file, buf, flag);
-# else
+# if STAT64_IS_NOT_KERNEL_STAT64 || !defined (__NR_fstat64)
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
index bd02631d68cd..ccd8816fac51 100644
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
+# if STAT64_IS_NOT_KERNEL_STAT64 || !defined (__NR_fstat64)
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
index 3eab0a184751..152cbf1d126b 100644
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
+#if STAT64_IS_NOT_KERNEL_STAT64 || !defined (__NR_fstat64)
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
index a4a921c1ea6c..054ceeb79d5d 100644
--- a/sysdeps/unix/sysv/linux/generic/wordsize-32/xstat.c
+++ b/sysdeps/unix/sysv/linux/generic/wordsize-32/xstat.c
@@ -35,14 +35,14 @@ __xstat (int vers, const char *name, struct stat *buf)
 {
   if (vers == _STAT_VER_KERNEL)
     {
-# ifdef __NR_fstatat64
-      int rc = INLINE_SYSCALL (fstatat64, 4, AT_FDCWD, name, buf, 0);
-# else
+# if STAT64_IS_NOT_KERNEL_STAT64 || !defined (__NR_fstat64)
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
index 0848b5a4b4b1..1c5e9610a1a8 100644
--- a/sysdeps/unix/sysv/linux/generic/wordsize-32/xstat64.c
+++ b/sysdeps/unix/sysv/linux/generic/wordsize-32/xstat64.c
@@ -40,15 +40,15 @@ __xstat64 (int vers, const char *name, struct stat64 *buf)
 {
   if (vers == _STAT_VER_KERNEL)
     {
-#ifdef __NR_fstatat64
-      return INLINE_SYSCALL (fstatat64, 4, AT_FDCWD, name, buf, 0);
-#else
+#if STAT64_IS_NOT_KERNEL_STAT64 || !defined (__NR_fstat64)
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
diff --git a/sysdeps/unix/sysv/linux/hppa/kernel_stat.h b/sysdeps/unix/sysv/linux/hppa/kernel_stat.h
index a3ac53a1ef2f..93802c4257c0 100644
--- a/sysdeps/unix/sysv/linux/hppa/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/hppa/kernel_stat.h
@@ -32,3 +32,4 @@ struct kernel_stat {
 
 #define XSTAT_IS_XSTAT64 0
 #define STATFS_IS_STATFS64 0
+#define STAT64_IS_NOT_KERNEL_STAT64 0
diff --git a/sysdeps/unix/sysv/linux/ia64/kernel_stat.h b/sysdeps/unix/sysv/linux/ia64/kernel_stat.h
index b38bf741d37b..6965d95e9529 100644
--- a/sysdeps/unix/sysv/linux/ia64/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/ia64/kernel_stat.h
@@ -19,3 +19,4 @@
 #define STAT_IS_KERNEL_STAT 1
 #define XSTAT_IS_XSTAT64 1
 #define STATFS_IS_STATFS64 0
+#define STAT64_IS_NOT_KERNEL_STAT64 0
diff --git a/sysdeps/unix/sysv/linux/kernel_stat.h b/sysdeps/unix/sysv/linux/kernel_stat.h
index eecc962de390..3ff0882c51a2 100644
--- a/sysdeps/unix/sysv/linux/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/kernel_stat.h
@@ -36,3 +36,4 @@ struct kernel_stat
 
 #define XSTAT_IS_XSTAT64 0
 #define STATFS_IS_STATFS64 0
+#define STAT64_IS_NOT_KERNEL_STAT64 0
diff --git a/sysdeps/unix/sysv/linux/microblaze/kernel_stat.h b/sysdeps/unix/sysv/linux/microblaze/kernel_stat.h
index 765e0dca6763..64d4b11ee6da 100644
--- a/sysdeps/unix/sysv/linux/microblaze/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/microblaze/kernel_stat.h
@@ -50,3 +50,4 @@ struct kernel_stat
 
 #define XSTAT_IS_XSTAT64 0
 #define STATFS_IS_STATFS64 0
+#define STAT64_IS_NOT_KERNEL_STAT64 0
diff --git a/sysdeps/unix/sysv/linux/mips/kernel_stat.h b/sysdeps/unix/sysv/linux/mips/kernel_stat.h
index 388df1bfffec..fd221c632fac 100644
--- a/sysdeps/unix/sysv/linux/mips/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/mips/kernel_stat.h
@@ -58,3 +58,4 @@ struct kernel_stat
 
 #define XSTAT_IS_XSTAT64 0
 #define STATFS_IS_STATFS64 0
+#define STAT64_IS_NOT_KERNEL_STAT64 0
diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc32/kernel_stat.h b/sysdeps/unix/sysv/linux/powerpc/powerpc32/kernel_stat.h
index c5948a4d3c1c..4e389cb2ff80 100644
--- a/sysdeps/unix/sysv/linux/powerpc/powerpc32/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/powerpc/powerpc32/kernel_stat.h
@@ -49,3 +49,4 @@ struct kernel_stat
 
 #define XSTAT_IS_XSTAT64 0
 #define STATFS_IS_STATFS64 0
+#define STAT64_IS_NOT_KERNEL_STAT64 0
diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc64/kernel_stat.h b/sysdeps/unix/sysv/linux/powerpc/powerpc64/kernel_stat.h
index 5c10da3356f2..b48dbc15227d 100644
--- a/sysdeps/unix/sysv/linux/powerpc/powerpc64/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/powerpc/powerpc64/kernel_stat.h
@@ -19,3 +19,4 @@
 #define STAT_IS_KERNEL_STAT 1
 #define XSTAT_IS_XSTAT64 1
 #define STATFS_IS_STATFS64 0
+#define STAT64_IS_NOT_KERNEL_STAT64 0
diff --git a/sysdeps/unix/sysv/linux/s390/s390-64/kernel_stat.h b/sysdeps/unix/sysv/linux/s390/s390-64/kernel_stat.h
index b38bf741d37b..6965d95e9529 100644
--- a/sysdeps/unix/sysv/linux/s390/s390-64/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/s390/s390-64/kernel_stat.h
@@ -19,3 +19,4 @@
 #define STAT_IS_KERNEL_STAT 1
 #define XSTAT_IS_XSTAT64 1
 #define STATFS_IS_STATFS64 0
+#define STAT64_IS_NOT_KERNEL_STAT64 0
diff --git a/sysdeps/unix/sysv/linux/sparc/sparc32/kernel_stat.h b/sysdeps/unix/sysv/linux/sparc/sparc32/kernel_stat.h
index a4416009f1bc..17ac63b753e5 100644
--- a/sysdeps/unix/sysv/linux/sparc/sparc32/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/sparc/sparc32/kernel_stat.h
@@ -33,3 +33,4 @@ struct kernel_stat
 
 #define XSTAT_IS_XSTAT64 0
 #define STATFS_IS_STATFS64 0
+#define STAT64_IS_NOT_KERNEL_STAT64 0
diff --git a/sysdeps/unix/sysv/linux/sparc/sparc64/kernel_stat.h b/sysdeps/unix/sysv/linux/sparc/sparc64/kernel_stat.h
index 30afb553b9b8..4912a98529a4 100644
--- a/sysdeps/unix/sysv/linux/sparc/sparc64/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/sparc/sparc64/kernel_stat.h
@@ -46,3 +46,4 @@ struct kernel_stat64
 
 #define XSTAT_IS_XSTAT64 1
 #define STATFS_IS_STATFS64 0
+#define STAT64_IS_NOT_KERNEL_STAT64 0
diff --git a/sysdeps/unix/sysv/linux/statx_cp.c b/sysdeps/unix/sysv/linux/statx_cp.c
index cc6e17929ea0..2e43d46f4f99 100644
--- a/sysdeps/unix/sysv/linux/statx_cp.c
+++ b/sysdeps/unix/sysv/linux/statx_cp.c
@@ -22,7 +22,7 @@
 
 #include <statx_cp.h>
 
-#if !defined(__NR_fstat64) || !defined(__NR_fstatat64)
+#if !defined (__NR_fstat64) || !defined (__NR_fstatat64) || STAT64_IS_NOT_KERNEL_STAT64
 void
 __cp_stat64_statx (struct stat64 *to, struct statx *from)
 {
diff --git a/sysdeps/unix/sysv/linux/x86_64/kernel_stat.h b/sysdeps/unix/sysv/linux/x86_64/kernel_stat.h
index b38bf741d37b..6965d95e9529 100644
--- a/sysdeps/unix/sysv/linux/x86_64/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/x86_64/kernel_stat.h
@@ -19,3 +19,4 @@
 #define STAT_IS_KERNEL_STAT 1
 #define XSTAT_IS_XSTAT64 1
 #define STATFS_IS_STATFS64 0
+#define STAT64_IS_NOT_KERNEL_STAT64 0
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
