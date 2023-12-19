Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1509BC41535
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 Dec 2023 20:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fy9J3co6X/FbG0X7QBVbrIMol7wbHRc3r16U5OqQVAs=; b=s6i2+6uJZTAt/1
	sV0aAgdMOSqPP3HKPhoHlKHhoR1JPECyHzrjZm19S1DmgEPifDxKjyxR8aztdnwDK2WhfzZyt+KqY
	plq7StmcMz+hf+MbUeKqACQlCzvCEbGqaDlgcosPqUgY/U3cN1YCjhPd8lW06m2wQmY+sS+9X9R7R
	+2j7jyy8tnp2yF/bzw1lUTK5kYBsB56M7BBaRrzGbeDSc8aStYKSUvTny5d48UfrKvVw+70INLXs+
	EmGijldZ7ZcjatT6lNmVYW83NwCpa/7TdhEPyEh049IcMCREQCrWssI4EAlRXwAwyhzj5+9vbNE1f
	SnOt4PotNY2yOjpOR0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFgug-00FR78-0K;
	Tue, 19 Dec 2023 20:42:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFgub-00FR4b-1E
	for linux-snps-arc@lists.infradead.org;
	Tue, 19 Dec 2023 20:42:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9690ECE1ABD;
	Tue, 19 Dec 2023 20:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFFD1C433C7;
	Tue, 19 Dec 2023 20:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703018513;
	bh=IBAg6KoMW0tpFU64tSRXNGdLF5fWVhdSLcYQeFL3PHI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=XOkVDQYKuRO70/49YYxAJjDYMVckZI2lkjNNF6UqYJ5mljATLIk+M5k+A0p1zuks2
	 UB3h8jHiZYKBf2IjhXqidSzVoWhaXzFSFV9Ii7nI50C1pwsr6kLCspVgzM2Z9MScGa
	 hzoCOOlSU6NP1pDubNQLPjKVBuLcXalnHoz/vXiA3h6ZgeIEORPQNtwRteBe8pVYp6
	 CoaADkyfejRoQaXDivOs8h/aCUAJCJfcGTAGaxYKjPEqO6ZCJTTrZJkttVqWd55+CF
	 L3xn6ffprYIXHlAdsNkoX7OIicJz1pYYUBHRUadlAv5u77ZbUlh+uxExxf2pEZCkuX
	 E9tEUv4J7ag/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B83FCC41677;
	Tue, 19 Dec 2023 20:41:53 +0000 (UTC)
Subject: Re: [GIT PULL] ARC fixes for 6.7
From: pr-tracker-bot@kernel.org
In-Reply-To: <889dc07d-f00f-4012-985d-314da7dda52d@kernel.org>
References: <889dc07d-f00f-4012-985d-314da7dda52d@kernel.org>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <889dc07d-f00f-4012-985d-314da7dda52d@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-6.7-fixes
X-PR-Tracked-Commit-Id: 9a733dc4fbeec3f6d99645b845712b035e7440cf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9c749e61a1104ba9cf00519e723a7fa8ac55db0d
Message-Id: <170301851374.10204.8664760239849581601.pr-tracker-bot@kernel.org>
Date: Tue, 19 Dec 2023 20:41:53 +0000
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, arcml <linux-snps-arc@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>, Pavel Kozlov <Pavel.Kozlov@synopsys.com>, Dan Carpenter <dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_124157_655095_A7976350 
X-CRM114-Status: UNSURE (   3.20  )
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

The pull request you sent on Mon, 18 Dec 2023 21:19:03 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-6.7-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9c749e61a1104ba9cf00519e723a7fa8ac55db0d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
