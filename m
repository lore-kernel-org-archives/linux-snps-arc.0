From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 25 Jul 2018 11:54:38 -0700
Subject: [PATCH] Fix the ld flags not be applied to tst-execstack-mod.so
In-Reply-To: <1532081682-25895-1-git-send-email-zong@andestech.com>
References: <1532081682-25895-1-git-send-email-zong@andestech.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <469dcf75-d652-62ee-8310-ea59ec878a0a@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 07/20/2018 03:14 AM, Zong Li wrote:
> The Makefile variable name loses the file extension (.so). It causes
> the linker option not applies to the corresponding file that it's
> file name matchs with the variable without LDFLAGS- prefix.

Hi,

Chiming in as I'm looking into these things myself in context of testing for ARC
port submission. Do we really need to fix this part - in this way. I'd vote to not
force the execstack through linker and rely on gcc generating this itself when it
knows it doing something for trampolines. And only if target gcc doesn't support
it (detected via configure test) should this be done.

-Vineet

> 
> 	* elf/Makefile (LDFLAGS-tst-execstack-mod): Change variable name by
> 	adding the file extension (.so).
> ---
>  ChangeLog    | 5 +++++
>  elf/Makefile | 2 +-
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/ChangeLog b/ChangeLog
> index b45c83b..f87b32c 100644
> --- a/ChangeLog
> +++ b/ChangeLog
> @@ -1,3 +1,8 @@
> +2018-07-20  Zong Li  <zong at andestech.com>
> +
> +	* elf/Makefile (LDFLAGS-tst-execstack-mod): Change variable name by
> +	adding the file extension (.so).
> +
>  2018-07-20  Samuel Thibault  <samuel.thibault at ens-lyon.org>
>  
>  	* sysdeps/mach/hurd/i386/tls.h (_hurd_tls_init): Set multiple_threads
> diff --git a/elf/Makefile b/elf/Makefile
> index cd07713..ecc8ea2 100644
> --- a/elf/Makefile
> +++ b/elf/Makefile
> @@ -1004,7 +1004,7 @@ $(objpfx)tst-execstack: $(libdl)
>  $(objpfx)tst-execstack.out: $(objpfx)tst-execstack-mod.so
>  CPPFLAGS-tst-execstack.c += -DUSE_PTHREADS=0
>  LDFLAGS-tst-execstack = -Wl,-z,noexecstack
> -LDFLAGS-tst-execstack-mod = -Wl,-z,execstack
> +LDFLAGS-tst-execstack-mod.so = -Wl,-z,execstack
>  
>  $(objpfx)tst-execstack-needed: $(objpfx)tst-execstack-mod.so
>  LDFLAGS-tst-execstack-needed = -Wl,-z,noexecstack
> 
