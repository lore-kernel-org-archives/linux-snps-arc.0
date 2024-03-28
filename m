Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0656C54E67
	for <linux-snps-arc@archiver.kernel.org>; Thu, 28 Mar 2024 13:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0Jqd3lVBXvAh4aTewoKRmui3xOXoPVP8RTw97zbv8g=; b=rBaKo/G8Glhccc
	csLz43ag2LlJ92DrDXXgZSjOeCU3Cgc7ntCSi1IkhCtIHOcjOKeTo+9j05oihNSQsUx28PJ+4OUha
	MGc4iovkbgc5WLJmA8QlEi/J2N/PA6APqUznYpoKzT5MyYDrv+cCrZOvbmHQn2AVwjMR4F0gcMgOy
	QqtweOh0NCVOYSSL1seXalmCXPwWoa5Zf2OxHRbShE3G+r2/ZK8tX0zNotr3igJQEmfTno8SxT1yg
	RYS6pMx/on/Hon0b8fxxVYKI400OHUkiObIh6CZXwiWZfC2nvNx+3QdVTwQbaKQ+GADPXZ1Z/Lz5f
	elzRaA2+NqHZz/YHfUaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rppbf-0000000E4k4-1P4r;
	Thu, 28 Mar 2024 13:15:47 +0000
Received: from mgamail.intel.com ([192.198.163.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rppbb-0000000E4ea-3yhY;
	Thu, 28 Mar 2024 13:15:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711631744; x=1743167744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Xo032l06yr/hR/jwn/WjJ3wew5ThoMRYTk7U+HZZzrE=;
  b=PaOu2HO6LUUnEsFu1zP4DguuupqhSYEAWVtldbgqe9/KMNyNyG21P1Rc
   8fDRCZIVW8Zgr4OswM6zIseqoF7cyS7J0L5B6VDkLaa3ttrZbyCq8g5/x
   7fnWpcaNyZCK4lDU6ojlkdIH1BdnKQcwOMLyM9t9l+g6xRCgfNC1H9g02
   eyxN/JRe0AGdX4WJyTrx4PqWuVA9uqQJ8BAhw932g58tP1RgRMaMmyC/0
   zyG6huTSsEHlyjHWwoOUkg2TzEXn29EeB2ZlVyeWA0WHAnYbBE3C2sIAe
   unA0gcgoMWgAFWofsovWvAAtnV3Mf0h1q5Qcv63Ar+Txl7YF1d2WgIbWj
   w==;
X-CSE-ConnectionGUID: N2gtm6W5SYaB/wQQ8ZcbmA==
X-CSE-MsgGUID: IGbNRkqaSNCPtfHRF/Gutg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6999360"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="6999360"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 06:15:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="16637521"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Mar 2024 06:15:08 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rppb0-0002A6-01;
	Thu, 28 Mar 2024 13:15:06 +0000
Date: Thu, 28 Mar 2024 21:15:01 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de,
	javierm@redhat.com, deller@gmx.de, sui.jingfeng@linux.dev
Cc: oe-kbuild-all@lists.linux.dev, linux-arch@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-sh@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Vineet Gupta <vgupta@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>
Subject: Re: [PATCH v2 3/3] arch: Rename fbdev header and source files
Message-ID: <202403282102.OEKoBT3H-lkp@intel.com>
References: <20240327204450.14914-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240327204450.14914-4-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_061544_090925_929A12A2 
X-CRM114-Status: GOOD (  12.96  )
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

[auto build test ERROR on linus/master]
[also build test ERROR on v6.9-rc1 next-20240328]
[cannot apply to tip/x86/core deller-parisc/for-next arnd-asm-generic/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/arch-Select-fbdev-helpers-with-CONFIG_VIDEO/20240328-044735
base:   linus/master
patch link:    https://lore.kernel.org/r/20240327204450.14914-4-tzimmermann%40suse.de
patch subject: [PATCH v2 3/3] arch: Rename fbdev header and source files
config: um-randconfig-001-20240328 (https://download.01.org/0day-ci/archive/20240328/202403282102.OEKoBT3H-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403282102.OEKoBT3H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403282102.OEKoBT3H-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/video/fbdev/core/fb_io_fops.o: in function `fb_io_mmap':
>> fb_io_fops.c:(.text+0x251): undefined reference to `pgprot_framebuffer'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
