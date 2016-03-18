From: arnd@arndb.de (Arnd Bergmann)
Date: Fri, 18 Mar 2016 10:52:12 +0100
Subject: [PATCH] ARC: build: Turn off -Wmaybe-uninitialized for ARC gcc 4.8
In-Reply-To: <1458290783-31491-1-git-send-email-vgupta@synopsys.com>
References: <1458290783-31491-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <23667289.mNa1Q2STbY@wuerfel>
To: linux-snps-arc@lists.infradead.org

On Friday 18 March 2016 14:16:23 Vineet Gupta wrote:
> diff --git a/arch/arc/Makefile b/arch/arc/Makefile
> index fed12f39d8ce..aeb101e8e674 100644
> --- a/arch/arc/Makefile
> +++ b/arch/arc/Makefile
> @@ -48,9 +48,14 @@ endif
>  upto_gcc44    :=  $(call cc-ifversion, -le, 0404, y)
>  atleast_gcc44 :=  $(call cc-ifversion, -ge, 0404, y)
>  atleast_gcc48 :=  $(call cc-ifversion, -ge, 0408, y)
> +is_gcc48      :=  $(call cc-ifversion, -eq, 0408, y)
>  
>  cflags-$(atleast_gcc44)                        += -fsection-anchors
>  
> +# gcc 4.8 spits out false positives for default -O3
> +# disable these for 4.8 and revisit when we upgrade to newer ver
> +cflags-$(is_gcc48)                     += $(call cc-disable-warning,maybe-uninitialized,)
> +
>  cflags-$(CONFIG_ARC_HAS_LLSC)          += -mlock
>  cflags-$(CONFIG_ARC_HAS_SWAPE)         += -mswape

Is this any better with gcc-4.9 or gcc-5? Maybe it's better to add the flag to
the line that adds -O3 for consistency. We do the same thing for -Os in the
global Makefile, as that triggers a similar load of warnings.

	Arnd
