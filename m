From: lkp@intel.com (kbuild test robot)
Date: Fri, 23 Feb 2018 09:14:48 +0800
Subject: [PATCH] mmc: dw_mmc: Fix the DTO timeout overflow calculation
 for 32-bit systems
In-Reply-To: <20180221175734.39114-1-Evgeniy.Didin@synopsys.com>
References: <20180221175734.39114-1-Evgeniy.Didin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201802230909.0R9d1uAG%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Evgeniy,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v4.16-rc2 next-20180222]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Evgeniy-Didin/mmc-dw_mmc-Fix-the-DTO-timeout-overflow-calculation-for-32-bit-systems/20180223-054846
config: arm-exynos_defconfig (attached as .config)
compiler: arm-linux-gnueabi-gcc (Debian 7.2.0-11) 7.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=arm 

All errors (new ones prefixed by >>):

   drivers/mmc/host/dw_mmc.o: In function `dw_mci_set_drto':
>> dw_mmc.c:(.text+0x1644): undefined reference to `__aeabi_uldivmod'

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 28423 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20180223/4ba48682/attachment-0001.gz>
