Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8732C433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Dec 2021 13:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IueJwuoK/qlP8v6lHIJd9K0U9AocMNwECnHatx86NcI=; b=moet3AzfiQyhrb
	d7J6WQg1TK7quEECnJFS2/sR2kRqpvIzfXriA0D4zubk1mVMZYgu3co9iGXK+Qx4eneVtTBVoiPDI
	m5d7hQ7R+MGnE5F2cecFgz2KJ6+A3gEDoqULGlua9ODD0FczQtN7y5+wRgSOgDRCNzUwdesD0P2zQ
	Hyc1E2qgAnurnGeXHtc819h88WYf5Vn9pcajkztY10UtiGq001tAYlV0EpiaagTiUlYSHC8egIKXu
	V4zX1ejDsWXNyF75dTCK5nJKOpXXLZJE8uCEBhdV3dPe3JSGMSUcBhRHuBcJpP2kCD483FORLWfWT
	Gl0skH8+fHe1ToldMdNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mua9W-008cQD-VH; Tue, 07 Dec 2021 13:05:02 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mua9S-008cM8-7l
 for linux-snps-arc@lists.infradead.org; Tue, 07 Dec 2021 13:05:00 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="217593498"
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="217593498"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 05:04:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,293,1631602800"; d="scan'208";a="750984340"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
 by fmsmga005.fm.intel.com with ESMTP; 07 Dec 2021 05:04:55 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1mua9P-000MaE-8i; Tue, 07 Dec 2021 13:04:55 +0000
Date: Tue, 7 Dec 2021 21:04:16 +0800
From: kernel test robot <lkp@intel.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org
Subject: fs/file.c:401:54: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202112072144.ZYJ4BKaf-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_050458_337201_8AEE73F9 
X-CRM114-Status: GOOD (  10.59  )
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
head:   cd8c917a56f20f48748dd43d9ae3caff51d5b987
commit: e188f3330a13df904d77003846eafd3edf99009d ARC: cmpxchg/xchg: rewrite as macros to make type safe
date:   4 months ago
config: arc-randconfig-s032-20211207 (https://download.01.org/0day-ci/archive/20211207/202112072144.ZYJ4BKaf-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   fs/file.c:350:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **old_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:350:17: sparse:     expected struct file **old_fds
   fs/file.c:350:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:351:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file **new_fds @@     got struct file [noderef] __rcu **fd @@
   fs/file.c:351:17: sparse:     expected struct file **new_fds
   fs/file.c:351:17: sparse:     got struct file [noderef] __rcu **fd
   fs/file.c:366:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/file.c:366:17: sparse:    struct file [noderef] __rcu *
   fs/file.c:366:17: sparse:    struct file *
>> fs/file.c:401:54: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu *[assigned] _val_ @@
   fs/file.c:441:28: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fdtable [noderef] __rcu *fdt @@     got struct fdtable * @@
   fs/file.c:608:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:762:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:813:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *file @@     got struct file [noderef] __rcu * @@
   fs/file.c:1038:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct file *tofree @@     got struct file [noderef] __rcu * @@

vim +401 fs/file.c

02afc6267f6d55 Al Viro          2008-05-08  382  
ce08b62d18b3f9 Oleg Nesterov    2014-01-11  383  static struct fdtable *close_files(struct files_struct * files)
7cf4dc3c8dbfdf Al Viro          2012-08-15  384  {
7cf4dc3c8dbfdf Al Viro          2012-08-15  385  	/*
7cf4dc3c8dbfdf Al Viro          2012-08-15  386  	 * It is safe to dereference the fd table without RCU or
7cf4dc3c8dbfdf Al Viro          2012-08-15  387  	 * ->file_lock because this is the last reference to the
ce08b62d18b3f9 Oleg Nesterov    2014-01-11  388  	 * files structure.
7cf4dc3c8dbfdf Al Viro          2012-08-15  389  	 */
ce08b62d18b3f9 Oleg Nesterov    2014-01-11  390  	struct fdtable *fdt = rcu_dereference_raw(files->fdt);
9b80a184eaadc1 Alexey Dobriyan  2016-09-02  391  	unsigned int i, j = 0;
ce08b62d18b3f9 Oleg Nesterov    2014-01-11  392  
7cf4dc3c8dbfdf Al Viro          2012-08-15  393  	for (;;) {
7cf4dc3c8dbfdf Al Viro          2012-08-15  394  		unsigned long set;
7cf4dc3c8dbfdf Al Viro          2012-08-15  395  		i = j * BITS_PER_LONG;
7cf4dc3c8dbfdf Al Viro          2012-08-15  396  		if (i >= fdt->max_fds)
7cf4dc3c8dbfdf Al Viro          2012-08-15  397  			break;
7cf4dc3c8dbfdf Al Viro          2012-08-15  398  		set = fdt->open_fds[j++];
7cf4dc3c8dbfdf Al Viro          2012-08-15  399  		while (set) {
7cf4dc3c8dbfdf Al Viro          2012-08-15  400  			if (set & 1) {
7cf4dc3c8dbfdf Al Viro          2012-08-15 @401  				struct file * file = xchg(&fdt->fd[i], NULL);
7cf4dc3c8dbfdf Al Viro          2012-08-15  402  				if (file) {
7cf4dc3c8dbfdf Al Viro          2012-08-15  403  					filp_close(file, files);
388a4c88064e7e Paul E. McKenney 2017-10-24  404  					cond_resched();
7cf4dc3c8dbfdf Al Viro          2012-08-15  405  				}
7cf4dc3c8dbfdf Al Viro          2012-08-15  406  			}
7cf4dc3c8dbfdf Al Viro          2012-08-15  407  			i++;
7cf4dc3c8dbfdf Al Viro          2012-08-15  408  			set >>= 1;
7cf4dc3c8dbfdf Al Viro          2012-08-15  409  		}
7cf4dc3c8dbfdf Al Viro          2012-08-15  410  	}
ce08b62d18b3f9 Oleg Nesterov    2014-01-11  411  
ce08b62d18b3f9 Oleg Nesterov    2014-01-11  412  	return fdt;
7cf4dc3c8dbfdf Al Viro          2012-08-15  413  }
7cf4dc3c8dbfdf Al Viro          2012-08-15  414  

:::::: The code at line 401 was first introduced by commit
:::::: 7cf4dc3c8dbfdfde163d4636f621cf99a1f63bfb move files_struct-related bits from kernel/exit.c to fs/file.c

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
