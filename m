From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 5 Dec 2018 18:09:57 +0000
Subject: [PATCH 2/5] ARC: perf: introduce Kernel PMU events support
References: <20181205170609.18690-1-Eugeniy.Paltsev@synopsys.com>
 <20181205170609.18690-3-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014641B980@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/5/18 9:06 AM, Eugeniy Paltsev wrote:
> Export all available ARC architected hardware events as
> kernel PMU events to make non-generic events accessible.
>
> ARC PMU HW allow us to read the list of all available
> events names. So we generate kernel PMU event list
> dynamically in arc_pmu_device_probe() using
> human-readable events names we got from HW instead of
> using pre-defined events list.
>
> -------------------------->8--------------------------
> $ perf list
>   [snip]
>   arc_pmu/bdata64/                  [Kernel PMU event]
>   arc_pmu/bdcstall/                 [Kernel PMU event]
>   arc_pmu/bdslot/                   [Kernel PMU event]
>   arc_pmu/bfbmp/                    [Kernel PMU event]
>   arc_pmu/bfirqex/                  [Kernel PMU event]
>   arc_pmu/bflgstal/                 [Kernel PMU event]
>   arc_pmu/bflush/                   [Kernel PMU event]

Lets call this pct iso pmu since pmu has more of power mgmt connotation. I know
the code has pmu littered all over but atleast the user interface could be more
intuitive.

BTW this approach seems more user friendly and is different from Alexey's earlier
stab at implementing raw events [1]. He didn't keep around any list (and relied on
use rlooking in the PRM to find his interesting event of the day) and pass as
*r*foobar.  PeterZ at the time had some reservations with that which I never fully
understood.

[1] https://lore.kernel.org/patchwork/patch/568769/

> -------------------------->8--------------------------
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
>  arch/arc/kernel/perf_event.c | 107 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 106 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
> index 811a07a2ca21..97b88b00c418 100644
> --- a/arch/arc/kernel/perf_event.c
> +++ b/arch/arc/kernel/perf_event.c
> @@ -22,12 +22,28 @@
>  /* HW holds 8 symbols + one for null terminator */
>  #define ARCPMU_EVENT_NAME_LEN	9
>  
> +enum arc_pmu_attr_groups {
> +	ARCPMU_ATTR_GR_EVENTS,
> +	ARCPMU_ATTR_GR_FORMATS,
> +	ARCPMU_NR_ATTR_GR
> +};
> +
> +struct arc_pmu_raw_event_entry {
> +	char name[ARCPMU_EVENT_NAME_LEN];
> +};
> +
>  struct arc_pmu {
>  	struct pmu	pmu;
>  	unsigned int	irq;
>  	int		n_counters;
> +	int		n_events;
>  	u64		max_period;
>  	int		ev_hw_idx[PERF_COUNT_ARC_HW_MAX];
> +
> +	struct arc_pmu_raw_event_entry	*raw_entry;
> +	struct attribute		**attrs;
> +	struct perf_pmu_events_attr	*attr;
> +	const struct attribute_group	*attr_groups[ARCPMU_NR_ATTR_GR + 1];
>  };
>  
>  struct arc_pmu_cpu {
> @@ -196,6 +212,17 @@ static int arc_pmu_event_init(struct perf_event *event)
>  			 (int)hwc->config, arc_pmu_ev_hw_map[ret]);
>  		return 0;
>  
> +	case PERF_TYPE_RAW:
> +		if (event->attr.config >= arc_pmu->n_events)
> +			return -ENOENT;
> +
> +		hwc->config |= event->attr.config;
> +		pr_debug("init raw event with idx %lld \'%s\'\n",
> +			 event->attr.config,
> +			 arc_pmu->raw_entry[event->attr.config].name);
> +
> +		return 0;
> +
>  	default:
>  		return -ENOENT;
>  	}
> @@ -446,6 +473,68 @@ static void arc_cpu_pmu_irq_init(void *data)
>  	write_aux_reg(ARC_REG_PCT_INT_ACT, 0xffffffff);
>  }
>  
> +/* Event field occupies the bottom 15 bits of our config field */
> +PMU_FORMAT_ATTR(event, "config:0-14");
> +static struct attribute *arc_pmu_format_attrs[] = {
> +	&format_attr_event.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group arc_pmu_format_attr_gr = {
> +	.name = "format",
> +	.attrs = arc_pmu_format_attrs,
> +};
> +
> +static ssize_t
> +arc_pmu_events_sysfs_show(struct device *dev,
> +			  struct device_attribute *attr, char *page)
> +{
> +	struct perf_pmu_events_attr *pmu_attr;
> +
> +	pmu_attr = container_of(attr, struct perf_pmu_events_attr, attr);
> +	return sprintf(page, "event=0x%04llx\n", pmu_attr->id);
> +}
> +
> +/*
> + * We don't add attrs here as we don't have pre-defined list of perf events.
> + * We will generate and add attrs dynamically in probe() after we read HW
> + * configuration.
> + */
> +static struct attribute_group arc_pmu_events_attr_gr = {
> +	.name = "events",
> +};
> +
> +static void arc_pmu_add_raw_event_attr(int j, char *str)
> +{
> +	memmove(arc_pmu->raw_entry[j].name, str, ARCPMU_EVENT_NAME_LEN - 1);
> +	arc_pmu->attr[j].attr.attr.name = arc_pmu->raw_entry[j].name;
> +	arc_pmu->attr[j].attr.attr.mode = VERIFY_OCTAL_PERMISSIONS(0444);
> +	arc_pmu->attr[j].attr.show = arc_pmu_events_sysfs_show;
> +	arc_pmu->attr[j].id = j;
> +	arc_pmu->attrs[j] = &(arc_pmu->attr[j].attr.attr);
> +}
> +
> +static int arc_pmu_raw_alloc(struct device *dev)
> +{
> +	arc_pmu->attr = devm_kmalloc_array(dev, arc_pmu->n_events + 1,
> +		sizeof(struct perf_pmu_events_attr), GFP_KERNEL | __GFP_ZERO);
> +	if (!arc_pmu->attr)
> +		return -ENOMEM;
> +
> +	arc_pmu->attrs = devm_kmalloc_array(dev, arc_pmu->n_events + 1,
> +		sizeof(*arc_pmu->attrs), GFP_KERNEL | __GFP_ZERO);
> +	if (!arc_pmu->attrs)
> +		return -ENOMEM;
> +
> +	arc_pmu->raw_entry = devm_kmalloc_array(dev, arc_pmu->n_events,
> +		sizeof(struct arc_pmu_raw_event_entry),
> +		GFP_KERNEL | __GFP_ZERO);
> +	if (!arc_pmu->raw_entry)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
>  static int arc_pmu_device_probe(struct platform_device *pdev)
>  {
>  	struct arc_reg_pct_build pct_bcr;
> @@ -477,6 +566,11 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
>  	if (!arc_pmu)
>  		return -ENOMEM;
>  
> +	arc_pmu->n_events = cc_bcr.c;
> +
> +	if (arc_pmu_raw_alloc(&pdev->dev))
> +		return -ENOMEM;
> +
>  	has_interrupts = is_isa_arcv2() ? pct_bcr.i : 0;
>  
>  	arc_pmu->n_counters = pct_bcr.c;
> @@ -508,8 +602,14 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
>  				arc_pmu->ev_hw_idx[i] = j;
>  			}
>  		}
> +
> +		arc_pmu_add_raw_event_attr(j, cc_name.str);
>  	}
>  
> +	arc_pmu_events_attr_gr.attrs = arc_pmu->attrs;
> +	arc_pmu->attr_groups[ARCPMU_ATTR_GR_EVENTS] = &arc_pmu_events_attr_gr;
> +	arc_pmu->attr_groups[ARCPMU_ATTR_GR_FORMATS] = &arc_pmu_format_attr_gr;
> +
>  	arc_pmu->pmu = (struct pmu) {
>  		.pmu_enable	= arc_pmu_enable,
>  		.pmu_disable	= arc_pmu_disable,
> @@ -519,6 +619,7 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
>  		.start		= arc_pmu_start,
>  		.stop		= arc_pmu_stop,
>  		.read		= arc_pmu_read,
> +		.attr_groups	= arc_pmu->attr_groups,
>  	};
>  
>  	if (has_interrupts) {
> @@ -540,7 +641,11 @@ static int arc_pmu_device_probe(struct platform_device *pdev)
>  	} else
>  		arc_pmu->pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
>  
> -	return perf_pmu_register(&arc_pmu->pmu, pdev->name, PERF_TYPE_RAW);
> +	/*
> +	 * perf parser doesn't really like '-' symbol in events name, so let's
> +	 * use '_' in arc pmu name as it goes to kernel PMU event prefix.
> +	 */
> +	return perf_pmu_register(&arc_pmu->pmu, "arc_pmu", PERF_TYPE_RAW);
>  }
>  
>  #ifdef CONFIG_OF
