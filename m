From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 23 Mar 2017 09:00:48 -0700
Subject: ARC patch suggestion
In-Reply-To: <20170323030239.GF20886@waldemar-brodkorb.de>
References: <20170323030239.GF20886@waldemar-brodkorb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <fa1c8dfb-629b-f2df-c2cc-421369d08868@synopsys.com>
To: linux-snps-arc@lists.infradead.org

+CC ARC gnu folks, Anton who maintains an internal build system


On 03/22/2017 08:02 PM, Waldemar Brodkorb wrote:
> Hi,
>
> I want to success following change:
>
> From cde74b83f9b204bf56f304224654e4993dc56efc Mon Sep 17 00:00:00 2001
> From: Waldemar Brodkorb <wbx at openadk.org>
> Date: Tue, 21 Mar 2017 20:04:21 +0100
> Subject: [PATCH 2/2] ARC: remove special CFLAGS/LDFLAGS handling
>
> Either toolchain defaults or buildsystems should provide the
> architecture specific CFLAGS and LDFLAGS.

Seems a decent cleanup to me !

Acked-by: Vineet Gupta <vgupta at synopsys.com>

@Anton, @Claudiu, @Cupertino any thoughts : for / against


>
> Signed-off-by: Waldemar Brodkorb <wbx at openadk.org>
> ---
>  Rules.mak                |  6 ------
>  extra/Configs/Config.arc | 18 ------------------
>  2 files changed, 24 deletions(-)
>
> diff --git a/Rules.mak b/Rules.mak
> index ae78f44..9c481c3 100644
> --- a/Rules.mak
> +++ b/Rules.mak
> @@ -508,12 +508,6 @@ ifeq ($(TARGET_ARCH),c6x)
>  	CPU_LDFLAGS-y += $(CPU_CFLAGS)
>  endif
>  
> -ifeq ($(TARGET_ARCH),arc)
> -	CPU_CFLAGS-$(CONFIG_ARC_CPU_700) += -mA7
> -	CPU_CFLAGS-$(CONFIG_ARC_CPU_HS) += -mcpu=archs
> -	CPU_LDFLAGS-y += $(CPU_CFLAGS) -marclinux
> -endif
> -
>  $(eval $(call check-gcc-var,$(PIEFLAG_NAME)))
>  PIEFLAG := $(CFLAG_$(PIEFLAG_NAME))
>  ifeq ($(PIEFLAG),)
> diff --git a/extra/Configs/Config.arc b/extra/Configs/Config.arc
> index c263dbf..ebbde2e 100644
> --- a/extra/Configs/Config.arc
> +++ b/extra/Configs/Config.arc
> @@ -10,24 +10,6 @@ config FORCE_OPTIONS_FOR_ARCH
>  	default y
>  	select ARCH_ANY_ENDIAN
>  
> -choice
> -	prompt "Target Processor Type"
> -	default CONFIG_ARC_CPU_700
> -
> -config CONFIG_ARC_CPU_700
> -	bool "ARC700"
> -	select ARCH_HAS_MMU
> -	help
> -	  ARCompact ISA based ARC CPU
> -
> -config CONFIG_ARC_CPU_HS
> -	bool "ARC-HS"
> -	select ARCH_HAS_MMU
> -	help
> -	  Next Generation ARCv2 ISA based Processors
> -
> -endchoice
> -
>  config CONFIG_ARC_HAS_ATOMICS
>  	bool "Support for LLOCK/SCOND instructions"
>  	default y
