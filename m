From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Tue, 12 Feb 2019 17:25:27 +0000
Subject: [PATCH 1/2] ARC: U-boot: check arguments paranoidly
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075014643364E@US01WEMBX2.internal.synopsys.com>
References: <20190212153932.28371-1-Eugeniy.Paltsev@synopsys.com>
 <20190212153932.28371-2-Eugeniy.Paltsev@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075014643364E@US01WEMBX2.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1549992326.27724.98.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tue, 2019-02-12@16:45 +0000, Vineet Gupta wrote:
> On 2/12/19 7:39 AM, Eugeniy Paltsev wrote:
> > Handle U-boot arguments paranoidly:
> >  * don't allow to pass unknown tag.
> >  * try to use external device tree blob only if corresponding tag
> >    (TAG_DTB) is set.
> >  * check that magic number is correct.
> >  * don't check uboot_tag if kernel build with no ARC_UBOOT_SUPPORT.
> > 
> > NOTE:
> > If U-boot args are invalid we skip them and try to use embedded device
> > tree blob. We can't panic on invalid U-boot args as we really pass
> > invalid args due to bug in U-boot code.
> > This happens if we don't provide external DTB to U-boot and
> > don't set 'bootargs' U-boot environment variable (which is default
> > case at least for HSDK board) In that case we will pass
> > {r0 = 1 (bootargs in r2); r1 = 0; r2 = 0;} to linux which is invalid.
> > 
> > NOTE:
> > We can safely check U-boot magic value (0x0) in linux passed via
> > r1 register as U-boot pass it from the beginning.
> > 
> > While I'm at it refactor U-boot arguments handling code.
> > 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> > ---
> >  arch/arc/kernel/head.S  |  5 +--
> >  arch/arc/kernel/setup.c | 92 +++++++++++++++++++++++++++++++++++--------------
> >  2 files changed, 69 insertions(+), 28 deletions(-)
> > 
> > diff --git a/arch/arc/kernel/head.S b/arch/arc/kernel/head.S
> > index 8b90d25a15cc..fccea361e896 100644
> > --- a/arch/arc/kernel/head.S
> > +++ b/arch/arc/kernel/head.S
> > @@ -93,10 +93,11 @@ ENTRY(stext)
> >  #ifdef CONFIG_ARC_UBOOT_SUPPORT
> >  	; Uboot - kernel ABI
> >  	;    r0 = [0] No uboot interaction, [1] cmdline in r2, [2] DTB in r2
> > -	;    r1 = magic number (board identity, unused as of now
> > +	;    r1 = magic number (always zero as of now)
> 
> This is technically changing the ABI - I think we don't need to enforce this -
> keep ignoring this

I think it's better to add this check:
 * This check doesn't break backward compatibility. ARC U-boot pass zero to r1
   from the beginnings, I specially checked this. So we doesn't change ABI,
   we only document it ;) 
 * By adding this check we can cheap and easily minimize problems in JTAG case.

> > +
> > +	if (use_embedded_dtb) {
> >  		machine_desc = setup_machine_fdt(__dtb_start);
> >  		if (!machine_desc)
> >  			panic("Embedded DT invalid\n");
> > +	}
> >  
> > -		/*
> > -		 * If we are here, it is established that @uboot_arg didn't
> > -		 * point to DT blob. Instead if u-boot says it is cmdline,
> > -		 * append to embedded DT cmdline.
> > -		 * setup_machine_fdt() would have populated @boot_command_line
> > -		 */
> 
> Don't drop this comment, specially the last line. If was tempted to move the cmd
> line processing before but this saved me since we rely on setup_machine_fdt()
> being called aprioiri.

Ok, will fix in v2

> > -		if (uboot_tag == 1) {
> > -			/* Ensure a whitespace between the 2 cmdlines */
> > -			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
> > -			strlcat(boot_command_line, uboot_arg,
> > -				COMMAND_LINE_SIZE);
> > -		}
> > +	if (append_cmdline) {
> > +		/* Ensure a whitespace between the 2 cmdlines */
> > +		strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
> > +		strlcat(boot_command_line, (char *)uboot_arg, COMMAND_LINE_SIZE);
> >  	}
> > +}
> > +
> > +void __init setup_arch(char **cmdline_p)
> > +{
> > +	handle_uboot_args();
> >  
> >  	/* Save unparsed command line copy for /proc/cmdline */
> >  	*cmdline_p = boot_command_line;
> 
> 
-- 
 Eugeniy Paltsev
