Return-Path: <SRS0=KRsc=7R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58691C433E1
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 17:39:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3221D20829
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 17:39:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bjPIdReC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="VP+7o3gY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3221D20829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pKs6y8TQM08WGVr4GOgg/lEVOWmUj+13OI+YKVweX1E=; b=bjPIdReCAbj1Iw
	AFMykBuFMmYmx4XpT7Rs/zpp3Lra4sDoff3vSq/fbsOwrfVpO7oaumxpZyyQlZjVh9099S2JGGhu5
	9Ol28UATYWyWif3lioYzMXygQkbgSZvUqzVra5s+aH2klLP3Z8aAsq27xSK6lL87D2Le5oXZRswVm
	9zVcvl5DloHuud3tWByTquuJBCV05P6/GL//fHFT2IMPXffJbtIQPmj+h5izdxMyG1Ref9oJYOLwj
	Ubd03pVZbMSQYPI3Ed2GMU8JSqRQUZYJQOej1RshyM3NsXLfO3D9qSJHxW8wG9TVfxxcToCQ/4bcS
	yAzZV6cqPeNn0PAEmB+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgtqO-0001GX-Fs; Thu, 04 Jun 2020 17:39:56 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgtqL-0001Eq-AL
 for linux-snps-arc@lists.infradead.org; Thu, 04 Jun 2020 17:39:54 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CD24A40030;
 Thu,  4 Jun 2020 17:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1591292391; bh=BOUD1okbFsKFgS4cJO7HwMo5yaVDRq1gtmBar4MecC4=;
 h=From:To:Cc:Subject:Date:From;
 b=VP+7o3gYWKNyuGlJmZaKb49L+qgki/pR6R9weR24jXo9XxKtAILnITJ9P1WD1mgnl
 hBzFdKP86TzvwyeRZF0fGuKESNM6OoY1w27vKkyK+XHA1zinoOjZDyfswPtXALFT8w
 hz2r/P8gcOPMhCOqNY+TRgGT1OIzK2h2bQngLKCGTOQp3jMe1Fsa4KJKTfhEWsx8PU
 KGOGtRyPqI5g+EH9Tzazownz9bvR7XFwOq91slaG2lfBvzd5VriejkjwwE7i1BVu/c
 jtpv5fT0CxwhhlHwZe3kmkGkiCiSqbOjme6uYHt2cTasmekNsfulT70ZROujS7wT4h
 cj5Ud5FPnBr0Q==
Received: from paltsev-e7480.internal.synopsys.com
 (ru20-e7250.internal.synopsys.com [10.225.49.234])
 by mailhost.synopsys.com (Postfix) with ESMTP id 94592A005C;
 Thu,  4 Jun 2020 17:39:44 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH v2 0/4] ARC: [plat-hsdk-4xd] initial port for HSDK-4xD board
Date: Thu,  4 Jun 2020 20:39:23 +0300
Message-Id: <20200604173927.23127-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_103953_380446_C28D1029 
X-CRM114-Status: UNSURE (   8.91  )
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

Changes v1->v2:
 * Fallback to ISA default mcpu flag if custom one isn't supported by
   compiler.
 * Drop HSDK custom Kconfig options (choose between HSDK and HSDK-4xD) as
   we don't need it (at least for now). Instead we select ARC_LPB_DISABLE
   for both boards but it's totally OK as HSDK doesn't have LPB so
   disabling will be skipped by BCR check in runtime.
 * Add missing HSDK-4xD device tree bindings. Convert HSDK device tree
   bindings to json-schema.

Eugeniy Paltsev (4):
  ARC: allow to override default mcpu compiler flag
  ARC: ARCv2: support loop buffer (LPB) disabling
  ARC: [plat-hsdk-4xd] initial port for HSDK-4xD board
  ARC: [plat-hsdk*] document HSDK-4xD board/SoC bindings

 .../devicetree/bindings/arc/hsdk.txt          |   7 -
 .../devicetree/bindings/arc/hsdk.yaml         |  26 ++
 arch/arc/Kconfig                              |  15 +
 arch/arc/Makefile                             |  21 +-
 arch/arc/boot/dts/hsdk-4xd.dts                | 322 ++++++++++++++++++
 arch/arc/configs/hsdk_4xd_defconfig           |  98 ++++++
 arch/arc/kernel/devtree.c                     |   1 +
 arch/arc/kernel/head.S                        |   8 +
 arch/arc/plat-hsdk/Kconfig                    |   3 +-
 arch/arc/plat-hsdk/platform.c                 |   1 +
 10 files changed, 492 insertions(+), 10 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arc/hsdk.txt
 create mode 100644 Documentation/devicetree/bindings/arc/hsdk.yaml
 create mode 100644 arch/arc/boot/dts/hsdk-4xd.dts
 create mode 100644 arch/arc/configs/hsdk_4xd_defconfig

-- 
2.21.3


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
