From: lkp@intel.com (kbuild test robot)
Date: Tue, 2 Feb 2016 04:24:43 +0800
Subject: [PATCH 1/2] clocksource: Add NPS400 timers driver
In-Reply-To: <1454354568-15055-2-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201602020445.toAbYwJR%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Noam,

[auto build test ERROR on tip/irq/core]
[also build test ERROR on v4.5-rc2 next-20160201]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Noam-Camus/clocksource-Add-NPS400-timers-driver/20160202-032620
config: i386-allmodconfig (attached as .config)
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All errors (new ones prefixed by >>):

>> drivers/clocksource/timer-nps.c:24:28: fatal error: soc/nps/common.h: No such file or directory
   compilation terminated.

vim +24 drivers/clocksource/timer-nps.c

    18	#include <linux/clocksource.h>
    19	#include <linux/clockchips.h>
    20	#include <linux/clk.h>
    21	#include <linux/of.h>
    22	#include <linux/of_irq.h>
    23	#include <linux/cpu.h>
  > 24	#include <soc/nps/common.h>
    25	
    26	#define NPS_MSU_TICK_LOW	0xC8
    27	#define NPS_CLUSTER_OFFSET	8

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/octet-stream
Size: 52576 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160202/03f98bf3/attachment-0001.obj>
