Return-Path: <SRS0=TLQJ=5T=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE08C43331
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Apr 2020 22:35:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D68E92076E
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Apr 2020 22:35:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZX0KTPIb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qg85EO8D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D68E92076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nhuXC/X7JGx6pnaMSiR2GkahyfNS8D5SqoGQYXlyGpk=; b=ZX0KTPIbf8NTsm
	q0to/DtQ3LWyjd0ce1GpYlrsNZnkFBvWFNS4TC47J1ZYPVCOmcA7EzmYJ02op0JMJdQgY+eyo374l
	EKo0stf0u/BQILS5YV2HFixxJsk2UaN3JUYM2NOolQy1OgLv9IBW3jGG37uy4zrdNzF3HmP6ar9Lu
	UKQNdHS2FnUZ6PmX05mksZNH2sF93Cm3ZOpEC20WvE5jLE9cEMPp/8lidsFdWw2MxqO52mDzp9t0e
	Z3cGHIIZGXgcZZkacBoe3Aktn+MnuDe2b5pUFwaJcEUoU0lI4olVOScwiGlgM80duz/ueWv79s9cY
	hpw8sMVqc/KBojTjrouw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKUuL-0003Z0-M7; Fri, 03 Apr 2020 22:35:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKUuJ-0003Yb-Ga
 for linux-snps-arc@lists.infradead.org; Fri, 03 Apr 2020 22:35:24 +0000
Subject: Re: [GIT PULL] ARC updates for 5.7-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585953323;
 bh=v+le28gRLVWY6lPssJBpFW6VcLI4Pu4cjJLU3vSr/uc=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=Qg85EO8Dx75TjEQpKPOyh/IU7UFa+jV2BPwlfBuhtl3Pz1wvzWN236MRiZU6vKqeu
 Fx8ZUjmIgmFEV+83ikwuf28nTq/IhEf21vI43EWf7K4IfpgZ0ebG4tdCT907Z9b0Le
 8/jh7lIPg68eDQCvNG2YZXKz/rwNWiz5i4lqMsaI=
From: pr-tracker-bot@kernel.org
In-Reply-To: <5b7afdcd-48dc-dc90-d7c0-53559a3ca3b8@synopsys.com>
References: <5b7afdcd-48dc-dc90-d7c0-53559a3ca3b8@synopsys.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <5b7afdcd-48dc-dc90-d7c0-53559a3ca3b8@synopsys.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
 tags/arc-5.7-rc1
X-PR-Tracked-Commit-Id: f09d3174f002ee2cf15623d5a0f68f7393536ce7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5364abc57993b3bf60c41923cb98a8f1a594e749
Message-Id: <158595332318.22488.8622901512202674698.pr-tracker-bot@kernel.org>
Date: Fri, 03 Apr 2020 22:35:23 +0000
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_153523_571256_CF9B7BC4 
X-CRM114-Status: UNSURE (   0.77  )
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
 arcml <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 lkml <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The pull request you sent on Fri, 3 Apr 2020 21:57:33 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.7-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5364abc57993b3bf60c41923cb98a8f1a594e749

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
