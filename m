Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06765C4167B
	for <linux-snps-arc@archiver.kernel.org>; Mon,  4 Dec 2023 12:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zGnM00vNYDhj99xu+s8QSTuHUxN7nu1H4xdBxT6gYtE=; b=v3Z/pgrSxS53Sr
	yCE4TnirbmQ1atZGeF9rp015/IIOYWpmXCrkn44T9auL324Tupp8snmDJ3MzqFw615qOBU0ove5qe
	dJQOYBjMGOW6VPU8MqiJJP8vjmnJZnzo+ktR05ZWbUygkkMw9LB4h4/MSRMuzgWFoAvdgT0EcgCvm
	WM1BC//s+qFbP+htKn8zlKMPmNIuGt8BrQrNwpcuLJMp2zbD6BI9FD36dOpBmne/ibNWCIhmoZpaM
	nERy4aqqhVHUYv/Rb8sxolLBeoHPvqP1edv/nrEBn44GneLOYqilUSggDsb+1VevxZ7sbLR95j7SY
	KUcU11YyC5B12cnszKjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA7f7-003mHE-2d;
	Mon, 04 Dec 2023 12:02:58 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA7f3-003mFS-1x
	for linux-snps-arc@lists.infradead.org;
	Mon, 04 Dec 2023 12:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701691373; x=1733227373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=89GACn/arX/JrxwPM0BPJdLmhfMyAEIrs1vDiwO02oY=;
  b=hd4wCfNTmwnwEAb6JgQWavVT/8rg4E//MDqbkzzcKMYwUO96LalyW1qv
   wK/SpskYoPCXjyTT1FiynpSRrrDZTO9G/1YeOOpwMBN+bYxVary27OeP5
   WPhCWOSMJ8qXqGVc6JKOxVTx9HSlKZcdtYNrjB0HrDwD+PXSNwKd53qD1
   cRc7Ppl4qUcOcMwiCNXwl1DqVQuZNoj+Ce9xkbiub8n8iyJFcIlK51lPu
   Y3x+LzQDD3kFDL7qtN6mHOg179Ed0EYajAAJ4YICX36rPWrANkdI7SSva
   IAsZ7ds9MA/57qFy1OIi3KkoC1Tra2PSWvaourwobstsxk6zoGltLLDQ/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="620871"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="620871"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 04:02:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="770515226"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; 
   d="scan'208";a="770515226"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 04 Dec 2023 04:02:50 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rA7ey-0007hy-1E;
	Mon, 04 Dec 2023 12:02:48 +0000
Date: Mon, 4 Dec 2023 20:02:34 +0800
From: kernel test robot <lkp@intel.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org
Subject: net/ipv4/tcp_cong.c:238:24: sparse: sparse: incorrect type in
 initializer (different address spaces)
Message-ID: <202312041926.tEYYQdAT-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_040253_677269_2A87E549 
X-CRM114-Status: GOOD (  10.00  )
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
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: e188f3330a13df904d77003846eafd3edf99009d ARC: cmpxchg/xchg: rewrite as macros to make type safe
date:   2 years, 3 months ago
config: arc-randconfig-r123-20231117 (https://download.01.org/0day-ci/archive/20231204/202312041926.tEYYQdAT-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231204/202312041926.tEYYQdAT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312041926.tEYYQdAT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/ipv4/tcp_cong.c:238:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct tcp_congestion_ops const [noderef] __rcu *_val_ @@     got struct tcp_congestion_ops *[assigned] ca @@
   net/ipv4/tcp_cong.c:238:24: sparse:     expected struct tcp_congestion_ops const [noderef] __rcu *_val_
   net/ipv4/tcp_cong.c:238:24: sparse:     got struct tcp_congestion_ops *[assigned] ca
   net/ipv4/tcp_cong.c:238:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tcp_congestion_ops const *prev @@     got struct tcp_congestion_ops const [noderef] __rcu *[assigned] _val_ @@
   net/ipv4/tcp_cong.c:238:22: sparse:     expected struct tcp_congestion_ops const *prev
   net/ipv4/tcp_cong.c:238:22: sparse:     got struct tcp_congestion_ops const [noderef] __rcu *[assigned] _val_

vim +238 net/ipv4/tcp_cong.c

317a76f9a44b43 Stephen Hemminger 2005-06-23  219  
317a76f9a44b43 Stephen Hemminger 2005-06-23  220  /* Used by sysctl to change default congestion control */
6670e152447732 Stephen Hemminger 2017-11-14  221  int tcp_set_default_congestion_control(struct net *net, const char *name)
317a76f9a44b43 Stephen Hemminger 2005-06-23  222  {
317a76f9a44b43 Stephen Hemminger 2005-06-23  223  	struct tcp_congestion_ops *ca;
6670e152447732 Stephen Hemminger 2017-11-14  224  	const struct tcp_congestion_ops *prev;
6670e152447732 Stephen Hemminger 2017-11-14  225  	int ret;
317a76f9a44b43 Stephen Hemminger 2005-06-23  226  
6670e152447732 Stephen Hemminger 2017-11-14  227  	rcu_read_lock();
6670e152447732 Stephen Hemminger 2017-11-14  228  	ca = tcp_ca_find_autoload(net, name);
6670e152447732 Stephen Hemminger 2017-11-14  229  	if (!ca) {
6670e152447732 Stephen Hemminger 2017-11-14  230  		ret = -ENOENT;
0baf26b0fcd74b Martin KaFai Lau  2020-01-08  231  	} else if (!bpf_try_module_get(ca, ca->owner)) {
6670e152447732 Stephen Hemminger 2017-11-14  232  		ret = -EBUSY;
8d432592f30fcc Jonathon Reinhart 2021-05-01  233  	} else if (!net_eq(net, &init_net) &&
8d432592f30fcc Jonathon Reinhart 2021-05-01  234  			!(ca->flags & TCP_CONG_NON_RESTRICTED)) {
8d432592f30fcc Jonathon Reinhart 2021-05-01  235  		/* Only init netns can set default to a restricted algorithm */
8d432592f30fcc Jonathon Reinhart 2021-05-01  236  		ret = -EPERM;
6670e152447732 Stephen Hemminger 2017-11-14  237  	} else {
6670e152447732 Stephen Hemminger 2017-11-14 @238  		prev = xchg(&net->ipv4.tcp_congestion_control, ca);
6670e152447732 Stephen Hemminger 2017-11-14  239  		if (prev)
0baf26b0fcd74b Martin KaFai Lau  2020-01-08  240  			bpf_module_put(prev, prev->owner);
317a76f9a44b43 Stephen Hemminger 2005-06-23  241  
6670e152447732 Stephen Hemminger 2017-11-14  242  		ca->flags |= TCP_CONG_NON_RESTRICTED;
317a76f9a44b43 Stephen Hemminger 2005-06-23  243  		ret = 0;
317a76f9a44b43 Stephen Hemminger 2005-06-23  244  	}
6670e152447732 Stephen Hemminger 2017-11-14  245  	rcu_read_unlock();
317a76f9a44b43 Stephen Hemminger 2005-06-23  246  
317a76f9a44b43 Stephen Hemminger 2005-06-23  247  	return ret;
317a76f9a44b43 Stephen Hemminger 2005-06-23  248  }
317a76f9a44b43 Stephen Hemminger 2005-06-23  249  

:::::: The code at line 238 was first introduced by commit
:::::: 6670e152447732ba90626f36dfc015a13fbf150e tcp: Namespace-ify sysctl_tcp_default_congestion_control

:::::: TO: Stephen Hemminger <stephen@networkplumber.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
