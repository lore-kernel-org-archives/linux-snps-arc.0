Return-Path: <SRS0=g2s6=FP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B11C4361B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Dec 2020 15:20:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B023F207AA
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Dec 2020 15:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B023F207AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YYZFRaIBmDJHyd/vbZWWgwRcfKuKfr5FV604XQ5OwAM=; b=yqqxSZwW3hXGGk6E4wUsJSXrP
	rNvGTyT9eDxF0FcWIz9Z8jL0fdqdeiej/S+Zh6+I9jXntOBCGvD4Dr+OROAuupUlsEE7+/NNXdBII
	EVbL8x2y5QBjzEZRpwElhfjpvzQxYToAYbh62c7x7KavfT0yl+nJwJsMfM2D/HdQaPwjKkg4u9Q8u
	NedrsF7u+crVMA4CQimezeYr3tqfLCxBRn3zWOmCI4fnGtbU0tBtmGEBUCJX2z5qp13d0QiSVsm30
	V+3em34xAXGHvJaprK9XaNoxlRg0IYWlL5gdMs21nzIPq1iQy1AMscQYnwOINlKBE3k46RQgjUNgz
	ucL7ff2dA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knkDE-00022I-2W; Fri, 11 Dec 2020 15:20:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knkD6-00020A-EQ; Fri, 11 Dec 2020 15:19:58 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3845B20793;
 Fri, 11 Dec 2020 15:19:55 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1knjvh-000TxV-2f; Fri, 11 Dec 2020 15:01:57 +0000
From: Marc Zyngier <maz@kernel.org>
To: shawnguo@kernel.org, linux@rasmusvillemoes.dk, leoyang.li@nxp.com,
 mark.rutland@arm.com, zhiqiang.hou@nxp.com,
 Biwen Li <biwen.li@oss.nxp.com>, robh+dt@kernel.org, tglx@linutronix.de,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Remove drivers used by EZChip NPS platform
Date: Fri, 11 Dec 2020 15:01:42 +0000
Message-Id: <160769813659.482133.7482270195776095716.b4-ty@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201105212210.1891598-1-vgupta@synopsys.com>
References: <20201105212210.1891598-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: shawnguo@kernel.org, linux@rasmusvillemoes.dk,
 leoyang.li@nxp.com, mark.rutland@arm.com, zhiqiang.hou@nxp.com,
 biwen.li@oss.nxp.com, robh+dt@kernel.org, tglx@linutronix.de,
 Vineet.Gupta1@synopsys.com, linux-kernel@vger.kernel.org, xiaobo.xie@nxp.com,
 Zhiqiang.Hou@nxp.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, biwen.li@nxp.com, jiafei.pan@nxp.com,
 linux-snps-arc@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_101956_572309_1710E746 
X-CRM114-Status: GOOD (  10.85  )
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
Cc: devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, xiaobo.xie@nxp.com, jiafei.pan@nxp.com,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, 5 Nov 2020 13:22:07 -0800, Vineet Gupta wrote:
> This series removes any drivers associated with EZChip NPS platform
> which was removed from ARC in 5.10-rc1.
> 
> Vineet Gupta (3):
>   drivers/clocksource: Remove EZChip NPS clocksource driver
>   drivers/irqchip: Remove EZChip NPS interrupt controller
>   include/soc: remove headers for EZChip NPS
> 
> [...]

Applied to irq/irqchip-next, thanks!

[2/3] drivers/irqchip: Remove EZChip NPS interrupt controller
      commit: 04e7f423f4a96ad492fd51bf2234b8982400ab5f

Please route the two other patches via their respective trees.

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
