Return-Path: <SRS0=t4uf=4H=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A379C34031
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Feb 2020 01:29:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3A4E207FD
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Feb 2020 01:29:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gj1M0j5M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="CYydnk2J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3A4E207FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KdGxDZSbV8uMaGDYuGq09d78Nvna4JSJhelhv26w5Eg=; b=gj1M0j5MiLGsxi
	pGMoZry7oSMabUTbUpZNYRNhNEa6GYXrQdLjXgivlwemZjjsuJZzYrnCDCkPJsnP+5++2BB+sIkMI
	xwX+mZ7ieVuQ5UVGNFv7fh85cBMzCLwN3iRB3qiyuGGel7Sk6o+DJsq05X4laAaZ7QbmmmvOosqdw
	0nAeFEKf/FrrcSJ019iyWTz6+4MvfjBMsjVXOXNStGxYhZSMquLFNTcuUSi91CRwG9wbR1FP3ED5n
	vz53VLroww3If8tlFWZnpOUCkYWNcaUytNdYNPAnV8fi5FEQpaqlsKnXVB4U9qzWsorNstbE9wrM1
	/9NiT06wv22gCgCwfVfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4EB7-0005yY-Pw; Wed, 19 Feb 2020 01:29:29 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4EB3-0005y9-W7
 for linux-snps-arc@lists.infradead.org; Wed, 19 Feb 2020 01:29:27 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 91271402D3;
 Wed, 19 Feb 2020 01:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582075765; bh=ROuqdcoT9hPemkafa2hBtG6nk52QNbhHS8nAVU6mIJo=;
 h=From:To:Cc:Subject:Date:From;
 b=CYydnk2J1c9Dr6K5Wr1J5HYKHzxoudjCL4LqRuiWuzSXBX3tLi/w3CZQrRCfWCHxn
 JfG8WSu7xTAehDscOEh+10pAccJ89L85o/ie8CTOo6rsV2X/5qcUza4QWzJoezrxAi
 jOtexjHhDST9wc6mH6fmtGfhePJ8BEXNWvprRLb3oToJVPXrgQids7lUsg/wrTa1cN
 3hd7Qnqj9LU0SU5YUnRm4LaN1tDKrW/DA03dsm/j9lLWPfuhuDRvI7ycUf5MyEdby7
 Skenb13Mo1WXQZzc92KrFvGQOonIUSEDnqihD00+0K25qjnfMqNy84ruLyXq/P9JHa
 IBbZmYU5nfzuA==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.25])
 by mailhost.synopsys.com (Postfix) with ESMTP id E3C37A007C;
 Wed, 19 Feb 2020 01:29:18 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH] Remove STATFS_IS_STATFS64 conditional as it is zero in all
 ports
Date: Tue, 18 Feb 2020 17:29:21 -0800
Message-Id: <20200219012921.5075-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_172926_046366_796BA3FD 
X-CRM114-Status: GOOD (  10.76  )
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

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 sysdeps/unix/sysv/linux/alpha/kernel_stat.h       |  1 -
 sysdeps/unix/sysv/linux/fstatfs64.c               | 14 --------------
 sysdeps/unix/sysv/linux/generic/kernel_stat.h     |  2 --
 .../unix/sysv/linux/generic/wordsize-32/fstatfs.c |  2 --
 .../unix/sysv/linux/generic/wordsize-32/statfs.c  |  2 --
 sysdeps/unix/sysv/linux/hppa/kernel_stat.h        |  1 -
 sysdeps/unix/sysv/linux/ia64/kernel_stat.h        |  1 -
 sysdeps/unix/sysv/linux/kernel_stat.h             |  1 -
 sysdeps/unix/sysv/linux/microblaze/kernel_stat.h  |  1 -
 sysdeps/unix/sysv/linux/mips/kernel_stat.h        |  1 -
 .../sysv/linux/powerpc/powerpc32/kernel_stat.h    |  1 -
 .../sysv/linux/powerpc/powerpc64/kernel_stat.h    |  1 -
 .../unix/sysv/linux/s390/s390-64/kernel_stat.h    |  1 -
 .../unix/sysv/linux/sparc/sparc32/kernel_stat.h   |  1 -
 .../unix/sysv/linux/sparc/sparc64/kernel_stat.h   |  1 -
 sysdeps/unix/sysv/linux/statfs64.c                | 15 ---------------
 sysdeps/unix/sysv/linux/x86_64/kernel_stat.h      |  1 -
 17 files changed, 47 deletions(-)

diff --git a/sysdeps/unix/sysv/linux/alpha/kernel_stat.h b/sysdeps/unix/sysv/linux/alpha/kernel_stat.h
index d637e099cfe4..670841140765 100644
--- a/sysdeps/unix/sysv/linux/alpha/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/alpha/kernel_stat.h
@@ -86,4 +86,3 @@ struct glibc21_stat
   };
 
 #define XSTAT_IS_XSTAT64 1
-#define STATFS_IS_STATFS64 0
diff --git a/sysdeps/unix/sysv/linux/fstatfs64.c b/sysdeps/unix/sysv/linux/fstatfs64.c
index 9d22fa228fa5..4a339b548aa7 100644
--- a/sysdeps/unix/sysv/linux/fstatfs64.c
+++ b/sysdeps/unix/sysv/linux/fstatfs64.c
@@ -22,15 +22,6 @@
 #include <sysdep.h>
 #include <kernel_stat.h>
 
-/* Hide the prototypes for __fstatfs and fstatfs so that GCC will not
-   complain about the different function signatures if they are aliased
-   to  __fstat64.  If STATFS_IS_STATFS64 is not zero then the statfs and
-   statfs64 structures have an identical layout but different type names.  */
-
-#if STATFS_IS_STATFS64
-# define __fstatfs __fstatfs_disable
-# define fstatfs fstatfs_disable
-#endif
 #include <sys/statfs.h>
 
 #include <kernel-features.h>
@@ -85,8 +76,3 @@ weak_alias (__fstatfs64, fstatfs64)
 
 #undef __fstatfs
 #undef fstatfs
-
-#if STATFS_IS_STATFS64
-weak_alias (__fstatfs64, __fstatfs)
-weak_alias (__fstatfs64, fstatfs)
-#endif
diff --git a/sysdeps/unix/sysv/linux/generic/kernel_stat.h b/sysdeps/unix/sysv/linux/generic/kernel_stat.h
index 2eed3596c0ed..5a600f188320 100644
--- a/sysdeps/unix/sysv/linux/generic/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/generic/kernel_stat.h
@@ -26,5 +26,3 @@
 #else
 # define XSTAT_IS_XSTAT64 0
 #endif
-
-#define STATFS_IS_STATFS64 0
diff --git a/sysdeps/unix/sysv/linux/generic/wordsize-32/fstatfs.c b/sysdeps/unix/sysv/linux/generic/wordsize-32/fstatfs.c
index 93d9d94a0a61..bacc1543013a 100644
--- a/sysdeps/unix/sysv/linux/generic/wordsize-32/fstatfs.c
+++ b/sysdeps/unix/sysv/linux/generic/wordsize-32/fstatfs.c
@@ -21,7 +21,6 @@
 #include <kernel_stat.h>
 #include <stddef.h>
 
-#if !STATFS_IS_STATFS64
 #include "overflow.h"
 
 /* Return information about the filesystem on which FD resides.  */
@@ -32,4 +31,3 @@ __fstatfs (int fd, struct statfs *buf)
   return rc ?: statfs_overflow (buf);
 }
 weak_alias (__fstatfs, fstatfs)
-#endif
diff --git a/sysdeps/unix/sysv/linux/generic/wordsize-32/statfs.c b/sysdeps/unix/sysv/linux/generic/wordsize-32/statfs.c
index 7421501b4a40..a678e96058ce 100644
--- a/sysdeps/unix/sysv/linux/generic/wordsize-32/statfs.c
+++ b/sysdeps/unix/sysv/linux/generic/wordsize-32/statfs.c
@@ -21,7 +21,6 @@
 #include <kernel_stat.h>
 #include <stddef.h>
 
-#if !STATFS_IS_STATFS64
 #include "overflow.h"
 
 /* Return information about the filesystem on which FILE resides.  */
@@ -33,4 +32,3 @@ __statfs (const char *file, struct statfs *buf)
 }
 libc_hidden_def (__statfs)
 weak_alias (__statfs, statfs)
-#endif
diff --git a/sysdeps/unix/sysv/linux/hppa/kernel_stat.h b/sysdeps/unix/sysv/linux/hppa/kernel_stat.h
index a3ac53a1ef2f..9ffa3ba638ea 100644
--- a/sysdeps/unix/sysv/linux/hppa/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/hppa/kernel_stat.h
@@ -31,4 +31,3 @@ struct kernel_stat {
 #define _HAVE_STAT64_NSEC
 
 #define XSTAT_IS_XSTAT64 0
-#define STATFS_IS_STATFS64 0
diff --git a/sysdeps/unix/sysv/linux/ia64/kernel_stat.h b/sysdeps/unix/sysv/linux/ia64/kernel_stat.h
index b38bf741d37b..da8e2a91eff7 100644
--- a/sysdeps/unix/sysv/linux/ia64/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/ia64/kernel_stat.h
@@ -18,4 +18,3 @@
 
 #define STAT_IS_KERNEL_STAT 1
 #define XSTAT_IS_XSTAT64 1
-#define STATFS_IS_STATFS64 0
diff --git a/sysdeps/unix/sysv/linux/kernel_stat.h b/sysdeps/unix/sysv/linux/kernel_stat.h
index eecc962de390..4354d14f76e9 100644
--- a/sysdeps/unix/sysv/linux/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/kernel_stat.h
@@ -35,4 +35,3 @@ struct kernel_stat
 #define _HAVE_STAT64_NSEC
 
 #define XSTAT_IS_XSTAT64 0
-#define STATFS_IS_STATFS64 0
diff --git a/sysdeps/unix/sysv/linux/microblaze/kernel_stat.h b/sysdeps/unix/sysv/linux/microblaze/kernel_stat.h
index 765e0dca6763..159870d9d5a7 100644
--- a/sysdeps/unix/sysv/linux/microblaze/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/microblaze/kernel_stat.h
@@ -49,4 +49,3 @@ struct kernel_stat
 };
 
 #define XSTAT_IS_XSTAT64 0
-#define STATFS_IS_STATFS64 0
diff --git a/sysdeps/unix/sysv/linux/mips/kernel_stat.h b/sysdeps/unix/sysv/linux/mips/kernel_stat.h
index 388df1bfffec..a41d15f95cfa 100644
--- a/sysdeps/unix/sysv/linux/mips/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/mips/kernel_stat.h
@@ -57,4 +57,3 @@ struct kernel_stat
 #endif
 
 #define XSTAT_IS_XSTAT64 0
-#define STATFS_IS_STATFS64 0
diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc32/kernel_stat.h b/sysdeps/unix/sysv/linux/powerpc/powerpc32/kernel_stat.h
index c5948a4d3c1c..c28ad2dbc165 100644
--- a/sysdeps/unix/sysv/linux/powerpc/powerpc32/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/powerpc/powerpc32/kernel_stat.h
@@ -48,4 +48,3 @@ struct kernel_stat
 #define _HAVE_STAT64_NSEC
 
 #define XSTAT_IS_XSTAT64 0
-#define STATFS_IS_STATFS64 0
diff --git a/sysdeps/unix/sysv/linux/powerpc/powerpc64/kernel_stat.h b/sysdeps/unix/sysv/linux/powerpc/powerpc64/kernel_stat.h
index 5c10da3356f2..b764efe1a625 100644
--- a/sysdeps/unix/sysv/linux/powerpc/powerpc64/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/powerpc/powerpc64/kernel_stat.h
@@ -18,4 +18,3 @@
 
 #define STAT_IS_KERNEL_STAT 1
 #define XSTAT_IS_XSTAT64 1
-#define STATFS_IS_STATFS64 0
diff --git a/sysdeps/unix/sysv/linux/s390/s390-64/kernel_stat.h b/sysdeps/unix/sysv/linux/s390/s390-64/kernel_stat.h
index b38bf741d37b..da8e2a91eff7 100644
--- a/sysdeps/unix/sysv/linux/s390/s390-64/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/s390/s390-64/kernel_stat.h
@@ -18,4 +18,3 @@
 
 #define STAT_IS_KERNEL_STAT 1
 #define XSTAT_IS_XSTAT64 1
-#define STATFS_IS_STATFS64 0
diff --git a/sysdeps/unix/sysv/linux/sparc/sparc32/kernel_stat.h b/sysdeps/unix/sysv/linux/sparc/sparc32/kernel_stat.h
index a4416009f1bc..eb6023692955 100644
--- a/sysdeps/unix/sysv/linux/sparc/sparc32/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/sparc/sparc32/kernel_stat.h
@@ -32,4 +32,3 @@ struct kernel_stat
 #define _HAVE_STAT64_NSEC
 
 #define XSTAT_IS_XSTAT64 0
-#define STATFS_IS_STATFS64 0
diff --git a/sysdeps/unix/sysv/linux/sparc/sparc64/kernel_stat.h b/sysdeps/unix/sysv/linux/sparc/sparc64/kernel_stat.h
index 30afb553b9b8..2a26a78d9c19 100644
--- a/sysdeps/unix/sysv/linux/sparc/sparc64/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/sparc/sparc64/kernel_stat.h
@@ -45,4 +45,3 @@ struct kernel_stat64
   };
 
 #define XSTAT_IS_XSTAT64 1
-#define STATFS_IS_STATFS64 0
diff --git a/sysdeps/unix/sysv/linux/statfs64.c b/sysdeps/unix/sysv/linux/statfs64.c
index c9411286375b..153654ac318f 100644
--- a/sysdeps/unix/sysv/linux/statfs64.c
+++ b/sysdeps/unix/sysv/linux/statfs64.c
@@ -22,15 +22,6 @@
 #include <sysdep.h>
 #include <kernel_stat.h>
 
-/* Hide the prototypes for __statfs and statfs so that GCC will not
-   complain about the different function signatures if they are aliased
-   to  __stat64.  If STATFS_IS_STATFS64 is not zero then the statfs and
-   statfs64 structures have an identical layout but different type names.  */
-
-#if STATFS_IS_STATFS64
-# define __statfs __statfs_disable
-# define statfs statfs_disable
-#endif
 #include <sys/statfs.h>
 
 #include <kernel-features.h>
@@ -87,9 +78,3 @@ weak_alias (__statfs64, statfs64)
 
 #undef __statfs
 #undef statfs
-
-#if STATFS_IS_STATFS64
-weak_alias (__statfs64, __statfs)
-weak_alias (__statfs64, statfs)
-libc_hidden_ver (__statfs64, __statfs)
-#endif
diff --git a/sysdeps/unix/sysv/linux/x86_64/kernel_stat.h b/sysdeps/unix/sysv/linux/x86_64/kernel_stat.h
index b38bf741d37b..da8e2a91eff7 100644
--- a/sysdeps/unix/sysv/linux/x86_64/kernel_stat.h
+++ b/sysdeps/unix/sysv/linux/x86_64/kernel_stat.h
@@ -18,4 +18,3 @@
 
 #define STAT_IS_KERNEL_STAT 1
 #define XSTAT_IS_XSTAT64 1
-#define STATFS_IS_STATFS64 0
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
