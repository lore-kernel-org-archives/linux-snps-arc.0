From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 23 May 2019 12:02:01 -0700
Subject: [PATCH] ARC: Don't set CROSS_COMPILE in arch's Makefile
In-Reply-To: <20180916204757.31131-1-abrodkin@synopsys.com>
References: <20180916204757.31131-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <efe9e312-565f-ba47-135c-ad7108b1170c@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 9/16/18 1:47 PM, Alexey Brodkin wrote:
> There's not much sense in doing that because if user or
> his build-system didn't set CROSS_COMPILE we still may
> very well make incorrect guess.
> 
> But as it turned out setting CROSS_COMPILE is not as harmless
> as one may think: with recent changes that implemented automatic
> discovery of __host__ gcc features unconditional setup of
> CROSS_COMPILE leads to failures on execution of "make xxx_defconfig"
> with absent cross-compiler, for more info see [1].
> 
> Set CROSS_COMPILE as well gets in the way if we want only to build
> .dtb's (again with absent cross-compiler which is not really needed
> for building .dtb's), see [2].

@Alexey, can we revisit this (revert back partially). I'm getting sick of having
to specify the CROSS_COMPILE in my cmdline.

Will something along the lines fc2b47b55f17fd996f7a019 ("h8300: use
cc-cross-prefix instead of hardcoding h8300-unknown-linux-") work ?

---->
+ifeq ($(CROSS_COMPILE),)
+CROSS_COMPILE := $(call cc-cross-prefix, arc-linux-)
+endif



> 
> Note, we had to change LIBGCC assignment type from ":=" to "="
> so that is is resolved on its usage, otherwise if it is resolved
> at declaration time with missing CROSS_COMPILE we're getting this
> error message from host GCC:
> ------------------------->8-------------------------
> gcc: error: unrecognized command line option ?-mmedium-calls?
> gcc: error: unrecognized command line option ?-mno-sdata?; did you mean ?-fno-stats??
> ------------------------->8-------------------------
> 
> [1] http://lists.infradead.org/pipermail/linux-snps-arc/2018-September/004308.html
> [2] http://lists.infradead.org/pipermail/linux-snps-arc/2018-September/004320.html
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Masahiro Yamada <yamada.masahiro at socionext.com>
> Cc: Rob Herring <robh at kernel.org>
> ---
>  arch/arc/Makefile | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> index 99cce77ab98f..5f6b67917dc2 100644
> --- a/arch/arc/Makefile
> +++ b/arch/arc/Makefile
> @@ -6,14 +6,6 @@
>  # published by the Free Software Foundation.
>  #
>  
> -ifeq ($(CROSS_COMPILE),)
> -ifndef CONFIG_CPU_BIG_ENDIAN
> -CROSS_COMPILE := arc-linux-
> -else
> -CROSS_COMPILE := arceb-linux-
> -endif
> -endif
> -
>  KBUILD_DEFCONFIG := nsim_700_defconfig
>  
>  cflags-y	+= -fno-common -pipe -fno-builtin -mmedium-calls -D__linux__
> @@ -79,7 +71,7 @@ cflags-$(disable_small_data)		+= -mno-sdata -fcall-used-gp
>  cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= -mbig-endian
>  ldflags-$(CONFIG_CPU_BIG_ENDIAN)	+= -EB
>  
> -LIBGCC	:= $(shell $(CC) $(cflags-y) --print-libgcc-file-name)
> +LIBGCC	= $(shell $(CC) $(cflags-y) --print-libgcc-file-name)
>  
>  # Modules with short calls might break for calls into builtin-kernel
>  KBUILD_CFLAGS_MODULE	+= -mlong-calls -mno-millicode
> 
