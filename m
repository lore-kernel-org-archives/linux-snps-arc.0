Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17839C44526
	for <linux-snps-arc@archiver.kernel.org>; Sun, 19 Jul 2026 04:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7XW1zvkcYof8mZuMCK8mKX6oBpINSQkHd1ooutPuicc=; b=j9XSybgUd6YEIX
	KP7ZcDnCeZctjjmDe9MHkN4Fpeb8rlYBMEx4a5noZc/0Sk3/s8cUoZZ1pjWCQVR2i30DczJqTc9Yt
	XQS6nubaGYndaxMwR0ACmGoFhEdpOmax/gRzvO/TeHufAM2kck9DIsa1ml0AeDqIf0Q18gQfUvOZc
	8Lab5k5M10e8ots8ZcM2r42z0ynZJyFyazO/faxdtzGbAQW+jdMPptX7WD1nh6kSi29/lTJL++MWE
	NJ/tP843Nt8pPiT4NvgbgJfGWymCbrfYw7DH5RRVLNjDV/7LwWegBBtft5Of0+6vZJdaZZ7+ntCqV
	bo//aVqL+ge63W7q3R1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlIyH-00000004kEB-0XQ9;
	Sun, 19 Jul 2026 04:17:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlIyF-00000004kE1-05WW
	for linux-snps-arc@lists.infradead.org;
	Sun, 19 Jul 2026 04:17:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D8CC60052;
	Sun, 19 Jul 2026 04:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1265D1F00A3A;
	Sun, 19 Jul 2026 04:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784434660;
	bh=n4dtiTBDDjyH9O4kpeDRDU9KiIpEAcpsFvjSW8PXIsk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=RM7vPBNwsqRij7tYLIaN7D5tgMsi0Pva3miAfqg0hN1aQas9jxtMhEiVkYa2YA7w4
	 T2wHyj35jCV7nmTenOvdS5mXRwsIHdgJpD3YrAY9l52Qb+wNBvub6oRuqfP7zLzL5O
	 cHtCcjluVKykjl73ILwPA0fnIV1eQdVmhTqqdsVY36dKhm0nTjCYGeap6GX7oVnyeD
	 fmOYTGmCdVLR0gvwv2f+a94fGLuz/ZAiDpflkr3e/9TXVuvSXnfSzZnHs/rNHqtEzT
	 FWU72pbNaTgmDFEV5XhgLHG3+KTDhYb6ka80t1aK10DQX+W6dRak/o5ZI21SWvZNPW
	 i3Z5CTwj3l5ZQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A5D381197B;
	Sun, 19 Jul 2026 04:17:12 +0000 (UTC)
Subject: Re: [GIT PULL] ARC fixes for 7.2-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <c3c3fbba-a65d-4add-96cd-6ffa61b24dec@kernel.org>
References: <c3c3fbba-a65d-4add-96cd-6ffa61b24dec@kernel.org>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <c3c3fbba-a65d-4add-96cd-6ffa61b24dec@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-7.2-fixes
X-PR-Tracked-Commit-Id: 76f38ad1b39cf0321f7ecb7ea37b46f61a0f3d75
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 80c1c309d8f2f02573c20410150ade13d8377af7
Message-Id: <178443463126.2648133.16417197745936376531.pr-tracker-bot@kernel.org>
Date: Sun, 19 Jul 2026 04:17:11 +0000
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, lkml <linux-kernel@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>
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

The pull request you sent on Sat, 18 Jul 2026 16:23:28 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-7.2-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/80c1c309d8f2f02573c20410150ade13d8377af7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
