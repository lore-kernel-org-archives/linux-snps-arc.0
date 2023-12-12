Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BAAC4332F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Dec 2023 03:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nT0ZDs8GQB14jAi0XAgkLeaDKvPZ7fZpwSRWF2G9Q0E=; b=gqacAVOH32pWJU
	UI9nIeSUSb7w1FnFb4+ZYmEkALTUMpSEOIIu5Pws1wwgS2IBEIDpgUIpngnMGxZz6S84GQ2g9GaMx
	K46lcmEKEglRcz7r6IUPj4WIaadRx4qJJGixk8/fhhIcE66zIrGbktGiZFGrLfwyti6aZ8eIWCJ1G
	gCmUJik2GqM9nU+fAk65bvOqwvXIgfqo/q5wgPHgzjpE8NI5vfCU7SxTJzQU1k/QYuet/oQQ+EVC7
	Mhb3DbhdrCK2gBDbr101o0rFeBn/i+lzv9i/uYHVJgkbFHKdt404WbuNZkHZddlhaf8Wo94wsZo2N
	uuQDCYkmdP2iB/a2Yj5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCtvn-00AgVC-1f;
	Tue, 12 Dec 2023 03:59:39 +0000
Received: from mgamail.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCtvk-00AgUV-08
	for linux-snps-arc@lists.infradead.org;
	Tue, 12 Dec 2023 03:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702353576; x=1733889576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Afw15phHVe1Jt4mVG0qU1/2iUMnOrh9UOSr/5QymW6g=;
  b=FQnxe9WrIyAanjpUpuT1s7R4uaolrpm2ZGe+nQGTL4q7lLIBQDtL6zbx
   jRcE97S730AiSsRztq0O6wrRPzavboimf6veb6/N8jDv/X7uNnolhEc0L
   /R7fY+/e5wMjwEePjxgtNSfizosOQw09dFQlrLlGBfV7NK3qyV7LVxskl
   oUSc5nkMSrulkmAjexAKqN6PpDnu5AVEzovQJ+DjZDL/ZitAmGEzsjKEK
   6R2ZEGEoL+syEuIPgwzbO5tCQ7lFaiutRYTd9TDjpAFKygDCtlu3T7+sf
   KdWd2O7rCaQmPNYu6uZS4Ih8yRjk23dWtUhvASZQCdaaggdZSllUvef1t
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="374907656"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="374907656"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 19:59:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1020525995"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; 
   d="scan'208";a="1020525995"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 11 Dec 2023 19:59:31 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCtvd-000IkJ-0C;
	Tue, 12 Dec 2023 03:59:29 +0000
Date: Tue, 12 Dec 2023 11:59:17 +0800
From: kernel test robot <lkp@intel.com>
To: Vineet Gupta <vgupta@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org
Subject: arch/arc/kernel/signal.c:77:31: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202312121137.0sza62Xl-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_195936_092293_40C69A79 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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
head:   26aff849438cebcd05f1a647390c4aa700d5c0f1
commit: 96f1b00138cb8f04c742c82d0a7c460b2202e887 ARCv2: save ABI registers across signal handling
date:   2 years, 6 months ago
config: arc-randconfig-r111-20231107 (https://download.01.org/0day-ci/archive/20231212/202312121137.0sza62Xl-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231212/202312121137.0sza62Xl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312121137.0sza62Xl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arc/kernel/signal.c:77:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got struct user_regs_arcv2 * @@
   arch/arc/kernel/signal.c:77:31: sparse:     expected void [noderef] __user *to
   arch/arc/kernel/signal.c:77:31: sparse:     got struct user_regs_arcv2 *
>> arch/arc/kernel/signal.c:88:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got struct user_regs_arcv2 * @@
   arch/arc/kernel/signal.c:88:41: sparse:     expected void const [noderef] __user *from
   arch/arc/kernel/signal.c:88:41: sparse:     got struct user_regs_arcv2 *
>> arch/arc/kernel/signal.c:134:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sigcontext *mctx @@     got struct sigcontext [noderef] __user * @@
   arch/arc/kernel/signal.c:134:42: sparse:     expected struct sigcontext *mctx
   arch/arc/kernel/signal.c:134:42: sparse:     got struct sigcontext [noderef] __user *
   arch/arc/kernel/signal.c:153:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sigcontext *mctx @@     got struct sigcontext [noderef] __user * @@
   arch/arc/kernel/signal.c:153:45: sparse:     expected struct sigcontext *mctx
   arch/arc/kernel/signal.c:153:45: sparse:     got struct sigcontext [noderef] __user *

vim +77 arch/arc/kernel/signal.c

    63	
    64	static int save_arcv2_regs(struct sigcontext *mctx, struct pt_regs *regs)
    65	{
    66		int err = 0;
    67	#ifndef CONFIG_ISA_ARCOMPACT
    68		struct user_regs_arcv2 v2abi;
    69	
    70		v2abi.r30 = regs->r30;
    71	#ifdef CONFIG_ARC_HAS_ACCL_REGS
    72		v2abi.r58 = regs->r58;
    73		v2abi.r59 = regs->r59;
    74	#else
    75		v2abi.r58 = v2abi.r59 = 0;
    76	#endif
  > 77		err = __copy_to_user(&mctx->v2abi, &v2abi, sizeof(v2abi));
    78	#endif
    79		return err;
    80	}
    81	
    82	static int restore_arcv2_regs(struct sigcontext *mctx, struct pt_regs *regs)
    83	{
    84		int err = 0;
    85	#ifndef CONFIG_ISA_ARCOMPACT
    86		struct user_regs_arcv2 v2abi;
    87	
  > 88		err = __copy_from_user(&v2abi, &mctx->v2abi, sizeof(v2abi));
    89	
    90		regs->r30 = v2abi.r30;
    91	#ifdef CONFIG_ARC_HAS_ACCL_REGS
    92		regs->r58 = v2abi.r58;
    93		regs->r59 = v2abi.r59;
    94	#endif
    95	#endif
    96		return err;
    97	}
    98	
    99	static int
   100	stash_usr_regs(struct rt_sigframe __user *sf, struct pt_regs *regs,
   101		       sigset_t *set)
   102	{
   103		int err;
   104		struct user_regs_struct uregs;
   105	
   106		uregs.scratch.bta	= regs->bta;
   107		uregs.scratch.lp_start	= regs->lp_start;
   108		uregs.scratch.lp_end	= regs->lp_end;
   109		uregs.scratch.lp_count	= regs->lp_count;
   110		uregs.scratch.status32	= regs->status32;
   111		uregs.scratch.ret	= regs->ret;
   112		uregs.scratch.blink	= regs->blink;
   113		uregs.scratch.fp	= regs->fp;
   114		uregs.scratch.gp	= regs->r26;
   115		uregs.scratch.r12	= regs->r12;
   116		uregs.scratch.r11	= regs->r11;
   117		uregs.scratch.r10	= regs->r10;
   118		uregs.scratch.r9	= regs->r9;
   119		uregs.scratch.r8	= regs->r8;
   120		uregs.scratch.r7	= regs->r7;
   121		uregs.scratch.r6	= regs->r6;
   122		uregs.scratch.r5	= regs->r5;
   123		uregs.scratch.r4	= regs->r4;
   124		uregs.scratch.r3	= regs->r3;
   125		uregs.scratch.r2	= regs->r2;
   126		uregs.scratch.r1	= regs->r1;
   127		uregs.scratch.r0	= regs->r0;
   128		uregs.scratch.sp	= regs->sp;
   129	
   130		err = __copy_to_user(&(sf->uc.uc_mcontext.regs.scratch), &uregs.scratch,
   131				     sizeof(sf->uc.uc_mcontext.regs.scratch));
   132	
   133		if (is_isa_arcv2())
 > 134			err |= save_arcv2_regs(&(sf->uc.uc_mcontext), regs);
   135	
   136		err |= __copy_to_user(&sf->uc.uc_sigmask, set, sizeof(sigset_t));
   137	
   138		return err ? -EFAULT : 0;
   139	}
   140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
