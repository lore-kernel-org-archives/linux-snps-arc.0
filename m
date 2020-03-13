Return-Path: <SRS0=tGlP=46=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7387CC5ACC0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Mar 2020 03:04:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ABED206E2
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Mar 2020 03:04:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bDBfN8I/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Bhgvv8xg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ABED206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=My0+PbZf3mU72/D9tIkblZ+N7fPAeEHZdVbsJe0srUg=; b=bDBfN8I/apT3JY
	kwwKvMJEkFILZQi7TDCGPkREVSWFmrwR4axHuMK4Kehm6ceUAV3jcIqHJpQwDwc9iykm6v5WYOyCF
	oqcq4Twd1BiOOZ3F4sDGmTVkVd8MYkd6ed0uOPOc9LjoMAREsRaEqfNmNzQSMmtDP17fahCxcMDKL
	DPLlDi4It84sorGZbNyDWf8sVCicqz+ntkTdc2cb6gNY1ipkVBagD2BBd9A5n0UeoX/IfTXtLlP2V
	+tE+PFLmpwZ41RB2mwEV6qMaUjQ3ysWB4Lzlc9eo7lh0byblhfhHpwop3FZfxd6zJv/h36To+P71m
	xB96kGjohbhEQa7x7XkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCacx-0003dK-C5; Fri, 13 Mar 2020 03:04:47 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCaci-0003UY-V6
 for linux-snps-arc@lists.infradead.org; Fri, 13 Mar 2020 03:04:44 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D3057402BA;
 Fri, 13 Mar 2020 03:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1584068672; bh=gVDbc1axTHLQtEamB0vjSXSfACe83sRo/ds47b/jZ8o=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bhgvv8xgdZyFqOyj9oK07Tik4UR/SCXrbAE+KPA/QMFOfiyNQ/c9ZyP2ADVYK3PhT
 o4aCNtapErqlHPvGeDOo/ERtfWMaS1l8C1fl+aW5cV6we8x4gtSTNI01oBAxGqvT0s
 uuVTNhrPQeE7twT1RUEeQ9earqAdMr3eIu3jHwSoCHoBg1kyHL8wLEKGFpqjrwbd5I
 PMStYQfZzou7btw6NJ+pRRUjYTj5R+Br1Z6apqO5Y4QCV56+kHvlsWHxSpY9BEefcG
 CLuGwNoEe8gXzkGu0YFfryF8ZxMm5QjkYQv2Vpz/GfoQIzgQmV3O9VQPXMFASl7kBZ
 fHumzu2rHimag==
Received: from vineetg-Latitude-E7450.internal.synopsys.com (unknown
 [10.13.182.230])
 by mailhost.synopsys.com (Postfix) with ESMTP id A5A4AA007C;
 Fri, 13 Mar 2020 03:04:32 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v4 15/15] Documentation for ARC port
Date: Thu, 12 Mar 2020 20:04:19 -0700
Message-Id: <20200313030419.15843-16-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200313030419.15843-1-vgupta@synopsys.com>
References: <20200313030419.15843-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_200433_007119_BFD245E2 
X-CRM114-Status: GOOD (  10.93  )
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
 NEWS                | 11 +++++++++++
 README              |  1 +
 manual/install.texi |  5 +++++
 3 files changed, 17 insertions(+)

diff --git a/NEWS b/NEWS
index b03681eb1462..fd1ef4f56429 100644
--- a/NEWS
+++ b/NEWS
@@ -17,6 +17,17 @@ Major new features:
     - rv32imafdc ilp32
     - rv32imafdc ilp32d
 
+* Support for ARC HS cores running Linux has been contributed by Synopsys.
+
+  Port requires atleast
+    - binutils-2.32 (binutils-2_31-branch: commit 6ce881c15fc4, 2018-10-04)
+    - gcc 8.3 (gcc-8-stable: commit 0d5ba57508c5, 2019-01-29)
+    - Linux kernel 5.1+
+
+  ISA: ARCv2
+  ABI: 32-bit, soft-float, LE: /lib/ld-linux-arc.so.2 (compatible with
+       hard-float builds)
+
 Deprecated and removed features, and other changes affecting compatibility:
 
   [Add deprecations, removals and changes affecting compatibility here]
diff --git a/README b/README
index cee86ab178cf..73b4f9f3c907 100644
--- a/README
+++ b/README
@@ -24,6 +24,7 @@ The GNU C Library supports these configurations for using Linux kernels:
 
 	aarch64*-*-linux-gnu
 	alpha*-*-linux-gnu
+	arc-*-linux-gnu
 	arm-*-linux-gnueabi
 	csky-*-linux-gnuabiv2
 	hppa-*-linux-gnu
diff --git a/manual/install.texi b/manual/install.texi
index 71bf47cac659..c4b11e4e7973 100644
--- a/manual/install.texi
+++ b/manual/install.texi
@@ -507,6 +507,9 @@ the newest version of the compiler that is known to work for building
 release time, GCC 9.2.1 is the newest compiler verified to work to build
 @theglibc{}.
 
+For ARC architecture builds, GCC 8.3 is needed which has the necessary
+fixes to support @theglibc{}.
+
 For multi-arch support it is recommended to use a GCC which has been built with
 support for GNU indirect functions.  This ensures that correct debugging
 information is generated for functions selected by IFUNC resolvers.  This
@@ -528,6 +531,8 @@ No other assembler or linker has the necessary functionality at the
 moment. As of release time, GNU @code{binutils} 2.32 is the newest
 verified to work to build @theglibc{}.
 
+ARC architecture needs @code{binutils} 2.32 for TLS related fixes.
+
 @item
 GNU @code{texinfo} 4.7 or later
 
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
