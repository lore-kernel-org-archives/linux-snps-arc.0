From: vineetg76@gmail.com (Vineet Gupta)
Date: Wed, 6 Feb 2019 13:33:24 -0800
Subject: [RFC 2/2] ARC: U-boot: check magic number passed from u-boot
In-Reply-To: <20190206172228.9261-3-Eugeniy.Paltsev@synopsys.com>
References: <20190206172228.9261-1-Eugeniy.Paltsev@synopsys.com>
 <20190206172228.9261-3-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <21c279e8-df48-e6c9-05ca-30286ff928f2@gmail.com>
To: linux-snps-arc@lists.infradead.org

On 2/6/19 9:22 AM, Eugeniy Paltsev wrote:
> In case of devboards we really often disable bootloader and load
> Linux image in memory via JTAG. In case of using kernel with
> CONFIG_ARC_UBOOT_SUPPORT enabled we may crash as we will try to
> interpret some junk in a registers as a pointers to bootargs/etc
> which aren't set by anyone in case of JTAG using.
> 
> Try to make it much less possible by check magic number and
> 'U-boot - kernel' ABI revision number passed from U-boot.
> Ignore U-boot arguments if we got wrong magic number or unknown
> ABI revision.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
>  arch/arc/kernel/head.S  |  5 ++++-
>  arch/arc/kernel/setup.c | 26 ++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arc/kernel/head.S b/arch/arc/kernel/head.S
> index 7095055bb874..3fb88ec62bc7 100644
> --- a/arch/arc/kernel/head.S
> +++ b/arch/arc/kernel/head.S
> @@ -92,10 +92,13 @@ ENTRY(stext)
>  
>  #ifdef CONFIG_ARC_UBOOT_SUPPORT
>  	; Uboot - kernel ABI
> +	;    r1 = bits [31:8] magic number, bits [7:0] uboot-kernel ABI revision
> +	; ABI revision 0:
>  	;    r0 = [0] No uboot interaction, [1] cmdline in r2, [2] DTB in r2
> -	;    r1 = magic number (board identity, unused as of now
>  	;    r2 = pointer to uboot provided cmdline or external DTB in mem
>  	; These are handled later in handle_uboot_args()
> +	st      r1, [@uboot_rev_magic]
> +	mov	r1, 0			; errase magic from the register
>  	st	r0, [@uboot_tag]
>  	st	r2, [@uboot_arg]
>  #endif
> diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
> index 7edb35c26322..868dda3d4b43 100644
> --- a/arch/arc/kernel/setup.c
> +++ b/arch/arc/kernel/setup.c
> @@ -36,6 +36,7 @@ unsigned int intr_to_DE_cnt;
>  
>  /* Part of U-boot ABI: see head.S */
>  int __initdata uboot_tag;
> +int __initdata uboot_rev_magic;
>  char __initdata *uboot_arg;
>  
>  const struct machine_desc *machine_desc;
> @@ -467,6 +468,10 @@ static inline bool is_kernel(unsigned long addr)
>  	return addr >= (unsigned long)_stext && addr <= (unsigned long)_end;
>  }
>  
> +#define UBOOT_MAGIC_VALUE		0x567890
> +#define UBOOT_MAGIC_GET(x)		(((x) & GENMASK(31, 8)) >> 8)
> +#define UBOOT_REVISION_GET(x)		((x) & GENMASK(7, 0))
> +
>  /* uboot_tag values for U-boot - kernel ABI revisions 0+; see head.S */
>  #define UBOOT_REV0P_TAG_NONE		0
>  #define UBOOT_REV0P_TAG_CMDLINE		1
> @@ -478,6 +483,25 @@ void __init handle_uboot_args(void)
>  	bool use_embedded_dtb = true;
>  
>  #ifdef CONFIG_ARC_UBOOT_SUPPORT
> +	/* check that we got correct magic */
> +	if (UBOOT_MAGIC_GET(uboot_rev_magic) != UBOOT_MAGIC_VALUE) {
> +		pr_warn("Invalid magic '%06lx' is passed from uboot, uboot args ingnored\n",
> +			UBOOT_MAGIC_GET(uboot_rev_magic));
> +
> +		goto ignore_uboot_args;
> +	}
> +
> +	/*
> +	 * check that we know this U-boot args ABI revision.
> +	 * as for today we only have one revision - '0'.
> +	 */
> +	if (UBOOT_REVISION_GET(uboot_rev_magic) != 0) {
> +		pr_warn("Unknown args revision '%02lx' is passed from uboot, uboot args ingnored\n",
> +			UBOOT_REVISION_GET(uboot_rev_magic));
> +
> +		goto ignore_uboot_args;
> +	}
> +

So you are effectively dropping support for older uboot here as above seems to
assume that r1 will have the new magic value now. The existing stock of HSDK
boards will continue to ship with older uboot.

I understand your idea, but the fact is we can't drop the old uboot support.

Also not sure how all of this allows us to eliminate CONFIG_ARC_UBOOT_SUPPORT, or
enable it unconditionally with old or new uboot.


>  	/* check that we know this tag */
>  	if (uboot_tag != UBOOT_REV0P_TAG_NONE &&
>  	    uboot_tag != UBOOT_REV0P_TAG_CMDLINE &&
> @@ -498,6 +522,8 @@ void __init handle_uboot_args(void)
>  
>  	if (uboot_tag == UBOOT_REV0P_TAG_CMDLINE)
>  		append_boot_cmdline = true;
> +
> +ignore_uboot_args:
>  #endif
>  
>  	if (use_embedded_dtb) {
> 
