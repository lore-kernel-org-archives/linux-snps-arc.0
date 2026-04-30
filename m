Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853FBFF8864
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Apr 2026 03:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jjk8aHSrkGmlbLOLLxWZju8HDsTj8oJQhmiX3qbHOjA=; b=z1ccwfZgIKulaA
	1um4g4kLVG67ZJ3mxuXdf6KidN5X3BE36gRih0a//RPuDnhBrj6VeGKksIY63hx3SfVW/m9bz99oC
	sTdgKIyyMoTixcYnscNG4D3soUooQ8l1fU+gtxppS21vHIWKmNRmITd0YJeWd+SEZvjcnYggsbjgQ
	RyHsk1od/l53wP7kwA7RibPbcH3Mc9m63ygx8xJTabox4wIQMQ3xUYIq4nfxBd+yW4zrTnGFaH0F5
	g9ngQR+Bu0Mof7+Pvm6AjV5cnpqzdzNktT2IS5kn2q4KJBfWUsgMmYHVOlEHVByMk9ugYUWcxFjrm
	bNAM+LV2OXn6764U+2UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2s-00000004Wo5-0vRA;
	Thu, 30 Apr 2026 03:26:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wII2E-00000004WPq-4B8r;
	Thu, 30 Apr 2026 03:25:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D8204457C;
	Thu, 30 Apr 2026 03:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F0EC2BCB8;
	Thu, 30 Apr 2026 03:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519554;
	bh=7DUN2QuqQEe+BONI1ESG4SkIz1fzsjbqa3ckTuuKON0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=S3K5G1XovhD07R5O5Cfcy7lVvTxvdUAegkMVL4L8Mtzf9fKcNC7CadGfDm94ncYW3
	 /b3gcg0/YcLg9Als2F8ssWaUxHQUhQMOrsInNGp23YyNVEoZesnW9na1KfzAJGwADp
	 KTU1UQLuwoaLC0FxYgCBT9ErRd1+nqtKD6J1vJmiEmkbMPNMtG+lgotURJHsePS61S
	 RLCqfSNYiEnZojyCuQbicPLDo3ywac2PmflqikQdR6Ir9LNvsPRYjNWI6Ol8jDiw5K
	 s6K1opc7+K/SSJ8ToRvLUcMAZC9t1wDEJ2EBfwZ5oF2rytHLJHY/YtizCxlNq2AgJI
	 UMoMxqu7YBolw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA0123809A07;
	Thu, 30 Apr 2026 03:25:10 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/4] arch, mm: consolidate empty_zero_page
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177751950929.2274119.3965174046465654804.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:09 +0000
References: <20260211103141.3215197-1-rppt@kernel.org>
In-Reply-To: <20260211103141.3215197-1-rppt@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 andreas@gaisler.com, bp@alien8.de, bcain@kernel.org, catalin.marinas@arm.com,
 chleroy@kernel.org, davem@davemloft.net, dave.hansen@linux.intel.com,
 david@kernel.org, dinguyen@kernel.org, geert@linux-m68k.org,
 guoren@kernel.org, deller@gmx.de, chenhuacai@kernel.org, mingo@redhat.com,
 johannes@sipsolutions.net, glaubitz@physik.fu-berlin.de,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, maddy@linux.ibm.com,
 linmag7@gmail.com, mattst88@gmail.com, jcmvbkbc@gmail.com,
 mpe@ellerman.id.au, mhocko@suse.com, monstr@monstr.eu, palmer@dabbelt.com,
 richard@nod.at, linux@armlinux.org.uk, shorne@gmail.com, surenb@google.com,
 tglx@kernel.org, vgupta@kernel.org, vbabka@suse.cz, will@kernel.org,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org,
 x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_202555_055203_EC09DF40 
X-CRM114-Status: UNSURE (   8.55  )
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

This series was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Wed, 11 Feb 2026 12:31:37 +0200 you wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Hi,
> 
> These patches cleanup handling of ZERO_PAGE() and zero_pfn.
> 
> v3 changes:
> * move zero_page_pfn extern declaration back inside the helpers
> * add tags, thanks all!
> 
> [...]

Here is the summary with links:
  - [v3,1/4] mm: don't special case !MMU for is_zero_pfn() and my_zero_pfn()
    https://git.kernel.org/riscv/c/652d12bc74a0
  - [v3,2/4] mm: rename my_zero_pfn() to zero_pfn()
    https://git.kernel.org/riscv/c/9a1d0c738b45
  - [v3,3/4] arch, mm: consolidate empty_zero_page
    https://git.kernel.org/riscv/c/6215d9f4470f
  - [v3,4/4] mm: cache struct page for empty_zero_page and return it from ZERO_PAGE()
    https://git.kernel.org/riscv/c/26513781d1b3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
