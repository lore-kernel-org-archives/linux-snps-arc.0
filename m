From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 1 Feb 2019 15:27:45 -0800
Subject: [PATCH v2 2/5] ARCv2: introduce unaligned access under a Kconfig
 option
In-Reply-To: <20190130163244.10870-3-Eugeniy.Paltsev@synopsys.com>
References: <20190130163244.10870-1-Eugeniy.Paltsev@synopsys.com>
 <20190130163244.10870-3-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <f95135f7-20e3-1897-d3dc-e8dadf8a2ac5@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 1/30/19 8:32 AM, Eugeniy Paltsev wrote:
> As of today we enable unaligned access unconditionally on ARCv2.
> Lets move it under Kconfig option so we can disable it in case of
> using HW configuration which lacks of it.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
>  arch/arc/Kconfig                      |  8 ++++++++
>  arch/arc/include/asm/irqflags-arcv2.h |  4 ++++
>  arch/arc/kernel/head.S                | 14 +++++++++-----
>  arch/arc/kernel/intc-arcv2.c          |  2 +-
>  4 files changed, 22 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> index 376366a7db81..37c8aeefa3a5 100644
> --- a/arch/arc/Kconfig
> +++ b/arch/arc/Kconfig
> @@ -387,6 +387,14 @@ config ARC_HAS_SWAPE
>  
>  if ISA_ARCV2
>  
> +config ARC_USE_UNALIGNED_MEM_ACCESS
> +	bool "Handle unaligned access in HW and use it"
> +	default y
> +	help
> +	  The ARC HS architecture supports unaligned memory access
> +	  which is disabled by default. Enable unaligned access in
> +	  hardware and use it in software.
> +
>  config ARC_HAS_LL64
>  	bool "Insn: 64bit LDD/STD"
>  	help
> diff --git a/arch/arc/include/asm/irqflags-arcv2.h b/arch/arc/include/asm/irqflags-arcv2.h
> index 8a4f77ea3238..9b911e2c6b31 100644
> --- a/arch/arc/include/asm/irqflags-arcv2.h
> +++ b/arch/arc/include/asm/irqflags-arcv2.h
> @@ -44,8 +44,12 @@
>  #define ARCV2_IRQ_DEF_PRIO	1
>  
>  /* seed value for status register */
> +#ifdef CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS
>  #define ISA_INIT_STATUS_BITS	(STATUS_IE_MASK | STATUS_AD_MASK | \
>  					(ARCV2_IRQ_DEF_PRIO << 1))
> +#else
> +#define ISA_INIT_STATUS_BITS	(STATUS_IE_MASK | (ARCV2_IRQ_DEF_PRIO << 1))
> +#endif /* CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS */
>  
>  #ifndef __ASSEMBLY__
>  
> diff --git a/arch/arc/kernel/head.S b/arch/arc/kernel/head.S
> index 25b3a247e11c..bd24ba0e0264 100644
> --- a/arch/arc/kernel/head.S
> +++ b/arch/arc/kernel/head.S
> @@ -49,11 +49,15 @@
>  
>  1:
>  
> -#ifdef CONFIG_ISA_ARCV2
> -	; Enable unaligned access as disabled by default in hw while
> -	; gcc 8.1.0 onwards (ARC GNU 2018.03) unconditionally generates
> -	; code for unaligned accesses
> -	flag    1 << STATUS_AD_BIT
> +	; Enable / disable HW handling of unaligned access in the CPU.
> +#ifdef CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS
> +	kflag	STATUS_AD_MASK
> +#else
> +	; Handling of unaligned access is disabled by default but we disable it
> +	; manually in case of any bootloader enabled it earlier.
> +	lr	r5, [ARC_REG_STATUS32]
> +	bclr	r5, r5, STATUS_AD_BIT
> +	kflag	r5
>  #endif
>  .endm

I tested these patches and we have a little problem when
CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS is disabled. AD bit is cleared, but current
gcc (2018.09 release) generates unaligned accesses still.


Misaligned Access
Path: (null)
CPU: 0 PID: 0 Comm: swapper Not tainted 5.0.0-rc4+ #484

[ECR   ]: 0x000d0000 => Check Programmer's Manual
[EFA   ]: 0x808293cf
[BLINK ]: device_node_gen_full_name+0x3e/0xd4
[ERET  ]: string.constprop.11+0x3e/0x6c
[STAT32]: 0x00000002 :   K
BTA: 0x807e8768	 SP: 0x808d9e94	 FP: 0x00000000
LPS: 0x807ede44	LPE: 0x807ede54	LPC: 0x00000000
r00: 0x00000001	r01: 0x00000001	r02: 0x00000000	
...
Stack Trace:
  string.constprop.11+0x3e/0x6c
  device_node_gen_full_name+0x3e/0xd4
  device_node_string+0x128/0x32c
  vsnprintf+0xfa/0x3c4
  kvasprintf+0x24/0x78
  kasprintf+0x16/0x1c
  __irq_domain_add+0x72/0x1b8
  init_onchip_IRQ+0x38/0x60


Guess there's no solution to this. We could force select the option in relevant
Kconfig, but this applies to pretty much every platform and defeats the purpose of
option in first place.

>  
> diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
> index 067ea362fb3e..6359896da1ea 100644
> --- a/arch/arc/kernel/intc-arcv2.c
> +++ b/arch/arc/kernel/intc-arcv2.c
> @@ -93,7 +93,7 @@ void arc_init_IRQ(void)
>  
>  	/* setup status32, don't enable intr yet as kernel doesn't want */
>  	tmp = read_aux_reg(ARC_REG_STATUS32);
> -	tmp |= STATUS_AD_MASK | (ARCV2_IRQ_DEF_PRIO << 1);
> +	tmp |= ARCV2_IRQ_DEF_PRIO << 1;
>  	tmp &= ~STATUS_IE_MASK;
>  	asm volatile("kflag %0	\n"::"r"(tmp));
>  }
> 
