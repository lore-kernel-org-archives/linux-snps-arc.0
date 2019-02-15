From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 15 Feb 2019 15:55:08 -0800
Subject: [PATCH v2 1/2] ARC: U-boot: check arguments paranoidly
In-Reply-To: <20190214150745.18773-2-Eugeniy.Paltsev@synopsys.com>
References: <20190214150745.18773-1-Eugeniy.Paltsev@synopsys.com>
 <20190214150745.18773-2-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <f27a52c2-3f1a-51c2-6b4f-dfbdc94b8aff@synopsys.com>
To: linux-snps-arc@lists.infradead.org


[...]

> -char __initdata *uboot_arg;
> +unsigned int __initdata uboot_arg;

Why ?

In both places it is actually used, it is intended as a pointer. The cast for
range check is needed but lets cast there. See below for real reason.


> -static inline int is_kernel(unsigned long addr)
> +static inline bool uboot_arg_invalid(unsigned int addr)
>  {
> -	if (addr >= (unsigned long)_stext && addr <= (unsigned long)_end)
> -		return 1;
> +
> +	/* Check that address doesn't clobber resident kernel image */
> +	return addr >= (unsigned int)_stext && addr <= (unsigned int)_end;

...

> +
> +	/* see if U-boot passed an external Device Tree blob */
> +	if (uboot_tag == UBOOT_TAG_DTB) {
> +		machine_desc = setup_machine_fdt((void *)uboot_arg);

On a 64-bit paradigm, with LP64 ABI, this will break since int will be 4b, while
pointer 8b.

I'll fix it up locally and push !

-Vineet
