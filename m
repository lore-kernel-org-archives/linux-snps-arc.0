Return-Path: <SRS0=xZI/=JE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62133C433B4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 20:23:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07D2461184
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 20:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07D2461184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Date:Message-Id:References:In-Reply-To:From:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7/ERtF9pcuf+FFa3WNWJ7VeyHmUIprykyuvUXmgoZc=; b=Z2wCwcgJJ2MhTqeMz+eLotYKIM
	4NJfaYC86vJyNGU+Su1GnHY8LTVrr3j0nAGyaWi6l4VB2SaGIhEIaZLlGR5JV69ZDI3UcocbLxyMN
	h5ezQeeeHceVDavrDTPB4jT82qTw9LZBuDxy4Ut7YqxB19bXwwrKnOZprqUEJi/9Wm9SMZlcgfMTP
	eijjIsSAqwhnjSAE2jqoQrzN1c9qgcSHNbwtcg+4nyORi7Y32328jPipFxtfTKEQnJUifhSYG2bvt
	t245TJhys0PUZEj9Uh14niN0B3ch9JLwCWPOSl/jXm1jTu4DVzR7X3rUyzSjxkDFEGvT3SmA/rN8g
	LO2PhuYw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUEhn-005vwE-P9; Wed, 07 Apr 2021 20:23:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUEhi-005vtc-HL
 for linux-snps-arc@lists.infradead.org; Wed, 07 Apr 2021 20:23:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id E1D686100A;
 Wed,  7 Apr 2021 20:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617826988;
 bh=XjOW73dux/dho35SEWykXJ5ftMUfGmMU9BRzbkdCUwo=;
 h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
 b=eiWyo5kcSXYfMceC21UH4KKY7NQO+EKA7b0M2NXV/YHq/8B5447quS5757p4kzMJV
 tjQhG3gsbqxV/n4+zHW73IFQb0V+fenDHzGYEaFJ6Q68yzyXY03dIIGpTbh6GlDDZ0
 EvkeLruqCB2J6arqeLqVqNl/zceHHN0A/cjWu/mSjms93Mz1gaa49w0C2xRfvX8r54
 +Gkmbi5Zodfg0kIhFwTq0hC8YA/O1B6t64xOQXmmks6r3k0UiIMmcFWgOc2hoyNKUb
 Vn5rCwTf7AjDauk0dTh9B44SDAe7hngIgktV9kH0zJleSo27ylkhErIhKrkirwik6C
 NGXntWR16S5KQ==
Subject: Re: [GIT PULL] ARC fixes for 5.12-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <2fd4c2ef-6a48-53db-1b22-3742e438ae23@synopsys.com>
References: <2fd4c2ef-6a48-53db-1b22-3742e438ae23@synopsys.com>
X-PR-Tracked-List-Id: Linux on Synopsys ARC Processors
 <linux-snps-arc.lists.infradead.org>
X-PR-Tracked-Message-Id: <2fd4c2ef-6a48-53db-1b22-3742e438ae23@synopsys.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/
 tags/arc-5.12-rc7
X-PR-Tracked-Commit-Id: 83520d62cc5a94d2ff0e2d37c8204fca13dd2637
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 454859c552da78b0f587205d308401922b56863e
Message-Id: <161782698875.25152.14511842179891981575.pr-tracker-bot@kernel.org>
Date: Wed, 07 Apr 2021 20:23:08 +0000
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, Wang Qing <wangqing@vivo.com>,
 "dean.yang_cp" <yangdianqing@yulong.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_212310_809054_4641997E 
X-CRM114-Status: UNSURE (   2.38  )
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

The pull request you sent on Wed, 7 Apr 2021 20:15:54 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-5.12-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/454859c552da78b0f587205d308401922b56863e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
