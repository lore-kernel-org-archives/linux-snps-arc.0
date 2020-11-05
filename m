Return-Path: <SRS0=YnoV=EL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7D7C388F7
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Nov 2020 21:23:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9938820724
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Nov 2020 21:23:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xyv1RpQk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="YN7xQXqs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9938820724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dw+BgvsJJumKGslXcKNVGMjxSExqP+XkJk8wJakymAI=; b=Xyv1RpQk4T6e+14/1RWvSgrj6p
	63aZyjXfZJ8z6dUSrvAxL8sEjFwMDc8GhsrFH0o5pRG9TsfhRaDzD+BZkQYoEYeTAVFKqQP+GwzFr
	epCMKhz4Hl/O44QFjtriM8T5mwsXF76YP4J6m5f0kIsCPDCIbr3OqwCI+dVRNGlgT/7Hd2116dNO8
	jwltdTU13g4qUY8R3Di2v7aC3KUNG8O8VDzK26gOYpny5lTRW9VEPZOTZpv/RtbUUlVsb9dc+iVzi
	Av4n/+Eim0ScRm6d8u+ak9glSeZ7ie4pRZykxymOSSXCxulInWSvFDT0NrNnCRXasBpw4ycje6U21
	V84zMOow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kamil-0004Je-50; Thu, 05 Nov 2020 21:23:03 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kami2-0003wv-RB
 for linux-snps-arc@lists.infradead.org; Thu, 05 Nov 2020 21:22:25 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9737CC0004;
 Thu,  5 Nov 2020 21:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1604611337; bh=7NzLBMJhywvbz5o/KezRmvcXaTDUD/3R56cGXf39sdA=;
 h=From:To:Cc:Subject:Date:From;
 b=YN7xQXqskWqjRX2FT/v/WWofoAmnun6Tlrer8CdclM5kSv55mdn4zH3XqROLaZH5I
 HUpuZPhz/5EIqpWrX25wUmi8HOawpLY17wthGK9aaaMfizw4FECNitYylyCYlb3ScJ
 nvQL9L56VRke7RvpTJ/tCSFy4/zjcel9x1S+D72IHXYnqfSEYfW6EMFvP6naLrSCgE
 R1NOAgomkbJWUkjRCArYePKPxTXFlF+NQuyEoJ3LxspamTk77opk0FCikgcZav8xTf
 uwnqFJ3c1CdALFTmP18007BQLSLlr/vCNqRAKTCMfs7VZR1p0gNTx9Mn0Oc844JEa8
 8I7acEtaAFhvw==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 6EC9CA006F;
 Thu,  5 Nov 2020 21:22:14 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 0/3] Remove drivers used by EZChip NPS platform
Date: Thu,  5 Nov 2020 13:22:07 -0800
Message-Id: <20201105212210.1891598-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_162219_195076_BB187C37 
X-CRM114-Status: UNSURE (   8.51  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This series removes any drivers associated with EZChip NPS platform
which was removed from ARC in 5.10-rc1.

Vineet Gupta (3):
  drivers/clocksource: Remove EZChip NPS clocksource driver
  drivers/irqchip: Remove EZChip NPS interrupt controller
  include/soc: remove headers for EZChip NPS

 drivers/clocksource/Kconfig     |  10 --
 drivers/clocksource/Makefile    |   1 -
 drivers/clocksource/timer-nps.c | 284 --------------------------------
 drivers/irqchip/Kconfig         |   7 -
 drivers/irqchip/Makefile        |   1 -
 drivers/irqchip/irq-eznps.c     | 165 -------------------
 include/soc/nps/common.h        | 172 -------------------
 include/soc/nps/mtm.h           |  59 -------
 8 files changed, 699 deletions(-)
 delete mode 100644 drivers/clocksource/timer-nps.c
 delete mode 100644 drivers/irqchip/irq-eznps.c
 delete mode 100644 include/soc/nps/common.h
 delete mode 100644 include/soc/nps/mtm.h

-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
