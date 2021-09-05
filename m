Return-Path: <SRS0=kZPX=N3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A4FC433EF
	for <linux-snps-arc@archiver.kernel.org>; Sun,  5 Sep 2021 19:07:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0AA0610E9
	for <linux-snps-arc@archiver.kernel.org>; Sun,  5 Sep 2021 19:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0AA0610E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQVYNzp5fB7ZszGnPsjlc/1ouLpWHfMKB3dkhhU9ex4=; b=I83k5EvXRco1uZ
	0X4oGex78DVQKTF6lla9SOXtFqwX6XPiP31dswxE92XzGB/JgI0YjHjAcKB7leIYn9Cg55hpYVmWq
	vnmZs1fbb+dzZDJzVCcQ3Rz538i8FR1EY2IVe4QJEjuF6ktfuXVQCkXZ3eYQ6MMwSr9QZKWg9FO+m
	xaWVX3yqH+ZmRdVUVYVqMaott2F241i2BodQ5cC4G0nn8XbXsCAH+F/pnB202fU9oduOY2bCDwuPo
	Xjp1Kk22blCIT5W4UFcwbdI9Tw5ufEsR3w/bFqRduivCcO9ccGu3PV+IZ+Mexu/JDxKHbqbmKZ2MY
	/95jxZwq01KmE5NXWLCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMxUQ-00GIOT-1v; Sun, 05 Sep 2021 19:07:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMxU2-00GIKU-FT
 for linux-snps-arc@lists.infradead.org; Sun, 05 Sep 2021 19:07:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 32D2A60F6D;
 Sun,  5 Sep 2021 19:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630868834;
 bh=7CS+2y4pqstHvyDwuLQZ99Mr1FwyLFF/JLvqS2nT2SY=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=d7boqw0eEPcm8iqyik1ASbsQ/lBpUBPlkVvDBw/9WItPD+H7hKc3xtFmxOCmXJvUa
 S/Wp1mmFDaESoAemUIi7dn5IpXO/EpHWg1ASG1D9ikHAVvW9tBfRJbUCPyL8HagKRe
 133DnVISDLS2TvB7Iw8Ws60DrlJSxv12ACsaWQR0+UPSLm6OlyRxnrca2d20Zafmtr
 thR3RE5beoO6Bj1w9xP+P04iAmLQyCp7Rh1QXd+IxhI2p2dyM6HscEVgBLDhVRR8Gx
 UG6Mti3LA5hYJZsqDwaDAfpvZ701uujB1a7AtL/8JI8GTqrDcwHnZ6VHDF0s0DmW/0
 KlSZ73wAWzEWQ==
Subject: Re: [GIT PULL] ARC changes for 5.15-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <56b00ebf-3c2d-5c2a-0491-14b378e85bb3@kernel.org>
References: <56b00ebf-3c2d-5c2a-0491-14b378e85bb3@kernel.org>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors
 <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <56b00ebf-3c2d-5c2a-0491-14b378e85bb3@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
 tags/arc-5.15-rc1
X-PR-Tracked-Commit-Id: 56809a28d45fcad94b28cfd614600568c0d46545
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e07af2626643293fa16df655979e7963250abc63
Message-Id: <163086883417.6256.1384476428892280015.pr-tracker-bot@kernel.org>
Date: Sun, 05 Sep 2021 19:07:14 +0000
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 lkml <linux-kernel@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Changcheng Deng <deng.changcheng@zte.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210905_120714_572531_74D712D1 
X-CRM114-Status: UNSURE (   2.90  )
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

The pull request you sent on Sat, 4 Sep 2021 20:20:23 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e07af2626643293fa16df655979e7963250abc63

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
