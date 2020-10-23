Return-Path: <SRS0=zpCG=D6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A60C388F9
	for <linux-snps-arc@archiver.kernel.org>; Fri, 23 Oct 2020 18:53:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53C3B208B6
	for <linux-snps-arc@archiver.kernel.org>; Fri, 23 Oct 2020 18:53:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3S1ciWTb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQrvfR+w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53C3B208B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMZQG3Mqduy5moXvnHsRm24F/jrQv6P7Trcr5MJFS8s=; b=3S1ciWTb74E1G0Ri27PFKJUTj8
	uBPTAbOI4BjC5XWvlmR3bSwD0H+XRnQozv7RCupXv53y+MuIMdpgAbdhiGuPXpiOF8j9JPnOQn5Jb
	ZcZ7cCCUcni9WE3Q1FCKTGwDmFSuEMQU7XOEmO7eP7gz0gnG6EZn0OGD987D+ATZg+eXEU6+ghvI5
	VAanaKM9r1a+hoReA6xwp7kHA8m+OY6FIuGkB4OmhbSDBwknSVofnHjgBze2afPfoWByUhiGE9/zV
	fxaZPkitsI+aHvPqqqhORXfvgt5xq99og2eEp912LgvVPExxKBmA/WYYlqgKcaWyF4EtnVxb7VVzX
	y53cR/6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kW2Bo-0003Ms-Gw; Fri, 23 Oct 2020 18:53:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kW2Bk-0003Lo-An
 for linux-snps-arc@lists.infradead.org; Fri, 23 Oct 2020 18:53:21 +0000
Subject: Re: [GIT PULL] ARC fix for 5.10-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603479198;
 bh=xhrf1iZgqo7P2NL6XfJZpgOLqh1fytRNaRDNgDz9w3E=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=pQrvfR+wRivIMoGEU+RsCgFh6uFJV3yBLeSnQATSn+oYaf/bAovA0z1XzYiYSl0vh
 wT7h5nfPr5QMZiGw8gG9X13ZqsAijRsgvOFtbd/ovNnzL5lFxhsEGjSIkJ/SBUVbYd
 M5QyOMVlikmemTSfrMKzM0GyYdENeRLWKbVx956E=
From: pr-tracker-bot@kernel.org
In-Reply-To: <cb7b01ac-abf5-b6df-3f15-a7a20533a89f@synopsys.com>
References: <cb7b01ac-abf5-b6df-3f15-a7a20533a89f@synopsys.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <cb7b01ac-abf5-b6df-3f15-a7a20533a89f@synopsys.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
 tags/arc-5.10-rc1-fixes
X-PR-Tracked-Commit-Id: 8c42a5c02bec6c7eccf08957be3c6c8fccf9790b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0a14d7649872be966d12bc6c3056bb37c27b94bd
Message-Id: <160347919884.2166.15192264621751801542.pr-tracker-bot@kernel.org>
Date: Fri, 23 Oct 2020 18:53:18 +0000
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_145320_456941_2F96F52F 
X-CRM114-Status: UNSURE (   2.84  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 lkml <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The pull request you sent on Fri, 23 Oct 2020 02:35:33 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.10-rc1-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0a14d7649872be966d12bc6c3056bb37c27b94bd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
