Return-Path: <SRS0=k1DJ=PE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D9FC433F5
	for <linux-snps-arc@archiver.kernel.org>; Sat, 16 Oct 2021 16:23:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 662E86124F
	for <linux-snps-arc@archiver.kernel.org>; Sat, 16 Oct 2021 16:23:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 662E86124F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znXpzmQZT5UD7TnSJgT7mE33gEv9rqV/8UnXkcfMBig=; b=0Hv1qQZTl19qkC
	6Q5ms5yYkVo/pUsjsXZAvRnOgpdo/S06ydWKjHxDdNYFpsfgq0sdWN1r9YyG/mDUCfks9NHscDb2c
	H7qcgTdBDx4AxkC4ubDkdE4VUwtXTrFGP8ToK+Za7boeNJz7kO82kRyQHkOj8hV2Ffsm2DuF+kajl
	1C5hGuFdeRZB4hsuyYP0JlprgZCqqdqERT4J7tc4mRy/4rFm6aHrhTzpCb7PdqipgM7B52Dmo38KV
	7eJVgAmNYAL0ZLfonWqLaIEs5OGxjQEdxpozN3zBKLnqB8KsY8tT/zsmIrCEnFRvogD4hCmTRAjU2
	TSvhIbANBxLhLwpiK+UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbmT6-00Axzu-RS; Sat, 16 Oct 2021 16:23:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbmSv-00AxxM-Sw
 for linux-snps-arc@lists.infradead.org; Sat, 16 Oct 2021 16:23:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 8269B611C1;
 Sat, 16 Oct 2021 16:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634401401;
 bh=qSUEhZQAIX5RLkRs0n5qXJNIZdqWHr4nx1R2tLc3nNo=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=iRKFk/+YOCM7BR4nnGvmh9E1AWyBhgAyBD4IiIT5NXL5Adl+t26Pv7OXkhMeb80dG
 kZAbDc/DUqfzdrdtXXoL5Sek4nRF6PRq8Sj3qGAzqqcfPOWFe97Y48jfV4xR5tb2qP
 B9JA/TwWFOYJPisj8iEP+Eci8ATblyo/iwPNBL5MvRKM+beIMSNRHOuH7dKbeVPjN2
 ZDVuq9x9wH/X/JF6s3pUCtorPGgo1JbNjWM9GUfdR3uXzsy3nlBfD8Vus3Hx2ZiG+H
 qw3IFnLVvyyNe7AyFmoBa68Cl4oZTmIqOUYxrlb7i4BY2U0Q3uDqYUXPdfv0J7PtZx
 ZKOvW+R2VI1vQ==
Subject: Re: [GIT PULL] ARC fix for 5.15-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <8dd82653-d44e-7470-6490-bc486c09590b@kernel.org>
References: <8dd82653-d44e-7470-6490-bc486c09590b@kernel.org>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors
 <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <8dd82653-d44e-7470-6490-bc486c09590b@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
 tags/arc-5.15-rc6
X-PR-Tracked-Commit-Id: c3ca31ce0ea1e1ae34748ded54b6ccc319e7ed20
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5fd01b7263999c09f0596f5efd726b681474283c
Message-Id: <163440140150.26929.1332097449801208345.pr-tracker-bot@kernel.org>
Date: Sat, 16 Oct 2021 16:23:21 +0000
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 lkml <linux-kernel@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211016_092321_972778_6F7B8B1C 
X-CRM114-Status: UNSURE (   1.94  )
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

The pull request you sent on Fri, 15 Oct 2021 18:17:38 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.15-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5fd01b7263999c09f0596f5efd726b681474283c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
