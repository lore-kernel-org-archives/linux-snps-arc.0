Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDCDD29DC3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 13 Jan 2026 03:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AIHySNm9VH7DQ81T4Aj1n936OxMPbS6rKJq1Ff5tBMs=; b=h3ZPUeUNTAh5l2
	//IP9dKx9g9UCXadXEx5Oa6Bh6EJQ7gQ5nj9nF+PwSlm3H+IaN71Rpm0AgV0yWwNA6WJfXjuPGsbz
	n6gGRfUVVk1dmzjSbimjuA0X1GKs4h9JRt9LKpS/pCpD4EwE3S6lco/Gir6FaH5Cs07hYsf/Ios3G
	rYDaZVmDN7vTvVaG/AzxbBcds3ZFO+h9Lyj/XST9O2pGguMMzSxkAB9nYxeXtkkupvk7nQQHrMMTb
	01Ln3v8+bkLYm0J14ihDKuI394K/fGIYNvl6DjfX9jiunpX68THN7VbX1K+ahkJHECjO0F0GoLyQY
	PhFqfjK1wy18JiQy4tDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUyg-00000006To3-199Q;
	Tue, 13 Jan 2026 03:21:54 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUyc-00000006TnY-0ck5
	for linux-snps-arc@lists.infradead.org;
	Tue, 13 Jan 2026 03:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768274510; x=1799810510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lla1gLSTlZyyFaFVq3hHP6MUNJav5xNwj9oJ4m0Stoc=;
  b=NTxGiy4Lrj8iaEDGU/TixngKLYuNVVXbcmTU3nTJmndf3wxR/e+sZ+lB
   3y3LNqj+5N88VHqfzoi2DfPP1RWNIa44dws8Ug6JGFhGcLKtDBMFLs2Sf
   XGQfSXu7dN6rV0NRqMaXemXg7iGptUCLWXLpV6BeXeK06KsjFQ0sZPSBx
   a29e6ttkV6AK6OdUrcw8K4LNk+l7FMVr6aCNxTm/gAnfMAqKEUQVPhbqW
   9gcbFqAgWgelbJHn5GfmEe55tVSXdZYpEGz1FAr/m1DqgHXHC0HYOUbv+
   mDLnHlTGqpFYIEr2ss3weC49VcYPPAUYmwJTLerscYpiA6TlrF1tzvtfE
   g==;
X-CSE-ConnectionGUID: XADZuAKkRqG0vqVzucyAMg==
X-CSE-MsgGUID: jWYHhzL8RdSbUCOZVrqesQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69467725"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69467725"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 19:21:49 -0800
X-CSE-ConnectionGUID: glbdwLK4RqSxqdNYlAm4Hg==
X-CSE-MsgGUID: c/nFDKWHTEe4I4I3x+iZnQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jan 2026 19:21:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfUyX-00000000E9h-3B8E;
	Tue, 13 Jan 2026 03:21:45 +0000
Date: Tue, 13 Jan 2026 11:20:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-snps-arc@lists.infradead.org
Subject: [thomas-weissschuh:b4/at-vector-size-arch 2/24] ERROR:
 modpost: "__bswapsi2" [fs/ecryptfs/ecryptfs.ko] undefined!
Message-ID: <202601131142.f4Kyqt82-lkp@intel.com>
User-Agent: s-nail v14.9.25
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_192152_127881_AFB5A6F4 
X-CRM114-Status: UNSURE (   6.22  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/at-vector-size-arch
head:   48790f0896dc14ed71a371b1a81ecd5c32347185
commit: 7ad4197ef8bdb56c2e4b411acc9bb311e91f6350 [2/24] ARC: Always use SWAPE instructions and enable ARCH_USE_BUILTIN_BSWAP
config: arc-randconfig-001-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131142.f4Kyqt82-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131142.f4Kyqt82-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131142.f4Kyqt82-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__bswapsi2" [fs/ecryptfs/ecryptfs.ko] undefined!
>> ERROR: modpost: "__bswapdi2" [fs/ecryptfs/ecryptfs.ko] undefined!
>> ERROR: modpost: "__bswapsi2" [security/keys/trusted-keys/trusted.ko] undefined!
>> ERROR: modpost: "__bswapdi2" [crypto/wp512.ko] undefined!
>> ERROR: modpost: "__bswapsi2" [drivers/pinctrl/pinctrl-single.ko] undefined!
>> ERROR: modpost: "__bswapsi2" [drivers/video/backlight/qcom-wled.ko] undefined!
>> ERROR: modpost: "__bswapsi2" [drivers/video/fbdev/core/cfbfillrect.ko] undefined!
>> ERROR: modpost: "__bswapsi2" [drivers/video/fbdev/core/cfbcopyarea.ko] undefined!
>> ERROR: modpost: "__bswapsi2" [drivers/video/fbdev/core/cfbimgblt.ko] undefined!
>> ERROR: modpost: "__bswapsi2" [drivers/video/fbdev/core/sysfillrect.ko] undefined!
WARNING: modpost: suppressed 92 unresolved symbol warnings because there were too many)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
