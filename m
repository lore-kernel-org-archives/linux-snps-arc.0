Return-Path: <SRS0=KjRh=YV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2394CA9EC0
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Oct 2019 20:20:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5D0B21721
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Oct 2019 20:20:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o2Y6z0O2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRuGmvtE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5D0B21721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/O7aBZp3fvvPr8EepMb0r85kRRYu2nBI49Nhc12qHn0=; b=o2Y6z0O2UBwOpX
	jQxxsLcH4jMwT9SCu6vZFFlkXh931GO6VE2v5MSlHKf4GqOGM3UZbIiG4tP4crULMgKauly7Q9aJC
	eO8xF4N5f7I2xELOEfvlojAWDwiU2FZfCuKE0IH3ZepoMi1mO814HNraRP12kfrgr6Laiux6ehR5o
	ni8YkJpc6EibTE6iOT+ULU1tEQHbWnqCi8OEH8ujdGb5cv49cfe9qSdvb9vdOX0pp7Pksybd1fOUd
	pZ1RrHsYkP9jpue5fHj/AHjPpyH9HHq/qsm8kCppT+ugWaM53t1eRxO+n1zIorhLcmvniDMaKgEW+
	Vw5XkdgZ2XUpr/BUCb4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPBUw-0005L2-0G; Mon, 28 Oct 2019 20:20:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPBUu-0005KM-3D
 for linux-snps-arc@lists.infradead.org; Mon, 28 Oct 2019 20:20:17 +0000
Subject: Re: [GIT PULL] ARC updates for 5.4-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572294011;
 bh=0GVnVRNGBGu6Hx5mWyqIxPrEiVxA80/tdLfm/CA0CKo=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=dRuGmvtE8Vlj5Bvi9Vy88KijkiyWpKLjpbw2kaW7kwnr8Q/a543vTV1KGkPvVq3Ib
 /b6/gpP7x5sKCjXHrbwiIcr+ACastFj25h+oxDAhBDZw6bG0Fn35ZumpGSWT8qQvvl
 wUjiN180cWNwT+PS28g+5sJBRU9YPbjpB8NYAjS8=
From: pr-tracker-bot@kernel.org
In-Reply-To: <7ad0416c-af35-48e9-2d79-479d4a9d3e85@synopsys.com>
References: <7ad0416c-af35-48e9-2d79-479d4a9d3e85@synopsys.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <7ad0416c-af35-48e9-2d79-479d4a9d3e85@synopsys.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
 tags/arc-5.4-rc6
X-PR-Tracked-Commit-Id: 5effc09c4907901f0e71e68e5f2e14211d9a203f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8005803a2ca0af49f36f6e9329b5ecda3df27347
Message-Id: <157229400538.20529.9540881766939671045.pr-tracker-bot@kernel.org>
Date: Mon, 28 Oct 2019 20:20:05 +0000
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_132016_157362_64E0669D 
X-CRM114-Status: UNSURE (   0.71  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 lkml <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The pull request you sent on Mon, 28 Oct 2019 17:13:18 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.4-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8005803a2ca0af49f36f6e9329b5ecda3df27347

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
