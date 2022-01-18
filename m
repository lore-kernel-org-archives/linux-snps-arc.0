Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F654C433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 Jan 2022 04:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BmyhmuyHU2OJfOQR93IdzYh5nSyxMKC6NuG/TyHDGec=; b=rstd2hETkeDetX
	seLAOmSIzG3PgNQH6QR35AJ9ScGC6kqgpGxQtpIo2DP40EYE/zoQuqdfbfLgFnfrCbJHJrmXsDQCH
	QOiECi9mMfi6cbT5lbjeTaZr5rLTXk3Z39lXSO+GRZKxF9cBNhucOV5EB54Wf7KrGUGo902gBtU2p
	bi1f17eCKKgxJ94t15KlXKxcQjAM6BEqp+A3pKj2FLb006DpjHpICzJVLMPWeDFU+MndGdJpgrrF4
	qWQUeC+zp+28J8QhCRiUx9hcQvGOezNVfJRHYro9Fx4TiEUZ/CE5yaqtTb47EyRO/ShacHYoKOb+6
	LJF4kdpv/+jfpcjrMZGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9gUZ-000GE4-RM; Tue, 18 Jan 2022 04:53:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9gUW-000GCp-TF
 for linux-snps-arc@lists.infradead.org; Tue, 18 Jan 2022 04:53:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 76F8E61349;
 Tue, 18 Jan 2022 04:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9D3AC340E0;
 Tue, 18 Jan 2022 04:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642481587;
 bh=iPxqe1UrOl4JJ+LY+BBuqN5nQ+hF4YAmA2A3UxxbtyE=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=u8sc1nXiiHXguSIDXtgunAQBhntuTEgZ0wxgphSiZmAaFT4DPflIGl0bC1u5g7JZf
 eMPTkqs5nS1YhBfLo/EauLaWJJF9qWn7wmSTR4cS/6xAyPbVvksHAPTjq7mBMxsESC
 7GIhtuNavbHVmT6GtekJjqHw4KV781qoi55B48Sgf8ukkDUGbXFBkQqahCYHEHKWom
 sNwO+wlbm0hDyG7lNb69owwWoHId7uLRnP58NHcsHD1/9BkE/IhuBWxEwArnr8EN4j
 2nQxKLUdEN8V9cig2u6P3jrAutGBxTKFYkvKrKxKZs3gZIXBw8gQBfEB/QVE4r4Fec
 j7NGI6n4JhsAA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 CE373F60794; Tue, 18 Jan 2022 04:53:07 +0000 (UTC)
Subject: Re: [GIT PULL] ARC updates for 5.17-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <4af6c0e7-03a3-702c-f364-b0ebe0f8923a@kernel.org>
References: <4af6c0e7-03a3-702c-f364-b0ebe0f8923a@kernel.org>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors
 <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <4af6c0e7-03a3-702c-f364-b0ebe0f8923a@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
 tags/arc-5.17-rc1
X-PR-Tracked-Commit-Id: 8f67f65d121cc3bbb4ffaae80e880aeb307d49f4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 62b488875c0551822ac3b961d04800d4c7a655d9
Message-Id: <164248158783.2547.2561234904707871792.pr-tracker-bot@kernel.org>
Date: Tue, 18 Jan 2022 04:53:07 +0000
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 lkml <linux-kernel@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, abrodkin@synopsys.com,
 Yihao Han <hanyihao@vivo.com>, Kees Cook <keescook@chromium.org>,
 colin.i.king@googlemail.com, Colin Ian King <colin.i.king@gmail.com>,
 Vladimir Isaev <isaev@synopsys.com>, Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_205308_992761_E0334500 
X-CRM114-Status: UNSURE (   5.40  )
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

The pull request you sent on Sun, 16 Jan 2022 19:27:35 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.17-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/62b488875c0551822ac3b961d04800d4c7a655d9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
