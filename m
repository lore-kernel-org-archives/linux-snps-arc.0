Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD67D7831C
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Dec 2024 18:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u/cyp9OmyKbnpyNQOEsYYVKj8KdO1QapeE852WRyE0w=; b=doFkAQ/HfRD+mY
	RYU5fYM/ZVUGaEWvbV0qdAMNoWf6CwzKolDirdWvvSEfFCk7c2DIE6VxTm0fbd74RZYD3QUMiOFDC
	F8KXhmK1fwToZe47mSL1MLlBfxDVB8u9Zd2/4PmitcYofpDzyBOdtC88kJFbfUMgLqB3WNb+u9i/3
	E+A9YXghoyfqxbxye3jm2Iter+qVLcCFOx70t0Fj3i/N0t0XGTN95lInutD7On92xfbxCGIzgk1ch
	bNBhwmtHvktQCwiARck0lkqRhvBbSXYjYKlRDH4/y4Z5AbCdXUppRquapHl+WTCBWpJQj13Q1zyEp
	ozFj+J8uJl3sXa5WBuWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAjb-000000076o3-0nac;
	Mon, 02 Dec 2024 18:01:23 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAhP-000000076AI-1dBM
	for linux-snps-arc@lists.infradead.org;
	Mon, 02 Dec 2024 17:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733162347; x=1764698347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pmnArA//bkpdhkHU/fQej/A6gmLmA9azQ3MuefzXl5U=;
  b=dWOD/SmpXG8Lf3swCPcmUTQaVR8wGCUB6WAttmp1A/BBLfJgtl30wfRj
   UwSPecQz3Xqu79+WhrV4+NYzeRDYYW906qsCX3kZigujoPbW3qmdA49yv
   04mDOytCxeYFSvkM8m89HDn/f8uC8qW6lM9I5/XQNggpe8wSxjh8fg6Ri
   NN8z2IgSrUQPB54iSjEvN/suGJUSFJubk0kFz8fGdyfNw4TlBJ/ehAugU
   8P3xYk8eKwo85aOIiIRovNP7evV9M0l6NDLMTA5fyzNGyXb8DERYcpGCf
   KfMuJYtn2IuMdyEdEZ2tmwa4IZB2FfZ4vinhMc5+6uMEjRkAaRX3FhHQy
   A==;
X-CSE-ConnectionGUID: Do5J/IY4Tc+k2XQ/abFPSg==
X-CSE-MsgGUID: uEG0F08ESyeHVHf7xtdH1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="50868449"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="50868449"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 09:59:06 -0800
X-CSE-ConnectionGUID: LMwZfNzTRnegJqXWq83g+A==
X-CSE-MsgGUID: p6cFK7QMRsq7FR0lwHnivg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="97612437"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 02 Dec 2024 09:59:05 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIAhL-0002hR-0V;
	Mon, 02 Dec 2024 17:59:03 +0000
Date: Tue, 3 Dec 2024 01:58:13 +0800
From: kernel test robot <lkp@intel.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Vineet Gupta <vgupta@synopsys.com>
Subject: arch/arc/plat-hsdk/platform.c:16:5: sparse: sparse: symbol
 'arc_hsdk_axi_dmac_coherent' was not declared. Should it be static?
Message-ID: <202412030106.M5RMPcBO-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_095907_440614_A589F502 
X-CRM114-Status: UNSURE (   7.13  )
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
head:   e70140ba0d2b1a30467d4af6bcfe761327b9ec95
commit: ce0eff0d9b4d37702df48a39e3fddb5e39b2c25b ARC: [plat-hsdk]: allow to switch between AXI DMAC port configurations
date:   5 years ago
config: arc-randconfig-r123-20241118 (https://download.01.org/0day-ci/archive/20241203/202412030106.M5RMPcBO-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241203/202412030106.M5RMPcBO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030106.M5RMPcBO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arc/plat-hsdk/platform.c:16:5: sparse: sparse: symbol 'arc_hsdk_axi_dmac_coherent' was not declared. Should it be static?
   arch/arc/plat-hsdk/platform.c:27:17: sparse: sparse: undefined identifier '__builtin_arc_sr'
   arch/arc/plat-hsdk/platform.c:34:17: sparse: sparse: undefined identifier '__builtin_arc_sr'

vim +/arc_hsdk_axi_dmac_coherent +16 arch/arc/plat-hsdk/platform.c

    15	
  > 16	int arc_hsdk_axi_dmac_coherent __section(.data) = 0;
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
