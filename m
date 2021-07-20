Return-Path: <SRS0=TnUX=MM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 492D5C07E95
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Jul 2021 20:58:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ED70610A0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Jul 2021 20:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ED70610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HarQ2RGDFnaxSxtP4BblIz49nQqHK31EalsK1wdN4Gg=; b=BeEaRy8+2O1e9j
	O/wyZrWJIdx8OjmVWGrNk0wkmaLTPJaKsB8ZAgXlaNlr0+t9NkVOxPV9gLI69V3eLIT+N53JIwpC7
	JjL4cCZHovQdsAWGLBajocfoff9B9meXCerPpJQ8y7TLNTv+Q2uskFsqz9GW0+1ql99O0/7RMBjWW
	xs/Zzuz4lo1EH+5yigG0yB6Rc/6y/76Vq3FDYqweXz40Jwi3Q5N+yCPZOFQrJLKcmTT+S62P2brkC
	gQd4JF/WWwIWusOr/GHoOM8+Yfb07Ue8RE1/IhFKir9kgszJXvCqFjcoAKQmi5tUrnyrmneHVc9+2
	GiA72hvmwxTNHJ5DI0VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5wom-00DvrL-Do; Tue, 20 Jul 2021 20:58:20 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5woj-00DvoP-PP
 for linux-snps-arc@lists.infradead.org; Tue, 20 Jul 2021 20:58:18 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 89BA1C3789;
 Tue, 20 Jul 2021 20:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1626814692; bh=vQRduuLGNFSsmRN17RFbxTpbY7FbDf74tYFBin02NpA=;
 h=From:To:Cc:Subject:Date:From;
 b=XEBmtsomawHBqGIBouSFg8hGJKS2hQlLRooYILGBF5qlBG0u7oc+blxibWl79c61Y
 7BDNUpzFbmEEy0WRFiid/ln/Z68Knmr6Xu70OMNFvE+HM97ABze6E1e6HByZxBVG1W
 IoSsGIN0wglM3vxv88kNS4WY70RzVyyK3wk8SWNI2AM8AyHhBnK+5mr1mK3KPXAbrb
 QEPNWOAlk9EWs7w8cS+DGiVmJe0oUK4FwmYy/LRLVwCXsqfM5wXcWIMU9ifPJv9EfI
 skpc6aMrw3ruGMR9NJ4wyp0jrDO3nJF27DP9dYkXAvRwitgAgg75Qd/F6LvqukZ1k2
 NRRYKx2EZqWQA==
Received: from vineetg-Latitude-7400.internal.synopsys.com
 (snps-fugpbdpduq.internal.synopsys.com [10.202.17.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 57988A010B;
 Tue, 20 Jul 2021 20:58:07 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Cc: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 0/2] ARC fixes/updates
Date: Tue, 20 Jul 2021 13:57:58 -0700
Message-Id: <20210720205800.1056218-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_135817_908137_395D4212 
X-CRM114-Status: UNSURE (   6.53  )
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

A couple of updates for ARC.

Thx,
-Vineet

Vineet Gupta (2):
  ARC: fp: (micro)optimize FPU_STATUS read by eliding FWE bit clearing
  ARC: elf: make type safe

 sysdeps/arc/dl-machine.h  | 23 ++++++++++-------------
 sysdeps/arc/fpu_control.h | 15 +++++++--------
 2 files changed, 17 insertions(+), 21 deletions(-)

-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
