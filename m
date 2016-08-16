From: lkp@intel.com (kbuild test robot)
Date: Tue, 16 Aug 2016 20:19:14 +0800
Subject: [PATCH] DW: Read "is_memcpy" and "is_nollp" property from device
 tree.
In-Reply-To: <1471347080-1411-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201608162047.gPvHvyyO%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Eugeniy,

[auto build test ERROR on linus/master]
[also build test ERROR on v4.8-rc2 next-20160815]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Eugeniy-Paltsev/DW-Read-is_memcpy-and-is_nollp-property-from-device-tree/20160816-193459
config: sparc64-allyesconfig (attached as .config)
compiler: sparc64-linux-gnu-gcc (Debian 5.4.0-6) 5.4.0 20160609
reproduce:
        wget https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/plain/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=sparc64 

All errors (new ones prefixed by >>):

   drivers/dma/dw/platform.c: In function 'dw_dma_parse_dt':
>> drivers/dma/dw/platform.c:136:8: error: 'struct dw_dma_platform_data' has no member named 'is_nollp'
      pdata->is_nollp = true;
           ^

vim +136 drivers/dma/dw/platform.c

   130			pdata->is_private = true;
   131	
   132		if (of_property_read_bool(np, "is_memcpy"))
   133			pdata->is_memcpy = true;
   134	
   135		if (of_property_read_bool(np, "is_nollp"))
 > 136			pdata->is_nollp = true;
   137	
   138		if (!of_property_read_u32(np, "chan_allocation_order", &tmp))
   139			pdata->chan_allocation_order = (unsigned char)tmp;

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/octet-stream
Size: 47053 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20160816/cba84cdb/attachment-0001.obj>
