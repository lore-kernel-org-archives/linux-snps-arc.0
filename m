Return-Path: <SRS0=mt4L=MZ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5031C4338F
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Aug 2021 02:56:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E1FF61050
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Aug 2021 02:56:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E1FF61050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h6biEZw3S89rtcHyVhlnKoo2sVjT8nLmNgKeK1bwqgM=; b=UGrUVwo0/JrNjP
	PG49DRPppP9ucOAKuzIMibnIOk9q9OCh03KBRjlfuNT3XTuSCf+87BZqUUFEEuNXLt+HuTt7TnUAV
	awoxlDcIKHZLLGWDAGM5MDIkyibKrUx1448QIK61GV51vz3vb7lHo1it20RTJJ5PQnughaQdJ/moi
	0DnsmN4R0SUqktpntXU09ASNer8L8MXEhuqO3MBIVo1o5zrTkZx0X9t4LdBKYydRcDihldI9Np8mz
	Col/i5ntXDKRsm5sIB1EGNRuXm4sueLUzFamN2va/qffhzCwpXAdAOfqat3sOieVCpHtvwono+Qht
	YownVqoq7M/Fl88gp7xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAO8C-00Ek0f-3k; Mon, 02 Aug 2021 02:56:44 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2] helo=ozlabs.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAO86-00EjzU-P5; Mon, 02 Aug 2021 02:56:40 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GdN1V04FQz9sW5;
 Mon,  2 Aug 2021 12:56:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1627872995;
 bh=lgFF44D+VvUgGNOcyjoWgD9ieIKlVa+1W38G93yYucc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=mk/OrQNAgyUtJh9QVu/sq6e2cVKMZEuh5t1elkMY1Gr3oABbY0LNl7+izatEJSZYL
 zGYgU92C+VtRG3i2VpinkrgquF7osc3y3sT0rg1Dkyhhq3uC9pQ9Vyxzu9DIdALkJc
 uVe/31b8NqskHAYnC6qUpRqajmu4XqURQ3LIDSg6AKfjRRV0hOE1uY7cgZepVTdX9e
 8HP4jyVzz75vtA5OgyyRq7pJjgDvTYCj/aQ+sFQ1koQ2SqpBgqVF2xnWntozO8y/pw
 uq0H9be0uwkFpXGGeabu1UoeiTG0mQrIQSbO5Gdvb2ehvStkNDQgftwpI5d9vMxe/C
 vq3iTIN0uJtjQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>, Linus
 Walleij <linus.walleij@linaro.org>, Ley Foon Tan <ley.foon.tan@intel.com>,
 x86@kernel.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>, Nick Hu
 <nickhu@andestech.com>, Thomas Gleixner <tglx@linutronix.de>, Mike
 Rapoport <rppt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Zijlstra <peterz@infradead.org>, Catalin Marinas
 <catalin.marinas@arm.com>, linux-riscv@lists.infradead.org, YiFei Zhu
 <yifeifz2@illinois.edu>, Greentime Hu <green.hu@gmail.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Michal Simek <monstr@monstr.eu>, Helge Deller
 <deller@gmx.de>, linux-sh@vger.kernel.org, Vineet Gupta
 <vgupta@synopsys.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>,
 Guo Ren <guoren@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Richard Weinberger <richard@nod.at>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Rich Felker <dalias@libc.org>, Albert Ou
 <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Jeff Dike
 <jdike@addtoit.com>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-hexagon@vger.kernel.org, linux-xtensa@linux-xtensa.org, "H. Peter
 Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Stefan Kristiansson
 <stefan.kristiansson@saunalahti.fi>, linux-s390@vger.kernel.org, Yoshinori
 Sato <ysato@users.sourceforge.jp>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, linux-um@lists.infradead.org,
 Andrey Konovalov <andreyknvl@gmail.com>, Frederic Weisbecker
 <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Brian Cain
 <bcain@codeaurora.org>, linux-csky@vger.kernel.org, Stafford Horne
 <shorne@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Chris Zankel <chris@zankel.net>, Vasily Gorbik
 <gor@linux.ibm.com>, linux-snps-arc@lists.infradead.org, Jonas Bonn
 <jonas@southpole.se>, linux-parisc@vger.kernel.org, Kees Cook
 <keescook@chromium.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Colin Ian King
 <colin.king@canonical.com>, "David S. Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>, Anton
 Ivanov <anton.ivanov@cambridgegreys.com>, Andrew Morton
 <akpm@linux-foundation.org>, Paul Mackerras <paulus@samba.org>, Mark
 Rutland <mark.rutland@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>,
 linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org
Subject: Re: [PATCH 2/3] trace: refactor TRACE_IRQFLAGS_SUPPORT in Kconfig
In-Reply-To: <20210731052233.4703-2-masahiroy@kernel.org>
References: <20210731052233.4703-1-masahiroy@kernel.org>
 <20210731052233.4703-2-masahiroy@kernel.org>
Date: Mon, 02 Aug 2021 12:56:13 +1000
Message-ID: <87lf5klfle.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210801_195639_082441_FF0083DD 
X-CRM114-Status: GOOD (  15.15  )
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

Masahiro Yamada <masahiroy@kernel.org> writes:
> Make architectures select TRACE_IRQFLAGS_SUPPORT instead of
> having many defines.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/Kconfig                  | 3 +++
>  arch/arc/Kconfig              | 4 +---
>  arch/arm/Kconfig              | 5 +----
>  arch/arm64/Kconfig            | 4 +---
>  arch/csky/Kconfig             | 4 +---
>  arch/hexagon/Kconfig          | 4 +---
>  arch/microblaze/Kconfig       | 1 +
>  arch/microblaze/Kconfig.debug | 5 -----
>  arch/mips/Kconfig             | 1 +
>  arch/mips/Kconfig.debug       | 4 ----
>  arch/nds32/Kconfig            | 4 +---
>  arch/nios2/Kconfig            | 3 ---
>  arch/openrisc/Kconfig         | 4 +---
>  arch/parisc/Kconfig           | 1 +
>  arch/parisc/Kconfig.debug     | 3 ---
>  arch/powerpc/Kconfig          | 5 +----
>  arch/riscv/Kconfig            | 4 +---
>  arch/s390/Kconfig             | 1 +
>  arch/s390/Kconfig.debug       | 3 ---
>  arch/sh/Kconfig               | 1 +
>  arch/sh/Kconfig.debug         | 3 ---
>  arch/sparc/Kconfig            | 1 +
>  arch/sparc/Kconfig.debug      | 4 ----
>  arch/um/Kconfig               | 5 +----
>  arch/x86/Kconfig              | 1 +
>  arch/x86/Kconfig.debug        | 3 ---
>  arch/xtensa/Kconfig           | 4 +---
>  27 files changed, 21 insertions(+), 64 deletions(-)

> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index d01e3401581d..76a28452c042 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -94,10 +94,6 @@ config STACKTRACE_SUPPORT
>  	bool
>  	default y
>  
> -config TRACE_IRQFLAGS_SUPPORT
> -	bool
> -	default y
> -
>  config LOCKDEP_SUPPORT
>  	bool
>  	default y
> @@ -271,6 +267,7 @@ config PPC
>  	select STRICT_KERNEL_RWX if STRICT_MODULE_RWX
>  	select SYSCTL_EXCEPTION_TRACE
>  	select THREAD_INFO_IN_TASK
> +	select TRACE_IRQFLAGS_SUPPORT
>  	select VIRT_TO_BUS			if !PPC64
>  	#
>  	# Please keep this list sorted alphabetically.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
