Return-Path: <SRS0=h9uo=GS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC61C433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 20:04:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E60523A56
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 20:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E60523A56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QACRuca6zo3QKsZgYPLMiwQ2TThgNMuOaHIjKSPK/pg=; b=vgu2ZKRESayfbuqHWwIobHKzAC
	5Ig854bGyhhRn9RdFfpmOS0/lqmGa3qztDcUYQqF5q23/bzdmjMcH45Vq3n/u2ia+sw5qSt1LZO0n
	TcxJ2qEA2KcjcoLAlw2CSkrrQ4u2LDzwmVm7/7oYOKK+ZKE/nmPmLwg4q33+AHkw2h16ad3BGpvXe
	DnDrsvC7maIEoi4SNDmfYe1Sy+/gJChOkCoJjtRVGecYOrE5LOiE37bYsIlCMva27X4va9yqrUDOc
	B94tBXjqM5X2nbbG3tc8iyeON8o5SutBOlYDK51OHy+T4z30wHKiKxbZgxFNIhGNDg1rdSN0GHoi8
	vgeTNlEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0VKQ-0003TS-7y; Fri, 15 Jan 2021 20:04:14 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0VJp-00035r-JS
 for linux-snps-arc@lists.infradead.org; Fri, 15 Jan 2021 20:03:44 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7E470406E7;
 Fri, 15 Jan 2021 20:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1610741013; bh=RT1g77EDbU4yofScagr7NJfz0LBUUjGD7+RuIkoglNo=;
 h=From:To:Cc:Subject:Date:From;
 b=VQhDXGDcSzNsp72exKr0yAdAx0H6bAXcPt9xtJztegt2zbdpI6PGT5QEXfqLkDD1I
 IMum7o5ZVOp8MY504VQMG/DDJSDenIXQEsL0nKmdSeykWoxTtVn+WZj7oMqOppqaZX
 jJgBt6Oa50iRxiE9lAUdbr4oaGZdVXBqfHfSRGHwCVUl+9g/L1o2QqksNBuzKVm0Mq
 DtYqxukv6q6O5ooxy1VtgbrzpUW6KObXzQWZDxvB1bXbsAa9Gh8ysF765Z3IPdZkie
 8P79K6kbQVIWAORPmr8DdS4oDX3JSxbEsO6qKvqqnB0YhRw9vTrf+M1YVo+2Fhwa87
 +sPJz0mzpQ98A==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id BD110A006F;
 Fri, 15 Jan 2021 20:03:30 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Subject: [PATCH 0/4] ARC updates
Date: Fri, 15 Jan 2021 12:03:15 -0800
Message-Id: <20210115200319.4139041-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_150337_922587_15C20407 
X-CRM114-Status: UNSURE (   6.35  )
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
Cc: Evgeniy.Didin@synopsys.com, linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey.Brodkin@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi,

PFA assorted ARC changes. Main being a hw config for -mcpu=hs4x which
schedules code for HS48x dual issue pipeline.

Thx,
-Vineet

Vineet Gupta (4):
  ARC: Add support for generic HS48 processor
  configs/snps_archs38_hsdk_defconfig: refresh defconfig
  configs/snps_archs38_hsdk_defconfig: switch to glibc hard-float
  configs/snps_archs38_hsdk_defconfig: update for better out-of-box
    experience

 arch/Config.in.arc                  | 16 +++++++++----
 configs/snps_archs38_hsdk_defconfig | 36 +++++++++++++++--------------
 2 files changed, 30 insertions(+), 22 deletions(-)

-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
