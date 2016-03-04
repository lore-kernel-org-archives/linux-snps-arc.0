From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 4 Mar 2016 17:25:09 +0530
Subject: [PATCH] ARC: build: Better way to detect ISA compatible toolchain
In-Reply-To: <1456475361-7754-2-git-send-email-vgupta@synopsys.com>
References: <1456475361-7754-1-git-send-email-vgupta@synopsys.com>
 <1456475361-7754-2-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56D9779D.2040307@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Michal,

Can u please take a look at patch below !

Thx,
-Vineet

On Friday 26 February 2016 01:59 PM, Vineet Gupta wrote:
> ARC architecture has 2 instruction sets: ARCompact/ARCv2.
> While same gcc supports compiling for either (using appropriate toggles),
> we can't use the same toolchain to build kernel because libgcc needs
> to be unique and the toolchian (uClibc based) is not multilibed.
> 
> uClibc toolchain is convenient since it allows all userspace and
> kernel to be built with a single install for an ISA.
> 
> This however means 2 gnu installs (with same triplet prefix) are needed
> for building for 2 ISA and need to be in PATH.
> As developers we keep switching the builds, but would occassionally fail
> to update the PATH leading to usage of wrong tools. And this would only
> show up at the end of kernel build when linking incompatible libgcc.
> 
> So the initial solution was to have gcc define a special preprocessor macro
> DEFAULT_CPU_xxx which is unique for default toolchain configuration.
> Claudiu proposed using grep for an existing preprocessor macro which is
> again uniquely defined per ISA.
> 
> Cc: Michal Marek <mmarek at suse.cz>
> Suggested-by: Claudiu Zissulescu <claziss at synopsys.com>
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
>  arch/arc/Makefile              | 14 ++++++++++++++
>  arch/arc/include/asm/arcregs.h |  6 ------
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> index c8230f3395f2..21682e047c00 100644
> --- a/arch/arc/Makefile
> +++ b/arch/arc/Makefile
> @@ -18,6 +18,20 @@ cflags-y	+= -fno-common -pipe -fno-builtin -D__linux__
>  cflags-$(CONFIG_ISA_ARCOMPACT)	+= -mA7
>  cflags-$(CONFIG_ISA_ARCV2)	+= -mcpu=archs
>  
> +is_700 = $(shell $(CC) -dM -E - < /dev/null | grep -q "ARC700" && echo 1 || echo 0)
> +
> +ifdef CONFIG_ISA_ARCOMPACT
> +ifeq ($(is_700), 0)
> +    $(error Toolchain not configured for ARCompact builds)
> +endif
> +endif
> +
> +ifdef CONFIG_ISA_ARCV2
> +ifeq ($(is_700), 1)
> +    $(error Toolchain not configured for ARCv2 builds)
> +endif
> +endif
> +
>  ifdef CONFIG_ARC_CURR_IN_REG
>  # For a global register defintion, make sure it gets passed to every file
>  # We had a customer reported bug where some code built in kernel was NOT using
> diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
> index f9f4c6f59fdb..7fbaea00a336 100644
> --- a/arch/arc/include/asm/arcregs.h
> +++ b/arch/arc/include/asm/arcregs.h
> @@ -381,12 +381,6 @@ static inline int is_isa_arcompact(void)
>  	return IS_ENABLED(CONFIG_ISA_ARCOMPACT);
>  }
>  
> -#if defined(CONFIG_ISA_ARCOMPACT) && !defined(_CPU_DEFAULT_A7)
> -#error "Toolchain not configured for ARCompact builds"
> -#elif defined(CONFIG_ISA_ARCV2) && !defined(_CPU_DEFAULT_HS)
> -#error "Toolchain not configured for ARCv2 builds"
> -#endif
> -
>  #endif /* __ASEMBLY__ */
>  
>  #endif /* _ASM_ARC_ARCREGS_H */
> 
