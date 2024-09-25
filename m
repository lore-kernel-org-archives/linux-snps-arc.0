Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3FCACF9C6C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 25 Sep 2024 05:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iTGu0SWOsLJKYh0dhpTWD2QOwT1sfSzOgpmtmslph/U=; b=0Oqlt1ig9kmho+
	xTm35d68Ab/Z7dYsubpoUmkvJr/3nhdeIOhLI5C83/b+ZVWGDgRj4Dsjjg5T2xL3xBBn1NWrQlSHW
	zHqBRGkUduDocUStz5rvTSCtstrGZNSD12167nKIFLn76SRmWy9lCFzqA7d2sslzPeuU8PtutZ/Ck
	rNrUVFTMXmH1ID3knAD6c9ouUAyowMWQIVuGaYx5KNPjb/IygPJsTFDKlDoxo/J+C04Ud1+ACBzYj
	cZ3zQEE6kD6Gfxev1a0U4ZsqzxArU8kL+zuCIFVJmzdhauBxHeCVZjuknNpOLjjdU2qp1WA9t59/u
	Zle0zy8iJN9v+A0y23LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stKlv-000000045jX-234S;
	Wed, 25 Sep 2024 05:41:07 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stKls-000000045j3-4BEX
	for linux-snps-arc@lists.infradead.org;
	Wed, 25 Sep 2024 05:41:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727242865; x=1758778865;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UVkNjYeFFCF67JxcsgWC+lgXDCVMhTIWWgUX3vPrnss=;
  b=lnGas267RPgTXFJmdoi7DOpxcU8uXa5rU7sW7RtdWPcXNtLWNWc9eRUK
   7v3vNGuQarBixjXzKQjSBhZ71cf5ix1o6qJH2UiD5jx3nkiXKYj/HI6WO
   eAOVznj0LdH6NyWZcpOGqdaX9SMyBpeyrUms2kPiQ7bNa4z4f5Mp6zFU1
   IcNKH/IhDQCDrilewle7dL4thX3XXKWqXRj+ilQMNsa2qDTpPSOz7Bibm
   5Ir6/XJ9rLzCAlmzCqfXq39i3IZ/XScX75NHwciZN3mgL+fP0uiSFkx9L
   5i/0bMfAxszntQj8ixFKxKUHz2UzquPk1FEcXzNUKljgM32Nw/bhnv1QK
   A==;
X-CSE-ConnectionGUID: PR70sAhrQN6UEZXEbw1xKg==
X-CSE-MsgGUID: MbZY9g2lQ5SrFNJ3JSAeww==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="51687043"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="51687043"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 22:41:03 -0700
X-CSE-ConnectionGUID: s9ITmdW2TCWoATkkNVKhOw==
X-CSE-MsgGUID: 70CtaZREQvuuNdPRWdaYaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="71535129"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Sep 2024 22:41:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stKln-000JBU-0c;
	Wed, 25 Sep 2024 05:40:59 +0000
Date: Wed, 25 Sep 2024 13:40:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org
Subject: arch/arc/kernel/smp.c:267:18: sparse: sparse: cast removes address
 space '__percpu' of expression
Message-ID: <202409251336.ToC0TvWB-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_224105_077043_97C23CF5 
X-CRM114-Status: GOOD (  12.20  )
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
head:   684a64bf32b6e488004e0ad7f0d7e922798f65b6
commit: f2519d4d4fc4d36f2b58c5614357de9f5b4032fc ARC: Emulate one-byte cmpxchg
date:   12 days ago
config: arc-randconfig-r123-20240925 (https://download.01.org/0day-ci/archive/20240925/202409251336.ToC0TvWB-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240925/202409251336.ToC0TvWB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409251336.ToC0TvWB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arc/kernel/smp.c:252:48: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __percpu *ipi_data_ptr @@     got unsigned long * @@
   arch/arc/kernel/smp.c:252:48: sparse:     expected unsigned long [noderef] __percpu *ipi_data_ptr
   arch/arc/kernel/smp.c:252:48: sparse:     got unsigned long *
   arch/arc/kernel/smp.c:267:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *v @@     got unsigned long [noderef] __percpu *__ai_ptr @@
   arch/arc/kernel/smp.c:267:18: sparse:     expected void const volatile *v
   arch/arc/kernel/smp.c:267:18: sparse:     got unsigned long [noderef] __percpu *__ai_ptr
>> arch/arc/kernel/smp.c:267:18: sparse: sparse: cast removes address space '__percpu' of expression
>> arch/arc/kernel/smp.c:267:18: sparse: sparse: cast removes address space '__percpu' of expression
   arch/arc/kernel/smp.c:401:72: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected void [noderef] __percpu *percpu_dev_id @@     got int *dev @@
   arch/arc/kernel/smp.c:401:72: sparse:     expected void [noderef] __percpu *percpu_dev_id
   arch/arc/kernel/smp.c:401:72: sparse:     got int *dev
   arch/arc/kernel/smp.c:265:30: sparse: sparse: dereference of noderef expression

vim +/__percpu +267 arch/arc/kernel/smp.c

41195d236e8445 Vineet Gupta    2013-01-18  249  
ddf84433f411b6 Vineet Gupta    2013-11-25  250  static void ipi_send_msg_one(int cpu, enum ipi_msg_type msg)
41195d236e8445 Vineet Gupta    2013-01-18  251  {
f2a4aa5646687f Vineet Gupta    2013-11-26  252  	unsigned long __percpu *ipi_data_ptr = per_cpu_ptr(&ipi_data, cpu);
d8e8c7dda11f5d Vineet Gupta    2013-11-28  253  	unsigned long old, new;
41195d236e8445 Vineet Gupta    2013-01-18  254  	unsigned long flags;
41195d236e8445 Vineet Gupta    2013-01-18  255  
f2a4aa5646687f Vineet Gupta    2013-11-26  256  	pr_debug("%d Sending msg [%d] to %d\n", smp_processor_id(), msg, cpu);
f2a4aa5646687f Vineet Gupta    2013-11-26  257  
41195d236e8445 Vineet Gupta    2013-01-18  258  	local_irq_save(flags);
41195d236e8445 Vineet Gupta    2013-01-18  259  
d8e8c7dda11f5d Vineet Gupta    2013-11-28  260  	/*
d8e8c7dda11f5d Vineet Gupta    2013-11-28  261  	 * Atomically write new msg bit (in case others are writing too),
d8e8c7dda11f5d Vineet Gupta    2013-11-28  262  	 * and read back old value
d8e8c7dda11f5d Vineet Gupta    2013-11-28  263  	 */
d8e8c7dda11f5d Vineet Gupta    2013-11-28  264  	do {
c6ed4d84a2c49d Bang Li         2022-03-19  265  		new = old = *ipi_data_ptr;
d8e8c7dda11f5d Vineet Gupta    2013-11-28  266  		new |= 1U << msg;
d8e8c7dda11f5d Vineet Gupta    2013-11-28 @267  	} while (cmpxchg(ipi_data_ptr, old, new) != old);
41195d236e8445 Vineet Gupta    2013-01-18  268  
d8e8c7dda11f5d Vineet Gupta    2013-11-28  269  	/*
d8e8c7dda11f5d Vineet Gupta    2013-11-28  270  	 * Call the platform specific IPI kick function, but avoid if possible:
d8e8c7dda11f5d Vineet Gupta    2013-11-28  271  	 * Only do so if there's no pending msg from other concurrent sender(s).
82a423053eb3cf Changcheng Deng 2021-08-14  272  	 * Otherwise, receiver will see this msg as well when it takes the
d8e8c7dda11f5d Vineet Gupta    2013-11-28  273  	 * IPI corresponding to that msg. This is true, even if it is already in
d8e8c7dda11f5d Vineet Gupta    2013-11-28  274  	 * IPI handler, because !@old means it has not yet dequeued the msg(s)
d8e8c7dda11f5d Vineet Gupta    2013-11-28  275  	 * so @new msg can be a free-loader
d8e8c7dda11f5d Vineet Gupta    2013-11-28  276  	 */
d8e8c7dda11f5d Vineet Gupta    2013-11-28  277  	if (plat_smp_ops.ipi_send && !old)
ddf84433f411b6 Vineet Gupta    2013-11-25  278  		plat_smp_ops.ipi_send(cpu);
41195d236e8445 Vineet Gupta    2013-01-18  279  
41195d236e8445 Vineet Gupta    2013-01-18  280  	local_irq_restore(flags);
41195d236e8445 Vineet Gupta    2013-01-18  281  }
41195d236e8445 Vineet Gupta    2013-01-18  282  

:::::: The code at line 267 was first introduced by commit
:::::: d8e8c7dda11f5d5cf90495f2e89d917a83509bc0 ARC: [SMP] optimize IPI send and receive

:::::: TO: Vineet Gupta <vgupta@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
