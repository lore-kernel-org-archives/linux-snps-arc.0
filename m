Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2314EC4338F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 02:40:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3FE060ED8
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 02:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3FE060ED8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WVb0qO3EaNCnMJf+vRTlqWQRa+p1khoK5Sei02q378I=; b=uttAVKFxXW1k7y
	evru8t9qVF4rak4+6pUO+PGZ9aqIc3I8hdS2Gjz44gbk2aNrWOrnGxCK5+e3JhgXV/KYfxJV5vrTq
	cu+HmlJf//rvr4AqIOrI7w+5D0cAnyp7UcJSkTUyqYMuXDV1q2i2s24AvS3DRWRnidNNUQ/dwHUMq
	BU70vcZFBl39NoRd2QEBSqCnZav4uMfkJMfUTvmThVeC19arSIgo4RFwi6hxyJ7xJq6LQQAan/z5a
	WTP1I5MhWIr0YVE4l5qt+0G0iGMOKNcu3WRtmUHWvnfALSc5CKvcA86b3fJbXtUpvX6zAVFMFXb0x
	/v6uJ/+/cqhXxOCGJBkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDeA9-005IJh-9p; Wed, 11 Aug 2021 02:40:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDeA6-005IJ4-CT
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 02:40:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 9385960EC0;
 Wed, 11 Aug 2021 02:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628649605;
 bh=KD6zgAv2K8DXOJ18xOdRewQcHLapTLrzN3ASorWseLw=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=DrpDcLPCpG6qQh6rpU39WGI9HOGuF3JwSoBuQCPinmhNyp2KsH0Fu/xl5AqeoJ8mM
 CTiL9RqMr1RcmAiXv4YPNlXDPOK5JSeA5JtJ+TLGPDhcK1Pz4P/3HG0vW53YS9byNm
 ybkCVYuE2u+NBOJ8D5Qu/CMAA7cBgppdN7eztiObAzN/wd9mKpy5fShLX4Tg4hIiCz
 09Ji/sdp7ndhHwz1CKjERy0CZZ3VK+w2vSwmRolvuP49Rk+LrfTgxLsFfJO7z3KvNV
 ym0JA8JlOW3sQRfo2fGQKTHZfQKZ3GNucHgxTO6sO2xq2gjN3I37wIvZcks09lBqQO
 SHesEbq1poC2Q==
Subject: Re: [GIT PULL] ARC updates for 5.14-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <931efd74-4b45-fd24-8c88-97f57f97e01c@kernel.org>
References: <931efd74-4b45-fd24-8c88-97f57f97e01c@kernel.org>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors
 <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <931efd74-4b45-fd24-8c88-97f57f97e01c@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
 tags/arc-5.14-rc6
X-PR-Tracked-Commit-Id: 669d94219d91a2ba950bb12ece69cf0ada53ad4f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 761c6d7ec820f123b931e7b8ef7ec7c8564e450f
Message-Id: <162864960545.20572.13474655779418607583.pr-tracker-bot@kernel.org>
Date: Wed, 11 Aug 2021 02:40:05 +0000
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, Colin King <colin.king@canonical.com>,
 Guenter Roeck <linux@roeck-us.net>, Jinchao Wang <wjc@cdjrlc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_194010_483596_8DA0529A 
X-CRM114-Status: UNSURE (   2.62  )
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

The pull request you sent on Tue, 10 Aug 2021 16:21:30 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.14-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/761c6d7ec820f123b931e7b8ef7ec7c8564e450f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
