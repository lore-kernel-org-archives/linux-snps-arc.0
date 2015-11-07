From: tglx@linutronix.de (Thomas Gleixner)
Date: Sat, 7 Nov 2015 12:38:19 +0100 (CET)
Subject: [PATCH v2 04/19] irqchip: add nps Internal and external irqchips
In-Reply-To: <1446893557-29748-5-git-send-email-noamc@ezchip.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446893557-29748-5-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.11.1511071227030.4032@nanos>
To: linux-snps-arc@lists.infradead.org

On Sat, 7 Nov 2015, Noam Camus wrote:
> +#define NPS_MSU_EN_CFG	0x80
> +
> +/* Messaging and Scheduling Unit:
> + * Provides message management for a CPU cluster.
> + */
> +static void __init eznps_configure_msu(void)
> +{
> +	int cpu;
> +	struct nps_host_reg_msu_en_cfg {
> +		union {
> +			struct {
> +				u32     __reserved1:11,
> +				rtc_en:1, ipc_en:1, gim_1_en:1,
> +				gim_0_en:1, ipi_en:1, buff_e_rls_bmuw:1,
> +				buff_e_alc_bmuw:1, buff_i_rls_bmuw:1,
> +				buff_i_alc_bmuw:1, buff_e_rls_bmue:1,
> +				buff_e_alc_bmue:1, buff_i_rls_bmue:1,
> +				buff_i_alc_bmue:1, __reserved2:1,
> +				buff_e_pre_en:1, buff_i_pre_en:1,
> +				pmuw_ja_en:1, pmue_ja_en:1,
> +				pmuw_nj_en:1, pmue_nj_en:1, msu_en:1;
> +			};
> +			u32 value;
> +		};
> +	};
> +	struct nps_host_reg_msu_en_cfg msu_en_cfg = {.value = 0};
> +
> +	msu_en_cfg.msu_en = 1;
> +	msu_en_cfg.ipi_en = 1;
> +	msu_en_cfg.gim_0_en = 1;
> +	msu_en_cfg.gim_1_en = 1;

Yuck. What's wrong with:

#define GIM_1_EN	(1 << 13)
#define GIM_0_EN	(1 << 14)
#define IPI_EN		(1 << 15)
#define MSU_EN		(1 << 31)

	u32 val = GIM_1_EN | GIM_0_EN | IPI_EN | MSU_EN;

Hmm?

> +/* Global Interrupt Manager:
> + * Configures and manages up to 64 interrupts from peripherals,
> + * 16 interrupts from CPUs (virtual interrupts) and ECC interrupts.
> + * Receives the interrupts and transmits them to relevant CPU.
> + */
> +static void __init eznps_configure_gim(void)
> +{
> +	u32 reg_value;
> +	u32 gim_int_lines;
> +	struct nps_host_reg_gim_p_int_dst gim_p_int_dst = {.value = 0};
> +
> +	gim_int_lines = NPS_GIM_UART_LINE;
> +	gim_int_lines |= NPS_GIM_DBG_LAN_TX_DONE_LINE;
> +	gim_int_lines |= NPS_GIM_DBG_LAN_RX_RDY_LINE;
> +
> +	/*
> +	 * IRQ polarity
> +	 * low or high level
> +	 * negative or positive edge
> +	 */
> +	reg_value = ioread32be(REG_GIM_P_INT_POL_0);
> +	reg_value &= ~gim_int_lines;
> +	iowrite32be(reg_value, REG_GIM_P_INT_POL_0);
> +
> +	/* IRQ type level or edge */
> +	reg_value = ioread32be(REG_GIM_P_INT_SENS_0);
> +	reg_value |= NPS_GIM_DBG_LAN_TX_DONE_LINE;
> +	iowrite32be(reg_value, REG_GIM_P_INT_SENS_0);
> +
> +	/*
> +	 * GIM interrupt select type for
> +	 * dbg_lan TX and RX interrupts
> +	 * should be type 1
> +	 * type 0 = IRQ line 6
> +	 * type 1 = IRQ line 7
> +	 */
> +	gim_p_int_dst.is = 1;

More magic structs to set a single bit, right?

> +/*
> + * NPS400 core includes a Interrupt Controller (IC) support.
> + * All cores can deactivate level irqs at first level control
> + * at cores mesh layer called MTM.
> + * For devices out side chip e.g. uart, network there is another
> + * level called Global Interrupt Manager (GIM).
> + * This second level can control level and edge interrupt.
> + */
> +
> +static void nps400_irq_mask(struct irq_data *data)
> +{
> +	unsigned int ienb;
> +
> +	ienb = read_aux_reg(AUX_IENABLE);
> +	ienb &= ~(1 << data->irq);

You should not rely on data->irq ever. It's the Linux interrupt number
and it does not necessarily have a 1:1 mapping to the hardware
interrupt number. Its working for legacy domains, but there
data->hwirq is set up for you as well.

> +	write_aux_reg(AUX_IENABLE, ienb);

I can see how that works for per cpu interrupts, but what happens if
two cpus run that concurrent for two different interrupts?

Thanks,

	tglx
