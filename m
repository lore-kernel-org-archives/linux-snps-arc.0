Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDD4C54798
	for <linux-snps-arc@archiver.kernel.org>; Fri, 23 Feb 2024 01:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+iue/2T6pdLYrjhqAFxssPVMRLz1m4bERi90ga+VfkI=; b=UIOUJ6j1cElFcl
	VnPfM4/ekTNJc8w2rpNLl5G0ySzyONpEsmsqB9b3nPlgeoAOmJ+DAipR+q6B7XEWuwBTJboCVh3KU
	G7nWzcAh6s2JJOIQ+8uUZTw3tbcL5hNZ75+jTxoSBwwUDznFnZBQBMMrehdnb9HK3bjXSbhACpVrY
	TLhwNxvDYGStD1a1lav7fONWOxcDtN3M89O5E6XbGfyfoy/wJv7R8PMtdPk6zFE9ya50+0qsqcNFJ
	xhhxvYN0FQrlsizytSVPTWaJjnglmZFCN2sRO/AN5VVIW64569Dwbcdv/IWNLKtIaAq/Aozu2R7WP
	mAvIw/cSwMbNFbSCU5NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdKLe-00000007LCS-32Ad;
	Fri, 23 Feb 2024 01:27:34 +0000
Received: from mgamail.intel.com ([198.175.65.13])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdKLW-00000007L80-1P53;
	Fri, 23 Feb 2024 01:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708651646; x=1740187646;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VJfzL6GLEaZMoUqazrxisfj34PLQuSNA02WLHhDPT4k=;
  b=lfBAu7fqaShzC0SNzQC0XwrJPp7VsIEm8npAqRGcUUcnDEU+ZvvGC0uS
   3g4eGJs3CYM8/1/IV+zYge5Ko+CO3xpHkWFyFo33LFBQj/nIlWnSw9b7B
   wog7QkET29LY+DdrJPysvXAGfXJ6ycJbmJRMtEQb/RG6fOqwNbCfLkycV
   KXlX7Y5xBeNgzswB3OsvypHOi48npqIW2FYb98EDmTh1MFUvykHexwyQt
   mCONzM4aWJWDViJqzAd4NN5afsZd97WQ3+9ykIzPlC0TEDVWodtEj0DD5
   j81Nnt51pK9QniMmFhGtg39rNNMQvX5Dis4GuYvm0q9YHsbSiUO+v0gKE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="14072589"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="14072589"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 17:27:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6192032"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Feb 2024 17:27:11 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdKL6-0006vK-2c;
	Fri, 23 Feb 2024 01:27:02 +0000
Date: Fri, 23 Feb 2024 09:26:10 +0800
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
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 2/3] arch: Remove struct fb_info from video helpers
Message-ID: <202402230941.JZdvHHEX-lkp@intel.com>
References: <20240221161431.8245-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240221161431.8245-3-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_172728_004777_FBC8CD15 
X-CRM114-Status: GOOD (  11.90  )
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
[also build test ERROR on deller-parisc/for-next arnd-asm-generic/master linus/master v6.8-rc5]
[cannot apply to next-20240222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/arch-Select-fbdev-helpers-with-CONFIG_VIDEO/20240222-001622
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20240221161431.8245-3-tzimmermann%40suse.de
patch subject: [PATCH 2/3] arch: Remove struct fb_info from video helpers
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240223/202402230941.JZdvHHEX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240223/202402230941.JZdvHHEX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402230941.JZdvHHEX-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `fbcon_select_primary':
>> drivers/video/fbdev/core/fbcon.c:2944: undefined reference to `video_is_primary_device'
   ld: vmlinux.o: in function `fb_io_mmap':
   drivers/video/fbdev/core/fb_io_fops.c:164: undefined reference to `pgprot_framebuffer'


vim +2944 drivers/video/fbdev/core/fbcon.c

  2939	
  2940	#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY
  2941	static void fbcon_select_primary(struct fb_info *info)
  2942	{
  2943		if (!map_override && primary_device == -1 &&
> 2944		    video_is_primary_device(info->device)) {
  2945			int i;
  2946	
  2947			printk(KERN_INFO "fbcon: %s (fb%i) is primary device\n",
  2948			       info->fix.id, info->node);
  2949			primary_device = info->node;
  2950	
  2951			for (i = first_fb_vc; i <= last_fb_vc; i++)
  2952				con2fb_map_boot[i] = primary_device;
  2953	
  2954			if (con_is_bound(&fb_con)) {
  2955				printk(KERN_INFO "fbcon: Remapping primary device, "
  2956				       "fb%i, to tty %i-%i\n", info->node,
  2957				       first_fb_vc + 1, last_fb_vc + 1);
  2958				info_idx = primary_device;
  2959			}
  2960		}
  2961	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
