Return-Path: <SRS0=PoFS=ZL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E54C47410
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 Nov 2019 14:42:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 313B02235E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 Nov 2019 14:42:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kbJCP819";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="fPtTti2L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 313B02235E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+4OPgM4KSTsmEGnESvNEL6Ip3LJs5iWQhrOWBZfHQY=; b=kbJCP819QB8PaS
	AtbaGbXeY8l/pDF5X+jjfvMuVaxl1oHuHjVN0yKpuo3TsG5YLMmspBqqnK0rIRXscVrf4M013o3pr
	DglaZg+T+XD7WBSPXnaQOO9jLbOnZro1hGGVGB1zwhNKRDPUfRfxDNI7skqnmE1Cv22fpQhEIcx93
	iqmgES/XrU8OqhAXEx8cUbJolkYIDuVQGvVWkswrDzDFzAC1Cy72LzpQm5Md+SGLwrbk3B/iExMp1
	J1xqGPESK/CCOZ/lBaZJOcL8FgroFxBhsGJXtGNotvWu2EOioCMdtavgetOkXTqkVnfQN4+JcjLg2
	jM3yVh9U1Vcs0Kl9g3dA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iX4hc-0008GE-GA; Tue, 19 Nov 2019 14:42:00 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iX4hZ-0008EH-RS
 for linux-snps-arc@lists.infradead.org; Tue, 19 Nov 2019 14:41:59 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D2D53C2577;
 Tue, 19 Nov 2019 14:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574174517; bh=y/UJ6x3VYOJt5fIAD/1jTDgF9YTH0srcaXkWR4OGbd0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fPtTti2LVDPM9DgKHzdr1nFE/0ZhNsu3lkSW1EvgO3qMMEaJ2jmBoYY+fZOcw3wet
 4EdJL/drirgbr5SPdnJATxMYvflcxei+311eYSEc1UqC+D4yqpKCOi/nGKgkhdq6NB
 u16RzcMaAu74XfVgGrgBi6L0/aE1I0JifzdswhnSTiI0o8P5Wx5USGSFXMu4s4BH6R
 3A8bzMEHS+c4px5RSnAnQ6d/OvzSX7T6t1HT0ObSi+yW3kRMRWeZXOr77t34lyHQGI
 aTJoi/sgyKANCULKv+0SvFWR9C2CVac6GPcWSdwoWLaDKWx6AYlA4glo4Jdv/4cjyv
 gn9EB64ZGggFw==
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.76])
 by mailhost.synopsys.com (Postfix) with ESMTP id A75AEA0069;
 Tue, 19 Nov 2019 14:41:53 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: dri-devel@lists.freedesktop.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 3/4] DRM: ARC: PGU: replace unsupported by HW RGB888 format by
 XRGB888
Date: Tue, 19 Nov 2019 17:41:46 +0300
Message-Id: <20191119144147.8022-4-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119144147.8022-1-Eugeniy.Paltsev@synopsys.com>
References: <20191119144147.8022-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191119_064157_931347_357DF73C 
X-CRM114-Status: UNSURE (   9.62  )
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
Cc: David Airlie <airlied@linux.ie>, linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

ARC PGU doesn't support RGB888 (24 bit) format but supports
XRGB888 (32 bit) format. Fix incorrect format list in a driver.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu_crtc.c | 6 +++---
 drivers/gpu/drm/arc/arcpgu_regs.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index 5473b19a52ee..980e00180e6f 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -22,7 +22,7 @@
 
 static const u32 arc_pgu_supported_formats[] = {
 	DRM_FORMAT_RGB565,
-	DRM_FORMAT_RGB888,
+	DRM_FORMAT_XRGB8888,
 };
 
 static void arc_pgu_set_pxl_fmt(struct drm_crtc *crtc)
@@ -44,9 +44,9 @@ static void arc_pgu_set_pxl_fmt(struct drm_crtc *crtc)
 
 	reg_ctrl = arc_pgu_read(arcpgu, ARCPGU_REG_CTRL);
 	if (format == DRM_FORMAT_RGB565)
-		reg_ctrl &= ~ARCPGU_MODE_RGB888_MASK;
+		reg_ctrl &= ~ARCPGU_MODE_XRGB8888;
 	else
-		reg_ctrl |= ARCPGU_MODE_RGB888_MASK;
+		reg_ctrl |= ARCPGU_MODE_XRGB8888;
 	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL, reg_ctrl);
 }
 
diff --git a/drivers/gpu/drm/arc/arcpgu_regs.h b/drivers/gpu/drm/arc/arcpgu_regs.h
index dab2c380f7f3..b689a382d556 100644
--- a/drivers/gpu/drm/arc/arcpgu_regs.h
+++ b/drivers/gpu/drm/arc/arcpgu_regs.h
@@ -25,7 +25,7 @@
 #define ARCPGU_CTRL_VS_POL_OFST	0x3
 #define ARCPGU_CTRL_HS_POL_MASK	0x1
 #define ARCPGU_CTRL_HS_POL_OFST	0x4
-#define ARCPGU_MODE_RGB888_MASK	0x04
+#define ARCPGU_MODE_XRGB8888	BIT(2)
 #define ARCPGU_STAT_BUSY_MASK	0x02
 
 #endif
-- 
2.21.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
