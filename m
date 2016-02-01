From: lkp@intel.com (kbuild test robot)
Date: Tue, 2 Feb 2016 04:47:07 +0800
Subject: [PATCH 2/2] irqchip: add nps Internal and external irqchips
In-Reply-To: <1454354568-15055-3-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201602020423.evMxktEv%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Noam,

[auto build test ERROR on tip/irq/core]
[cannot apply to v4.5-rc2 next-20160201]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Noam-Camus/clocksource-Add-NPS400-timers-driver/20160202-032620
config: i386-allmodconfig (attached as .config)
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-eznps.c:22:28: fatal error: soc/nps/common.h: No such file or directory
   compilation terminated.

vim +22 drivers/irqchip/irq-eznps.c

    16	
    17	#include <linux/interrupt.h>
    18	#include <linux/module.h>
    19	#include <linux/of.h>
    20	#include <linux/irqdomain.h>
    21	#include <linux/irqchip.h>
  > 22	#include <soc/nps/common.h>
    23	
    24	#undef NR_CPU_IRQS
    25	#define NR_CPU_IRQS	8  /* number of interrupt lines of NPS400 CPU */

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/octet-stream
Size: 52584 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160202/c4a3dfd6/attachment-0001.obj>
