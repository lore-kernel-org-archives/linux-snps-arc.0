Return-Path: <SRS0=KRsc=7R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DB5C433E3
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 17:39:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88F91206DC
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 17:39:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PsNhYuhA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EvI9B+FN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88F91206DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJTu0WeM0pJ7HmozrzgWEwtpW1RNtEY6/p7+bR8zV20=; b=PsNhYuhAvhrBSY
	b6kt/1KMeE9DzoUFcufnYE8dDLvVyyvJ3V8XSZl6ioa2iG6SRJNCs8K760HCypJdL4DD5wDP2yvQg
	SgZ+hd0inn/uAizWPaVXWcr3QoqxUKU9lrfnVWIgZ0Oq6ooXQSu64d+7iABvKJNJ0voDdrvqYMFo1
	uOeII4lUDxdHcfD/H1j+meo2u2bigimDSm40cTGIWo5eftrEXL9x0zqVxYKOBlndFy79Ft0/5sGpQ
	T3SI7emOSI7O6LmODpdSvTN/J9Dyu8bNJWQNo+3ILkfiiyj6tW/P1Xry2yEpe01ImijMbYG4s08wK
	aqCVoXMSenbctor+KPqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgtqO-0001HM-SN; Thu, 04 Jun 2020 17:39:56 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgtqL-0001Ep-AL
 for linux-snps-arc@lists.infradead.org; Thu, 04 Jun 2020 17:39:55 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F142340033;
 Thu,  4 Jun 2020 17:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591292391; bh=tWJlApZxqBzjb/+xC+Wsb7tJswMq+Z5yDSEHjqk8DOs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EvI9B+FN/mD2zSjKM4netyet9+KJ31lGrXFlLbNnbVtOalJbAB/Aa/doYSau5DRD2
 PmvEgB1cVZ0bcx1d4xESUxmfx39JmSeZ0qyR5dE1PSDqRKkbk/61GXlw2NrWn89yRB
 91Cp4IqDUz8mCqSu3iFEKFB6Bitv+/8l0RvpDdUe5CLX7+Y4+5pBfzY5+6cpnDyusg
 GT+0wsTi+BGglnILKtPMYcrwAhR+rX7MzHUVIOtLSZp/7IGiLUFSKsDMLt+LcrQhwB
 AQInEcB3A+q1ITm/4STsOPN35bm5z4K9csaAf9x+FPvozcEbXZo2y3YRuzSVpsdaHq
 Y4WdC4ChTEQhg==
Received: from paltsev-e7480.internal.synopsys.com
 (ru20-e7250.internal.synopsys.com [10.225.49.234])
 by mailhost.synopsys.com (Postfix) with ESMTP id 36888A0061;
 Thu,  4 Jun 2020 17:39:49 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH v2 1/4] ARC: allow to override default mcpu compiler flag
Date: Thu,  4 Jun 2020 20:39:24 +0300
Message-Id: <20200604173927.23127-2-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200604173927.23127-1-Eugeniy.Paltsev@synopsys.com>
References: <20200604173927.23127-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_103953_364597_3C7E24C1 
X-CRM114-Status: GOOD (  11.01  )
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

Kernel builds set their own default -mcpu for a given ISA build.
But that gets in the way of "custom" -mcpu flags from propagating
into kernel build.

This will also be used in next patches for HSDK-4xD board support which
uses a different -mcpu to effect dual issue scheduling.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/Kconfig  |  9 +++++++++
 arch/arc/Makefile | 21 +++++++++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index ff306246d0f8..7034c217708f 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -377,6 +377,15 @@ config ARC_HAS_SWAPE
 	bool "Insn: SWAPE (endian-swap)"
 	default y
 
+config ARC_TUNE_MCPU
+	string "Override default -mcpu compiler flag"
+	default ""
+	help
+	  Override default -mcpu=xxx compiler flag (which is set depending on
+	  the ISA version) with the specified value.
+	  NOTE: If specified flag isn't supported by current compiler the
+	  ISA default value will be used as a fallback.
+
 if ISA_ARCV2
 
 config ARC_USE_UNALIGNED_MEM_ACCESS
diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 20e9ab6cc521..2b66e8264174 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -10,8 +10,25 @@ CROSS_COMPILE := $(call cc-cross-prefix, arc-linux- arceb-linux-)
 endif
 
 cflags-y	+= -fno-common -pipe -fno-builtin -mmedium-calls -D__linux__
-cflags-$(CONFIG_ISA_ARCOMPACT)	+= -mA7
-cflags-$(CONFIG_ISA_ARCV2)	+= -mcpu=hs38
+
+tune-mcpu-def-$(CONFIG_ISA_ARCOMPACT)	:= -mA7
+tune-mcpu-def-$(CONFIG_ISA_ARCV2)	:= -mcpu=hs38
+
+ifeq ($(CONFIG_ARC_TUNE_MCPU),"")
+cflags-y				+= $(tune-mcpu-def-y)
+else
+tune-mcpu				:= $(shell echo $(CONFIG_ARC_TUNE_MCPU))
+tune-mcpu-ok 				:= $(call cc-option-yn, $(tune-mcpu))
+ifeq ($(tune-mcpu-ok),y)
+cflags-y				+= $(tune-mcpu)
+else
+# The flag provided by 'CONFIG_ARC_TUNE_MCPU' option isn't known by this compiler
+# (probably the compiler is too old). Use ISA default mcpu flag instead as a safe option.
+$(warning ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '$(tune-mcpu)' is unknown, fallback to '$(tune-mcpu-def-y)')
+cflags-y				+= $(tune-mcpu-def-y)
+endif
+endif
+
 
 ifdef CONFIG_ARC_CURR_IN_REG
 # For a global register defintion, make sure it gets passed to every file
-- 
2.21.3


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
