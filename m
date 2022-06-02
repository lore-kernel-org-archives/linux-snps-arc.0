Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0ABC43334
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Jun 2022 11:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tyoDDuypqRwQ0l5pN5XGzQz2zVWs4CesPa8PtrklLYA=; b=iXOFU8PhONdQEd
	QsKayiilPMQmsAFJ9xiewWHoJ3q2oqqsWybEDDKnK3uLP/t8NiCx8J2TFNmlU8jlLQJHcrdv4xNrP
	H03YZlV8AhMxsr0KjnozSPs7fGckkhwpAmtrXQPlJeb3BZF8/+kZm6LliZMwMFWoIE2j7rWyaN2gH
	CD7JU7MuwSsToLAstHeIWpdZphujjlB7OaBr9kOYhsoJPeZPgfFZovSqNhkRIlr61/T8NjCz8QPSP
	0RA9rf2BTWIwA/+7pjlanROXZ1nDUGgJi9dLu/FZtekjVN5IUXHK3qUNDsdZIFqwKolqXhZE+NMUC
	B9Bo6Svjj5P3HdQKz37Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwj9r-002y2y-S1; Thu, 02 Jun 2022 11:38:31 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwj9n-002y25-Ua
	for linux-snps-arc@lists.infradead.org; Thu, 02 Jun 2022 11:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654169907; x=1685705907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2sm/JCPZdpEHeM6hHSyhF5/H0dnllRBjRCa+M4Br4Z8=;
  b=TXA38F5YnhK7k22oT3Aczch3y+22+j5dG3EHLRyXTZRWW1dc0+dGLOQD
   mn8Iwvj1SdgrqFHU6VZ5Tn+Ov/u+x1q7mRIIc2/M+mSgvTSg/MYOJdheU
   eHSSpftTREHTNnqoRQuxK/0meN4wAH/Evj0U7VKJzn9xbSA3ikiZjobDB
   tvtvV3tagMbsWWBmc2+cn6/w7H4QQxHAas0oifZHNtiNf1AydinhCixTC
   CyQK2HZJVYEyGl5PdQEbjQ1krBWBmurUzVwPFaksDP4XXN4pTw/6S2Ar9
   QmmdWYfBrbI8TGu3pQ1C4azR8Jb/VcLempciLBtO5vXCGnO6olZ4spbXY
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="338966258"
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="338966258"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2022 04:38:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,271,1647327600"; 
   d="scan'208";a="707531115"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 02 Jun 2022 04:38:24 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwj9j-00051d-Mr;
	Thu, 02 Jun 2022 11:38:23 +0000
Date: Thu, 2 Jun 2022 19:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org
Subject: [arm-integrator:kernel-in-vmalloc-v5.18-rc1 18/31]
 arch/arc/include/asm/page.h:96:16: error: implicit declaration of function
 '__pa'
Message-ID: <202206021901.8rEMndYL-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_043828_066257_796EB91C 
X-CRM114-Status: GOOD (  12.68  )
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
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20220602/202206021901.8rEMndYL-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0
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

All error/warnings (new ones prefixed by >>):

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
>> arch/arc/include/asm/page.h:96:16: error: implicit declaration of function '__pa' [-Werror=implicit-function-declaration]
      96 |         return __pa(kaddr) >> PAGE_SHIFT;
         |                ^~~~
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
>> arch/arc/include/asm/pgtable-levels.h:163:47: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
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
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:120: arch/arc/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1194: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/__pa +96 arch/arc/include/asm/page.h

    86	
    87	/*
    88	 * Use virt_to_pfn with caution:
    89	 * If used in pte or paddr related macros, it could cause truncation
    90	 * in PAE40 builds
    91	 * As a rule of thumb, only use it in helpers starting with virt_
    92	 * You have been warned !
    93	 */
    94	static inline unsigned long virt_to_pfn(const void *kaddr)
    95	{
  > 96		return __pa(kaddr) >> PAGE_SHIFT;
    97	}
    98	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
