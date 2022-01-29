Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927B5C433F5
	for <linux-snps-arc@archiver.kernel.org>; Sat, 29 Jan 2022 10:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jELatmJKnDo3td+hnDEOXuCXSr+GTHTDZ0jewioLCGc=; b=lbhjfHkHSE/I44
	NtnLcbIEnwq0Qmd+Gm7FMZkZciZ4Y8Si+AJTDHUjJkN0qYQ7WK2p0IL6ObZks+SlwOp5cEPFLqsWe
	ZtMXEhOXAelwrhDowKefVUMNrUxnOQYq3zlaNt5ezQPqwnDQwXR/8JLsjyJVNZBJCqA1bAbc1VUxb
	jOFp6chVzy/ehU72prcHV4O4RGZ8QvxmE/rb8s0bJ82WIH4ItW72zbqfG1IWB5XMWLJeS9yP2HeDq
	51hUHvl08oQhK58dAw7iS6ezgH27cdDMu2vKk/R34xgoR6Jcfusg43r3Y8dvm736oLUsTWGOv3b5u
	VO2s3uyrBUTsq8+CH8ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDkvh-004TIo-4w; Sat, 29 Jan 2022 10:26:01 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDkve-004TIE-2d
 for linux-snps-arc@lists.infradead.org; Sat, 29 Jan 2022 10:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643451958; x=1674987958;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=sXnnCGn/3jPRr3t/1zs7nws/AN/8Xwhv4EBUtRGrj6Y=;
 b=AwzxFPDN1i9L8cxd5MUsp81yX3Ni5wlZkOb/9PeDu4yYregfaM2Nhl+R
 tEileOfn3oHJHthGcR2Qwv7PBH1tBAyJjv7kvOaLb5VFYIU15KiQDf8iq
 LSKWnjor379+xUZdoGhfs0LXRjwTYDOw6Ve4UrC9A+W5cX8bmZ3mK12Jl
 zT8cbXS1w/+1IdK29o+OFgHJIPaggGsFk3rODQHlCo2TNPnklvkBddU9I
 AZl9+Wd+rEAqfgVpnAPuprcyRZOWYjN1KlaTFDa7QlGHdvewFfc0LXTo2
 ALhDsKsM7VnBm9uuJcjjkJ801IrxpPtoX7Ig8h3Iou5ZZOpwOpheBPSFY w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="307990163"
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; d="scan'208";a="307990163"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2022 02:25:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,326,1635231600"; d="scan'208";a="629388306"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga004.jf.intel.com with ESMTP; 29 Jan 2022 02:25:55 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nDkva-000P48-Gv; Sat, 29 Jan 2022 10:25:54 +0000
Date: Sat, 29 Jan 2022 18:25:03 +0800
From: kernel test robot <lkp@intel.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org
Subject: net/ipv4/tcp_cong.c:238:22: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202201291808.JSpyvEVe-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_022558_202043_890A8828 
X-CRM114-Status: UNSURE (   9.84  )
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
head:   169387e2aa291a4e3cb856053730fe99d6cec06f
commit: e188f3330a13df904d77003846eafd3edf99009d ARC: cmpxchg/xchg: rewrite as macros to make type safe
date:   5 months ago
config: arc-randconfig-s031-20220129 (https://download.01.org/0day-ci/archive/20220129/202201291808.JSpyvEVe-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   net/ipv4/tcp_cong.c:238:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct tcp_congestion_ops const [noderef] __rcu *_val_ @@     got struct tcp_congestion_ops *[assigned] ca @@
   net/ipv4/tcp_cong.c:238:24: sparse:     expected struct tcp_congestion_ops const [noderef] __rcu *_val_
   net/ipv4/tcp_cong.c:238:24: sparse:     got struct tcp_congestion_ops *[assigned] ca
>> net/ipv4/tcp_cong.c:238:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tcp_congestion_ops const *prev @@     got struct tcp_congestion_ops const [noderef] __rcu *[assigned] _val_ @@
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
