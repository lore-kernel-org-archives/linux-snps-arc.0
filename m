Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB431C53216
	for <linux-snps-arc@archiver.kernel.org>; Fri, 20 Feb 2026 04:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LwOEHyZGGmtWUiyzGb8rI1Ed74BF9wmQ6WFl72o+dWA=; b=izZbmKMv2gRjGl
	7CAeVxWzNw2u/W3hu8/UFJhffxCJ+3P4nGQzvLaGH+pFxqxceC9mHYgdsmBseZWa6NW6PdO+kG+5e
	cJAEPGFZTdPjcCziucI4d1OznlTlfYVqPBL3EP/toJH6OEoGYTZLlUea5Qa1n2VGg+lIpQ65Ube4k
	ig8aHSU0xTqYA5pw76N1RxebhdWTWUZt/cHkhTdRqVyF0ix7FtktSUgVwsz2r4LDA68VujxPfoCCp
	2TTV05+ChUs3h9VeMr5CA+ZtLLtP0GSGmKy8uDi05qC4lBAqpgffHD74rGeXUnh7921yvVU785JfJ
	iG50/v6apv4U2+yCegUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHr9-0000000DCto-1tOu;
	Fri, 20 Feb 2026 04:11:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHqx-0000000DCZF-2UrD;
	Fri, 20 Feb 2026 04:10:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA55A6185D;
	Fri, 20 Feb 2026 04:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD7FC116D0;
	Fri, 20 Feb 2026 04:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560654;
	bh=Wl/q2I9MW4EAYAIqkkPs9cMuPySyeP7Ys0yLcRoxiik=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=N1VrZuK9lrvi+0jv5UrnpCwpMzW70T8EtjcsHnyvYb/C3ysXhXnwcXh0J1BUrz/fQ
	 FXvJgc0MX5grtuvCDCjFOveYmh43k7YKrhJKjA6KNPY5GbthY3tSAB5Rd8DWyI60O4
	 60LGpZhdpz2TPplFhz9GOt22IkO9j9SafKfb23NhzY6Pqtbyy2AyC4nRduEnajg21H
	 pPrMunHoqFuSELpIJz/FNzbQUBVTQ/4/r5X9keCr5k8mekJQPLFSEN/1VTk4FKKX96
	 mGvQFqOn+07PQ7stZW8usaIlrYxFaew9yX4CoBIDJ2elY6T+mswJuAAcc8jX+e9rPf
	 2Anz+jmhWYL+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FEBA3809A88;
	Fri, 20 Feb 2026 04:11:04 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 3.5] arm: make initialization of zero page independent of
 the
 memory map (was Re: [PATCH v2 22/28] arch, mm: consolidate initialization of
 nodes, zones and memory map)
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <177156066278.189817.13783312336351868850.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:11:02 +0000
References: <aVpWpLV4Dut5Muo2@kernel.org>
In-Reply-To: <aVpWpLV4Dut5Muo2@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-riscv@lists.infradead.org, klarasmodin@gmail.com,
 akpm@linux-foundation.org, alexs@kernel.org, agordeev@linux.ibm.com,
 andreas@gaisler.com, bp@alien8.de, bcain@kernel.org, chleroy@kernel.org,
 catalin.marinas@arm.com, davem@davemloft.net, dave.hansen@linux.intel.com,
 david@kernel.org, dinguyen@kernel.org, geert@linux-m68k.org,
 guoren@kernel.org, hca@linux.ibm.com, deller@gmx.de, chenhuacai@kernel.org,
 mingo@redhat.com, johannes@sipsolutions.net, glaubitz@physik.fu-berlin.de,
 corbet@lwn.net, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 linmag7@gmail.com, mattst88@gmail.com, jcmvbkbc@gmail.com,
 mpe@ellerman.id.au, mhocko@suse.com, monstr@monstr.eu, muchun.song@linux.dev,
 osalvador@suse.de, palmer@dabbelt.com, pratyush@kernel.org, richard@nod.at,
 linux@armlinux.org.uk, shorne@gmail.com, surenb@google.com,
 tsbogend@alpha.franken.de, tglx@linutronix.de, gor@linux.ibm.com,
 vgupta@kernel.org, vbabka@suse.cz, will@kernel.org, x86@kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
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

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Sun, 4 Jan 2026 14:01:40 +0200 you wrote:
> Andrew,
> 
> Can you please stick this between patch 3 (arm: introduce
> arch_zone_limits_init()) and patch 4 (arm64: introduce
> arch_zone_limits_init())?
> 
> From 35d016bbf5da7c08cc5c5547c85558fc50cb63aa Mon Sep 17 00:00:00 2001
> From: Klara Modin <klarasmodin@gmail.com>
> Date: Sat, 3 Jan 2026 20:40:09 +0200
> Subject: [PATCH] arm: make initialization of zero page independent of the
>  memory map
> 
> [...]

Here is the summary with links:
  - [3.5] arm: make initialization of zero page independent of the memory map (was Re: [PATCH v2 22/28] arch, mm: consolidate initialization of nodes, zones and memory map)
    https://git.kernel.org/riscv/c/18b7cc70dea8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
