Return-Path: <SRS0=9xO3=Z3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB9F6C2D0BE
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Dec 2019 03:35:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90FF32073B
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Dec 2019 03:35:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jLK3s3Cn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AR0GLxf2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90FF32073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jKLXHkZhMBx47kt8Qfk6zGyGROX6r/E1q9KdkwuLoS0=; b=jLK3s3CnOQYG3M
	nGEJJQPsVF+KBD6NzLEIlvDLLb+q1w2bJ1ssVOuckhic2VS8Ua9AC+IsG3FD1U0KwJ7JLjs8RXwuV
	Elylqab8iDWCacA9qwgXjKBSP9dZU+99RsqAodBTwogykXpOQqadNQ0t8LSEykKDpW+80tCLINBHo
	cjj5PxbivvVZdfWyobGfPoMvc16gHS/p3mxMyHTvmkbIdvLUxpeKxcnMiXrgvxYjf440FMcrJlBsk
	ocD8IA6+2cIHjkct6S3AtJQoUK2jScA3GbccHvgCHieWXX9lUIZz0frFdvDIwYpgIk1ds32axoOtY
	+jaMnZNur7jvf34k8F9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ichvJ-0004oq-88; Thu, 05 Dec 2019 03:35:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ichvE-0004o3-Ru
 for linux-snps-arc@lists.infradead.org; Thu, 05 Dec 2019 03:35:24 +0000
Subject: Re: [GIT PULL] ARC updates for 5.5-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575516919;
 bh=NiYp9U/XFxyql0Zk6ev5H+IOXmcW2M3uh/Fhv7CK/38=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=AR0GLxf2kqzgn6nJMihjWrEl+u7SWcPHQ52ZGLbjy7jLApkRBh56WGhj5mInrNVgl
 iCXPj20+9QunG+FklhhKqMavPgCEKA7wWsXl57R3QArmrdo6owMI3bYLOMkYIuEYTv
 lstfCKNQ9TsO70dFX62HWKog1zM6VCAKgqdgx8W8=
From: pr-tracker-bot@kernel.org
In-Reply-To: <79e777e1-9b20-6db2-9f0f-2e9f943336b9@synopsys.com>
References: <79e777e1-9b20-6db2-9f0f-2e9f943336b9@synopsys.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <79e777e1-9b20-6db2-9f0f-2e9f943336b9@synopsys.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
 tags/arc-5.5-rc1
X-PR-Tracked-Commit-Id: 9fbea0b7e842890a76acffce9be9e430b9e11194
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 056df578c2dcac1e624254567f5df5ddaa223234
Message-Id: <157551691982.27004.10450647025342052873.pr-tracker-bot@kernel.org>
Date: Thu, 05 Dec 2019 03:35:19 +0000
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_193520_926782_5D7CFE45 
X-CRM114-Status: UNSURE (   0.64  )
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
Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 lkml <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The pull request you sent on Wed, 4 Dec 2019 23:03:03 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.5-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/056df578c2dcac1e624254567f5df5ddaa223234

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
