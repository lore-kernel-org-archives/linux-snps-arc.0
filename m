From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 6 Oct 2016 09:10:53 +0000
Subject: [PATCH] ARCv2: intc: untangle SMP, MCIP and IDU
In-Reply-To: <1475699962-11711-1-git-send-email-vgupta@synopsys.com>
References: <1475699962-11711-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1475745033.3301.5.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Wed, 2016-10-05@13:39 -0700, Vineet Gupta wrote:
> The IDU intc is technically part of MCIP (Multi-core IP) hence
> historically was only available in a SMP hardware build (and thus only
> in a SMP kernel build). Now that hardware restriction has been lifted,
> so a UP kernel needs to support it.
> 
> This requires breaking mcip.c into parts which are strictly SMP
> (inter-core interrupts) and IDU which in reality is just another
> intc and thus has no bearing on SMP.
> 
> This change allows IDU in UP builds and with a suitable device tree, we
> can have the cascaded intc system
> 
> ????ARCv2 core intc <---> ARCv2 IDU intc <---> periperals
> 
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---

[snip]
?
> +struct mcip_bcr {
> +#ifdef CONFIG_CPU_BIG_ENDIAN
> +		unsigned int pad3:8,
> +			?????idu:1, llm:1, num_cores:6,
> +			?????iocoh:1,??gfrc:1, dbg:1, pad2:1,
> +			?????msg:1, sem:1, ipi:1, pad:1,
> +			?????ver:8;
> +#else
> +		unsigned int ver:8,
> +			?????pad:1, ipi:1, sem:1, msg:1,
> +			?????pad2:1, dbg:1, gfrc:1, iocoh:1,
> +			?????num_cores:6, llm:1, idu:1,
> +			?????pad3:8;
> +#endif
> +};

IMHO we should stop using this kind of constructions because they
are ugly and what's more important not portable.

Even though we have it now working for both LE and BE configurations
it won't work for 64-bit cores. We'll need to add ifdeffed 32-bit paddings
then which will make that construction even more ugly.

Probably that's not the right patch to address my complaint but just
to reiterate this topic once again and think about clean-up series on
that regard :)

-Alexey
