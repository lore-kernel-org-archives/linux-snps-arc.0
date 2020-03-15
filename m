Return-Path: <SRS0=5y5t=5A=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C41E9C0044D
	for <linux-snps-arc@archiver.kernel.org>; Sun, 15 Mar 2020 02:30:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CF1B205C9
	for <linux-snps-arc@archiver.kernel.org>; Sun, 15 Mar 2020 02:30:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g9ttjmG2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OC5du9q+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CF1B205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sDc+t6LqpPR5UbuzxvYNRp+P7v0Bp9fWfYd8TgJtrJc=; b=g9ttjmG2GMu1lQ
	GTdlpzK2QbsV2VtFc+XwkiROxPfinQ1M1gW4ZDn39diCSZUOhODSSHjs4O9W+5ZKNhTIl2jrdK9aw
	9qQrGZqMAlBIOmZIjlKT9RZdwhHnagz5O1p65TTUrcJKZNHSmICdbE3MBf0KsVets/6zLq+Vgo5xw
	wAg8olug8WvtO81K0JXh9Kj5iD1EjQmqIXjrckgzO7Y6OSPxbsllc1mEwwyzOdbXC/tjdWcY4voJ6
	78RAKWJo1qNRNalze2KpPXM8iAjw65GcV1gudUCBow6O4QutWa44Ze+03vmjfwH17vao2PyS6RhX/
	C6GdDhDRHPtYDHy4lJwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDJ2c-0007OE-HO; Sun, 15 Mar 2020 02:30:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDJ2Z-0006kw-Qk
 for linux-snps-arc@lists.infradead.org; Sun, 15 Mar 2020 02:30:13 +0000
Subject: Re: [GIT PULL] ARC updates for 5.6-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584239408;
 bh=1q6bajXbqbxUwzuEHjZRZVpvqQfxgasrtsrSb01PJ6U=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=OC5du9q+syctdkhADLUQjg99vYSPT6Tl+wnFliudkCfYzW5FoJzKye7PdQSW58Q2I
 KDqlwCPiLYcsbjXlzDv0fEDukscU5ZDP7v7MdezI/KgjXOw/ycWLj5zIaXApJ9CQN9
 vtucPQXTt66d85jvc0H27GCCzoY87VqPN62/oxBY=
From: pr-tracker-bot@kernel.org
In-Reply-To: <e38a57cc-3744-e3b8-3c5f-b96b218aebd4@synopsys.com>
References: <e38a57cc-3744-e3b8-3c5f-b96b218aebd4@synopsys.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <e38a57cc-3744-e3b8-3c5f-b96b218aebd4@synopsys.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
 tags/arc-5.6-rc6
X-PR-Tracked-Commit-Id: 8d92e992a785f35d23f845206cf8c6cafbc264e0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3086ae071686e0fff1c0006a635f101edc5f3540
Message-Id: <158423940813.21543.9361557527358610579.pr-tracker-bot@kernel.org>
Date: Sun, 15 Mar 2020 02:30:08 +0000
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200314_193011_917611_2D0C298A 
X-CRM114-Status: UNSURE (   0.87  )
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sat, 14 Mar 2020 19:15:03 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.6-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3086ae071686e0fff1c0006a635f101edc5f3540

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
