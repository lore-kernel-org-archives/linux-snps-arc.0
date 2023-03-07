Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB03C678D4
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Mar 2023 12:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9j84ZUJZ2P1CHgH5eGiNhXeteu7AW2LfkmsE9yuxkno=; b=xzezVxKCr9Q2kE
	zb/OKmt9GdZS1WVhxyyxaXCCWOqbH+cGmSNuvBX2pgtdCxtJNxi+aZcAEjnVjal9myswQHFR7x48u
	B0NE5/89eSkhuzVdlAIvUaXRCLTyDPkJXmm7YbJRe2hywA358w/hCjOV9Idj/Oh5NuSqkpSkva1rX
	02B3nRgL4HwpiKe4/Hegy+7C/PgPmv5HxR7X27qu3oNeqhnhDDGIa0Ot4350Xj0n9xB0vh59aFA5H
	xeqgsOyavthdR/VzFE9QA9aFPn/DQ1CFY88K+mALZ/wl78sY60JXfgGz66AcrPVFtSh0Qlee3fdb8
	9SGyF/WTG401AOIaXEcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZW4K-0001an-Bl; Tue, 07 Mar 2023 12:05:24 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZW1s-00005h-FM
	for linux-snps-arc@lists.infradead.org; Tue, 07 Mar 2023 12:02:54 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-176b48a9a05so7345302fac.0
        for <linux-snps-arc@lists.infradead.org>; Tue, 07 Mar 2023 04:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678190570;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nOIgyyMilpMr2HxzcQG27ANNNLYBfPJJDEbqluVsU8A=;
        b=tgX4EO2ZWuqmjIkpjqGHWMV5f6yUAuCbinVKEiTSnkbfsBsrPugqYeg1aYOtvId2nl
         2ekTyU2oL81nxwSw6yKSBw0cYa2fqjxYSye59WOLItYvhjqffJZ96dmGQ2yAYx7gt1Ja
         9kGNsLLrlBA4f0RKjjJQSSMh8cxellq1U5hlg7RMq2vlvqkgXHHl3n0UsV4Yz98mF1l7
         D2b0vp8wH30CzinwpJI1nLX6TuFftUyWd+hXmzwgqjx1tctmycW0dyf2UzjVLxHIS1dz
         FIfd7+2BGoV7zN3vPo7/sf7KP/1iBGLWwsbeR8DpvcitTonmOKUQX+Qhmf3FzrPFWHNo
         3f3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678190570;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nOIgyyMilpMr2HxzcQG27ANNNLYBfPJJDEbqluVsU8A=;
        b=rHfrZ2TMhW7T0lUTsGO6TxFqfFZB/coxl7cdeuQqawHcvNFAfnfvWdlI1rLQ+ArCL5
         BWF53ul2uInSsp/Zk2SiLE8YXXbaB7Zv9kYNCb0NLmXl4XEOSQuSIJJZAqR/BpS6IjWu
         7ahMVX78YJ1K4/BX6SNiseUdGXedHJ4CQNF7VW+U6Xc1LRmSdPeDUO4wUMMHe3UbJmfE
         a/NUkDD71XKhcg1TmQ4ueXV52NAZWopfD7njnXP+LdNJx7vChNzmwmjRVRpT3ccegkJQ
         m5SKnBIpBl84uT2qCfftH06YVswKltRhlgvWTZo0K9SBjKEotvomO3pRSRgyNkLwtyGz
         HQvg==
X-Gm-Message-State: AO0yUKUVI1/J+7z9rZhPE5WvBwnrt751sdqWLAkKIZldqww6ldd7/ik/
	iKjIpPYvQ9fnWAJ0mmE4FueD9A==
X-Google-Smtp-Source: AK7set/M+wq3CEHl9scJgHtIddrg0//te1F0XVoR/AwG5KF/BqwNwOyzE0p6uOYtmFaHIB4FFdL0YQ==
X-Received: by 2002:a05:6870:88a8:b0:172:2c74:b99d with SMTP id m40-20020a05687088a800b001722c74b99dmr8123951oam.50.1678190570012;
        Tue, 07 Mar 2023 04:02:50 -0800 (PST)
Received: from ?IPV6:2804:1b3:a7c3:d849:85a1:d2e8:5a25:72e7? ([2804:1b3:a7c3:d849:85a1:d2e8:5a25:72e7])
        by smtp.gmail.com with ESMTPSA id yy31-20020a056871259f00b00172426ebe58sm4982862oab.27.2023.03.07.04.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 04:02:49 -0800 (PST)
Message-ID: <35a05f5c-3de9-7fbd-e66d-b8cacbe69b99@linaro.org>
Date: Tue, 7 Mar 2023 09:02:47 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] ARC: Add the clone3 wrapper
Content-Language: en-US
To: Pavel.Kozlov@synopsys.com, libc-alpha@sourceware.org
Cc: linux-snps-arc@lists.infradead.org
References: <20230302161019.27192-1-kozlov@synopsys.com>
From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
Organization: Linaro
In-Reply-To: <20230302161019.27192-1-kozlov@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_040252_657302_CA610335 
X-CRM114-Status: GOOD (  25.03  )
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



On 02/03/23 13:10, Pavel Kozlov via Libc-alpha wrote:
> From: Pavel Kozlov <pavel.kozlov@synopsys.com>
> 
> Use the clone3 wrapper on ARC. It doesn't care about stack alignment.
> All callers should provide an aligned stack.
> It follows the internal signature:
> 
> extern int clone3 (struct clone_args *__cl_args, size_t __size,
>  int (*__func) (void *__arg), void *__arg);

LGTM, thanks.

Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>

> ---
> Checked on arc-linux-gnu. Previously observed tst-misaling-clone-internal
> test fail was because I used outdated master branch.
> Full testsuite runs without regressions.
> But I also see fail of the new tst-spawn7, as already repoted at [1].
> 
> [1]
> https://sourceware.org/pipermail/libc-alpha/2023-February/145937.html
> 
>  sysdeps/unix/sysv/linux/arc/clone3.S | 90 ++++++++++++++++++++++++++++
>  sysdeps/unix/sysv/linux/arc/sysdep.h |  2 +
>  2 files changed, 92 insertions(+)
>  create mode 100644 sysdeps/unix/sysv/linux/arc/clone3.S
> 
> diff --git a/sysdeps/unix/sysv/linux/arc/clone3.S b/sysdeps/unix/sysv/linux/arc/clone3.S
> new file mode 100644
> index 000000000000..87a8272a3977
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/arc/clone3.S
> @@ -0,0 +1,90 @@
> +/* The clone3 syscall wrapper.  Linux/arc version.
> +   Copyright (C) 2023 Free Software Foundation, Inc.
> +
> +   This file is part of the GNU C Library.
> +
> +   The GNU C Library is free software; you can redistribute it and/or
> +   modify it under the terms of the GNU Lesser General Public
> +   License as published by the Free Software Foundation; either
> +   version 2.1 of the License, or (at your option) any later version.
> +
> +   The GNU C Library is distributed in the hope that it will be useful,
> +   but WITHOUT ANY WARRANTY; without even the implied warranty of
> +   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +   Lesser General Public License for more details.
> +
> +   You should have received a copy of the GNU Lesser General Public
> +   License along with the GNU C Library; if not, see
> +   <https://www.gnu.org/licenses/>.  */
> +
> +#include <sysdep.h>
> +#define _ERRNO_H	1
> +#include <bits/errno.h>
> +
> +/* The userland implementation is:
> +   int clone3 (struct clone_args *cl_args, size_t size,
> +               int (*func)(void *arg), void *arg);
> +
> +   the kernel entry is:
> +   int clone3 (struct clone_args *cl_args, size_t size);
> +
> +   The parameters are passed in registers from userland:
> +   r0: cl_args
> +   r1: size
> +   r2: func
> +   r3: arg  */
> +
> +ENTRY(__clone3)
> +
> +	/* Save args for the child.  */
> +	mov	r10, r0		/* cl_args  */
> +	mov	r11, r2		/* func	 */
> +	mov	r12, r3		/* args  */
> +
> +	/* Sanity check args.  */
> +	breq	r10, 0, L (__sys_err)	/* No NULL cl_args pointer.  */
> +	breq	r11, 0, L (__sys_err)	/* No NULL function pointer.  */
> +
> +	/* Do the system call, the kernel expects:
> +	   r8: system call number
> +	   r0: cl_args
> +	   r1: size  */
> +	mov	r0, r10
> +	mov	r8, __NR_clone3
> +	ARC_TRAP_INSN
> +
> +	cmp	r0, 0
> +	beq	thread_start_clone3	/* Child returns.  */
> +	blt	L (__sys_err2)
> +	j	[blink]			/* Parent returns.  */
> +
> +L (__sys_err):
> +	mov	r0, -EINVAL
> +L (__sys_err2):
> +	b	__syscall_error
> +PSEUDO_END (__clone3)
> +
> +
> +	.align 4
> +	.type thread_start_clone3, %function
> +thread_start_clone3:
> +	cfi_startproc
> +	/* Terminate call stack by noting ra is undefined.  */
> +	cfi_undefined (blink)
> +
> +	/* Child jumps off to @fn with @arg as argument.  */
> +	jl.d	[r11]
> +	mov	r0, r12
> +
> +	/* exit() with result from @fn (already in r0).  */
> +	mov	r8, __NR_exit
> +	ARC_TRAP_INSN
> +
> +	/* In case it ever came back.  */
> +	flag	1
> +
> +	cfi_endproc
> +	.size thread_start_clone3, .-thread_start_clone3
> +
> +libc_hidden_def (__clone3)
> +weak_alias (__clone3, clone3)
> diff --git a/sysdeps/unix/sysv/linux/arc/sysdep.h b/sysdeps/unix/sysv/linux/arc/sysdep.h
> index dd6fe73445f9..88dc1dff017f 100644
> --- a/sysdeps/unix/sysv/linux/arc/sysdep.h
> +++ b/sysdeps/unix/sysv/linux/arc/sysdep.h
> @@ -141,6 +141,8 @@ hidden_proto (__syscall_error)
>  
>  # define ARC_TRAP_INSN	"trap_s 0	\n\t"
>  
> +# define HAVE_CLONE3_WRAPPER	1
> +
>  # undef INTERNAL_SYSCALL_NCS
>  # define INTERNAL_SYSCALL_NCS(number, nr_args, args...)	\
>    ({								\

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
