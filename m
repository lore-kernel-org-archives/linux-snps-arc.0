From: lkp@intel.com (kbuild test robot)
Date: Fri, 4 Nov 2016 08:40:20 +0800
Subject: [PATCH v3 07/10] ARC: breakout aux handling into a separate header
In-Reply-To: <1478216015-18931-8-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201611040843.A8Q0VBao%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

[auto build test ERROR on linus/master]
[also build test ERROR on v4.9-rc3 next-20161028]
[cannot apply to arc/for-next]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Vineet-Gupta/Move-ARC-timer-code-into-drivers-clocksource/20161104-074042
config: i386-allmodconfig (attached as .config)
compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All errors (new ones prefixed by >>):

   drivers/irqchip/irq-eznps.c: In function 'nps400_irq_mask':
>> drivers/irqchip/irq-eznps.c:61:22: error: 'AUX_IENABLE' undeclared (first use in this function)
     ienb = read_aux_reg(AUX_IENABLE);
                         ^~~~~~~~~~~
   drivers/irqchip/irq-eznps.c:61:22: note: each undeclared identifier is reported only once for each function it appears in
   drivers/irqchip/irq-eznps.c: In function 'nps400_irq_unmask':
   drivers/irqchip/irq-eznps.c:71:22: error: 'AUX_IENABLE' undeclared (first use in this function)
     ienb = read_aux_reg(AUX_IENABLE);
                         ^~~~~~~~~~~
   drivers/irqchip/irq-eznps.c: In function 'nps400_irq_eoi_global':
>> drivers/irqchip/irq-eznps.c:80:16: error: 'CTOP_AUX_IACK' undeclared (first use in this function)
     write_aux_reg(CTOP_AUX_IACK, 1 << irq);
                   ^~~~~~~~~~~~~
   drivers/irqchip/irq-eznps.c: In function 'nps400_irq_ack':
   drivers/irqchip/irq-eznps.c:92:16: error: 'CTOP_AUX_IACK' undeclared (first use in this function)
     write_aux_reg(CTOP_AUX_IACK, 1 << irq);
                   ^~~~~~~~~~~~~

vim +/AUX_IENABLE +61 drivers/irqchip/irq-eznps.c

44df427c8 Noam Camus 2015-10-29  55  
44df427c8 Noam Camus 2015-10-29  56  static void nps400_irq_mask(struct irq_data *irqd)
44df427c8 Noam Camus 2015-10-29  57  {
44df427c8 Noam Camus 2015-10-29  58  	unsigned int ienb;
44df427c8 Noam Camus 2015-10-29  59  	unsigned int irq = irqd_to_hwirq(irqd);
44df427c8 Noam Camus 2015-10-29  60  
44df427c8 Noam Camus 2015-10-29 @61  	ienb = read_aux_reg(AUX_IENABLE);
44df427c8 Noam Camus 2015-10-29  62  	ienb &= ~(1 << irq);
44df427c8 Noam Camus 2015-10-29  63  	write_aux_reg(AUX_IENABLE, ienb);
44df427c8 Noam Camus 2015-10-29  64  }
44df427c8 Noam Camus 2015-10-29  65  
44df427c8 Noam Camus 2015-10-29  66  static void nps400_irq_unmask(struct irq_data *irqd)
44df427c8 Noam Camus 2015-10-29  67  {
44df427c8 Noam Camus 2015-10-29  68  	unsigned int ienb;
44df427c8 Noam Camus 2015-10-29  69  	unsigned int irq = irqd_to_hwirq(irqd);
44df427c8 Noam Camus 2015-10-29  70  
44df427c8 Noam Camus 2015-10-29  71  	ienb = read_aux_reg(AUX_IENABLE);
44df427c8 Noam Camus 2015-10-29  72  	ienb |= (1 << irq);
44df427c8 Noam Camus 2015-10-29  73  	write_aux_reg(AUX_IENABLE, ienb);
44df427c8 Noam Camus 2015-10-29  74  }
44df427c8 Noam Camus 2015-10-29  75  
44df427c8 Noam Camus 2015-10-29  76  static void nps400_irq_eoi_global(struct irq_data *irqd)
44df427c8 Noam Camus 2015-10-29  77  {
44df427c8 Noam Camus 2015-10-29  78  	unsigned int __maybe_unused irq = irqd_to_hwirq(irqd);
44df427c8 Noam Camus 2015-10-29  79  
44df427c8 Noam Camus 2015-10-29 @80  	write_aux_reg(CTOP_AUX_IACK, 1 << irq);
44df427c8 Noam Camus 2015-10-29  81  
44df427c8 Noam Camus 2015-10-29  82  	/* Don't ack GIC before all device access attempts are done */
44df427c8 Noam Camus 2015-10-29  83  	mb();

:::::: The code at line 61 was first introduced by commit
:::::: 44df427c894a4357e43bb35769baefa7cdf09833 irqchip: add nps Internal and external irqchips

:::::: TO: Noam Camus <noamc at ezchip.com>
:::::: CC: Vineet Gupta <vgupta at synopsys.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 56826 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20161104/bddf77d4/attachment-0001.gz>
