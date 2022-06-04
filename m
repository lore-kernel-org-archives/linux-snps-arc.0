Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A378DC433EF
	for <linux-snps-arc@archiver.kernel.org>; Sat,  4 Jun 2022 08:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QWMTf4Jv5nbpEbhNp/sknUzRScecQxGmto+VPbQgh2Q=; b=bItbg6dZ0UooZM
	5Qw2yGnuh+XSN6WmbrRIZjp6lTVrTnu13Hrae3QQBDtHUgJeRJudKBHdL2dRcvvg1xUQiD8sGlDhN
	+eaF66IC1HJxYcR+h6Uu0TMo4p/irdmop1Fo+pVtCSxZXazRc7Ayc6S/ISAIEvOXDrb87cNqJEFsI
	DRBH//qkDQ0V+9mFn62RETsstbrl55/0ydm6usiPpsMHixRPxRG9QlM/GOZXeI8mDkba0q5taOqS6
	Cf7/AuQtsAimb/UnxvKPlnNOcDFPBuAOVsZpD3XlcStE1CR9J0SQ+hYGv76ALeqbpDb9L4fCtKZrs
	nK11x3Xf4B7bUgMFxEIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxPJk-00Au28-6m; Sat, 04 Jun 2022 08:39:32 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxPJi-00Au1P-5t
	for linux-snps-arc@lists.infradead.org; Sat, 04 Jun 2022 08:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654331970; x=1685867970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p2asbGTYnRUKSc6CNgW+MxeAm9Vp8COBTvXPjJA1nPE=;
  b=ChpZu1xeeyu4XKzkSfIv6EJkw/IP+wStK7nEdPnPgCnoUBMQfzdgTSLq
   6p+5PgQF9bHZdRrokl1PDoujM5v9uqMzmd5qTtoJtN0jCihpPyWw2OPdf
   hueRwB+m8Ghhqst1BnPG6aizR8u3mDDioCvRHwPRLruxYUqnix248XQL8
   fpKup0TvNItEok8d9d1YWqci+YGwjSlF5/aVkf/jOqq4FvNxImopOWEud
   J4qMdRHa8RqK6+gO0Lej8Gb32dwsSfQZmT4WeO9emR4/dus/6mfvjAE8d
   muGOvU/mpBho7bGGsgZ5D/Nl4cqPR5ohe7tpRM7lUqdYlSc+PPtWGE9LT
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10367"; a="273976807"
X-IronPort-AV: E=Sophos;i="5.91,277,1647327600"; 
   d="scan'208";a="273976807"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2022 01:39:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,277,1647327600"; 
   d="scan'208";a="531347788"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 Jun 2022 01:39:25 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nxPJc-000AWB-9O;
	Sat, 04 Jun 2022 08:39:24 +0000
Date: Sat, 4 Jun 2022 16:38:49 +0800
From: kernel test robot <lkp@intel.com>
To: Bang Li <libang.linuxer@gmail.com>
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Vineet Gupta <vgupta@kernel.org>
Subject: arch/arc/kernel/smp.c:277:30: sparse: sparse: dereference of noderef
 expression
Message-ID: <202206041630.8CNeV2bc-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220604_013930_310030_45CE5BFB 
X-CRM114-Status: GOOD (  13.67  )
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
head:   032dcf09e2bf7c822be25b4abef7a6c913870d98
commit: c6ed4d84a2c49de7d6f490144cca7b4a4831fb6e ARC: remove redundant READ_ONCE() in cmpxchg loop
date:   7 weeks ago
config: arc-randconfig-s032-20220603 (https://download.01.org/0day-ci/archive/20220604/202206041630.8CNeV2bc-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-18-g56afb504-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c6ed4d84a2c49de7d6f490144cca7b4a4831fb6e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c6ed4d84a2c49de7d6f490144cca7b4a4831fb6e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc SHELL=/bin/bash arch/arc/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   arch/arc/kernel/smp.c:264:48: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __percpu *ipi_data_ptr @@     got unsigned long * @@
   arch/arc/kernel/smp.c:264:48: sparse:     expected unsigned long [noderef] __percpu *ipi_data_ptr
   arch/arc/kernel/smp.c:264:48: sparse:     got unsigned long *
   arch/arc/kernel/smp.c:279:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *v @@     got unsigned long [noderef] __percpu *__ai_ptr @@
   arch/arc/kernel/smp.c:279:18: sparse:     expected void const volatile *v
   arch/arc/kernel/smp.c:279:18: sparse:     got unsigned long [noderef] __percpu *__ai_ptr
   arch/arc/kernel/smp.c:413:72: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected void [noderef] __percpu *percpu_dev_id @@     got int *dev @@
   arch/arc/kernel/smp.c:413:72: sparse:     expected void [noderef] __percpu *percpu_dev_id
   arch/arc/kernel/smp.c:413:72: sparse:     got int *dev
>> arch/arc/kernel/smp.c:277:30: sparse: sparse: dereference of noderef expression

vim +277 arch/arc/kernel/smp.c

   261	
   262	static void ipi_send_msg_one(int cpu, enum ipi_msg_type msg)
   263	{
   264		unsigned long __percpu *ipi_data_ptr = per_cpu_ptr(&ipi_data, cpu);
   265		unsigned long old, new;
   266		unsigned long flags;
   267	
   268		pr_debug("%d Sending msg [%d] to %d\n", smp_processor_id(), msg, cpu);
   269	
   270		local_irq_save(flags);
   271	
   272		/*
   273		 * Atomically write new msg bit (in case others are writing too),
   274		 * and read back old value
   275		 */
   276		do {
 > 277			new = old = *ipi_data_ptr;
   278			new |= 1U << msg;
   279		} while (cmpxchg(ipi_data_ptr, old, new) != old);
   280	
   281		/*
   282		 * Call the platform specific IPI kick function, but avoid if possible:
   283		 * Only do so if there's no pending msg from other concurrent sender(s).
   284		 * Otherwise, receiver will see this msg as well when it takes the
   285		 * IPI corresponding to that msg. This is true, even if it is already in
   286		 * IPI handler, because !@old means it has not yet dequeued the msg(s)
   287		 * so @new msg can be a free-loader
   288		 */
   289		if (plat_smp_ops.ipi_send && !old)
   290			plat_smp_ops.ipi_send(cpu);
   291	
   292		local_irq_restore(flags);
   293	}
   294	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
