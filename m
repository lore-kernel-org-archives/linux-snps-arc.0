Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A307C43458
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2026 18:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9B1fdxKa0PTqw4CoQhT7qsRvfCQjMBSS29+mRk5HxJg=; b=FZgWXAb7G7fi2B
	NMBISbx8M/6eHvMsvrRGYKB2HtzwaFxmECd3Djulfts5KSuwAqBCT55Jt0UE4rzvpSNQbxFwZDgLk
	mKWqywn5DZs+fhdlRxNZJNhzJO6YY7UGMDksaR5CD8wW7+XUDhl2U7fMLnKpwo0IrjVmMTgAYsTsg
	rF/2NIOomOHQfp7e8eSoTCnvPr/Uj64YVrijdr/fI9mcjT1IR3oZKWmx0vzh6i4gujkPpcoSZteHd
	EtbwtAyNYyZS/SLPVcf4H3MaEsSYlgw1LhoXn9LwWerFkyk2Ysovz+UXwV0tBLqY29UgE7md0zvdd
	yH6/g0NgFQQD1BijJ7LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtj0-00000003IiB-43qO;
	Thu, 09 Jul 2026 18:43:54 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtiz-00000003IgE-0r6V
	for linux-snps-arc@lists.infradead.org;
	Thu, 09 Jul 2026 18:43:54 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3825c406ffeso223451a91.0
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 11:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622632; x=1784227432; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0SnVDTLPnMBjkQSM4oCN+URozdUIH28ywJdKUrWn7bI=;
        b=bHWgjf5RFP/KZwvHAaeX8WBMDgJz4Ci/1STMPleQs4se5V+Oc2SgzTVmFw8JgLRpnF
         Xe56DEWEJQIy/v4H7DAz79MYgFzWXlp9uiPoOWrO6wWtx97+YSkcGoGzToDy9laEsyWV
         GMcxyodeSDoCXdXIrapHn2pqL7eB3VCnezFLJ2czQRKOITPseLkjD1CdY+7AycNdK4x4
         o/YGpHLorLvxAKlxUwIaPh2cDECjRH6iR1uBP+lG1TCr+mbsCpZc8Yz8uq7cab8KRiz/
         MiifIW8noiB3zneWq1nDHvNz2s4tXPU4pYCWvkWOra59PlvlbJlJ/yUpJdGtmGytP3us
         WChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622632; x=1784227432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SnVDTLPnMBjkQSM4oCN+URozdUIH28ywJdKUrWn7bI=;
        b=U8PAloN2+FR1iRqeM1jJcQsv+JD0LX+avxqXyFYvAEqxyPuOqMZbXuTwGCT168khF7
         H2Kcac4F8y6wpnZoPuTdhPh1OGCaiEcg6cp6eie81Bs4f7GNQ/YWF0dV2TG4UHSLRa44
         Dx5udCXMKisG2SE2/kJ5KNzqbaXXXkMqwjc0dOsmNMFnkXqIb9jxfa6sdU1cr/ypQIsY
         rCB0MqeMlGC3lRfWUPTDai+RsRdhvJL/wFytoEyxOjpYy/a/8dcU6PD35cTH6lTijX5Z
         u0lhFdkNkoORDfTqzfjxO8zvr8GgL/BZDQnjVlL2zrVbvJ2es1G39FMsK3eFTHExhJ6V
         AaXw==
X-Forwarded-Encrypted: i=1; AHgh+Rqm08DhQ+kNGpVLvgfvuvQ2lU4rF75nNBciHUBGif2Lf3WfOvdMnj4Rkov79VnL6dE5h/a70Dx3eDif5kLeZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEFldge8ZDrzvtb2wGceOAv9b8wGxIHUmMkWd3/sUOVmQDTSXs
	8R8H5JvKFjEPxz4xDQ2BSL1DxpG9tLuBMvS3YyqlqaxZ8zqnBT8hjtnJ
X-Gm-Gg: AfdE7cmQk7J2JeJfpH7hpBffkr81c/eonh9RmI//IUGHZMFVVT4ou1hPmvs39mITONg
	Ayh/TCPdtA7810I8VRet2/1Q0xvVoNTz/v5oMo8hH6JxbKU+c7SGJsOJ6Z6YEAlKrYGfNJpRjr2
	fIHtrWKxtqVsrrqjf9zNhz1Sv61TFrGbHye8AtzN3B7XG1bW6gj0iP6hS4Z+gQgXYw2czynhAK4
	E9u+QFN9quOpMfDZBd3fW238FmBNUozv7cgSWUrdCXvkbp8lePH2jT3QTlM4yrNZUvD/pvlcUz7
	rurDZcdmC0y+7yPRhiIHrJ0vex6RQpKuE9Y0ETmcCwG6J4k3jlrzs4NfLNVNz8RryB8/fHLmodk
	yLYfDi68jiHQvXPCjKBDG8NXlr7vikG2Uqj3phhrwUjd8DOZf+JjgaaSAnn7YiBST/OJ+sCxlNh
	9UoB5JUiA4OS/9J9cpzd7skFZOZQKh2Qc9Qeb2r3e13ynEgxd1FtghGoZUK/hX
X-Received: by 2002:a17:90b:564d:b0:387:e0db:3d90 with SMTP id 98e67ed59e1d1-38943d404dfmr8538131a91.43.1783622632431;
        Thu, 09 Jul 2026 11:43:52 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accb0esm35673867eec.30.2026.07.09.11.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:43:52 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:13:32 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, 
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, 
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 07/18] s390/syscall: Use
 enter_from_user_mode_randomize_stack()
Message-ID: <ak_rx2gFCLtG-Qpy@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.030598804@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260707190254.030598804@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_114353_243539_A5C98918 
X-CRM114-Status: GOOD (  15.25  )
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

On Tue, Jul 07, 2026 at 09:06:23PM +0200, Thomas Gleixner wrote:
> enter_from_user_mode_randomize_stack() replaces enter_from_user_mode() and
> the subsequent invocation of add_random_kstack_offset_irqsoff().
> 
> As a bonus this avoids the overhead of get/put_cpu_var() in
> add_random_kstack_offset().
> 
> No functional change.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Sven Schnelle <svens@linux.ibm.com>
> Cc: linux-s390@vger.kernel.org
> ---
>  arch/s390/kernel/syscall.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- a/arch/s390/kernel/syscall.c
> +++ b/arch/s390/kernel/syscall.c
> @@ -97,8 +97,8 @@ void noinstr __do_syscall(struct pt_regs
>  {
>  	unsigned long nr;
>  
> -	enter_from_user_mode(regs);
> -	add_random_kstack_offset();
> +	enter_from_user_mode_randomize_stack(regs);
> +
>  	regs->psw = get_lowcore()->svc_old_psw;
>  	regs->int_code = get_lowcore()->svc_int_code;
>  	update_timer_sys();
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
