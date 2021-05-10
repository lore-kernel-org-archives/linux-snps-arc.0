Return-Path: <SRS0=C+4U=KF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C09AFC433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 18:06:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 297FE611C2
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 18:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 297FE611C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h5ZGjCCHyCX6inEyPsZwT+w03CPm7+6iWgCByUTcymE=; b=IPl7Is0YBznE1CGbxQKTD3lwB
	pD+wKrP6vu24NTJAcNvFGIaPEtr6Dm4g9RsZXSCP8WoZY5WZX4Dny95aXdGNB+yeEQri5R/spjxsq
	0erXrw0BBfY8pwpSoR3lDOrXCpi+s9aibLxduihSvP9yWk9g4yMeLWGqkY6A7ZvA0fQ+1hcQwVxhk
	6YGcg2VRPr1UowMd8dpxKoJ9lVxYXqnHoMDgrdY1AM54oiBfoqoQjL1HwwSuT3OmMQCVPNOkOWjJs
	GnRc3tUz9Udyp8Q7vamaS7ypGsYKy8cxwlvDqeYSMhGtrvMefiAIF6ZiFgEJf9lUxWwZplT2n0uIj
	JLo5Z5ojQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgAIf-00FMn8-LC; Mon, 10 May 2021 18:06:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgADJ-00FKow-Vd
 for linux-snps-arc@desiato.infradead.org; Mon, 10 May 2021 18:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Xi1DdeMBB8PjLUbjs2O3+vOAhK2vIrAZYrDBYXt4XZs=; b=y4syZWufaVa3w+j6DEfXrktWl0
 7kfR6wVfAT3n5vZrAdQUaJx7i4EzDlPuk3ooejEvf0//jOk4swFbxj1rUpndd+EdUZPTvQRyY88C8
 F4lV2XBmjrznuI2qSDmPpxUAA4KIAbKa5Wn+Jyo70xyPz4mbLx5t9HR5XcVhhPCznSVDf8aMgiyoS
 qke0xy2h4Aa8d7HVpj1fDF+F1C4acm2sKlxU+oYNkx/8a7NBvYMEyCX2Jci9ODRMYbqnPqFzpogHR
 L4euWqp2GsmoTi+EEKcr8qUlncikrXU7hKf0dNuVcOQSrW+t1OoKTNM+SUIuYGKTo6FrkEnk0rGjR
 d7dzhKfg==;
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgADF-0090zF-MV
 for linux-snps-arc@lists.infradead.org; Mon, 10 May 2021 18:01:04 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 99C43C008D;
 Mon, 10 May 2021 18:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1620669657; bh=TrIMZKQo3jN8M4cIbb2t3byQHJQABpIU/yTNuRW8zjk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ud6hEgPrZdPciw842fiCw8atZvG9LEL78B7Gx4kNfyld4KpdSOdzTMI0sHpgpsJ/Y
 Cs8Emm+/HViWDKCXZsQ6tgRHL1JtnHNRnj5ZtLNxK7Y1HcNFJgacmmrxjyjeb9rPyS
 M0qp4gva8tmBUFWO9yAZFL2H+70QjQTWAIpNVHFEplwvYSqZDHRdur8i103okZKjmL
 QjyXolaGgYB/oEwZRMyb5lcaakZ44clj+gpcRox0u3anMfN8RxzQX5kmQYjRIqY9u3
 2XIoEXt0QnydhWCjKFqAvyG2BKg42mSReNAAHUAxlhhjo1d5oc4+4admlgMwI+sURG
 f2PZMkfleG6vQ==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.202.19.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 1F10DA0065;
 Mon, 10 May 2021 18:00:55 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Cc: Alexey.Brodkin@synopsys.com, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH v3 1/4] ARC: config: explicit'ify -mcpu for cpu selection
Date: Mon, 10 May 2021 11:00:45 -0700
Message-Id: <20210510180049.61421-2-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510180049.61421-1-vgupta@synopsys.com>
References: <20210510180049.61421-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_110101_791214_0ECAD7B9 
X-CRM114-Status: UNSURE (   9.97  )
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

This helps with distinguishing the cpu at the time of config selection

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/Config.in.arc | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index f7a6d920b50d..c9a695000f2c 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -6,20 +6,20 @@ choice
 	    Specific CPU to use
 
 config BR2_arc750d
-	bool "ARC 750D"
+	bool "ARC 750D (-mcpu=arc700)"
 
 config BR2_arc770d
-	bool "ARC 770D"
+	bool "ARC 770D (-mcpu=arc700)"
 
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
@@ -38,12 +38,12 @@ config BR2_archs38_full
 	  ARChitect.
 
 config BR2_archs4x_rel31
-	bool "ARC HS48 rel 31"
+	bool "ARC HS48 rel 31  (-mcpu=hs4x_rel31)"
 	help
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
