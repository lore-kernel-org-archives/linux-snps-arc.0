From: lkp@intel.com (kbuild test robot)
Date: Thu, 15 Sep 2016 23:04:48 +0800
Subject: [PATCH] dmaengine: DW DMAC: split pdata to hardware properties
 and platform quirks
In-Reply-To: <1473945253-16649-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201609152333.AbSSpwAg%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Eugeniy,

[auto build test ERROR on slave-dma/next]
[also build test ERROR on next-20160915]
[cannot apply to linus/master linux/master v4.8-rc6]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
[Suggest to use git(>=2.9.0) format-patch --base=<commit> (or --base=auto for convenience) to record what (public, well-known) commit your patch series was built on]
[Check https://git-scm.com/docs/git-format-patch for more information]

url:    https://github.com/0day-ci/linux/commits/Eugeniy-Paltsev/dmaengine-DW-DMAC-split-pdata-to-hardware-properties-and-platform-quirks/20160915-211634
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/slave-dma.git next
config: i386-defconfig (attached as .config)
compiler: gcc-6 (Debian 6.1.1-9) 6.1.1 20160705
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All errors (new ones prefixed by >>):

>> drivers/tty/serial/8250/8250_lpss.c:159:2: error: unknown field 'is_private' specified in initializer
     .is_private = true,
     ^
>> drivers/tty/serial/8250/8250_lpss.c:160:2: error: unknown field 'is_nollp' specified in initializer
     .is_nollp = true,
     ^

vim +/is_private +159 drivers/tty/serial/8250/8250_lpss.c

a13e19cf Andy Shevchenko 2016-08-17  153  	return 0;
a13e19cf Andy Shevchenko 2016-08-17  154  }
a13e19cf Andy Shevchenko 2016-08-17  155  
fecdef93 Andy Shevchenko 2016-08-17  156  #ifdef CONFIG_SERIAL_8250_DMA
fecdef93 Andy Shevchenko 2016-08-17  157  static const struct dw_dma_platform_data qrk_serial_dma_pdata = {
fecdef93 Andy Shevchenko 2016-08-17  158  	.nr_channels = 2,
fecdef93 Andy Shevchenko 2016-08-17 @159  	.is_private = true,
fecdef93 Andy Shevchenko 2016-08-17 @160  	.is_nollp = true,
fecdef93 Andy Shevchenko 2016-08-17  161  	.chan_allocation_order = CHAN_ALLOCATION_ASCENDING,
fecdef93 Andy Shevchenko 2016-08-17  162  	.chan_priority = CHAN_PRIORITY_ASCENDING,
fecdef93 Andy Shevchenko 2016-08-17  163  	.block_size = 4095,

:::::: The code at line 159 was first introduced by commit
:::::: fecdef932b0093b4a7e1ae88b1dbd63eb74ecc34 serial: 8250_lpss: enable DMA on Intel Quark UART

:::::: TO: Andy Shevchenko <andriy.shevchenko at linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh at linuxfoundation.org>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/octet-stream
Size: 25021 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160915/76c45537/attachment-0001.obj>
