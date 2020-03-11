Return-Path: <SRS0=10iP=44=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B6EC10F27
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 13:41:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57D1720873
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Mar 2020 13:41:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pIiT4UEN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WOUvTtDf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57D1720873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LGKUjeMQijiXGCOE0sWt2UvtbEr9shNav4Qb3O7HE2Q=; b=pIiT4UENS4gd0o
	vkKvJ9XKTxvEiK416KXVPqZU4nw775MllHIAoptJqq159cYqDbIevyX5bhC9aN2Qpl21Qej/hfkJ+
	uBxyX6Ej+z1uGOJwALtNesO/T5WhBL6lxB3wqJO/0VXmycYTHONVpogU+Ki+UWyuT2XqFXPV1s1dQ
	w9hQF5NuVuDpgn4MxOeSJhJZBJoVfYojhlUBuD3nE40bDBZQ/vq+xGi09Op09S7AzoEFFNAfuWRuY
	5RasC7L+r+BAgYmrWXpwNqIrSFtcY+PDs32OemJBwbueY9NaIAsmr/RWkj0qheo8K1g6/kZKwVq6q
	d14LHYiIGU52qiWwv53w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC1bw-0002a7-4s; Wed, 11 Mar 2020 13:41:24 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC1bt-0002Yz-EJ
 for linux-snps-arc@lists.infradead.org; Wed, 11 Mar 2020 13:41:22 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 16D254080F;
 Wed, 11 Mar 2020 13:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1583934080; bh=lw1x64akbq/Rtsh3xZ/yvfvvJN+tyISDQ0cHYFcOvKI=;
 h=From:To:Cc:Subject:Date:From;
 b=WOUvTtDfIQ6p2Ojn18nwqGHf9dfTVW3shEfaKo+QCNdOdO0cI8ADlOSTRKDX3TEu1
 hSIeV0u6fxnz4G20O5NGK8LE1AxnoOI2dsisYcSMI0YAu+mr5+SO8nIjSKSzbGNa+A
 7vPKLpwJ0f6poG8NHYfGoQ1TGJOHIyAWx+w4ot1NTZZ2YO7QwP19i+Mu/228ndHi3i
 Lr4OimaqA9iiaECho4LZb0vid5iSWWpPEYU2M8xgHtdO39ZUPiz7FVn4JZsS7mLtuZ
 7Ynr6ETASmJzgn72iLXTlvOyDOsk7E2AnWGjoT+3jLOzhnJCkSw6lwG9T6fkAjQzHg
 d3GMBsx7XoYcA==
Received: from paltsev-e7480.internal.synopsys.com (unknown [10.121.8.79])
 by mailhost.synopsys.com (Postfix) with ESMTP id 5D154A005D;
 Wed, 11 Mar 2020 13:41:17 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-clk@vger.kernel.org
Subject: [PATCH 0/3] CLK: HSDK: CGU: updates for HSDK clock management
Date: Wed, 11 Mar 2020 16:41:12 +0300
Message-Id: <20200311134115.13257-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_064121_494465_AB542622 
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
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Bunch of updates for HSDK clock generation unit (CGU) driver.

Eugeniy Paltsev (3):
  CLK: HSDK: CGU: check if PLL is bypassed first
  CLK: HSDK: CGU: support PLL bypassing
  CLK: HSDK: CGU: add support for 148.5MHz clock

 drivers/clk/clk-hsdk-pll.c | 70 +++++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 31 deletions(-)

-- 
2.21.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
