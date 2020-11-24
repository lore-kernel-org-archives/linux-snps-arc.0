Return-Path: <SRS0=6yCX=E6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D628DC56202
	for <linux-snps-arc@archiver.kernel.org>; Tue, 24 Nov 2020 20:17:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59A54208C3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 24 Nov 2020 20:17:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ka1XR9Bb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNhYnoJ9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59A54208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbB0l2tBtBfUxr9Lt4HnVhXYjd3Eyvsc+P647wTskYI=; b=Ka1XR9BbyJoMl8w/UobHy9K0nv
	O2UxTv4RAK4jC1C4/QsdkAYZQX7ooH6AuieBka3VT/kQ0gK8KF/3I36A2F+vp7y7xg9Nt6OlWdg0x
	vL9ZG3VBzLdO+Hh6d14kzHiKcqbzR/3AIrZquDkDRADTz1ZW8SRAgwzgh9quwbRJyDSWgPzR/1rQr
	fpFCjJnztQJwpmFoLmFU8ZgimFKBmOAnhl0hUUbrZUmGsw49qgfaOyoQiP8+MwqC8A3EAvBPz2HdK
	KKO6FDl0Y6JCdl4xUXp9/tYNo5c58h0mb66Vpfmk/ZWd8SzxcxhqTVpTZbIyGzsA5GI7u/vdtIG/H
	hl5sxz1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khekr-0005Fx-EK; Tue, 24 Nov 2020 20:17:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kheko-0005FR-V2
 for linux-snps-arc@lists.infradead.org; Tue, 24 Nov 2020 20:17:35 +0000
Subject: Re: [GIT PULL] ARC fixes for 5.10-rc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606249052;
 bh=R4y7ZtZDec/miM/LfvHn1EHudG9V/DYbfjG69Dzof/U=;
 h=From:In-Reply-To:References:Date:To:Cc:From;
 b=RNhYnoJ9Fc6sN9dNN9j//sxUqn8eVcC4AZADBzITTzxzivoRaZaVxnVvLD2AXtt9U
 Oq23ZzkBmujNxV6eXa/PTdPvhXvTx+oyfJzXE/ONKPBh3TnvIpZyLON9x+95yyo/8f
 ZONB7aeu1Q1irSgqdkpBNfZmY7wBIx+cqKzeBSO0=
From: pr-tracker-bot@kernel.org
In-Reply-To: <e02b2e57-720a-758a-bea9-1d9c03fba539@synopsys.com>
References: <e02b2e57-720a-758a-bea9-1d9c03fba539@synopsys.com>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors
 <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <e02b2e57-720a-758a-bea9-1d9c03fba539@synopsys.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
 tags/arc-5.10-rc6
X-PR-Tracked-Commit-Id: f737561c709667013d832316dd3198a7fe3d1260
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b1489422041ba58f224270480d8241be24f0f8dd
Message-Id: <160624905269.27196.10280923899172312691.pr-tracker-bot@kernel.org>
Date: Tue, 24 Nov 2020 20:17:32 +0000
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_151735_116090_C9A73081 
X-CRM114-Status: UNSURE (   3.42  )
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
Cc: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
 Flavio Suligoi <f.suligoi@asem.it>, arcml <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 lkml <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The pull request you sent on Tue, 24 Nov 2020 00:52:20 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.10-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b1489422041ba58f224270480d8241be24f0f8dd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
