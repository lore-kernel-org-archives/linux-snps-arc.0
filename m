Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0953C02192
	for <linux-snps-arc@archiver.kernel.org>; Mon,  3 Feb 2025 19:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LiPY6b4c3oRO2AApwAsaw3AtzkxYKsTKjgsgHmirBM=; b=kScbeEQrF/lgrB
	gddHiDzwnnCnF9+foYKk0cjABUrq3YkqLm3OW69rbvOI26ehNmR0Aefnb6edIicChZpnTVnKo5Ld8
	8SY3sux7VGJgSPD0HjcxYjji6cBy5OpPJ72zdCEXS7WvbxDdnp7liKTn+5V0KgKyIvuUDFSpccg99
	mSBzvJX3sRPIaw8XOl0ckzRKtGPNIiVtlFRqIqVehAAZ2EZh4+eU3OcrlMsL2vmL/J+2IZ1bndwxV
	2QOO/8YKdwGP9VJl00H6CAJ8eknmqGTjTl50ulDff4F792rpIwCKXFK3Ggyted4R3BMq84Xn++Pwk
	pTKnPWajp5xD5Wtvwzrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1xG-0000000GQvo-0gju;
	Mon, 03 Feb 2025 19:17:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1ub-0000000GQ52-19Tu;
	Mon, 03 Feb 2025 19:15:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2C971A41C00;
	Mon,  3 Feb 2025 19:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3405DC4CEE8;
	Mon,  3 Feb 2025 19:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738610112;
	bh=8HQ4a1E4SDVOQ5YBvLQgJdIjKRquxOBX3OP+awOzn44=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qEtWCcTqxtSD1UgKWJSa3crMG4kGSavYOQGcCcI4V2cyH4DOILJiyITwiSJtgrhHJ
	 leMpKr+OZgSpraWb0RiKFAKjm2zqvuhyymj1LfT8j1LOjp2fCtL0lg6qoyRWBlojQI
	 ZiaJmTEaG54Lo9sr/U8i6GeSmTgxwh0kIBhsKt5unGdN62jNr4PwFCDw08fmRqfzFL
	 BX4XCHouDDkARe7MVneI8SuivabGbQ0ef19DQGBgsurLFrWhryNqMG+dh8YZhkYfEY
	 oasu2bD4iIR5M3wZq53wObBELHA9T5YPUy+0+nOm85VEduVf6KsFBTNEF9j2Fb88zz
	 VG58pi8j5CwdQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71824380AA67;
	Mon,  3 Feb 2025 19:15:40 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/6] Account page tables at all levels
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861013901.3409359.14741114405031556153.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:39 +0000
References: <20250103184415.2744423-1-kevin.brodsky@arm.com>
In-Reply-To: <20250103184415.2744423-1-kevin.brodsky@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
 akpm@linux-foundation.org, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, linus.walleij@linaro.org, luto@kernel.org,
 peterz@infradead.org, rppt@kernel.org, ryan.roberts@arm.com,
 tglx@linutronix.de, will@kernel.org, willy@infradead.org,
 zhengqi.arch@bytedance.com, linux-alpha@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 loongarch@lists.linux.dev, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_111513_383381_71EB4C36 
X-CRM114-Status: UNSURE (   8.89  )
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

On Fri,  3 Jan 2025 18:44:09 +0000 you wrote:
> v1: https://lore.kernel.org/linux-mm/20241219164425.2277022-1-kevin.brodsky@arm.com/
> 
> This series should be considered in conjunction with Qi's series [1].
> Together, they ensure that page table ctor/dtor are called at all levels
> (PTE to PGD) and all architectures, where page tables are regular pages.
> Besides the improvement in accounting and general cleanup, this also
> create a single place where construction/destruction hooks can be called
> for all page tables, namely the now-generic pagetable_dtor() introduced
> by Qi, and __pagetable_ctor() introduced in this series.
> 
> [...]

Here is the summary with links:
  - [v2,1/6] mm: Move common part of pagetable_*_ctor to helper
    https://git.kernel.org/riscv/c/11e2400b21a3
  - [v2,2/6] parisc: mm: Ensure pagetable_pmd_[cd]tor are called
    https://git.kernel.org/riscv/c/3565522e15eb
  - [v2,3/6] m68k: mm: Add calls to pagetable_pmd_[cd]tor
    https://git.kernel.org/riscv/c/1879688e5c42
  - [v2,4/6] ARM: mm: Rename PGD helpers
    https://git.kernel.org/riscv/c/94771023712a
  - [v2,5/6] asm-generic: pgalloc: Provide generic __pgd_{alloc,free}
    https://git.kernel.org/riscv/c/a9b3c355c2e6
  - [v2,6/6] mm: Introduce ctor/dtor at PGD level
    https://git.kernel.org/riscv/c/d95936a2267c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
