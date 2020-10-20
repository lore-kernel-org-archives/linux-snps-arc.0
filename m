Return-Path: <SRS0=Bb/B=D3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D40BEC4363A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Oct 2020 16:46:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48C35206CA
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Oct 2020 16:46:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hH+3suFa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bd5IEG7x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48C35206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtbaEVbbqA5uizRQZ3f3AoXi/rOglfllhWUTlkWMZMA=; b=hH+3suFaStPqk5oTjN8fpNCeF0
	brEOFLBoMJMhg76lW1euPO+vZs6OuhdqxTkriQBLtaE4rumazdKK++S/qb/5mrQoc9i76/Xiv52JT
	CKjSPYh624eRnC02yy1QYSVzhZNx33UVo8A8SUSmMAA/mMQuAhg9bt31lyZ1GOgM1INrnX0b3YX7l
	WXK3pUz5ZmBMPASZx/xzWiKk4HeeujR6cI3mJPGwVorOTqhmPfgt3uvyQaxLEeml2LpBgNenTTX7S
	1vNdm/TzoKktM952NVg2Eu5tKULxAftCJxM9DbhyykKTVshNhajK1FPlCcsR9Mq0MjNo+NBrPFS4G
	2oKqDNHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUum4-00024P-3T; Tue, 20 Oct 2020 16:46:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUulx-00022W-Gp
 for linux-snps-arc@lists.infradead.org; Tue, 20 Oct 2020 16:46:10 +0000
Subject: Re: [GIT PULL] ARC changes for 5.10-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603212364;
 bh=LQPiQPmS9JRz9yams9x2cA8qS2ds1jJjHVTUV12Mh1c=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=bd5IEG7xnL4SUIeD3rTEPvZSqSWyDnWGtf2S/4WG30dK4uAfFwOO+EaVjeJk8GK7R
 9aSJMP6XdjExotd34CvIbc34VJ11TIXXHORog1SQKJWlhqMTwPWuljKr6Gur/XqU46
 cN7BIzgqv8kV4uy1CInJKAgUM3CIcfQqynMlDikU=
From: pr-tracker-bot@kernel.org
In-Reply-To: <bbd3efb4-39d2-1d2f-b4c5-0f68dd6f481f@synopsys.com>
References: <bbd3efb4-39d2-1d2f-b4c5-0f68dd6f481f@synopsys.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <bbd3efb4-39d2-1d2f-b4c5-0f68dd6f481f@synopsys.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
 tags/arc-5.10-rc1
X-PR-Tracked-Commit-Id: 6364d1b41cc382db3b03cf33c57b6007ee8f09cf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b32649b863623d89fec83aa27d19c28715c4fae3
Message-Id: <160321236462.11581.12800103264500445363.pr-tracker-bot@kernel.org>
Date: Tue, 20 Oct 2020 16:46:04 +0000
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_124605_659520_1CB13D95 
X-CRM114-Status: UNSURE (   3.29  )
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
Cc: "Ofer Levi\(SW\)" <oferle@nvidia.com>, Noam Camus <noamikong@gmail.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Gilad Ben-Yossef <gilad@benyossef.com>, Zhen Lei <thunder.leizhen@huawei.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The pull request you sent on Tue, 20 Oct 2020 01:57:21 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.10-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b32649b863623d89fec83aa27d19c28715c4fae3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
