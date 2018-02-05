From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 5 Feb 2018 09:17:53 -0800
Subject: [PATCH 19/20] ARC: Fix malformed ARC_EMUL_UNALIGNED default
In-Reply-To: <20180205012146.23981-20-ulfalizer@gmail.com>
References: <20180205012146.23981-1-ulfalizer@gmail.com>
 <20180205012146.23981-20-ulfalizer@gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <2e1dcff1-8bf6-39ce-9646-2441a78a3e34@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 02/04/2018 05:21 PM, Ulf Magnusson wrote:
> 'default N' should be 'default n', though they happen to have the same
> effect here, due to undefined symbols (N in this case) evaluating to n
> in a tristate sense.
> 
> Remove the default from ARC_EMUL_UNALIGNED instead of changing it. bool
> and tristate symbols implicitly default to n.
> 
> Discovered with the
> https://github.com/ulfalizer/Kconfiglib/blob/master/examples/list_undefined.py
> script.
> 
> Signed-off-by: Ulf Magnusson <ulfalizer at gmail.com>


Added to ARC for-curr.

Thx,
-Vineet

> ---
>   arch/arc/Kconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> index f3a80cf164cc..d76bf4a83740 100644
> --- a/arch/arc/Kconfig
> +++ b/arch/arc/Kconfig
> @@ -484,7 +484,6 @@ config ARC_CURR_IN_REG
>   
>   config ARC_EMUL_UNALIGNED
>   	bool "Emulate unaligned memory access (userspace only)"
> -	default N
>   	select SYSCTL_ARCH_UNALIGN_NO_WARN
>   	select SYSCTL_ARCH_UNALIGN_ALLOW
>   	depends on ISA_ARCOMPACT
> 
