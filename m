Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E69C25B74
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 May 2024 00:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o5HOGt5MBhpMOgIX+nk2Uwk0SfN2JU7i0iRl+hu4rnI=; b=1lHMC50wVjYu8G
	yvJi++h9neoQTYFYScT8/0xJETYDFYbDPawTF06IMOjM7Ko9tN7JVyIN5nDa0ADV6Z6FOsWv8+l0F
	VwhsoN7Li2/VWvSvFsxvUV6MSOxAZtyRParISpSYTooX4GMFfyYIY8KrkjK8eMS5EaZzTTgcDEmnk
	B2K+JDsSHybERXxSNhwhWrRfpCMUkmFCjALCchZ/W052oiZUzi8fKyPlpBJoD0yJ58UAKK52NjMK6
	r3K5BggmcN2I4O6bPDTEV4q8GmzQsZRr6d7puBNnoWMk9qIZT6MnRZB44+fzUVR2nBRav43Y/l2kc
	gbgPgjtHWX6iaflVNBjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6J7c-0000000B7CL-2FUf;
	Mon, 13 May 2024 00:00:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6J7U-0000000B77i-1WwN
	for linux-snps-arc@lists.infradead.org;
	Mon, 13 May 2024 00:00:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 147EB60BC1;
	Mon, 13 May 2024 00:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1A32C32783;
	Mon, 13 May 2024 00:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715558429;
	bh=Ac7deBypVTjZbqSL/noIFbQe1zlip1Qlx3oo2hzHumQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jG8pl/OOo4Zq3316iaMvewYn9kigB5PXabuBwe8F6f3v9I++6uJiVnLLDIAKDRcBU
	 guQHCjk/+kQc5IbQ6kFE9vHlz5sR0tVCvaHMMgRLP8SJizm/DZ/WU3d/5Qzg4GFEbU
	 VMkdC8r+OdBcpKx+XI0V/PgyPV9XR7Jk245pa/nnczL24o6j7gqxgRydycsYOd+zr0
	 rMkBj0DlqCTuVnNwp6NZcQmu6mfgChYTN6vlvV+gzkSmiP9SxpqKiwxmfktnR6lnxh
	 Aa/KWN/Ybcpc3E5vWqUjA2S9xFdEy/yoRfWrKHjjJftGdDZ2RCpyaag2A8nrC+9ppZ
	 97pDK5Kfuusvg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CD5E7C4333D;
	Mon, 13 May 2024 00:00:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2] ARC: Add eBPF JIT support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <171555842983.18024.4891712787415544525.git-patchwork-notify@kernel.org>
Date: Mon, 13 May 2024 00:00:29 +0000
References: <20240430145604.38592-1-list+bpf@vahedi.org>
In-Reply-To: <20240430145604.38592-1-list+bpf@vahedi.org>
To: Shahab Vahedi <list+bpf@vahedi.org>
Cc: bpf@vger.kernel.org, shahab@synopsys.com, vgupta@kernel.org,
 bjorn@kernel.org, linux-snps-arc@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240512_170044_502392_2C7B5A6A 
X-CRM114-Status: UNSURE (   8.77  )
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

This patch was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Tue, 30 Apr 2024 16:56:04 +0200 you wrote:
> From: Shahab Vahedi <shahab@synopsys.com>
> 
> This will add eBPF JIT support to the 32-bit ARCv2 processors. The
> implementation is qualified by running the BPF tests on a Synopsys HSDK
> board with "ARC HS38 v2.1c at 500 MHz" as the 4-core CPU.
> 
> The test_bpf.ko reports 2-10 fold improvements in execution time of its
> tests. For instance:
> 
> [...]

Here is the summary with links:
  - [bpf-next,v2] ARC: Add eBPF JIT support
    https://git.kernel.org/bpf/bpf-next/c/f122668ddcce

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
