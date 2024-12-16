Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F77E7716A
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Dec 2024 00:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XygOujmyqtweFzRk6bf21WdxroGDuetOnW+acxCRTSE=; b=1rrqokuEytUq8o
	/FoIehle8Kh515lm+7C6UrlxveywB85doIXmN4PV2s+gfGuZu+sIe4/DqPsTExAwMjOp9oRHJ19SK
	8Dhk6oqh7j6JlyQb7nQfHXgX91uJzugFy/PLLkXuCCQnYHd7lEUOOtHslSKozIxa+oNUlD10wtC5n
	YuSeT8wa7/6rVvLROgaSYeM1tZQP1EwUMCSqCLIPtZM0Fxr47m8DFaHy7Y7gKdXamtwJWrVAFPLjr
	Lx0oqc5lLA5fBSz2G301BLBu0Eqyn0EmveIK4ca5ZkZI8hCFb6PCBqCJHEPlIngJUcq2NAOsoZlj+
	joah5SJd/65lqQK9e88g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMyji-00000008g7L-3M2T;
	Mon, 16 Dec 2024 00:13:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMyjg-00000008g6v-2HC9
	for linux-snps-arc@lists.infradead.org;
	Mon, 16 Dec 2024 00:13:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 86793A402AB;
	Mon, 16 Dec 2024 00:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF67C4CECE;
	Mon, 16 Dec 2024 00:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734307999;
	bh=RJn+IaEoZC/3M/1x8cN0HA9p6PgrEofdWoaZqmOjDQ0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ULKbmjkB3WD6u4oneyslm7dBim0OC8NiwaXXjL2G8EIvoUZ87HjoNCWYSGFWRjoeB
	 5BLW4rU/aGcT9u0+9Jy0Xolx8qrQ8o+r8sYh3LhISoLNWVvBQMWFRsaF7caALxyAct
	 lo75952skZAyq30RuW615zx94v5XKVF92+yb5v5S0hLJTU5mYL2c76XxVMQkBoHhFD
	 RL2R8WwM/W4kY0dh0rpkZd5CNAlKBkHu8aD45Ih8YfGEzFXUOTpD1qWfklJC4OfzCt
	 cBUUzWQjPHjRk2cU33Q2Y7UjT8CoTA/VAw7CESwqPeIyUj69ueRwiiYRodyXtWfZsN
	 rP03SSXSuiYuA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 342883806656;
	Mon, 16 Dec 2024 00:13:37 +0000 (UTC)
Subject: Re: [GIT PULL] ARC fixes for 6.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <c7e0d492-c7a2-4266-904c-9b247a41fa20@kernel.org>
References: <c7e0d492-c7a2-4266-904c-9b247a41fa20@kernel.org>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <c7e0d492-c7a2-4266-904c-9b247a41fa20@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-6.13-fixes
X-PR-Tracked-Commit-Id: 824927e88456331c7a999fdf5d9d27923b619590
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 42a19aa1707cce382bc5e534e2e36024c3611674
Message-Id: <173430801590.3608335.14502846064962338951.pr-tracker-bot@kernel.org>
Date: Mon, 16 Dec 2024 00:13:35 +0000
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, lkml <linux-kernel@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, =?UTF-8?Q?Sz=C5=91ke_Benjamin?= <egyszeregy@freemail.hu>, Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, Leon Romanovsky <leon@kernel.org>, lukas Bulwahn <lukas.bulwahn@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241215_161320_648834_40AB6C94 
X-CRM114-Status: UNSURE (   3.29  )
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

The pull request you sent on Sun, 15 Dec 2024 12:49:55 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-6.13-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/42a19aa1707cce382bc5e534e2e36024c3611674

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
