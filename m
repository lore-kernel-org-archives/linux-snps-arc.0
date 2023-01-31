Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719A5C636D3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 31 Jan 2023 01:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+1AkjqgF2gA5l0V9fYH/O4DVqjwpg5rVsl+zxrRDY74=; b=NtHFk12AdqKiHt
	morVkTkAaCxYLVQVHgNJLl4pZiqWpEqdRv2ywuuk36IzzAhb0P7NIgk/LL+BibT3tmdsak7WNkRNh
	EkFH0GGx5UYaDNWv84d9pcb0zbBnebaY5+T+FzCQ3lVVO/JAR21C70mIoDTKMfLIg/sNfpK1GzYdF
	ybMztnqw9CPIB2Yvt4B4E+lanvvumWhoZqh3CciXnohMyfbSuo1CcKoUXKlOBHde6GRjf4fL0z4h7
	sMWwg5eVwGacqqxrc01OBPGPa466glWfyuRz10a7eBujNfpLgjkIcCxRdCRjfa8VjIB5rDi4va5jq
	Z+y3TN7H6CH9ga34OCLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMfVj-0060MX-IO; Tue, 31 Jan 2023 01:32:35 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMfVg-0060Lm-NF
	for linux-snps-arc@lists.infradead.org; Tue, 31 Jan 2023 01:32:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675128752; x=1706664752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DVVUHCJkdlHzN/Qyr7qxovz+HaTSVvu46IWwTF8US/o=;
  b=DyjbuDi/C14aOtPkKo7c3go1iCLNr4g8BsaHvnqJlYwu1w5QPkR7qaAN
   jmP7z4wK5M5TgcHXB39BBBvfye48MTaHIyNukZXkCjEz7JEjykZCZtY6o
   JhZt21pyTBcJwT8Dv3V1Yu3IL+aCD7nMQj/AXsD3Ns3A2vmjcnisu/os6
   riSEzQuEDgizWbVMlF8JTsa3enenFljvmeo/vtaO4Q/wOik3XO9P5idWW
   c0r4fQ/NrFy3hkmAFrbJ3TWPRsTA/daM8XYl5WxmJt26u/orUZ0eyPFTP
   WEBdN4S8LPfGOfLeLL5y6xdAUEcwGTS3wqRh+M4dA2ADFDZUEqlhjeMeF
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="413940590"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="413940590"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 17:32:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="806918190"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="806918190"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2023 17:32:27 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMfVb-00042z-0g;
	Tue, 31 Jan 2023 01:32:27 +0000
Date: Tue, 31 Jan 2023 09:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org
Subject: include/linux/compiler_types.h:328:45: error: call to
 '__compiletime_assert_313' declared with attribute error: BUILD_BUG_ON
 failed: (PTRS_PER_PTE * sizeof(pte_t)) > PAGE_SIZE
Message-ID: <202301310917.6nTxesL9-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_173232_810964_91A55C82 
X-CRM114-Status: GOOD (  13.43  )
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
head:   6d796c50f84ca79f1722bb131799e5a5710c4700
commit: d9820ff76f95fa26d33e412254a89cd65b23142d ARC: mm: switch pgtable_t back to struct page *
date:   1 year, 5 months ago
config: arc-randconfig-r002-20230131 (https://download.01.org/0day-ci/archive/20230131/202301310917.6nTxesL9-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d9820ff76f95fa26d33e412254a89cd65b23142d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d9820ff76f95fa26d33e412254a89cd65b23142d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/arc/mm/init.c:35:13: warning: no previous prototype for 'arc_get_mem_sz' [-Wmissing-prototypes]
      35 | long __init arc_get_mem_sz(void)
         |             ^~~~~~~~~~~~~~
   arch/arc/mm/init.c:88:13: warning: no previous prototype for 'setup_arch_memory' [-Wmissing-prototypes]
      88 | void __init setup_arch_memory(void)
         |             ^~~~~~~~~~~~~~~~~
   In file included from <command-line>:
   arch/arc/mm/init.c: In function 'mem_init':
>> include/linux/compiler_types.h:328:45: error: call to '__compiletime_assert_313' declared with attribute error: BUILD_BUG_ON failed: (PTRS_PER_PTE * sizeof(pte_t)) > PAGE_SIZE
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


vim +/__compiletime_assert_313 +328 include/linux/compiler_types.h

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
https://github.com/intel/lkp-tests

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
