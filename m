Return-Path: <SRS0=waOV=EM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA377C55179
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Nov 2020 21:13:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CD1C21556
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Nov 2020 21:13:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iXyyi5bK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHO0+xjo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CD1C21556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3T6ppYkfvtocFSVQBOhA04aJIT85XsV4OlTHLv6LEk=; b=iXyyi5bK6Bjv3sXVIp4UTXq5nI
	h2vm45wVw+dnQG8w6Y9/HZi7zGp7wBjme4t7eSinKYF7nG2tlHwAg0JA305OsBvSYQSmOEYBdIoSD
	rbWIBFyqav9fML3DoVnLhqU8M+cYz5/5NlSEHYHs/ctexIUUeeZVejYw8ikQdaIlhOUMQdSGVWvgs
	jW6d5dOyakrm1YkYSeq+n9nzv+Trv+o808si2rJB0eSktWt5Tbabms9Kcn+fFNusToHvXFkugsKM6
	SRb4gZ9pM0Y21Jz+ZVhSCZD78K8IG6NgJxaF70z7sSAt5ctyOrIv3JVfPfri9SLUeN6tKYA+Hi8gf
	s481UbCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb930-0001AB-Fl; Fri, 06 Nov 2020 21:13:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb92x-00018w-9A
 for linux-snps-arc@lists.infradead.org; Fri, 06 Nov 2020 21:13:24 +0000
Subject: Re: [GIT PULL] ARC fixes for 5.10-rc3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604697201;
 bh=UPMRt+vvt2YH0HAVnBeYquWn2Dn2BATN5TEbtG9YEVE=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=PHO0+xjojroF1R2CV3R+Jjq+LFVokcK0RXNhzKFkj6Q8h0QbkZ4TUOTvsSSXuA5Lj
 F/Oh6q8MMW0bQYt9l6iyqF9+ehap+RRzeE9isX0jU4UpKPPy/IseNx0uN/plNsx0Qi
 tP9vCuVYjqH9fCoqGp+LmkSx/oP6TOiRG8zO6qac=
From: pr-tracker-bot@kernel.org
In-Reply-To: <06d83e19-7850-b6f2-5728-a778392d3e5c@synopsys.com>
References: <06d83e19-7850-b6f2-5728-a778392d3e5c@synopsys.com>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors
 <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <06d83e19-7850-b6f2-5728-a778392d3e5c@synopsys.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
 tags/arc-5.10-rc3
X-PR-Tracked-Commit-Id: 3b57533b460c8dc22a432684b7e8d22571f34d2e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4257087e8feb2e6f918eb0773eb1c1a697dd2a39
Message-Id: <160469720186.14190.7068841701625678326.pr-tracker-bot@kernel.org>
Date: Fri, 06 Nov 2020 21:13:21 +0000
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_161323_410473_BF0E33B5 
X-CRM114-Status: UNSURE (   3.40  )
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

The pull request you sent on Thu, 5 Nov 2020 21:13:08 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.10-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4257087e8feb2e6f918eb0773eb1c1a697dd2a39

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
