Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF2AC433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 May 2022 00:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROk4UcAiRS9UDakNPxCo2cg94Gopf8BoA5vyVQ7f0W4=; b=LbdsAPwfWIlEb4
	c9mgsucCy1T8pB6L6slgv0BXjElKnKYkNQrmdL6NwPM0iCiCia9uVpvzgqT20gC6Tmy1OM4NzFGMy
	2Mp6d3smZ6NeMFKNJdHxZBcme5BG8k19CUaWWgG/TZTT+crUQ7DbkuPWpcMmArEM9bhGz1CmkBM20
	y0x6LFsdd2thRHBrKT5tKU/BbywJEc2O7qRqlX/ZRftEDvRJZYrrG31v+JKjfoZO0SuK7X5/DEHYd
	+MfjaNmwqYwIPMX559dFjMRVcREWKnLuCJDl0fdV74y97SyGGzVar6j4BPvvnoNrym51lSnCnPCJA
	owndMK1PEo9ryD1+h6Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuNuZ-00GHYW-RY; Fri, 27 May 2022 00:33:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuNuX-00GHXc-40
	for linux-snps-arc@lists.infradead.org; Fri, 27 May 2022 00:33:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D029DB82278;
	Fri, 27 May 2022 00:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F5C5C34116;
	Fri, 27 May 2022 00:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653611577;
	bh=jpsnKfN0XtgsYHiVoQJxTMWBCzeiS9DixxGqk4RlREk=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=gVAg96tHTTdMKUit0Oo/VnFdR9NUwEK9pVNfrzLhLU+8t1AQqUdxCcerNxH+QspAW
	 GEHfgTrSpdC8U/dDChvnHsuYFDiimXuBi8pDqZIWSm9pijz924d2OGjQVXIe2xhNUj
	 wM7YkZcevWD1f8oWFKFtAB5q8E0tFD8rXerOLhQFyF2uZU1UE3jxDvhcRD9m+cYEKZ
	 wJnsq+Jdf3JMWr+cXSQjjkCbe0V2OZOsjVrn8Q27sygV/4lxpSRcEvkpuOfASn5zgJ
	 98NeWP6QR9egP75RS7KOzpagMlr2oQR+AcAeWQjQ5Sfkld/eeE6Y3HU+BXpWzn5jkT
	 /zMSzOyJq5P+A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6D084F0394B;
	Fri, 27 May 2022 00:32:57 +0000 (UTC)
Subject: Re: [GIT PULL] ARC changes for 5.19-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <a22af786-288f-92ad-79a0-0f40768cfdbc@kernel.org>
References: <a22af786-288f-92ad-79a0-0f40768cfdbc@kernel.org>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <a22af786-288f-92ad-79a0-0f40768cfdbc@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.19-rc1
X-PR-Tracked-Commit-Id: 6aa98f6217861889523e38b0141c8c71b2ef8a83
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ba62a537b48d7ae60524000efe01c9e76e2a5b2d
Message-Id: <165361157744.27205.7451494152434674625.pr-tracker-bot@kernel.org>
Date: Fri, 27 May 2022 00:32:57 +0000
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, lkml <linux-kernel@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, abrodkin@synopsys.com, "geomatsi@gmail.com" <geomatsi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_173301_338907_0D1B02D0 
X-CRM114-Status: UNSURE (   4.16  )
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

The pull request you sent on Wed, 25 May 2022 20:40:39 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.19-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ba62a537b48d7ae60524000efe01c9e76e2a5b2d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
