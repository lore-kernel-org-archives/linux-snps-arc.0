Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EECC433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Mar 2022 03:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qjUpJDtnUDsU1U90LGSc+LXhXCCu0q4ojhzF8SBeYG8=; b=FrJrvkI4JKQe/y
	lvNPD3iMf2Ems/Yewc3O2uzj64C1SodoZ/LOoZRMWtKM+2+wZPqlngmI75JiX4H+HRGtMWK7C+cS9
	LDyHqZf91JQd5EeCFjMoQo/chaD2XFUwwizH9lvBHHQnpA2iLWjAGxN2bE3BzlhD3JCrpRvjX0KUY
	K5ECJmh62NY6c8GSBtOngoosp4qDZ7U44ZVWUynkg2x1VSa2JkVJs34UanJDoAllLBL1xu8YgP3Qq
	yPtD8mJf+XRyHgxAoBBlA0tTYZxEZOdexi5bxWwSfcqrV45l+/VQIXwgD0GX0OI8nKvOUlPWngjx9
	BKAar8+x8zPm5Kd8LJwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSVbi-00Er7s-QP; Fri, 11 Mar 2022 03:06:22 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSVbf-00Er6l-5w
 for linux-snps-arc@lists.infradead.org; Fri, 11 Mar 2022 03:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646967979; x=1678503979;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=1Lqyqm7Fm7LZ9Zgf9Nro6Ch9fX24HO/O/bFeTDIFbnc=;
 b=A3Bm83LjcXSCDLtSLz0flyPWrgxE923DljC3fjmXiXZdG48zVPpPJWfF
 HZiKSnJujiv2qJ8Wuv9rWaaBFQztdX/X+Ngj/a/vZKSACmbNWBlzm/5GG
 s97lnwJefoB7xwItb+c+CNSzWP/POiEXRroL4BJIhB+uwIMn0oMXSz9ve
 mnoHHIiE8CzN6/Sze54hNdwepoqnED/Idcd1+kUTV/5NC0mwiPtSkAbK9
 gF2s+IQkrK1GXScB1bMjrPL0C3cOvZCKQIE0VvSNjkWV7iQqHh5N5WVfV
 RLmRnoOJTlZoov/As9/HMUS8IVWEV1W7tzhPXOxGixyJMEp9Awr1Yk5z9 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="255221130"
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="255221130"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 19:06:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="688938790"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 10 Mar 2022 19:06:16 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nSVbc-0005kj-7u; Fri, 11 Mar 2022 03:06:16 +0000
Date: Fri, 11 Mar 2022 11:05:27 +0800
From: kernel test robot <lkp@intel.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org
Subject: arch/arc/kernel/smp.c:279:18: sparse: sparse: dereference of noderef
 expression
Message-ID: <202203111015.NjLSlxCA-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_190619_298255_7CA69683 
X-CRM114-Status: GOOD (  14.49  )
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
head:   1db333d9a51f3459fba1bcaa564d95befe79f0b3
commit: e188f3330a13df904d77003846eafd3edf99009d ARC: cmpxchg/xchg: rewrite as macros to make type safe
date:   7 months ago
config: arc-randconfig-s032-20220310 (https://download.01.org/0day-ci/archive/20220311/202203111015.NjLSlxCA-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc SHELL=/bin/bash arch/arc/kernel/ fs/ kernel/ net/ipv4/

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
--
   fs/file.c:350:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **old_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:350:17: sparse:     expected struct file **old_fds
   fs/file.c:350:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:351:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **new_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:351:17: sparse:     expected struct file **new_fds
   fs/file.c:351:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:366:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/file.c:366:17: sparse:    struct file [noderef] __rcu *
   fs/file.c:366:17: sparse:    struct file *
>> fs/file.c:401:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu *[assigned] _val_ @@
   fs/file.c:441:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fdtable [noderef] __rcu *fdt @@     got struct fdtable * @@
   fs/file.c:608:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:762:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:813:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:1038:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *tofree @@     got struct file [noderef] __rcu * @@
--
   net/ipv4/tcp_cong.c:238:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct tcp_congestion_ops const [noderef] __rcu *_val_ @@     got struct tcp_congestion_ops *[assigned] ca @@
   net/ipv4/tcp_cong.c:238:24: sparse:     expected struct tcp_congestion_ops const [noderef] __rcu *_val_
   net/ipv4/tcp_cong.c:238:24: sparse:     got struct tcp_congestion_ops *[assigned] ca
>> net/ipv4/tcp_cong.c:238:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tcp_congestion_ops const *prev @@     got struct tcp_congestion_ops const [noderef] __rcu *[assigned] _val_ @@
   net/ipv4/tcp_cong.c:238:22: sparse:     expected struct tcp_congestion_ops const *prev
   net/ipv4/tcp_cong.c:238:22: sparse:     got struct tcp_congestion_ops const [noderef] __rcu *[assigned] _val_

vim +279 arch/arc/kernel/smp.c

41195d236e8445 Vineet Gupta    2013-01-18  261  
ddf84433f411b6 Vineet Gupta    2013-11-25  262  static void ipi_send_msg_one(int cpu, enum ipi_msg_type msg)
41195d236e8445 Vineet Gupta    2013-01-18  263  {
f2a4aa5646687f Vineet Gupta    2013-11-26 @264  	unsigned long __percpu *ipi_data_ptr = per_cpu_ptr(&ipi_data, cpu);
d8e8c7dda11f5d Vineet Gupta    2013-11-28  265  	unsigned long old, new;
41195d236e8445 Vineet Gupta    2013-01-18  266  	unsigned long flags;
41195d236e8445 Vineet Gupta    2013-01-18  267  
f2a4aa5646687f Vineet Gupta    2013-11-26  268  	pr_debug("%d Sending msg [%d] to %d\n", smp_processor_id(), msg, cpu);
f2a4aa5646687f Vineet Gupta    2013-11-26  269  
41195d236e8445 Vineet Gupta    2013-01-18  270  	local_irq_save(flags);
41195d236e8445 Vineet Gupta    2013-01-18  271  
d8e8c7dda11f5d Vineet Gupta    2013-11-28  272  	/*
d8e8c7dda11f5d Vineet Gupta    2013-11-28  273  	 * Atomically write new msg bit (in case others are writing too),
d8e8c7dda11f5d Vineet Gupta    2013-11-28  274  	 * and read back old value
d8e8c7dda11f5d Vineet Gupta    2013-11-28  275  	 */
d8e8c7dda11f5d Vineet Gupta    2013-11-28  276  	do {
6aa7de059173a9 Mark Rutland    2017-10-23  277  		new = old = READ_ONCE(*ipi_data_ptr);
d8e8c7dda11f5d Vineet Gupta    2013-11-28  278  		new |= 1U << msg;
d8e8c7dda11f5d Vineet Gupta    2013-11-28 @279  	} while (cmpxchg(ipi_data_ptr, old, new) != old);
41195d236e8445 Vineet Gupta    2013-01-18  280  
d8e8c7dda11f5d Vineet Gupta    2013-11-28  281  	/*
d8e8c7dda11f5d Vineet Gupta    2013-11-28  282  	 * Call the platform specific IPI kick function, but avoid if possible:
d8e8c7dda11f5d Vineet Gupta    2013-11-28  283  	 * Only do so if there's no pending msg from other concurrent sender(s).
82a423053eb3cf Changcheng Deng 2021-08-14  284  	 * Otherwise, receiver will see this msg as well when it takes the
d8e8c7dda11f5d Vineet Gupta    2013-11-28  285  	 * IPI corresponding to that msg. This is true, even if it is already in
d8e8c7dda11f5d Vineet Gupta    2013-11-28  286  	 * IPI handler, because !@old means it has not yet dequeued the msg(s)
d8e8c7dda11f5d Vineet Gupta    2013-11-28  287  	 * so @new msg can be a free-loader
d8e8c7dda11f5d Vineet Gupta    2013-11-28  288  	 */
d8e8c7dda11f5d Vineet Gupta    2013-11-28  289  	if (plat_smp_ops.ipi_send && !old)
ddf84433f411b6 Vineet Gupta    2013-11-25  290  		plat_smp_ops.ipi_send(cpu);
41195d236e8445 Vineet Gupta    2013-01-18  291  
41195d236e8445 Vineet Gupta    2013-01-18  292  	local_irq_restore(flags);
41195d236e8445 Vineet Gupta    2013-01-18  293  }
41195d236e8445 Vineet Gupta    2013-01-18  294  

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
