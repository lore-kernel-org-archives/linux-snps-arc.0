Return-Path: <SRS0=C+4U=KF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D20C43461
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 18:06:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23A72611AB
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 18:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23A72611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I49bMGZWNCorQVplR/Ohsx3sx7cf3cvRlfEsjH2JRl0=; b=q7uJ1z5V7Xr1m96uAVBXE6UNp4
	DiUus06IVXlsVcrwswL0YTzWw9aiqDU+1KvLqJBn9c3wfY5rTJ+ulDHIyhO2wItagCp/mbR3mQNW/
	wLtu/K3gqOsktduUu/zkUqCDN/MgeOO7j9Xw2E4KzflzITAvC6ZUZD9/gTwPl0w+3Go8rwP6RMHLo
	wSiQ2vPj8JPQddFBFZjMHC2JtLT5zwxdTVpTD/F1QRTHupaQwMFrSb7w1XDVjfydEPp9+Bn45gWZa
	Cvh5CN3VClZnu90FrcnN1ji6A/0gpHh6m+IwccywEzcveHj6/whseLnsUFCOEV+7+GbMNrA7FcEAI
	ZRLXWiQQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgAIe-00FMmW-61; Mon, 10 May 2021 18:06:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgADJ-00FKov-VB
 for linux-snps-arc@desiato.infradead.org; Mon, 10 May 2021 18:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=RdJn+sDOjGL5VCF+E8F90TvS+dnYj8XgRxTpWdz1wks=; b=ae49DhHO7AfteUN2kZja+nSgx8
 kinghWPZdBW2TVdRKTUa553M/3P2GfZ57HL4ZypR1RPIFNngw7ESelYGvOTZOsel0ZUjzTC69gkNr
 wb9M6VZtqZMdZW/7pIJ+SR/89iUZL9IXJF4POFpN5+Rb5PtQ7OUM0y66TplZ3N+hPTjYr6I3BO60D
 Ae0awioszvEEGvYeoteXB3VsXq7AYKoHgjsVZsUGVhxyf3SPIhiol1VbG4Vgk2oMHwojD6UDJhCV0
 ZdVYEvlDP01NCt/DyKWfjz6kda9J7gePkgtQPl3XOVHxmrVyg2q5VxPekSBlKWIen9Rrg5BN9z2yn
 /yJ02P9Q==;
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgADD-0090zE-JK
 for linux-snps-arc@lists.infradead.org; Mon, 10 May 2021 18:01:04 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 97902C0083;
 Mon, 10 May 2021 18:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1620669657; bh=sfhloGV+HXbYYRvpPuKzZwEmPlyOKcknSiDE5iCqwhM=;
 h=From:To:Cc:Subject:Date:From;
 b=ShMQkeLvJtiv0sBGoBBYD9TEmznlHHftf1Uc0n4IpCbZ/NKw0UpOV9AWZXp45L3nB
 xLfVZZyA0XPP8TtkuNi7pENuxf1WCJ/pdlXc+DI/C2EeAzLbXO58KXiR5+O4zqo4qd
 BYSGGgGBQZmGtxekV22TMq4/rbDxTgfhg9otacIFgWXTtlgj9FjZtXlEiqhF22zgvH
 gIMn8V3CCB1p73ZeSyKcvpBIOsXArFQpQDToYo/6dOCST6tCxGUr6p78pbG+yaAiT5
 4ZDK770JjlrDraIXxDLfRe9SuRYB9I8uDgkzXIR+ZGMmhP8dEv0Y4BWt7g1iHupiyX
 iP3lFJQf8eIQw==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.202.19.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 964EDA005E;
 Mon, 10 May 2021 18:00:53 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Cc: Alexey.Brodkin@synopsys.com, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH v3 0/4] Updates for ARC, LMBench
Date: Mon, 10 May 2021 11:00:44 -0700
Message-Id: <20210510180049.61421-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_110059_685569_EC87119C 
X-CRM114-Status: UNSURE (   9.04  )
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

There'a cosmetic fix for ARC to show the -mcpu in config.
And there's a bunch of histtoric patches in out github repo to get
LMBench running.

Changes since v2
 - Added another LMBench fix (to lat_rpc)
 - Added -mcpu for all ARC CPUs as suggested by Peter

Thx,
-Vineet

Vineet Gupta (4):
  ARC: config: explicit'ify -mcpu for cpu selection
  lmbench: memsize: increase delay for slow FPGAs
  lmbench: emulate --prefix to avoid scattering binaries all over
  lmbench: lat_rpc: fix stray pointer

 arch/Config.in.arc                            | 14 +++++-----
 ...c-to-prevent-memsize-from-timingout-.patch | 28 +++++++++++++++++++
 ...bage-pointer-for-lat_rpc-S-localhost.patch | 25 +++++++++++++++++
 package/lmbench/lmbench.mk                    |  9 +++++-
 4 files changed, 68 insertions(+), 8 deletions(-)
 create mode 100644 package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch
 create mode 100644 package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch

-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
