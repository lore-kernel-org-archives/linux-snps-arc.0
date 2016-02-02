From: lkp@intel.com (kbuild test robot)
Date: Tue, 2 Feb 2016 22:36:13 +0800
Subject: [PATCH v2 2/3] clocksource: Add NPS400 timers driver
In-Reply-To: <1454418899-25500-3-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201602022210.NRpZdezG%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Noam,

[auto build test WARNING on tip/irq/core]
[also build test WARNING on v4.5-rc2 next-20160201]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/Noam-Camus/Adding-NPS400-drivers/20160202-213530
config: x86_64-allmodconfig (attached as .config)
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

All warnings (new ones prefixed by >>):

   In file included from drivers/clocksource/timer-nps.c:24:0:
   include/soc/nps/common.h: In function 'nps_host_reg_non_cl':
>> include/soc/nps/common.h:122:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     return (void *)reg_address.value;
            ^
   include/soc/nps/common.h: In function 'nps_host_reg':
   include/soc/nps/common.h:136:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     return (void *)reg_address.value;
            ^

vim +122 include/soc/nps/common.h

f44c724c Noam Camus 2016-02-02  106  	union {
f44c724c Noam Camus 2016-02-02  107  		struct {
f44c724c Noam Camus 2016-02-02  108  			u32 base:7, blkid:11, reg:12, __reserved:2;
f44c724c Noam Camus 2016-02-02  109  		};
f44c724c Noam Camus 2016-02-02  110  		u32 value;
f44c724c Noam Camus 2016-02-02  111  	};
f44c724c Noam Camus 2016-02-02  112  };
f44c724c Noam Camus 2016-02-02  113  
f44c724c Noam Camus 2016-02-02  114  static inline void *nps_host_reg_non_cl(u32 blkid, u32 reg)
f44c724c Noam Camus 2016-02-02  115  {
f44c724c Noam Camus 2016-02-02  116  	struct nps_host_reg_address_non_cl reg_address;
f44c724c Noam Camus 2016-02-02  117  
f44c724c Noam Camus 2016-02-02  118  	reg_address.value = NPS_HOST_REG_BASE;
f44c724c Noam Camus 2016-02-02  119  	reg_address.blkid = blkid;
f44c724c Noam Camus 2016-02-02  120  	reg_address.reg = reg;
f44c724c Noam Camus 2016-02-02  121  
f44c724c Noam Camus 2016-02-02 @122  	return (void *)reg_address.value;
f44c724c Noam Camus 2016-02-02  123  }
f44c724c Noam Camus 2016-02-02  124  
f44c724c Noam Camus 2016-02-02  125  static inline void *nps_host_reg(u32 cpu, u32 blkid, u32 reg)
f44c724c Noam Camus 2016-02-02  126  {
f44c724c Noam Camus 2016-02-02  127  	struct nps_host_reg_address reg_address;
f44c724c Noam Camus 2016-02-02  128  	u32 cl = NPS_CPU_TO_CLUSTER_NUM(cpu);
f44c724c Noam Camus 2016-02-02  129  
f44c724c Noam Camus 2016-02-02  130  	reg_address.value = NPS_HOST_REG_BASE;

:::::: The code at line 122 was first introduced by commit
:::::: f44c724ca34c57edebb15cae51eaa8d9b6976526 soc: Support for EZchip SoC

:::::: TO: Noam Camus <noamc at ezchip.com>
:::::: CC: 0day robot <fengguang.wu at intel.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/octet-stream
Size: 51085 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160202/c7898ac1/attachment-0001.obj>
