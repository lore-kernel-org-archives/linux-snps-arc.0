Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB08CCA487
	for <linux-snps-arc@archiver.kernel.org>; Wed, 20 Jul 2022 17:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bgjDKfkoOmp1WFs6deSNVi/zEv7scxwJqHm77ZPJGQU=; b=JGqrzww1R6FGpV
	EJCc/EuqTUp95l9hkC8jiJjP+3HUYBwAqfROKxaIsGjy9fv8L6BmehCqdNIldT+F77Kq5sxWsjsPG
	JwPWPsbnVD1NZRNtsT4cWt0hLpyFhDRGt6NHN7pMkL8nH4NEs3GJRbfEJWfu+VeJmnzUBRFuay7Y6
	4XHoW6PgsevX947Y2FjGz/RCADUpyukTvou6kSHD780zcWwMpPpMNwhoTt5wb0blgnzkNcS2fTPaa
	NA7vm0H6eZzn9eY9esG3fvHOkbpd1+8qWA3+rd5ZtFG2dfHiVOXkp/bYNEwXgt51jOGkPoPeKBUab
	IcxvsGxxQc31lV+B1YSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDUU-008cKY-12; Wed, 20 Jul 2022 17:28:06 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDUP-008cFz-7z
	for linux-snps-arc@lists.infradead.org; Wed, 20 Jul 2022 17:28:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658338081; x=1689874081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wx5pbREH6bxpflB8DsBBTL6IzTqARz7MsuIJxXZ9uwg=;
  b=nWZFVvFOfpVfekPVnA8bCOELNgECGFibk7bwke6m6kSK6z392fdRz5IW
   ctJXvPT1A2e3OvkE/fDygAf1SjQx4eGIZW/fv7Jv5E/riqHS4rvVgiQuP
   1ZGXGjpg83hyNIUMOZ/EpaPZEkx2UPeJ4kpw7TKA1iNWOYFrvO2LWThhI
   H5OzHHkaBRBJ+tc9KZy8LiO/PkT4GAAO/+3RsClmUFcQMXqmIPOTZGmUW
   jV7hGeuoNl5qc025pEDxqmot4nrbqnSRu57OGuc8eRQK19jBN1qsMdlCa
   dMDglxqvK5HC4vuTpZGskCmfE6megWXhZTPC9YRDHTx38utHhwh0Odx3N
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="266616284"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; 
   d="scan'208";a="266616284"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2022 10:27:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; 
   d="scan'208";a="573394779"
Received: from lkp-server01.sh.intel.com (HELO 7dfbdc7c7900) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Jul 2022 10:27:56 -0700
Received: from kbuild by 7dfbdc7c7900 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oEDUJ-0000kr-AX;
	Wed, 20 Jul 2022 17:27:55 +0000
Date: Thu, 21 Jul 2022 01:27:33 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org
Subject: [arm-integrator:kernel-in-vmalloc-v5.19-rc1 19/35]
 ./include/generated/autoconf.h:908:31: error: passing argument 1 of
 'virt_to_pfn' makes pointer from integer without a cast
Message-ID: <202207210127.6KFeFDsE-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_102801_393062_9958AED2 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v5.19-rc1
head:   144435741b0a6f31403d3084103678da3b4f9d11
commit: de1bb0b64eb108f2ec8ef6be0cfb632897de5321 [19/35] ARC: mm: Make virt_to_pfn() a static inline
config: arc-buildonly-randconfig-r005-20220719 (https://download.01.org/0day-ci/archive/20220721/202207210127.6KFeFDsE-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=de1bb0b64eb108f2ec8ef6be0cfb632897de5321
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v5.19-rc1
        git checkout de1bb0b64eb108f2ec8ef6be0cfb632897de5321
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/net/wireless/broadcom/brcm80211/brcmfmac/ drivers/net/wwan/t7xx/ fs/proc/ lib/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   include/asm-generic/memory_model.h:18:53: note: in expansion of macro 'ARCH_PFN_OFFSET'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                                     ^~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:53:21: note: in expansion of macro '__pfn_to_page'
      53 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   include/linux/highmem-internal.h:197:32: note: in expansion of macro 'pfn_to_page'
     197 |         return kmap_local_page(pfn_to_page(pfn));
         |                                ^~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   include/linux/highmem-internal.h: In function 'kmap_atomic_pfn':
   ./include/generated/autoconf.h:908:31: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
         |                                             ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:18:53: note: in expansion of macro 'ARCH_PFN_OFFSET'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                                     ^~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:53:21: note: in expansion of macro '__pfn_to_page'
      53 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   include/linux/highmem-internal.h:224:28: note: in expansion of macro 'pfn_to_page'
     224 |         return kmap_atomic(pfn_to_page(pfn));
         |                            ^~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   fs/proc/kcore.c: In function 'kclist_add_private':
   ./include/generated/autoconf.h:908:31: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
         |                                             ^~~~~~~~~~~~~~~~~~~~~
   arch/arc/include/asm/page.h:103:43: note: in expansion of macro 'ARCH_PFN_OFFSET'
     103 | #define pfn_valid(pfn)          (((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
         |                                           ^~~~~~~~~~~~~~~
   fs/proc/kcore.c:192:14: note: in expansion of macro 'pfn_valid'
     192 |         if (!pfn_valid(pfn))
         |              ^~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   ./include/generated/autoconf.h:908:31: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
         |                                             ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:18:53: note: in expansion of macro 'ARCH_PFN_OFFSET'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                                     ^~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:53:21: note: in expansion of macro '__pfn_to_page'
      53 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   fs/proc/kcore.c:195:13: note: in expansion of macro 'pfn_to_page'
     195 |         p = pfn_to_page(pfn);
         |             ^~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   ./include/generated/autoconf.h:908:31: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:115:59: note: in definition of macro '__va'
     115 | #define __va(paddr)             ((void *)((unsigned long)(paddr)))
         |                                                           ^~~~~
   include/linux/mm.h:113:30: note: in expansion of macro 'PFN_PHYS'
     113 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                              ^~~~~~~~
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
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
   fs/proc/kcore.c:200:36: note: in expansion of macro 'page_to_virt'
     200 |         ent->addr = (unsigned long)page_to_virt(p);
         |                                    ^~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
>> fs/proc/kcore.c:203:33: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     203 |         if (!virt_addr_valid(ent->addr))
         |                              ~~~^~~~~~
         |                                 |
         |                                 long unsigned int
   arch/arc/include/asm/page.h:103:36: note: in definition of macro 'pfn_valid'
     103 | #define pfn_valid(pfn)          (((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
         |                                    ^~~
   fs/proc/kcore.c:203:14: note: in expansion of macro 'virt_addr_valid'
     203 |         if (!virt_addr_valid(ent->addr))
         |              ^~~~~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   ./include/generated/autoconf.h:908:31: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
         |                                             ^~~~~~~~~~~~~~~~~~~~~
   arch/arc/include/asm/page.h:103:43: note: in expansion of macro 'ARCH_PFN_OFFSET'
     103 | #define pfn_valid(pfn)          (((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
         |                                           ^~~~~~~~~~~~~~~
   arch/arc/include/asm/page.h:130:33: note: in expansion of macro 'pfn_valid'
     130 | #define virt_addr_valid(kaddr)  pfn_valid(virt_to_pfn(kaddr))
         |                                 ^~~~~~~~~
   fs/proc/kcore.c:203:14: note: in expansion of macro 'virt_addr_valid'
     203 |         if (!virt_addr_valid(ent->addr))
         |              ^~~~~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   fs/proc/kcore.c: In function 'read_kcore':
   ./include/generated/autoconf.h:908:31: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
         |                                             ^~~~~~~~~~~~~~~~~~~~~
   arch/arc/include/asm/page.h:103:43: note: in expansion of macro 'ARCH_PFN_OFFSET'
     103 | #define pfn_valid(pfn)          (((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
         |                                           ^~~~~~~~~~~~~~~
   include/linux/memory_hotplug.h:223:13: note: in expansion of macro 'pfn_valid'
     223 |         if (pfn_valid(pfn))                     \
         |             ^~~~~~~~~
   fs/proc/kcore.c:526:32: note: in expansion of macro 'pfn_to_online_page'
     526 |                         page = pfn_to_online_page(pfn);
         |                                ^~~~~~~~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   ./include/generated/autoconf.h:908:31: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
         |                                             ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:18:53: note: in expansion of macro 'ARCH_PFN_OFFSET'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                                     ^~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:53:21: note: in expansion of macro '__pfn_to_page'
      53 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   include/linux/memory_hotplug.h:224:27: note: in expansion of macro 'pfn_to_page'
     224 |                 ___page = pfn_to_page(pfn);     \
         |                           ^~~~~~~~~~~
   fs/proc/kcore.c:526:32: note: in expansion of macro 'pfn_to_online_page'
     526 |                         page = pfn_to_online_page(pfn);
         |                                ^~~~~~~~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
--
   In file included from include/linux/kconfig.h:5,
                    from <command-line>:
   include/linux/mm.h: In function 'virt_to_head_page':
>> ./include/generated/autoconf.h:908:31: error: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Werror=int-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
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
                    from include/linux/spinlock.h:55,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from drivers/net/wwan/t7xx/t7xx_pci.c:21:
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   include/linux/mm.h: In function 'virt_to_folio':
>> ./include/generated/autoconf.h:908:31: error: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Werror=int-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
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
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   include/linux/mm.h: In function 'folio_pfn':
>> ./include/generated/autoconf.h:908:31: error: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Werror=int-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
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
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   include/linux/mm.h: In function 'is_pinnable_page':
>> ./include/generated/autoconf.h:908:31: error: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Werror=int-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
         |                                             ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:20:34: note: in expansion of macro 'ARCH_PFN_OFFSET'
      20 |                                  ARCH_PFN_OFFSET)
         |                                  ^~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:52:21: note: in expansion of macro '__page_to_pfn'
      52 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mmzone.h:103:39: note: in expansion of macro 'page_to_pfn'
     103 |         get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
         |                                       ^~~~~~~~~~~
   include/linux/mm.h:1598:18: note: in expansion of macro 'get_pageblock_migratetype'
    1598 |         int mt = get_pageblock_migratetype(page);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
>> ./include/generated/autoconf.h:908:31: error: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Werror=int-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
         |                                             ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:20:34: note: in expansion of macro 'ARCH_PFN_OFFSET'
      20 |                                  ARCH_PFN_OFFSET)
         |                                  ^~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:52:21: note: in expansion of macro '__page_to_pfn'
      52 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:1603:60: note: in expansion of macro 'page_to_pfn'
    1603 |         return !(is_zone_movable_page(page) || is_zero_pfn(page_to_pfn(page)));
         |                                                            ^~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   include/linux/mm.h: In function 'lowmem_page_address':
>> ./include/generated/autoconf.h:908:31: error: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Werror=int-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:115:59: note: in definition of macro '__va'
     115 | #define __va(paddr)             ((void *)((unsigned long)(paddr)))
         |                                                           ^~~~~
   include/linux/mm.h:113:30: note: in expansion of macro 'PFN_PHYS'
     113 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                              ^~~~~~~~
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
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
   include/linux/mm.h:1729:16: note: in expansion of macro 'page_to_virt'
    1729 |         return page_to_virt(page);
         |                ^~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   include/linux/mm.h: In function 'pte_lockptr':
>> ./include/generated/autoconf.h:908:31: error: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Werror=int-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
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
   arch/arc/include/asm/pgtable-levels.h:162:33: note: in expansion of macro 'virt_to_page'
     162 | #define pmd_page(pmd)           virt_to_page((void *)pmd_page_vaddr(pmd))
         |                                 ^~~~~~~~~~~~
   include/linux/mm.h:2291:27: note: in expansion of macro 'pmd_page'
    2291 |         return ptlock_ptr(pmd_page(*pmd));
         |                           ^~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   In file included from arch/arc/include/asm/atomic.h:12,
                    from include/linux/atomic.h:7,
                    from drivers/net/wwan/t7xx/t7xx_pci.c:19:
   include/linux/scatterlist.h: In function 'sg_set_buf':
>> ./include/generated/autoconf.h:908:31: error: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Werror=int-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
      78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/scatterlist.h:160:9: note: in expansion of macro 'BUG_ON'
     160 |         BUG_ON(!virt_addr_valid(buf));
         |         ^~~~~~
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
         |                                             ^~~~~~~~~~~~~~~~~~~~~
   arch/arc/include/asm/page.h:103:43: note: in expansion of macro 'ARCH_PFN_OFFSET'
     103 | #define pfn_valid(pfn)          (((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
         |                                           ^~~~~~~~~~~~~~~
   arch/arc/include/asm/page.h:130:33: note: in expansion of macro 'pfn_valid'
     130 | #define virt_addr_valid(kaddr)  pfn_valid(virt_to_pfn(kaddr))
         |                                 ^~~~~~~~~
   include/linux/scatterlist.h:160:17: note: in expansion of macro 'virt_addr_valid'
     160 |         BUG_ON(!virt_addr_valid(buf));
         |                 ^~~~~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
>> ./include/generated/autoconf.h:908:31: error: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Werror=int-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
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
   include/linux/scatterlist.h:162:25: note: in expansion of macro 'virt_to_page'
     162 |         sg_set_page(sg, virt_to_page(buf), buflen, offset_in_page(buf));
         |                         ^~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   include/linux/scatterlist.h: In function 'sg_phys':
>> ./include/generated/autoconf.h:908:31: error: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Werror=int-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
         |                                             ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:20:34: note: in expansion of macro 'ARCH_PFN_OFFSET'
      20 |                                  ARCH_PFN_OFFSET)
         |                                  ^~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:52:21: note: in expansion of macro '__page_to_pfn'
      52 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   arch/arc/include/asm/io.h:47:42: note: in expansion of macro 'page_to_pfn'
      47 | #define page_to_phys(page)              (page_to_pfn(page) << PAGE_SHIFT)
         |                                          ^~~~~~~~~~~
   include/linux/scatterlist.h:260:16: note: in expansion of macro 'page_to_phys'
     260 |         return page_to_phys(sg_page(sg)) + sg->offset;
         |                ^~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   include/linux/dma-mapping.h: In function 'dma_free_noncoherent':
>> ./include/generated/autoconf.h:908:31: error: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Werror=int-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
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
   include/linux/dma-mapping.h:319:35: note: in expansion of macro 'virt_to_page'
     319 |         dma_free_pages(dev, size, virt_to_page(vaddr), dma_handle, dir);
         |                                   ^~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   include/linux/dma-mapping.h: In function 'dma_map_single_attrs':
>> ./include/generated/autoconf.h:908:31: error: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Werror=int-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
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
   include/linux/dma-mapping.h:330:40: note: in expansion of macro 'virt_to_page'
     330 |         return dma_map_page_attrs(dev, virt_to_page(ptr), offset_in_page(ptr),
         |                                        ^~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   include/linux/highmem-internal.h: In function 'kmap_to_page':
>> ./include/generated/autoconf.h:908:31: error: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Werror=int-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
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
   include/linux/highmem-internal.h:161:16: note: in expansion of macro 'virt_to_page'
     161 |         return virt_to_page(addr);
         |                ^~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   include/linux/highmem-internal.h: In function 'kmap_local_pfn':
>> ./include/generated/autoconf.h:908:31: error: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Werror=int-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
         |                                             ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:18:53: note: in expansion of macro 'ARCH_PFN_OFFSET'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                                     ^~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:53:21: note: in expansion of macro '__pfn_to_page'
      53 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   include/linux/highmem-internal.h:197:32: note: in expansion of macro 'pfn_to_page'
     197 |         return kmap_local_page(pfn_to_page(pfn));
         |                                ^~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   include/linux/highmem-internal.h: In function 'kmap_atomic_pfn':
>> ./include/generated/autoconf.h:908:31: error: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Werror=int-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
         |                                             ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:18:53: note: in expansion of macro 'ARCH_PFN_OFFSET'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                                     ^~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:53:21: note: in expansion of macro '__pfn_to_page'
      53 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   include/linux/highmem-internal.h:224:28: note: in expansion of macro 'pfn_to_page'
     224 |         return kmap_atomic(pfn_to_page(pfn));
         |                            ^~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   include/linux/skbuff.h: In function 'skb_pp_recycle':
>> ./include/generated/autoconf.h:908:31: error: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Werror=int-conversion]
     908 | #define CONFIG_LINUX_RAM_BASE 0x80000000
         |                               ^~~~~~~~~~
         |                               |
         |                               unsigned int
   arch/arc/include/asm/page.h:102:45: note: in expansion of macro 'CONFIG_LINUX_RAM_BASE'
     102 | #define ARCH_PFN_OFFSET         virt_to_pfn(CONFIG_LINUX_RAM_BASE)
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
   include/linux/skbuff.h:5156:42: note: in expansion of macro 'virt_to_page'
    5156 |         return page_pool_return_skb_page(virt_to_page(data));
         |                                          ^~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   cc1: all warnings being treated as errors
..

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
