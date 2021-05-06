Return-Path: <SRS0=IDKR=KB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E60C433B4
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 May 2021 00:40:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B749C61222
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 May 2021 00:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B749C61222
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jHEMZtmk1wiNeKZO7AOaDy3nZ09QrhYDcTaCP80/T9E=; b=Tih/645cxV0Vo8wM9bB7O1sTUo
	dHR5mNqfURKISc2YXjx6f2n8trX4+JDERPysKVW8UGbmNvFevPCc+1f0o51wunWdrBPGT74bKp3C/
	RoK11ISGC3LshOWaTdmoGGaWRr8H3qXIoTmJnWhNtZc1y4r2CsRXY421OJKxPosME1pluRJc844oP
	cx+XQ4+nmPQEPlZPxJ9zLkj0ZqM3B9gu35zhMyS3zHKgQeufBsU2wQLdY9vNcZwhgL5Rb8NAhlG6A
	ZhxAEg0HQtm1G6WbQHPdgJdiF39llbAMFYUdFyFDp1MOrNzh3psncXBZMjyoOlBDf/xDtDwZ8G9Ln
	ae3/+gOQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leS3m-002jjf-Ot; Thu, 06 May 2021 00:40:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leS3h-002jhp-E2
 for linux-snps-arc@desiato.infradead.org; Thu, 06 May 2021 00:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=GRAWuhbjC1RZfnv4RDaDptDX/LM9aShPFrvvhmEyCCE=; b=Ga7huYAGA87AtBOvUj2+5q4knn
 RvG8g/HM2LhVdfxvJ0VW+apxwF+uNDz6FtQYkY9Ocs0Qo2jqku4h9wtr2Z2Gk+0XhO2JJsXl57nX2
 zfif6Kf+fwNCc+j9N1ykEn+a78lewRXBelmcvBtm/MW/cxNIIR+AHKnQRjUcwFsnaIIEIcnQsgkOc
 h3kXYv1fIdf6AY+5cYNvAPxx9n4HwdsOVBbd3+tiLKIEvIFRmn2dFC7QoUPTiOCIwiPAnJrTprJjC
 OlIaRYEHiD/krcxibw1Dh+MJ0J2SEt1NR11lUO0P3eUcr79sa2y3K9xfJmeu+4tc3dMQk3H2QbNc+
 DU4N+Z/Q==;
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leS3d-005RfN-JM
 for linux-snps-arc@lists.infradead.org; Thu, 06 May 2021 00:40:02 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 03254C0562;
 Thu,  6 May 2021 00:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1620261600; bh=TDnxP3QjKAldZdtNInBaRT0ery42Cj2gTBAGWA+P9Gc=;
 h=From:To:Cc:Subject:Date:From;
 b=gPKll9m4pwDUPJlt6g9+6AAfhskvjvtcFo1KNZk1/70CMuxDmgWnr/rawHLB255md
 6VNdDBXovwnqXuLMGCXQrP/tTuCYhQvvjg7RcRaZdIFoob0a9JJkq7NmhFZ9ysPbEz
 4aeausxP95SieKIoQ7wwwO3miQOrwGS3TX9LJp6O1h750+Y7+haYPvNU1lsihh6Y6B
 gOKFDRgzqdHatuE3ijNOjCi/mBw8Y7vGDe0SOMPPoWCJmrb+yb5PdC+JTJRjv6Gjsj
 di/2TAeyx3ZqzLPFjbUVo+LrSS2Sn1TG48gNNhndncbYjY59DKW2IheC2lLfr27H0p
 EwvbO+H6LYeYg==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.202.19.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id EC9CAA0096;
 Thu,  6 May 2021 00:39:58 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Cc: Alexey.Brodkin@synopsys.com, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 0/3] Buildroot updates for ARC, LMBench
Date: Wed,  5 May 2021 17:39:54 -0700
Message-Id: <20210506003957.2994235-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_174001_704938_0A22B351 
X-CRM114-Status: UNSURE (   7.22  )
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

Hi,

Please apply the assorted fixes.

Thx,
-Vineet

Vineet Gupta (3):
  ARC: config: explicit'ify -mcpu for cpu selection
  lmbench: increase memsize delay for slow FPGAs
  lmbench: emulate --prefix to avoid scattering binaries all over

 arch/Config.in.arc                            |  8 +++---
 ...c-to-prevent-memsize-from-timingout-.patch | 28 +++++++++++++++++++
 package/lmbench/lmbench.mk                    |  9 +++++-
 3 files changed, 40 insertions(+), 5 deletions(-)
 create mode 100644 package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch

-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
