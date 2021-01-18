Return-Path: <SRS0=ZfBq=GV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE355C433DB
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 Jan 2021 00:42:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95B482250F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 Jan 2021 00:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95B482250F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=syEE6jdJ9usywU1qWi+6NYw6/5zP6h/xj1tCdT7cfXc=; b=l3KUWxnn/UiKrVqSOgajXYkcA8
	BSjgLL5UQGkFrymrWXNpZZu6imOgCp1FWKc/S8Se0m17X1jsI8zlk5F25mZLArRjEQnuhWzr+Vd4a
	8mx0qG7RIUorUIEq7dfxzba1IWiZIkVbw9SU91+zCXTTzVjJised02InoyyV9JJdBtMx812J9NS5R
	LqWDgrZ1HT0VCa7Pp0LMzEy8YLB9i2jkdg8US+mAi57guLD8vNKoaaXddEu53H1C9uXcPlZd53IhJ
	ew68mIVjxYhtopi76ASGcf1X4Z8boNcPkNleRTpG18JXvRclb6+/i3ElP+nAXIl3lbKdD3RNGGwzb
	VrplgDlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Ics-0007Wm-FP; Mon, 18 Jan 2021 00:42:34 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Icp-0007WI-PT
 for linux-snps-arc@lists.infradead.org; Mon, 18 Jan 2021 00:42:32 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 86ED74013E;
 Mon, 18 Jan 2021 00:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610930547; bh=dt8w/mHZSHzL2nK+raOjYdX0K/j9qKpAF4wRmZITM+o=;
 h=From:To:Cc:Subject:Date:From;
 b=L77b3O1tMrOSoyg9rbzSBPdh0bKvruPIt0Io0fx4d1OwFyEtODLh2whl2VeJr3PJX
 163K7KXP84wOoNUZESSRoy518xH+ugNGSdwPWmJwelR/gd4F9pbiFDDGDHjwqP4Y3K
 IeGEHFnPMv/Z9QEP+uccwolodNcMd4llv9gaG7IPTn1/lXUIUeOB2G8oMmaonje5L6
 /7k88eHdXhmFuyNHbHtvACbyDBPtWjXzOKUjqiIq7BhwPqH4bxCSbsmr+jAkkUfVle
 7MXQwaqQVTzOhn+T7nO7Xl8JoiJmnHbBD4l9QcgMmPCo+yxikN5IrHO8XX/tavLK7b
 08AuTU/JxqOnA==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 170EAA006F;
 Mon, 18 Jan 2021 00:42:24 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [COMMITTED] ARC: nofpu: Regenerate ulps
Date: Sun, 17 Jan 2021 16:42:22 -0800
Message-Id: <20210118004222.877828-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_194232_006644_76A93257 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
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
 sysdeps/arc/nofpu/libm-test-ulps | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sysdeps/arc/nofpu/libm-test-ulps b/sysdeps/arc/nofpu/libm-test-ulps
index 260eacf1c337..15449dd55a9c 100644
--- a/sysdeps/arc/nofpu/libm-test-ulps
+++ b/sysdeps/arc/nofpu/libm-test-ulps
@@ -12,7 +12,7 @@ Function: "asin":
 float: 1
 
 Function: "asinh":
-double: 1
+double: 2
 float: 2
 
 Function: "atan":
@@ -80,7 +80,7 @@ double: 1
 float: 1
 
 Function: "cbrt":
-double: 3
+double: 4
 float: 1
 
 Function: Real part of "ccos":
@@ -127,7 +127,7 @@ double: 1
 float: 1
 
 Function: "cosh":
-double: 1
+double: 2
 float: 2
 
 Function: Real part of "cpow":
@@ -177,10 +177,11 @@ double: 1
 float: 1
 
 Function: "erfc":
-double: 3
+double: 5
 float: 3
 
 Function: "exp":
+double: 1
 float: 1
 
 Function: "exp10":
@@ -252,7 +253,7 @@ double: 2
 float: 2
 
 Function: "tgamma":
-double: 5
+double: 9
 float: 8
 
 Function: "y0":
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
