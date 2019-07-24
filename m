From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 24 Jul 2019 10:47:31 +0000
Subject: [PATCH 1/2] ARCv2: IDU-intc: Add support for edge-triggered
 interrupts
In-Reply-To: <20190723102606.309089-1-mischa.jonker@synopsys.com>
References: <20190723102606.309089-1-mischa.jonker@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CY4PR1201MB0120EDD4173511912A9FC99EA1C60@CY4PR1201MB0120.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Mischa,

> -----Original Message-----
> From: Mischa Jonker <mischa.jonker at synopsys.com>
> Sent: Tuesday, July 23, 2019 1:26 PM
> To: Vineet Gupta <vgupta at synopsys.com>; Alexey Brodkin <abrodkin at synopsys.com>;
> kstewart at linuxfoundation.org; tglx at linutronix.de; robh+dt at kernel.org; linux-snps-
> arc at lists.infradead.org; linux-kernel at vger.kernel.org; devicetree at vger.kernel.org
> Cc: Mischa Jonker <mischa.jonker at synopsys.com>
> Subject: [PATCH 1/2] ARCv2: IDU-intc: Add support for edge-triggered interrupts
> 
> This adds support for an optional extra interrupt cell to specify edge
> vs level triggered. It is backward compatible with dts files with only
> one cell, and will default to level-triggered in such a case.

In general LGTM. Still a couple of comments.

It might be useful to explain changes
made to idu_irq_set_affinity() as it's not immediately clear what affinity
has to do with IRQ modes (in theory it should be orthogonal).

But what happens we're actually fixing previously implemented short-cut
when instead of a separately set IRQ mode we were doing it together with
setup of distribution since it's done with the same one command
(anyways we relied on the one and only IRQ type being supported).

And now we have a proper implementation with separated setup of IRQ mode and
affinity.

>  static int
>  idu_irq_set_affinity(struct irq_data *data, const struct cpumask *cpumask,
>  		     bool force)
> @@ -263,13 +285,32 @@ idu_irq_set_affinity(struct irq_data *data, const struct cpumask *cpumask,
>  	else
>  		distribution_mode = IDU_M_DISTRI_RR;
> 
> -	idu_set_mode(data->hwirq, IDU_M_TRIG_LEVEL, distribution_mode);
> +	idu_set_mode(data->hwirq, false, 0, true, distribution_mode);
> 
>  	raw_spin_unlock_irqrestore(&mcip_lock, flags);
> 
>  	return IRQ_SET_MASK_OK;
>  }
> 
> +static int idu_irq_set_type(struct irq_data *data, u32 type)
> +{
> +	unsigned long flags;
> +
> +	if (type & ~(IRQ_TYPE_EDGE_RISING | IRQ_TYPE_LEVEL_HIGH))
> +		return -EINVAL;

Maybe add an explanation why only these types are supported?

-Alexey
