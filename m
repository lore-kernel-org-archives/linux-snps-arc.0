Return-Path: <SRS0=GdQW=7L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7AEC433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 11:58:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1670720776
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 11:58:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d/cZ4p5z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="EYl+2DGG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1670720776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3GAO5vgB6xB9+p1mWbIyjaQ5f7JD+isNFOglizLE89g=; b=d/cZ4p5zjA03CB
	ApnDcG7N6R4mzKryYeTq9W6c0z+2lh52vyyPAP2ln/+b6unOHG8K4RQ1LTPaOzv3yJacNntxQwbLw
	EImPPeXDzDi9uNs59walRsZ4WHMWWKqZDUH4bvvd7PChrJNG7U38Z90P2v1KkXCZRgUjZjfw7seWl
	1ki8UPLTRSUpmO9x6m3h6PgySjhLU4W2wfvCSSakH8aekTcFh3f5jW/5uA6G4C/y+1To6G2wzZWyN
	JEPYBwJXs9hY80fwpzTzrDVdz9bPm5tARaFa4SFCDY6DktJ/ah6Bz+8xzzry0gHm3Vz0LsyyMnJnz
	4EAl3WFDZ3ldECyWBG4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jedeB-0007zH-Dw; Fri, 29 May 2020 11:57:59 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jede8-0007m4-MH
 for linux-snps-arc@lists.infradead.org; Fri, 29 May 2020 11:57:57 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 378AEC03B4;
 Fri, 29 May 2020 11:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1590753354; bh=4tHxSBkm1m3j6WDpl6aUjwp+PqWpmQzY0kj71pY8N/M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EYl+2DGGka2JLbMyxCQCsVi+jOsRthQ1TxJLGOHMrUt3kqk8DuGGyDi/BT9iBgosC
 XzeCMD/UlphfSakd7L5vGkXQyynDwe3DHa04mu2BtgMH5kvMSTjKO5QOhj4H2J2NKD
 W+w5HREfg1qB9sPTs9MWaixUjzu5LUb4ORWpKq1fbrMfcnVqZ5Fx4sjj0bAgngKudz
 h7yeUtEH9Tq0aQ3m3qz1qGiWGSka6wwOvFoVmtc6oQnRXFCirgTLaC6f1PF8b/WEMn
 ILf0Y2BI3hnOl9JMUFvWwtgUrew5/i6VbHB4vKWdAl9odmUr6YBnLrIuSz/9+bWJzI
 yYBSp9MreQLRg==
Received: from paltsev-e7480.internal.synopsys.com
 (ru20-e7250.internal.synopsys.com [10.225.50.16])
 by mailhost.synopsys.com (Postfix) with ESMTP id A2760A005D;
 Fri, 29 May 2020 11:55:52 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 1/3] ARC: allow to overide default mcpu compiler flag
Date: Fri, 29 May 2020 14:55:31 +0300
Message-Id: <20200529115534.22883-2-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200529115534.22883-1-Eugeniy.Paltsev@synopsys.com>
References: <20200529115534.22883-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_045756_761903_394D6444 
X-CRM114-Status: UNSURE (   9.27  )
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

By default we set -mcpu=xxx compiler flag depending on the CPU ISA
version. It's good starting point, however that may be not enough
as for some platforms we may want to use some specific 'mcpu'
options for better optimization or to workaround HW issues.

We are going to use this option for HSDK-4xD board support.
In addition it also allows to awoid patching 'mcpu' in ARC Makefile
when we building Linux for some non-standard simulation or FPGA-based
platforms.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/Kconfig  | 7 +++++++
 arch/arc/Makefile | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index ff306246d0f8..2d4f85dc914e 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -377,6 +377,13 @@ config ARC_HAS_SWAPE
 	bool "Insn: SWAPE (endian-swap)"
 	default y
 
+config ARC_TUNE_MCPU
+	string "Overide default -mcpu compiler flag"
+	default ""
+	help
+	  Overide default -mcpu=xxx compiler flag (which is set depending on
+	  the ISA version) with the specified value.
+
 if ISA_ARCV2
 
 config ARC_USE_UNALIGNED_MEM_ACCESS
diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 20e9ab6cc521..eb88ba5b1573 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -10,8 +10,12 @@ CROSS_COMPILE := $(call cc-cross-prefix, arc-linux- arceb-linux-)
 endif
 
 cflags-y	+= -fno-common -pipe -fno-builtin -mmedium-calls -D__linux__
+ifeq ($(CONFIG_ARC_TUNE_MCPU),"")
 cflags-$(CONFIG_ISA_ARCOMPACT)	+= -mA7
 cflags-$(CONFIG_ISA_ARCV2)	+= -mcpu=hs38
+else
+cflags-y			+= $(shell echo $(CONFIG_ARC_TUNE_MCPU))
+endif
 
 ifdef CONFIG_ARC_CURR_IN_REG
 # For a global register defintion, make sure it gets passed to every file
-- 
2.21.3


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
