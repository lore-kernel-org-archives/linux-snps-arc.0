From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 18 May 2016 10:45:15 +0530
Subject: [PATCH] ARC: Troubleshoot execution of UP Linux on SMP HW and
 vice versa
In-Reply-To: <1463519219-20500-1-git-send-email-abrodkin@synopsys.com>
References: <1463519219-20500-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <573BFA63.1080307@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Wednesday 18 May 2016 02:36 AM, Alexey Brodkin wrote:
> ARC SMP hardware heavily relies on Interrupt Distribution Unit (IDU)
> for all interrupts serving. And UP ARC hardware lacks this block.
> 
> That leads to incompatibility between UP and SMP Linux builds.
> 
> Even though UP build of Linux will run on SMP hardware at some
> point strange behavior will appear. Very good example is serial port
> will stop functioning once it switches from earlycon driver (which
> doesn't use interrupts) to full-scale serial driver (that will rely
> on interrupts).
> 
> The same is applicable to reverse combination: SMP build won't
> work on UP hardware and symptoms will be pretty much the same.

This is not necessarily correct. I'm pretty sure that if u have right DT (despite
embedded, if you have uboot provide a different one), SMP kernel will infact boot
on UP hardware - and if not - we should actively try to achieve that. That is
where world is moving: fwiw ARM64 kernel forces CONFIG_SMP because and doesn't
even support UP anymore.

> And so to save [especially  newcomers] from spending hours in
> frustration we're doing a check very early on boot if the kernel was
> configured with CONFIG_ARC_MCIP (which is automatically selected as
> a dependency of CONFIG_SMP) and in run-time we're seeing SMP-specific
> register that holds a number of SMP cores.
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> ---
>  arch/arc/kernel/setup.c | 12 ++++++++++++
...
> @@ -374,6 +375,8 @@ static inline int is_kernel(unsigned long addr)
>  
>  void __init setup_arch(char **cmdline_p)
>  {
> +	unsigned int num_cores;
> +
>  #ifdef CONFIG_ARC_UBOOT_SUPPORT
>  	/* make sure that uboot passed pointer to cmdline/dtb is valid */
>  	if (uboot_tag && is_kernel((unsigned long)uboot_arg))
> @@ -413,6 +416,15 @@ void __init setup_arch(char **cmdline_p)
>  	if (machine_desc->init_early)
>  		machine_desc->init_early();
>  
> +	num_cores = (read_aux_reg(ARC_REG_MCIP_BCR) >> 16) & 0x3F;
> +#ifdef CONFIG_ARC_MCIP
> +	if (!num_cores)
> +		panic("SMP kernel is run on a UP hardware!\n");
> +#else
> +	if (num_cores)
> +		panic("UP kernel is run on a SMP hardware!\n");
> +#endif

This is ugly: if AXS platform has trouble booting with UP/SMP hw/sw mismatch, do
that in platform early init code w/o littering platform agnostic code unless
absolutely necessary.

> +
>  	smp_init_cpus();
>  
>  	setup_processor();
> 
