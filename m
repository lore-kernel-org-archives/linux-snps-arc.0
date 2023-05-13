Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9513AC77B7A
	for <linux-snps-arc@archiver.kernel.org>; Sat, 13 May 2023 17:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8XDzEo5J8xJsAT0ai7cdz+czCl5r6DfUg1E6S78i4lc=; b=EuTmmhhabWV01b
	6ZjZ5VuF8SE/l74LxAOFbi2eEEZ4/lorOUb03k2YnHjy2rxpsODnOaUSVIEYv9gvYqEjL0LaY4A2j
	06a+WI+VUiFBp+NhRTIhrFuUh/N6e69rzXog+RfJ1mjtog8v+X0tZKEvs2I2UnE8MVIyxMZ5kjhuG
	keRxlHfjYaZ7cFd1I39tHOQcGJMNHWrJw9k69y2hdjxVoIpbF1cSz0np9bzmaeKjDmOc26oS64ZdK
	rXuv+9m+Lg3kUFFWXjVCyatXorDve778ob0NPUi++3imEZF7uhEGGtOLCAF+oxmgb4CEMKjL/lB+F
	HQljg7L3FSiS4CbJHcAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxtH7-00FVER-0m;
	Sat, 13 May 2023 17:43:21 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxtH4-00FVDq-32
	for linux-snps-arc@lists.infradead.org;
	Sat, 13 May 2023 17:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683999798; x=1715535798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=88jyIMp6SlH8QBy+dqsdhN23w/LtxLvndTg8Q9XNfM4=;
  b=B4KiXV5X0sbXz/zO6m0noqUcdqIwV9xYF9oYA+65gpF1Rsybl1WYq97W
   2kOa/nFnw3ciE8161SAlcbV/KRj7o76XIDYpBbMvSvPTo8ePAHdbb0fJ0
   XYKaTuWp+PhzNoiW2SxFAl6OqxUxxA5Me6zSfGkrjZftQpSw1/Gk6D/xF
   3WUUrfV1ZxRElU+T8aVyTHApn3zq8wSBfSCIy+gmW9p16rNrlzUdxAYdq
   N0ziiZ9R7CBuxE8N8n3+2TgYKkLYJCRIbocUd1kXvAaS+EYGJcicwlEXe
   CJaWC5O4RKiNu1AG3lGSPMkywiW5YF5GzmfMq2EcdbDDi+3Xi9ul1LvcE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="330593772"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="330593772"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 10:43:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10709"; a="694569206"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="694569206"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 May 2023 10:43:15 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxtH0-0005cW-1F;
	Sat, 13 May 2023 17:43:14 +0000
Date: Sun, 14 May 2023 01:43:09 +0800
From: kernel test robot <lkp@intel.com>
To: Bang Li <libang.linuxer@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Vineet Gupta <vgupta@kernel.org>
Subject: arch/arc/kernel/smp.c:277:30: sparse: sparse: dereference of noderef
 expression
Message-ID: <202305140134.BC2YZdG1-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230513_104319_034518_22C7771C 
X-CRM114-Status: GOOD (  11.44  )
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
head:   d4d58949a6eac1c45ab022562c8494725e1ac094
commit: c6ed4d84a2c49de7d6f490144cca7b4a4831fb6e ARC: remove redundant READ_ONCE() in cmpxchg loop
date:   1 year, 1 month ago
config: arc-randconfig-s041-20230513 (https://download.01.org/0day-ci/archive/20230514/202305140134.BC2YZdG1-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c6ed4d84a2c49de7d6f490144cca7b4a4831fb6e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c6ed4d84a2c49de7d6f490144cca7b4a4831fb6e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc SHELL=/bin/bash arch/arc/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305140134.BC2YZdG1-lkp@intel.com/

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
 > 264		unsigned long __percpu *ipi_data_ptr = per_cpu_ptr(&ipi_data, cpu);
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
https://github.com/intel/lkp-tests

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
