Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3322C54788
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Feb 2024 16:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RANpnhyeiqeQCxjzSpM3IazUaaUFqgBh7WFxS59/av0=; b=0Dr0Zp+kjlhfnh
	GopqqEIOwvtroR7AEeDUU4rTwg7Q54TZAsMW0A2zSXuYEfkN5JbvdIhcuYugUbKmxFElElG0lm1iK
	XJAcK0XbNAtkYKc3tLg9zjAZ9B6TLc2PW30UHJRZ0Iow8Ozdv5dPK5tnNTc12dqcX+XyZTL92Vka0
	sWWQ0teQzaFSCUwvzOZOhcgQm4ZVBQoGgb+aa936LGY/tVi31dgudzeCCt9pb3+vaUDP9YGwYT426
	r6gX3/53u42BtjidRTGdRgnNrqgGkv/x124S858/ZRBxw7wQI/fPbLf2WWAh6RSMXGCMXw3ONvU4w
	Vo4LsUEzCaYrqQROajlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdBuD-00000005bYZ-1OYF;
	Thu, 22 Feb 2024 16:26:41 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdBu9-00000005bXO-2dCL;
	Thu, 22 Feb 2024 16:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708619197; x=1740155197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rVeMAZ7c6DaGuMXw0XF4xBKuLLV2gnSN2mixhtkvwIM=;
  b=Y3tyaeuCUCITlF5LxOu1bAG7iz9mEuouh8CPI33A0PJdAGXPBb0w0GMZ
   njQvKjJeOUbAw4QsNFne7McGOWyiXPx02rx84kE+uA8bvO3/AQ+1h98H9
   WuLkxbhStRwFcEw8JF1Spt3An1IZN7QTW/m+PM5zqXXTO82SFXiixIBq5
   9XRe3Q73yvsIoL0nDxdoMjkKfbkAnDz8FQJijFwgA1f7BeYoc/8dM/oZ3
   aXcKaysBkkMfic/yqEzvYBsrO8RrjAIWLIiDI2phhoFCtLs6vPWJkK/lk
   iabPtXr4sbjtdu9NRKw52Qp1+BfD4688hoQ0wK/S1Wff1sj6FIyPEy22n
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="20406872"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="20406872"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 08:26:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5857653"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Feb 2024 08:26:22 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdBtn-0006U6-33;
	Thu, 22 Feb 2024 16:26:16 +0000
Date: Fri, 23 Feb 2024 00:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, arnd@arndb.de,
	javierm@redhat.com, deller@gmx.de, suijingfeng@loongson.cn
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
Subject: Re: [PATCH 3/3] arch: Rename fbdev header and source files
Message-ID: <202402230023.xa2jjwui-lkp@intel.com>
References: <20240221161431.8245-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240221161431.8245-4-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_082637_689294_339F7B69 
X-CRM114-Status: GOOD (  12.71  )
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

[auto build test ERROR on tip/x86/core]
[also build test ERROR on deller-parisc/for-next arnd-asm-generic/master linus/master v6.8-rc5 next-20240221]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/arch-Select-fbdev-helpers-with-CONFIG_VIDEO/20240222-001622
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20240221161431.8245-4-tzimmermann%40suse.de
patch subject: [PATCH 3/3] arch: Rename fbdev header and source files
config: um-randconfig-r052-20240222 (https://download.01.org/0day-ci/archive/20240223/202402230023.xa2jjwui-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402230023.xa2jjwui-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402230023.xa2jjwui-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: drivers/video/fbdev/core/fb_io_fops.o: in function `fb_io_mmap':
>> fb_io_fops.c:(.text+0x591): undefined reference to `pgprot_framebuffer'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
