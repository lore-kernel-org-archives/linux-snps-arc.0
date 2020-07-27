Return-Path: <SRS0=nsR4=BG=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5451DC433E0
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Jul 2020 05:14:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15A10206F6
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Jul 2020 05:14:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N1NUnbmX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YZlE7wpK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15A10206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O9WevhpXPrPh9MB3fmdJo+H6uNuhwmXX4vFNdWY5n7o=; b=N1NUnbmX8ZNLIAgSqYwiSvdYpQ
	FrHZuesCXbK7P9oTYg4EftSHiO5eZ4QAkYY72tt1ywc+o+GJdsSUj6A+57DQlF2LLTduXB3kgORAU
	IlYK82hM5clIduJON70t3iiFM8rO1QMwJUCrybk4xZvxlBOVv/lUsmhnN5E5GlKb+tDsQ7TekEqm1
	+5tKwDwC/Dl3gbNohMbluN/G5BzOhBn6b/AHehb3gvVsRgMJz/PggIbGGISGCKvmKAA3RxfgLEp/l
	xhbJBbmMp3/7XQkYyJA8if4Xp5lU3zJ5CXxSTWpGJ2USF2PGSaAJXx9FRaOZwV6DGH6/1Ix4Vhc72
	N59evStg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzvSb-0004As-CU; Mon, 27 Jul 2020 05:14:01 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzvSZ-0004AG-Og
 for linux-snps-arc@lists.infradead.org; Mon, 27 Jul 2020 05:14:00 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2436EC0641;
 Mon, 27 Jul 2020 05:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1595826836; bh=eul44+C62DTDvDmmS3zMwGRsSJ3B5+hYF5hZSdNPdx8=;
 h=From:To:Cc:Subject:Date:From;
 b=YZlE7wpKcVSwyi8bkmwbLc0lqtJM8vmgs1XgeUj4/2EWDSbzoW7OtlFn3Rdf+mZBk
 jPWD0WUkCtO9D1ms27FWkl8AJGUlqpw+glKlj5JIZjMAzWEZQTkgiiobusbsmJtKAz
 GEuUwBKhRhQzc5upBNHt4gDTTKUfnFHAv8YWFBVTbvzhkaKguWefuxD57/uDKkSU7w
 ifJmPOb9iz7tBou+1ivkMHfnDKr3WgMqu588ajxCoHEIVDPiDSL74GmVrh35Ia8fUt
 j3V6WmOneMbSRy4z7PyxT0nfZ3+GUsmynK/ml3f1k+kJYC8X86r9FlMu30EyOktwkF
 KOYY3e+mmwTMw==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 40187A0096;
 Mon, 27 Jul 2020 05:13:52 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Subject: [PATCH] ARC: perf: don't bail setup if pct irq missing in device-tree
Date: Sun, 26 Jul 2020 22:13:45 -0700
Message-Id: <20200727051345.13382-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_011400_024361_02DEED34 
X-CRM114-Status: UNSURE (   8.92  )
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Current code inadventely bails if hardware supports sampling/overflow
interrupts, but the irq is missing from device tree. This need not be as
we can still do simple counting based perf stat.

This unborks perf on HSDK-4xD

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/kernel/perf_event.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
index 661fd842ea97..79849f37e782 100644
--- a/arch/arc/kernel/perf_event.c
+++ b/arch/arc/kernel/perf_event.c
@@ -562,7 +562,7 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
 {
 	struct arc_reg_pct_build pct_bcr;
 	struct arc_reg_cc_build cc_bcr;
-	int i, has_interrupts;
+	int i, has_interrupts, irq;
 	int counter_size;	/* in bits */
 
 	union cc_name {
@@ -637,13 +637,7 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
 		.attr_groups	= arc_pmu->attr_groups,
 	};
 
-	if (has_interrupts) {
-		int irq = platform_get_irq(pdev, 0);
-
-		if (irq < 0) {
-			pr_err("Cannot get IRQ number for the platform\n");
-			return -ENODEV;
-		}
+	if (has_interrupts && (irq = platform_get_irq(pdev, 0) >= 0)) {
 
 		arc_pmu->irq = irq;
 
@@ -652,9 +646,9 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
 				   this_cpu_ptr(&arc_pmu_cpu));
 
 		on_each_cpu(arc_cpu_pmu_irq_init, &irq, 1);
-
-	} else
+	} else {
 		arc_pmu->pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
+	}
 
 	/*
 	 * perf parser doesn't really like '-' symbol in events name, so let's
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
