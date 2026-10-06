Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E000FCA5FF0
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Oct 2026 09:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dI1jwUkEzqt3CcfeH5HnBp7x4QNGkWBPWxkgszIisrg=; b=Oo+BkYewxSKNu9
	a+Lt7kHbd0mfDUuv0EgpAhRsq3vX2HaLWwJI3jmcz8D/YMHJ2mJKA2SRIvn/W2PqupUlh2Poarj8l
	jq9x7NjXaerZJZudi2hapq+Aqt2i7CekZmFQK8mRaUp9vZXJi1VT2rCUP34RcSozhLSTVCUP1Hj5w
	MZ/nMcXvCkY18RdY/lBr5wZBqkOXlHEptvcaZcQg2l6m+LSixs2GD7AvVqbI1sbgka2JFbOGABu19
	kdig7p08+DaibtmCCqZDI1i4bjOcQFjVq9HQ5JNb14JqVG5qhV1c/6Wamju126b7QRZbV/6pAHgrl
	GPLHt+IMXiKIkvMJJxmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1tJ-00000000R0j-1SAq;
	Tue, 06 Oct 2026 09:55:21 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE1tF-00000000Qyk-25NH
	for linux-snps-arc@lists.infradead.org;
	Tue, 06 Oct 2026 09:55:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791280518; x=1822816518;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PprG1zoTavpw3blbpMrw2Qfk/deLSjiCWxGPFyBWXnA=;
  b=fJr9ZxmV6uTPjqjUfMyQpkyOiTDq8LryVkXubOhZuozC7LI11GiX8R01
   sCBDrq1JnVbjMJm7WDj3HgSjYM+/Bhjtwuz/Y1fYFJABp9G5015loIi+z
   Dgw+BExHFOWF/eHZosSL7LQD43jY4jgo5ppBYT7TggCkLbpPZBn58TYmK
   1pS/P1xhnf2waJSkgMhJfcmuvu19O72y/BcScmRZ+OEnyPVil8J4uNJQr
   gu+iFhqK6n5MLowkXkYCa4bJDVKUf0qSHJCT3wrYrW80KiBNSrOazG9Lo
   cZgz9MAcuGYbCNIe4vVZfW9yxvm1t8eR4MEGrzfdUtGY2TUCDxYt88ca0
   g==;
X-CSE-ConnectionGUID: Gs1/KFgIS4uWMFhp8W5Vtg==
X-CSE-MsgGUID: qzOLmt3URyW/Yy86HSAPYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="112887"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="112887"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 02:55:17 -0700
X-CSE-ConnectionGUID: 3CvIPXL/Tc2i1GM26q+rSA==
X-CSE-MsgGUID: NdjTDoNtQXq0SfBbj3gt+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="285008670"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Oct 2026 02:55:13 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xE1t7-000000001Qi-36dv;
	Tue, 06 Oct 2026 09:55:09 +0000
Date: Tue, 6 Oct 2026 17:54:53 +0800
From: kernel test robot <lkp@intel.com>
To: Bradley Morgan <brads@mainlining.org>, akpm@linux-foundation.org,
	vgupta@kernel.org, guoren@kernel.org, chris@zankel.net,
	jcmvbkbc@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, arnd@arndb.de, paulmck@kernel.org,
	david.laight.linux@gmail.com, glaubitz@physik.fu-berlin.de,
	ysato@users.sourceforge.jp, dalias@libc.org,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org, brads@mainlining.org
Subject: Re: [PATCH v5 3/3] xtensa: Emulate two-byte cmpxchg
Message-ID: <202610061704.rvbolgPy-lkp@intel.com>
References: <20261005120700.383058-4-brads@mainlining.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261005120700.383058-4-brads@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_025517_553524_1211BDFF 
X-CRM114-Status: GOOD (  11.37  )
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

Hi Bradley,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on vgupta-arc/for-curr jcmvbkbc-xtensa/xtensa-for-next linus/master v7.3-rc6 next-20261005]
[cannot apply to vgupta-arc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bradley-Morgan/ARC-Emulate-two-byte-cmpxchg/20261005-120658
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20261005120700.383058-4-brads%40mainlining.org
patch subject: [PATCH v5 3/3] xtensa: Emulate two-byte cmpxchg
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20261006/202610061704.rvbolgPy-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061704.rvbolgPy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610061704.rvbolgPy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/xtensa/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/atomic.h:5,
                    from arch/xtensa/include/asm/bitops.h:192,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
   arch/xtensa/include/asm/cmpxchg.h: In function '__cmpxchg':
>> arch/xtensa/include/asm/cmpxchg.h:79:25: error: implicit declaration of function 'cmpxchg_emu_u16'; did you mean 'cmpxchg_emu_u8'? [-Wimplicit-function-declaration]
      79 |         case 2:  return cmpxchg_emu_u16(ptr, old, new);
         |                         ^~~~~~~~~~~~~~~
         |                         cmpxchg_emu_u8
   make[3]: *** [scripts/Makefile.build:185: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1405: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +79 arch/xtensa/include/asm/cmpxchg.h

    73	
    74	static __inline__ unsigned long
    75	__cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
    76	{
    77		switch (size) {
    78		case 1:  return cmpxchg_emu_u8(ptr, old, new);
  > 79		case 2:  return cmpxchg_emu_u16(ptr, old, new);
    80		case 4:  return __cmpxchg_u32(ptr, old, new);
    81		default: __cmpxchg_called_with_bad_pointer();
    82			 return old;
    83		}
    84	}
    85	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
