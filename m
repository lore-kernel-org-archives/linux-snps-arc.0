Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D825C77B7D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 10 May 2023 14:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djW02ed2QPiRRiHB+zFyMj9S0puUcSZqobuSm4bZxWY=; b=f3Xo3amyjx9Sat
	ZEJvF6HlpvjhZ2YkXxXkbajMjXn2hzUBkZYLef0jnUnt/YO7TN0bDuddq7hyyeLmWr150CQV6ufHI
	GC1kZcCfWKccBk+p1jIjyiwrkaXEt5osNck1LsmAuG8khk3zU+bnJ7GtGPOMq+pulkImWi8qDaoeC
	yYuW/7mEAlmQC8ap5PWpp+TdPWIdYZMcgkurGwAt9ZUTu8qNLWHzKyzvQoE04y0R5JvNW5xBHvlJV
	o3ue9DVqY1gi1DkerIY5gqVK0l5TncQ7lFahJ137Q06j6FW+wpTLRmzbZ7HnM/3C02PHahmHEzlNm
	vXjq194EBev/uS/qgvhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwkQU-006Iu5-29;
	Wed, 10 May 2023 14:04:18 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwkQM-006Ipx-19;
	Wed, 10 May 2023 14:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683727450; x=1715263450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Weuc/6wmFMlzgZQqjXSqsrKdE93+EcAW+jgAmHsBAc4=;
  b=dP455dDm5dkqTXZ3qZlkNSXX+Kh1HcHlkdAjFBB+nO5ct2Ypbbojgomu
   xxV2iDTDUSk0GVmfoLs50QflUqpvOQREWoAcxbwXlDhknMR9sgFUqF/B9
   5V4rctYMGSHq2ep37yhl9bdW6wHwTaUOlDI95/2oP8/XY/9QmV0uhXdme
   sYH6WN9xjpGDTJXWPq4oqHgaBuxkFfazxMzMxSOuucJy7XB6lxhHwIQh4
   8V5PhuEHaj7C+chS3w0lLkoto881wi1VLOIHUpZb7bqTVD1PrVZxNepEM
   dWnN4F5ivSpCI9xvwDN0kOzxuY6Kf/vuh9Ldii5BSQgUR8ZeRjxWQydQH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="350253431"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="350253431"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 07:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="768924681"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="768924681"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 May 2023 07:03:33 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwkPk-0003Li-2b;
	Wed, 10 May 2023 14:03:32 +0000
Date: Wed, 10 May 2023 22:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
	geert@linux-m68k.org, javierm@redhat.com, daniel@ffwll.ch,
	vgupta@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
	davem@davemloft.net, James.Bottomley@hansenpartnership.com,
	arnd@arndb.de, sam@ravnborg.org, suijingfeng@loongson.cn
Cc: oe-kbuild-all@lists.linux.dev, linux-arch@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 5/6] fbdev: Move framebuffer I/O helpers into
 <asm/fb.h>
Message-ID: <202305102136.eMjTSPwH-lkp@intel.com>
References: <20230510110557.14343-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230510110557.14343-6-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_070410_440229_A38185F9 
X-CRM114-Status: GOOD (  16.06  )
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[cannot apply to deller-parisc/for-next arnd-asm-generic/master linus/master davem-sparc/master v6.4-rc1 next-20230510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/fbdev-matrox-Remove-trailing-whitespaces/20230510-190752
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230510110557.14343-6-tzimmermann%40suse.de
patch subject: [PATCH v6 5/6] fbdev: Move framebuffer I/O helpers into <asm/fb.h>
config: sh-randconfig-r024-20230509 (https://download.01.org/0day-ci/archive/20230510/202305102136.eMjTSPwH-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/46cc7edd7f28cc167c5b38d0e4f0aa8c3ac67328
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Zimmermann/fbdev-matrox-Remove-trailing-whitespaces/20230510-190752
        git checkout 46cc7edd7f28cc167c5b38d0e4f0aa8c3ac67328
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/video/fbdev/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305102136.eMjTSPwH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   cc1: warning: arch/sh/include/mach-hp6xx: No such file or directory [-Wmissing-include-dirs]
   cc1: warning: arch/sh/include/mach-hp6xx: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/video/fbdev/hitfb.c:27:
   drivers/video/fbdev/hitfb.c: In function 'hitfb_accel_wait':
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 1 of 'fb_readw' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:93:33: note: in expansion of macro 'HD64461_IO_OFFSET'
      93 | #define HD64461_GRCFGR          HD64461_IO_OFFSET(0x1044)       /* Accelerator Configuration Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:47:25: note: in expansion of macro 'HD64461_GRCFGR'
      47 |         while (fb_readw(HD64461_GRCFGR) & HD64461_GRCFGR_ACCSTATUS) ;
         |                         ^~~~~~~~~~~~~~
   In file included from arch/sh/include/asm/fb.h:5,
                    from include/linux/fb.h:19,
                    from drivers/video/fbdev/hitfb.c:22:
   include/asm-generic/fb.h:52:57: note: expected 'const volatile void *' but argument is of type 'unsigned int'
      52 | static inline u16 fb_readw(const volatile void __iomem *addr)
         |                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/video/fbdev/hitfb.c: In function 'hitfb_accel_start':
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:93:33: note: in expansion of macro 'HD64461_IO_OFFSET'
      93 | #define HD64461_GRCFGR          HD64461_IO_OFFSET(0x1044)       /* Accelerator Configuration Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:53:30: note: in expansion of macro 'HD64461_GRCFGR'
      53 |                 fb_writew(6, HD64461_GRCFGR);
         |                              ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:93:33: note: in expansion of macro 'HD64461_IO_OFFSET'
      93 | #define HD64461_GRCFGR          HD64461_IO_OFFSET(0x1044)       /* Accelerator Configuration Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:55:30: note: in expansion of macro 'HD64461_GRCFGR'
      55 |                 fb_writew(7, HD64461_GRCFGR);
         |                              ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/video/fbdev/hitfb.c: In function 'hitfb_accel_set_dest':
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:116:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     116 | #define HD64461_BBTDWR          HD64461_IO_OFFSET(0x105c)       /* Destination Block Width Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:66:28: note: in expansion of macro 'HD64461_BBTDWR'
      66 |         fb_writew(width-1, HD64461_BBTDWR);
         |                            ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:117:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     117 | #define HD64461_BBTDHR          HD64461_IO_OFFSET(0x105e)       /* Destination Block Height Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:67:29: note: in expansion of macro 'HD64461_BBTDHR'
      67 |         fb_writew(height-1, HD64461_BBTDHR);
         |                             ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:115:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     115 | #define HD64461_BBTDSARL        HD64461_IO_OFFSET(0x105a)       /* Destination Start Address Register (L) */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:69:35: note: in expansion of macro 'HD64461_BBTDSARL'
      69 |         fb_writew(saddr & 0xffff, HD64461_BBTDSARL);
         |                                   ^~~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:114:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     114 | #define HD64461_BBTDSARH        HD64461_IO_OFFSET(0x1058)       /* Destination Start Address Register (H) */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:70:32: note: in expansion of macro 'HD64461_BBTDSARH'
      70 |         fb_writew(saddr >> 16, HD64461_BBTDSARH);
         |                                ^~~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/video/fbdev/hitfb.c: In function 'hitfb_accel_bitblt':
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:122:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     122 | #define HD64461_BBTROPR         HD64461_IO_OFFSET(0x1068)       /* ROP Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:83:24: note: in expansion of macro 'HD64461_BBTROPR'
      83 |         fb_writew(rop, HD64461_BBTROPR);
         |                        ^~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:123:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     123 | #define HD64461_BBTMDR          HD64461_IO_OFFSET(0x106a)       /* BitBLT Mode Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:94:49: note: in expansion of macro 'HD64461_BBTMDR'
      94 |                         fb_writew((1 << 5) | 1, HD64461_BBTMDR);
         |                                                 ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:123:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     123 | #define HD64461_BBTMDR          HD64461_IO_OFFSET(0x106a)       /* BitBLT Mode Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:96:38: note: in expansion of macro 'HD64461_BBTMDR'
      96 |                         fb_writew(1, HD64461_BBTMDR);
         |                                      ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:123:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     123 | #define HD64461_BBTMDR          HD64461_IO_OFFSET(0x106a)       /* BitBLT Mode Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:101:45: note: in expansion of macro 'HD64461_BBTMDR'
     101 |                         fb_writew((1 << 5), HD64461_BBTMDR);
         |                                             ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:123:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     123 | #define HD64461_BBTMDR          HD64461_IO_OFFSET(0x106a)       /* BitBLT Mode Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:103:38: note: in expansion of macro 'HD64461_BBTMDR'
     103 |                         fb_writew(0, HD64461_BBTMDR);
         |                                      ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:116:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     116 | #define HD64461_BBTDWR          HD64461_IO_OFFSET(0x105c)       /* Destination Block Width Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:110:26: note: in expansion of macro 'HD64461_BBTDWR'
     110 |         fb_writew(width, HD64461_BBTDWR);
         |                          ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:117:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     117 | #define HD64461_BBTDHR          HD64461_IO_OFFSET(0x105e)       /* Destination Block Height Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:111:27: note: in expansion of macro 'HD64461_BBTDHR'
     111 |         fb_writew(height, HD64461_BBTDHR);
         |                           ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:113:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     113 | #define HD64461_BBTSSARL        HD64461_IO_OFFSET(0x1056)       /* Source Start Address Register (L) */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:112:35: note: in expansion of macro 'HD64461_BBTSSARL'
     112 |         fb_writew(saddr & 0xffff, HD64461_BBTSSARL);
         |                                   ^~~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:112:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     112 | #define HD64461_BBTSSARH        HD64461_IO_OFFSET(0x1054)       /* Source Start Address Register (H) */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:113:32: note: in expansion of macro 'HD64461_BBTSSARH'
     113 |         fb_writew(saddr >> 16, HD64461_BBTSSARH);
         |                                ^~~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:115:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     115 | #define HD64461_BBTDSARL        HD64461_IO_OFFSET(0x105a)       /* Destination Start Address Register (L) */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:114:35: note: in expansion of macro 'HD64461_BBTDSARL'
     114 |         fb_writew(daddr & 0xffff, HD64461_BBTDSARL);
         |                                   ^~~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:114:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     114 | #define HD64461_BBTDSARH        HD64461_IO_OFFSET(0x1058)       /* Destination Start Address Register (H) */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:115:32: note: in expansion of macro 'HD64461_BBTDSARH'
     115 |         fb_writew(daddr >> 16, HD64461_BBTDSARH);
         |                                ^~~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:121:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     121 | #define HD64461_BBTMARL         HD64461_IO_OFFSET(0x1066)       /* Mask Start Address Register (L) */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:118:43: note: in expansion of macro 'HD64461_BBTMARL'
     118 |                 fb_writew(maddr & 0xffff, HD64461_BBTMARL);
         |                                           ^~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:120:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     120 | #define HD64461_BBTMARH         HD64461_IO_OFFSET(0x1064)       /* Mask Start Address Register (H) */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:119:40: note: in expansion of macro 'HD64461_BBTMARH'
     119 |                 fb_writew(maddr >> 16, HD64461_BBTMARH);
         |                                        ^~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/video/fbdev/hitfb.c: In function 'hitfb_fillrect':
   arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:122:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     122 | #define HD64461_BBTROPR         HD64461_IO_OFFSET(0x1068)       /* ROP Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:130:35: note: in expansion of macro 'HD64461_BBTROPR'
     130 |                 fb_writew(0x00f0, HD64461_BBTROPR);
         |                                   ^~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:123:33: note: in expansion of macro 'HD64461_IO_OFFSET'
     123 | #define HD64461_BBTMDR          HD64461_IO_OFFSET(0x106a)       /* BitBLT Mode Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:131:31: note: in expansion of macro 'HD64461_BBTMDR'
     131 |                 fb_writew(16, HD64461_BBTMDR);
         |                               ^~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:92:33: note: in expansion of macro 'HD64461_IO_OFFSET'
      92 | #define HD64461_GRSCR           HD64461_IO_OFFSET(0x1042)       /* Solid Color Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:135:35: note: in expansion of macro 'HD64461_GRSCR'
     135 |                                   HD64461_GRSCR);
         |                                   ^~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:92:33: note: in expansion of macro 'HD64461_IO_OFFSET'
      92 | #define HD64461_GRSCR           HD64461_IO_OFFSET(0x1042)       /* Solid Color Register */
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:140:48: note: in expansion of macro 'HD64461_GRSCR'
     140 |                         fb_writew(rect->color, HD64461_GRSCR);
         |                                                ^~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/video/fbdev/hitfb.c: In function 'hitfb_pan_display':
   arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 2 of 'fb_writew' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:53:33: note: in expansion of macro 'HD64461_IO_OFFSET'
      53 | #define HD64461_LCDCBAR         HD64461_IO_OFFSET(0x1000)
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:165:56: note: in expansion of macro 'HD64461_LCDCBAR'
     165 |         fb_writew((yoffset*info->fix.line_length)>>10, HD64461_LCDCBAR);
         |                                                        ^~~~~~~~~~~~~~~
   include/asm-generic/fb.h:86:60: note: expected 'volatile void *' but argument is of type 'unsigned int'
      86 | static inline void fb_writew(u16 b, volatile void __iomem *addr)
         |                                     ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   drivers/video/fbdev/hitfb.c: At top level:
   drivers/video/fbdev/hitfb.c:170:5: warning: no previous prototype for 'hitfb_blank' [-Wmissing-prototypes]
     170 | int hitfb_blank(int blank_mode, struct fb_info *info)
         |     ^~~~~~~~~~~
   drivers/video/fbdev/hitfb.c: In function 'hitfb_blank':
   arch/sh/include/asm/hd64461.h:18:33: warning: passing argument 1 of 'fb_readw' makes pointer from integer without a cast [-Wint-conversion]
      18 | #define HD64461_IO_OFFSET(x)    (HD64461_IOBASE + (x))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 unsigned int
   arch/sh/include/asm/hd64461.h:70:33: note: in expansion of macro 'HD64461_IO_OFFSET'
      70 | #define HD64461_LDR1            HD64461_IO_OFFSET(0x1010)
         |                                 ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/hitfb.c:175:30: note: in expansion of macro 'HD64461_LDR1'
     175 |                 v = fb_readw(HD64461_LDR1);


vim +/fb_readw +18 arch/sh/include/asm/hd64461.h

^1da177e4c3f41 include/asm-sh/hd64461/hd64461.h Linus Torvalds     2005-04-16  15  
be15d65d97f924 include/asm-sh/hd64461.h         Kristoffer Ericson 2007-07-12  16  /* Area 6 - Slot 0 - memory and/or IO card */
bec36eca6f5d1d arch/sh/include/asm/hd64461.h    Paul Mundt         2009-05-15  17  #define HD64461_IOBASE		0xb0000000
bec36eca6f5d1d arch/sh/include/asm/hd64461.h    Paul Mundt         2009-05-15 @18  #define HD64461_IO_OFFSET(x)	(HD64461_IOBASE + (x))
bec36eca6f5d1d arch/sh/include/asm/hd64461.h    Paul Mundt         2009-05-15  19  #define	HD64461_PCC0_BASE	HD64461_IO_OFFSET(0x8000000)
be15d65d97f924 include/asm-sh/hd64461.h         Kristoffer Ericson 2007-07-12  20  #define	HD64461_PCC0_ATTR	(HD64461_PCC0_BASE)				/* 0xb80000000 */
be15d65d97f924 include/asm-sh/hd64461.h         Kristoffer Ericson 2007-07-12  21  #define	HD64461_PCC0_COMM	(HD64461_PCC0_BASE+HD64461_PCC_WINDOW)		/* 0xb90000000 */
be15d65d97f924 include/asm-sh/hd64461.h         Kristoffer Ericson 2007-07-12  22  #define	HD64461_PCC0_IO		(HD64461_PCC0_BASE+2*HD64461_PCC_WINDOW)	/* 0xba0000000 */
^1da177e4c3f41 include/asm-sh/hd64461/hd64461.h Linus Torvalds     2005-04-16  23  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
