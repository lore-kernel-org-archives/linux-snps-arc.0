From: lkp@intel.com (kbuild test robot)
Date: Wed, 3 Feb 2016 04:40:37 +0800
Subject: [PATCH v2 3/3] irqchip: add nps Internal and external irqchips
In-Reply-To: <1454418899-25500-4-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201602030452.miMbIEhu%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Noam,

[auto build test ERROR on tip/irq/core]
[cannot apply to v4.5-rc2 next-20160202]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Noam-Camus/Adding-NPS400-drivers/20160202-213530
config: arm-allmodconfig (attached as .config)
reproduce:
        wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=arm 

All error/warnings (new ones prefixed by >>):

   drivers/irqchip/irq-eznps.c: In function 'nps400_irq_mask':
>> drivers/irqchip/irq-eznps.c:43:2: error: implicit declaration of function 'irqd_to_hwirq' [-Werror=implicit-function-declaration]
     unsigned int irq = irqd_to_hwirq(irqd);
     ^
   drivers/irqchip/irq-eznps.c: At top level:
>> drivers/irqchip/irq-eznps.c:85:15: error: variable 'nps400_irq_chip_fasteoi' has initializer but incomplete type
    static struct irq_chip nps400_irq_chip_fasteoi = {
                  ^
>> drivers/irqchip/irq-eznps.c:86:2: error: unknown field 'name' specified in initializer
     .name  = "NPS400 IC Global",
     ^
>> drivers/irqchip/irq-eznps.c:86:2: warning: excess elements in struct initializer
   drivers/irqchip/irq-eznps.c:86:2: warning: (near initialization for 'nps400_irq_chip_fasteoi')
>> drivers/irqchip/irq-eznps.c:87:2: error: unknown field 'irq_mask' specified in initializer
     .irq_mask = nps400_irq_mask,
     ^
   drivers/irqchip/irq-eznps.c:87:2: warning: excess elements in struct initializer
   drivers/irqchip/irq-eznps.c:87:2: warning: (near initialization for 'nps400_irq_chip_fasteoi')
>> drivers/irqchip/irq-eznps.c:88:2: error: unknown field 'irq_unmask' specified in initializer
     .irq_unmask = nps400_irq_unmask,
     ^
   drivers/irqchip/irq-eznps.c:88:2: warning: excess elements in struct initializer
   drivers/irqchip/irq-eznps.c:88:2: warning: (near initialization for 'nps400_irq_chip_fasteoi')
>> drivers/irqchip/irq-eznps.c:89:2: error: unknown field 'irq_eoi' specified in initializer
     .irq_eoi = nps400_irq_eoi_global,
     ^
   drivers/irqchip/irq-eznps.c:89:2: warning: excess elements in struct initializer
   drivers/irqchip/irq-eznps.c:89:2: warning: (near initialization for 'nps400_irq_chip_fasteoi')
>> drivers/irqchip/irq-eznps.c:92:15: error: variable 'nps400_irq_chip_percpu' has initializer but incomplete type
    static struct irq_chip nps400_irq_chip_percpu = {
                  ^
   drivers/irqchip/irq-eznps.c:93:2: error: unknown field 'name' specified in initializer
     .name  = "NPS400 IC",
     ^
   drivers/irqchip/irq-eznps.c:93:2: warning: excess elements in struct initializer
   drivers/irqchip/irq-eznps.c:93:2: warning: (near initialization for 'nps400_irq_chip_percpu')
   drivers/irqchip/irq-eznps.c:94:2: error: unknown field 'irq_mask' specified in initializer
     .irq_mask = nps400_irq_mask,
     ^
   drivers/irqchip/irq-eznps.c:94:2: warning: excess elements in struct initializer
   drivers/irqchip/irq-eznps.c:94:2: warning: (near initialization for 'nps400_irq_chip_percpu')
   drivers/irqchip/irq-eznps.c:95:2: error: unknown field 'irq_unmask' specified in initializer
     .irq_unmask = nps400_irq_unmask,
     ^
   drivers/irqchip/irq-eznps.c:95:2: warning: excess elements in struct initializer
   drivers/irqchip/irq-eznps.c:95:2: warning: (near initialization for 'nps400_irq_chip_percpu')
   drivers/irqchip/irq-eznps.c:96:2: error: unknown field 'irq_eoi' specified in initializer
     .irq_eoi = nps400_irq_eoi,
     ^
   drivers/irqchip/irq-eznps.c:96:2: warning: excess elements in struct initializer
   drivers/irqchip/irq-eznps.c:96:2: warning: (near initialization for 'nps400_irq_chip_percpu')
   drivers/irqchip/irq-eznps.c: In function 'nps400_irq_map':
>> drivers/irqchip/irq-eznps.c:107:3: error: implicit declaration of function 'irq_set_percpu_devid' [-Werror=implicit-function-declaration]
      irq_set_percpu_devid(virq);
      ^
>> drivers/irqchip/irq-eznps.c:108:3: error: implicit declaration of function 'irq_set_chip_and_handler' [-Werror=implicit-function-declaration]
      irq_set_chip_and_handler(virq, &nps400_irq_chip_percpu,
      ^
>> drivers/irqchip/irq-eznps.c:109:7: error: 'handle_percpu_devid_irq' undeclared (first use in this function)
          handle_percpu_devid_irq);
          ^
   drivers/irqchip/irq-eznps.c:109:7: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/irqchip/irq-eznps.c:113:7: error: 'handle_fasteoi_irq' undeclared (first use in this function)
          handle_fasteoi_irq);
          ^
   cc1: some warnings being treated as errors

vim +/irqd_to_hwirq +43 drivers/irqchip/irq-eznps.c

    37	 * with private HW copy per CPU.
    38	 */
    39	
    40	static void nps400_irq_mask(struct irq_data *irqd)
    41	{
    42		unsigned int ienb;
  > 43		unsigned int irq = irqd_to_hwirq(irqd);
    44	
    45		ienb = read_aux_reg(AUX_IENABLE);
    46		ienb &= ~(1 << irq);
    47		write_aux_reg(AUX_IENABLE, ienb);
    48	}
    49	
    50	static void nps400_irq_unmask(struct irq_data *irqd)
    51	{
    52		unsigned int ienb;
    53		unsigned int irq = irqd_to_hwirq(irqd);
    54	
    55		ienb = read_aux_reg(AUX_IENABLE);
    56		ienb |= (1 << irq);
    57		write_aux_reg(AUX_IENABLE, ienb);
    58	}
    59	
    60	static void nps400_irq_eoi_global(struct irq_data *irqd)
    61	{
    62		unsigned int __maybe_unused irq = irqd_to_hwirq(irqd);
    63	
    64		write_aux_reg(CTOP_AUX_IACK, 1 << irq);
    65	
    66		/* Don't ack before all device access attempts are done */
    67		mb();
    68	
    69	#ifdef __arc__
    70		__asm__ __volatile__ (
    71		"       .word %0\n"
    72		:
    73		: "i"(CTOP_INST_RSPI_GIC_0_R12)
    74		: "memory");
    75	#endif
    76	}
    77	
    78	static void nps400_irq_eoi(struct irq_data *irqd)
    79	{
    80		unsigned int __maybe_unused irq = irqd_to_hwirq(irqd);
    81	
    82		write_aux_reg(CTOP_AUX_IACK, 1 << irq);
    83	}
    84	
  > 85	static struct irq_chip nps400_irq_chip_fasteoi = {
  > 86		.name		= "NPS400 IC Global",
  > 87		.irq_mask	= nps400_irq_mask,
  > 88		.irq_unmask	= nps400_irq_unmask,
  > 89		.irq_eoi	= nps400_irq_eoi_global,
    90	};
    91	
  > 92	static struct irq_chip nps400_irq_chip_percpu = {
    93		.name		= "NPS400 IC",
    94		.irq_mask	= nps400_irq_mask,
  > 95		.irq_unmask	= nps400_irq_unmask,
  > 96		.irq_eoi	= nps400_irq_eoi,
    97	};
    98	
    99	static int nps400_irq_map(struct irq_domain *d, unsigned int virq,
   100				  irq_hw_number_t hw)
   101	{
   102		switch (hw) {
   103		case TIMER0_IRQ:
   104	#ifdef CONFIG_SMP
   105		case IPI_IRQ:
   106	#endif
 > 107			irq_set_percpu_devid(virq);
 > 108			irq_set_chip_and_handler(virq, &nps400_irq_chip_percpu,
 > 109						 handle_percpu_devid_irq);
   110		break;
   111		default:
   112			irq_set_chip_and_handler(virq, &nps400_irq_chip_fasteoi,
 > 113						 handle_fasteoi_irq);
   114		break;
   115		}
   116	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/octet-stream
Size: 54615 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160203/33724ff0/attachment-0001.obj>
