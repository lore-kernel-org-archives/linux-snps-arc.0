Return-Path: <SRS0=PoFS=ZL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8F8C432C0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 Nov 2019 15:26:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E10F222D1
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 Nov 2019 15:26:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T6ZerwQX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="W9MTRIqg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E10F222D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jo9/QzWxH0hohYBc1pw7kxXaVbxDLoOaFOqJVhaHHaY=; b=T6ZerwQXy5saoC
	rhl8CDtUC0gJm8c8wuSp6v9e5bcCMTJD1prhDcDkWldfp+CfWAXbJwpSYsV4dmrmk73V3rDnTNC5T
	NZVJwzhx+SV9NRAXpYYYLrsfexb/ZN2MJQgbpJUb1OSve30YYJVvHmSYHLHCJmma+wUMvUFbXDQ9h
	8r/8e6lG+yTYW4BtWN7idYKXj/sguC7gJ92GpWeKYdnId8An+A4TlUV9DJRapdsMgRq4/Nqgg4uzz
	avTkvUmPdyQmRSxA6QitK2nILOGY9Uru2BKrljtPPOa4EhkvjcV3SC5gbHfxma835N8f43ggLP/Wl
	x5Yn3ZhY8iUNN+q294AA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iX5OX-0008RE-RN; Tue, 19 Nov 2019 15:26:21 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iX5OV-0008Qf-QU
 for linux-snps-arc@lists.infradead.org; Tue, 19 Nov 2019 15:26:21 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5E4B0C2584;
 Tue, 19 Nov 2019 15:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574177179; bh=mgDty1pLbITJzm26Ei8U20OJqO/x9UJ2NsqDSy4MQbs=;
 h=From:To:Cc:Subject:Date:From;
 b=W9MTRIqgL7Wxs/n1aQ7kP1f1q4jgrGeD3IeXO8qvoO4WBksKQL5M0IncIniFM15KW
 tWpxibs2Myq9gzzaAQoEE0tvbEey7qZOydUQh1r8/AGnaQnRJhILkzxGaWkQEYdsEe
 Eu2TbKBKJ/Le0+x8jm96aKdwZ+2BVPu3+JISh/OWCrpsbvqZJ9prB9arirtVMWKVX3
 04nDjqnInhZieeUxbWbqCy0h76rzbAgjd4CH7hMRiP5ZXtJTBcumbKYHqurhtrW/3M
 EeuMgGiGgTmXWGnVtg0l9h+xfBbTi58qA4V8UP3XTpktPNm+VGwtM0Q70K3Ky3QFq5
 kJaseiUa5eNKQ==
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.76])
 by mailhost.synopsys.com (Postfix) with ESMTP id A5DA2A0057;
 Tue, 19 Nov 2019 15:26:17 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH] ARC: add kmemleak support
Date: Tue, 19 Nov 2019 18:26:15 +0300
Message-Id: <20191119152615.14078-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191119_072619_867643_C8F7E1F7 
X-CRM114-Status: UNSURE (   9.59  )
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

kmemleak is used internally for a long time and as there isn't
any issue with it we can finally enable it in upstream.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 8383155c8c82..c147ebe51b65 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -30,6 +30,7 @@ config ARC
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_DEBUG_STACKOVERFLOW
+	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_FUTEX_CMPXCHG if FUTEX
 	select HAVE_IOREMAP_PROT
 	select HAVE_KERNEL_GZIP
-- 
2.21.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
