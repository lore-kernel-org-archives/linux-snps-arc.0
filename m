Return-Path: <SRS0=NhYn=JL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C8E2C433ED
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Apr 2021 17:11:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8140A61168
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Apr 2021 17:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8140A61168
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gHbVakSSq/QjH3m+prVzo98LJN5b/dC82gUUgMul95Q=; b=cztucs9xKv9I35fghjp4me/BnF
	JZog4Y/SBFvtIKGq3hBYVy10DCtKeMvrf8Ege7koqtrs8JiMTQctwH1i+gXYya0PDKyhu8QtzG+ru
	3+3YAjWRAYJzRGBpKr1rVsx0719Y8s7f4me4DYjjt5u5O4fNfuoqav9/GceCu8t0oKHM7F+YkY67o
	gSj2CcerOZuKC6dgFCm2x38e5roOPmicuv9h9KOUXatZY/Gu6ZJ0qyP8XOshDKTr9CC5cGh7X2iAF
	jNdkelF2qF7E6MJPv3LgwV2v+npTJwPtl5H+l/A69cI7YiulPMn/qPuWy0H+r21wWAXTGMaBi9ZsO
	n4QpySSw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWj2Z-00DDxQ-5f; Wed, 14 Apr 2021 17:11:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWj2B-00DDuJ-Ew
 for linux-snps-arc@desiato.infradead.org; Wed, 14 Apr 2021 17:10:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=dsfkE3WpgnmTLEaCGQkTCMtXhooBQONkf/1VHK9QOFY=; b=rfhFzhNLqZjoEU6ALOnOfEEs8R
 nZQCpFPNNzSlyNMLCzAE8317Eoh7q/KT/VzZstWUZZ0dStVJptTfHo1XwvCeIbkaGO6Jp+85yGO1x
 JYo2DxW/IhBGNS+wraIJJQDaZXnVMv+LJHiqghxSGhEErfjHFAoovy0mV9hQHg+JriECzuw7l4Wgt
 PHcyv8JAOqkFgHnGYmLLB2vy6ofEKk6SyxC1S9er18TAEniIV+fS+eqGtwh9ee3WAGAIadFlWFxGL
 /ubufeCutp1iWrltoOVIqz2GQQVGvqYEHLNqEAVkxV+l8qUmkppacU05GKBbYAPyO18rIsTXXVL79
 dJbkrsmw==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWj28-007xtG-EX
 for linux-snps-arc@lists.infradead.org; Wed, 14 Apr 2021 17:10:33 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 88C11405D7;
 Wed, 14 Apr 2021 17:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1618420229; bh=zOxHMrfuxOZP9j8TNriiRNQcrAoYWvql/URGy0TY9vk=;
 h=From:To:Cc:Subject:Date:From;
 b=AIW/iPDBe+XR7b7CbS2k6O7FbeGQONS43DW7EkIMz1pTDVI1Jt12ZqYhhik4KCV2/
 PipQieKwuyw6k9CJFNW6c4dX+EHxOVX6QvQN/mKnJdy1jzDwugEDl/sqj+Q+bij5xc
 RQCw49PhPDaDdcR5hgA9+RvEbcb9sxfL1LErWlxCVDZCPKP4IrZ75kxwy3cedQzFKH
 FXFBEYUlDOeCoOFKdsL2PVjcEoBl0vYMW5OLwVkApm4hUbg3Q9qRhItjdnTMpSAGjG
 6tbmCREg9+HqKu/9cX5AXT9gzK6BwZR47lQtDNwRHKiYPY6Sw209dABXlu5x8x6AIf
 08J073JvOnM6A==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 1DA19A0096;
 Wed, 14 Apr 2021 17:10:25 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Cc: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [committed] ARC: Update ulps
Date: Wed, 14 Apr 2021 10:10:23 -0700
Message-Id: <20210414171023.2657987-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_101032_514144_C8CFE3C3 
X-CRM114-Status: UNSURE (   6.50  )
X-CRM114-Notice: Please train this message.
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

Needed after 43576de04afc6

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 sysdeps/arc/fpu/libm-test-ulps   | 40 ++++++++++++++++----------------
 sysdeps/arc/nofpu/libm-test-ulps | 14 +++++++----
 2 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/sysdeps/arc/fpu/libm-test-ulps b/sysdeps/arc/fpu/libm-test-ulps
index 1a7cd54b39d2..56ff9149cbb6 100644
--- a/sysdeps/arc/fpu/libm-test-ulps
+++ b/sysdeps/arc/fpu/libm-test-ulps
@@ -46,7 +46,7 @@ double: 1
 float: 1
 
 Function: "asin_upward":
-double: 1
+double: 2
 float: 1
 
 Function: "asinh":
@@ -861,35 +861,35 @@ float: 1
 
 Function: "j0":
 double: 4
-float: 6
+float: 9
 
 Function: "j0_downward":
-double: 2
-float: 4
+double: 6
+float: 8
 
 Function: "j0_towardzero":
 double: 4
-float: 5
+float: 9
 
 Function: "j0_upward":
-double: 3
-float: 5
+double: 4
+float: 9
 
 Function: "j1":
 double: 5
 float: 9
 
 Function: "j1_downward":
-double: 4
-float: 6
+double: 9
+float: 8
 
 Function: "j1_towardzero":
-double: 4
-float: 3
+double: 5
+float: 8
 
 Function: "j1_upward":
 double: 5
-float: 5
+float: 7
 
 Function: "jn":
 double: 9
@@ -1093,35 +1093,35 @@ float: 9
 
 Function: "y0":
 double: 3
-float: 6
+float: 8
 
 Function: "y0_downward":
 double: 3
-float: 4
+float: 8
 
 Function: "y0_towardzero":
 double: 3
-float: 4
+float: 8
 
 Function: "y0_upward":
 double: 4
-float: 5
+float: 8
 
 Function: "y1":
 double: 7
-float: 6
+float: 9
 
 Function: "y1_downward":
 double: 6
-float: 6
+float: 8
 
 Function: "y1_towardzero":
 double: 7
-float: 7
+float: 9
 
 Function: "y1_upward":
 double: 7
-float: 7
+float: 9
 
 Function: "yn":
 double: 9
diff --git a/sysdeps/arc/nofpu/libm-test-ulps b/sysdeps/arc/nofpu/libm-test-ulps
index 15449dd55a9c..6ac2830b2594 100644
--- a/sysdeps/arc/nofpu/libm-test-ulps
+++ b/sysdeps/arc/nofpu/libm-test-ulps
@@ -2,6 +2,7 @@
 
 # Maximal error of functions:
 Function: "acos":
+double: 1
 float: 1
 
 Function: "acosh":
@@ -9,6 +10,7 @@ double: 2
 float: 2
 
 Function: "asin":
+double: 1
 float: 1
 
 Function: "asinh":
@@ -16,10 +18,11 @@ double: 2
 float: 2
 
 Function: "atan":
+double: 1
 float: 1
 
 Function: "atan2":
-float: 1
+float: 2
 
 Function: "atanh":
 double: 2
@@ -112,6 +115,7 @@ double: 3
 float: 3
 
 Function: Imaginary part of "clog":
+double: 1
 float: 1
 
 Function: Real part of "clog10":
@@ -204,10 +208,10 @@ double: 1
 
 Function: "j0":
 double: 2
-float: 8
+float: 9
 
 Function: "j1":
-double: 2
+double: 4
 float: 9
 
 Function: "jn":
@@ -258,11 +262,11 @@ float: 8
 
 Function: "y0":
 double: 3
-float: 8
+float: 9
 
 Function: "y1":
 double: 3
-float: 2
+float: 9
 
 Function: "yn":
 double: 3
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
