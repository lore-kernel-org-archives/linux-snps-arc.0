Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2174C46CCD
	for <linux-snps-arc@archiver.kernel.org>; Sun, 17 Dec 2023 13:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MVXviVdAA8qxXPVy+aCGazPU8Pge2ixoiT0Fwy7zvXc=; b=WoCqnydSg59Uno
	LoyAlqEc6uEV5pkpRB/ZZBCJGl7AFMIvBgMSaU4LhmWO/VbDR7Hv71HMvgCv27kbkQS63urDRPHu/
	6lsI3WkfaJDrObP9KVQNyjUcagvPClGb/myuN2FyS4X3L6xynQi3iXtfMmXFegRP8JiRwp0I2Z+4X
	KPRGOXB9SIcHonWXg2nyP7mcOXoAXV9qDpMMxbV3DXVneyI1mYDQA2HLbofQFOwPFbeHtFbVF6yFz
	Bfk0az0pnIHNcGqEx+V1Li/qVODBRgdJK+n/RAHVYkUNtInaoE4oto+wb7pLA/adWRTSOweKTuMdE
	oeYySO+7t1ayr/dcAtew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rErVJ-007twn-2H;
	Sun, 17 Dec 2023 13:48:25 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rErVH-007tvu-0k
	for linux-snps-arc@lists.infradead.org;
	Sun, 17 Dec 2023 13:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702820903; x=1734356903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3bmy019Ze3o0nhRb7RQ/W5So8i0WEX5x0CPBGipLuM8=;
  b=I7Xu4R1IUnpeuh7jA+71QBQAbL2lufum0xudMZUrwGWPD6GZGxHvjcqK
   CZV/gwLDulEOHbnKYBlcoRzwws6Dy1NPRIL3PDDsh3tppV9Bt6U75CT6S
   Oy12e80hF8LUQHHxOD+NJJ15K1xXXij1X8hd2ZHm7Q5Kzhe3L4SW0ce4q
   BSA1hdVFS58A0PydkfgXL322z5zUMlk/uk72OM69khxE88gG8PRQRMKVP
   rsng6lUIpWclq+Pu8zZLCDLNThYu5LxVY1hdqPImzJFwqQVF96kx0hGfW
   IJB6y9aVJ53UsWgMpr490x60YgiSesD6G5JD8pOFlmH6b8QT1oltD2U+t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="380408270"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="380408270"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 05:48:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="16869810"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 Dec 2023 05:48:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rErVA-00035E-1f;
	Sun, 17 Dec 2023 13:48:16 +0000
Date: Sun, 17 Dec 2023 21:47:21 +0800
From: kernel test robot <lkp@intel.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Vineet Gupta <vgupta@synopsys.com>
Subject: arch/arc/plat-hsdk/platform.c:16:5: sparse: sparse: symbol
 'arc_hsdk_axi_dmac_coherent' was not declared. Should it be static?
Message-ID: <202312172140.FvgljCBk-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_054823_354647_0DD7297B 
X-CRM114-Status: UNSURE (   7.44  )
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
head:   3b8a9b2e6809d281890dd0a1102dc14d2cd11caf
commit: ce0eff0d9b4d37702df48a39e3fddb5e39b2c25b ARC: [plat-hsdk]: allow to switch between AXI DMAC port configurations
date:   4 years, 4 months ago
config: arc-randconfig-r111-20231107 (https://download.01.org/0day-ci/archive/20231217/202312172140.FvgljCBk-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231217/202312172140.FvgljCBk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312172140.FvgljCBk-lkp@intel.com/

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
