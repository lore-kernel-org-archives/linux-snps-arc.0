From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 23 Nov 2016 12:33:04 -0800
Subject: [PATCH] ARCv2: MCIP: Deprecate setting of affinity in Device Tree
In-Reply-To: <8548fefd-15e1-5ce4-0e23-05022286841f@arm.com>
References: <1478875124-23787-1-git-send-email-yuriy.kolerov@synopsys.com>
 <d5cb9467-a6d7-e47d-7b25-15396c4d65cb@arm.com>
 <3ABF60118B9B784CA5BF7C841D2F00EC0101D90B@de02wembxa.internal.synopsys.com>
 <8548fefd-15e1-5ce4-0e23-05022286841f@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56a05936-ab5c-da79-39b9-571ec708f3b9@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/22/2016 03:22 AM, Marc Zyngier wrote:
>> 2. The kernel will not call idu_irq_set_affinity() for IDU interrupt
>> > controller in some cases. It happens when the top interrupt
>> > controller does not support setting of the affinity and does not even
>> > support propagating of it (e.g. a GPIO interrupt controller on top of
>> > IDU which funnels all interrupts in one line). However
>> > idu_irq_set_affinity() must be called to unmask common interrupts in
>> > IDU. And if I want to make an affinity in irq_desc to match a real
>> > affinity I must call irq_set_affinity() instead of just
>> > idu_irq_set_affinity() .
>
> My brain has just melted. Can you describe this a bit more, possibly
> using some ASCII diagrams? I really don't understand what the affinity
> settings have to do with unmasking the interrupt... It is that you mask
> an interrupt by routing it to a dummy CPU?

The AXS SDP board has an "interesting" cascade of interrupt controllers.
Exact setup in arch/arc/boot/dts/{axc003_idu,axs10x_mb}.dtsi


	/*
	 * Peripherals on CPU Card and Mother Board are wired to cpu intc via
	 * intermediate DW APB GPIO blocks (mainly for debouncing)
	 *
	 *        --------------------
	 *        |  snps,archs-intc |
	 *        --------------------
	 *          | #24   	  |#25
	 * 	  --------------------
	 * 	  |  snps,archs-intc |
	 * 	  --------------------
	 *          | #0          | #1
	 * -------------------   -------------------
	 * | snps,dw-apb-gpio |  | snps,dw-apb-gpio |
	 * |   (pass thru)    |  |                  |
	 * -------------------   -------------------
	 *        | #12                     |
	 *        |                 [ Debug UART on cpu card ]
	 *        |
	 * ------------------------
	 * | snps,dw-apb-intc (MB)|
	 * ------------------------
	 *  |      |       |      |
	 * [eth] [uart]        [... other perip on Main Board]
