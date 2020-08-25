Return-Path: <SRS0=ZTsv=CD=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4999C433E3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Aug 2020 18:05:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD0E1206EB
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Aug 2020 18:05:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dpD70wUa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HB8Wp3ds"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD0E1206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t80NVU9NahtxCqCL6cNkyDHLkks4XtrTBZj5ng9b9is=; b=dpD70wUauynGrYhbjE41DsSu0
	nW3GJ5DXYJpjqHJhD2Pbrbd74jtCT3PI6gKPGT0ZZQvJ/GHY2UJCUU5Sm4qMO9qhwdf5XUM30Mtzv
	IHUcZswQvn38ZYFIK1jJBviC08v7p6nC/9zEVBslamROwTIpkb2NwCVVN6aIkl4b4e9VBmC4yhv2P
	DMkYQ3VIiHvQ3gGDPggViYFrv/H3bMzz2w3RQtcgSFDLfiCF9mgPcBn8UU3RDo6wd7QnlLOAVeUDr
	Y14fmdPc9N9vTrkm1uEsrbuTWqeloiLOA92Dl38DfVqXhKdZ4kheQogKX2fu+q2T7BiiX2KXDz8LD
	qXP26fTIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAdK6-0005Xf-55; Tue, 25 Aug 2020 18:05:30 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAdK3-0005Wy-GG
 for linux-snps-arc@lists.infradead.org; Tue, 25 Aug 2020 18:05:28 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EB511C0BE0;
 Tue, 25 Aug 2020 18:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1598378724; bh=IcUtOy6AzwoGn6Jt34sVTfbc2thdkUgAmx/C0WQaJiI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HB8Wp3dsX8ibNfBtmsc+/wY0IbLw6j5plUU8VJZKrtLAusHHDQGzR/MMX70R6euIP
 +3eMikYKG9hJmiWnV2R3kAOoJDyj3/ZIy4KRjz0dkerH2InEVOPCndPUbIv16yOP/p
 kYtJedniq5yXWU+QEV+VUpOttiTYJjSgy29KXArQ2pXWQgWy2h0RrctvzzxnnKUHxA
 OnkjIHa7FZRO7mb56eax418uATNW+5D9s6hl6C/2NPBG2DL3UgoyO6PjfSinea3Jhi
 0aSDKhHKVp8QRTmWSgCijceKhcIJoiUksnouzgZlY25HtKF2+PdQNRBvDmDdePjpHx
 u+LKSsLF6ouow==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 6139DA005A;
 Tue, 25 Aug 2020 18:05:20 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Subject: [PATCH v2] irqchip/eznps: Fix build error for !ARC700 builds
Date: Tue, 25 Aug 2020 11:05:18 -0700
Message-Id: <20200825180518.25300-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825072152.725jmtlcqah5oos4@linutronix.de>
References: <20200825072152.725jmtlcqah5oos4@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_140527_731486_C9F38BFD 
X-CRM114-Status: GOOD (  12.56  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-kernel@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

eznps driver is supposed to be platform independent however it ends up
including stuff from inside arch/arc headers leading to rand config
build errors.

Fix this specific reported error as quick hacks as the correct fixes are
too much work:
 - copy AUX_IENABLE from arch/arc header
 - move CTOP_AUX_IACK from platform header

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Link: https://lkml.kernel.org/r/20200824095831.5lpkmkafelnvlpi2@linutronix.de
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/plat-eznps/include/plat/ctop.h | 1 -
 include/soc/nps/common.h                | 6 ++++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arc/plat-eznps/include/plat/ctop.h b/arch/arc/plat-eznps/include/plat/ctop.h
index a4a61531c7fb..77712c5ffe84 100644
--- a/arch/arc/plat-eznps/include/plat/ctop.h
+++ b/arch/arc/plat-eznps/include/plat/ctop.h
@@ -33,7 +33,6 @@
 #define CTOP_AUX_DPC				(CTOP_AUX_BASE + 0x02C)
 #define CTOP_AUX_LPC				(CTOP_AUX_BASE + 0x030)
 #define CTOP_AUX_EFLAGS				(CTOP_AUX_BASE + 0x080)
-#define CTOP_AUX_IACK				(CTOP_AUX_BASE + 0x088)
 #define CTOP_AUX_GPA1				(CTOP_AUX_BASE + 0x08C)
 #define CTOP_AUX_UDMC				(CTOP_AUX_BASE + 0x300)
 
diff --git a/include/soc/nps/common.h b/include/soc/nps/common.h
index 9b1d43d671a3..8c18dc6d3fde 100644
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
