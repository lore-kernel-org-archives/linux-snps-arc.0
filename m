Return-Path: <SRS0=2YWT=AV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562A4C433EA
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 23:38:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2638B20657
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 23:38:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oRFoHlyQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cn9JpcGE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2638B20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lzQn6Fwj6EKVnHGu81ccabTgEYUZVgYQyiffd8wZLKA=; b=oRFoHlyQJyytcACCIK9Drj7jf
	fG7X8A4HgJxmH7ocQ7AxkMIu3ohdRB0n++9kh5SXAe1CdvGT3DBFkUoAe0hG1sxNYty0jdl0SqT76
	DC9VcC6fsiRaCnyxdCbaaENfDPx6RmH80E7xfM8Sc9lGTyxxENY08vNhsxyHGhiofXceHRRgRzCz5
	k3c3nQaFhRdCTLIUaRKqc1jrNpYIsicgV4sbfvnKGmWWfpM8ILIZl5OZEbjkNO1GCQwxDUHtGqQ3S
	gYEW43BVv7F1Y/XZgf8tOrRIxzx86fqcu20V+PrZ4uDHiD1NAsN6d1vl4MySpL93VCpGvQ6YxTkRH
	fmU8twztw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ju2b8-0008FI-L0; Fri, 10 Jul 2020 23:38:30 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ju2aw-0008B5-FL
 for linux-snps-arc@lists.infradead.org; Fri, 10 Jul 2020 23:38:29 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C9513C04C0;
 Fri, 10 Jul 2020 23:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1594424297; bh=EW1NYd34WaTzq+fJ8ywDreu/4Zaa/TE+pF6yczS/YjA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cn9JpcGERveKnRTP6v7mQRxO+4T97xc9RlOqhdbjbwKyralra1SLmn0ufAca962Tt
 wLF5MIoiUzExhInPeOWi1dtCjhBWQcDhzYld9UVUkv7WQPHP+qVLuyIbNE317wtcWP
 iQk58ByzzmcC8B4tlVo8w2Ubiz096+oXJNDgvcWMSUmJWXF9nRnZcAI/AJwb9QrCne
 gskeXB1wG68ZxEklLOz2dVyXLGpJEeJOAoPsGKZvGZcYHiG7QXvERDgJ9IbOTrV6Ao
 YETd3dLV9NeddGl8DI4lqRivPS2/Bsle0IEvsveAvDHpaLl3pZsErE3CGWQ6qnLS2G
 kGbYP8/xbz6bg==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 7CA66A005A;
 Fri, 10 Jul 2020 23:38:17 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [COMMITTED 13/13] Documentation for ARC port
Date: Fri, 10 Jul 2020 16:38:10 -0700
Message-Id: <20200710233810.18720-13-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200710233810.18720-1-vgupta@synopsys.com>
References: <20200710233810.18720-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_193818_680403_E076387B 
X-CRM114-Status: GOOD (  11.49  )
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

(a) ABI doc:
    https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/wiki/files/ARCv2_ABI.pdf

(b) Programmer's Reference Manual (PRM) : needs a download request to be filled
    https://www.synopsys.com/dw/ipdir.php?ds=arc-hs44-hs46-hs48
    https://www.synopsys.com/dw/doc.php/ds/cc/programmers-reference-manual-ARC-HS.pdf

As of port merge (and Florian's patch to fix static TLS), glibc testsuite
(cross-test setup) has following failures:

FAIL: elf/tst-audit14
FAIL: elf/tst-audit15
FAIL: elf/tst-audit16
FAIL: elf/tst-ldconfig-ld_so_conf-update
FAIL: elf/tst-libc_dlvsym
FAIL: elf/tst-libc_dlvsym-static
FAIL: iconv/test-iconvconfig		# Needs gconv installed
FAIL: io/ftwtest			# Requires execution by non-root
FAIL: io/tst-lockf
FAIL: libio/tst-wfile-sync
FAIL: locale/tst-localedef-path-norm
FAIL: nptl/test-cond-printers		# needs Python3 and target GDB on target
FAIL: nptl/test-condattr-printers	#    ditto
FAIL: nptl/test-mutex-printers		#    ditto
FAIL: nptl/test-mutexattr-printers	#    ditto
FAIL: nptl/test-rwlock-printers		#    ditto
FAIL: nptl/test-rwlockattr-printers	#    ditto
FAIL: nptl/tst-umask1			# passes if run natively on target (NFS ACLv3 support needed)
FAIL: nss/bug-erange
FAIL: nss/tst-nss-files-hosts-getent
FAIL: nss/tst-nss-files-hosts-multi
FAIL: posix/bug-ga2
FAIL: posix/globtest			# require same user on target and host
FAIL: posix/tst-getaddrinfo5
FAIL: stdio-common/tst-vfprintf-width-prec
FAIL: stdio-common/tst-vfprintf-width-prec-alloc
FAIL: stdio-common/tst-vfprintf-width-prec-mem
FAIL: string/tst-strerror
FAIL: string/tst-strsignal
FAIL: sunrpc/bug20790			# missing cpp on target
FAIL: timezone/tst-tzset

Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
---
 NEWS                | 11 +++++++++++
 README              |  1 +
 manual/install.texi |  4 ++++
 3 files changed, 16 insertions(+)

diff --git a/NEWS b/NEWS
index 0b25b4fde99a..92dcb77fef07 100644
--- a/NEWS
+++ b/NEWS
@@ -15,6 +15,17 @@ Major new features:
 
 * New locale added: ckb_IQ (Kurdish/Sorani spoken in Iraq)
 
+* Support for Synopsys ARC HS cores (ARCv2 ISA) running Linux has been
+  added. This port requires at least binutils-2.32, gcc-8.3 and Linux-5.1.
+  Three ABIs are supported:
+
+     - arc-linux-gnu
+     - arc-linux-gnuhf
+     - arceb-linux-gnu
+
+  The arc* ABI is little-endian while arceb is big-endian. All ABIs use
+  64-bit time (y2038 safe) and 64-bit file offsets (LFS default).
+
 * The GNU C Library now loads audit modules listed in the DT_AUDIT and
   DT_DEPAUDIT dynamic section entries of the main executable.
 
diff --git a/README b/README
index 31c5da0405bd..903f07e4840a 100644
--- a/README
+++ b/README
@@ -24,6 +24,7 @@ The GNU C Library supports these configurations for using Linux kernels:
 
 	aarch64*-*-linux-gnu
 	alpha*-*-linux-gnu
+	arc*-*-linux-gnu
 	arm-*-linux-gnueabi
 	csky-*-linux-gnuabiv2
 	hppa-*-linux-gnu
diff --git a/manual/install.texi b/manual/install.texi
index ea0059a4ec98..735e99bb0356 100644
--- a/manual/install.texi
+++ b/manual/install.texi
@@ -512,6 +512,8 @@ Library with support for IEEE long double.
 @c powerpc64le performs an autoconf test to verify the compiler compiles with
 @c commands like "$CC -c foo.c -mabi=ibmlongdouble -mlong-double-128".
 
+For ARC architecture builds, GCC 8.3 or higher is needed.
+
 For multi-arch support it is recommended to use a GCC which has been built with
 support for GNU indirect functions.  This ensures that correct debugging
 information is generated for functions selected by IFUNC resolvers.  This
@@ -537,6 +539,8 @@ For PowerPC 64-bits little-endian (powerpc64le), @command{objcopy} is required
 to support @option{--update-section}.  This option requires binutils 2.26 or
 newer.
 
+ARC architecture needs @code{binutils} 2.32 or higher for TLS related fixes.
+
 @item
 GNU @code{texinfo} 4.7 or later
 
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
