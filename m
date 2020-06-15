Return-Path: <SRS0=fi28=74=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C9CC433E0
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Jun 2020 20:14:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FA4E20756
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Jun 2020 20:14:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s/CuWenU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Cs0AjRp1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FA4E20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CtFs0IYGaDOfFme88wUhbaAmRIjpCLXMbXm1TKsqNZ8=; b=s/CuWenU7jn/Rb
	QfbL4VOsJyKPuXkWwC1TCTyDcZfE7yxb0FoglJNPZz2g9velPsxqS1Y+xjr/f97OVUkwoTFzN/4Ky
	o0+vp/azrBkBIaroR6u3NReRJEQpdH+T6TodCWTxsD3kudJJgYVoGaYudxnHPV+HPHPToeeTIDPdW
	9IS+EORGcy46tYRNueaoDtmdSHnl+gkehfWKJPTo0q8xVoGtK1S7Dj3ExrHFhY63yREu75gjyxKi7
	pjH3hPwE7RkD9Hv4skz6Y3lSbCXg07M62bJfYEtH5C9WSOK8TZOgvLUBVYW6Uziypx4IK7F8ILsLS
	P9DQRgwBFyWxrZiyqtLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkvVO-0003cJ-BX; Mon, 15 Jun 2020 20:14:54 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkvVJ-0003YH-Hy
 for linux-snps-arc@lists.infradead.org; Mon, 15 Jun 2020 20:14:52 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2DD33C0BB7;
 Mon, 15 Jun 2020 20:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1592252089; bh=DUTY9CaNPuD1S0P7hddXHxm3szxZtnFeJ/tGCy+vSjo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cs0AjRp1O3iYZQzY58LUKBG1dQ5vl8IED++xRjXqoFuV3ODl8AgJwMzGLAQcUCknR
 j64sUWhaBejqgehF8Ek8uY9YblI0+S1c8IV7wCqKIK7da4D1FM0wrt/HWD3VnoCx9/
 C36RPqHv7JoUvCCpZhLP5adVjetHNrJA6OZq6NQcqYNuEBS+g1LQaHKVsrVc4k/D79
 yLbOAp6QN9EOJhgm9VpUGUXXOpXpILFQ0Z+WL5LfPVFfotV+Kc3FooxwDdiVB0WRLt
 zkCb6EKs2i8yj5AfUbPdAztpO0OhhGS4R/iIeLITmlxJCE1TUxJdpuGWw1ay6kV5Ea
 L0lejqmgETnRw==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id D04BEA00A1;
 Mon, 15 Jun 2020 20:14:48 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v7 13/13] Documentation for ARC port
Date: Mon, 15 Jun 2020 13:14:41 -0700
Message-Id: <20200615201441.31820-14-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200615201441.31820-1-vgupta@synopsys.com>
References: <20200615201441.31820-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_131449_627956_4B1E457C 
X-CRM114-Status: GOOD (  10.65  )
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
 NEWS                | 11 +++++++++++
 README              |  1 +
 manual/install.texi |  4 ++++
 3 files changed, 16 insertions(+)

diff --git a/NEWS b/NEWS
index a660fc59a89e..db65fea8b6ec 100644
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
index c1e49a94fed3..74cb90a91331 100644
--- a/manual/install.texi
+++ b/manual/install.texi
@@ -522,6 +522,8 @@ Library with support for IEEE long double.
 @c powerpc64le performs an autoconf test to verify the compiler compiles with
 @c commands like "$CC -c foo.c -mabi=ibmlongdouble -mlong-double-128".
 
+For ARC architecture builds, GCC 8.3 or higher is needed.
+
 For multi-arch support it is recommended to use a GCC which has been built with
 support for GNU indirect functions.  This ensures that correct debugging
 information is generated for functions selected by IFUNC resolvers.  This
@@ -547,6 +549,8 @@ For PowerPC 64-bits little-endian (powerpc64le), @command{objcopy} is required
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
