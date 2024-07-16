Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46978C3DA49
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 Jul 2024 19:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZIwPw+tzn9Na2GcidHfgGyoTJ3Bonb0Z9cdNIpygpvk=; b=h9ugC+IvW6Doeg
	I04NMeQ/Cp7obzIZyCc7o63WS97yObuufVTslZb2JnPGXAj7roiOZ5/GtH165iuLjCNTfF46aaCI4
	fzn6sYn89FeSI0AjJ7mQKcOa4LaEQphCE+iU6xreXjVjFeLRcK8htT2M7Kj3R5AlihhF1Avvt5G5P
	Cd/L6WenAEOyE1ItIwut1s6hcBQ2fLLiVeYY5HpVSvIYxtcD5xFTpGZ7PJo6X1WaQyYhJYjANRKXH
	oJ4pRhX3anUk2Uiik42wONzpsBATQYD/Z2/I4jX+pzLxi6vXJ+ZgXSy5FHSOxvaYkel62ZPEB0Rzj
	7Jyg/q6rVQGfcx7JHJOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTnoS-0000000BV2i-2Y7I;
	Tue, 16 Jul 2024 19:26:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTno3-0000000BUkt-2ecr;
	Tue, 16 Jul 2024 19:25:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Date:Message-Id:References:
	In-Reply-To:From:Subject:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3+OP2bLDlk5Hzg2RQz1MLMtEttp5M2uqjKOd9WzUpQA=; b=g7K/UMs4Ol4Hfv28OpWsJ8ubp9
	hzC/nDhEnq/USP62Jd0rQ26hGcK02hznmush2bj1eufC/DEvhCQz+STU5ucDOQ5FkBgVSMKuGmghr
	LTfQX4QM/qJ+OhTyZwzsLjbLu1nGBem930xpro7i1yKZOF3YQe1n10/OFYigaaVhsOY7atAN8/xA9
	wjznj3xJPu2T39U2FW/ovYpeLjReagDijRt68BskKxqcllNHOk5Z5K+N5LpW56v/+FAhfVMx+glZe
	cy/TL3DMdFeIn+LMNqwY1fUm39EfYiGSmNVemOOoMDrjE7jIbi/wikmP7pTpKrQYeEyvj9QD4NH7h
	zDbfORRw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTnny-0000000278E-0DS1;
	Tue, 16 Jul 2024 19:25:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9513760A0A;
	Tue, 16 Jul 2024 19:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B295C116B1;
	Tue, 16 Jul 2024 19:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721157937;
	bh=ApR1CztnHPC86gcOL01YiStqVHhkte0QJGg8q7SbYBU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=QNxKgeY+29k8AhHmVqI0QWtTnJah5XwsjyLLzlbXcnHLpYmcAQ72y+wn4H/caMIE3
	 J7E2pGObxLEPLVPEa/IMMbr6Omf8k20Ie75kiv92Rh1RzbVs4IXtUkPG7AE/kpP7vs
	 P0D8R2++e4WUoxCn6QcMPWWvm0l+uhvI+1p6zPdcXqkx+c0rJ7elTRQaBw+ojcr47M
	 sBoyPtFDorqTf0zwCOR0iIWI3u9/IgME84C3HghlM860WKFGdlul/srP+bOgfZuOTG
	 Zb66hbsT0LZLAr5XPR5OCVvSA81XHi2JJ2274PjetXdxsoXkksxKio043bK8KcCxFx
	 1LCl3hlQEcMJA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4233FC43443;
	Tue, 16 Jul 2024 19:25:37 +0000 (UTC)
Subject: Re: [GIT PULL] asm-generic updates for 6.11
From: pr-tracker-bot@kernel.org
In-Reply-To: <a662962e-e650-4d99-bed2-aa45f0b2cf19@app.fastmail.com>
References: <a662962e-e650-4d99-bed2-aa45f0b2cf19@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arch.vger.kernel.org>
X-PR-Tracked-Message-Id: <a662962e-e650-4d99-bed2-aa45f0b2cf19@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git tags/asm-generic-6.11
X-PR-Tracked-Commit-Id: 1a7b7326d587c9a5e8ff067e70d6aaf0333f4bb3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d80f2996b8502779c39221a9e7c9ea7e361c0ae4
Message-Id: <172115793726.10577.15898736537891799499.pr-tracker-bot@kernel.org>
Date: Tue, 16 Jul 2024 19:25:37 +0000
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linux-snps-arc@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_202542_444426_A1D22A1F 
X-CRM114-Status: UNSURE (   3.51  )
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

The pull request you sent on Mon, 15 Jul 2024 23:14:27 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git tags/asm-generic-6.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d80f2996b8502779c39221a9e7c9ea7e361c0ae4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
