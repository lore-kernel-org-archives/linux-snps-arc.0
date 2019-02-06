From: vineetg76@gmail.com (Vineet Gupta)
Date: Wed, 6 Feb 2019 14:13:16 -0800
Subject: [RFC 1/2] ARC: U-boot: check arguments paranoidly
In-Reply-To: <20190206172228.9261-2-Eugeniy.Paltsev@synopsys.com>
References: <20190206172228.9261-1-Eugeniy.Paltsev@synopsys.com>
 <20190206172228.9261-2-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <b3226062-e177-ef15-b683-71493e91d804@gmail.com>
To: linux-snps-arc@lists.infradead.org

On 2/6/19 9:22 AM, Eugeniy Paltsev wrote:
> Handle U-boot arguments paranoidly:
>  * don't allow to pass unknown tag.
>  * try to use external device tree blob only if corresponding tag
>    (TAG_DTB) is set.
>  * don't check: uboot_tag if kernel build with no ARC_UBOOT_SUPPORT.
> 
> While I'm at it refactor U-boot arguments handling code.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
>  arch/arc/kernel/head.S  |  2 +-
>  arch/arc/kernel/setup.c | 65 ++++++++++++++++++++++++++++++++-----------------
>  2 files changed, 44 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/arc/kernel/head.S b/arch/arc/kernel/head.S
> index 8b90d25a15cc..7095055bb874 100644
> --- a/arch/arc/kernel/head.S
> +++ b/arch/arc/kernel/head.S
> @@ -95,7 +95,7 @@ ENTRY(stext)
>  	;    r0 = [0] No uboot interaction, [1] cmdline in r2, [2] DTB in r2
>  	;    r1 = magic number (board identity, unused as of now
>  	;    r2 = pointer to uboot provided cmdline or external DTB in mem
> -	; These are handled later in setup_arch()
> +	; These are handled later in handle_uboot_args()
>  	st	r0, [@uboot_tag]
>  	st	r2, [@uboot_arg]
>  #endif
> diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
> index feb90093e6b1..7edb35c26322 100644
> --- a/arch/arc/kernel/setup.c
> +++ b/arch/arc/kernel/setup.c
> @@ -462,43 +462,64 @@ void setup_processor(void)
>  	arc_chk_core_config();
>  }
>  
> -static inline int is_kernel(unsigned long addr)
> +static inline bool is_kernel(unsigned long addr)
>  {
> -	if (addr >= (unsigned long)_stext && addr <= (unsigned long)_end)
> -		return 1;
> -	return 0;
> +	return addr >= (unsigned long)_stext && addr <= (unsigned long)_end;
>  }
>  
> -void __init setup_arch(char **cmdline_p)
> +/* uboot_tag values for U-boot - kernel ABI revisions 0+; see head.S */
> +#define UBOOT_REV0P_TAG_NONE		0
> +#define UBOOT_REV0P_TAG_CMDLINE		1
> +#define UBOOT_REV0P_TAG_DTB		2
> +
> +void __init handle_uboot_args(void)
>  {
> +	bool append_boot_cmdline = false;
> +	bool use_embedded_dtb = true;
> +
>  #ifdef CONFIG_ARC_UBOOT_SUPPORT
> +	/* check that we know this tag */
> +	if (uboot_tag != UBOOT_REV0P_TAG_NONE &&
> +	    uboot_tag != UBOOT_REV0P_TAG_CMDLINE &&
> +	    uboot_tag != UBOOT_REV0P_TAG_DTB)
> +		panic("Invalid uboot tag: '%08x'\n", uboot_tag);
> +
>  	/* make sure that uboot passed pointer to cmdline/dtb is valid */
> -	if (uboot_tag && is_kernel((unsigned long)uboot_arg))
> +	if (uboot_tag != UBOOT_REV0P_TAG_NONE && is_kernel((unsigned long)uboot_arg))
>  		panic("Invalid uboot arg\n");
>  
>  	/* See if u-boot passed an external Device Tree blob */
> -	machine_desc = setup_machine_fdt(uboot_arg);	/* uboot_tag == 2 */
> -	if (!machine_desc)
> +	if (uboot_tag == UBOOT_REV0P_TAG_DTB) {
> +		machine_desc = setup_machine_fdt(uboot_arg);
> +
> +		/* external Device Tree blob is invalid - use embedded one */
> +		use_embedded_dtb = !machine_desc;
> +	}
> +
> +	if (uboot_tag == UBOOT_REV0P_TAG_CMDLINE)
> +		append_boot_cmdline = true;
>  #endif
> -	{
> -		/* No, so try the embedded one */
> +
> +	if (use_embedded_dtb) {
>  		machine_desc = setup_machine_fdt(__dtb_start);
>  		if (!machine_desc)
>  			panic("Embedded DT invalid\n");
> +	}
>  
> -		/*
> -		 * If we are here, it is established that @uboot_arg didn't
> -		 * point to DT blob. Instead if u-boot says it is cmdline,
> -		 * append to embedded DT cmdline.
> -		 * setup_machine_fdt() would have populated @boot_command_line
> -		 */
> -		if (uboot_tag == 1) {
> -			/* Ensure a whitespace between the 2 cmdlines */
> -			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
> -			strlcat(boot_command_line, uboot_arg,
> -				COMMAND_LINE_SIZE);
> -		}
> +	/*
> +	 * If we are here, U-boot says that @uboot_arg is cmdline, so append it
> +	 * to embedded DT cmdline.
> +	 */
> +	if (append_boot_cmdline) {
> +		/* Ensure a whitespace between the 2 cmdlines */
> +		strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
> +		strlcat(boot_command_line, uboot_arg, COMMAND_LINE_SIZE);
>  	}
> +}
> +
> +void __init setup_arch(char **cmdline_p)
> +{
> +	handle_uboot_args();
>  
>  	/* Save unparsed command line copy for /proc/cmdline */
>  	*cmdline_p = boot_command_line;

I think we can grossly simplify all of this w/o adding any new ABI contract
between kernel and uboot and eliminate CONFIG_ARC_UBOOT_SUPPORT as well (make
uboot support always enabled)

So when bootloader runs it passes {0,1,2} in r0 and corresponding arg in r2.
For jtag case we can assume that core registers will come up reset value of 0 or
in worst case we rely on user passing -on=clear_regs to Metaware debugger.

Now as you already figured out, we just need to make sure kernel doesn't try to
dereference the pointers for bogus values. How does the hunk below look like (and
in a subsequent patch remove the Kconfig)

-------------->
diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index def19b0ef8c6..cdd8e9a1768a 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -462,44 +462,46 @@ void setup_processor(void)
 	arc_chk_core_config();
 }

-static inline int is_kernel(unsigned long addr)
-{
-	if (addr >= (unsigned long)_stext && addr <= (unsigned long)_end)
-		return 1;
-	return 0;
-}
-
 void __init setup_arch(char **cmdline_p)
 {
-#ifdef CONFIG_ARC_UBOOT_SUPPORT
-	/* make sure that uboot passed pointer to cmdline/dtb is valid */
-	if (uboot_tag && is_kernel((unsigned long)uboot_arg))
-		panic("Invalid uboot arg\n");
-
-	/* See if u-boot passed an external Device Tree blob */
-	machine_desc = setup_machine_fdt(uboot_arg);	/* uboot_tag == 2 */
-	if (!machine_desc)
-#endif
-	{
-		/* No, so try the embedded one */
-		machine_desc = setup_machine_fdt(__dtb_start);
-		if (!machine_desc)
-			panic("Embedded DT invalid\n");
+	bool use_embedded_dtb = true;
+
+	if (IS_ENABLED(CONFIG_ARC_UBOOT_SUPPORT) && uboot_tag) {

 		/*
-		 * If we are here, it is established that @uboot_arg didn't
-		 * point to DT blob. Instead if u-boot says it is cmdline,
-		 * append to embedded DT cmdline.
-		 * setup_machine_fdt() would have populated @boot_command_line
+		 * ensure u-boot passed pointer is valid
+		 *   - is a valid untranslated address (although MMU is not
+		 *     enabled yet, it being a high address ensures this is
+		 *     not by fluke)
+		 *   - doesn't clobber resident kernel image
 		 */
-		if (uboot_tag == 1) {
-			/* Ensure a whitespace between the 2 cmdlines */
-			strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
-			strlcat(boot_command_line, uboot_arg,
-				COMMAND_LINE_SIZE);
+		if ((unsigned long)uboot_arg < (unsigned long)_end)
+			panic("Invalid uboot arg\n");
+
+		/* validate u-boot passed external Device Tree blob */
+		if (uboot_tag == 2) {
+			machine_desc = setup_machine_fdt(uboot_arg);
+			if (machine_desc)
+				use_embedded_dtb = false;
 		}
 	}

+	if (use_embedded_dtb) 	{
+		machine_desc = setup_machine_fdt(__dtb_start);
+		if (!machine_desc)
+			panic("Embedded DT invalid\n");
+	}
+
+	/*
+	 * append u-boot cmdline to embedded DT cmdline.
+	 * setup_machine_fdt() would have populated @boot_command_line
+	 */
+	if (IS_ENABLED(CONFIG_ARC_UBOOT_SUPPORT) && uboot_tag == 1) {
+		/* Ensure a whitespace between the 2 cmdlines */
+		strlcat(boot_command_line, " ", COMMAND_LINE_SIZE);
+		strlcat(boot_command_line, uboot_arg, COMMAND_LINE_SIZE);
+	}
+
 	/* Save unparsed command line copy for /proc/cmdline */
 	*cmdline_p = boot_command_line;

-- 
2.7.4
