From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 19 Sep 2017 17:24:11 -0700
Subject: [PATCH] reset: Restrict RESET_HSDK_V1 to ARC_SOC_HSDK or
 COMPILE_TEST
In-Reply-To: <1505132528-27843-1-git-send-email-geert@linux-m68k.org>
References: <1505132528-27843-1-git-send-email-geert@linux-m68k.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <f634728e-fb0a-7679-4fff-58c866def56d@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/11/2017 05:22 AM, Geert Uytterhoeven wrote:
> The HSDK reset driver is only useful when building for an ARC HSDK
> platform.
> 
> While at it, drop the "default n", as that is the default.
> 
> Fixes: e0be864f14240cb1 ("ARC: reset: introduce HSDKv1 reset driver")
> Signed-off-by: Geert Uytterhoeven <geert at linux-m68k.org>
> ---
>   drivers/reset/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 52d5251660b9b51c..feea22c912ebf688 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -36,7 +36,7 @@ config RESET_BERLIN
>   
>   config RESET_HSDK_V1
>   	bool "HSDK v1 Reset Driver"
> -	default n
> +	depends on ARC_SOC_HSDK || COMPILE_TEST
>   	help
>   	  This enables the reset controller driver for HSDK v1.
>   
> 

Philip, can u please pick this up - there would be conflict due to V1 rename - 
easy to fixup !

Thx,
-Vineet
