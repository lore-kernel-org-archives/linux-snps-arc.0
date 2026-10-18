Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1F4CCF2C4
	for <linux-snps-arc@archiver.kernel.org>; Sun, 18 Oct 2026 15:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BsZsML+5bXLsDD3LhVh2Z139aV8l9rZZlXu4i9M46WQ=; b=bsyo83CKOMSp40
	rn9mw9LglJTngsFd8MEnqQfGS11v3LDNMr2Cj4DpHwo20jRIFecfm3UVnuvmRkh+wvxoybtpklH4o
	QO0pmpepvf2dQKLm88RctuH5bTmxJvX2/wts59+81yUIXP83F3k9JjPBnxUiChceNFduDxSRUUBKF
	szCSAVSSeoqPFdLlULq2h0KlQzwngxEOJH5WtzXPaMv8ygAIKfNS4fd1uLdFyeRjDyGoYi/zN7ryl
	6oO2CRBlulK0W8H6qUHjGEORYmBhLAb0YEKwqbaGGQ3hm73nrteCwOFILuI8t2PhbtVR0tEPBOGbK
	5dpJitiVzaZkBLjpb5iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xISpw-00000005zfu-2833;
	Sun, 18 Oct 2026 15:30:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xISpu-00000005zfb-10VB
	for linux-snps-arc@lists.infradead.org;
	Sun, 18 Oct 2026 15:30:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E41B343DAB;
	Sun, 18 Oct 2026 15:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C087A1F000C4;
	Sun, 18 Oct 2026 15:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792337408;
	bh=q/HR72gFHItCPfFgx3/JNMsaaf8Rwbc8aR6XfNrkGN0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Vw9nSQSC57W4Dp3DEjbpItFVPTV0+spJ/pxmA4kAzpDp/PsG8ziHOZKCtTUAum5Pm
	 Igy5aqp0DuFifO8L1N6Md+awcVMSH03l83pL1CWACeuB5JySq8nsofu8+wo7oWqZle
	 Cyut/TCiMDKFg7jSTMaaIrYVzyzoZmIwGCjS5JBnj1dV8eAQ3fxy+w3I4xIJBXBtz7
	 oT7YjBpzFBO36IBD6hRaMqRdxVCDmqMuVPmGXCF5pOXFtPewUMwUO5pZ36nsVbF6rT
	 ZkzRNyc8kM5DixMlSYggboucOtTrH7S84ZfbCCRJt0xu0Z8M+nonPdjDZrNSqGpPPy
	 KKkKgMOZerVsw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44413811965;
	Sun, 18 Oct 2026 15:30:08 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next] locking/atomic: arc, hexagon,
 openrisc: Define arch_cmpxchg_local()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179233740728.1716327.4924636966415964247.git-patchwork-notify@kernel.org>
Date: Sun, 18 Oct 2026 15:30:07 +0000
References: <20261018132907.3823160-1-sashal@kernel.org>
In-Reply-To: <20261018132907.3823160-1-sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 vgupta@kernel.org, bcain@kernel.org, shorne@gmail.com, josef@toxicpanda.com,
 eddyz87@gmail.com, memxor@gmail.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, peterz@infradead.org, will@kernel.org,
 boqun@kernel.org, mark.rutland@arm.com, mhiramat@kernel.org,
 bpf@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bot@kernelci.org, lkp@intel.com
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

This patch was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Sun, 18 Oct 2026 09:29:07 -0400 you wrote:
> Commit ccb88db8dac8 ("bpf: Don't hand out a linked element as extra
> element") made alloc_htab_elem() take the per-cpu spare element with
> try_cmpxchg_local(), the first caller of cmpxchg_local() outside of
> architecture code. It doesn't build on arc, hexagon and openrisc:
> 
>   include/linux/atomic/atomic-arch-fallback.h:384:27: error: implicit declaration of function 'arch_cmpxchg_local'; did you mean 'raw_cmpxchg_local'? [-Werror=implicit-function-declaration]
> 
> [...]

Here is the summary with links:
  - [bpf-next] locking/atomic: arc, hexagon, openrisc: Define arch_cmpxchg_local()
    https://git.kernel.org/bpf/bpf-next/c/8cebaa3be829

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
