Return-Path: <SRS0=7PLC=NA=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFD9C4320A
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Aug 2021 00:00:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ECE260F11
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Aug 2021 00:00:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6ECE260F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EGfD4/t1gjS8tzKsCfH3esEF+DW2tUv5i4Tn2OAlPyQ=; b=YJt1kWtG0K/wQb
	5AkuINjXTbaPjL1ToCphrMxwJIoRhcZtKM48lEB38+7i/kXcTBQyaMiE0fXd/+oMl3lBK1Ob/sJrq
	M+JlHub9pt3BTcddK3DEWHuAjpDT93Yj/+0gsFm7AoOmzZ0shLPo+oJW3j6yGuo/d7jnepYMIPxDZ
	wAX+dy5K7VmJsqwuVQLVmIIyDKq0P1c3rjmgl3uq+EZ+32USkCnIrzvl7+ik544aEM6F9POpZWZAw
	hH1PA8Tzo4ufQ71SYdA1qeeyQJ6YsSzHv3qmIfw6iAjLfgACF+lkQ1kH5q8eALlTIgiSq950dhY7q
	LxyeCi2S2dMfqy8eoIEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCsiW-00Gknz-SV; Mon, 09 Aug 2021 00:00:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCsiU-00GknL-P8
 for linux-snps-arc@lists.infradead.org; Mon, 09 Aug 2021 00:00:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79C2E60F42;
 Mon,  9 Aug 2021 00:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628467229;
 bh=qEHa2hDDngTAlBTuJT4LlegTNZ05RrFHw4VWLdRzQRU=;
 h=From:To:Cc:Subject:Date:From;
 b=i0SK2sk5DEpxN2Ph+N9gBJuAOdOT244GMQJGFnzKZBtfr9H0n6kBtsngkQiw165tu
 BzpHphiusTY45d6N2RzJlXCb+oZ5x7ah0whip/2Ht2HYqO2tBcjwVxbmWIev+5Ou+I
 CKzkTj5k1mZR67BKqKDIfUNC5GUfLsVXew2HXPdGmZMn7h0lhHnLvaynjD8TG4WZ7l
 fVbVk+8BTU5LmVwWU+DIIL7kgPfDpHFUaw4SgDQfV2EJeTUab48PRGcgXrU/Dwlyap
 9KRv2h2bKN+Fk8B8AYYNJt2tPvrFCFtuT8LyH/xvp6NOcxivEUnNVWArwP+YhbEbkO
 IUrLmeEGf+gWg==
From: vgupta@kernel.org
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Vineet Gupta <vgupta@synopsys.com>
Subject: [RFC 1/2] ARC: retire ARC750 support
Date: Sun,  8 Aug 2021 17:00:24 -0700
Message-Id: <20210809000025.2348004-1-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_170030_879712_419456C9 
X-CRM114-Status: UNSURE (   7.56  )
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

From: Vineet Gupta <vgupta@synopsys.com>

There's no known/active customer using them with latest kernels anyways.

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/Kconfig | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index d8f51eb8963b..3015788a7094 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -116,16 +116,9 @@ choice
 	default ARC_CPU_770 if ISA_ARCOMPACT
 	default ARC_CPU_HS if ISA_ARCV2
 
-if ISA_ARCOMPACT
-
-config ARC_CPU_750D
-	bool "ARC750D"
-	select ARC_CANT_LLSC
-	help
-	  Support for ARC750 core
-
 config ARC_CPU_770
 	bool "ARC770"
+	depends on ISA_ARCOMPACT
 	select ARC_HAS_SWAPE
 	help
 	  Support for ARC770 core introduced with Rel 4.10 (Summer 2011)
@@ -135,8 +128,6 @@ config ARC_CPU_770
 	  -Caches: New Prog Model, Region Flush
 	  -Insns: endian swap, load-locked/store-conditional, time-stamp-ctr
 
-endif #ISA_ARCOMPACT
-
 config ARC_CPU_HS
 	bool "ARC-HS"
 	depends on ISA_ARCV2
@@ -275,7 +266,6 @@ config ARC_DCCM_BASE
 choice
 	prompt "MMU Version"
 	default ARC_MMU_V3 if ARC_CPU_770
-	default ARC_MMU_V2 if ARC_CPU_750D
 	default ARC_MMU_V4 if ARC_CPU_HS
 
 if ISA_ARCOMPACT
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
