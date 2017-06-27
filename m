From: joseph@codesourcery.com (Joseph Myers)
Date: Tue, 27 Jun 2017 11:56:37 +0000
Subject: [RFC 4/6] ARC: Initial port to glibc
In-Reply-To: <1498550454-3560-5-git-send-email-vgupta@synopsys.com>
References: <1498550454-3560-1-git-send-email-vgupta@synopsys.com>
 <1498550454-3560-5-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.20.1706271147470.17677@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, 27 Jun 2017, Vineet Gupta wrote:

> Signed-off-by: Cupertino Miranda <cmiranda at synopsys.com>
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>

We need ChangeLog entries and copyright assignments, but don't use 
Signed-off-by.

> diff --git a/.gitignore b/.gitignore
> index 07d4a129e5dc..969dabc873d6 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -6,6 +6,7 @@
>  *.bz2
>  *.rej
>  *.orig
> +*.sw*
>  =*
>  TAGS
>  TODO

I don't think this belongs here.  If it does you'll need to explain 
further.

> diff --git a/sysdeps/arc/Makefile b/sysdeps/arc/Makefile
> new file mode 100644
> index 000000000000..b43ae0d0dedf
> --- /dev/null
> +++ b/sysdeps/arc/Makefile
> @@ -0,0 +1,26 @@
> +# Copyright (C) 1993-2015 Free Software Foundation, Inc.

All new files should have a descriptive comment before the copyright 
notice.  All copyright notices should use <year>-2017 as dates.

> diff --git a/sysdeps/arc/Versions b/sysdeps/arc/Versions
> new file mode 100644
> index 000000000000..54ac5e7d1b5f
> --- /dev/null
> +++ b/sysdeps/arc/Versions
> @@ -0,0 +1,13 @@
> +libc {
> +  GLIBC_2.24 {

As a new port, of course use GLIBC_2.26 for minimum symbol version (or 
GLIBC_2.27 if that's when it gets in, etc.), and so for any port-specific 
symbols.

> diff --git a/sysdeps/unix/sysv/linux/arc/Versions b/sysdeps/unix/sysv/linux/arc/Versions
> new file mode 100644
> index 000000000000..e42c85f57594
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/arc/Versions
> @@ -0,0 +1,6 @@
> +libc {
> +  GLIBC_2.21 {
> +    _flush_cache;
> +    cacheflush;
> +  }

Same comment on symbol versions applies.

> +#define __ASSUME_ACCEPT4_SYSCALL        1
> +#define __ASSUME_RECVMMSG_SYSCALL       1
> +#define __ASSUME_SENDMMSG_SYSCALL       1

This is the default, so you shouldn't need your kernel-features.h file.

> diff --git a/sysdeps/unix/sysv/linux/arc/ld.abilist b/sysdeps/unix/sysv/linux/arc/ld.abilist
> new file mode 100644
> index 000000000000..6001f2e98402
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/arc/ld.abilist
> @@ -0,0 +1,12 @@
> +GLIBC_2.24
> + GLIBC_2.24 A
> + __libc_memalign F
> + __libc_stack_end D 0x4
> + __stack_chk_guard D 0x4
> + __tls_get_addr F
> + _dl_mcount F
> + _r_debug D 0x14
> + calloc F
> + free F
> + malloc F
> + realloc F

These ABI lists are in the old format.  You need to regenerate them anyway 
for the increased minimum symbol version.

> diff --git a/sysdeps/unix/sysv/linux/arc/shlib-versions b/sysdeps/unix/sysv/linux/arc/shlib-versions
> new file mode 100644
> index 000000000000..c4d5d029812d
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/arc/shlib-versions
> @@ -0,0 +1,2 @@
> +DEFAULT                 GLIBC_2.21
> +ld=ld-linux.so.2

Should be 2.26 (or later).  Consider using an architecture-specific 
dynamic linker name as various other architectures do.

> diff --git a/sysdeps/unix/sysv/linux/arc/sys/ucontext.h b/sysdeps/unix/sysv/linux/arc/sys/ucontext.h
> new file mode 100644
> index 000000000000..37f7f9224853
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/arc/sys/ucontext.h
> @@ -0,0 +1,40 @@
> +/* struct ucontext definition, ARC version.
> +   Copyright (C) 2015 Free Software Foundation, Inc.
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
> +/* System V/ARC ABI compliant context switching support.  */
> +
> +#ifndef _SYS_UCONTEXT_H
> +#define _SYS_UCONTEXT_H	1
> +
> +#include <features.h>
> +#include <signal.h>
> +#include <bits/sigcontext.h>

I'd expect includes of bits/types/sigset_t.h and bits/types/stack_t.h like 
other versions, but not of signal.h.

> +typedef struct sigcontext mcontext_t;

You can avoid this problematic definition for a new architecture, even 
while we're still discussing eliminating it for existing architectures.

> +/* Userlevel context.  */
> +typedef struct ucontext
> +  {
> +    unsigned long uc_flags;
> +    struct ucontext *uc_link;

This is now struct ucontext_t.

-- 
Joseph S. Myers
joseph at codesourcery.com
