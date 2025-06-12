Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485F6C61CE8
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Jun 2025 19:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VkqXxqPxTKeeWSu23ZoqFedPihhs7zx2PnW7CenNTxI=; b=jl8r32HliGp6Bf
	4DBbKSc9Zkol22mtpQbS60m1XC4qSfbrpipbGaCxT/G/L263GRD2QV2pQ5kjlbLSIYbRDKlQ2e8WU
	IM4vinSvz8+RjFMaEhcVM1QNPuWbjtGu5VAmEaevbKne1nJ3am523Ik3w5/blQc87XbE4yygBDKsy
	mYwELYEzhtreGWt8Kxp71O0u15dvfb6+92V4xWq7fb+RAiWbH4jvUIS0Hq0vIBmhCZXvnC8Qm1aLS
	ks/YPL4B44P4TYWD4zJ6VBUa3ekcAJM1MSftVRVE5rTvuofeAZeq+mANXj+LcOGwS3SMOSJ82tylc
	1VZk34lkIlKUPkQXdXXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnqz-0000000EJka-45tk;
	Thu, 12 Jun 2025 19:44:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjrX-0000000Dn34-3Cav
	for linux-snps-arc@lists.infradead.org;
	Thu, 12 Jun 2025 15:29:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA43B49B68;
	Thu, 12 Jun 2025 15:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934AAC4CEEA;
	Thu, 12 Jun 2025 15:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749742146;
	bh=UNLzRa776RJODcoF+CnT30n0SiCPeOwJoEpOzseHN/U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nr7zA6TxyzxyVrbwdbFLgSuItqdSwV49d0mTEeB3/Mtk8ip7X7KF7uZu34+WoYCT+
	 Do13DqcSmuY6RxYuS/eU+DoO6FA/Ij+B+Gk56lIkcLq7TE0XB3COtAf3ptdDTCY0bY
	 g63jjkF4x/l1C1t6j60/ZyP1vhZYkvwBWe0dzDjtRU38su9quSYdm5DUo10QuEsnhP
	 BnTOxkQlgX7OsPLsVP4uT8FOjA2vQ/m1Wm0yn1xmQyKqyRuvRnSy5SXGqK6egBNaOz
	 7vIqQjNKfqBa2POEpI3nRhq9VgN94kzedmtCjciacK9eE8vo1KWCEDo8A2kB3EyxC2
	 t0Pcmej8S6EzQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADFA539EFFCF;
	Thu, 12 Jun 2025 15:29:37 +0000 (UTC)
Subject: Re: [GIT PULL] ARC updates for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <4cb508de-3af3-4796-ac74-2c082a578588@kernel.org>
References: <4cb508de-3af3-4796-ac74-2c082a578588@kernel.org>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <4cb508de-3af3-4796-ac74-2c082a578588@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-6.16-rc1
X-PR-Tracked-Commit-Id: 179e949719fe81219a3e23f1e716ac2d02eea845
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3d853391c441965d30cc94d00d59e8bb2dd0668c
Message-Id: <174974217638.4182490.1766621494814405934.pr-tracker-bot@kernel.org>
Date: Thu, 12 Jun 2025 15:29:36 +0000
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, arcml <linux-snps-arc@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, Yu-Chun Lin <eleanor15x@gmail.com>, Thomas Huth <thuth@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_082907_824416_F63BB2A5 
X-CRM114-Status: UNSURE (   2.71  )
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

The pull request you sent on Wed, 11 Jun 2025 20:29:45 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-6.16-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3d853391c441965d30cc94d00d59e8bb2dd0668c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
