Return-Path: <SRS0=vxQV=4A=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E7E2C35242
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Feb 2020 00:22:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D799206CC
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Feb 2020 00:22:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q4VRYaDj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iuqq4iTr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D799206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rc4ExN6pNPgdBZ1fv9bP9jkMJpmQmkrZdX1jY7x0TUg=; b=Q4VRYaDj6i9aKV
	nTqqVSHAI9AONeOzvS2YEsQ5f4AwRU8Niq7Ds996F39J3n7xqdF5zjeEJsVLp/fJmd+CuvGq6MLX4
	I1pdKa+bZP1LJ6AnnW1xcMnY1P3qrjXDZoETYJyMn8LpAwJOFJ+kvAzVarLezJy0E6vQoH1Kcjd4q
	JpLiQOofHR2+4wB4dwMiNgCmQbUIb7TQIvPkcT+xsre2mYmafnVNoig88hLM1MFlTFKYdOev9hjDN
	eoYsHdRYMZN1R3WbiPj9ceicF4JqEAILUpRy+yjeXvkqflcfS0WtA4ObSUmlp0F87+vvDipUEpHnq
	zfpbv35lT24rx1h3XHUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j1fn7-0001cA-CM; Wed, 12 Feb 2020 00:22:09 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1fn3-0001bj-Jj
 for linux-snps-arc@lists.infradead.org; Wed, 12 Feb 2020 00:22:07 +0000
Received: by mail-lj1-x243.google.com with SMTP id q8so207087ljj.11
 for <linux-snps-arc@lists.infradead.org>; Tue, 11 Feb 2020 16:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BfjqlVTknv6PWSaohRmofMzl4UrL0fhN2EL7JRT5uVk=;
 b=Iuqq4iTr2S1oDcKuYjg/zcZdBUDJiDuYMmf3fcZKZowmVhFVlyGDx3jZMsxDyLFmi3
 MhFf77XyE3Co113r53E/PujtQQogGFnL/cKI7hOWVdoFElhJprHGFwu2tC/0vy8nUCDm
 VSagb+nZnIfXgQx64sAN4qulBwyGIS5K/7WRhaIBZhVs9v5QX4gje8JU7tNVc4SbLE5o
 9NItzfkPsDB8LAyWJcrfSbw8XziHe8lDDvkJuoxDvMO4fvQ8znFKeLjtuG89rNSm0/1o
 w2iUDyDVahu32gS5+H2YBA9JXlfPGwcOYAyyCnkQ+gO3pw10jiDTON0YP1aw7N21e9Kr
 ChSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BfjqlVTknv6PWSaohRmofMzl4UrL0fhN2EL7JRT5uVk=;
 b=PVNI5k+YqeovZO0P4zf+b7NQ146hca4gWf9GdKs/m3vbevLba0SBvNMKwO1TRLetao
 rPKW4mTj7HqDSXN4kCqIyYhVuoT/47fA5PJr3SB4bIzY8m1Eez+zoeTtpGebJVTIvadb
 A6crQaYJ7YCcY/VcRli2jyhKziYsA5NrYqzSlXa0AH8fx/zsyonANX3eOF8ApvsoOPX1
 78wkw8ffcNYL66dAmG7kLCdTLGr0Q8BxpANGMaWABBhEtk4cwAGaipRYFFpS8NtlQNGw
 8gYJFrG0IQKO14VY/R3WOOpfqSXCz4yMT96D2a5Gr6znE5d3qJVZHBMWUFwtpY2YxLem
 RH3Q==
X-Gm-Message-State: APjAAAVckgyGvW06nlafxo5FUgSVYk6sECs2AvXqmUNUtETPLtDwZ2EY
 LoHrQzOzL9BAlzOuwRaCejj/pbbdaIPr+6cMTNI=
X-Google-Smtp-Source: APXvYqwPQ16DDTi3bjSeC05gCwEk/0SfD2iih+ewLQga7wT365e3pQJgOz3MW5aOrkOCiseDsaRhJFv58UggWdE05/g=
X-Received: by 2002:a2e:8119:: with SMTP id d25mr6017340ljg.76.1581466923430; 
 Tue, 11 Feb 2020 16:22:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578824547.git.alistair.francis@wdc.com>
 <4e95f95966d8d7c6a8339160dc62d81c1f6a1bfb.1578824547.git.alistair.francis@wdc.com>
 <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
In-Reply-To: <00574bfb-981a-3a1c-cbdf-b2fee4eddc32@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 11 Feb 2020 16:14:49 -0800
Message-ID: <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
Subject: Re: [RFC v6 07/23] RISC-V: Use 64-bit time_t and off_t for RV32 and
 RV64
To: Vineet Gupta <vineetg76@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200211_162205_678218_BB2FB333 
X-CRM114-Status: GOOD (  33.59  )
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
Cc: Florian Weimer <fweimer@redhat.com>,
 GNU C Library <libc-alpha@sourceware.org>, Arnd Bergmann <arnd@arndb.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Zong Li <zongbox@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "Maciej W. Rozycki" <macro@wdc.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Joseph Myers <joseph@codesourcery.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Feb 11, 2020 at 4:14 PM Vineet Gupta <vineetg76@gmail.com> wrote:
>
> Hi Alistair,

Hi Vineet,

>
> On 1/12/20 2:33 AM, Alistair Francis wrote:
> > Using the original glibc headers under bits/ let's make small
> > modifications to use 64-bit time_t and off_t for both RV32 and RV64.
> >
> > For the typesizes.h, here are justifications for the changes from the
> > generic version (based on Arnd's very helpful feedback):
> > -  All the !__USE_FILE_OFFSET64  types (__off_t, __ino_t, __rlim_t, ...) are
> >   changed to match the 64-bit replacements.
> >
> > - __time_t is defined to 64 bit, but no __time64_t is added. This makes sense
> >   as we don't have the time64 support for other 32-bit architectures yet, and
> >   it will be easy to change when that happens.
> >
> > - __suseconds_t is 64-bit. This matches what we use the kerne ABI for the
> >   few drivers that are relying on 'struct timeval' input arguments in
> >   ioctl, as well as the adjtimex system call. It means that timeval has to
> >   be defined without the   padding, unlike timespec, which needs padding.
> > ---
> >  .../unix/sysv/linux/riscv/bits/environments.h | 85 ++++++++++++++++++
> >  sysdeps/unix/sysv/linux/riscv/bits/time64.h   | 36 ++++++++
> >  sysdeps/unix/sysv/linux/riscv/bits/timesize.h | 22 +++++
> >  .../unix/sysv/linux/riscv/bits/typesizes.h    | 90 +++++++++++++++++++
> >  sysdeps/unix/sysv/linux/riscv/kernel_stat.h   | 23 +++++
> >  5 files changed, 256 insertions(+)
> >  create mode 100644 sysdeps/unix/sysv/linux/riscv/bits/environments.h
> >  create mode 100644 sysdeps/unix/sysv/linux/riscv/bits/time64.h
> >  create mode 100644 sysdeps/unix/sysv/linux/riscv/bits/timesize.h
> >  create mode 100644 sysdeps/unix/sysv/linux/riscv/bits/typesizes.h
> >  create mode 100644 sysdeps/unix/sysv/linux/riscv/kernel_stat.h
> >
> > diff --git a/sysdeps/unix/sysv/linux/riscv/bits/environments.h b/sysdeps/unix/sysv/linux/riscv/bits/environments.h
> > new file mode 100644
> > index 0000000000..8d401d1976
> > --- /dev/null
> > +++ b/sysdeps/unix/sysv/linux/riscv/bits/environments.h
> > @@ -0,0 +1,85 @@
> > +/* Copyright (C) 1999-2020 Free Software Foundation, Inc.
> > +   This file is part of the GNU C Library.
> > +
> > +   The GNU C Library is free software; you can redistribute it and/or
> > +   modify it under the terms of the GNU Lesser General Public
> > +   License as published by the Free Software Foundation; either
> > +   version 2.1 of the License, or (at your option) any later version.
> > +
> > +   The GNU C Library is distributed in the hope that it will be useful,
> > +   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > +   Lesser General Public License for more details.
> > +
> > +   You should have received a copy of the GNU Lesser General Public
> > +   License along with the GNU C Library; if not, see
> > +   <http://www.gnu.org/licenses/>.  */
> > +
> > +#ifndef _UNISTD_H
> > +# error "Never include this file directly.  Use <unistd.h> instead"
> > +#endif
> > +
> > +#include <bits/wordsize.h>
> > +
> > +/* This header should define the following symbols under the described
> > +   situations.  A value `1' means that the model is always supported,
> > +   `-1' means it is never supported.  Undefined means it cannot be
> > +   statically decided.
> > +
> > +   _POSIX_V7_ILP32_OFF32   32bit int, long, pointers, and off_t type
> > +   _POSIX_V7_ILP32_OFFBIG  32bit int, long, and pointers and larger off_t type
> > +
> > +   _POSIX_V7_LP64_OFF32         64bit long and pointers and 32bit off_t type
> > +   _POSIX_V7_LPBIG_OFFBIG  64bit long and pointers and large off_t type
> > +
> > +   The macros _POSIX_V6_ILP32_OFF32, _POSIX_V6_ILP32_OFFBIG,
> > +   _POSIX_V6_LP64_OFF32, _POSIX_V6_LPBIG_OFFBIG, _XBS5_ILP32_OFF32,
> > +   _XBS5_ILP32_OFFBIG, _XBS5_LP64_OFF32, and _XBS5_LPBIG_OFFBIG were
> > +   used in previous versions of the Unix standard and are available
> > +   only for compatibility.
> > +*/
> > +
> > +#if __WORDSIZE == 64
> > +
> > +/* We can never provide environments with 32-bit wide pointers.  */
> > +# define _POSIX_V7_ILP32_OFF32       -1
> > +# define _POSIX_V7_ILP32_OFFBIG      -1
> > +# define _POSIX_V6_ILP32_OFF32       -1
> > +# define _POSIX_V6_ILP32_OFFBIG      -1
> > +# define _XBS5_ILP32_OFF32   -1
> > +# define _XBS5_ILP32_OFFBIG  -1
> > +/* We also have no use (for now) for an environment with bigger pointers
> > +   and offsets.  */
> > +# define _POSIX_V7_LPBIG_OFFBIG      -1
> > +# define _POSIX_V6_LPBIG_OFFBIG      -1
> > +# define _XBS5_LPBIG_OFFBIG  -1
> > +
> > +/* By default we have 64-bit wide `long int', pointers and `off_t'.  */
> > +# define _POSIX_V7_LP64_OFF64        1
> > +# define _POSIX_V6_LP64_OFF64        1
> > +# define _XBS5_LP64_OFF64    1
> > +
> > +#else /* __WORDSIZE == 32 */
> > +
> > +/* RISC-V requires 64-bit off_t
> > +  # undef _POSIX_V7_ILP32_OFF32
> > +  # undef _POSIX_V6_ILP32_OFF32
> > +  # undef _XBS5_ILP32_OFF32
> > + */
> > +
> > +# define _POSIX_V7_ILP32_OFFBIG  1
> > +# define _POSIX_V6_ILP32_OFFBIG  1
> > +# define _XBS5_ILP32_OFFBIG   1
> > +
> > +/* We can never provide environments with 64-bit wide pointers.  */
> > +# define _POSIX_V7_LP64_OFF64        -1
> > +# define _POSIX_V7_LPBIG_OFFBIG      -1
> > +# define _POSIX_V6_LP64_OFF64        -1
> > +# define _POSIX_V6_LPBIG_OFFBIG      -1
> > +# define _XBS5_LP64_OFF64    -1
> > +# define _XBS5_LPBIG_OFFBIG  -1
> > +
> > +/* CFLAGS.  */
> > +#define __ILP32_OFFBIG_CFLAGS   "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
> > +
> > +#endif /* __WORDSIZE == 32 */
> > diff --git a/sysdeps/unix/sysv/linux/riscv/bits/time64.h b/sysdeps/unix/sysv/linux/riscv/bits/time64.h
> > new file mode 100644
> > index 0000000000..cc21b45ef1
> > --- /dev/null
> > +++ b/sysdeps/unix/sysv/linux/riscv/bits/time64.h
> > @@ -0,0 +1,36 @@
> > +/* bits/time64.h -- underlying types for __time64_t.  Generic version.
> > +   Copyright (C) 2018-2020 Free Software Foundation, Inc.
> > +   This file is part of the GNU C Library.
> > +
> > +   The GNU C Library is free software; you can redistribute it and/or
> > +   modify it under the terms of the GNU Lesser General Public
> > +   License as published by the Free Software Foundation; either
> > +   version 2.1 of the License, or (at your option) any later version.
> > +
> > +   The GNU C Library is distributed in the hope that it will be useful,
> > +   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > +   Lesser General Public License for more details.
> > +
> > +   You should have received a copy of the GNU Lesser General Public
> > +   License along with the GNU C Library; if not, see
> > +   <http://www.gnu.org/licenses/>.  */
> > +
> > +#ifndef _BITS_TYPES_H
> > +# error "Never include <bits/time64.h> directly; use <sys/types.h> instead."
> > +#endif
> > +
> > +#ifndef      _BITS_TIME64_H
> > +#define      _BITS_TIME64_H  1
> > +
> > +/* Define __TIME64_T_TYPE so that it is always a 64-bit type.  */
> > +
> > +#if __WORDSIZE == 64
> > +/* If we already have 64-bit time type then use it.  */
> > +# define __TIME64_T_TYPE             __TIME_T_TYPE
> > +#else
> > +/* Define a 64-bit time type alongsize the 32-bit one.  */
> > +# define __TIME64_T_TYPE             __SQUAD_TYPE
> > +#endif
> > +
> > +#endif /* bits/time64.h */
> > diff --git a/sysdeps/unix/sysv/linux/riscv/bits/timesize.h b/sysdeps/unix/sysv/linux/riscv/bits/timesize.h
> > new file mode 100644
> > index 0000000000..afb5d86b2b
> > --- /dev/null
> > +++ b/sysdeps/unix/sysv/linux/riscv/bits/timesize.h
> > @@ -0,0 +1,22 @@
> > +/* Bit size of the time_t type at glibc build time, general case.
> > +   Copyright (C) 2018-2020 Free Software Foundation, Inc.
> > +   This file is part of the GNU C Library.
> > +
> > +   The GNU C Library is free software; you can redistribute it and/or
> > +   modify it under the terms of the GNU Lesser General Public
> > +   License as published by the Free Software Foundation; either
> > +   version 2.1 of the License, or (at your option) any later version.
> > +
> > +   The GNU C Library is distributed in the hope that it will be useful,
> > +   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > +   Lesser General Public License for more details.
> > +
> > +   You should have received a copy of the GNU Lesser General Public
> > +   License along with the GNU C Library; if not, see
> > +   <http://www.gnu.org/licenses/>.  */
> > +
> > +#include <bits/wordsize.h>
> > +
> > +/* RV32 and RV64 both use 64-bit time_t */
> > +#define __TIMESIZE   64
> > diff --git a/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h b/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h
> > new file mode 100644
> > index 0000000000..0da3bdeb5d
> > --- /dev/null
> > +++ b/sysdeps/unix/sysv/linux/riscv/bits/typesizes.h
>
> I was hoping newer arches could simply use the asm-generic one ?

We need to specify that RV32 uses a 64-bit time_t. The generic ones
don't do that for 32-bit arches.

>
> > +/* Tell the libc code that off_t and off64_t are actually the same type
> > +   for all ABI purposes, even if possibly expressed as different base types
> > +   for C type-checking purposes.  */
> > +# define __OFF_T_MATCHES_OFF64_T 1
>
> This is orthogonal to time_t but since we are on topic of newer ports, how are you
> doing this. The asm-generic uapi defines
>
>         typedef __kernel_long_t __kernel_off_t;
>
> and types.h defines
>
>         typedef __kernel_off_t off_t;
>
> And I presume long on RV32 is 32-bits

Can you point me to the code? Last time I looked the kernel used the
64-bit versions for the syscalls on RV32.

>
> > +
> > +/* Same for ino_t and ino64_t.  */
> > +# define __INO_T_MATCHES_INO64_T 1
>
>
>
> > +
> > +/* And for rlim_t and rlim64_t.  */
> > +# define __RLIM_T_MATCHES_RLIM64_T  1
> > +
> > +/* And for fsblkcnt_t and fsfilcnt_t */
> > +# define __STATFS_MATCHES_STATFS64 1
> > +
> > +/* And for fsblkcnt_t, fsblkcnt64_t, fsfilcnt_t and fsfilcnt64_t.  */
> > +# define __STATFS_MATCHES_STATFS64  1
> > +
> > +/* Define these as RV32 requires 64-bit syscall. */
> > +#if __riscv_xlen == 32
> > +#define __ASSUME_TIME64_SYSCALLS 1
>
> From the POV of newer arches needing 64-bit time_t support, this need not be
> forced as it is set automatically for kernel >= 5.1

Ah, I think you are right about this and we don't need to define it.

>
> > +#define __ASSUME_RLIM64_SYSCALLS 1
>
> Is this used anywhere ?

Apparently not, I have removed it.

Alistair

>
> Thx,
> -Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
