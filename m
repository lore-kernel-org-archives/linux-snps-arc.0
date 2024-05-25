Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD2EC25B78
	for <linux-snps-arc@archiver.kernel.org>; Sat, 25 May 2024 17:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KrqG8D4x5Fjry3ucKW+YRn9AW9S+lrvhN0otej0JqzE=; b=QMMnT7Zna2ZCZY
	5ry/nwMxOeXqyAUlQ6XQzIZA4EkuaFBDJsfqd28nG6Z2/AAC7GoZJKUpdz0YRM25AuF6jTnPO2ZDm
	M6YjKPa9ZiB5FhKT3/XGksfcv5AqwMko4IOFYi+F+79mRcAPdsV9JQ18iExJVaQBcnGDKfcs+Qd4X
	Vk3vviUogOzknwKVF7bd5IjgAJ7+fU1vEKRJ/qvFtXyatz8nFFTG9R+a1nxkTzFmkWLZB2ubnXAKB
	Dv28LZgbCDwDPhraqokQFN6jjkb0yU1mjvvWuY6tWKorTltyDHoP5EekCkXWWF03/gBGEboNnooz+
	UVNKAcBpgh6NMnycOPUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAvXQ-0000000BRnX-0LKN;
	Sat, 25 May 2024 17:50:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAvXN-0000000BRmx-3cAq
	for linux-snps-arc@lists.infradead.org;
	Sat, 25 May 2024 17:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 717C06355B;
	Sat, 25 May 2024 17:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6C68C32786;
	Sat, 25 May 2024 17:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716659431;
	bh=ZWtHjsL45ZyOE3P8Ch2sEExI0FBoGZ9m1rc4/c44+nw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lOiixgclrrvYMuqoPwDisp29AxX2vtahEX+31jiVXS4wOHhliRC3cvh201ZXBk4mw
	 p9Vd96ivLdlOddo15cZ05VBuQQVTwaQCbqOWSOnNNX37CSU+Ek17ajl8ImPMQOe6A1
	 FuMhYVexY67LcBtKflrKwgt/649tqPESkiTykTZfv+CWO0MTrnNq9coRZtlbbwyRVr
	 Brfldk9y68HPHHKHILfIzxxXhFnYjIIXQDMT5pthjJ4T5yuydAEiWxp19FJWwz6Kcq
	 1oUIacm3j3HXp1rLH/VHZ2+ZTCNCm/XdS/G3oARh1262N8xkSpjaUlRj9HJLDrIHzP
	 95IUUKWvRPBRg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C2856C43333;
	Sat, 25 May 2024 17:50:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next] ARC,
 bpf: Fix issues reported by the static analyzers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171665943179.11416.15139734893822863704.git-patchwork-notify@kernel.org>
Date: Sat, 25 May 2024 17:50:31 +0000
References: <20240525035628.1026-1-list+bpf@vahedi.org>
In-Reply-To: <20240525035628.1026-1-list+bpf@vahedi.org>
To: Shahab Vahedi <list+bpf@vahedi.org>
Cc: bpf@vger.kernel.org, shahab@synopsys.com, vgupta@kernel.org,
 ast@kernel.org, linux-snps-arc@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_105033_968092_6F830733 
X-CRM114-Status: UNSURE (   7.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to bpf/bpf.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Sat, 25 May 2024 05:56:28 +0200 you wrote:
> From: Shahab Vahedi <shahab@synopsys.com>
> 
> Also updated couple of comments along the way.
> 
> One of the issues reported was indeed a bug in the code:
> 
>   memset(ctx, 0, sizeof(ctx))      // original line
>   memset(ctx, 0, sizeof(*ctx))     // fixed line
> 
> [...]

Here is the summary with links:
  - [bpf-next] ARC, bpf: Fix issues reported by the static analyzers
    https://git.kernel.org/bpf/bpf/c/dd6a403795f0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
