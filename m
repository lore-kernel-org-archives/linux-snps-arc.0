Return-Path: <SRS0=vxQV=4A=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225BEC35242
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Feb 2020 00:14:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6080206D6
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Feb 2020 00:14:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="egqQyPb+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nw/otqeI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6080206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sASlD9PaIG4v132gNKI3FzKiWT7UwAwqH9w72iTI2h0=; b=egqQyPb+GvcrcK
	VzAHXO9qo5o41v0E6JdYYtf5oMcNy6+cQf7xLd5A6EUv+6GGR72L6co8I8ONaeT1A5tZLTyXlUvII
	Rzj1nEJUxY1c6lCXko53+iI9YqBieDwUX6fXWdxM3a2Ft9vwmDIAkJOU293p2FnjePJ1oVkIZn29P
	x2iE4USC9I4/4iHKZXAc5BHwwzY6Iep3Woru/zVTxefOFTU/Y9EqpDIz5QtKl8I20p13SELdL/BRF
	JyJMun+vx/kOgHy+aNZUlF2VFU441vQAeHrQeAYeeNmuW09Mft89GhBjOM/9DzhwXT5fiFpfZYeZj
	ZYAqI5YV5nsCfyaAmLXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1ffR-0006an-B2; Wed, 12 Feb 2020 00:14:13 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1ffO-0006aS-6d
 for linux-snps-arc@lists.infradead.org; Wed, 12 Feb 2020 00:14:12 +0000
Received: by mail-pg1-x543.google.com with SMTP id g3so102570pgs.11
 for <linux-snps-arc@lists.infradead.org>; Tue, 11 Feb 2020 16:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=phOZ0dHBAk0O660KX2k0KAvW3w0rXiJu308FmUe8KE4=;
 b=nw/otqeI2Ip7wHoZ7KuCpAnFGTNRLMwKIUzG/2xv05qm2GBNz/W/hRjhAXzfW84LTh
 /S5/7q/W9CyPiD3YLSZBijN4L5n7r4llRR/KjU/iaACbX84OjKLTYQ4xRGE7DvBO/Gpz
 7d+nxB+/xUlBumWbkcSlVJarBB7R5c79uT/kUoBe98C8TgUrBpUlgZsJJ4ObWHDv8EbJ
 l7iwp34g8hVlpcZFXCTQYMAX/8iXpRo1oY1tevYCLBatNZ+iYHOm5RxdcO2CAovibG10
 8NRCh9WrxIL7WT5Ho8i/YcKngD3GRO+BsqZwhUBbDHIt5UQ3kyPGC9oPzJICP/lv2sZ6
 jpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=phOZ0dHBAk0O660KX2k0KAvW3w0rXiJu308FmUe8KE4=;
 b=g1rOqyZh/1t+L17zWKrUD4HdWu4OSpAVFyt+Fyu//dXtE+bi6976cFNeDSEV76F3qC
 uoek17MOT9lzRdevzQTdg0+yKDOEw3A7Kf2FhGlkUJL4DiHBLq/shtTUQv41gO9x9WBR
 nli4WC09neLqhC0JQYSR56t2MqKrr7D9GjEMXpozgXd2ASZvA0B52/T5pohC0ZOOVHtL
 +r45eAAt9Cyo/0RJmUSEbDv9yViy5IdzJZoT7/1zc7Y9UpLLtVCTMVFq54qAVKw9xezR
 J5SX6LJwcXBsFJYGylBywAoPUzRzd6dUZOVmsc3Sk8NFSaC4nRw27ncpvLZB+rL7mJcW
 qzyg==
X-Gm-Message-State: APjAAAWDZlFFWTXc/DZqQrzFK1C1D1nKc2XBFTdlghmQhPd5a66v2Y+t
 UKmYuc29i18wwxXqg/Ogsg+ugI2Eippttw==
X-Google-Smtp-Source: APXvYqwg+sBK6h2WD0JiOmNc98so+IiibZrHEIgMJgTzfQA+0BknYPD8BE9K10QUq+d/p7EoBiou+A==
X-Received: by 2002:a63:565b:: with SMTP id g27mr5780683pgm.309.1581466448755; 
 Tue, 11 Feb 2020 16:14:08 -0800 (PST)
Received: from ?IPv6:2601:641:c100:83a0:bc48:43a7:8508:65a?
 ([2601:641:c100:83a0:bc48:43a7:8508:65a])
 by smtp.gmail.com with ESMTPSA id u126sm5618800pfu.182.2020.02.11.16.14.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Feb 2020 16:14:08 -0800 (PST)
Subject: Re: [RFC v6 07/23] RISC-V: Use 64-bit time_t and off_t for RV32 and
 RV64
To: Alistair Francis <alistair.francis@wdc.com>, libc-alpha@sourceware.org
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
From: Vineet Gupta <vineetg76@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=vineetg76@gmail.com; prefer-encrypt=mutual; keydata=
 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
 deE0Dvw98SWmZSNtdOPnJZ0D
Message-ID: <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
Date: Tue, 11 Feb 2020 16:14:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_161410_269583_7C2A950A 
X-CRM114-Status: GOOD (  29.65  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: fweimer@redhat.com, arnd@arndb.de, palmerdabbelt@google.com,
 zongbox@gmail.com, adhemerval.zanella@linaro.org, macro@wdc.com,
 alistair23@gmail.com, arcml <linux-snps-arc@lists.infradead.org>,
 joseph@codesourcery.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Alistair,

On 1/12/20 2:33 AM, Alistair Francis wrote:
> Using the original glibc headers under bits/ let's make small
> modifications to use 64-bit time_t and off_t for both RV32 and RV64.
> 
> For the typesizes.h, here are justifications for the changes from the
> generic version (based on Arnd's very helpful feedback):
> -  All the !__USE_FILE_OFFSET64  types (__off_t, __ino_t, __rlim_t, ...) are
>   changed to match the 64-bit replacements.
> 
> - __time_t is defined to 64 bit, but no __time64_t is added. This makes sense
>   as we don't have the time64 support for other 32-bit architectures yet, and
>   it will be easy to change when that happens.
> 
> - __suseconds_t is 64-bit. This matches what we use the kerne ABI for the
>   few drivers that are relying on 'struct timeval' input arguments in
>   ioctl, as well as the adjtimex system call. It means that timeval has to
>   be defined without the   padding, unlike timespec, which needs padding.
> ---
>  .../unix/sysv/linux/riscv/bits/environments.h | 85 ++++++++++++++++++
>  sysdeps/unix/sysv/linux/riscv/bits/time64.h   | 36 ++++++++
>  sysdeps/unix/sysv/linux/riscv/bits/timesize.h | 22 +++++
>  .../unix/sysv/linux/riscv/bits/typesizes.h    | 90 +++++++++++++++++++
>  sysdeps/unix/sysv/linux/riscv/kernel_stat.h   | 23 +++++
>  5 files changed, 256 insertions(+)
>  create mode 100644 sysdeps/unix/sysv/linux/riscv/bits/environments.h
>  create mode 100644 sysdeps/unix/sysv/linux/riscv/bits/time64.h
>  create mode 100644 sysdeps/unix/sysv/linux/riscv/bits/timesize.h
>  create mode 100644 sysdeps/unix/sysv/linux/riscv/bits/typesizes.h
>  create mode 100644 sysdeps/unix/sysv/linux/riscv/kernel_stat.h
> 
> diff --git a/sysdeps/unix/sysv/linux/riscv/bits/environments.h b/sysdeps/unix/sysv/linux/riscv/bits/environments.h
> new file mode 100644
> index 0000000000..8d401d1976
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/riscv/bits/environments.h
> @@ -0,0 +1,85 @@
> +/* Copyright (C) 1999-2020 Free Software Foundation, Inc.
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
> +   <http://www.gnu.org/licenses/>.  */
> +
> +#ifndef _UNISTD_H
> +# error "Never include this file directly.  Use <unistd.h> instead"
> +#endif
> +
> +#include <bits/wordsize.h>
> +
> +/* This header should define the following symbols under the described
> +   situations.  A value `1' means that the model is always supported,
> +   `-1' means it is never supported.  Undefined means it cannot be
> +   statically decided.
> +
> +   _POSIX_V7_ILP32_OFF32   32bit int, long, pointers, and off_t type
> +   _POSIX_V7_ILP32_OFFBIG  32bit int, long, and pointers and larger off_t type
> +
> +   _POSIX_V7_LP64_OFF32	   64bit long and pointers and 32bit off_t type
> +   _POSIX_V7_LPBIG_OFFBIG  64bit long and pointers and large off_t type
> +
> +   The macros _POSIX_V6_ILP32_OFF32, _POSIX_V6_ILP32_OFFBIG,
> +   _POSIX_V6_LP64_OFF32, _POSIX_V6_LPBIG_OFFBIG, _XBS5_ILP32_OFF32,
> +   _XBS5_ILP32_OFFBIG, _XBS5_LP64_OFF32, and _XBS5_LPBIG_OFFBIG were
> +   used in previous versions of the Unix standard and are available
> +   only for compatibility.
> +*/
> +
> +#if __WORDSIZE == 64
> +
> +/* We can never provide environments with 32-bit wide pointers.  */
> +# define _POSIX_V7_ILP32_OFF32	-1
> +# define _POSIX_V7_ILP32_OFFBIG	-1
> +# define _POSIX_V6_ILP32_OFF32	-1
> +# define _POSIX_V6_ILP32_OFFBIG	-1
> +# define _XBS5_ILP32_OFF32	-1
> +# define _XBS5_ILP32_OFFBIG	-1
> +/* We also have no use (for now) for an environment with bigger pointers
> +   and offsets.  */
> +# define _POSIX_V7_LPBIG_OFFBIG	-1
> +# define _POSIX_V6_LPBIG_OFFBIG	-1
> +# define _XBS5_LPBIG_OFFBIG	-1
> +
> +/* By default we have 64-bit wide `long int', pointers and `off_t'.  */
> +# define _POSIX_V7_LP64_OFF64	1
> +# define _POSIX_V6_LP64_OFF64	1
> +# define _XBS5_LP64_OFF64	1
> +
> +#else /* __WORDSIZE == 32 */
> +
> +/* RISC-V requires 64-bit off_t
> +  # undef _POSIX_V7_ILP32_OFF32
> +  # undef _POSIX_V6_ILP32_OFF32
> +  # undef _XBS5_ILP32_OFF32
> + */
> +
> +# define _POSIX_V7_ILP32_OFFBIG  1
> +# define _POSIX_V6_ILP32_OFFBIG  1
> +# define _XBS5_ILP32_OFFBIG   1
> +
> +/* We can never provide environments with 64-bit wide pointers.  */
> +# define _POSIX_V7_LP64_OFF64	-1
> +# define _POSIX_V7_LPBIG_OFFBIG	-1
> +# define _POSIX_V6_LP64_OFF64	-1
> +# define _POSIX_V6_LPBIG_OFFBIG	-1
> +# define _XBS5_LP64_OFF64	-1
> +# define _XBS5_LPBIG_OFFBIG	-1
> +
> +/* CFLAGS.  */
> +#define __ILP32_OFFBIG_CFLAGS   "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
> +
> +#endif /* __WORDSIZE == 32 */
> diff --git a/sysdeps/unix/sysv/linux/riscv/bits/time64.h b/sysdeps/unix/sysv/linux/riscv/bits/time64.h
> new file mode 100644
> index 0000000000..cc21b45ef1
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/riscv/bits/time64.h
> @@ -0,0 +1,36 @@
> +/* bits/time64.h -- underlying types for __time64_t.  Generic version.
> +   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
> +   <http://www.gnu.org/licenses/>.  */
> +
> +#ifndef _BITS_TYPES_H
> +# error "Never include <bits/time64.h> directly; use <sys/types.h> instead."
> +#endif
> +
> +#ifndef	_BITS_TIME64_H
> +#define	_BITS_TIME64_H	1
> +
> +/* Define __TIME64_T_TYPE so that it is always a 64-bit type.  */
> +
> +#if __WORDSIZE == 64
> +/* If we already have 64-bit time type then use it.  */
> +# define __TIME64_T_TYPE		__TIME_T_TYPE
> +#else
> +/* Define a 64-bit time type alongsize the 32-bit one.  */
> +# define __TIME64_T_TYPE		__SQUAD_TYPE
> +#endif
> +
> +#endif /* bits/time64.h */
> diff --git a/sysdeps/unix/sysv/linux/riscv/bits/timesize.h b/sysdeps/unix/sysv/linux/riscv/bits/timesize.h
> new file mode 100644
> index 0000000000..afb5d86b2b
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/riscv/bits/timesize.h
> @@ -0,0 +1,22 @@
> +/* Bit size of the time_t type at glibc build time, general case.
> +   Copyright (C) 2018-2020 Free Software Foundation, Inc.
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
> +   <http://www.gnu.org/licenses/>.  */
> +
> +#include <bits/wordsize.h>
> +
> +/* RV32 and RV64 both use 64-bit time_t */
> +#define __TIMESIZE	64
> diff --git a/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h b/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h
> new file mode 100644
> index 0000000000..0da3bdeb5d
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h

I was hoping newer arches could simply use the asm-generic one ?

> +/* Tell the libc code that off_t and off64_t are actually the same type
> +   for all ABI purposes, even if possibly expressed as different base types
> +   for C type-checking purposes.  */
> +# define __OFF_T_MATCHES_OFF64_T 1

This is orthogonal to time_t but since we are on topic of newer ports, how are you
doing this. The asm-generic uapi defines

	typedef __kernel_long_t	__kernel_off_t;

and types.h defines

	typedef __kernel_off_t off_t;

And I presume long on RV32 is 32-bits

> +
> +/* Same for ino_t and ino64_t.  */
> +# define __INO_T_MATCHES_INO64_T 1



> +
> +/* And for rlim_t and rlim64_t.  */
> +# define __RLIM_T_MATCHES_RLIM64_T  1
> +
> +/* And for fsblkcnt_t and fsfilcnt_t */
> +# define __STATFS_MATCHES_STATFS64 1
> +
> +/* And for fsblkcnt_t, fsblkcnt64_t, fsfilcnt_t and fsfilcnt64_t.  */
> +# define __STATFS_MATCHES_STATFS64  1
> +
> +/* Define these as RV32 requires 64-bit syscall. */
> +#if __riscv_xlen == 32
> +#define __ASSUME_TIME64_SYSCALLS 1

From the POV of newer arches needing 64-bit time_t support, this need not be
forced as it is set automatically for kernel >= 5.1

> +#define __ASSUME_RLIM64_SYSCALLS 1

Is this used anywhere ?

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
