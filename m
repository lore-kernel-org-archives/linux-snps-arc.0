Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01064C4345F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 26 Apr 2024 20:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FG/zaY1FEFOCFhu1tNQzHkwaMEuh9wgw7T/6z3z0Quc=; b=IrUvoVa1a6sk8g
	oeP04Tt7dTYqYWyroslMVigxdlv27+LX4stfIxXwRmmU+irDp+HrYU+LP6pKTo8QOskf7CACoRDdR
	tUHy5RDwhvGgshBfTla6LCKw6JBq6XhoDqrHntYTnUAYYvr9U9D3Ka6wpD5zORo/3BpkxCjiVAJjD
	BJJnty9hm7iokCQolZXwA9WuEs0l13sid11u48+LfKR0jpRq1+avqFaKKsbwhMASRB++HYmMTkWAd
	o0fNAOvE5oTjCCPLrABhaI+mqidGrlN0IQBeYe73zmeiJoCL9qf0rKrjXpW6csLtezo+lI3vOADpS
	Q4J8n6vySftiFYtEy5WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0S7z-0000000DwRq-1mls;
	Fri, 26 Apr 2024 20:25:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0S7w-0000000DwR0-3IrN
	for linux-snps-arc@lists.infradead.org;
	Fri, 26 Apr 2024 20:25:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 48C2B62120;
	Fri, 26 Apr 2024 20:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB036C113CD;
	Fri, 26 Apr 2024 20:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714163098;
	bh=zEUd8BRcbfhGdsmNm1IYQD22UmZYM/KYGx7otkXLSyA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Sk4BjI0jXBUFoioc3WpDoZzU8fPnNTi57X0wyIzgTTbwC3CEDgLnYBG9H5RpHADRT
	 TGfiNmGN926WblcSPZ3+L/nNKqMFl7X6FhdVeMqXcq0x+SlRDXMSDz5Ucwzc7BaxHI
	 rlBIWSX8jri6E7B/Wdpo4sb09W7x0j+HCsT1VIetO0xNbIrtw7YBTCVwcq2csNHUv+
	 BUyynFwD1bMrfVPHE/moADi3zs60eK33gDuj+VXXlWGLnw1Qt3Jmo0QAlkjLgkenEO
	 XLyU/5KX3L9WCJ9l3h0PpP2d9K89Gzfq98ir5cEcNvFhq4aXbBMWe1O0sFhhMm2oAW
	 18gEzo/LsFxig==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B1585DF3C9C;
	Fri, 26 Apr 2024 20:24:58 +0000 (UTC)
Subject: Re: [GIT PULL] ARX fixes for 6.9
From: pr-tracker-bot@kernel.org
In-Reply-To: <80a2b41e-74da-43cb-8532-fc3b17879201@kernel.org>
References: <80a2b41e-74da-43cb-8532-fc3b17879201@kernel.org>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <80a2b41e-74da-43cb-8532-fc3b17879201@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-6.9-fixes
X-PR-Tracked-Commit-Id: 61231eb8113ce47991f35024f9c20810b37996bf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c9e35b4aeb2f061390395033314898d07498da03
Message-Id: <171416309871.19521.6563933224187974806.pr-tracker-bot@kernel.org>
Date: Fri, 26 Apr 2024 20:24:58 +0000
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, lkml <linux-kernel@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, Alexey Brodkin <abrodkin@synopsys.com>, Bjorn Helgaas <bhelgaas@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_132500_890272_1BEE9FD1 
X-CRM114-Status: UNSURE (   2.83  )
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

The pull request you sent on Fri, 26 Apr 2024 12:08:03 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-6.9-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c9e35b4aeb2f061390395033314898d07498da03

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
