Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47C0C43458
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2026 18:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BOxKgyALCeQuub4kt+Tee79C40P8LKgjO8gJZOpgXY=; b=yfEDR0h9X34nHX
	z26GUyJaFk5k2ucFbiex4zg5HHyfMLBLE7CSTOp1WODuNvBJx8CjlM0dzCjg7OQhUx0wBtAbbXXUt
	P4QZAeqXvwHyrX63QFIKSU9/RVfijlcMNAECIxeWZYdggqU+wt/MiUddh/kXlTvvs6a8YiWl9VF3g
	4xAvHD4AlrqUmVN9HU8YUXdOsNIW2VV0sI80jv/Xmnc82a2WcxH/tOyyzktpAV7qK4/CRX1irc8Xe
	VleJge2MSAiz09CLxVHzANW/U4rRkDL+zYUZ8KOub3AlIEjtra9fyI4MUrHxL6p3soDYYj8czZLXa
	M6IfIpg5uH+b+h6cs2cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtq3-00000003K3K-1xHs;
	Thu, 09 Jul 2026 18:51:11 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtpz-00000003K1k-2jpy
	for linux-snps-arc@lists.infradead.org;
	Thu, 09 Jul 2026 18:51:09 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-388b404ea89so195432a91.0
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 11:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783623067; x=1784227867; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+EsurZOWBA/vTxJ4VlwckFkTmsLoBwFFgPdTWboTXPw=;
        b=q9yNvxRtFzaUbI6BlxC71WBs2h6nncI7vkEWjE0WzhJolBOIaV1oxfv6+XWO081Xd1
         K8nETI5ll4E6P3kXTvyTsJ5VpWftUziKChRDFCWqv0W9eWux/iBz79MJw/vNVcl17CKK
         gJN8FZaS6mZ/RTLh3T7uXCI6RUMQ+dLqYml3NUNs1pVbfw+7zQSNSh/vqTwqG+uGgu7S
         s11rE+0JOCkJm9PY8En0BXpV6eBL58WgWki9ygj+6ams0nyJr6CvkHXuLeA6VymbJd9U
         iUGDbXHuvSY4E5K6t6hNbPrJdkobLElLZv6pwor7RTD2UDBaSKsOLYNd92Z4YNaHhXEB
         Uunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783623067; x=1784227867;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+EsurZOWBA/vTxJ4VlwckFkTmsLoBwFFgPdTWboTXPw=;
        b=Rtl6sixZUpHxWaBzCYnNj2E2hPsSEDxqIeKDdVycyzrF15aH/Y5fe7kB1T32keeBo6
         8X6rZYQTcGaq5mDJmLqQBiNiE4v2xeunK5FTaR8oiw/V7zylrkI+wC0dObIuJkM0heDf
         HCeizY1QhEDjRbcQ1akauYwXktKJbqqWNIUdH97OtGhPP/x/SorbLQjpWTnCGtfql6az
         O23w6SF2MxuhlD2CGWwx45Fa3G7EqXIaiu39CZLsu8+T8Md02/Ch9OD/fSK2AEm1yy+G
         Ku+LixdeV9pGqkHEJtS2nS3W3L4imzL2z+bbx4ow7PzXYxQylp7PdEtMdCWpTfunFukR
         SRwg==
X-Forwarded-Encrypted: i=1; AHgh+RqILCj5s9/XLyYxH9OcnCVWKA9tEe8lMMjzzpQJTp1COiFae9yNVJ7LdJcNrTZN78sq/wBQBp+vLQ4GoP9EfA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2rjDmZYiXrRJAvyGOFTbfCRdhCQtflU02xxu6z383mp1RG2nJ
	cPPWPIf6j8MCc39XOiB/QT39m5qwqzt73QQr9EOvkMIDVPWHOM+lewZ4
X-Gm-Gg: AfdE7cmlTOqPOYwmgm5prinC6wYMFuPh1ptDuge9Q6oLzjCKdgdGwTJ+zqRGNqTGXab
	7kXf5ns3cwFotG8bdbZJsNT17oDW8xcZ8S/TkuivuO/QkuS90QHsMLf0khHWRM7U1r2VDdWtQCU
	+mb0aT8w3rTSzaMGtqUl2ChYLRhKZ9x/dXRbMxaFuGyh8Vsw4kJCM3qbWmuZ3S5/iuISW4kGBon
	LXVPARFqL9u24pUxOnU75UbDZ8yqAUHTPCLgDAXW61lzOnBLUqaApS1i9Fsedd1i6E85qd0tAzH
	mTYkrkeJ0n93A3Sx05IP7qrUZjIdPl/tlYmtcNAXKmLktQ4VkmPWD6RezXCgjWYgbP7nrwBDC2r
	xiy7yIoPIy52Y3gU/7FefTkWYhWe6kXykvzXbAHtzBT5NgqP6ZRceDBpep2E7MFWLS2YxP1s0vv
	SjEyCvh9UOgdiVefqlxNH/xbcAoEUZ9eKEPSGKqW1R0xbMYeZc+Rz6w6FMDL8N
X-Received: by 2002:a17:90b:3d86:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-38d15876f4amr425299a91.15.1783623066680;
        Thu, 09 Jul 2026 11:51:06 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm33415688eec.2.2026.07.09.11.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:51:05 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:20:46 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
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
Subject: Re: [patch 10/18] entry: Use syscall number instead of rereading it
Message-ID: <ak_tgBEhNxX5m700@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.181086755@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260707190254.181086755@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_115107_700240_4F2929D5 
X-CRM114-Status: GOOD (  16.72  )
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

On Tue, Jul 07, 2026 at 09:06:36PM +0200, Thomas Gleixner wrote:
> rseq_syscall_enter_work() is invoked before the syscall number can be
> modified. So there is no point in rereading it from pt_regs.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>  include/linux/entry-common.h |    9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -70,9 +70,10 @@ static inline void syscall_enter_audit(s
>  	}
>  }
>  
> -static __always_inline long syscall_trace_enter(struct pt_regs *regs, unsigned long work)
> +static __always_inline long syscall_trace_enter(struct pt_regs *regs, unsigned long work,
> +						long syscall)
>  {
> -	long syscall, ret = 0;
> +	long ret = 0;
>  
>  	/*
>  	 * Handle Syscall User Dispatch.  This must comes first, since
> @@ -90,7 +91,7 @@ static __always_inline long syscall_trac
>  	 * through hrtimer_interrupt().
>  	 */
>  	if (work & SYSCALL_WORK_SYSCALL_RSEQ_SLICE)
> -		rseq_syscall_enter_work(syscall_get_nr(current, regs));
> +		rseq_syscall_enter_work(syscall);
>  
>  	/* Handle ptrace */
>  	if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
> @@ -145,7 +146,7 @@ static __always_inline long syscall_ente
>  	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
>  
>  	if (work & SYSCALL_WORK_ENTER)
> -		syscall = syscall_trace_enter(regs, work);
> +		syscall = syscall_trace_enter(regs, work, syscall);
>  
>  	return syscall;
>  }
> 
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
