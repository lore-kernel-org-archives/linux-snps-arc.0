From: lkp@intel.com (kbuild test robot)
Date: Fri, 7 Sep 2018 00:34:10 +0800
Subject: [PATCH 1/2] mtd: spi-nor: Add support of sst26wf* flash ICs
 protection ops
In-Reply-To: <20180904153342.16742-2-Eugeniy.Paltsev@synopsys.com>
References: <20180904153342.16742-2-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <201809070025.CWIr9W0I%fengguang.wu@intel.com>
To: linux-snps-arc@lists.infradead.org

Hi Eugeniy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on mtd/spi-nor/next]
[also build test WARNING on v4.19-rc2 next-20180906]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Eugeniy-Paltsev/MTD-spi-nor-add-support-for-sst26wf016-sst26wf032/20180907-001236
base:   git://git.infradead.org/linux-mtd.git spi-nor/next
config: x86_64-randconfig-x015-201835 (attached as .config)
compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   drivers/mtd/spi-nor/spi-nor.c: In function 'sst26_lock_ctl':
>> drivers/mtd/spi-nor/spi-nor.c:671:5: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]
     if (ret < 0) {
        ^

vim +/ret +671 drivers/mtd/spi-nor/spi-nor.c

   637	
   638	/*
   639	 * Lock, unlock or check lock status of the flash region of the flash (depending
   640	 * on the lock_ctl value)
   641	 */
   642	static int sst26_lock_ctl(struct spi_nor *nor, loff_t ofs, uint64_t len, enum lock_ctl ctl)
   643	{
   644		struct mtd_info *mtd = &nor->mtd;
   645		u32 i, bpr_ptr, rptr_64k, lptr_64k, bpr_size;
   646		bool lower_64k = false, upper_64k = false;
   647		u8 bpr_buff[SST26_MAX_BPR_REG_LEN] = {};
   648		int ret;
   649	
   650		/* Check length and offset for 64k alignment */
   651		if ((ofs & (SZ_64K - 1)) || (len & (SZ_64K - 1))) {
   652			dev_err(nor->dev, "length or offset is not 64KiB allighned\n");
   653			return -EINVAL;
   654		}
   655	
   656		if (ofs + len > mtd->size) {
   657			dev_err(nor->dev, "range is more than device size: %#llx + %#llx > %#llx\n",
   658				ofs, len, mtd->size);
   659			return -EINVAL;
   660		}
   661	
   662		/* SST26 family has only 16 Mbit, 32 Mbit and 64 Mbit IC */
   663		if (mtd->size != SZ_2M &&
   664		    mtd->size != SZ_4M &&
   665		    mtd->size != SZ_8M)
   666			return -EINVAL;
   667	
   668		bpr_size = 2 + (mtd->size / SZ_64K / 8);
   669	
   670		nor->read_reg(nor, SPINOR_OP_READ_BPR, bpr_buff, bpr_size);
 > 671		if (ret < 0) {
   672			dev_err(nor->dev, "fail to read block-protection register\n");
   673			return ret;
   674		}
   675	
   676		rptr_64k = min_t(u32, ofs + len, mtd->size - SST26_BOUND_REG_SIZE);
   677		lptr_64k = max_t(u32, ofs, SST26_BOUND_REG_SIZE);
   678	
   679		upper_64k = ((ofs + len) > (mtd->size - SST26_BOUND_REG_SIZE));
   680		lower_64k = (ofs < SST26_BOUND_REG_SIZE);
   681	
   682		/* Lower bits in block-protection register are about 64k region */
   683		bpr_ptr = lptr_64k / SZ_64K - 1;
   684	
   685		/* Process 64K blocks region */
   686		while (lptr_64k < rptr_64k) {
   687			if (sst26_process_bpr(bpr_size, bpr_buff, bpr_ptr, ctl))
   688				return EACCES;
   689	
   690			bpr_ptr++;
   691			lptr_64k += SZ_64K;
   692		}
   693	
   694		/* 32K and 8K region bits in BPR are after 64k region bits */
   695		bpr_ptr = (mtd->size - 2 * SST26_BOUND_REG_SIZE) / SZ_64K;
   696	
   697		/* Process lower 32K block region */
   698		if (lower_64k)
   699			if (sst26_process_bpr(bpr_size, bpr_buff, bpr_ptr, ctl))
   700				return EACCES;
   701	
   702		bpr_ptr++;
   703	
   704		/* Process upper 32K block region */
   705		if (upper_64k)
   706			if (sst26_process_bpr(bpr_size, bpr_buff, bpr_ptr, ctl))
   707				return EACCES;
   708	
   709		bpr_ptr++;
   710	
   711		/* Process lower 8K block regions */
   712		for (i = 0; i < SST26_BPR_8K_NUM; i++) {
   713			if (lower_64k)
   714				if (sst26_process_bpr(bpr_size, bpr_buff, bpr_ptr, ctl))
   715					return EACCES;
   716	
   717			/* In 8K area BPR has both read and write protection bits */
   718			bpr_ptr += 2;
   719		}
   720	
   721		/* Process upper 8K block regions */
   722		for (i = 0; i < SST26_BPR_8K_NUM; i++) {
   723			if (upper_64k)
   724				if (sst26_process_bpr(bpr_size, bpr_buff, bpr_ptr, ctl))
   725					return EACCES;
   726	
   727			/* In 8K area BPR has both read and write protection bits */
   728			bpr_ptr += 2;
   729		}
   730	
   731		/* If we check region status we don't need to write BPR back */
   732		if (ctl == SST26_CTL_CHECK)
   733			return 0;
   734	
   735		nor->write_reg(nor, SPINOR_OP_WRITE_BPR, bpr_buff, bpr_size);
   736		if (ret < 0) {
   737			dev_err(nor->dev, "fail to write block-protection register\n");
   738			return ret;
   739		}
   740	
   741		return 0;
   742	}
   743	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config.gz
Type: application/gzip
Size: 29652 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20180907/f91ab379/attachment-0001.gz>
