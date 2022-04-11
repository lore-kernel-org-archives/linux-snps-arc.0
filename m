Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82364C433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Apr 2022 15:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=idlDdghIKbhkLGpzTQy5TlMFYppD0omV5et/Q22Cxhw=; b=RmWFaektJJGJJ2
	hSQaLhZoUW8o3jvFGz2hbdM2yLEofqrpAgXkFZ9+LOBDPzpqGM0xxYdDFvN8V6zs+z1YuU0ndddV9
	Q+r3hgU7SoPXoBwPmYqgL1ObzaJParBP2+VfgyZhcTVuK1twLLUAfEMflWH4XsKELwBChGE7/c+Vw
	EC1IH44HZctchyc2uGm+BJWQetbggv3LB6oUB1NZwUvmWVp+i6AY/P29w17ltROq0hErIvt6TqozT
	9FNHqvKArRqk/MLCRYm0hojsAgeaT/zjz9kk1CxvEOOYeiFCyy8JixjPnhD5lNFzmMnUaltD8HQu2
	uG+SiEbuV+v4jIoT1X8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndvp9-009Va0-HX; Mon, 11 Apr 2022 15:19:27 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndvp6-009VYi-Bx
 for linux-snps-arc@lists.infradead.org; Mon, 11 Apr 2022 15:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649690364; x=1681226364;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=EpXc4mnnhUPNf1SAsOLHkEkBT9oLhamkTLhB7CDZfvE=;
 b=byjUod3mRZismIPhuTYYBeDnWq9MWXs8jMiu2x0Pk6Qjx7o3NVGpYiJM
 Ar932F7/FpD3ynxalNAMmRqyaXm+Vfwv/wLPYAOYY24rk9d9DBflMHbYS
 jCxqPX69n04pymYH0WboA9IyZ02T4TZ5gr4yVjasNggL4jZIiGmYhMPua
 xbWCSkLG8LZdoHPhZb7OeMyoJH//ezvTFUJg14XaMN7pRzFRjLloI+rCb
 RUV60r6u2KgT9HI1WR8jHmpJ/aQ8HNoFy4hzCHh/B674qR+6YqZ/dKW6V
 hCS7RwC62cE+Ed26J8/VKfKMkOYtQWiQx4xLCqqYY6tqtcZxZMrbCE/Ab A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="242080593"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="242080593"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 08:18:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="644120811"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Apr 2022 08:18:48 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ndvoV-0001w7-Lx;
 Mon, 11 Apr 2022 15:18:47 +0000
Date: Mon, 11 Apr 2022 23:17:43 +0800
From: kernel test robot <lkp@intel.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org
Subject: include/linux/compiler_types.h:328:45: error: call to
 '__compiletime_assert_297' declared with attribute error: BUILD_BUG_ON
 failed: (PTRS_PER_PGD * sizeof(pgd_t)) > PAGE_SIZE
Message-ID: <202204112315.2CXKJ59h-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_081924_538801_53E0E261 
X-CRM114-Status: GOOD (  13.47  )
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
head:   ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
commit: d9820ff76f95fa26d33e412254a89cd65b23142d ARC: mm: switch pgtable_t back to struct page *
date:   8 months ago
config: arc-randconfig-r026-20220411 (https://download.01.org/0day-ci/archive/20220411/202204112315.2CXKJ59h-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d9820ff76f95fa26d33e412254a89cd65b23142d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d9820ff76f95fa26d33e412254a89cd65b23142d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/arc/mm/init.c:35:13: warning: no previous prototype for 'arc_get_mem_sz' [-Wmissing-prototypes]
      35 | long __init arc_get_mem_sz(void)
         |             ^~~~~~~~~~~~~~
   arch/arc/mm/init.c:88:13: warning: no previous prototype for 'setup_arch_memory' [-Wmissing-prototypes]
      88 | void __init setup_arch_memory(void)
         |             ^~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   arch/arc/mm/init.c: In function 'mem_init':
>> include/linux/compiler_types.h:328:45: error: call to '__compiletime_assert_297' declared with attribute error: BUILD_BUG_ON failed: (PTRS_PER_PGD * sizeof(pgd_t)) > PAGE_SIZE
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
   arch/arc/mm/init.c:193:9: note: in expansion of macro 'BUILD_BUG_ON'
     193 |         BUILD_BUG_ON((PTRS_PER_PGD * sizeof(pgd_t)) > PAGE_SIZE);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_297 +328 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  314  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  315  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  316  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  317  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  318  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  319   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  320   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  321   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  322   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  323   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  324   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  325   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  326   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  327  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @328  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  329  

:::::: The code at line 328 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
