Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9493DC43458
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2026 19:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PVpTVsMQc1ZNttvQmzQVL0OBoQsHJ5pfkOeihrBUgug=; b=jivwimk8lZlzg/
	2xOY8Y0OStfNaxi1/MFe8L26UzEVJSIs3UY6jZThWQWA1aeqxoR+LRu8ywObAcoz4AUbOSMuVXsh9
	JSx20cQ0ZWerjnXCejV/lzhU97MI1bshiwotnOm0o78av4x+TF6ZXjuDBL2LyOegAWv006URam+NM
	2BSev/Z1yVutOBoQ8KAebV0ZQE/rEHa40rGvfHM0PpkPBYV1tZ6YGqQPipfHA6RXwIbSgqTVGA4HE
	lV5oMW+NP4uwG3X+BShf+D7xsMxIWgnlQ/3mRebHqDmt/CZUDTaj+wIV5J0EjGpFPB6N7LYJTlX4z
	ah2x7MBbTH9KFk3+sfaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whukq-00000003WHT-1MWA;
	Thu, 09 Jul 2026 19:49:52 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whukm-00000003WFy-3W2x
	for linux-snps-arc@lists.infradead.org;
	Thu, 09 Jul 2026 19:49:50 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cacb8416a1so1190715ad.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 12:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783626588; x=1784231388; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wZIZ82kjBIDu2ZrVW8MGg3L6TnunPhQvQy9pezlSzDk=;
        b=rqX7zj7j7P1L2JxvuvLzjgTHpENxL0PFVPfgqxB5M0rkb9ty1uVMy8LpFiuzxvgr+8
         A60DrbcQqlq//a471a84VPg8P8ZBa5i175FMh7qcqnYK0Dh7TZB4Dg47AJbAb228avPr
         RJWhdfs7pVplwQ7vZxK0bAArgSFXPDLFEfaKLztvzrhUtuXXHhB4clzM7eeUG73ESV9G
         sNlPg9GrC2k0gzXl8GXES7IVc6ivI0iXode07baVIwrgK/rq5DGESArRBU/3U9jQvJTi
         9tcLo1vOAyCVqSOhzJyyFjdN9kWpZAAW2q5e4QG5s11NuV8YeX+buP2Ln+KQSNK05IWj
         AfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783626588; x=1784231388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wZIZ82kjBIDu2ZrVW8MGg3L6TnunPhQvQy9pezlSzDk=;
        b=ay0bWUYus6ghDooxLpl9odYqZxCNF3O2XzYBzelswMH4DLMzWcn880CtiTS0MjWGr9
         4eF1ZY11ebIOeLDW07U08NqPibePKE2S0VhMiNCbKnKvra7WipyyfVMkldL6WlhSED80
         inR7IhqihrNTocsa4jMXg1fCYbnQJ42VU1HLktoPc2Evollt7vDDkd8F3641FBiH1ZhW
         sPSIyBPpGml0mgoZFdvCbXjvu1EmYmtpOPho1SSSxeEyg1ibyaVjWU8/5O/n+9bzvd07
         JTpG3NVoXDZznP/DiwTovEmN2Pumo05/UjndlvS2eeulUGajr1XsH9Ke3AM6k7QG1im5
         iwNQ==
X-Forwarded-Encrypted: i=1; AHgh+RpyEhLI2E7fIZM2FIaZBmJ+AfavuI5Hb65UcwIs/hT9Lssu3Ncd4zFB3naPaAecTIlRY4kPE7tZM4V2dN87Wg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwE/OE9EYTwH6d3Gl4/L+Jp1L11rdq1Hze4Pj2VZ12OumwIpD7k
	xbnrxC9LwD/eYsOPA+8F+4BGA0QYPNDaXkicYp4dRiSBg9b+lZZFrTSV
X-Gm-Gg: AfdE7cmSYrVBWIpjLMx5d/b4FnJn2ET8CBrpOVe3Fd85Gh0zpKDJs0l7KJJWG2+d77T
	bGlTYp+KHLVhe/p0HwUbzysqPERFdFrPHMkmyOtkPWLXa7IpI4ZsRMYi91J/YFw1lX6jBWD1Mnl
	c97KK+vCOT58BTK3bSo+c6+Unalf3/XwmV+cgXHCDR/6L7ZYsQEBStGdQfKZkLrWvvV5ugJLSdj
	Vp2F+MvhdoXPYbQxXE1fI1iBMP+4xQXa3HtdovkSiaBhQzxfu/1Hqs53MGjuLZUiwV80QxW35ju
	fNAkC0rPSXztbg62WCF/pSPnNMVDf6YRaj9jfBCKrh82TLQSsPrlLkGvdmd43suJe5DhIfkMnUZ
	0pHlNVEgGygBkYv77G9v+W2bLhaa8DuPZIZWitM/z9hMNf2FNfXjG7/uLBgk1SrO8a59L5e1S6d
	e04PttxZ6s0MTpbeIBh2XV/L9AeWODgphWUBs7n0BX70MIDaKm8+tXQJ4wDD3s
X-Received: by 2002:a05:6a21:512:b0:3bf:a0e5:999f with SMTP id adf61e73a8af0-3c0bcfab03dmr10300238637.22.1783626587867;
        Thu, 09 Jul 2026 12:49:47 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34548981eec.16.2026.07.09.12.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 12:49:47 -0700 (PDT)
Date: Fri, 10 Jul 2026 01:19:28 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>, 
	Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-doc@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, x86@kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, 
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, linux-snps-arc@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org
Subject: Re: [patch 18/18] entry, treewide: Make
 syscall_enter_from_user_mode[_work]() indicate syscall execution
Message-ID: <ak_63WGVz28C2dc0@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.603111179@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260707190254.603111179@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_124948_887991_1E0D6809 
X-CRM114-Status: GOOD (  30.17  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Jul 07, 2026 at 09:07:09PM +0200, Thomas Gleixner wrote:
> From: Michal Such=E1nek <msuchanek@suse.de>
> =

> The return values of syscall_enter_from_user_mode[_work]() are
> non-intuitive. Both functions return the syscall number which should be
> invoked by the architecture specific syscall entry code. The returned
> number can be:
> =

>   - the unmodified syscall number which was handed in by the caller
> =

>   - a modified syscall number (ptrace, seccomp, trace/probe/bpf)
> =

> That has an additional twist. If the return value is -1L then the caller =
is
> not allowed to modify the return value as that indicates that the modifyi=
ng
> entity requests to abort the syscall and set the return value already. Th=
at
> can obviously not be differentiated from a syscall which handed in -1 as
> syscall number.
> =

> The established way to deal with that is:
> =

>     set_return_value(regs, -ENOSYS);
>     nr =3D syscall_enter_from_user_mode(regs, nr);
>     if ((unsigned)nr < SYSCALLNR_MAX)
>     	handle_syscall(regs, nr);
>     else if (nr !=3D -1)
>     	set_return_value(regs, -ENOSYS);
> =

> The latter is obviously redundant, but that's just a leftover of the
> historical evolution of this code. S390 has some special requirements her=
e,
> which can be avoided when the return value is not ambiguous.
> =

> Now that the functions which modify the syscall number and want to abort
> are converted to indicate that with a boolean return value, it's obvious =
to
> hand this through to the callers.
> =

> Rework syscall_enter_from_user_mode[_work]) so they take a pointer to the
> syscall number and return a boolean, which indicates whether the syscall
> should be handled or not.
> =

> That's not only more intuitive, it also results in slightly denser
> executable code on x86 at least, but perf results are neutral and within
> the noise.
> =

> [ tglx: Adopted it to the changes in the generic entry code, fixed up the
>   	32-bit fallout and rewrote change log ]
> =

> Signed-off-by: Michal Such=E1nek <msuchanek@suse.de>
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
> Cc: Paul Walmsley <pjw@kernel.org>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Sven Schnelle <svens@linux.ibm.com>
> Cc: linux-doc@vger.kernel.org
> Cc: loongarch@lists.linux.dev
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> ---
>  Documentation/core-api/entry.rst |   18 +++++++++++-------
>  arch/loongarch/kernel/syscall.c  |   14 +++++++-------
>  arch/powerpc/kernel/syscall.c    |    3 ++-
>  arch/riscv/kernel/traps.c        |   11 +++++------
>  arch/s390/kernel/syscall.c       |    7 +++++--
>  arch/x86/entry/syscall_32.c      |   25 ++++++++++++-------------
>  arch/x86/entry/syscall_64.c      |   12 ++++++------
>  include/linux/entry-common.h     |   12 +++++-------
>  8 files changed, 53 insertions(+), 49 deletions(-)
> =

>  =

[...]
>  	syscall_exit_to_user_mode(regs);
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -18,7 +18,8 @@ notrace long system_call_exception(struc
>  	long ret;
>  	syscall_fn f;
>  =

> -	r0 =3D syscall_enter_from_user_mode_randomize_stack(regs, r0);
> +	if (unlikely(!syscall_enter_from_user_mode_randomize_stack(regs, &r0))
Missing one closing ')'.

> +		return syscall_get_error(current, regs);
>  =

>  	if (unlikely(r0 >=3D NR_syscalls)) {
>  		if (unlikely(trap_is_unsupported_scv(regs))) {

Apart from this.


Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
