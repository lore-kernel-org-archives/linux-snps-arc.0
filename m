Return-Path: <SRS0=7pOa=ZA=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA2AFC6196
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Nov 2019 17:41:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35105214DA
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Nov 2019 17:41:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UVBV7s4F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dX2iks9O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35105214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9X7o/a+QqT/6+DqQ8MRdVaA23n9GVSp/6mV//PN4tmk=; b=UVBV7s4FLuYkg2
	2XwFn9+qBIcP1lVE8V+QhxRww61eL91ypwaMRCld34hy1lt0KYQG3C7jqjGNB+kWxyeuRmnAaOov8
	5pCVjY5MrZFWSjVavTzDqxLvbDiXpIOkektMGvGhMo/rEZ4/wHIixTzQIjr1vA0nbT7H40DuCx7Yl
	uX1qJ5CyK6Or8/s3LOocJPRRRHINUr7APUdMk0I+J6uofM8MOuBTCFjwMifM0b6XijEM+Qsd1lgbO
	234i5+vHcTKe4yDsGaON8BYAXRkRWA9yHYht5BsvAId3B7cHh7CWmjia56QLBTA2glzkV70YfdzXV
	DMfwZ6YNOtK4k2Rb2HUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iT8GD-0007jO-CL; Fri, 08 Nov 2019 17:41:25 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT8G7-0007gu-Md
 for linux-snps-arc@lists.infradead.org; Fri, 08 Nov 2019 17:41:22 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F387FC0DEB;
 Fri,  8 Nov 2019 17:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573234879; bh=QnZBVef/PdWov027kg2NOxZGewfQbZucnUaRGClwAnI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dX2iks9OfE91u1xiXiIQZyq8Vxou02k/B5tkhVBnRFi3c7E5iM2V091wp/ptpcz0n
 DLvRIL0WHF/wwrZ7U/wp6Tljdg/BL7fNDFSSCxN6pUcpLDXhVJ/5r0iJ6Ub3IXNW1D
 T1R6RmonME+dmjHmt7wiZdMMmXWg9ZZc0HHax/iNNHM/iqE+88a/MQKIs4OWo/LHuk
 AntaUdCpRKQutyFl5wbsQH6lBClQInfIhha50S48O8yG2xnQgD+b4iL2vxdR+PsQhu
 BRgQd8AWR14yj3UJl1Z6+i77JsAvJBKV641HgJ3HSrK14rdiaYJzT6SBleQYD5CjGr
 JmKM471eQYkpA==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.28])
 by mailhost.synopsys.com (Postfix) with ESMTP id C3350A009F;
 Fri,  8 Nov 2019 17:41:18 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Subject: [PATCH 1/3] arch/config.in.arc: Introduce the ARC optimized hs38
 config
Date: Fri,  8 Nov 2019 09:41:10 -0800
Message-Id: <20191108174112.28183-2-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191108174112.28183-1-vgupta@synopsys.com>
References: <20191108174112.28183-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191108_094119_760540_0FE56F12 
X-CRM114-Status: UNSURE (   8.77  )
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
Cc: Evgeniy.Didin@synopsys.com, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org, Alexey.Brodkin@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This corresponds to -mcu=hs38 with mpy-option=9 (64-bit multiplier)

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/Config.in.arc | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index c65bb01f1f4f..284951b82cee 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -11,13 +11,19 @@ config BR2_arc750d
 config BR2_arc770d
 	bool "ARC 770D"
 
-config BR2_archs38
+config BR2_archs
 	bool "ARC HS38"
 	help
 	  Generic ARC HS capable of running Linux, i.e. with MMU,
-	  caches and multiplier. Also it corresponds to the default
+	  caches and 32-bit multiplier. Also it corresponds to the default
 	  configuration in older GNU toolchain versions.
 
+config BR2_archs38
+	bool "ARC HS38 with 64-bit mpy"
+	help
+	  Fully featured ARC HS capable of running Linux, i.e. with MMU,
+	  caches and 64-bit multiplier.
+
 	  If you're not sure which version of ARC HS core you  build for
 	  keep this one.
 
@@ -43,7 +49,7 @@ endchoice
 # Choice of atomic instructions presence
 config BR2_ARC_ATOMIC_EXT
 	bool "Atomic extension (LLOCK/SCOND instructions)"
-	default y if BR2_arc770d || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
+	default y if BR2_arc770d || BR2_archs || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
 
 config BR2_ARCH
 	default "arc"	if BR2_arcle
@@ -60,13 +66,14 @@ config BR2_ENDIAN
 config BR2_GCC_TARGET_CPU
 	default "arc700" if BR2_arc750d
 	default "arc700" if BR2_arc770d
-	default "archs"	 if BR2_archs38
+	default "archs"	 if BR2_archs
+	default "hs38"	 if BR2_archs38
 	default "hs38_linux"	 if BR2_archs38_full
 	default "hs4x_rel31"	 if BR2_archs4x_rel31
 
 config BR2_READELF_ARCH_NAME
 	default "ARCompact"	if BR2_arc750d || BR2_arc770d
-	default "ARCv2"		if BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
+	default "ARCv2"		if BR2_archs || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
 
 choice
 	prompt "MMU Page Size"
@@ -86,7 +93,7 @@ choice
 
 config BR2_ARC_PAGE_SIZE_4K
 	bool "4KB"
-	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
+	depends on BR2_arc770d || BR2_archs || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
 
 config BR2_ARC_PAGE_SIZE_8K
 	bool "8KB"
@@ -96,7 +103,7 @@ config BR2_ARC_PAGE_SIZE_8K
 
 config BR2_ARC_PAGE_SIZE_16K
 	bool "16KB"
-	depends on BR2_arc770d || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
+	depends on BR2_arc770d || BR2_archs || BR2_archs38 || BR2_archs38_full || BR2_archs4x_rel31
 
 endchoice
 
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
