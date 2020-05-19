Return-Path: <SRS0=mq+M=7B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF35C433DF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 May 2020 22:45:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68757205CB
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 May 2020 22:45:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mM1sHg2a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+SDd8ji"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68757205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZP3s669L/4R00/9ZNyBFf78FR86oeXB81DHU8dBnwM=; b=mM1sHg2aa/TBnO
	nBMzyoHWt69AFnyF1nPcr1Py0DS9YEfVzZGtL0uuJSR1xP6H51K9e732fAVVpVfHY/MA8I9CBxD0x
	VTRTtgXjCugXDkt3wPqNzZiXDVjy8JwGCltCecpDn47IVT4S0OFtggBeVJy74Wd7vKZ2QsCuPYpKJ
	p+OT9JjNVU4cJprpSSL1VCivkrQDmgfM4qUpZNJ+r5vo9qkxhbz8QQuWfeCQv9jlcQxpZxnfeI28m
	PKR5agICJkh3iSq/fY4VsptIPrzqHU/N8BYh1UpiLRZoT99tZNIUMmBqq973bGj456tnko4bD8pGe
	nkIhyxoqTPm+vxvjNqRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbAyx-0003c0-L7; Tue, 19 May 2020 22:45:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbAyu-0002VM-9L
 for linux-snps-arc@lists.infradead.org; Tue, 19 May 2020 22:45:05 +0000
Subject: Re: [GIT PULL] ARC fixes for 5.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589928303;
 bh=1rEwKeAHu0x2w87U6rsILzo3vjbxhpKzOkOF66tLHwc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=b+SDd8jiKlAflj0dwyI5hGmba9jxbcvLTba58hPz4JEmCrUZi4SpnrWi1n+0fLewg
 RduzXAPqloq51MHXJXTBOvKEKpHjFjkTNsj9hMeT1blTJXsYFtD01BjDEvc7vPhe+H
 Jgj2Gm64JoXjgfIvC7ZMb/yC28GbSQf4LZ8Vkcz4=
From: pr-tracker-bot@kernel.org
In-Reply-To: <249e6795-1eef-60b8-807c-e2385a62818a@synopsys.com>
References: <249e6795-1eef-60b8-807c-e2385a62818a@synopsys.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <249e6795-1eef-60b8-807c-e2385a62818a@synopsys.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
 tags/arc-5.7-rc7
X-PR-Tracked-Commit-Id: 7915502377c54c9f58f6ac537bde0c2c342a6742
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3c9e66568ad40dc17518fa00e2b28c3b450040d4
Message-Id: <158992830327.1177.8316319357981803847.pr-tracker-bot@kernel.org>
Date: Tue, 19 May 2020 22:45:03 +0000
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_154504_377108_D8EE587B 
X-CRM114-Status: UNSURE (   1.28  )
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
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 lkml <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The pull request you sent on Tue, 19 May 2020 21:36:13 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.7-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3c9e66568ad40dc17518fa00e2b28c3b450040d4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
