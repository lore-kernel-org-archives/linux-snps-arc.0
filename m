Return-Path: <SRS0=8xpS=CO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2373C433E2
	for <linux-snps-arc@archiver.kernel.org>; Sat,  5 Sep 2020 22:36:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44EBC20760
	for <linux-snps-arc@archiver.kernel.org>; Sat,  5 Sep 2020 22:36:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wUShuQIf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXdUbjV/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44EBC20760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNsCRad1OIetk8ygrhC9zFx865RSPh4bOsdGC83FDIE=; b=wUShuQIfxzr34+7dpOns/Hnuxq
	Fdfzky6Zya5/D/NHtgQoX/fU4Fyihr0jhEwB6lmAktgOpTd+5BY1Yw5GYHNYUKMeGpi0muThH8cDN
	OPlpie6aG/oVEJ3g31j8X6eaiXHaZSd+t4sf4Ns69MBHYnJRPYeJF6vyapsPqmivRhL3eDBYn8IRx
	Ic1NtobTdOLCrBdd/8T8mORQxvbr7mwSSiVq5WJIVQD5BbjXKRlNnSpz0/TscE21rLNWjDzdvUCxx
	ya8CrBlygGlgcpBjBPyOHdWV3tgP+A1kp15Y27ezUeV8KvDv0nCghQaX4UoLlSdkjCUz4owW9nyti
	P5z6Po+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEgn9-0008Gs-LF; Sat, 05 Sep 2020 22:36:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEgn7-0008GE-SD
 for linux-snps-arc@lists.infradead.org; Sat, 05 Sep 2020 22:36:14 +0000
Subject: Re: [GIT PULL] ARC updates for 5.9-rc4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599345371;
 bh=21fic43Yu+L8AQOtTCjlWRDPcmsuiQghE1oSbvXWM2I=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=hXdUbjV/cRGpyt6YSSg1yFCWa3OFJW0EZKaJg8xK2QC9MqHNm1s1nVTlbVjRYzhjI
 vIEw4ZPq0rlj0a6kJp8Z7QTT1rU9YD6GbemNgdZraOQ7vIpfkl9kf8NkXRUQw/ug8J
 0TPQw9onbyuvJaWAOVWzbrC8ae/dnD1mRhTCz55g=
From: pr-tracker-bot@kernel.org
In-Reply-To: <0724a4d3-7f69-040e-2a76-67ceefe9e745@synopsys.com>
References: <0724a4d3-7f69-040e-2a76-67ceefe9e745@synopsys.com>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors
 <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <0724a4d3-7f69-040e-2a76-67ceefe9e745@synopsys.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
 tags/arc-5.9-rc4
X-PR-Tracked-Commit-Id: 26907eb605fbc3ba9dbf888f21d9d8d04471271d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 70187f7727d4ddd8282b576ece93ca233e88b19e
Message-Id: <159934537164.12925.17333595083875187697.pr-tracker-bot@kernel.org>
Date: Sat, 05 Sep 2020 22:36:11 +0000
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_183613_981026_6D106FF5 
X-CRM114-Status: UNSURE (   3.15  )
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
Cc: Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Evgeniy Didin <Evgeniy.Didin@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The pull request you sent on Sat, 5 Sep 2020 01:08:56 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.9-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/70187f7727d4ddd8282b576ece93ca233e88b19e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
