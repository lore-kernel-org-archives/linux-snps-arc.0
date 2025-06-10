Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DA9C61DB2
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Jun 2025 19:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5VgOdAiPJ7quXg7EKPLeseZropPYVDRl5AB/vDoDbg=; b=5D9pYb+u0eAYo5
	1xIc4YLhEqMYQZkFLuGEi7tvqmLfNyqYABby3/yKModgDH8GEziEw3R094hd0eXcqiY8LCdVfD1bU
	1zjhzC5wmFiASu30Wae/hBf7WMnJzmntJJd5n82OE9oeFOF6tEO0qPbKxLhCJubG8RLpgVP6pOxUg
	E2EscN6L2WrM5h/GQnXQUmxVVUkB5yGSSHRIFJ0VUlXni8kHRMXXAio2WRKWJwsVONzaJ8hKJskk8
	T0zB7Z3ivOq+PuVtWVXWiWIi+6balahSqknOTawed0GxZMz8JoEXNzcCBb8voFwIwn0tnKi3baeKC
	NMewfg5a6N6IYdxSt65A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP57M-00000007z4n-0g5d;
	Tue, 10 Jun 2025 19:58:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1pb-00000007T7u-0ALV;
	Tue, 10 Jun 2025 16:28:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB613629F9;
	Tue, 10 Jun 2025 16:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84AE9C4CEED;
	Tue, 10 Jun 2025 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749572889;
	bh=VGaA2UjcATw5usDRARWAGHoyvA3nRCcXodZF/+d4fPQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=JJ1f2Y7NQSd54tSszQLRiQIl7dD277rRFw5CD03cct8JsOIa9MeckGxwgeTNERJbY
	 /Aq7k/QdxMobJHlLVMWLaBVYiO7WUz7b5oZF8aZHHmpn5SGMFxfrabCx4zi/NelVA7
	 9tpmie/ZR7eRtm/GQUxR12kWA/MXW8KxThnLlIuGSON9FK96/TttZtzzrp91aMtCTf
	 nkrgxszvlyVUm0gGo8/i60pLDKogQxJCIy6qqOtv6fYwtbh3P8fqWAcjVqLwJncDb0
	 2wdFJTUv8YDSR+ksvQyqg1NCDe5af7sVQqmJb6cWow02fsajDICno0naOHZ+D1dFYd
	 UMToThilj3zfw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D5B39D6540;
	Tue, 10 Jun 2025 16:28:41 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] arch: use always-$(KBUILD_BUILTIN) for vmlinux.lds
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <174957291974.2454024.16546912662876416180.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 16:28:39 +0000
References: <20250602181256.529033-2-masahiroy@kernel.org>
In-Reply-To: <20250602181256.529033-2-masahiroy@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org,
 aou@eecs.berkeley.edu, agordeev@linux.ibm.com, alex@ghiti.fr,
 andreas@gaisler.com, anton.ivanov@cambridgegreys.com, bp@alien8.de,
 bcain@kernel.org, catalin.marinas@arm.com, chris@zankel.net,
 borntraeger@linux.ibm.com, christophe.leroy@csgroup.eu,
 dave.hansen@linux.intel.com, davem@davemloft.net, dinguyen@kernel.org,
 geert@linux-m68k.org, guoren@kernel.org, hpa@zytor.com, hca@linux.ibm.com,
 deller@gmx.de, chenhuacai@kernel.org, mingo@redhat.com,
 James.Bottomley@HansenPartnership.com, johannes@sipsolutions.net,
 glaubitz@physik.fu-berlin.de, jonas@southpole.se, maddy@linux.ibm.com,
 mattst88@gmail.com, jcmvbkbc@gmail.com, mpe@ellerman.id.au, monstr@monstr.eu,
 naveen@kernel.org, npiggin@gmail.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, dalias@libc.org, richard.henderson@linaro.org,
 richard@nod.at, linux@armlinux.org.uk, shorne@gmail.com,
 stefan.kristiansson@saunalahti.fi, svens@linux.ibm.com,
 tsbogend@alpha.franken.de, tglx@linutronix.de, gor@linux.ibm.com,
 vgupta@kernel.org, kernel@xen0n.name, will@kernel.org,
 ysato@users.sourceforge.jp, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, x86@kernel.org
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
by Masahiro Yamada <masahiroy@kernel.org>:

On Tue,  3 Jun 2025 03:12:54 +0900 you wrote:
> The extra-y syntax is deprecated. Instead, use always-$(KBUILD_BUILTIN),
> which behaves equivalently.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/alpha/kernel/Makefile      | 2 +-
>  arch/arc/kernel/Makefile        | 2 +-
>  arch/arm/kernel/Makefile        | 2 +-
>  arch/arm64/kernel/Makefile      | 2 +-
>  arch/csky/kernel/Makefile       | 2 +-
>  arch/hexagon/kernel/Makefile    | 2 +-
>  arch/loongarch/kernel/Makefile  | 2 +-
>  arch/m68k/kernel/Makefile       | 2 +-
>  arch/microblaze/kernel/Makefile | 2 +-
>  arch/mips/kernel/Makefile       | 2 +-
>  arch/nios2/kernel/Makefile      | 2 +-
>  arch/openrisc/kernel/Makefile   | 2 +-
>  arch/parisc/kernel/Makefile     | 2 +-
>  arch/powerpc/kernel/Makefile    | 2 +-
>  arch/riscv/kernel/Makefile      | 2 +-
>  arch/s390/kernel/Makefile       | 2 +-
>  arch/sh/kernel/Makefile         | 2 +-
>  arch/sparc/kernel/Makefile      | 2 +-
>  arch/um/kernel/Makefile         | 2 +-
>  arch/x86/kernel/Makefile        | 2 +-
>  arch/xtensa/kernel/Makefile     | 2 +-
>  21 files changed, 21 insertions(+), 21 deletions(-)

Here is the summary with links:
  - [2/2] arch: use always-$(KBUILD_BUILTIN) for vmlinux.lds
    https://git.kernel.org/riscv/c/e21efe833eae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
