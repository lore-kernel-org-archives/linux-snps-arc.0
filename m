Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DA4C433F5
	for <linux-snps-arc@archiver.kernel.org>; Sat, 23 Apr 2022 23:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:
	References:In-Reply-To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UixprM2v/I8VQVzfbspTRbPmQazblsrhyQq2n+yz+uM=; b=BT8sq7cv8eUvYO
	7G9Pu5LIfiW+lCnT58QOKOHcKCNHetMwVphzM0zt+YLBn0VoLyRQ0cGneRT653wd2GpYP81xBHxij
	0FdUBBP9maQ6ab2/jXF4Zm1/rs3Q8XP2LAkx49ZwAruW6kvJBmf+aSa4A4WJLZePcgdauAErBOTCp
	OG6/If/AoZQhxzIdc4J1dO5KEt4MxTAMfPScz3my7Mxbnl6pqMv/P16psB61cGMCvtlBPCcD7rh4w
	GxkqzMNYB7XVs4M2eIQoFp4spmp0JgVCnLif5hlcfJQTCjVLYNwtpYuXkL+KgJXiXaTeHpBFiKhOn
	N+97x4Z34iw+nWxt0gXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niP9G-005IYi-LL; Sat, 23 Apr 2022 23:26:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niP9D-005IXn-GW
 for linux-snps-arc@lists.infradead.org; Sat, 23 Apr 2022 23:26:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 047DA61134;
 Sat, 23 Apr 2022 23:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54B57C385A5;
 Sat, 23 Apr 2022 23:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650756396;
 bh=NzV77wL8e7TdREri3RwdLCioCvs6/MFWXdC62Iy5Uj4=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=dmNk/fGD5lsJ5T7ItWMkDsSgCPX6k5as/x1A2te7PVMd0XRmekXdu9ClgHx7eTaUZ
 O1iLI8mkD6CSVK+XCE2pL38WJdwDBARmmfxTXwoUo3zwm9dcV5+OqIzBkQD8JXiXGe
 uGd/DGkBk5fLmYNf/bbng9EQNDrlh0nMmJmsrcE2mMEDocnhAiDElZr/6Jave66pnf
 jm8324WGggeHqX97P++jDqmGs7DMZKT1GWkxNBReKg3X43Zw+pP8+qBBrba/51nzZs
 4w5J3DnOYqHYqZt3N2Rol90dq9TaEFj/O59LWEqu2K6NBQKd4vNHu3Lwsy3nT4FRDv
 ved26XLUdiNLw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 4028BE8DBD4; Sat, 23 Apr 2022 23:26:36 +0000 (UTC)
Subject: Re: [GIT PULL] ARC fixes for 5.18-rc4
From: pr-tracker-bot@kernel.org
In-Reply-To: <7b513e98-0cc4-13b9-a26b-d281314c0f74@kernel.org>
References: <7b513e98-0cc4-13b9-a26b-d281314c0f74@kernel.org>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors
 <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <7b513e98-0cc4-13b9-a26b-d281314c0f74@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
 tags/arc-5.18-rc4
X-PR-Tracked-Commit-Id: c6ed4d84a2c49de7d6f490144cca7b4a4831fb6e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f39359260e39fc45008c1140a84497ffde193fa7
Message-Id: <165075639625.11450.582643110063316987.pr-tracker-bot@kernel.org>
Date: Sat, 23 Apr 2022 23:26:36 +0000
To: Vineet Gupta <vgupta@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 lkml <linux-kernel@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, Bang Li <libang.linuxer@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>,
 "geomatsi@gmail.com" <geomatsi@gmail.com>, Rolf Eike Beer <eb@emlix.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julia Lawall <Julia.Lawall@inria.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_162639_630849_D17F3024 
X-CRM114-Status: UNSURE (   4.37  )
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

The pull request you sent on Sat, 23 Apr 2022 15:23:45 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.18-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f39359260e39fc45008c1140a84497ffde193fa7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
