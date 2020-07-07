Return-Path: <SRS0=Wyqd=AS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB2BC433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 21:25:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39106206BE
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2020 21:25:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1McIfV6A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QUCvcReV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39106206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4CVBgYpQhLwPgkiv/RL+UCZU+qzKlDp8/yj5vI2FgA=; b=1McIfV6AohsTOfDfFDlo9Detln
	hkDTKa+CZZDSjGIiQ2ewiQFU0ZQd4ASlKgy4S5jOEaM008YVdPH9IzKqV9I4nKStAEUx1XVEXPgF3
	PCdk2LOF54AamKUy9zdPx7+GPI/UcNunYL/PeZbzN286DCWWDdX8Q75qGTScNMRNKmus5sYdj5XkP
	xMM3Y6nlvgYINDF39uiNRIHmpeYFO68a5vtrcCVYcbFeAUR/JDjDwfQ9L+FBHyHDi6zK+YEyToCBu
	LZC3JhJpKe/5qWrdfQIZbhFXOl8Ffqw3/n3SYbfHd1BxuR33BS2lq2d27N+yGmGfNmQe9B3fwFMTb
	tpQDhZ7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsv5Q-0007Vd-LM; Tue, 07 Jul 2020 21:25:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsv5O-0007V2-Ht
 for linux-snps-arc@lists.infradead.org; Tue, 07 Jul 2020 21:25:07 +0000
Subject: Re: [GIT PULL] ARC updates for 5.8-rc5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594157105;
 bh=/hFxyPdJkVEBb+4BKyEtpVmOBbZlj2PiEuIWvGs35Zs=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=QUCvcReV0SFWH56zVJsPGmj02jUFPVzkc6cnm2UzA9xDApA9WAUcNIh0JYK03CxFN
 VefL4o0pa/MyAbSJdoAHLr92pvknLqegZmPxuN6QTCM8/hbmY3HR8S9QHQf1SlYIJP
 A1x5AFaIBcTXMPN/pXljq7ycCrU9rgGbE04uF/iQ=
From: pr-tracker-bot@kernel.org
In-Reply-To: <41052a3e-c51d-a0d8-06ea-af1e30fb097a@synopsys.com>
References: <41052a3e-c51d-a0d8-06ea-af1e30fb097a@synopsys.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <41052a3e-c51d-a0d8-06ea-af1e30fb097a@synopsys.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
 tags/arc-5.8-rc5
X-PR-Tracked-Commit-Id: 10011f7d95dea311c0f2a3ea6725b5a2e97015a8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9e4d7696213f0231f7a54512da4b8514eb316edb
Message-Id: <159415710502.29940.10137709672282322588.pr-tracker-bot@kernel.org>
Date: Tue, 07 Jul 2020 21:25:05 +0000
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_172506_672393_9E949587 
X-CRM114-Status: UNSURE (   1.34  )
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
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 lkml <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The pull request you sent on Tue, 7 Jul 2020 06:18:57 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.8-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9e4d7696213f0231f7a54512da4b8514eb316edb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
