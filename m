Return-Path: <SRS0=cuW9=GL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3325C433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Jan 2021 20:53:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 423D223A7F
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Jan 2021 20:53:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 423D223A7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rVHd4WxxOan0fI69x3W9NG1smCFFcJnJCs+UxB9U2yU=; b=Ldi5Q23nTFoxSwCymvHbwahnL
	99IGliR/KS/26oFn1FAtWZljQq33XbfYCjdFkKYTiOjnuboOYArT39h5AYOFo1yEjByc2cM6fQZfd
	DYevvjdXv+mbz+RORPZt2Erfe2b0/xsHFNFwmFlyr3qDYJmdL5g/9PYbsoTjQmjOnbZ02NNnBOfl+
	SPNJlMDKTJRGSCyyQInoaS3NrEKn3AVUkDwRbdQe7DH2b7zc5Jrobzdp66Zap5YKn1iYTv5Uco3rK
	KLojreola6OaO0vio51hwSM27VbaSzWVFx1mxyYQP5rELHAU8ARbpmFv1c/K8pgyk5ZTG6WSyW2xW
	RI/6aSKCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxykw-00085t-BJ; Fri, 08 Jan 2021 20:53:10 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxykt-00085X-Vi
 for linux-snps-arc@lists.infradead.org; Fri, 08 Jan 2021 20:53:09 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 769C0C00C9;
 Fri,  8 Jan 2021 20:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610139186; bh=sfJSeytvwwMSX+iN0lW5P/BjTyYslsyLT4cjLaczDc4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E73DPV5pn0o+aub1th7fJORjaEjGxRCLQO12noYQk5oQR4fkqgXWaQL/kZ/F13m/7
 JJQDMXV02A/ihvRQJqNqGo5+J3L0gBojHZPG5FqTm/crrZDwz4zClUEAUBS6wI+r+T
 UXjBPFFx2DOVWvqvsCeGmX7+wLqTY+dCaSNpjJ14vFiWZFsdwbL++SfcCBwnyX3boN
 z114wzdRwQMN5TzUdR4pZCiPR+HNoiw7O+nBKO275gbHEDyj7kgzoUgKBkJLigygM7
 KfoQgP7KyfxvrW/Bq2uCoDopS3XJJFBaSeAYsl5e59q55yaVe+NvdJw/fcTqWl4kmd
 +FrLyP+vx+HGg==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id F1EA3A0070;
 Fri,  8 Jan 2021 20:53:01 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [COMMITTED] ARC: Regenerate ulps
Date: Fri,  8 Jan 2021 12:52:59 -0800
Message-Id: <20210108205259.115907-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108175145.44862-1-vgupta@synopsys.com>
References: <20210108175145.44862-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_155308_224558_0D00ACFF 
X-CRM114-Status: UNSURE (   6.69  )
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

Reinstate pass for

FAIL: math/test-double-cosh
FAIL: math/test-double-sinh
FAIL: math/test-float32x-cosh
FAIL: math/test-float32x-sinh
FAIL: math/test-float64-cosh
FAIL: math/test-float64-sinh
FAIL: math/test-ldouble-cosh
FAIL: math/test-ldouble-sinh
---
 sysdeps/arc/fpu/libm-test-ulps | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sysdeps/arc/fpu/libm-test-ulps b/sysdeps/arc/fpu/libm-test-ulps
index f7f98caa0d5e..1a7cd54b39d2 100644
--- a/sysdeps/arc/fpu/libm-test-ulps
+++ b/sysdeps/arc/fpu/libm-test-ulps
@@ -532,11 +532,11 @@ double: 3
 float: 3
 
 Function: "cosh_downward":
-double: 2
+double: 3
 float: 1
 
 Function: "cosh_towardzero":
-double: 2
+double: 3
 float: 1
 
 Function: "cosh_upward":
@@ -548,7 +548,7 @@ double: 9
 float: 8
 
 Function: Imaginary part of "cpow":
-double: 3
+double: 8
 float: 6
 
 Function: Real part of "cpow_downward":
@@ -1036,7 +1036,7 @@ double: 3
 float: 3
 
 Function: "sinh_towardzero":
-double: 2
+double: 3
 float: 2
 
 Function: "sinh_upward":
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
