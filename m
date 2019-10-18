Return-Path: <SRS0=z5VF=YL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C996FCA9EA3
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Oct 2019 11:11:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D41320700
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Oct 2019 11:11:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZAue1h8L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JAfzKRqJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D41320700
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=32JgCSQUS1Ww1gMIMbBU665XUU0xT3b4O0eCB3QgiPY=; b=ZAue1h8LbFvPuc
	y5FvlGqMG4y/DDTBS93Ion03mxMJd2YYtP1lieeoH25Jo6jiTouna0Co4Q1AJXdbP29PkQTLYuNu1
	39B/v/E/CRClB2f836/iiu05GlNXrhYsnSGowvz0INDi/zxD2enbXge7KK8tykGUldfDI2YxSSA3p
	cNB3dorMT+AhIS+bc/HEHSrl+JPvAkX1sE98IG77hBiYOioeKUq/qQfw0vcTjcFjjcZlB0jfb95bF
	Da7xZn4qfJedD7MeSy7c2DQbglHqsivooYKghyw44Ya2eLX8+m4rabqur+EXKBA/KUXPxLD1U3FoS
	/6n8z4OM+sDwSwywWsFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLQAV-0006qK-Tm; Fri, 18 Oct 2019 11:11:39 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLQAS-0006oH-QH
 for linux-snps-arc@lists.infradead.org; Fri, 18 Oct 2019 11:11:38 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 77C90C038C;
 Fri, 18 Oct 2019 11:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1571397096; bh=e8yggv0btZRuFr6l3qUhzUGs2B07uTUAhsF6E9pwFQ0=;
 h=From:To:Cc:Subject:Date:From;
 b=JAfzKRqJN/knBHIhtODeGolVsw1cKqnMa1YJSUxdFInIDBEhcjf2RnOv3fPheaafQ
 104PIuQEajrdUI4Ubn2r10ogn+aNYlNbCqbTX3aEVflgU/lqwcs5rhk9pGIvM+by3J
 6wcEi7pao5nwpINOCkjQJNfjn2eew+f3yCgwRRjLV/HvQCxoX579aNdElExrV4ReTk
 NJmxVcAQbpx9tHMHl2JSuSO1F/AnL6BZdlJmVY5dhQpp4FVcWt1RyUh+nVel35VdeI
 qn4zRKRuHQjm3JeZrhmwC3vJ5DiEFVokTf88garIOFubFPfPwdM6H5FxC+mQdqkQXx
 4ca00S6sIV5lA==
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.3.73])
 by mailhost.synopsys.com (Postfix) with ESMTP id EAF6AA005C;
 Fri, 18 Oct 2019 11:11:28 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 0/2] ARC: [plat-hsdk]: enable on-board SPI peripherals
Date: Fri, 18 Oct 2019 14:11:24 +0300
Message-Id: <20191018111126.5246-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_041136_866369_D123BA12 
X-CRM114-Status: UNSURE (   5.26  )
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
Cc: devicetree@vger.kernel.org, Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

HSDK board has SPI flash IC and SPI ADC IC. As all SPI-related
blocking changes/fixes are finally applied we can enable them.

Eugeniy Paltsev (2):
  ARC: [plat-hsdk]: Enable on-board SPI NOR flash IC
  ARC: [plat-hsdk]: Enable on-boardi SPI ADC IC

 arch/arc/boot/dts/hsdk.dts      | 23 +++++++++++++++++++++++
 arch/arc/configs/hsdk_defconfig |  6 ++++++
 2 files changed, 29 insertions(+)

-- 
2.21.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
