Return-Path: <SRS0=IDKR=KB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80977C433B4
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 May 2021 00:40:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D70061222
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 May 2021 00:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D70061222
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MdG00PA4K4yOVXwY+z6WBBv3mdbMaP5uh9mxM+ACheI=; b=QGIUPfX/fzPcn9tsx0z1EHG4N
	nqLdk4kiCeA+zvAdxoHiz0VP861vhWZ3DiC+O3Jp5vBPBeZZafqahvRuq3FJC9cicsAWYBD5JffoW
	T4TeW1QZVYEEZvYBs2QNcwQJxN9DadxP+IvZ5Y/DN3Nfo++fBPFZUaHbu2/JtGpJFn9q8QGGF+Wg+
	vDYeUBykxUsvCPgHpfHsjiPnMxPbe0i8jvXWHc/q8xn0q/tFMv80hqSarhprLbtqYxK7sRO8terb9
	0SvGz5aA3HiE9HOWmH6HK9Ytt49LIYOdKaz0kqjqjt1qtDcpZXefC/d2Kmu0YUPEaVLrffy+qQwAN
	UmIskl5Tw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leS3l-002jjO-8c; Thu, 06 May 2021 00:40:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leS3h-002jiA-E1
 for linux-snps-arc@desiato.infradead.org; Thu, 06 May 2021 00:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=GY0t5cG5XsZesuKL81La5t0ZG55LrKZy5h9Ju7PdIXQ=; b=EgtVuBePkUEFewGwJgcWpqYzIB
 AqDp+mqy7irhNRxdlVd2qGgKkuzc4ITx5ZJAogZTPDyFWCWR71q7LnDS0aTDcHi5qXAOIrR+qPy8T
 uxnzjpaskHxsNLybHNIq2HmI/rPaByaHKn0oGbttn18mxX0/V+UC1H87kCcUAonOVHhp4C1EwT0Hm
 Is/0tO6nhNITvNbFUqYYWBbfL4bP4LstmysNHN3xMDRs0sMtOUM0otnRc3T3OFWGRTHz1RmrG3Ab6
 Cf8X+Ln+hcQSX+EvjPEDhssf+ZOYj0Wd9FXBMmXWu03o1K6DgNnEAaj7ERsFFHjrcR3P21V3ODtSB
 qPthxmzA==;
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leS3d-005RfM-JL
 for linux-snps-arc@lists.infradead.org; Thu, 06 May 2021 00:40:03 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 11F87C0619;
 Thu,  6 May 2021 00:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1620261600; bh=jP2ryI91UvMVdm1ijPlijLRkvyKuEguhqJ0uGZ7mqHM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P0vbV8PKAaj8siZOqG3gf/3A8NXvbbwMbw2BW4HarswfUoqB3i2z8QikCpelGcv5D
 5biuhDNuQ5v00OUxciU6gSuU5LHQexccHsjXmx3nr8gESO5T5Z2Pbkh7S19Xs/LEbu
 u5UqGdht5XmkGLmd34bEnBZkjry9kB8me1HdPPNcXt/qNnFjBFIiQ28XDG/CFc8syb
 JqG5WFkI4KvXQXlqbs3YbZ7E7dyMlh3AQOQzl+++M6+YzShaJ5eSLGNd3g6iZafU4R
 PXucXsnFmERdOOlr/WDczqGG53/EEvDsuT3LysQl1Pjsh5niKk3Xluzi4xiO3hDI8+
 jk9xpIKnEjDZw==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.202.19.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id AB6B3A00A2;
 Thu,  6 May 2021 00:39:59 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Cc: Alexey.Brodkin@synopsys.com, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 1/3] ARC: config: explicit'ify -mcpu for cpu selection
Date: Wed,  5 May 2021 17:39:55 -0700
Message-Id: <20210506003957.2994235-2-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506003957.2994235-1-vgupta@synopsys.com>
References: <20210506003957.2994235-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_174001_704926_F08768FD 
X-CRM114-Status: GOOD (  10.05  )
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

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/Config.in.arc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index f7a6d920b50d..f84dfab38ae9 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -12,14 +12,14 @@ config BR2_arc770d
 	bool "ARC 770D"
 
 config BR2_archs38
-	bool "ARC HS38"
+	bool "ARC HS38 (-mcpu=archs)"
 	help
 	  Generic ARC HS capable of running Linux, i.e. with MMU,
 	  caches and 32-bit multiplier. Also it corresponds to the
 	  default configuration in older GNU toolchain versions.
 
 config BR2_archs38_64mpy
-	bool "ARC HS38 with 64-bit mpy"
+	bool "ARC HS38 with 64-bit mpy (-mcpu=hs38)"
 	help
 	  Fully featured ARC HS capable of running Linux, i.e. with
 	  MMU, caches and 64-bit multiplier.
@@ -28,7 +28,7 @@ config BR2_archs38_64mpy
 	  for use this one.
 
 config BR2_archs38_full
-	bool "ARC HS38 with Quad MAC & FPU"
+	bool "ARC HS38 with Quad MAC & FPU (-mcpu=hs38_linux)"
 	help
 	  Fully featured ARC HS with additional support for
 	   - Dual- and quad multiply and MC oprations
@@ -43,7 +43,7 @@ config BR2_archs4x_rel31
 	   Build for HS48 release 3.1
 
 config BR2_archs4x
-	bool "ARC HS48"
+	bool "ARC HS48 (-mcpu=hs4x)"
 	help
 	   Latest release of HS48 processor
 	   - Dual and Quad multiply and MAC operations
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
