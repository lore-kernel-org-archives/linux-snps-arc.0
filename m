Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94165C10F27
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 13:13:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64FAF22464
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 13:13:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uWlE56fX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BU1UKVUw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64FAF22464
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YALc2SAP/Zm4QhO+C4vyc0ZdyZYgdJcbwqKS3sRnIBM=; b=uWlE56fXYL1zMo
	RhVPCxB34f5narJuPgDOm8XJNFWNH/t9+PECPNBqYsg+hWuj0hWmFqO4PN7IeJkLz/IYaMkTbaOMC
	7mrpeb4D4JQuDA+bT3YW1GpXykYj96JAje+TqRbnD3c5Q3oxcrkJT9sz5M4IS/ipIm0RV1XG9Z9JV
	Ng0am4bLt6OnieQBXHuz2SJWD6MqJVigEFbI+o8q4k5KMC6RuiHlNgdPeaDM+iluORz7i61bdNsw2
	o1/+rrvwHnccF/yhMWLzLlKpNu86or9ml9C+vk/c6kTB2O5d6pU2vzruFbEYE7NAyVGr0esFFPvfu
	i6hCJ5yO74jHW6EOOyrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC1Av-00071K-Dq; Wed, 11 Mar 2020 13:13:29 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC1Ao-0006rn-3s
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 13:13:23 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0286243B45;
 Wed, 11 Mar 2020 13:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583932400; bh=8rfNPQeTls9UibHljNnu2AKJ+S9mqQvjUSn2bsEDSsY=;
 h=From:To:Cc:Subject:Date:From;
 b=BU1UKVUwEwWyrOTAzHEIBxtutkZiEm1pm8ctfu39cHnyOZe33JwSZcixhmW+wSjPG
 pl0gbq6eDXHKAEaJ3Z5zU/7v4kt582lVAiCbht3QF6f3F4dkLjUl+m57z/zLoGFtwh
 MWSErBoAlaq4AFey3pIIIzZUVz7VVUgUKnU8/ODBkKZ2cXqABO7aIGow2kSJqYcRJS
 nx13U+d1cxkHtcwaQNZMq4xM4G2M57j/bcK1qdo3qelXpPoVMi5qti8n1rk9VcoEoW
 ooKWn6aKHCWy20NdxIDN/IDdTN/vokJwSdqFag9gpOkQtNtbuPeknJEhnii1KVxZv9
 KCdWZUmGbXR6w==
Received: from paltsev-e7480.internal.synopsys.com (unknown [10.121.8.79])
 by mailhost.synopsys.com (Postfix) with ESMTP id 49BFCA005C;
 Wed, 11 Mar 2020 13:13:16 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: dri-devel@lists.freedesktop.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH] DRM: ARC: PGU: interlaced mode not supported
Date: Wed, 11 Mar 2020 16:13:10 +0300
Message-Id: <20200311131310.20446-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_061322_160290_5A5B828A 
X-CRM114-Status: UNSURE (   8.89  )
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Filter out interlaced modes as they are not supported by ARC PGU
hardware.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 drivers/gpu/drm/arc/arcpgu_crtc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
index 8ae1e1f97a73..c854066d4c75 100644
--- a/drivers/gpu/drm/arc/arcpgu_crtc.c
+++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
@@ -67,6 +67,9 @@ static enum drm_mode_status arc_pgu_crtc_mode_valid(struct drm_crtc *crtc,
 	long rate, clk_rate = mode->clock * 1000;
 	long diff = clk_rate / 200; /* +-0.5% allowed by HDMI spec */
 
+	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
+		return MODE_NO_INTERLACE;
+
 	rate = clk_round_rate(arcpgu->clk, clk_rate);
 	if ((max(rate, clk_rate) - min(rate, clk_rate) < diff) && (rate > 0))
 		return MODE_OK;
-- 
2.21.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
