Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D82C43458
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2026 18:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxKrL5vQNYcvOGHGUH4WpQcNjYOx72iq4CH7Stewpb4=; b=Is91/bPUIUpHkB
	Lx31NZPo1HWnT1OqVgBjz+Asg5nKs8fk6Pxi6fvsKAQYTdSx4NLjaTIn4B25hhELgLUgqsfLP93U4
	t4ih2sP1/aokFu1hz1ujeM2cZYO/+xGGqGboXtI6bppJNY2N6sqrVwmK4r0mSCI+sp9CWUCpjQR4o
	xWGfa96Snfvlxm9YRlgybuidycOkGL+jSTlnTz/A6CMAEXrzv34QDveX9mVEWZx84ORPJD2BXIuBU
	+JaMMjRf+xJ+BaH9hKImyDbtHkEkZetTUS7f0/k6PgSKva7mCJSGQ0mOIRZdoUjBKdxNaYhJ6+PI/
	29ok5CnRBrNjwqqVWUlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whti0-00000003Hsj-1Huy;
	Thu, 09 Jul 2026 18:42:52 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whths-00000003Hiv-13s0
	for linux-snps-arc@lists.infradead.org;
	Thu, 09 Jul 2026 18:42:50 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-37df72c9984so275178a91.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 11:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622563; x=1784227363; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SzGAEyDF8npliwHJTsZ1x6gPZlMpJ+A+8igDYDtce2g=;
        b=afA02kkw5UnVrTwZBdE7oefxSuC19cUxjXlWYdTxtrGdDrl7VweCnAAvFMOdTsYw2a
         +Shpkaqs7HyKqWULZUHdJrjJS7db6RSCOHANcXVCHkvi3zmFgeSCX4ggAIo7o9ILgCLV
         QaBYmy1cqRLBJOGka833C/PJyVEyFiIoza35VQiQRaSsra/quUP8GarsSFqjIGEfdviY
         g/lWOYQ7EWpL7aIa7Eqx1bLiiahbjDLnQaJ99iXa1bpA/vZ5ivULesCNuEJqSktWakVv
         V6pfbsXrEyfE4M/kQm2qLEvX+hWrF4E43hlcr/G7Ykb7l3XY+wBZg3e4efeYqw9FR70B
         m4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622563; x=1784227363;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SzGAEyDF8npliwHJTsZ1x6gPZlMpJ+A+8igDYDtce2g=;
        b=JU0iBQVjhRK/bA0fz76Xl2pkjUy+W7fAoBSWawqce9fIhZMJW4Kw2klIIRLrqJQCi3
         WHK5/wokvd3jzHQkFzq7MJkuVHb0kyzpZJBCZxdcIvPPtEz9JRpztJ+7C9HYU8ugFe/G
         IaUIJbUmesAxZcv/w5mCM5L1K1XpVzst4K8muO3nzQeRphkz/sQJUW18B8MN4vllaB/r
         x4/kszo9UFCEnYH1A1PtIG17oihPKPks4PiheM+iNyPR0LKw7iLfze0WK5a0FNKuaF96
         8j9fLHhdV7EMzgZ+5efDIAItISC2aJEDHUB4peOtcvdXr7Oh+8fwaTrbpXdLdxnzR4QI
         SqvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1aWyySxoZrLaYDyTR5DUUsggZZIYMd0ooyLysySGCHvLsQuE4MUrkvJsRyj+hf2KheMrMn6dlffEBk+C4KQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx29+e4+bUvyrWuA6VJQvRaH3iyan9rrbmqrII1ozrt1eTi5Wy
	FvTT3QRARkPI+Mmfuf+q56sNKkOUIN6Gz2mTo3sdg8VwXwCsuWeN9xrG
X-Gm-Gg: AfdE7cnkg7ev9Vcr9m6Eb7XkrvQy3rp2P0051IAYFnSX7Rqmxbg/jhSgGFpkGikie7X
	nFohFF1bAD6DkS1nSm5HHywzHLeMWGNqJsSn0sB7dIFS9bZ5GGCYktiWERnVJDygXS4FI/alolP
	KGLCQyV7UD7Af9zTkO3duS+FWgXOCa2e66S0biuA4vJJgssBCjScoO5JoWU9JcunYc5hD2CgOLJ
	jrck9dh1MnsYIDLpO8gocbZ3jsmTRFTBOPOz95b/nC1y184KRk8qCW4GhnUsDFD9Ojzm5pgBZbI
	HlEIhNdiimDej+ozU47F4wl5QJbGhifDP2xo+VMTnarN6HlZ9Vj2iCvE+pXq3tknlWlapGkieo3
	jO74+qX2ouxK61ATkjq8O82u6fjOOekjh9+1LZF1P45ACGQcgPrKtaVsAutAM3wsjQLuhnpup/u
	0ou1l3upKxViBLlNmES3IHSeYt2iQzz4LqSB3wD2PKfLakOobYCr5eofBgQajl
X-Received: by 2002:a05:6a21:682:b0:3bf:b50f:71bb with SMTP id adf61e73a8af0-3c0bc9acb33mr9806931637.27.1783622563297;
        Thu, 09 Jul 2026 11:42:43 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118ee6080dsm19491362eec.17.2026.07.09.11.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:42:42 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:12:23 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	x86@kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, 
	Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, linux-snps-arc@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 06/18] riscv/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
Message-ID: <ak_rfwwd1OtaQxka@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190253.974626922@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260707190253.974626922@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_114244_332393_2DD8BBFD 
X-CRM114-Status: GOOD (  16.55  )
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

On Tue, Jul 07, 2026 at 09:06:19PM +0200, Thomas Gleixner wrote:
> syscall_enter_from_user_mode_randomize_stack() replaces
> syscall_enter_from_user_mode() and the subsequent invocation of
> add_random_kstack_offset().
> 
> The advantage is that it applies the stack randomization right after
> enter_from_user_mode() and thereby avoids the overhead of get/put_cpu_var()
> as that code is invoked with interrupts disabled.
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: linux-riscv@lists.infradead.org
> ---
>  arch/riscv/kernel/traps.c |    5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -7,7 +7,6 @@
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/irqflags.h>
> -#include <linux/randomize_kstack.h>
>  #include <linux/sched.h>
>  #include <linux/sched/debug.h>
>  #include <linux/sched/signal.h>
> @@ -333,9 +332,7 @@ void do_trap_ecall_u(struct pt_regs *reg
>  
>  		riscv_v_vstate_discard(regs);
>  
> -		syscall = syscall_enter_from_user_mode(regs, syscall);
> -
> -		add_random_kstack_offset();
> +		syscall = syscall_enter_from_user_mode_randomize_stack(regs, syscall);
>  
>  		if (syscall >= 0 && syscall < NR_syscalls) {
>  			syscall = array_index_nospec(syscall, NR_syscalls);
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
