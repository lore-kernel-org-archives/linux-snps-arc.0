Return-Path: <SRS0=51Ju=DF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4230DC2D0A8
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Sep 2020 21:13:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 928792083B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Sep 2020 21:13:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c+naZuiq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 928792083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lrq3azWD07ldqNyznMWYMq9pA3xL91tS93dUoglXkDY=; b=c+naZuiq6OsP1XP4B7SYkfol6D
	AiO/cjppKcYPpDPvA7WlR3C3z9Y4g8Ja7ZjvmmfXQP1DgAguQpJZCqO+CzlYe9HwxZ/eRL3wMaF+l
	MTtayhcCcJiWS/1r1fnmwFNZfY/344UpJYxqeJ66eMI158XeRHscF896kIP2BrpA2oSyTzjEhXt97
	aK9fJs8Kyeysd+9hBadsV7j+FzmmJdUvKc8Ac7ncuPCw24q7crd9RgMJwDELGgInXlbiUY8eGp6rO
	YaCKVn2dG6UVivs7RObeSi13ubC3zkQCCUCdqMeGbpF68S1x4Q2axH8MUtupRP5+rt4IF5Ohdj76d
	rV2mzbOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kN0Sa-0006iu-2N; Mon, 28 Sep 2020 21:13:24 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kN0SW-0006hW-R8
 for linux-snps-arc@lists.infradead.org; Mon, 28 Sep 2020 21:13:22 +0000
IronPort-SDR: PLEAT6wyTX6y75+hOHmfDICsOHT5lsGjSwaOwhztHLQm8Tx0aaL9c6yxfknrlcoMbazB98n+wJ
 vIsQeMjneCTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="161292931"
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; d="scan'208";a="161292931"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2020 14:13:15 -0700
IronPort-SDR: s75/1bnv6ORbtW6KLmWp9ECW/A9Phk5oXgZQuhdOENUf00765MKoAWQPjNALrWYZjQNG47yz/9
 p8uY2SEHEa0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,315,1596524400"; d="scan'208";a="311952981"
Received: from lkp-server01.sh.intel.com (HELO 0e0978ea3297) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 28 Sep 2020 14:13:13 -0700
Received: from kbuild by 0e0978ea3297 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1kN0SP-0000Oo-56; Mon, 28 Sep 2020 21:13:13 +0000
Date: Tue, 29 Sep 2020 05:12:16 +0800
From: kernel test robot <lkp@intel.com>
To: Vineet Gupta <vgupta@synopsys.com>
Subject: [arc:for-curr 1/3] arch/arc/Kconfig:100: can't open file
 "arch/arc/plat-eznps/Kconfig"
Message-ID: <202009290507.qo8zki0m%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_171321_024213_8D16ED35 
X-CRM114-Status: GOOD (  10.94  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-snps-arc@lists.infradead.org, kbuild-all@lists.01.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git for-curr
head:   b18b6a1d2b82eb8a2e415e4b1fb1be9027353a5d
commit: 2a8b4c7db0ccea1422545dfe3409a56c356dac58 [1/3] ARC: [plat-eznps]: Drop support for EZChip NPS platform
config: arc-allyesconfig
compiler: arceb-elf-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/commit/?id=2a8b4c7db0ccea1422545dfe3409a56c356dac58
        git remote add arc https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git
        git fetch --no-tags arc for-curr
        git checkout 2a8b4c7db0ccea1422545dfe3409a56c356dac58
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arc  allyesconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=arc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arc/Kconfig:100: can't open file "arch/arc/plat-eznps/Kconfig"
   make[2]: *** [scripts/kconfig/Makefile:71: allyesconfig] Error 1
   make[1]: *** [Makefile:606: allyesconfig] Error 2
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'allyesconfig' not remade because of errors.
--
>> arch/arc/Kconfig:100: can't open file "arch/arc/plat-eznps/Kconfig"
   make[2]: *** [scripts/kconfig/Makefile:71: oldconfig] Error 1
   make[1]: *** [Makefile:606: oldconfig] Error 2
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> arch/arc/Kconfig:100: can't open file "arch/arc/plat-eznps/Kconfig"
   make[2]: *** [scripts/kconfig/Makefile:71: olddefconfig] Error 1
   make[1]: *** [Makefile:606: olddefconfig] Error 2
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.

vim +100 arch/arc/Kconfig

cfdbc2e16e65c1e Vineet Gupta      2013-01-18   96  
072eb693904a52d Christian Ruppert 2013-04-12   97  source "arch/arc/plat-tb10x/Kconfig"
556cc1c5f528dcc Alexey Brodkin    2014-01-27   98  source "arch/arc/plat-axs10x/Kconfig"
cfdbc2e16e65c1e Vineet Gupta      2013-01-18   99  #New platform adds here
966657890e874d3 Noam Camus        2015-10-16 @100  source "arch/arc/plat-eznps/Kconfig"
a518d63777a4e94 Alexey Brodkin    2017-08-15  101  source "arch/arc/plat-hsdk/Kconfig"
93ad700de2abc11 Vineet Gupta      2013-01-22  102  

:::::: The code at line 100 was first introduced by commit
:::::: 966657890e874d3b01d94b1ec156b7da54ba99b0 ARC: Add eznps platform to Kconfig and Makefile

:::::: TO: Noam Camus <noamc@ezchip.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
