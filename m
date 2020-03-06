Return-Path: <SRS0=e3HE=4X=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC89C10DCE
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Mar 2020 18:24:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66B4E2067C
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Mar 2020 18:24:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KselmhtI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TsnFmg+n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66B4E2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w8t7U9dCwjuCyWeKLHPKuSlnfVx6QI2YL7YYddmJgR4=; b=KselmhtIOJTWKw
	FGTCT4EZVaUNhqolft4Elka1s8X6it3sBZUU2VAnRIswUf3KtgcgEfjabIQmDS7RWhl4ZCXvlnExG
	IYw0TJRLEnQkJDxvoTvH6LH9vWv3zniJ7pbBNHDtQs9j1M0SuAgshFgu7RHIoQr6xjEEZYaG4d39c
	KBtVWjfuSpJAgGSjNq6F3pEcmkKYr7FUlgqC0w6ZT1u9biIOD2I8G2iQmybF4VnMsXOexnax8NK2A
	e5H6bBqMH7RnbrOgoubjd0BQHC6nqzexivu/9Ira5ke/O3V2fF3vi/5xUP88E2IKhug8m5Cqk/kwm
	RYD3AZoaQKd4DHUOh7Yg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAHeD-0001Tt-Uo; Fri, 06 Mar 2020 18:24:33 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAHeA-0001P3-AQ
 for linux-snps-arc@lists.infradead.org; Fri, 06 Mar 2020 18:24:32 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8BC85402FD;
 Fri,  6 Mar 2020 18:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583519068; bh=AJHvkrxICBWLX6S9YC3k68T727Rgh08Zogp5+ZQSeRA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TsnFmg+n5/Cm4QoaIVuEmpvVN1gZkdmawBzdkk67aHBzK2+SbglyBokoWofDqOxhn
 pcmSelDg1nLIN3lf9qLH55fMfGSGcFqbgGtl2QtHjAEmcawdY9L9jZ38OASoD93/Oo
 RGZgvoewNM6+gA4TFe9aHpoqSkbo6BZ7hsFEy7RO1k7xryi09m6FOXTqBp1HOwbG2d
 s4Sy/17fzY0kAK8Un3apRh/dy8xK47j8maSQTlCHCfZeXcGHrh+IWZ5J890kWXoXia
 3Mp+MuejFcUWeTvCONrBMUEd/5nNPVeEiavXJsV2Wl9NzdrDinQ6/AY7HFWXk7Gkrk
 GYTwPxeM7mgEA==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.28])
 by mailhost.synopsys.com (Postfix) with ESMTP id 67F31A0087;
 Fri,  6 Mar 2020 18:24:28 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v3 16/17] NEWS: mention ARC port
Date: Fri,  6 Mar 2020 10:24:18 -0800
Message-Id: <20200306182419.13945-17-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200306182419.13945-1-vgupta@synopsys.com>
References: <20200306182419.13945-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_102430_378047_44F237E3 
X-CRM114-Status: UNSURE (   7.04  )
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

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 NEWS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/NEWS b/NEWS
index 58ab5a89e894..923dd18d1478 100644
--- a/NEWS
+++ b/NEWS
@@ -17,6 +17,12 @@ Major new features:
     - rv32imafdc ilp32
     - rv32imafdc ilp32d
 
+* Support for ARC HS cores running Linux has been contributed by Synopsys.
+  Port requires atleast
+    - binutils-2.31 (binutils-2_31-branch: commit 6ce881c15fc4, 2018-10-04)
+    - gcc 8.2 (gcc-8-stable: commit 0d5ba57508c5, 2019-01-29)
+    - Linux kernel 5.1+
+
 Deprecated and removed features, and other changes affecting compatibility:
 
   [Add deprecations, removals and changes affecting compatibility here]
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
