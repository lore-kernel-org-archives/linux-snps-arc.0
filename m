Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2F7C83F33
	for <linux-snps-arc@archiver.kernel.org>; Mon,  4 Sep 2023 22:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LmSZ7q7jtMldyY7twjOlYzKAxWhvp9uFXMV7Igx8xuU=; b=AejTI3k2Hnn5Yn
	JlrsncYedLECcuPfSzClRjnzzpMEd7uiXDGyaAGUmLUInW0zO91NkO1FVpD96tV4bLMaFFjAkYiM5
	rXjBM9FGc+I4I51I+WkNChgADC6HnlEGg0YUeNPayEjUyxenIHOvmtMs9L667DoiiLjIc+VJqY6KS
	/iUWpDhx1Rcq/mN1s80OfGiy2g6E8C7r2DzdgzypGOWjUhV3Tq+wHO1xlrnV+7b7pP/OI/S/LuV90
	zlSnSGj+CGsBBW9JPdE7t9O8jh3Xt0TeS+0X1i04yLUHqm6EAV5a/cETaM7Sy0RQ7UkEsSDSKP6u/
	rFFtbOs49xl8fWceN0Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdIPa-004vng-2S;
	Mon, 04 Sep 2023 22:51:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdIPX-004vmj-34
	for linux-snps-arc@lists.infradead.org;
	Mon, 04 Sep 2023 22:51:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5164AB80FD3;
	Mon,  4 Sep 2023 22:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15C4CC433C8;
	Mon,  4 Sep 2023 22:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693867869;
	bh=+u6t1Q/EO7jAB+PtoBiO0lk7Jxf+tcJQrXYevXc1tSg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ZuFWE/euw/Pfu0J61H748BFBrH3hWRcJ2gILkESWW+63a0soNuqQXnnkaTf1nayA2
	 bPlbTOCknHPpKUFKLnhADo3V0bQkVqp4pZrII4j7KVs/OWqvRDod8iDi9ZK6UP3MtW
	 KjvWdKELmhGksYlyTsriii2467kzSR42u5Cqvy3QTpzzvF0nZeE1zPPVl6N20abXLI
	 ZbGUb3SSk/NpKUO8hPqoa8zt3vVDP06b4xe6BtUqg5sACjINcgSpwQ2LZVwkeCLNky
	 U1AcRQIrx52Frn8O4PYWRqlrImi2yuJkdL7hQesf5r7U+cw3zGqV01L+XYKrPAqH+U
	 6VuFoxpe192iw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EF41DC04DD9;
	Mon,  4 Sep 2023 22:51:08 +0000 (UTC)
Subject: Re: [GIT PULL] ARC updates for v6.6-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <e6a52dbf-231e-2f23-78a6-54a8e62c3f27@kernel.org>
References: <e6a52dbf-231e-2f23-78a6-54a8e62c3f27@kernel.org>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <e6a52dbf-231e-2f23-78a6-54a8e62c3f27@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-6.6-rc1
X-PR-Tracked-Commit-Id: c40cad3b0aa47d6d0995637178fb6607ac3d45c1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3f86ed6ec0b390c033eae7f9c487a3fea268e027
Message-Id: <169386786897.10061.7564144087926700587.pr-tracker-bot@kernel.org>
Date: Mon, 04 Sep 2023 22:51:08 +0000
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, arcml <linux-snps-arc@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_155112_152998_9096A75F 
X-CRM114-Status: UNSURE (   4.60  )
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

The pull request you sent on Mon, 4 Sep 2023 14:03:20 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-6.6-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3f86ed6ec0b390c033eae7f9c487a3fea268e027

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
