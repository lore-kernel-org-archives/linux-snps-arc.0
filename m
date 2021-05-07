Return-Path: <SRS0=Ca3q=KC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DECC433B4
	for <linux-snps-arc@archiver.kernel.org>; Fri,  7 May 2021 00:44:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3750B613B9
	for <linux-snps-arc@archiver.kernel.org>; Fri,  7 May 2021 00:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3750B613B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MdG00PA4K4yOVXwY+z6WBBv3mdbMaP5uh9mxM+ACheI=; b=BSfLIFnGWFcuot2TzhsY7bCfF
	XOrnTm9lUNVkqYY9JgwYfr7RVOoo6hPVVDnL7YkgqqhGuJMdBNIg4O4cNHs16Z9XFN2u5X7/hYfpr
	UuSFJ1XhsukSRogUe2k3QeS+UN0v/W10XYgIJ0E5QF/+Xmg3DSzWeHM+dneRzEpGJX6uKnhkMz7gY
	8LJfWbMje33TU+uUe24UE6w71iUp65akmZ1HOtazNZ4kv8y9yXJ+K9StUeTe6AgBXhTnlrvNMCV9f
	6opXvq6CPaW0gw5L+0i9ss+HRv+OiW3JjC+//nv1fN11jkjJdZtCMadREgC5COAXQo99133oVAGpj
	TqquiCKAQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leob2-005gAA-FK; Fri, 07 May 2021 00:44:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leoaz-005g9g-Vx
 for linux-snps-arc@desiato.infradead.org; Fri, 07 May 2021 00:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=GY0t5cG5XsZesuKL81La5t0ZG55LrKZy5h9Ju7PdIXQ=; b=mwv8YTJ7l3oEr0MMT2kimIEYn/
 2PVaiscy4MbpSf/PBf2VzvcOruO/krPKiOiXeuRovWYvMF9K3/g9o8Rf9Yzx66BHv666w5q4ljo1F
 Uzlj/AUJX+eTNv2w09ZG/A9eWaEE9LDLbO8djxl6aOUbxMKJVEouqRmEtFLwz3Gkv9uPtPlvebdjD
 wwrMWnZJnx+sGfS5MI3sTuMrk7fCjdLB9v6NPeypgexUNayM989EHEssW9ZUBIFMEGPSE9gs7/Bf2
 vcsFO8c0GZ61C+L+9BukvJ0a3EGzjI2ScoAuOZFZda3jB3sqL1jnKkfZCWdEHcBMYphNoJqk+5RS9
 xobLTXIw==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leoaw-006Tn5-F1
 for linux-snps-arc@lists.infradead.org; Fri, 07 May 2021 00:43:55 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F3248405D7;
 Fri,  7 May 2021 00:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1620348229; bh=jP2ryI91UvMVdm1ijPlijLRkvyKuEguhqJ0uGZ7mqHM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j6DKmRF2oBTzS6ARF7rp/Ov0ybdLq/03mP4ma7JCARKkJHnNbUWboZ0COk4dTbNdV
 rli1eoeTKpf+Wpy+JkC7OaSvPOm6lQpzGgbZaz26RwzZO5qTWx/FpaLWr+qeuzdF9c
 dzstvHyS4lFvocdBMqu8h/Qjm9AAj20YBJqOh2N13zOd7aXpQxI7KKykZBWjvEifVK
 lFxsdzr4JXcAR1O0cfwPqkean1YGc7oHvBsS1q2LHLZFWtLPbbWW7ch8NKhpB7Nc1r
 Cpyf6UVLA7yfkEJGVLT/tFw0UalW9C39GOkg4N6hL4YZnXq6ClkOxXjIKl+NDAPvZZ
 +r8H8grdXqy4Q==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.202.19.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 8E1B9A0065;
 Fri,  7 May 2021 00:43:47 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Cc: Alexey.Brodkin@synopsys.com, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH v2 1/3] ARC: config: explicit'ify -mcpu for cpu selection
Date: Thu,  6 May 2021 17:43:42 -0700
Message-Id: <20210507004344.3166099-2-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210507004344.3166099-1-vgupta@synopsys.com>
References: <20210507004344.3166099-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_174354_527548_7E3C755E 
X-CRM114-Status: UNSURE (   9.78  )
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
