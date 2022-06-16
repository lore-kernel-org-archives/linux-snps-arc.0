Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4A8C433EF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Jun 2022 12:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IpheUKvn9Z6LHCAnghpo1jiKs0uhUe3njVADmqZbmmk=; b=cJF+wQE3pExGty
	D94Tj8PCCUmkqHRV+kIz+y/NacKd5+woYBMt1143QE/Uk1Zcj5H1MZyEibqvyPX5p5kZ5FBf8E36W
	XcpPGoNEYu6Bl1m9+ZVxcXi9oXn/0wyCqnzq0pE2QLW15+XXlqOiIdSXH+K2CfvmygAC7TYlVaCry
	tbLjUwnmmOlDus9Pt5ODHeS+1amqRD3BRPUPIoJKOrAFNkvrSIhkx0UlfBcHgh0P8ZGYFaIrTlT+3
	tWZF1vwUvcmkg1+ULql2ZPOSZWPE5IIu7Wq1ds1Gbpog+nXiXWXcRv1ubrokZ18uIZpNPn5mgFaK4
	cr7lwP6U2W5Gwy+fx6xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ohJ-002Ivu-Lf; Thu, 16 Jun 2022 12:34:05 +0000
Received: from mga07.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ohG-002IvE-HY
	for linux-snps-arc@lists.infradead.org; Thu, 16 Jun 2022 12:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655382842; x=1686918842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ta/VM6wcR0NLR8ZmbTDHO2IFmcawcFYqymRSGS1up0g=;
  b=Hn5RviDbz2SccJ5DFXIXLtIeD27f/XvAQwNQ0YLDT6YE+n2DaqrHiikt
   yfovEUxEW2PKZs+oH82CqqmaLs2b4T2DRDhTSyM4Y8r+6vP9ndAw9aTOd
   KW6RYzHoB+p0jW4w5/tbV2ga9DJs3IbHw9j36O5rS61nMk4WIKNGr9aow
   wyN6JkjRa7YjebP+cGgd2dmHInvLp3VWbs5ohNLOLwO7VgpkqBv+mbN4a
   KoV0GrbL4zE56cHdLd4fo4hqJAKxIIYGTrPFMOICCWDzVKiPm77ZGTDXK
   ybIslLFXq9gwCCu84yu2QHfoUhrTMngrSlXs6WRZ1+AFGz4hu6BPR+AwL
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="343194969"
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; 
   d="scan'208";a="343194969"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 05:34:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; 
   d="scan'208";a="641520219"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 16 Jun 2022 05:33:59 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o1ohD-000ONP-2m;
	Thu, 16 Jun 2022 12:33:59 +0000
Date: Thu, 16 Jun 2022 20:33:49 +0800
From: kernel test robot <lkp@intel.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org
Subject: net/ipv4/tcp_cong.c:238:22: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202206162029.baVzc1JE-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_053402_665738_C1453F3F 
X-CRM114-Status: UNSURE (   8.40  )
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
head:   30306f6194cadcc29c77f6ddcd416a75bf5c0232
commit: e188f3330a13df904d77003846eafd3edf99009d ARC: cmpxchg/xchg: rewrite as macros to make type safe
date:   10 months ago
config: arc-randconfig-s031-20220616 (https://download.01.org/0day-ci/archive/20220616/202206162029.baVzc1JE-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-30-g92122700-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e188f3330a13df904d77003846eafd3edf99009d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e188f3330a13df904d77003846eafd3edf99009d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc SHELL=/bin/bash net/ipv4/

If you fix the issue, kindly add following tag where applicable
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

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
