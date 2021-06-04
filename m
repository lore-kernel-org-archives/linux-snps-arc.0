Return-Path: <SRS0=rV/3=K6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7225EC4708F
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Jun 2021 04:01:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 135FB60720
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Jun 2021 04:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 135FB60720
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VRIeWPcWpql2/BMiHK3JyvMnS+Mj67NAnMrQAZrIR7U=; b=yYWpwqNQvDilvm
	1Sn7zgu2/NbqdiaWnysf0BiO3p2NjLzsTL8o/UgfwPCiYGuKXouz8mrxNhKz74AKM/nD1ktL766az
	wmsFsoORd3bzxeXI6cyYyDwYlL07LSVFy0RX/x+WYccVCdkAvEQCMGTXtWMxvPoF9/ZdN93dLZlqH
	pUfh1MH5RCpjTYwaPpAcv6TQHg2j2TllXOdkW1y+tKfC+KhQ5/X/UqQt4a3cCrBQ673e0mdcgerPx
	vJ/vLWpQ51uNlDPQT3PpBeIXiXFwwWAcQvxAMaksVFCUY8HrhiLotEUFEkz2ec/DuX8/UpdkrvCs/
	upw2zN8uFeBLiKFUQ+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp11c-00BRFS-KR; Fri, 04 Jun 2021 04:01:36 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp11Z-00BREy-9t
 for linux-snps-arc@lists.infradead.org; Fri, 04 Jun 2021 04:01:34 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 997AB402B6;
 Fri,  4 Jun 2021 04:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1622779291; bh=z5uTmyuOtJK26HyAXDsoioOCBqNmoEQtdRcWtD7ytK8=;
 h=From:To:Cc:Subject:Date:From;
 b=eBR8L3fJB8CCwbGZ94JZcXpP5CHMjGotqynCvzppeQpZOQsGSjOSVcbzRZDvkEI9M
 bDtFih5aDzRQUp0Nxa8lZYw6XY8JjeSnXKROPwpPMKP+QhWXVE2h/w+l3qwz+BqpE3
 3PilTzfP+M6Ug52zPDUe/duhhpVlaSdmRDqpccdEDgzaNDFAJtzt4JPV26Cqkpsy7X
 KpN6zbFyqwPFJmrBXLmZCBQrfZBXoEpFc0j5sbqOXDa2mgm5fz9vNGuEFA8KC84eQ1
 AbccEpVZ+M6mdRbJ1vAVEEQ4yGYuI6k+6csKW/OgxcqLVNXJiuILEyEExgNRLjc+NI
 TXDn1k1Td6kLQ==
Received: from vineetg-Latitude-7400.internal.synopsys.com
 (snps-fugpbdpduq.internal.synopsys.com [10.202.17.37])
 by mailhost.synopsys.com (Postfix) with ESMTP id D3917A0096;
 Fri,  4 Jun 2021 04:01:26 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: config-patches@gnu.org
Cc: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH] Recognize arc32
Date: Thu,  3 Jun 2021 21:01:25 -0700
Message-Id: <20210604040125.323754-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_210133_379857_326BA0AC 
X-CRM114-Status: GOOD (  14.70  )
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

This is the 32-bit variant of ARCv3 ISA (which is not compatible with the
32-bit ARCv2 ISA)

| make check
| cd testsuite && bash config-guess.sh && rm uname
| PASS: config.guess checks (136 tests)
| cd testsuite && bash config-sub.sh
| PASS: config.sub checks (864 tests)
| PASS: config.sub idempotency checks (801 tests)
| PASS: config.sub canonicalise each config.guess testcase (136 tests)

* config.guess (arc32:Linux:*:*): Recognize.
* config.sub (arc32): Likewise.
* doc/config.guess.1: Regenerate.
* doc/config.sub.1: Likewise.
* testsuite/config-guess.data: Add a test case for arc32.
* testsuite/config-sub.data (arc32, arc*-elf): Add test cases.

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 config.guess                | 4 ++--
 config.sub                  | 4 ++--
 doc/config.guess.1          | 2 +-
 doc/config.sub.1            | 2 +-
 testsuite/config-guess.data | 1 +
 testsuite/config-sub.data   | 3 +++
 6 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/config.guess b/config.guess
index dc0a6b29976a..10a8f090d637 100755
--- a/config.guess
+++ b/config.guess
@@ -2,7 +2,7 @@
 # Attempt to guess a canonical system name.
 #   Copyright 1992-2021 Free Software Foundation, Inc.
 
-timestamp='2021-05-24'
+timestamp='2021-06-03'
 
 # This file is free software; you can redistribute it and/or modify it
 # under the terms of the GNU General Public License as published by
@@ -952,7 +952,7 @@ EOF
 	if test "$?" = 0 ; then LIBC=gnulibc1 ; fi
 	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
 	exit ;;
-    arc:Linux:*:* | arceb:Linux:*:* | arc64:Linux:*:*)
+    arc:Linux:*:* | arceb:Linux:*:* | arc32:Linux:*:* | arc64:Linux:*:*)
 	echo "$UNAME_MACHINE"-unknown-linux-"$LIBC"
 	exit ;;
     arm*:Linux:*:*)
diff --git a/config.sub b/config.sub
index 7384e9198b40..b4702115138b 100755
--- a/config.sub
+++ b/config.sub
@@ -2,7 +2,7 @@
 # Configuration validation subroutine script.
 #   Copyright 1992-2021 Free Software Foundation, Inc.
 
-timestamp='2021-04-30'
+timestamp='2021-06-03'
 
 # This file is free software; you can redistribute it and/or modify it
 # under the terms of the GNU General Public License as published by
@@ -1165,7 +1165,7 @@ case $cpu-$vendor in
 			| alphapca5[67] | alpha64pca5[67] \
 			| am33_2.0 \
 			| amdgcn \
-			| arc | arceb | arc64 \
+			| arc | arceb | arc32 | arc64 \
 			| arm | arm[lb]e | arme[lb] | armv* \
 			| avr | avr32 \
 			| asmjs \
diff --git a/doc/config.guess.1 b/doc/config.guess.1
index cfb0d95194b0..503249d866dd 100644
--- a/doc/config.guess.1
+++ b/doc/config.guess.1
@@ -1,5 +1,5 @@
 .\" DO NOT MODIFY THIS FILE!  It was generated by help2man 1.47.16.
-.TH CONFIG.GUESS "1" "May 2021" "GNU config.guess (2021-05-24)" "User Commands"
+.TH CONFIG.GUESS "1" "June 2021" "GNU config.guess (2021-06-03)" "User Commands"
 .SH NAME
 config.guess \- guess the build system triplet
 .SH SYNOPSIS
diff --git a/doc/config.sub.1 b/doc/config.sub.1
index 56457c667580..727ce77bb781 100644
--- a/doc/config.sub.1
+++ b/doc/config.sub.1
@@ -1,5 +1,5 @@
 .\" DO NOT MODIFY THIS FILE!  It was generated by help2man 1.47.16.
-.TH CONFIG.SUB "1" "April 2021" "GNU config.sub (2021-04-30)" "User Commands"
+.TH CONFIG.SUB "1" "June 2021" "GNU config.sub (2021-06-03)" "User Commands"
 .SH NAME
 config.sub \- validate and canonicalize a configuration triplet
 .SH SYNOPSIS
diff --git a/testsuite/config-guess.data b/testsuite/config-guess.data
index 9a9f67e23100..bc26e03eb4ea 100644
--- a/testsuite/config-guess.data
+++ b/testsuite/config-guess.data
@@ -34,6 +34,7 @@ amd64 | 7.0_BETA | NetBSD | ignored | x86_64 | x86_64-unknown-netbsd7.0
 amd64 | 7.0_RC1 | NetBSD | ignored | x86_64 | x86_64-unknown-netbsd7.0
 amd64 | 7.2.1 | Isilon OneFS | ignored | ignored | x86_64-unknown-onefs
 arc | ignored | Linux | ignored | ignored | arc-unknown-linux-gnu
+arc32 | ignored | Linux | ignored | ignored | arc32-unknown-linux-gnu
 arc64 | ignored | Linux | ignored | ignored | arc64-unknown-linux-gnu
 arceb | ignored | Linux | ignored | ignored | arceb-unknown-linux-gnu
 arm | 12.0 | FreeBSD | ignored | armv6 | armv6-unknown-freebsd12.0-gnueabihf
diff --git a/testsuite/config-sub.data b/testsuite/config-sub.data
index 5bc8a1d6add1..8e68ceeb284f 100644
--- a/testsuite/config-sub.data
+++ b/testsuite/config-sub.data
@@ -61,6 +61,9 @@ apollo68bsd					m68k-apollo-bsd
 arc						arc-unknown-none
 arc-elf						arc-unknown-elf
 arc-linux					arc-unknown-linux-gnu
+arc32						arc32-unknown-none
+arc32-elf					arc32-unknown-elf
+arc32-linux					arc32-unknown-linux-gnu
 arc64						arc64-unknown-none
 arc64-elf					arc64-unknown-elf
 arc64-linux					arc64-unknown-linux-gnu
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
