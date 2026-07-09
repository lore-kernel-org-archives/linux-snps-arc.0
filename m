Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64B7BC43458
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2026 19:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Q9p6FC5zG9S9CDfVxzBTaIuxbteo0nAkYtJeWKai5s=; b=gn3GgGVrpq6c1h
	nxUYgdgBN7/Mh2dMivIvtZsUqQcIk7PIdfn7Qk1LXD3TIvOZV2Y6VKAcl4lvlFkKc/Al9Q8r3i6We
	4sfbnu6vDmoBWloHYGnRdsbZPVTSZDbFyNk3gQl9CdoztsuHX/2fXHoORuNsO15PVBoXei8OSOuP2
	SPOpuEhLOrSsa01FPJWTwVD0aUYdy48fSqLRP3FaRA/wRa4/Zc8Sm4iCsXKZQuu4Et3SHKc5CC47/
	seJr6gFMS73+louOrC5gMW9c9Em086hcrQYn52N5Q4jw4SKR8jlH3jxrIMQiJKUmrDKnSzVbjOjyj
	ulE8othPA35Kvo1LiMKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whuL1-00000003SIL-0MRh;
	Thu, 09 Jul 2026 19:23:11 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whuKw-00000003SGU-3uci
	for linux-snps-arc@lists.infradead.org;
	Thu, 09 Jul 2026 19:23:09 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c9b1edf2bdso1654155ad.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 12:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783624986; x=1784229786; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bVq923fN3xICcTFI/CD38blZ0rxbZHjRTcEK6CjQmAw=;
        b=eQDe0OJLza2UmQ57UmBMBLafI1MaOaFOOUF1rWIx7gvlqCPdIyO7sW8lmW4P/hVB5C
         HH28IGWYCQy6PWxj0tygmmUlCR3c64PuYUfOdgaZzFBQ25DquI79OE5mi6Jm5n/8JcjQ
         YRzYARvCi5d+cPJ39m8jS0Koa43K71ZCRTK/Y0/XphQTvpSPb4fgIAZ1MURJoMlvzvgq
         fh30JT3pRFIrquiez4ngujmShSG0ltaz1sngvCXofyYZQLPJ5xc2RhlzPFirl/sBk7iJ
         IkylJxMw2kjbWiyxtwEqkUs0hGMsLTsTtU2rmbuPiI+ZIrvYVFAT0NnOFKU4hqsGrhg0
         icbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783624986; x=1784229786;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bVq923fN3xICcTFI/CD38blZ0rxbZHjRTcEK6CjQmAw=;
        b=cFSb33V+0nXxMVXd/kg/yZv81WDaZdYb0rfFvz7hqTQKkvXWZabgj8EA100QhmCqtl
         9AQOwbOfId0jgGD1wrrq5MAVjVaXyQpUZc9PuiqMBwmlBKmrc6mssSwJxRUlc/IlUSD4
         rjrBXM8oVj796uOTycX6kkf+yjMro1ovpSvvVYtyBm9YZ8272kJrYBJEiiJ88J49Js+h
         VzqwCGDrDSH524mMdJHdSphQdDHMPbGPv5Zd+IZJ36b0d2kCr5GSX/pfdcFtRVtAmy5k
         Pnnx9GXc8dEhSb3rtYkXNaeez068FTLv+fDRDFMeNSvpFeOD4lsPIVec+97GDXA94gdI
         CNsg==
X-Forwarded-Encrypted: i=1; AHgh+RrG1OA6EaP6/jhblBobZq+9pe1O3RhRKqNyOMc7OiFLGaVt7qr3SgqLDm5dYDRCcvDe85hfmMPselkDdy+WYg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywr4lI8npTfQ5HEdbRJj9wfmAYa6bVzgj8UtBAWBHKIruNKArOO
	jhvfHzc6o4Y+zAmrvjEdZv5IIwIPaPEkrVi4uCFLQlxkNFGlQapT2I3M
X-Gm-Gg: AfdE7cnposZBuKxV8OelgKFuhF683evI6EIkOCPXMYEO6axQ0x9SrgmNnvREASZk5nO
	hghN3y8eFFRCX2QiQTiaX7GpSNtCLq76541MNjslK+q/O14S3NfcUxdfeEr4jvlG1bW9nLVv6FR
	tUwvqauLLBLcjneGKEfYd7J+3Xql6IKr7l8oeg0I4NsTK6/g8yedKM0glx2lw7g6HoK9qlzpZgY
	K0/ygoGFGPa0+qY48wIbeU8Lz7ofKhWxOwY46xs7iXwjwKQbXVWk2hMclDPp0n/hXFJyi0ZihFY
	sacFC5XRz650cykta9PHc99EcxERmaC8egl5AeRE1t+UK3A+oKEGHzA5M4/Ja0yrkh+kNAbr+XS
	TEVCNUJYjCRBjsGIFY3VfFUTkR9nM58PQOOwSBXf3y/vOazlVvKv+4fjPJOFzvBTsE7xkF+LfFC
	5x5HV8KjAik/hUpx2pYcxNyBAEgc32V++nOqpq396gnaFRJWZBkChVeEvf+SpU
X-Received: by 2002:a05:6a21:6e8f:b0:3b3:1951:489b with SMTP id adf61e73a8af0-3c0bcbc046bmr10368851637.45.1783624986079;
        Thu, 09 Jul 2026 12:23:06 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118ee6091dsm29005934eec.14.2026.07.09.12.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:23:04 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:52:35 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Chris Zankel <chris@zankel.net>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
	loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 12/18] ptrace, treewide: Rename
 ptrace_report_syscall_entry() to ptrace_report_syscall_permit_entry()
Message-ID: <ak_0g7JaD9Z_ApYe@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.280015701@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260707190254.280015701@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_122306_977646_7B220001 
X-CRM114-Status: GOOD (  21.42  )
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

On Tue, Jul 07, 2026 at 09:06:44PM +0200, Thomas Gleixner wrote:
> The return value of that function is boolean and tells the caller whether
> to permit the syscall processing or not.
> 
> Rename the function so the purpose is clear and make the return type bool.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Oleg Nesterov <oleg@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Vineet Gupta <vgupta@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: Brian Cain <bcain@kernel.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Andreas Larsson <andreas@gaisler.com>
> Cc: Chris Zankel <chris@zankel.net>
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-csky@vger.kernel.org
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-openrisc@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> Cc: linux-arch@vger.kernel.org
> ---
>  arch/alpha/kernel/ptrace.c      |    2 +-
>  arch/arc/kernel/ptrace.c        |    2 +-
>  arch/arm/kernel/ptrace.c        |    2 +-
>  arch/arm64/kernel/ptrace.c      |    2 +-
>  arch/csky/kernel/ptrace.c       |    2 +-
>  arch/hexagon/kernel/traps.c     |    2 +-
>  arch/m68k/kernel/ptrace.c       |    2 +-
>  arch/microblaze/kernel/ptrace.c |    2 +-
>  arch/mips/kernel/ptrace.c       |    2 +-
>  arch/nios2/kernel/ptrace.c      |    2 +-
>  arch/openrisc/kernel/ptrace.c   |    2 +-
>  arch/parisc/kernel/ptrace.c     |   10 ++++------
>  arch/sh/kernel/ptrace_32.c      |    2 +-
>  arch/sparc/kernel/ptrace_32.c   |    2 +-
>  arch/sparc/kernel/ptrace_64.c   |    2 +-
>  arch/um/kernel/ptrace.c         |    2 +-
>  arch/xtensa/kernel/ptrace.c     |    2 +-
>  include/asm-generic/syscall.h   |    4 ++--
>  include/linux/entry-common.h    |   25 ++++++++++++-------------
>  include/linux/ptrace.h          |   13 ++++++-------
>  20 files changed, 40 insertions(+), 44 deletions(-)
> 
[...]
> --- a/arch/parisc/kernel/ptrace.c
> +++ b/arch/parisc/kernel/ptrace.c
> @@ -326,7 +326,7 @@ long compat_arch_ptrace(struct task_stru
>  long do_syscall_trace_enter(struct pt_regs *regs)
>  {
>  	if (test_thread_flag(TIF_SYSCALL_TRACE)) {
> -		int rc = ptrace_report_syscall_entry(regs);
> +		bool permit = ptrace_report_syscall_permit_entry(regs);
>  
>  		/*
>  		 * As tracesys_next does not set %r28 to -ENOSYS
> @@ -334,12 +334,10 @@ long do_syscall_trace_enter(struct pt_re
>  		 */
>  		regs->gr[28] = -ENOSYS;
>  
> -		if (rc) {
> +		if (!permit) {
>  			/*
> -			 * A nonzero return code from
> -			 * ptrace_report_syscall_entry() tells us
> -			 * to prevent the syscall execution.  Skip
> -			 * the syscall call and the syscall restart handling.
> +			 * Skip the syscall call and the syscall restart
> +			 * handling.
Hey Thomas,

This comment `syscall call` sounds a bit weird.

Apart from this, Everything looks good.

Regards,
Mukesh

Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
