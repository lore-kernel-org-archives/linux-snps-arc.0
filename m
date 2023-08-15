Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B65C04A6A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Aug 2023 06:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fq+5ld6bC1m1IxuYYqijYDu5OeeWo2mY5Fx8R0RtXz4=; b=imXrVi5Es9l13K
	A/4CiWQtVqP+2ork9FDpkjv8hAapxnOFmnA0oMlslvi4gl9yntX9KmmHn//UZU9jtSyOoMJCP8Oi/
	xCvV0Akmcd7nDt1Og22eXAaoQtoyTV2z/cYu8ZwZGlfYkvMoiuLc/Honga/vuXNvKOlIJHgJGccQX
	xt/8nYOgmYADM5vUsQkP/NFPF6sXz7TBpiKHmsFqVFjWz9Zw97SlV0+WPydKwdoHFSYRkBLJeureb
	NHBPnnTxRvckzDzZslC/yM0n4IzCZcpoRp+qbg+WCCO4apEG0LsOmhc0dLM+VnGRa1olZKD2d/S1+
	CNk5q6vnmm+xGcHMu2IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVn9k-000xfx-31;
	Tue, 15 Aug 2023 06:03:52 +0000
Received: from mgamail.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVn9h-000xfQ-1T
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Aug 2023 06:03:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692079429; x=1723615429;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fmWL8148XO8APcqd77xkkyCD6Kn5Ec7FeYc5z5PSGyw=;
  b=SksXtDYHQBfQQ739v08NWTfGQnNJ6CzvtV3csOLIn3odGxDqZmN/rG+Z
   pZXXw0UjhmUVtJpUoX7551ZnyqgyvY5C0+Hape+pJeWVabyD6TcFx9zRT
   rM4urRiLEYhyfcYbRtlBE9OShLP2gyURnWxj+vqdUYds3KZk3zosrYKdo
   GZ8Iq07+7FJdmE5WvVQFMsNZajON9tY0ZjfvCyGUQOP+2pVPho3vosJly
   vuqvyOWddvENnEB1+dSORuim57tzplKjYWufBEhxz3sOfdhRNfLwvrMOz
   YwYb8+HpmN0hz2jW7LvtYIohVe6nMlYulyeSrISPaQ95Ft4Y5sSUFpD/P
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="374980278"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="374980278"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 23:03:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="823728116"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="823728116"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Aug 2023 23:03:35 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVn9S-0000hb-2G;
	Tue, 15 Aug 2023 06:03:34 +0000
Date: Tue, 15 Aug 2023 14:03:13 +0800
From: kernel test robot <lkp@intel.com>
To: Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: Re: [PATCH 20/20] ARC: pt_regs: create seperate type for ecr
Message-ID: <202308151342.ROQ9Urvv-lkp@intel.com>
References: <20230815004813.555115-21-vgupta@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230815004813.555115-21-vgupta@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_230349_595375_0987C8B1 
X-CRM114-Status: GOOD (  11.55  )
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

Hi Vineet,

kernel test robot noticed the following build errors:

[auto build test ERROR on vgupta-arc/for-curr]
[cannot apply to vgupta-arc/for-next linus/master v6.5-rc6 next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vineet-Gupta/ARC-uaccess-remove-arc-specific-out-of-line-handles-for-Os/20230815-085308
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git for-curr
patch link:    https://lore.kernel.org/r/20230815004813.555115-21-vgupta%40kernel.org
patch subject: [PATCH 20/20] ARC: pt_regs: create seperate type for ecr
config: arc-randconfig-r043-20230815 (https://download.01.org/0day-ci/archive/20230815/202308151342.ROQ9Urvv-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308151342.ROQ9Urvv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308151342.ROQ9Urvv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arc/include/asm/ptrace.h:11,
                    from arch/arc/include/asm/bug.h:11,
                    from include/linux/bug.h:5,
                    from include/linux/page-flags.h:10,
                    from kernel/bounds.c:10:
   arch/arc/include/asm/ptrace.h: In function 'regs_get_register':
>> include/linux/stddef.h:16:33: error: 'struct pt_regs' has no member named 'event'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   arch/arc/include/asm/ptrace.h:57:24: note: in expansion of macro 'offsetof'
      57 | #define MAX_REG_OFFSET offsetof(struct pt_regs, event)
         |                        ^~~~~~~~
   arch/arc/include/asm/ptrace.h:164:31: note: in expansion of macro 'MAX_REG_OFFSET'
     164 |         if (unlikely(offset > MAX_REG_OFFSET))
         |                               ^~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: kernel/bounds.s] Error 1 shuffle=716081594
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1287: prepare0] Error 2 shuffle=716081594
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=716081594
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=716081594
   make: Target 'prepare' not remade because of errors.


vim +16 include/linux/stddef.h

6e218287432472 Richard Knutsson 2006-09-30  14  
^1da177e4c3f41 Linus Torvalds   2005-04-16  15  #undef offsetof
14e83077d55ff4 Rasmus Villemoes 2022-03-23 @16  #define offsetof(TYPE, MEMBER)	__builtin_offsetof(TYPE, MEMBER)
3876488444e712 Denys Vlasenko   2015-03-09  17  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
