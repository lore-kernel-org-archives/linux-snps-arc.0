Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39742C47258
	for <linux-snps-arc@archiver.kernel.org>; Thu, 25 Jan 2024 15:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qJTT2Or1i1mhZq9gQilnQaGZYHrgqYhtol/M62XXq+E=; b=bVyuTxcACfdMnD
	sMBLHB1epv5BESCkQzFAGyXDMkwzinfrdBshWXWzbPkD2oxKmSb/masfjNCdw94DbW4jCVzgi0+6T
	RE+7aNZlyRIXf/vt562nvdKmljF74L2wWNrNcBX6IaewILJWaqcD1qDJzT+OQ6R71E5c3aFDZQ7hS
	IOWlZ8GFJwQQTjrY2ewocZxSODGTNzIR74Fj4khGoR++MqSGDTZ0ZgkW4yCzwDprh5OUArmiCqsXg
	kcy70kOl/yUIpwJCXmPIeIevC64ADg1ntA8MXyi91crc3c2yfgekljeNG4CWK1lXWZTwHPrHIan9A
	vxC3QOF3Q8MBZjFMi24g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT1Yb-00000000bFO-0vfz;
	Thu, 25 Jan 2024 15:22:21 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT1YY-00000000bBY-4BQN
	for linux-snps-arc@lists.infradead.org;
	Thu, 25 Jan 2024 15:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706196138; x=1737732138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=su1Mgq4fZUUogYwZxT5HTLTDkgoOuBntb5pescN973g=;
  b=f+3EATkf21Izy2zDo9nLOVnxL9vXY7dJViTdqer1HqyGhdVc+yMR5PaL
   AFhyMjrTGDTUSAeNVdnfwRTwJS7zLdJ8pCzZ9VC7VXv01LAmRETtrrclV
   +qBoQjt3hM6UaagS+lAd/pzIcwqk1GkYpmm/7MRSZ5I4cmG99Sm/dPmUW
   ZL0s0Ir+ITjtsnXYduUQwXxn6/h8rkVHUmcX5nbPBUr2qMH38uaZHD8VR
   Of1b6JIShjoWuJuAJi6iPbgsudVZsrS4fqSDg/CL2EYspnQ3PmLPvqs1L
   zmrAoDh0hz7IdXrzWkvsO22Czd2mRN94e4IHozH1T3SIOitO04etdE5MG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="8843596"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8843596"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 07:21:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2276941"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 25 Jan 2024 07:21:57 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rT1YA-00008i-1P;
	Thu, 25 Jan 2024 15:21:54 +0000
Date: Thu, 25 Jan 2024 23:21:22 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Brodkin <abrodkin@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Vineet Gupta <vgupta@synopsys.com>
Subject: arch/arc/kernel/devtree.c:64:23: warning: variable 'dt_root' set but
 not used
Message-ID: <202401252355.5NfsqG3G-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_072219_119849_F27F64CC 
X-CRM114-Status: GOOD (  10.88  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6098d87eaf31f48153c984e2adadf14762520a87
commit: 6e9318d1be83714e004a0ac795a936df4d2bed3e ARC: RIP arc_{get|set}_core_freq() clk API
date:   8 years ago
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20240125/202401252355.5NfsqG3G-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401252355.5NfsqG3G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401252355.5NfsqG3G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel.h:11,
                    from include/asm-generic/bug.h:13,
                    from arch/arc/include/asm/bug.h:31,
                    from include/linux/bug.h:4,
                    from include/linux/thread_info.h:11,
                    from include/asm-generic/current.h:4,
                    from arch/arc/include/asm/current.h:23,
                    from include/linux/mutex.h:13,
                    from include/linux/notifier.h:13,
                    from include/linux/reboot.h:5,
                    from arch/arc/kernel/devtree.c:13:
   include/linux/log2.h:22:1: warning: ignoring attribute 'noreturn' because it conflicts with attribute 'const' [-Wattributes]
      22 | int ____ilog2_NaN(void);
         | ^~~
   arch/arc/kernel/devtree.c: In function 'setup_machine_fdt':
>> arch/arc/kernel/devtree.c:64:23: warning: variable 'dt_root' set but not used [-Wunused-but-set-variable]
      64 |         unsigned long dt_root;
         |                       ^~~~~~~


vim +/dt_root +64 arch/arc/kernel/devtree.c

880beb8807814c Rob Herring  2013-08-27  53  
999159a5381bff Vineet Gupta 2013-01-22  54  /**
999159a5381bff Vineet Gupta 2013-01-22  55   * setup_machine_fdt - Machine setup when an dtb was passed to the kernel
999159a5381bff Vineet Gupta 2013-01-22  56   * @dt:		virtual address pointer to dt blob
999159a5381bff Vineet Gupta 2013-01-22  57   *
999159a5381bff Vineet Gupta 2013-01-22  58   * If a dtb was passed to the kernel, then use it to choose the correct
999159a5381bff Vineet Gupta 2013-01-22  59   * machine_desc and to setup the system.
999159a5381bff Vineet Gupta 2013-01-22  60   */
880beb8807814c Rob Herring  2013-08-27  61  const struct machine_desc * __init setup_machine_fdt(void *dt)
999159a5381bff Vineet Gupta 2013-01-22  62  {
880beb8807814c Rob Herring  2013-08-27  63  	const struct machine_desc *mdesc;
999159a5381bff Vineet Gupta 2013-01-22 @64  	unsigned long dt_root;

:::::: The code at line 64 was first introduced by commit
:::::: 999159a5381bff3bd6f688c5d20fbec9d8789e53 ARC: [DeviceTree] Basic support

:::::: TO: Vineet Gupta <vgupta@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
