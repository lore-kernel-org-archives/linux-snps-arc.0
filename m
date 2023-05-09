Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88071C7EE22
	for <linux-snps-arc@archiver.kernel.org>; Tue,  9 May 2023 08:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zPow/XnW4sI6mkQtNvK5w7kE8VaH6tdVSdCD1hvwmEc=; b=JVlQ1tZK3fHW5H
	T955kKSc+U7nbDf4fjK2dbBCoqaB6gnNiHvOoJjJTrTehUfV3oQi1Hwbodt910Bw6HgCAiGeEPYRW
	iKi0Bi0ixvpm+wvikGC/9iJdpQzEe5ZrlRHfOCMgSphRGt6afP3YTJyhl8/3tY2W775S8Fjkjzgoi
	sVt98zFwXEXdnnWNPD1riBDNwggAZgbu2gskJ+SLdMROsZ0mjeZsJnYI7vCg3aG3PkwdoXo3gTYRk
	/NxPyCnXGbcxHcvV3OjsSTa7FCF+S3yaGuA5XHHjXVy2RUmDAD4xQ1JWvWGykw4bRZZS8J8qGjxgI
	GU+gbaloOUvF/HxGKY+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwIHk-002a7P-16;
	Tue, 09 May 2023 08:01:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwIHj-002a7A-0o;
	Tue, 09 May 2023 08:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HBorKtmCi45ph1cqc0IjbxTaRZ2JgRBCog/mdxnWmA8=; b=BXhr9yosxek/UdoamZkGVtWqp5
	Kb3xrgZxsCXrKN8D5NzbU1lSLOw5S80bEKp1PX0y72z6oSyJGGvUpu4mN3H1jYI8ZxVMcoOJyIhG+
	ZqvEAM5zkrch+mL/HapAQyXxHdtXlC/8Cz2Tmhj4++wc5MdjMVn2gUCU5q0H3B7OSVxDcny9I7iqB
	wXXnuJb+VkLMtvIPC23+OTZH9UlauZoMHgOKE3drDyOTNHQ+yFuQEyhWGbNJEdbTt3i+9I0BWAeas
	zkgUxDSBHCD4508LxwJMNulh0fkgPe42ZO4HmXwuici5sGfVyMgcKIPykcJHys0ITOumciys9tpwh
	C1re8IgQ==;
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwIHc-0063Lp-21;
	Tue, 09 May 2023 08:01:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683619276; x=1715155276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=M8ldeZ8wYKyjh5+JLiPdYoonZd0SIk7CsE32UJHMbgg=;
  b=Ty38ioo8U9DD1D85FWWEIpp0p5LAM4hKrSojXqT3/6QSKnwWJTocc794
   Mo/tdqn5YW5JIRwMpaqvsmdtglu5Nlc4Osi03bqrhOSuROCtW7mn5dynB
   uwP/P1ieA2ORHfLZ5f6jNwbTy36ZZbHuCzAaVBU5JWWoWWlsQJJaN3Fid
   o0/CGWCwmc2+p+V6THxn+blvZ5iLSK6ke84A8zJUGkHqSTuFVzVZ4JOJ3
   9XawHS+UIweDnaH9582MOo2d4ena3Q9tTv4T9yrCP2MqKd6pnndRVy+CU
   Q6SwU5NduY3+quOKdTpdQvXH7ih9gnkN5pLItrlDx8ZfIdZeNBzHX/0qr
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="413102454"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="413102454"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 01:00:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="763719607"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="763719607"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 May 2023 01:00:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwIGs-0001xM-2i;
	Tue, 09 May 2023 08:00:30 +0000
Date: Tue, 9 May 2023 15:59:42 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
	geert@linux-m68k.org, javierm@redhat.com, daniel@ffwll.ch,
	vgupta@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
	davem@davemloft.net, James.Bottomley@hansenpartnership.com,
	arnd@arndb.de, sam@ravnborg.org, suijingfeng@loongson.cn
Cc: oe-kbuild-all@lists.linux.dev, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, sparclinux@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v5 5/6] fbdev: Move framebuffer I/O helpers into
 <asm/fb.h>
Message-ID: <202305091533.3zBlgYkC-lkp@intel.com>
References: <20230508114830.28182-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230508114830.28182-6-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_090118_370426_8AB7249F 
X-CRM114-Status: GOOD (  11.79  )
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

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[cannot apply to deller-parisc/for-next arnd-asm-generic/master linus/master v6.4-rc1 next-20230509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbdev-matrox-Remove-trailing-whitespaces/20230508-195052
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230508114830.28182-6-tzimmermann%40suse.de
patch subject: [PATCH v5 5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
config: mips-randconfig-r016-20230507 (https://download.01.org/0day-ci/archive/20230509/202305091533.3zBlgYkC-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c64dc7f407b3faa85d4e81ec762407388c5813c1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/fbdev-matrox-Remove-trailing-whitespaces/20230508-195052
        git checkout c64dc7f407b3faa85d4e81ec762407388c5813c1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/video/fbdev/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305091533.3zBlgYkC-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/video/fbdev/core/cfbfillrect.c: In function 'bitfill_aligned':
>> drivers/video/fbdev/core/cfbfillrect.c:26:21: error: implicit declaration of function 'fb_writeq'; did you mean 'fb_writel'? [-Werror=implicit-function-declaration]
      26 | #  define FB_WRITEL fb_writeq
         |                     ^~~~~~~~~
   drivers/video/fbdev/core/cfbfillrect.c:50:17: note: in expansion of macro 'FB_WRITEL'
      50 |                 FB_WRITEL(comp(pat, FB_READL(dst), first), dst);
         |                 ^~~~~~~~~
>> drivers/video/fbdev/core/cfbfillrect.c:27:21: error: implicit declaration of function 'fb_readq'; did you mean 'fb_readl'? [-Werror=implicit-function-declaration]
      27 | #  define FB_READL  fb_readq
         |                     ^~~~~~~~
   drivers/video/fbdev/core/cfbfillrect.c:50:37: note: in expansion of macro 'FB_READL'
      50 |                 FB_WRITEL(comp(pat, FB_READL(dst), first), dst);
         |                                     ^~~~~~~~
   cc1: some warnings being treated as errors
--
   drivers/video/fbdev/core/cfbcopyarea.c: In function 'bitcpy':
>> drivers/video/fbdev/core/cfbcopyarea.c:37:21: error: implicit declaration of function 'fb_writeq'; did you mean 'fb_writel'? [-Werror=implicit-function-declaration]
      37 | #  define FB_WRITEL fb_writeq
         |                     ^~~~~~~~~
   drivers/video/fbdev/core/cfbcopyarea.c:73:25: note: in expansion of macro 'FB_WRITEL'
      73 |                         FB_WRITEL( comp( FB_READL(src), FB_READL(dst), first), dst);
         |                         ^~~~~~~~~
>> drivers/video/fbdev/core/cfbcopyarea.c:38:21: error: implicit declaration of function 'fb_readq'; did you mean 'fb_readl'? [-Werror=implicit-function-declaration]
      38 | #  define FB_READL  fb_readq
         |                     ^~~~~~~~
   drivers/video/fbdev/core/cfbcopyarea.c:73:42: note: in expansion of macro 'FB_READL'
      73 |                         FB_WRITEL( comp( FB_READL(src), FB_READL(dst), first), dst);
         |                                          ^~~~~~~~
   cc1: some warnings being treated as errors


vim +26 drivers/video/fbdev/core/cfbfillrect.c

^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  21  
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  22  #if BITS_PER_LONG == 32
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  23  #  define FB_WRITEL fb_writel
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  24  #  define FB_READL  fb_readl
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  25  #else
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16 @26  #  define FB_WRITEL fb_writeq
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16 @27  #  define FB_READL  fb_readq
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  28  #endif
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  29  
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  30      /*
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  31       *  Aligned pattern fill using 32/64-bit memory accesses
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  32       */
^1da177e4c3f41 drivers/video/cfbfillrect.c Linus Torvalds 2005-04-16  33  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
