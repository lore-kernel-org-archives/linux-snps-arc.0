Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7F0606A325
	for <linux-snps-arc@archiver.kernel.org>; Wed, 18 Nov 2026 03:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RGubYSYK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AQTfpxAd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tlaKLy7QJfsQueCEVudY0lc9ovIkDe09K3N/SsWjyYA=; b=RGubYSYKR4FQ8D/0B2MrjseO8k
	BnvXKyPZb24Gh1Ib8ayV+OSPv4VJJXK/zri4IOsDG+GJs/v4GOyyJeRHRPPYrdsSm2UDmT6nT0Mba
	/PzlCMXF1XGNXSlsduA+8PfU3S+Mv3qUgu1obMhKnUOiXbPpmWWGIFiiY1iD4bH25soUIh2ZLtUVB
	8QNc2b8gIKac/o40rTsmYxGD6WA0goH7wV9h4G2rPKJ6CmGjynsZluPaNwi7yora63i0W2wmVhG06
	l+ne1AY9tx70oKjRKnf/9rVigTqG0vVgcXSr05OFSSBKV9GRMw3HOgmqi8saKbhRcM2Lu5GpJf6HP
	itjDnvJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWN6-00000007doR-3PpT;
	Wed, 18 Nov 2026 03:30:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTWN5-00000007doF-40RL
	for linux-snps-arc@lists.infradead.org;
	Wed, 18 Nov 2026 03:30:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B25A64145E;
	Wed, 18 Nov 2026 03:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 882E71F000C5;
	Wed, 18 Nov 2026 03:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794972607;
	bh=WNlKUzO9dC46ENgjAOmyvbq0eHtwGfnbJtRGpMkd9ho=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=AQTfpxAdzkAWaKRvAGuthxrKOG0M5PgmFZnI0VZWjxpGqzxVAWiMeNGeGfFI0sbbM
	 ixVOsPrxPtuKOcxTK2hjfmlSLVcM0gUK6M9+5qfwYOJQa1XmFvPyKK/41tP4FMMFna
	 lhtlbHFd4FI8J8tAtMz527PaN8jrg3IQJl6Sc88vHQK6AibjHjoPfZg2tGGDu6tcbY
	 vyvRyEVobVEHh/cuwZ/dQ+MRpaWW9iREES5jwu40ylBa/wR9FR5R70w8ZFl3kNST7D
	 emz2MD8Y4+oxVUMxhyGDrz5nKxDJQHgZqAyrAybhSTnWpKW8G27tsQSkAp+/ao3uiW
	 GB0cr7Byg13hw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 786B6392E983;
	Wed, 18 Nov 2026 03:30:07 +0000 (UTC)
Subject: Re: [GIT PULL] ARC fixes for 7.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <62e47ef1-060f-41a2-b7f4-5c80a5c2f7d9@kernel.org>
References: <62e47ef1-060f-41a2-b7f4-5c80a5c2f7d9@kernel.org>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <62e47ef1-060f-41a2-b7f4-5c80a5c2f7d9@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-fixes-7.4
X-PR-Tracked-Commit-Id: 603b4fd69b4e77770761ea03451e2164186f8590
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca
Message-Id: <179497260635.1442024.980012530592780252.pr-tracker-bot@kernel.org>
Date: Wed, 18 Nov 2026 03:30:06 +0000
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, lkml <linux-kernel@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, Michiel Derhaeg <michiel@derhaeg.be>
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The pull request you sent on Tue, 17 Nov 2026 18:41:12 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-fixes-7.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/20eef29b7c8465ac98d7dd6d6f2ac07a8d8056ca

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
