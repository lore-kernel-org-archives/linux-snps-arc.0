From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 24 Oct 2018 18:28:38 +0000
Subject: [RFC] ARC: ARCv2: Introduce SmaRT support
References: <20181019142738.31085-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B0B4D20@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org


On 10/19/2018 07:27 AM, Eugeniy Paltsev wrote:
> Add compile-time 'ARC_USE_SMART' option for enabling SmaRT support.

Nice !

> Small real time trace (SmaRT) is an optional on-chip debug hardware
> component that captures instruction-trace history. It stores the
> address of the most recent non-sequential instructions executed into
> internal buffer.
>
> Usually we use MetaWare debugger to enable SmaRT and display trace
> information.
>
> This patch allows to display the decoded content of SmaRT buffer
> without MetaWare debugger. It is done by extending ordinary exception
> message with decoded SmaRT instruction-trace history.
>
> In some cases it's really usefull as it allows to show pre-exception
> instruction-trace which was not tainted by exception handler code,
> printk code, etc...

So the reason is not so much as lack of mdb, but to reduce the trace clutter. Its
funny because mdb goes to great lengths to generate the clutter (i.e. reconstruct
the interim disassembly from the sparse smaRT entries)

> Nevertheless this option has negative performance impact due to
> implementation as we dump SmaRT buffer content into external memory
> buffer in the begining of every slowpath exception handler code.
> We choose this implementation as a compromise between performance
> impact and SmaRT buffer tainting.
> Although the performance impact is not really significant (according
> to lmbench) we leave this option disabled by default.

Oh yes, this a debug feature and intrusive even if not shows in profiles, so needs
to be disabled by default.

> Here is th examples of user-space and kernel-space fault messages with
> 'ARC_USE_SMART' option enabled:
>
> User-space exception:
> ----------------------->8-------------------------
> Exception: u_hell[99]: at 0x103a2 [off 0x103a2 in /root/u_hell, VMA: 00010000:00012000]
>   ECR: 0x00050200 => Invalid Write @ 0x00000000 by insn @ 0x000103a2
> SmaRT (64 entries):
>  [   0]    V 0x90232358 -> 0x9022ce3c [src do_page_fault+0x2c/0x2d8] [dst populate_smart+0x0/0x9c]

So I had to dig into smart spec to understand this src, dst stuff. What it implies
is that @src PC, a branch to @dst was taken.
Say we have samples SRC1: DST1, SRC2:DST2. All this is implies is that these 4 PCs
were observed. So just flatten out the SRC/DST and print them in order. So only 1
PC entry per line. makes it easier to follow and comprehend.

>  [   1]    V 0x9022e3f8 -> 0x9023232c [src EV_TLBProtV+0xec/0xf0] [dst do_page_fault+0x0/0x2d8]
>  [   2]    V 0x90233194 -> 0x9022e30c [src do_slow_path_pf+0x10/0x14] [dst EV_TLBProtV+0x0/0xf0]
>  [   3]    V 0x90233120 -> 0x90233184 [src EV_TLBMissD+0x80/0xe0] [dst do_slow_path_pf+0x0/0x14]
>  [   4]  E V 0x000103a2 -> 0x902330a0 [off 0x103a2 in /root/u_hell, VMA: 00010000:00012000] [dst EV_TLBMissD+0x0/0xe0]
>  [   5] U  V 0x2004f238 -> 0x00010398 [off 0x43238 in /lib/libuClibc-1.0.18.so, VMA: 2000c000:20072000] [off 0x10398 in /root/u_hell, VMA: 00010000:00012000]
>  [   6] U  V 0x20049a82 -> 0x2004f214 [off 0x3da82 in /lib/libuClibc-1.0.18.so, VMA: 2000c000:20072000] [off 0x43214 in /lib/libuClibc-1.0.18.so, VMA: 2000c000:20072000]

Once we do above, then we can reduce the print clutter by only printing the vma if
it changed - again less printing means brain has to process less information.

> ...[snip]...
> ----------------------->8-------------------------
>
> TODO:
>   Add runtime procfs options to configure/suspend SmaRT.

Good.

>   Add SmaRT BCR encoding struct.
>   Check SmaRT version number in BCR.

Do we need to also think about how to co-exist with mdb. What if uses enables it
in mdb before hitting run etc.

> NOTE:
> this RFC has prerequisite:
>   http://patchwork.ozlabs.org/patch/986820/

Right I'm still not happy with our approach there and I will respond seperately
after a few trials and tribulations of my own so please be patient with that.
See below for some coding comments

>  
> +config ARC_USE_SMART

ARC_SMART_TRACE ? I know why you picked the _USE_, but the semantics are different
here.


> +	bool "Enable real time trace on-chip debug HW"

This might confused with RTT, so keep smaRT keyword here with hungarian case.

> diff --git a/arch/arc/include/asm/bug.h b/arch/arc/include/asm/bug.h
>  
> +#ifdef CONFIG_ARC_USE_SMART
> +void populate_smart(void);
> +#define POPULATE_SMART()	populate_smart()
> +#else
> +#define POPULATE_SMART()
> +#endif /* CONFIG_ARC_USE_SMART */
> +

Lets keep all smart related stuff in files of own: smart.h and smart.c

> diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
>  
>  	arc_chk_core_config();
> +
> +#ifdef CONFIG_ARC_USE_SMART

> +	if (cpuinfo_arc700[cpu_id].extn.smart)

IS_ENABLED() is better here

> +		write_aux_reg(ARC_AUX_SMART_CONTROL, SMART_CTL_EN);
> +#endif
> +
>  }
>  
> diff --git a/arch/arc/kernel/troubleshoot.c b/arch/arc/kernel/troubleshoot.c
>  
> +#ifdef CONFIG_ARC_USE_SMART
> +#define MAX_SMART_BUFF	4096
> +
> +struct smart_buff {
> +	u32 src[MAX_SMART_BUFF];
> +	u32 dst[MAX_SMART_BUFF];
> +	u32 flags[MAX_SMART_BUFF];
> +};

Move all of this into smart.c

> +#ifdef CONFIG_ARC_USE_SMART
> +static inline bool smart_exist(void)
> +{
> +	struct bcr_generic bcr;
> +
> +	READ_BCR(ARC_REG_SMART_BCR, bcr);
> +	return !!bcr.ver ;
> +}
> +
> +static inline u32 smart_stack_size(void)
> +{
> +	return read_aux_reg(ARC_REG_SMART_BCR) >> SMART_CTL_IDX_POS;
> +}
> +
> +static inline void smart_enable(void)
> +{
> +	write_aux_reg(ARC_AUX_SMART_CONTROL, SMART_CTL_EN);
> +}
> +
> +static inline void smart_disable(void)
> +{
> +	write_aux_reg(ARC_AUX_SMART_CONTROL, 0);
> +}

Good coding style.

> +
> +static void show_smart(void)
> +{
> +	struct smart_buff *smart_buff_cpu = this_cpu_ptr(&smart_buff_log);
> +	int i, stack_size;
> +	char *buf;
> +
> +	if (!smart_exist())
> +		return;
> +
> +	stack_size = smart_stack_size();
> +	pr_info("SmaRT (%d entries):\n", stack_size);
> +
> +	buf = (char *)__get_free_page(GFP_NOWAIT);
> +	if (!buf)
> +		return;
> +
> +	for (i = 0; i < stack_size; i++) {
> +		pr_info(" [%4d] %s%s%s%s %#010x -> %#010x ", i,
> +			smart_buff_cpu->flags[i] & SMART_FLAG_U ? "U" : " ",
> +			smart_buff_cpu->flags[i] & SMART_FLAG_E ? "E" : " ",
> +			smart_buff_cpu->flags[i] & SMART_FLAG_R ? "R" : " ",
> +			smart_buff_cpu->flags[i] & SMART_FLAG_V ? "V" : " ",
> +			smart_buff_cpu->src[i], smart_buff_cpu->dst[i]);
> +
> +		if (smart_buff_cpu->src[i] < 0x80000000)
> +			show_faulting_vma(smart_buff_cpu->src[i], buf);
> +		else
> +			pr_cont("[src %pS] ", (void *)smart_buff_cpu->src[i]);
> +
> +		if (smart_buff_cpu->dst[i] < 0x80000000)
> +			show_faulting_vma(smart_buff_cpu->dst[i], buf);
> +		else
> +			pr_cont("[dst %pS]\n", (void *)smart_buff_cpu->dst[i]);

Some of this changes, based on my comments above about flattening src/dst !

> @@ -199,6 +307,10 @@ void show_exception_mesg(struct pt_regs *regs)
>  		show_exception_mesg_u(regs);
>  	else
>  		show_exception_mesg_k(regs);
> +
> +#ifdef CONFIG_ARC_USE_SMART
> +	show_smart();
> +#endif /* CONFIG_ARC_USE_SMART */

Provide 2 variants in header to avoid #ifdef here.
