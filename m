Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5389FC63797
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Feb 2023 18:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T1KryHYaqGe4JIIcpQ4UUdYiZvwAZuxeiRpPaZi04PE=; b=ZqEJl3DYiN9XDZ
	783NWT/MUQKK8qcG19giC0h+tVYzL+zSCFa4E+vZrHFgNp/zNnzWg/ZqWSuGoVOn9NK9W/QxRWTpT
	LbyaGEwPUqa3kXZL3pLtXxXLbRP/R2PtBT/yPp1U4MzIPegU+9B/zvIFoMSSkJua9ZyFC6ACtqzkZ
	Oc2Gu928vbmz93NxLY7N/sWMartgAP1t1kYHCRp2MK3qMn1tXLR6BSiWHVofrCSpo/uG5jmuPNUig
	5mFTtbxza6JaZiJWWpC8+JQYYPc+CwdXNrmaJQg2Z55QK868CNLL0BKi+nqrG2e5OOu17iVh/wIuH
	aGR9ZJNx4cg/+ceePXNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHgi-00DAO6-7v; Wed, 01 Feb 2023 18:18:28 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHgd-00DANF-1K
	for linux-snps-arc@lists.infradead.org; Wed, 01 Feb 2023 18:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675275503; x=1706811503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JV1tVlLQWTtSlYYwr7IOEPPszYyLxF/c2IO0CE+KVgE=;
  b=kvwVqy9R0v9AMoAVJD1MzKwO94T4vogsu597qy99U/JfH4U7Cn80uy7w
   VL84+C2lWoEyD4tLNRsWG7fT/vT63jFP5a4hGEAKIjwmptdGTm9HUcC8D
   JEpFKDDMJDp/ffisVPbLLDF5vg4hGCyZdiL/37vXKmX67j01QqNeBltI1
   0LDFewzdFLSH6fgd58qS4ife0/CtQTwFH2haR1xl8sJSE/hlUezTdoAjw
   fYA8m8JwmT0UfZwr/PcfrKXs+/SzVlNNTR78PPQBrC9nJXFOXBhdglIoe
   ao4P8rZqIsonFNq9Zm6IwWzfV1Fk8OqNMhMDuHwcSTOAK3cmvxQEZJkq6
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="414434322"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="414434322"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 10:13:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="664966508"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="664966508"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Feb 2023 10:13:41 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNHc4-0005fn-2j;
	Wed, 01 Feb 2023 18:13:40 +0000
Date: Thu, 2 Feb 2023 02:13:19 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-snps-arc@lists.infradead.org
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3 8/25]
 fs/cifs/cifsglob.h:2217:48: warning: passing argument 1 of 'virt_to_pfn'
 makes pointer from integer without a cast
Message-ID: <202302020226.XF4SDEoW-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_101823_205017_623FDEE6 
X-CRM114-Status: GOOD (  13.61  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3
head:   ac3cfb78163256f2febd47ebd017d9f5b75820dd
commit: a1d2a5262341eafc84074a0688f37fe4020cd65f [8/25] ARC: mm: Make virt_to_pfn() a static inline
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20230202/202302020226.XF4SDEoW-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=a1d2a5262341eafc84074a0688f37fe4020cd65f
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3
        git checkout a1d2a5262341eafc84074a0688f37fe4020cd65f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/arc/include/asm/page.h:137,
                    from arch/arc/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/namei.h:5,
                    from fs/cifs/dfs.c:6:
   fs/cifs/cifsglob.h: In function 'cifs_sg_set_buf':
>> fs/cifs/cifsglob.h:2217:48: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
    2217 |                 sg_set_page(sg++, virt_to_page(addr), buflen, off);
         |                                                ^~~~
         |                                                |
         |                                                long unsigned int
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   fs/cifs/cifsglob.h:2217:35: note: in expansion of macro 'virt_to_page'
    2217 |                 sg_set_page(sg++, virt_to_page(addr), buflen, off);
         |                                   ^~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
--
   In file included from arch/arc/include/asm/page.h:137,
                    from arch/arc/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/cifs/smb2pdu.c:18:
   fs/cifs/cifsglob.h: In function 'cifs_sg_set_buf':
>> fs/cifs/cifsglob.h:2217:48: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
    2217 |                 sg_set_page(sg++, virt_to_page(addr), buflen, off);
         |                                                ^~~~
         |                                                |
         |                                                long unsigned int
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   fs/cifs/cifsglob.h:2217:35: note: in expansion of macro 'virt_to_page'
    2217 |                 sg_set_page(sg++, virt_to_page(addr), buflen, off);
         |                                   ^~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   during RTL pass: mach
   fs/cifs/smb2pdu.c: In function 'smb2_reconnect':
   fs/cifs/smb2pdu.c:350:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
     350 | }
         | ^
   0x59b7d9 arc_ifcvt
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/config/arc/arc.cc:9642
   0xdeaf74 arc_reorg
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/config/arc/arc.cc:8424
   0xaaab69 execute
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/reorg.cc:3927
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   In file included from arch/arc/include/asm/page.h:137,
                    from arch/arc/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/pagemap.h:8,
                    from fs/cifs/smb1ops.c:8:
   fs/cifs/cifsglob.h: In function 'cifs_sg_set_buf':
>> fs/cifs/cifsglob.h:2217:48: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
    2217 |                 sg_set_page(sg++, virt_to_page(addr), buflen, off);
         |                                                ^~~~
         |                                                |
         |                                                long unsigned int
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   fs/cifs/cifsglob.h:2217:35: note: in expansion of macro 'virt_to_page'
    2217 |                 sg_set_page(sg++, virt_to_page(addr), buflen, off);
         |                                   ^~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   during RTL pass: mach
   fs/cifs/smb1ops.c: In function 'check2ndT2':
   fs/cifs/smb1ops.c:284:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
     284 | }
         | ^
   0x59b7d9 arc_ifcvt
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/config/arc/arc.cc:9642
   0xdeaf74 arc_reorg
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/config/arc/arc.cc:8424
   0xaaab69 execute
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/reorg.cc:3927
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   In file included from arch/arc/include/asm/page.h:137,
                    from arch/arc/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/cifs/cifssmb.c:17:
   fs/cifs/cifsglob.h: In function 'cifs_sg_set_buf':
>> fs/cifs/cifsglob.h:2217:48: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
    2217 |                 sg_set_page(sg++, virt_to_page(addr), buflen, off);
         |                                                ^~~~
         |                                                |
         |                                                long unsigned int
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   fs/cifs/cifsglob.h:2217:35: note: in expansion of macro 'virt_to_page'
    2217 |                 sg_set_page(sg++, virt_to_page(addr), buflen, off);
         |                                   ^~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   during RTL pass: mach
   fs/cifs/cifssmb.c: In function 'SMBOldQFSInfo':
   fs/cifs/cifssmb.c:4594:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
    4594 | }
         | ^
   0x59b7d9 arc_ifcvt
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/config/arc/arc.cc:9642
   0xdeaf74 arc_reorg
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/config/arc/arc.cc:8424
   0xaaab69 execute
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/reorg.cc:3927
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   In file included from arch/arc/include/asm/page.h:137,
                    from arch/arc/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/cifs/smb2file.c:9:
   fs/cifs/cifsglob.h: In function 'cifs_sg_set_buf':
>> fs/cifs/cifsglob.h:2217:48: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
    2217 |                 sg_set_page(sg++, virt_to_page(addr), buflen, off);
         |                                                ^~~~
         |                                                |
         |                                                long unsigned int
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   fs/cifs/cifsglob.h:2217:35: note: in expansion of macro 'virt_to_page'
    2217 |                 sg_set_page(sg++, virt_to_page(addr), buflen, off);
         |                                   ^~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   during RTL pass: mach
   fs/cifs/smb2file.c: In function 'smb2_push_mandatory_locks':
   fs/cifs/smb2file.c:371:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
     371 | }
         | ^
   0x59b7d9 arc_ifcvt
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/config/arc/arc.cc:9642
   0xdeaf74 arc_reorg
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/config/arc/arc.cc:8424
   0xaaab69 execute
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/reorg.cc:3927
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   In file included from arch/arc/include/asm/page.h:137,
                    from arch/arc/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/cifs/cifsacl.c:11:
   fs/cifs/cifsglob.h: In function 'cifs_sg_set_buf':
>> fs/cifs/cifsglob.h:2217:48: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
    2217 |                 sg_set_page(sg++, virt_to_page(addr), buflen, off);
         |                                                ^~~~
         |                                                |
         |                                                long unsigned int
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   fs/cifs/cifsglob.h:2217:35: note: in expansion of macro 'virt_to_page'
    2217 |                 sg_set_page(sg++, virt_to_page(addr), buflen, off);
         |                                   ^~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   during RTL pass: mach
   fs/cifs/cifsacl.c: In function 'parse_sid':
   fs/cifs/cifsacl.c:1189:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
    1189 | }
         | ^
   0x59b7d9 arc_ifcvt
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/config/arc/arc.cc:9642
   0xdeaf74 arc_reorg
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/config/arc/arc.cc:8424
   0xaaab69 execute
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/reorg.cc:3927
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   In file included from arch/arc/include/asm/page.h:137,
                    from include/linux/mm_types_task.h:16,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from fs/cifs/cifsfs.c:13:
   fs/cifs/cifsglob.h: In function 'cifs_sg_set_buf':
>> fs/cifs/cifsglob.h:2217:48: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
    2217 |                 sg_set_page(sg++, virt_to_page(addr), buflen, off);
         |                                                ^~~~
         |                                                |
         |                                                long unsigned int
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   fs/cifs/cifsglob.h:2217:35: note: in expansion of macro 'virt_to_page'
    2217 |                 sg_set_page(sg++, virt_to_page(addr), buflen, off);
         |                                   ^~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   during RTL pass: mach
   fs/cifs/cifsfs.c: In function 'cifs_init_request_bufs':
   fs/cifs/cifsfs.c:1589:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
    1589 | }
         | ^
   0x59b7d9 arc_ifcvt
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/config/arc/arc.cc:9642
   0xdeaf74 arc_reorg
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/config/arc/arc.cc:8424
   0xaaab69 execute
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/reorg.cc:3927
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
--
   In file included from arch/arc/include/asm/page.h:137,
                    from arch/arc/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/cifs/connect.c:8:
   fs/cifs/cifsglob.h: In function 'cifs_sg_set_buf':
>> fs/cifs/cifsglob.h:2217:48: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
    2217 |                 sg_set_page(sg++, virt_to_page(addr), buflen, off);
         |                                                ^~~~
         |                                                |
         |                                                long unsigned int
   include/asm-generic/memory_model.h:18:46: note: in definition of macro '__pfn_to_page'
      18 | #define __pfn_to_page(pfn)      (mem_map + ((pfn) - ARCH_PFN_OFFSET))
         |                                              ^~~
   fs/cifs/cifsglob.h:2217:35: note: in expansion of macro 'virt_to_page'
    2217 |                 sg_set_page(sg++, virt_to_page(addr), buflen, off);
         |                                   ^~~~~~~~~~~~
   arch/arc/include/asm/page.h:124:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     124 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
   during RTL pass: mach
   fs/cifs/connect.c: In function 'reconn_set_ipaddr_from_hostname':
   fs/cifs/connect.c:129:1: internal compiler error: in arc_ifcvt, at config/arc/arc.cc:9642
     129 | }
         | ^
   0x59b7d9 arc_ifcvt
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/config/arc/arc.cc:9642
   0xdeaf74 arc_reorg
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/config/arc/arc.cc:8424
   0xaaab69 execute
   	/tmp/build-crosstools-gcc-12.1.0-binutils-2.38/gcc/gcc-12.1.0/gcc/reorg.cc:3927
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.
..


vim +/virt_to_pfn +2217 fs/cifs/cifsglob.h

f7f291e14dde32 Paulo Alcantara 2022-12-11  2194  
f7f291e14dde32 Paulo Alcantara 2022-12-11  2195  /* We can not use the normal sg_set_buf() as we will sometimes pass a
f7f291e14dde32 Paulo Alcantara 2022-12-11  2196   * stack object as buf.
f7f291e14dde32 Paulo Alcantara 2022-12-11  2197   */
f7f291e14dde32 Paulo Alcantara 2022-12-11  2198  static inline struct scatterlist *cifs_sg_set_buf(struct scatterlist *sg,
f7f291e14dde32 Paulo Alcantara 2022-12-11  2199  						  const void *buf,
f7f291e14dde32 Paulo Alcantara 2022-12-11  2200  						  unsigned int buflen)
f7f291e14dde32 Paulo Alcantara 2022-12-11  2201  {
f7f291e14dde32 Paulo Alcantara 2022-12-11  2202  	unsigned long addr = (unsigned long)buf;
f7f291e14dde32 Paulo Alcantara 2022-12-11  2203  	unsigned int off = offset_in_page(addr);
f7f291e14dde32 Paulo Alcantara 2022-12-11  2204  
f7f291e14dde32 Paulo Alcantara 2022-12-11  2205  	addr &= PAGE_MASK;
f7f291e14dde32 Paulo Alcantara 2022-12-11  2206  	if (unlikely(is_vmalloc_addr((void *)addr))) {
f7f291e14dde32 Paulo Alcantara 2022-12-11  2207  		do {
f7f291e14dde32 Paulo Alcantara 2022-12-11  2208  			unsigned int len = min_t(unsigned int, buflen, PAGE_SIZE - off);
f7f291e14dde32 Paulo Alcantara 2022-12-11  2209  
f7f291e14dde32 Paulo Alcantara 2022-12-11  2210  			sg_set_page(sg++, vmalloc_to_page((void *)addr), len, off);
f7f291e14dde32 Paulo Alcantara 2022-12-11  2211  
f7f291e14dde32 Paulo Alcantara 2022-12-11  2212  			off = 0;
f7f291e14dde32 Paulo Alcantara 2022-12-11  2213  			addr += PAGE_SIZE;
f7f291e14dde32 Paulo Alcantara 2022-12-11  2214  			buflen -= len;
f7f291e14dde32 Paulo Alcantara 2022-12-11  2215  		} while (buflen);
f7f291e14dde32 Paulo Alcantara 2022-12-11  2216  	} else {
f7f291e14dde32 Paulo Alcantara 2022-12-11 @2217  		sg_set_page(sg++, virt_to_page(addr), buflen, off);
f7f291e14dde32 Paulo Alcantara 2022-12-11  2218  	}
f7f291e14dde32 Paulo Alcantara 2022-12-11  2219  	return sg;
f7f291e14dde32 Paulo Alcantara 2022-12-11  2220  }
f7f291e14dde32 Paulo Alcantara 2022-12-11  2221  

:::::: The code at line 2217 was first introduced by commit
:::::: f7f291e14dde32a07b1f0aa06921d28f875a7b54 cifs: fix oops during encryption

:::::: TO: Paulo Alcantara <pc@cjr.nz>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
