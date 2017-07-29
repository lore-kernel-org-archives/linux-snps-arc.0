From: lkp@intel.com (kbuild test robot)
Date: Sun, 30 Jul 2017 03:03:17 +0800
Subject: [PATCH 4/5] mtd: spi-nor: Add driver for Adaptrum Anarion QSPI
 controller
In-Reply-To: <20170728220707.13960-5-alex.g@adaptrum.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201707300201.U4GeEZkf%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Alexandru,

[auto build test WARNING on arc/for-next]
[also build test WARNING on v4.13-rc2 next-20170728]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Alexandru-Gagniuc/Initial-support-for-Adaptrum-Anarion-SOC/20170730-013701
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git for-next
config: i386-allmodconfig (attached as .config)
compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All warnings (new ones prefixed by >>):

   drivers/mtd/spi-nor/anarion-quadspi.c: In function 'anarion_spi_nor_read':
>> drivers/mtd/spi-nor/anarion-quadspi.c:335:19: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
     void *from_xip = (void *)(aspi->xipbase + from);
                      ^

vim +335 drivers/mtd/spi-nor/anarion-quadspi.c

   325	
   326	/* While we could send read commands manually to the flash chip, we'd have to
   327	 * get data back through the DATA2 register. That is on the AHB bus, whereas
   328	 * XIP reads go over AXI. Hence, we use the memory-mapped flash space for read.
   329	 * TODO: Look at using DMA instead of memcpy().
   330	 */
   331	static ssize_t anarion_spi_nor_read(struct spi_nor *nor, loff_t from,
   332					      size_t len, uint8_t *read_buf)
   333	{
   334		struct anarion_qspi *aspi = nor->priv;
 > 335		void *from_xip = (void *)(aspi->xipbase + from);
   336	
   337		aspi_setup_xip_read_chain(aspi, nor);
   338		memcpy(read_buf, from_xip, len);
   339	
   340		return len;
   341	}
   342	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 60093 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20170730/6e6bfade/attachment-0001.gz>
