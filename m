Return-Path: <SRS0=PoFS=ZL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 662E3C432C3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 Nov 2019 14:42:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CC1D2231C
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 Nov 2019 14:42:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q79sM+IY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="lmcoumEq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CC1D2231C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCvvV03fm9bwqC++Tw2LuhkfbiLYM0DXHgpZ+ztbI/o=; b=Q79sM+IY5dmuC8
	XYdAivAZsGs4S4EwdG9Qf7Qguxa/LBbYmXhVrSsQ1MkKbVG5tYlCIQymPn8lBvy5Qthu2smc6wMq/
	LOr4cyV6dEqnDt+n3g7X0anE4Aq4QL9JSODdRzko8m91J242E1uOcBqRVLV7LnkQyRzx/0GO07tsr
	b2+H4TYnq7kkB5+pYqbJXY/+YOP1wYKj4AVwHdgZrfhv0c3Z4P4sxYHErgTEiFko1QY1nNR38qvpW
	WNuxdqifKNwApXvKdb7753Cex9LTNHlUtKZhJPg8lZM+iIegj1DthwTsmcY3k7LhdxB+QD3b7b9pb
	v4slcnWaToDM93suOZog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iX4hg-0008I0-KK; Tue, 19 Nov 2019 14:42:04 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iX4hd-0008HH-Rw
 for linux-snps-arc@lists.infradead.org; Tue, 19 Nov 2019 14:42:03 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 147B1C2579;
 Tue, 19 Nov 2019 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574174521; bh=ZWkYMPU199Ha5+2VkQ3merzs8RQFTg9Z2C7vXwrjAQE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lmcoumEql73Gt7gufxFUVndk5tPFqX+lygXfzwoBF5sAlyK34XuAUEuniDepeeIVX
 se9xf6g76XsP52MNWxZWbGeabdePfaS8rRIXFg7y6f+xOo+8+U/bplGUkA5NS0wvLQ
 q/2l6tqvtnxvOeahJQRx4v8JzCIUD18otbF0ul8ytbgJzBFEMNzsVkwao4ALij3A2W
 zmIPiHfjY/yBmhfsjGJYq+7MDjjASlo4wO62jiz0ooKt6oP9e0BkhVMpVII4bPSRNl
 hyP+EYYL6Y9uU5pmN59lohBQfUR8oP7s9PkTBhKjI7dyXtfRzxW6BYcC4HDusPsNZs
 9Zj28YXRD1l1w==
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.76])
 by mailhost.synopsys.com (Postfix) with ESMTP id 4EED4A006A;
 Tue, 19 Nov 2019 14:41:54 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: dri-devel@lists.freedesktop.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 4/4] DRM: ARC: PGU: add ARGB8888 format to supported format
 list
Date: Tue, 19 Nov 2019 17:41:47 +0300
Message-Id: <20191119144147.8022-5-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119144147.8022-1-Eugeniy.Paltsev@synopsys.com>
References: <20191119144147.8022-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191119_064201_915856_3A6B4EAD 
X-CRM114-Status: UNSURE (   9.60  )
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

As we ignore first 8 bit of 32 bit pixel value we can add ARGB8888
format as alias of XRGB8888.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu_crtc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index 980e00180e6f..8ae1e1f97a73 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -23,6 +23,7 @@
 static const u32 arc_pgu_supported_formats[] = {
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
 };
 
 static void arc_pgu_set_pxl_fmt(struct drm_crtc *crtc)
-- 
2.21.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
