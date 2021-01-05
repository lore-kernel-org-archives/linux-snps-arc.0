Return-Path: <SRS0=DkXR=GI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA37C433DB
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Jan 2021 20:48:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E77A22D50
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Jan 2021 20:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E77A22D50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKcg7h5zyhcsKS4/Z1zV8vg7SW8QRQP6jr/t5sG8siY=; b=CP9IdzcoGvDXFYblMMj3hQ9VrZ
	8bPdxnnIKJ5s2HuvU5ItLz0E62CMZGigLxrb4MUlsIbmWt7bm+T1LE+vZGKIPvqVXdEjCIXudI0tl
	nX9EAHV4EhdcBdDk8afH7NHfvT8XuezDdmsl8NKuKZNFRorZvst3ZgPsRoYaV+Ki8pR0I2N+bswFv
	99wk5ic+ynbrlwa9+6G0XVhK4pEUuoWnripH6CRLYC3mY/HIxXWXa2O316HVbv7oOV8fXNXwmS2Ky
	7AqP1zYaBeklhcXJmTVSyuL+jWIWD/PQASUsiu9MwLd/2qN3sRmsIBBsJJZncrXFuWkGFwUfU37Pl
	MMihTT0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwtGA-00077D-0U; Tue, 05 Jan 2021 20:48:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwtG8-00076q-Uk
 for linux-snps-arc@lists.infradead.org; Tue, 05 Jan 2021 20:48:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 2D29522262;
 Tue,  5 Jan 2021 20:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609879732;
 bh=Uj7nizIQUPx57WLpXR/988R3wQXEkcJeNYTSh8yYd9g=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=PkxMOFX76tfDWrD9t3EhuWPdjKNUrNjRxM+iJPzeSwWs9//mtRO/CuJKhviZWvO4W
 Sgx41UiOpxEAdoWPZGor1dRlYJv5G18CyofB8tC6xR2pPstcE5Uk2jxXA9lEAo0129
 WgCiHa7W6RsG+oqPfSb1MXK2o3LIv8bJNuVuUwwlahBh7Kj+WB13YUnVGolxN+ZSax
 1phymEh/m6osbSxJdcsYcUAOOHBb0n1HlNx3SMh8SnzT2sadqddGxNKQrPnTIFLAhl
 Gy+qMrPprjK6CmZADyhma4yCBDIKOvBQzoK3kbtuU8VPmsCZ/JqjaJ8XgiYZiW2Vwn
 n7qE9FxysjdCQ==
Subject: Re: [GIT PULL] ARC updates for 5.11-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <59b97fef-41fe-f520-6e3a-2d96958cc744@synopsys.com>
References: <59b97fef-41fe-f520-6e3a-2d96958cc744@synopsys.com>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors
 <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <59b97fef-41fe-f520-6e3a-2d96958cc744@synopsys.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
 tags/arc-5.11-rc3
X-PR-Tracked-Commit-Id: 3a71e423133a4b1166ffafcb4a7cfa87ddecb910
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f6e7a024bfe5e11d91ccff46bb576e3fb5a516ea
Message-Id: <160987973203.24340.16693717606222472990.pr-tracker-bot@kernel.org>
Date: Tue, 05 Jan 2021 20:48:52 +0000
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_154853_060864_B254D58F 
X-CRM114-Status: UNSURE (   3.94  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 lkml <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The pull request you sent on Tue, 5 Jan 2021 05:01:45 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.11-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f6e7a024bfe5e11d91ccff46bb576e3fb5a516ea

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
