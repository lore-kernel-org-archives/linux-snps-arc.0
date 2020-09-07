Return-Path: <SRS0=uRvJ=CQ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DCEC433E2
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Sep 2020 16:37:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C358821927
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Sep 2020 16:37:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EidmUVoW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="wU5cYWoW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C358821927
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EB0kShipOJtazB8gFNq/GxFr0m2tHhtGM3XbhBtRLiw=; b=EidmUVoWdFTSwLg5aXK7LEjrQ
	x58pZpqUEC0ZoNqpuWPIswhUuogQon3aU1n+vYYi7nkB/8iCLU/ol5uH/DQXWFRD1h9Z2gCt+BIUs
	YUkHneaLRaiGrtrLuvHaFCbjW/Rak5/SjQYCvqZ1fo+S/LBrec4Q7rmtosvoPcU+U7pw5MM9/cAAR
	AiSoqCD2i6wdRO2KkQwGmJNkHPRByoPi8mwkLEO0hMPdEOdTKpKJrGVJd0I89gOeFvVou6yQo6cNI
	K86RzjMrB4Jzf80Hjyl8XNHiM7QOHZbczL24Qlxuvb1saeIS2chMQJiC4tyzcrbJwZnl2xQvn3i/T
	YmN5Esj8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFK91-0007PK-59; Mon, 07 Sep 2020 16:37:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFK6O-00067V-WA
 for linux-snps-arc@lists.infradead.org; Mon, 07 Sep 2020 16:35:00 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 38B9321941;
 Mon,  7 Sep 2020 16:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599496482;
 bh=Y7DfL2QIoK+7AlOig5I7K0jPWLIoatifmL4WfTHq3TM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wU5cYWoWfEY0BQuvEWxe/e2AwGO8id46R4BBHmf6ovpSPI+sUjN77Fi8VqEq0fOw/
 QcK3phqLfxDqDaz8TAcUIo3f8qpnH2IeBegrl9WXESPU1D/4pGWiSfP9BRoZqw7SAs
 FuLSxOwG1RwqUeeLa6ujn8dCHy4sTnJjxKy+R/OA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 12/26] irqchip/eznps: Fix build error for !ARC700
 builds
Date: Mon,  7 Sep 2020 12:34:12 -0400
Message-Id: <20200907163426.1281284-12-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907163426.1281284-1-sashal@kernel.org>
References: <20200907163426.1281284-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_123445_132198_2556709B 
X-CRM114-Status: GOOD (  14.12  )
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
Cc: Sasha Levin <sashal@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-snps-arc@lists.infradead.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Vineet Gupta <vgupta@synopsys.com>

[ Upstream commit 89d29997f103d08264b0685796b420d911658b96 ]

eznps driver is supposed to be platform independent however it ends up
including stuff from inside arch/arc headers leading to rand config
build errors.

The quick hack to fix this (proper fix is too much chrun for non active
user-base) is to add following to nps platform agnostic header.
 - copy AUX_IENABLE from arch/arc header
 - move CTOP_AUX_IACK from arch/arc/plat-eznps/*/**

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Link: https://lkml.kernel.org/r/20200824095831.5lpkmkafelnvlpi2@linutronix.de
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/plat-eznps/include/plat/ctop.h | 1 -
 include/soc/nps/common.h                | 6 ++++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arc/plat-eznps/include/plat/ctop.h b/arch/arc/plat-eznps/include/plat/ctop.h
index 4f6a1673b3a6e..ddfca2c3357a0 100644
--- a/arch/arc/plat-eznps/include/plat/ctop.h
+++ b/arch/arc/plat-eznps/include/plat/ctop.h
@@ -43,7 +43,6 @@
 #define CTOP_AUX_DPC				(CTOP_AUX_BASE + 0x02C)
 #define CTOP_AUX_LPC				(CTOP_AUX_BASE + 0x030)
 #define CTOP_AUX_EFLAGS				(CTOP_AUX_BASE + 0x080)
-#define CTOP_AUX_IACK				(CTOP_AUX_BASE + 0x088)
 #define CTOP_AUX_GPA1				(CTOP_AUX_BASE + 0x08C)
 #define CTOP_AUX_UDMC				(CTOP_AUX_BASE + 0x300)
 
diff --git a/include/soc/nps/common.h b/include/soc/nps/common.h
index 9b1d43d671a3f..8c18dc6d3fde5 100644
--- a/include/soc/nps/common.h
+++ b/include/soc/nps/common.h
@@ -45,6 +45,12 @@
 #define CTOP_INST_MOV2B_FLIP_R3_B1_B2_INST	0x5B60
 #define CTOP_INST_MOV2B_FLIP_R3_B1_B2_LIMM	0x00010422
 
+#ifndef AUX_IENABLE
+#define AUX_IENABLE				0x40c
+#endif
+
+#define CTOP_AUX_IACK				(0xFFFFF800 + 0x088)
+
 #ifndef __ASSEMBLY__
 
 /* In order to increase compilation test coverage */
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
