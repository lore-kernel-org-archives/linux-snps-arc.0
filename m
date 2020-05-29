Return-Path: <SRS0=GdQW=7L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14BEC433E1
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 11:55:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86AB3207F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 11:55:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d9UZ4bWM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="HRGJQXJr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86AB3207F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ojttHmS4ZR/HKWEECvdM5zyCkRsJOdzUitSTPwTm2wo=; b=d9UZ4bWMfin3R6
	14UaFSqTn8GnV06Fx6usOAILA3vt3IS6txG2OVqvmNDzKoQ5MHAVlRaeIUU6fScusx/+gZn+OxF9W
	leZvr7idVaJF8hfB4LFyDi0HyU6aH11qfpePPFOwKfZ0wxwam66n1agklqsILwW0UWaV4nPZv0jGR
	rCgDh+Ugjs3YX4APW+YiLMUfj1QiVGDHU55s/PPzUPhVeMLCU9ZkjxCLJzgyIjTR0aiN8c6Uw5Hd6
	arNgTgnB1rtbxsz4vN8ajBk3dGA0VwKg5H0V80phxETs2IvG0cMfYPhMLRanzoIq/r4AX691Pjw41
	HNW0iCUW9+dq3s54mLQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jedcE-0007nm-Py; Fri, 29 May 2020 11:55:58 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jedcC-0007mB-Jy
 for linux-snps-arc@lists.infradead.org; Fri, 29 May 2020 11:55:57 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C25B3C041F;
 Fri, 29 May 2020 11:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1590753355; bh=rl/j7/Cjm4X4ANhwe64JdR/bQf2UVY53T+qmbOpaUEE=;
 h=From:To:Cc:Subject:Date:From;
 b=HRGJQXJr7UqQH3Sy7emt2qiI8WsBKHurEtJeJ0tJHpXaqN9wFxlv4yn7rt/SpuvVh
 qYUMI6fnzye9F5T7d6vsPAqJBLZVODNTI1GJuMrmM3jFEGC7yn3rwwOb3TnIOKikZs
 lnaE8D436I5P/7JnKMj0YT/RZ406NGn2Gq+GkikRf4HDYNieYwxbLyUZRlFoM6PhxP
 eInDZeqd57F1vC0azOHexptgG03Sc7FMfQ9qu0VzTdg6aRfEkWiQtoE0wUZxDiMZtd
 c6EptXd6moMsJ9yiVLpwWvcRBGDxM8aC/+jOJWN0yaoaytp9emu3/fEYZWp4SpkLIw
 hO0J6tnuYzK3w==
Received: from paltsev-e7480.internal.synopsys.com
 (ru20-e7250.internal.synopsys.com [10.225.50.16])
 by mailhost.synopsys.com (Postfix) with ESMTP id 2C138A005C;
 Fri, 29 May 2020 11:55:51 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 0/3] ARC: [plat-hsdk-4xd] initial port for HSDK-4xD board
Date: Fri, 29 May 2020 14:55:30 +0300
Message-Id: <20200529115534.22883-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_045556_693983_D63C861C 
X-CRM114-Status: UNSURE (   7.96  )
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

Eugeniy Paltsev (3):
  ARC: allow to overide default mcpu compiler flag
  ARC: ARCv2: support loop buffer (LPB) disabling
  ARC: [plat-hsdk-4xd] initial port for HSDK-4xD board

 arch/arc/Kconfig                    |  13 ++
 arch/arc/Makefile                   |   4 +
 arch/arc/boot/dts/hsdk-4xd.dts      | 322 ++++++++++++++++++++++++++++
 arch/arc/configs/hsdk_4xd_defconfig |  99 +++++++++
 arch/arc/kernel/devtree.c           |   1 +
 arch/arc/kernel/head.S              |   8 +
 arch/arc/plat-hsdk/Kconfig          |  24 ++-
 arch/arc/plat-hsdk/platform.c       |   6 +
 8 files changed, 476 insertions(+), 1 deletion(-)
 create mode 100644 arch/arc/boot/dts/hsdk-4xd.dts
 create mode 100644 arch/arc/configs/hsdk_4xd_defconfig

-- 
2.21.3


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
