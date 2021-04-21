Return-Path: <SRS0=2K9J=JS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF913C433ED
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Apr 2021 19:51:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 498C060FDB
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Apr 2021 19:51:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 498C060FDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3aXUH8J/d3i1bDw/hYXNeYYk3/WrVZBFRz7LcPJ3yC8=; b=olFN2UkWWrEQCI9/5TF/vE80AI
	rG9xJX6OTtvJODQgvUcS5/J2oCUbUMdHT1LWz2X8fxjG1KYY6Z50hzHNRSHBQRkzc6qU6Czn/BJHL
	m+QKptCpoLsrW/RWBS7LXiB9m7wlrJoYnFiGb42yWKFKGJUPK1eisdu5UoFrZnyOidzGscHo4PNbH
	su7GnFv4pONXWU4piomGBVy78txUA0bADAyrbIe1n4PXGbFog6rxVlP3DRgzdkeV2qiwxfGZ7N1Ha
	bkKZ48Jj2Rhm0uG7n/xxkWH8UKx9ErE6kGlsk7E7mgEbpOs5GoXtrjLT10ASN0jQI3dFkQN9SoaSW
	UMA7bo8g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZIsp-00F3yg-AZ; Wed, 21 Apr 2021 19:51:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZIsj-00F3yA-Q9
 for linux-snps-arc@desiato.infradead.org; Wed, 21 Apr 2021 19:51:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Z2PxemYaBJMUvYQygsq5eAy/m4HDJtFVAYGhqy/x+fg=; b=QqlEHVmgyUl9bsFRY84iS3NqKe
 rjnGkjor0LSx+kavDtLKtr75DiGzPogIyjRcOJ+69l+ejHy/W5MwjLO47D/IyN0EZPreFzUGkfDGA
 xqmBbX/l4TilfUYLmRuID91wTuQsoFwKSR+bKX155yQ0YPKrqo8EbnfSxVZnVAJg+SsuaQ0f++Znt
 1Ks/Alrek69V3d9hy4TAhkzHymM/YzKAkgG2f9B/MN91P6EBGo2NUGf05VRSA5keyo5Gcd9CpHA92
 2fSorNoEiLpGPgTBUJi1ocuA4qkkaouqwqccSH1AElhoLpKsblztaKcpNFdt+UZmwL1L+g2idMNTr
 3kovCveQ==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZIse-00D9My-Sr
 for linux-snps-arc@lists.infradead.org; Wed, 21 Apr 2021 19:51:28 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 70C6E40396;
 Wed, 21 Apr 2021 19:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1619034681; bh=SnAVhq7McN5M7bQirJp6dNKBhH8nLbc+4X6VGah6fJ4=;
 h=From:To:Cc:Subject:Date:From;
 b=e+mvBVgSOxnWwZDxTVe2ooEpAmwEGc4aYv+fSoxoUHFBUcr4eR9n2A2N9P78Hby8/
 PXoj77Y4BdZ1n6M4QzBWVzo7wDA4HxdXYIOy4+1Xj14YuKa1D457w7S0ryCkFSg28M
 1MIsift1fCeROjuD5A/lPts2ZXW22tFW5xVLBiIdqtXCA6cvs57DzsQmIXlaQMF4c7
 RsBXfhLIT0TSsBT0tS6ER/+p0FeR9nUnB1m3Zoqw5VKmqH3tVGDU27IznwdKzzzblD
 lMtn9d0nb7gMPXxSGX342LhwF42sUKSGhG8hrOxp7MbiyU+x/OJO+Osz6I2DkAr6ol
 pTFZGeD9nsBZA==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 15E28A007C;
 Wed, 21 Apr 2021 19:51:19 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: config-patches@gnu.org
Cc: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH] Recognize arc64
Date: Wed, 21 Apr 2021 12:51:18 -0700
Message-Id: <20210421195118.158464-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_125124_962993_FD178B10 
X-CRM114-Status: GOOD (  13.65  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This paves way for setting up arc64 software ecosystem.

$ make check
cd testsuite && bash config-guess.sh && rm uname
PASS: config.guess checks (135 tests)
cd testsuite && bash config-sub.sh
PASS: config.sub checks (852 tests)
PASS: config.sub idempotency checks (789 tests)
PASS: config.sub canonicalise each config.guess testcase (135 tests)

* config.guess (arc64:Linux:*:*): Recognize.
* config.sub (arc64): Likewise.
* doc/config.guess.1: Regenerate.
* doc/config.sub.1: Likewise.
* testsuite/config-guess.data: Add test cases for arc64.
* testsuite/config-sub.data (arc64, arc*-elf): Add test cases.

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 config.guess                | 4 ++--
 config.sub                  | 4 ++--
 doc/config.guess.1          | 2 +-
 doc/config.sub.1            | 2 +-
 testsuite/config-guess.data | 1 +
 testsuite/config-sub.data   | 5 +++++
 6 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/config.guess b/config.guess
index 1972fda8eb05..a6646ed28258 100755
--- a/config.guess
+++ b/config.guess
@@ -2,7 +2,7 @@
 # Attempt to guess a canonical system name.
 #   Copyright 1992-2021 Free Software Foundation, Inc.
 
-timestamp='2021-01-25'
+timestamp='2021-04-21'
 
 # This file is free software; you can redistribute it and/or modify it
 # under the terms of the GNU General Public License as published by
@@ -949,7 +949,7 @@ EOF
 	if test "$?" = 0 ; then LIBC=gnulibc1 ; fi
 	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
 	exit ;;
-    arc:Linux:*:* | arceb:Linux:*:*)
+    arc:Linux:*:* | arceb:Linux:*:* | arc64:Linux:*:*)
 	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
 	exit ;;
     arm*:Linux:*:*)
diff --git a/config.sub b/config.sub
index 7f7d0b055ac5..d70247c08d12 100755
--- a/config.sub
+++ b/config.sub
@@ -2,7 +2,7 @@
 # Configuration validation subroutine script.
 #   Copyright 1992-2021 Free Software Foundation, Inc.
 
-timestamp='2021-03-10'
+timestamp='2021-04-21'
 
 # This file is free software; you can redistribute it and/or modify it
 # under the terms of the GNU General Public License as published by
@@ -1165,7 +1165,7 @@ case $cpu-$vendor in
 			| alphapca5[67] | alpha64pca5[67] \
 			| am33_2.0 \
 			| amdgcn \
-			| arc | arceb \
+			| arc | arceb | arc64 \
 			| arm | arm[lb]e | arme[lb] | armv* \
 			| avr | avr32 \
 			| asmjs \
diff --git a/doc/config.guess.1 b/doc/config.guess.1
index 75fbb236fd68..f79f1c5f10c5 100644
--- a/doc/config.guess.1
+++ b/doc/config.guess.1
@@ -1,5 +1,5 @@
 .\" DO NOT MODIFY THIS FILE!  It was generated by help2man 1.47.16.
-.TH CONFIG.GUESS "1" "January 2021" "GNU config.guess (2021-01-25)" "User Commands"
+.TH CONFIG.GUESS "1" "January 2021" "GNU config.guess (2021-04-21)" "User Commands"
 .SH NAME
 config.guess \- guess the build system triplet
 .SH SYNOPSIS
diff --git a/doc/config.sub.1 b/doc/config.sub.1
index 317c8c47a180..9d52cebf58d0 100644
--- a/doc/config.sub.1
+++ b/doc/config.sub.1
@@ -1,5 +1,5 @@
 .\" DO NOT MODIFY THIS FILE!  It was generated by help2man 1.47.16.
-.TH CONFIG.SUB "1" "March 2021" "GNU config.sub (2021-03-10)" "User Commands"
+.TH CONFIG.SUB "1" "March 2021" "GNU config.sub (2021-04-21)" "User Commands"
 .SH NAME
 config.sub \- validate and canonicalize a configuration triplet
 .SH SYNOPSIS
diff --git a/testsuite/config-guess.data b/testsuite/config-guess.data
index f240e9ce61df..73908abb4e06 100644
--- a/testsuite/config-guess.data
+++ b/testsuite/config-guess.data
@@ -35,6 +35,7 @@ amd64 | 7.0_RC1 | NetBSD | ignored | x86_64 | x86_64-unknown-netbsd7.0
 amd64 | 7.2.1 | Isilon OneFS | ignored | ignored | x86_64-unknown-onefs
 arc | ignored | Linux | ignored | ignored | arc-unknown-linux-gnu
 arceb | ignored | Linux | ignored | ignored | arceb-unknown-linux-gnu
+arc64 | ignored | Linux | ignored | ignored | arc64-unknown-linux-gnu
 arm | 12.0 | FreeBSD | ignored | armv6 | armv6-unknown-freebsd12.0-gnueabihf
 arm | 12.0 | FreeBSD | ignored | armv7 | armv7-unknown-freebsd12.0-gnueabihf
 arm | 12.1 | AROS | ignored | armv7 | arm-unknown-aros
diff --git a/testsuite/config-sub.data b/testsuite/config-sub.data
index 101a4c45ec39..0a59eaf1cec7 100644
--- a/testsuite/config-sub.data
+++ b/testsuite/config-sub.data
@@ -59,9 +59,14 @@ amix						m68k-unknown-sysv4
 apollo68					m68k-apollo-sysv
 apollo68bsd					m68k-apollo-bsd
 arc						arc-unknown-none
+arc-elf						arc-unknown-elf
 arc-linux					arc-unknown-linux-gnu
 arceb						arceb-unknown-none
+arceb-elf					arceb-unknown-elf
 arceb-linux					arceb-unknown-linux-gnu
+arc64						arc64-unknown-none
+arc64-elf					arc64-unknown-elf
+arc64-linux					arc64-unknown-linux-gnu
 arm						arm-unknown-none
 arm-cegcc					arm-unknown-cegcc
 arm-coff					arm-unknown-coff
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
