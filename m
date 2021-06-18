Return-Path: <SRS0=ODk2=LM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD07BC48BDF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Jun 2021 19:30:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DB6D613E8
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Jun 2021 19:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DB6D613E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6H/V9EeHJGjNz8Ivx8C8UxDG5qlrZF+gzG2+c6CwwA=; b=e7AYrnF2PKQuGT
	F03Ba5CrElAdlTU7J8taDPbhS45C4ojBhEm7uO3EkgLqXc8bs2K3VyAyUsTRhSLztOPuPC6vye0gx
	u3jO1EdcN23GQgtH+ax09oe1uHtTrUJJz03lA8nozih2wG7z8NKZ58dv1GsVKyUPz0oW7RJLa4uQ5
	tJSVFsBUQTNc7Fqc/7Wupw4vZeLi+rE97x1K1Hq9YQC71xmgqcOwH7pugC7P6gbSMzdMFR9Tfm51b
	mBbgJmc+53GgIbrv7Z3sY+vGctM0X8fTrfhIaZaN0OVuocasfwnL//TJZuPlr7ZswXif7XPlT7iF4
	pa/CxbjddjPdDyzBsBcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luKCC-00FInH-40; Fri, 18 Jun 2021 19:30:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luKC9-00FImX-21
 for linux-snps-arc@lists.infradead.org; Fri, 18 Jun 2021 19:30:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 42C7A61279;
 Fri, 18 Jun 2021 19:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624044624;
 bh=Pl3fd+zhAVxKxIcpfO/lvsnFa+vN43WOInnXgCWlgvA=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=AJPFDv+0hNHog6DnBzoBrZr/iZj+t6AhaakIr0LTfbhxqxZIcoTdXte2SXJqGcYm7
 /Ds5UpgwWRGTTh0OSDh5sYZvF2tvWQGPYUojE5DAPZZh5MpYQDOE3i63csbF+Gw3HV
 MwpANZWfuMG+Junt4K4tBFBNNgZZxx3vmHHBAAhdYVTUBTct6BThn4Lw5wRG9zBrVq
 LUlU/CYJRLT/QAYKEbD+ou4/W+UoLxnGak58l8EjZGfPQ69xZ6fVay+5jU6wgzXSCO
 QQY56/H5vMT8x/WqWL7Y7JYmGpHinitF+QUmkGQFZgu1YtZbyJPxGBfplmAxmOW+d5
 81BEzIzontdlg==
Subject: Re: [GIT PULL] ARC fixes for 5.13-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <f29fc4e4-77ca-f026-eb1b-c82fab8bb30b@synopsys.com>
References: <f29fc4e4-77ca-f026-eb1b-c82fab8bb30b@synopsys.com>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors
 <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <f29fc4e4-77ca-f026-eb1b-c82fab8bb30b@synopsys.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
 tags/arc-5.13-rc7-fixes
X-PR-Tracked-Commit-Id: 110febc0148f8ab867344061d5cf95ee1e1ebb3e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b1edae0d5f2e79e2bdc523c1459f8c52ad26485f
Message-Id: <162404462420.17995.2302276550956275328.pr-tracker-bot@kernel.org>
Date: Fri, 18 Jun 2021 19:30:24 +0000
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_123025_157454_E29CDB23 
X-CRM114-Status: UNSURE (   2.55  )
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

The pull request you sent on Fri, 18 Jun 2021 17:18:30 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.13-rc7-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b1edae0d5f2e79e2bdc523c1459f8c52ad26485f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
