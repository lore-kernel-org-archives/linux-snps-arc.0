Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D478D49762
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Dec 2024 11:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=le36aq4vFfRmngF+R2wxZrgIynetdHldhFFmW10oquU=; b=ngBSw+KapFkEYY
	TKRntbKWaO/Dl/U1Em+jLEWitQiQw816nXLAPXYkEq/4v9t0tfMPGQudomTljHMOGW9t3lj5KwRo8
	rdA4oC48DOZlzonWlnQtycgDMb/TuYCTNGyPzm6Wbtwsb7ATEzUQnk+Q2/umLZ1WsRI3XmDYoPEXC
	E2V5iTuVpTjyjwNGxPCNC/MPNiWUkFFNr1SjmJW7P7HBlDy3wIsEQvm1z+eF7jxqAa0fce5wMZuU8
	/XNX1Wmirw78LsX+lTH69yMbH1RKmyELkun9iqCOmVKxQB2evDEZSl4LW9eCOIVhACJ3zuBSQsNdL
	jtNxp25/TJWOOzrJDrMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHhlo-00000003Kwa-2Vxx;
	Sun, 01 Dec 2024 11:05:44 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHhll-00000003Kw2-0NgR
	for linux-snps-arc@lists.infradead.org;
	Sun, 01 Dec 2024 11:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733051142; x=1764587142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HALIbz4s2YRGdPjdnzVz3gtEcq5r7ZwQr6IBm+hWpU0=;
  b=KHYBnOFRQ1e8ipM2KxPYN55DVbA32EK7Bl10MqTkuGhwC/Z2hhW5wkjJ
   GJyaFMolc6T7THAVwBBWCFgzyZTYVJaANut3MiWBqP72WnIdX4P7x+A/D
   pSj865FdmtXym7PUggr3ANX2dAfvjZP7UPwJ46htmcFWtynUc4YgvbmoI
   x/CddQjvGaBNLdpU9wj++DZPuPZZYzH3tpvlIfCKn0THySCjPHKIUsvrw
   4aaV/f863fi3+rEOq0CzuDohz5MCWIvf2wnurt895iwKmY7pYWSYSDiGf
   y/YgwUeDCMk2yMmA/W0NZYY7ggisXLSpVHjwF8yEK5cT+79lzIvjx0qrE
   A==;
X-CSE-ConnectionGUID: i4IYg+ZzSuK+GagcnVzWoA==
X-CSE-MsgGUID: QubkQb/uRkO3Ho0WSrYkrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="33373996"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="33373996"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 03:05:39 -0800
X-CSE-ConnectionGUID: iKyKunp8T3eT7i5I6Ysc0A==
X-CSE-MsgGUID: V/9Etc/DRhu4EoaugM9Kzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="92947396"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 01 Dec 2024 03:05:37 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHhle-0001Tp-1M;
	Sun, 01 Dec 2024 11:05:34 +0000
Date: Sun, 1 Dec 2024 19:04:50 +0800
From: kernel test robot <lkp@intel.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org
Subject: include/linux/compiler_types.h:328:45: error: call to
 '__compiletime_assert_292' declared with attribute error: BUILD_BUG_ON
 failed: (PTRS_PER_PTE * sizeof(pte_t)) > PAGE_SIZE
Message-ID: <202412011908.nBxlyBTQ-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_030541_224125_79F64AF8 
X-CRM114-Status: GOOD (  11.34  )
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

Hi Vineet,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc8eda6d34934d80b96adb8dc4ff5dfc632a53a
commit: d9820ff76f95fa26d33e412254a89cd65b23142d ARC: mm: switch pgtable_t back to struct page *
date:   3 years, 3 months ago
config: arc-randconfig-r131-20241118 (https://download.01.org/0day-ci/archive/20241201/202412011908.nBxlyBTQ-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241201/202412011908.nBxlyBTQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412011908.nBxlyBTQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arc/mm/init.c:35:13: warning: no previous prototype for 'arc_get_mem_sz' [-Wmissing-prototypes]
      35 | long __init arc_get_mem_sz(void)
         |             ^~~~~~~~~~~~~~
   arch/arc/mm/init.c:88:13: warning: no previous prototype for 'setup_arch_memory' [-Wmissing-prototypes]
      88 | void __init setup_arch_memory(void)
         |             ^~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   arch/arc/mm/init.c: In function 'mem_init':
>> include/linux/compiler_types.h:328:45: error: call to '__compiletime_assert_292' declared with attribute error: BUILD_BUG_ON failed: (PTRS_PER_PTE * sizeof(pte_t)) > PAGE_SIZE
     328 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:309:25: note: in definition of macro '__compiletime_assert'
     309 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:328:9: note: in expansion of macro '_compiletime_assert'
     328 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/arc/mm/init.c:194:9: note: in expansion of macro 'BUILD_BUG_ON'
     194 |         BUILD_BUG_ON((PTRS_PER_PTE * sizeof(pte_t)) > PAGE_SIZE);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_292 +328 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  314  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  315  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  316  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  317  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  318  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  319   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  320   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  321   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  322   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  323   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  324   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  325   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  326   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  327  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @328  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  329  

:::::: The code at line 328 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
