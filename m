Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E244EE49A8
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Aug 2023 08:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=85HC42nIfhQGm6NSlYZzjvYdHruXNlTcKihpjptrVNs=; b=tBlX2TnFx+BCrw
	m2aeR8Bwb04rgsTIOHvTmajVL/hWfDjPkdBuaeYtr32WVO35zidnTqjMH6PnjPEszhr7x6CQpLWR7
	xsAifduK60UCFXTEbWxCZxRbzGYTX94KGH+8Sbs7yGj86dy3NitRbYcVtedR6PcXY99/Msjtj7AeP
	mxQ/aKP1FC4k5no0UVf0nyxG2Nwjdk821OAjLPf65vL2SQKc4ECMNd1QEpyaSm9o5tI+2eKhCE5Q0
	D94ivoEHsheXA1b0cux776cyrJChsld6S9qDjZUtKQw0gmmIVIQPknf9arGyvJZ5Ot74p+VjAWSeL
	arkdOU5rfGplCe3poCWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYMO5-00FQHr-33;
	Tue, 22 Aug 2023 08:05:18 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYMO3-00FQHF-0E
	for linux-snps-arc@lists.infradead.org;
	Tue, 22 Aug 2023 08:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692691515; x=1724227515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ifEB33bKkZGzlPdCfQtP1HtOvx4eWoxlCq7FGZLkT0g=;
  b=WNHNUOhiTeFBdhmzOxQNfEv+JGv/DA94iN8Sz7rO7r8KGwFUnhGAbZXM
   cpljdqLjlbID8Iw6B36d/EQuUJCLox/5REmLRNfvvI2Wi9nWB+Oi7RPuX
   Eg3SGMyKSburdhib5IivH2KVqK83jPdUzjWCOOSe4Af121j8tFKqX1SF3
   2Xc1ODr7EBgLtrdFHL2rIQ2RGiP9STI+Vi87N9hOLMtPTy5a11N3DmDGM
   ITFXiyQIA6MRrKTPvsOoE9BuxfWpNfJxYl7K5pXQbyD5ZpqqcOBQGTAQt
   T+aiJ4szJPRgtiIhbSER/58zHD7MScKrBprZ1Q4aU5R6biP3HFHRgx6pf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="437731282"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="437731282"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 01:05:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="982792479"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="982792479"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 22 Aug 2023 01:05:11 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYMNt-0001Xc-35;
	Tue, 22 Aug 2023 08:05:09 +0000
Date: Tue, 22 Aug 2023 16:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-snps-arc@lists.infradead.org
Subject: [linux-next:pending-fixes 34/128] arch/arc/kernel/setup.c:82:13:
 warning: variable 'atomic' set but not used
Message-ID: <202308221549.XKufWEWp-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_010515_191907_C612DE14 
X-CRM114-Status: GOOD (  10.17  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git pending-fixes
head:   0b86d65557b6f9fb73ce357f14e0f22e9f47a072
commit: fad84e39f116035ae8d550c6020107b8ac113b45 [34/128] ARC: boot log: eliminate struct cpuinfo_arc #4: boot log per ISA
config: arc-randconfig-001-20230822 (https://download.01.org/0day-ci/archive/20230822/202308221549.XKufWEWp-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221549.XKufWEWp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221549.XKufWEWp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arc/kernel/setup.c: In function 'arcompact_mumbojumbo':
>> arch/arc/kernel/setup.c:82:13: warning: variable 'atomic' set but not used [-Wunused-but-set-variable]
      82 |         int atomic = 0, be, present;
         |             ^~~~~~


vim +/atomic +82 arch/arc/kernel/setup.c

    74	
    75	static int
    76	arcompact_mumbojumbo(int c, struct cpuinfo_arc *info, char *buf, int len)
    77	{
    78		int n = 0;
    79	#ifdef CONFIG_ISA_ARCOMPACT
    80		char *cpu_nm, *isa_nm = "ARCompact";
    81		struct bcr_fp_arcompact fpu_sp, fpu_dp;
  > 82		int atomic = 0, be, present;
    83		int bpu_full, bpu_cache, bpu_pred;
    84		struct bcr_bpu_arcompact bpu;
    85		struct bcr_iccm_arcompact iccm;
    86		struct bcr_dccm_arcompact dccm;
    87		struct bcr_generic isa;
    88	
    89		READ_BCR(ARC_REG_ISA_CFG_BCR, isa);
    90	
    91		if (!isa.ver)	/* ISA BCR absent, use Kconfig info */
    92			atomic = IS_ENABLED(CONFIG_ARC_HAS_LLSC);
    93		else {
    94			/* ARC700_BUILD only has 2 bits of isa info */
    95			atomic = isa.info & 1;
    96		}
    97	
    98		be = IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
    99	
   100		if (info->arcver < 0x34)
   101			cpu_nm = "ARC750";
   102		else
   103			cpu_nm = "ARC770";
   104	
   105		n += scnprintf(buf + n, len - n, "processor [%d]\t: %s (%s ISA) %s\n",
   106			       c, cpu_nm, isa_nm, IS_AVAIL1(be, "[Big-Endian]"));
   107	
   108		READ_BCR(ARC_REG_FP_BCR, fpu_sp);
   109		READ_BCR(ARC_REG_DPFP_BCR, fpu_dp);
   110	
   111		if (fpu_sp.ver | fpu_dp.ver)
   112			n += scnprintf(buf + n, len - n, "FPU\t\t: %s%s\n",
   113				       IS_AVAIL1(fpu_sp.ver, "SP "),
   114				       IS_AVAIL1(fpu_dp.ver, "DP "));
   115	
   116		READ_BCR(ARC_REG_BPU_BCR, bpu);
   117		bpu_full = bpu.fam ? 1 : 0;
   118		bpu_cache = 256 << (bpu.ent - 1);
   119		bpu_pred = 256 << (bpu.ent - 1);
   120	
   121		n += scnprintf(buf + n, len - n,
   122				"BPU\t\t: %s%s match, cache:%d, Predict Table:%d\n",
   123				IS_AVAIL1(bpu_full, "full"),
   124				IS_AVAIL1(!bpu_full, "partial"),
   125				bpu_cache, bpu_pred);
   126	
   127		READ_BCR(ARC_REG_ICCM_BUILD, iccm);
   128		if (iccm.ver) {
   129			info->iccm.sz = 4096 << iccm.sz;	/* 8K to 512K */
   130			info->iccm.base = iccm.base << 16;
   131		}
   132	
   133		READ_BCR(ARC_REG_DCCM_BUILD, dccm);
   134		if (dccm.ver) {
   135			unsigned long base;
   136			info->dccm.sz = 2048 << dccm.sz;	/* 2K to 256K */
   137	
   138			base = read_aux_reg(ARC_REG_DCCM_BASE_BUILD);
   139			info->dccm.base = base & ~0xF;
   140		}
   141	
   142		/* ARCompact ISA specific sanity checks */
   143		present = fpu_dp.ver;	/* SP has no arch visible regs */
   144		CHK_OPT_STRICT(CONFIG_ARC_FPU_SAVE_RESTORE, present);
   145	#endif
   146		return n;
   147	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
