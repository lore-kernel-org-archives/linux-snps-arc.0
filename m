Return-Path: <SRS0=PoFS=ZL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5A1C33C8C
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 Nov 2019 14:41:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3E9D2231C
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 Nov 2019 14:41:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ekk2Pp7O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZcPGV1yu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3E9D2231C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UnGvDExZIZim7VH+/6MduckOqB8V/6Ote/T7/GIQtGk=; b=ekk2Pp7OPid/Kq
	PAhuyvMC6y42S4sNkoaTDeIqvjhw8PeJDX+SZ8VGOP1G8lUUAjBVfnXOdWpBX09i/3Vbc72KWn7o/
	I+PSKwb6QQ/STG2mEUOYGcWINNpDjHN2oNphISR9l9CwXIs8TuOVSppXE2fTv24qUofQeKpZxpeZg
	2hqXSpwXLM4gMTCD6HO1Y2BKzwe6ndEvuZ6PxBjhiB2WeznFvX+qUEptYh1tP34a6e3PuFIiCMkFF
	ym49S7uhvbXMnSJzkOyPEg/Hk5k4SwXlnOSebIuWvsccjmCr/nvrPEySNgmVUoVA9ZicMV7nRxMqD
	DePqN09nQl5STlt7KbDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iX4hZ-0008Eh-Vy; Tue, 19 Nov 2019 14:41:57 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iX4hY-0008DS-9d
 for linux-snps-arc@lists.infradead.org; Tue, 19 Nov 2019 14:41:57 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C9CCDC04B6;
 Tue, 19 Nov 2019 14:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574174515; bh=G4p50MA5mFWmjXCuDGR29jySUNUSgvmL37nTesfoCHE=;
 h=From:To:Cc:Subject:Date:From;
 b=ZcPGV1yuUi+weiF9t/xM5EPXYfLagwjWjkAIv41Z/Tb9YhloRYkFVkVSN4aBJxX1L
 fKKxGwZqQ81oK7aA7+1wcFJmX1Gj80q908fv4/CXFhoA3mgnzXNt0g9kqU2D9Eh1sE
 zP13Eqh3bCqaHxMi3wEUjUQByO4Ylb9r1a5i45R7RiIMrCwMD/7hShOV/3VttUDC3z
 vuQHLbj0ldkCZDuOOryPvWlb/xbR3dzJG6xfqzSEUo+qMMtAyScWnsGVkXotopcx4E
 phr7wAJJ0fTCKqHV9NVAmVD54l9/M36we+9zdvullHtRBqnDE9Oik1qV9rEkZm/iah
 rA/cm0sZo8Njg==
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.76])
 by mailhost.synopsys.com (Postfix) with ESMTP id DEEC8A005D;
 Tue, 19 Nov 2019 14:41:50 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: dri-devel@lists.freedesktop.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 0/4] DRM: PGU: ARC: fixies related to framebuffer format
Date: Tue, 19 Nov 2019 17:41:43 +0300
Message-Id: <20191119144147.8022-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191119_064156_384343_DC6E2F6D 
X-CRM114-Status: UNSURE (   6.21  )
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

Eugeniy Paltsev (4):
  DRM: ARC: PGU: fix framebuffer format switching
  DRM: ARC: PGU: cleanup supported format list code
  DRM: ARC: PGU: replace unsupported by HW RGB888 format by XRGB888
  DRM: ARC: PGU: add ARGB8888 format to supported format list

 drivers/gpu/drm/arc/arcpgu_crtc.c | 36 +++++++++++++++----------------
 drivers/gpu/drm/arc/arcpgu_regs.h |  2 +-
 2 files changed, 19 insertions(+), 19 deletions(-)

-- 
2.21.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
