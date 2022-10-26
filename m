Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D84C433FE
	for <linux-snps-arc@archiver.kernel.org>; Wed, 26 Oct 2022 19:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zbyL1WAToL/soTsZuWshgHSNobMmyYllxJFWHK43czs=; b=iJFyszoF0oSRIp
	DFKaTOzg9GVljF+U5morD5dPnUPo7XgolOruC3q4KAWH2HqJqgIruKNGhmnzBXeuOtlvt5SAaWO2I
	5WeJ9v0X9xdATqwvkEVpwa2//CM2bu4V8/3rCTp/IbTo+JozQwmERwz6h1+CRZ87+lYjuWm8flEbA
	Spr9QiFFJDEyZwOwFAdm7ofF3kM5x76g55g7StAGZKyTeMq6DG9H5J3gWWBLhCNozVNmMvDsy1Ly7
	G5JM7uKVIWiB8B5o3mfwFwIj5mCivSZNgmHE05yv4GmsRtkWQu7l/rGKKozNIx/3pD49XCukJpFyW
	MMFscFaB7Rh5L//Xeemg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onlx3-00Akx2-Tn; Wed, 26 Oct 2022 19:20:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onllJ-00Aghd-Oa
	for linux-snps-arc@lists.infradead.org; Wed, 26 Oct 2022 19:08:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 77233B8241F;
	Wed, 26 Oct 2022 19:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E6F1C433D7;
	Wed, 26 Oct 2022 19:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666811302;
	bh=P3L3cdGLMXd0xVqvo/dx7s/uOxH51JWvUkupryq4KJk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WjJ7tChHSmjjiWPpdacbl2rUDcmABaF8hozC/DJ1pTgbjCci892N4waYjdvTsilkQ
	 pluGYQKK7+jZ/XD4hCNw42auNnlZBZOjQ2GR+vRXGrsbhpe5Kb5foPDPxkgluQySus
	 S1Jk9rKZAQJZ7YowUK+iDJpsLzbwcKqpNxV1+WPqX50/OIdRlCqkgjFF9Q304W6Zft
	 6EWQozfRROP509/omKlhAmfhYB+scMOiTJi16iryZJ9WWGDxNIGapUZ+37p5ZsYRU+
	 E4f4IwzSE1KTSmECOyKjjKKIKne7LduH/JamJ0eQwT/NUqSSaE8AvyoeiFizYCjqtO
	 l4Nt6LW5Y3USw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0B625E270DC;
	Wed, 26 Oct 2022 19:08:22 +0000 (UTC)
Subject: Re: [GIT PULL] ARC updates for 6.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <9ad919b3-b450-8e22-c422-371957c41391@kernel.org>
References: <9ad919b3-b450-8e22-c422-371957c41391@kernel.org>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <9ad919b3-b450-8e22-c422-371957c41391@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-6.1-fixes
X-PR-Tracked-Commit-Id: 4fd9df10cb7a9289fbd22d669f9f98164d95a1ce
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 98555239e4c3aab1810d84073166eef6d54eeb3d
Message-Id: <166681130203.7871.1414736923787179270.pr-tracker-bot@kernel.org>
Date: Wed, 26 Oct 2022 19:08:22 +0000
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, lkml <linux-kernel@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>, Jilin Yuan <yuanjilin@cdjrlc.com>, Pavel.Kozlov@synopsys.com, Randy Dunlap <rdunlap@infradead.org>, Serge Semin <fancer.lancer@gmail.com>, Zhang Jiaming <jiaming@nfschina.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_120825_985897_C31EA927 
X-CRM114-Status: UNSURE (   4.82  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The pull request you sent on Tue, 25 Oct 2022 21:05:17 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-6.1-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/98555239e4c3aab1810d84073166eef6d54eeb3d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
