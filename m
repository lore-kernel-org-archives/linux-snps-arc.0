Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90567CCA478
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Jun 2022 12:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H72l3W2RWvcaT9ZhOTAVNxVkfH0sp2/iDhi75tqMlE4=; b=1s2wK5ZVXJLwgS
	O7OnJiM8TQjtz8T9/aQ+j+dSBMU72bDu2ooiH6GiBx0eC8Lt3YGt3PgS+ePULQ9DpzIAiYDQTIqW+
	WFYcigp8Q7SKxjIAz8gl/ekBMnQCgJTjgMlaQqQGnAAPrwJuogjiUcjU+eqFnRxg/4LbgwbRHL8q+
	wCfDQakOOIKcGn1qEa8i9gca0s83jCCRarrD3HBsGnRl3CE7CSkTB16xYjZe5UqNbxEADrMqaZ3Y9
	H8bS3TCWRduV5/gv1k94L24qy4hcfVNBgpAa6GGQU9OEIUbhw0j3gq+4gIXHdPeh6n5xCfXYVJ+Z6
	dPbYnoy9E/1JiPtxCWCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjX7-0035uM-JB; Thu, 02 Jun 2022 12:02:33 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwjX3-0035rv-7f
	for linux-snps-arc@lists.infradead.org; Thu, 02 Jun 2022 12:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654171349; x=1685707349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cin2IcV48kN9xXFyrRmzGpTTb9CRw1TAh/9xCn7/jLM=;
  b=YcnYNZpFWX83twwiaWzMmibEQfUYIBBKeZgffh5JHDulgYzwy4U1HuWm
   PdO1AOB1PYoOEfuBPLivcYZvvotkncXPevaCvQ8C812aDrjTTbglp41bl
   RInFCla4sgZCm44md1NQRp+49zKfkSOrvPbQ2xwhE+A6Y9IrQqRtIBqUn
   j3QmVJU8G73PUWxP+IcQotnpB/aOeVBuuE7zzt8CZQbEBlh+82nZB0KCQ
   BGfBURnSMCQMC/BCV56tVCR8/cy/iQiFgbwlcNpMPkVnWFF9tHJ5XoQam
   XRkxNgU853jWpjHAQ4wDUZvm9bOEDszgHHEHxfUU/pWcTSy1UXQOpCU8k
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="338971783"
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="338971783"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 05:02:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="824225509"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Jun 2022 05:02:24 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwjWy-00052j-7Y;
	Thu, 02 Jun 2022 12:02:24 +0000
Date: Thu, 2 Jun 2022 20:02:22 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org
Subject: [arm-integrator:kernel-in-vmalloc-v5.18-rc1 18/31]
 ./include/generated/autoconf.h:126:31: warning: passing argument 1 of
 'virt_to_pfn' makes pointer from integer without a cast
Message-ID: <202206021937.go6cI17x-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_050229_457891_4A560343 
X-CRM114-Status: GOOD (  11.56  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v5.18-rc1
head:   9083f89a58302e92fad7f144986e307db2350aad
commit: 41026b6c37af5a9cf176a9c4cea5b350005f720a [18/31] ARC: mm: Make virt_to_pfn() a static inline
config: arc-defconfig (https://download.01.org/0day-ci/archive/20220602/202206021937.go6cI17x-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=41026b6c37af5a9cf176a9c4cea5b350005f720a
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v5.18-rc1
        git checkout 41026b6c37af5a9cf176a9c4cea5b350005f720a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=arc prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/arc/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/arc/kernel/asm-offsets.c:6:
   arch/arc/include/asm/page.h: In function 'virt_to_pfn':
   arch/arc/include/asm/page.h:96:16: error: implicit declaration of function '__pa' [-Werror=implicit-function-declaration]
      96 |         return __pa(kaddr) >> PAGE_SHIFT;
         |                ^~~~
   In file included from include/linux/kconfig.h:5,
                    from <command-line>:
   include/linux/mm.h: In function 'virt_to_head_page':
>> ./include/generated/autoconf.h:126:31: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     126 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:114:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     114 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
         |                                             ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:18:53: note: in expansion of macro 'ARCH_PFN_OFFSET'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                                     ^~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:53:21: note: in expansion of macro '__pfn_to_page'
      53 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/arc/include/asm/page.h:129:33: note: in expansion of macro 'pfn_to_page'
     129 | #define virt_to_page(kaddr)     pfn_to_page(virt_to_pfn(kaddr))
         |                                 ^~~~~~~~~~~
   include/linux/mm.h:846:29: note: in expansion of macro 'virt_to_page'
     846 |         struct page *page = virt_to_page(x);
         |                             ^~~~~~~~~~~~
   In file included from arch/arc/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/arc/kernel/asm-offsets.c:6:
   arch/arc/include/asm/page.h:94:53: note: expected 'const void *' but argument is of type 'unsigned int'
      94 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   In file included from include/linux/kconfig.h:5,
                    from <command-line>:
   include/linux/mm.h: In function 'virt_to_folio':
>> ./include/generated/autoconf.h:126:31: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     126 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:114:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     114 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
         |                                             ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:18:53: note: in expansion of macro 'ARCH_PFN_OFFSET'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                                     ^~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:53:21: note: in expansion of macro '__pfn_to_page'
      53 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/arc/include/asm/page.h:129:33: note: in expansion of macro 'pfn_to_page'
     129 | #define virt_to_page(kaddr)     pfn_to_page(virt_to_pfn(kaddr))
         |                                 ^~~~~~~~~~~
   include/linux/mm.h:853:29: note: in expansion of macro 'virt_to_page'
     853 |         struct page *page = virt_to_page(x);
         |                             ^~~~~~~~~~~~
   In file included from arch/arc/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/arc/kernel/asm-offsets.c:6:
   arch/arc/include/asm/page.h:94:53: note: expected 'const void *' but argument is of type 'unsigned int'
      94 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   In file included from include/linux/kconfig.h:5,
                    from <command-line>:
   include/linux/mm.h: In function 'folio_pfn':
>> ./include/generated/autoconf.h:126:31: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     126 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:114:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     114 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
         |                                             ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:20:34: note: in expansion of macro 'ARCH_PFN_OFFSET'
      20 |                                  ARCH_PFN_OFFSET)
         |                                  ^~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:52:21: note: in expansion of macro '__page_to_pfn'
      52 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:1521:16: note: in expansion of macro 'page_to_pfn'
    1521 |         return page_to_pfn(&folio->page);
         |                ^~~~~~~~~~~
   In file included from arch/arc/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/arc/kernel/asm-offsets.c:6:
   arch/arc/include/asm/page.h:94:53: note: expected 'const void *' but argument is of type 'unsigned int'
      94 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   include/linux/mm.h: In function 'lowmem_page_address':
>> ./include/generated/autoconf.h:126:31: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     126 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:127:59: note: in definition of macro '__va'
     127 | #define __va(paddr)             ((void *)((unsigned long)(paddr)))
         |                                                           ^~~~~
   include/linux/mm.h:113:30: note: in expansion of macro 'PFN_PHYS'
     113 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                              ^~~~~~~~
   arch/arc/include/asm/page.h:114:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     114 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
         |                                             ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:20:34: note: in expansion of macro 'ARCH_PFN_OFFSET'
      20 |                                  ARCH_PFN_OFFSET)
         |                                  ^~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:52:21: note: in expansion of macro '__page_to_pfn'
      52 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:113:39: note: in expansion of macro 'page_to_pfn'
     113 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                                       ^~~~~~~~~~~
   include/linux/mm.h:1723:16: note: in expansion of macro 'page_to_virt'
    1723 |         return page_to_virt(page);
         |                ^~~~~~~~~~~~
   arch/arc/include/asm/page.h:94:53: note: expected 'const void *' but argument is of type 'unsigned int'
      94 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   In file included from arch/arc/include/asm/page.h:137,
                    from arch/arc/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/arc/kernel/asm-offsets.c:6:
   include/linux/mm.h: In function 'pte_lockptr':
   arch/arc/include/asm/pgtable-levels.h:163:47: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     163 | #define pmd_page_vaddr(pmd)     (pmd_val(pmd) & PAGE_MASK)
         |                                 ~~~~~~~~~~~~~~^~~~~~~~~~~~
         |                                               |
         |                                               long unsigned int
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   arch/arc/include/asm/pgtable-levels.h:165:33: note: in expansion of macro 'virt_to_page'
     165 | #define pmd_page(pmd)           virt_to_page(pmd_page_vaddr(pmd))
         |                                 ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-levels.h:165:46: note: in expansion of macro 'pmd_page_vaddr'
     165 | #define pmd_page(pmd)           virt_to_page(pmd_page_vaddr(pmd))
         |                                              ^~~~~~~~~~~~~~
   include/linux/mm.h:2287:27: note: in expansion of macro 'pmd_page'
    2287 |         return ptlock_ptr(pmd_page(*pmd));
         |                           ^~~~~~~~
   In file included from arch/arc/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/arc/kernel/asm-offsets.c:6:
   arch/arc/include/asm/page.h:94:53: note: expected 'const void *' but argument is of type 'long unsigned int'
      94 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   In file included from include/linux/kconfig.h:5,
                    from <command-line>:
>> ./include/generated/autoconf.h:126:31: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     126 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:114:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     114 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
         |                                             ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:18:53: note: in expansion of macro 'ARCH_PFN_OFFSET'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                                     ^~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:53:21: note: in expansion of macro '__pfn_to_page'
      53 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/arc/include/asm/page.h:129:33: note: in expansion of macro 'pfn_to_page'
     129 | #define virt_to_page(kaddr)     pfn_to_page(virt_to_pfn(kaddr))
         |                                 ^~~~~~~~~~~
   arch/arc/include/asm/pgtable-levels.h:165:33: note: in expansion of macro 'virt_to_page'
     165 | #define pmd_page(pmd)           virt_to_page(pmd_page_vaddr(pmd))
         |                                 ^~~~~~~~~~~~
   include/linux/mm.h:2287:27: note: in expansion of macro 'pmd_page'
    2287 |         return ptlock_ptr(pmd_page(*pmd));
         |                           ^~~~~~~~
   In file included from arch/arc/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from arch/arc/kernel/asm-offsets.c:6:
   arch/arc/include/asm/page.h:94:53: note: expected 'const void *' but argument is of type 'unsigned int'
      94 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:120: arch/arc/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1194: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
