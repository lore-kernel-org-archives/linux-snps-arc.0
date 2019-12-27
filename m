Return-Path: <SRS0=8sqX=2R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD8CC3F68F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Dec 2019 18:04:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C9122173E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Dec 2019 18:04:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FaKXKpiy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ASV7Z7+/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C9122173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ALf/byO1YJCwfhHuV3PZuFBcDWFE28limPUWz7tpZQ=; b=FaKXKpiyB/mwHl
	WqvWJp7jSKUZirhiS0VakGoMY+rtOLTKnjcr6+JicGy/GHeS+ZAEQJYeeX/Z4yxg41o9TjZv4vqjc
	XARPYxtb+amS06DtExEtIvazcBe4Yq/QEuJFaVUrGIIolgO8ekBc/R3pNr7uRkAVGSSEMtNQCD0B2
	zqWE1F6bpn/EF0JPpd74DSF7huj7c71Zggxc65YUj9jbYjJildtQEoBd4IfU63dAV4h4tc9d6d1NM
	uejQ5fw3HO8uGOGs9f8SvgVBNLRKpuLppi91f13MrhfJDwMWOYU1WNp22vGvsElDbkl+wFlDlukfT
	Elw+R0+Y6UcboCt24rnQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikty3-0005aI-JY; Fri, 27 Dec 2019 18:04:07 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iktxw-0005Vd-S5
 for linux-snps-arc@lists.infradead.org; Fri, 27 Dec 2019 18:04:03 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 209E442CED;
 Fri, 27 Dec 2019 18:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1577469839; bh=Hes0n05dCzlQLemBmu3FmAF+1sPDQGmnFX0t0kYnTls=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ASV7Z7+/bOTCx7iaXWb8kPRRMQDHN2iF8A+EXxt8yQe455/l85/eYsGGdM6y9xq7P
 Khj+fsn70hej3Cnzc7fpw/KC1sFBrd8hrsMKCsXP3WeUP3wWoo++0hHlrd6Cjaqnci
 sW1HVG88AC6BhS1g8z2JN71Su/lPbeC+bW++pglfEPS+zlvU3/r2SAtSURIgWBmC9N
 8YPRz7rRfqwwNR1PPmX5RW6kJjjAcaVY5pPqSuKSIm2CeevuvxUJFaDYxKVDkXFGGT
 +21PJnTVCJe58+ALzkZ+8BqkvRl1H8UsjXlUduvSuXZEV6zVjf8rXxxguV2iUAhovV
 RwLAGsbMvLGEQ==
Received: from paltsev-e7480.internal.synopsys.com (unknown [10.121.8.65])
 by mailhost.synopsys.com (Postfix) with ESMTP id 6B1CBA0067;
 Fri, 27 Dec 2019 18:03:56 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 2/5] ARC: add helpers to sanitize config options
Date: Fri, 27 Dec 2019 21:03:44 +0300
Message-Id: <20191227180347.3579-3-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191227180347.3579-1-Eugeniy.Paltsev@synopsys.com>
References: <20191227180347.3579-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191227_100400_912457_6A1AE965 
X-CRM114-Status: GOOD (  10.38  )
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

We'll use this macro in coming patches extensively.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/kernel/setup.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 7ee89dc61f6e..edb55b6ee278 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -389,11 +389,23 @@ static char *arc_extn_mumbojumbo(int cpu_id, char *buf, int len)
 	return buf;
 }
 
+static void chk_opt_strict(char *opt_name, bool hw_exists, bool opt_ena)
+{
+	if (hw_exists && !opt_ena)
+		pr_warn(" ! Enable %s for working apps\n", opt_name);
+	else if (!hw_exists && opt_ena)
+		panic("Disable %s, hardware NOT present\n", opt_name);
+}
+
+#define CHK_OPT_STRICT(opt_name, hw_exists)				\
+({									\
+	chk_opt_strict(#opt_name, hw_exists, IS_ENABLED(opt_name));	\
+})
+
 static void arc_chk_core_config(void)
 {
 	struct cpuinfo_arc *cpu = &cpuinfo_arc700[smp_processor_id()];
-	int saved = 0, present = 0;
-	char *opt_nm = NULL;
+	int present = 0;
 
 	if (!cpu->extn.timer0)
 		panic("Timer0 is not present!\n");
@@ -425,23 +437,14 @@ static void arc_chk_core_config(void)
 	 */
 
 	if (is_isa_arcompact()) {
-		opt_nm = "CONFIG_ARC_FPU_SAVE_RESTORE";
-		saved = IS_ENABLED(CONFIG_ARC_FPU_SAVE_RESTORE);
-
 		/* only DPDP checked since SP has no arch visible regs */
 		present = cpu->extn.fpu_dp;
+		CHK_OPT_STRICT(CONFIG_ARC_FPU_SAVE_RESTORE, present);
 	} else {
-		opt_nm = "CONFIG_ARC_HAS_ACCL_REGS";
-		saved = IS_ENABLED(CONFIG_ARC_HAS_ACCL_REGS);
-
 		/* Accumulator Low:High pair (r58:59) present if DSP MPY or FPU */
 		present = cpu->extn_mpy.dsp | cpu->extn.fpu_sp | cpu->extn.fpu_dp;
+		CHK_OPT_STRICT(CONFIG_ARC_HAS_ACCL_REGS, present);
 	}
-
-	if (present && !saved)
-		pr_warn("Enable %s for working apps\n", opt_nm);
-	else if (!present && saved)
-		panic("Disable %s, hardware NOT present\n", opt_nm);
 }
 
 /*
-- 
2.21.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
