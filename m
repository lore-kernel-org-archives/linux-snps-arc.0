Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31EAC433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Mar 2022 14:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5D5Y8PPLDAF1ZelPWs8CWM8Otz4qTEzZstBxsxXGsKE=; b=yVae1YL8mHdDO9
	2midhiXbBNoJkgSwHbSZWjIrVjmGw71juZKNtRHGnEqQvuMSX8zpC2iErP60t5ooCpLSQ3c86id0E
	VsctOoQ/DTtwk8M3PoHD3Zc4d1rsseGlV8UIW/u/1qTH1hjHjFKmjUjjtsbZUFBLMmnmPL4tmrtf/
	wZvI8yHeqkhobngN3loGQm1FhU5BQThTh3Hz9qLkrYRpn24YmsTDLS/sBFVyk2WeS5P4a6oEEywD6
	YWKr7m4wHP/FJ04wlim13fjnKWI0IRDQhuplOPRGX4DMhyQzFROd9v7rL+APn82owYPT+jeh5wJtE
	Lqc196e674Eju7u0ZL0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU8eA-009bWF-EA; Tue, 15 Mar 2022 14:59:38 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU8dZ-009bDW-Jq
 for linux-snps-arc@lists.infradead.org; Tue, 15 Mar 2022 14:59:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647356341; x=1678892341;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=BYnnyv9X5T2BKkwKlwpsPI4UkWTK+ZkTG1MysC+XAAY=;
 b=Kz6fKWyr752dVFSaed3/pLjRLtkByzq1PuoTZ3Sp4oPT7cL1n/quNezO
 azntmoVrDHi5lMNcO+TF4XP5nOku6qEDVB7y7ZQ0CheuVkvxzSnG/DoIY
 T/AnnZJsYokpG8uS5atG+gQ0OnIZf9pQFNwQ2/6rNwf6qGz/L/PopGCDH
 l2kR+eCPiaU8feXBdxiyjceCW3JiHIJgUpLMJQKyAEaKahe7QhXfnjgQs
 ZwQU/+v3LgSz4ydC4Z9mHg1yGV+jqqoOnSs/xgGDQyINW6kB1xZgJ4IMo
 dAou1nZPWE81tLWX9hUmRgVi5BPFbVKSTTRxXUaiSwf4WXYmPXzUw5d2f w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="281095709"
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; d="scan'208";a="281095709"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 07:59:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; d="scan'208";a="580541994"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 15 Mar 2022 07:58:59 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nU8dW-000B7z-CF; Tue, 15 Mar 2022 14:58:58 +0000
Date: Tue, 15 Mar 2022 22:58:36 +0800
From: kernel test robot <lkp@intel.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org
Subject: arch/arc/kernel/smp.c:279:18: sparse: sparse: dereference of noderef
 expression
Message-ID: <202203152229.15m9xTw1-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_075901_702468_4E824485 
X-CRM114-Status: GOOD (  14.96  )
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
head:   09688c0166e76ce2fb85e86b9d99be8b0084cdf9
commit: e188f3330a13df904d77003846eafd3edf99009d ARC: cmpxchg/xchg: rewrite as macros to make type safe
date:   7 months ago
config: arc-randconfig-s032-20220315 (https://download.01.org/0day-ci/archive/20220315/202203152229.15m9xTw1-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e188f3330a13df904d77003846eafd3edf99009d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e188f3330a13df904d77003846eafd3edf99009d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc SHELL=/bin/bash arch/arc/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   arch/arc/kernel/smp.c:264:48: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __percpu *ipi_data_ptr @@     got unsigned long * @@
   arch/arc/kernel/smp.c:264:48: sparse:     expected unsigned long [noderef] __percpu *ipi_data_ptr
   arch/arc/kernel/smp.c:264:48: sparse:     got unsigned long *
   arch/arc/kernel/smp.c:279:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *v @@     got unsigned long [noderef] __percpu *__ai_ptr @@
   arch/arc/kernel/smp.c:279:18: sparse:     expected void const volatile *v
   arch/arc/kernel/smp.c:279:18: sparse:     got unsigned long [noderef] __percpu *__ai_ptr
   arch/arc/kernel/smp.c:277:29: sparse: sparse: cast removes address space '__percpu' of expression
   arch/arc/kernel/smp.c:413:72: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected void [noderef] __percpu *percpu_dev_id @@     got int *dev @@
   arch/arc/kernel/smp.c:413:72: sparse:     expected void [noderef] __percpu *percpu_dev_id
   arch/arc/kernel/smp.c:413:72: sparse:     got int *dev
>> arch/arc/kernel/smp.c:279:18: sparse: sparse: dereference of noderef expression
>> arch/arc/kernel/smp.c:279:18: sparse: sparse: dereference of noderef expression

vim +279 arch/arc/kernel/smp.c

41195d236e84458 Vineet Gupta    2013-01-18  261  
ddf84433f411b61 Vineet Gupta    2013-11-25  262  static void ipi_send_msg_one(int cpu, enum ipi_msg_type msg)
41195d236e84458 Vineet Gupta    2013-01-18  263  {
f2a4aa5646687f9 Vineet Gupta    2013-11-26 @264  	unsigned long __percpu *ipi_data_ptr = per_cpu_ptr(&ipi_data, cpu);
d8e8c7dda11f5d5 Vineet Gupta    2013-11-28  265  	unsigned long old, new;
41195d236e84458 Vineet Gupta    2013-01-18  266  	unsigned long flags;
41195d236e84458 Vineet Gupta    2013-01-18  267  
f2a4aa5646687f9 Vineet Gupta    2013-11-26  268  	pr_debug("%d Sending msg [%d] to %d\n", smp_processor_id(), msg, cpu);
f2a4aa5646687f9 Vineet Gupta    2013-11-26  269  
41195d236e84458 Vineet Gupta    2013-01-18  270  	local_irq_save(flags);
41195d236e84458 Vineet Gupta    2013-01-18  271  
d8e8c7dda11f5d5 Vineet Gupta    2013-11-28  272  	/*
d8e8c7dda11f5d5 Vineet Gupta    2013-11-28  273  	 * Atomically write new msg bit (in case others are writing too),
d8e8c7dda11f5d5 Vineet Gupta    2013-11-28  274  	 * and read back old value
d8e8c7dda11f5d5 Vineet Gupta    2013-11-28  275  	 */
d8e8c7dda11f5d5 Vineet Gupta    2013-11-28  276  	do {
6aa7de059173a98 Mark Rutland    2017-10-23  277  		new = old = READ_ONCE(*ipi_data_ptr);
d8e8c7dda11f5d5 Vineet Gupta    2013-11-28  278  		new |= 1U << msg;
d8e8c7dda11f5d5 Vineet Gupta    2013-11-28 @279  	} while (cmpxchg(ipi_data_ptr, old, new) != old);
41195d236e84458 Vineet Gupta    2013-01-18  280  
d8e8c7dda11f5d5 Vineet Gupta    2013-11-28  281  	/*
d8e8c7dda11f5d5 Vineet Gupta    2013-11-28  282  	 * Call the platform specific IPI kick function, but avoid if possible:
d8e8c7dda11f5d5 Vineet Gupta    2013-11-28  283  	 * Only do so if there's no pending msg from other concurrent sender(s).
82a423053eb3cf2 Changcheng Deng 2021-08-14  284  	 * Otherwise, receiver will see this msg as well when it takes the
d8e8c7dda11f5d5 Vineet Gupta    2013-11-28  285  	 * IPI corresponding to that msg. This is true, even if it is already in
d8e8c7dda11f5d5 Vineet Gupta    2013-11-28  286  	 * IPI handler, because !@old means it has not yet dequeued the msg(s)
d8e8c7dda11f5d5 Vineet Gupta    2013-11-28  287  	 * so @new msg can be a free-loader
d8e8c7dda11f5d5 Vineet Gupta    2013-11-28  288  	 */
d8e8c7dda11f5d5 Vineet Gupta    2013-11-28  289  	if (plat_smp_ops.ipi_send && !old)
ddf84433f411b61 Vineet Gupta    2013-11-25  290  		plat_smp_ops.ipi_send(cpu);
41195d236e84458 Vineet Gupta    2013-01-18  291  
41195d236e84458 Vineet Gupta    2013-01-18  292  	local_irq_restore(flags);
41195d236e84458 Vineet Gupta    2013-01-18  293  }
41195d236e84458 Vineet Gupta    2013-01-18  294  

:::::: The code at line 279 was first introduced by commit
:::::: d8e8c7dda11f5d5cf90495f2e89d917a83509bc0 ARC: [SMP] optimize IPI send and receive

:::::: TO: Vineet Gupta <vgupta@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
