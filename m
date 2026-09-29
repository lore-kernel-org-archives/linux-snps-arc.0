Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21085CA5FA7
	for <linux-snps-arc@archiver.kernel.org>; Tue, 29 Sep 2026 20:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yPcQDsfOg1KfUTV3DRzI5mv3ZgqcxkAUUrGoS94uSFc=; b=fp8muovxf3AD6e
	jJDmzYRFXaiP4FZT35JEDG/agfKnnSC+RVW01TlOLDmtAlbxrGXdrylgmAPIrNAjLkI+DTVY79Z5Q
	9s77rCqMpUCNHvkdNABdaHhwkLsWVPuOpks8/TvNcDAnh5K1hne9M/Fs/wh0How4RJhR3eTtWvdFA
	P0wHP/kZlzmmXNJ97a749qGcsfr7fpfXG/n+sydUPSc/boVePLEnDFoWs69jYgwVSKNuxC0zKC2x6
	WZqlzlzaoIFwniLarUmY2FFvu6C5VD5OBApxdPbQ04ZO5bxVGsQn/1aVvWAkI2erJI/99a5ilk2Fp
	WJAJpY6O24FeHL3PEo1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBels-00000004WvF-3ULf;
	Tue, 29 Sep 2026 20:49:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBelr-00000004Wuz-3oFd
	for linux-snps-arc@lists.infradead.org;
	Tue, 29 Sep 2026 20:49:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 504836022B;
	Tue, 29 Sep 2026 20:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A8D1F000FF;
	Tue, 29 Sep 2026 20:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790714991;
	bh=1iOSNWKYRhkt3pH/BWmpiyn0/pgZfn49qCHlZfv04Hs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=CvgGtbCmlne+dr0BaABZeoAVTIf+jpJF9Oveg73lvL+1W/Or0yk9v2sudbdulNS63
	 qW7RpvV8T02Oa8cKM7ggOMUsp/kOAuEqZ63enYMnAH3ziVZoWB7+KPIdvpX1wBeICV
	 TgSK3GtKwiaWo939DClU+gr3pLTriQgRZCm6MdjxfoC3qNzSbG3I2gr07mRgt+OOpL
	 cMRDlHJ0laG5RT23SiMR5eux6cKaqLsQKcFjns9T/Gn1WaTIMLPs7B/mj/vqCRrC76
	 eWyaoE3EnjQY2VhHtIte9zlw1cd2DTV8y/e6ZXbtupnL3EEhgDl5D2otgjeIWU1VX/
	 ecx7IHClUjL6g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F172139D237E;
	Tue, 29 Sep 2026 20:49:50 +0000 (UTC)
Subject: Re: [GIT PULL] ARC updates for 7.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <edb955af-9153-4db1-8a9e-3d729cb99753@kernel.org>
References: <edb955af-9153-4db1-8a9e-3d729cb99753@kernel.org>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <edb955af-9153-4db1-8a9e-3d729cb99753@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-fixes-7.3
X-PR-Tracked-Commit-Id: f050c3e61d2a1aaece3170d459e4ce5fa2486c12
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b004c4b1c4180fc7f2326de4ac941d5edfe16076
Message-Id: <179071498945.1114410.5170593329342914503.pr-tracker-bot@kernel.org>
Date: Tue, 29 Sep 2026 20:49:49 +0000
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, lkml <linux-kernel@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, Bradley Morgan <brads@mainlining.org>, blaze <1466528493@qq.com>, Anthony Iliopoulos <ailiop@suse.com>, "Paul E. McKenney" <paulmck@kernel.org>
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

The pull request you sent on Tue, 29 Sep 2026 10:58:53 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-fixes-7.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b004c4b1c4180fc7f2326de4ac941d5edfe16076

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
