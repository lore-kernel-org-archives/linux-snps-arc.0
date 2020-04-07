Return-Path: <SRS0=cI6t=5X=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F49C2D0EC
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Apr 2020 20:07:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 719A12075E
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Apr 2020 20:07:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dl5chsYs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="gf0FiKG7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 719A12075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qGt3xYtG6ol+DuQNVfxr1X54y6C1qiObRPOMp6+vAcs=; b=dl5chsYsY3NvWU
	9BRCjv3v9qUCZtLHvj8Hn0dyxMwnH/yrTEc3O2nGE8fKleiwAK6yfPmsi/L4sSyDYPisSUFNZxWA2
	axxCicke/03QRSH23FTMCjMIbAdaIu+EAs/mAjYHfrxxXM01Lauf/4diHACpHzaiQqxUp0L42fQyY
	UT0aqJAaGITb8FurNzSoMW8pbGX0D/554GargZt2dlUjAyXZEBV/4DGXLw5MjPE+1hb+KQmp/2wyD
	tryU9MPqZsfdHiwz3XbObUCYEw8auZ806IQcTRg2xgI5fQBR8VYDzqyCJw70LpGeNhbdxfa9BwxYI
	ieyKgXSSyAy5MBzJLyrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLuUy-0006RK-3R; Tue, 07 Apr 2020 20:07:04 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLuUv-0006Qh-4s
 for linux-snps-arc@lists.infradead.org; Tue, 07 Apr 2020 20:07:02 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 86FF2C009F;
 Tue,  7 Apr 2020 20:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586290020; bh=NrhHNH3f+3FQE+9DPc/+IuZm7ze9b7W1iIHaLrTu378=;
 h=From:To:Cc:Subject:Date:From;
 b=gf0FiKG7/WzEnZJtMc01f2npq2NV+VghtZTUbh/WVkUVfxtNQgKcClL5XCcbDwoHF
 1JEvvYP99/aJekihiIdW2egHnEA4ZUyxfcrG7doJcvm35oZtOdHpAP18aVFu4FGFE0
 Z+FP+1HpYAN/qnXPtiRKk2YPXpfooGLcoN2WeMj/xDOaeQAvAaFJuhewMUHs7U4vxV
 bmkO6eFZFoxgoErVyoQV7veLl6qRecAQWt8wu5Vc5Pk8eiA3n9zm1PvZXg5SbXJgTB
 yg/n1q8GS5tzI1jzGTUb6IrhWnGamqC8mD81W3QwCh0cY4HOANz5bLNT5hJ5O0ot2s
 y1WCjCyQICkLw==
Received: from paltsev-e7480.internal.synopsys.com
 (ru20-e7250.internal.synopsys.com [10.225.49.23])
 by mailhost.synopsys.com (Postfix) with ESMTP id 35A64A005C;
 Tue,  7 Apr 2020 20:06:54 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH v2] ARC: [plat-hsdk]: fix USB regression
Date: Tue,  7 Apr 2020 23:06:42 +0300
Message-Id: <20200407200642.12749-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_130701_221198_E4AE6F39 
X-CRM114-Status: UNSURE (   9.73  )
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
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

As of today the CONFIG_USB isn't explicitly present in HSDK defconfig
as it is implicitly forcibly enabled by UDL driver which selects CONFIG_USB
in its kconfig.
The commit 5d50bd440bc2 ("drm/udl: Make udl driver depend on CONFIG_USB")
reverse the dependencies between UDL and USB so UDL now depends on
CONFIG_USB and not selects it. This introduces regression for ARC HSDK
board as HSDK defconfig wasn't adjusted and now it misses USB support
due to lack of CONFIG_USB enabled.

Fix that.

Cc: <stable@vger.kernel.org> # 5.6.x
Fixes: 5d50bd440bc2 ("drm/udl: Make udl driver depend on CONFIG_USB")
Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
Changes v1->v2:
 * fix typo, add tag for stable

 arch/arc/configs/hsdk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/configs/hsdk_defconfig b/arch/arc/configs/hsdk_defconfig
index 0974226fab55..aa000075a575 100644
--- a/arch/arc/configs/hsdk_defconfig
+++ b/arch/arc/configs/hsdk_defconfig
@@ -65,6 +65,7 @@ CONFIG_DRM_UDL=y
 CONFIG_DRM_ETNAVIV=y
 CONFIG_FB=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
+CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
 CONFIG_USB_OHCI_HCD=y
-- 
2.21.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
