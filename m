Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E53C98304
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2026 21:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/aqqVnuHL/YriIy+B7h0wXB2ZtzWUGYfB4igJdpi574=; b=ywmGXFdyJ9aHst
	SU/QetS3uSizKXJ3qlHl1WSyA74CtktP8BzlSEIiKIZ5+UiA0tcGl5e4NePCdMf4c2qpsNFTT3SXq
	dexcxnJ2pgfyY4Ip9blwwuOhzaEvLjrGG6TzYiAwMbSOrkdHu0K+P1CYYGAlWZKNGUsqWnTY93jTl
	ZNDrVx8Ibc02fLwYCwHcy0okoayR9BaZSeJ1RG3sik3XrurbZrDL9AC6FSvznYdd+y/RrLrO1q541
	IUnP2h491UDiYkmctIR0KTmprqEPjlzwQ2PVfZ0f1+4tuql6iK0w/BXZLTY38f3/0wG46Ime3J8b4
	kDLeYgTiuWK4zesZGapQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9UGc-00000009Y8Z-34U9;
	Wed, 23 Sep 2026 21:12:38 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9UGa-00000009Y82-0Dzw
	for linux-snps-arc@lists.infradead.org;
	Wed, 23 Sep 2026 21:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790197956; x=1821733956;
  h=date:from:to:cc:subject:message-id;
  bh=VHfI0GuSKhE867JGbERTc6eFLFe7Fnzw7ZKLuDYJaSA=;
  b=CqFhwQMpkZt7cDu2/8tALYZaTbLEOmckXQbuDSKOuWtdrl0tsYxWMpjx
   f2LHXzUpLGmZ1dZSjfnu3EseJKUw6R5+2PIISgxyOpAGUaBAT3+NcU+U1
   UxlgaLDbQRujoVHTgvdqFNcNZwyPsMDO6llqsDdMIpLynZYE7nmZYk7Pw
   pkHnegbUvjuajAQw7zCJPpzo+aa4hgVzZ+R2x0RtyD5Hv0GFbQV+bW9cC
   qGeX2bq7lfdFVmAJI0A2+iILvXQpgFixYznu8PSdIEYmbImhB1/KEkew1
   VobjE6d4RAJ+JvY5J50wZ+Fx8q5TuKWTtXwXCfkyUjeQsw4BaYYM6qFGQ
   w==;
X-CSE-ConnectionGUID: eyKAcqdURYWhXVSwkngs+Q==
X-CSE-MsgGUID: lD91MWGtR62KgsWLVMLuug==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93441780"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="93441780"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 14:12:35 -0700
X-CSE-ConnectionGUID: J8b3zkxMQZ26A8mES7sMvQ==
X-CSE-MsgGUID: R/+LuK+2QIWv+rJJ2pmSHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="4892734"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 23 Sep 2026 14:12:34 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9UGU-00000000HkM-31mn;
	Wed, 23 Sep 2026 21:12:30 +0000
Date: Thu, 24 Sep 2026 05:12:09 +0800
From: kernel test robot <lkp@intel.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-snps-arc@lists.infradead.org,
 "Paul E. McKenney" <paulmck@kernel.org>
Subject: [paulmckrcu:cmpxchg2.2026.09.22a 25/28]
 arch/arc/include/asm/cmpxchg.h:71:23: warning: unused variable '_new_'
Message-ID: <202609240539.AkulvjVe-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_141236_113366_D5201199 
X-CRM114-Status: GOOD (  11.57  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

tree:   https://github.com/paulmckrcu/linux cmpxchg2.2026.09.22a
head:   54c282c15475ebfae4712fe3ab637c9d19c723d6
commit: b6d4f6af38f85e7948fd64f9bf09cbb858b4dade [25/28] ARC: Emulate two-byte cmpxchg
config: arc-randconfig-1001-20260924 (https://download.01.org/0day-ci/archive/20260924/202609240539.AkulvjVe-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240539.AkulvjVe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609240539.AkulvjVe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arc/include/asm/atomic.h:13,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arc/include/asm/bitops.h:190,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:14:
   include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg':
   arch/arc/include/asm/cmpxchg.h:80:23: error: '_o_' undeclared (first use in this function); did you mean '_p_'?
      80 |         if (_prev_ == _o_)                                              \
         |                       ^~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
    2026 |         return raw_cmpxchg(&v->counter, old, new);
         |                ^~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:80:23: note: each undeclared identifier is reported only once for each function it appears in
      80 |         if (_prev_ == _o_)                                              \
         |                       ^~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
    2026 |         return raw_cmpxchg(&v->counter, old, new);
         |                ^~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:81:24: error: '_n_' undeclared (first use in this function); did you mean '_p_'?
      81 |                 *_p_ = _n_;                                             \
         |                        ^~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
    2026 |         return raw_cmpxchg(&v->counter, old, new);
         |                ^~~~~~~~~~~
>> arch/arc/include/asm/cmpxchg.h:71:23: warning: unused variable '_new_' [-Wunused-variable]
      71 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
         |                       ^~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
    2026 |         return raw_cmpxchg(&v->counter, old, new);
         |                ^~~~~~~~~~~
>> arch/arc/include/asm/cmpxchg.h:70:23: warning: unused variable '_old_' [-Wunused-variable]
      70 |         unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));              \
         |                       ^~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
    2026 |         return raw_cmpxchg(&v->counter, old, new);
         |                ^~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg_acquire':
   arch/arc/include/asm/cmpxchg.h:80:23: error: '_o_' undeclared (first use in this function); did you mean '_p_'?
      80 |         if (_prev_ == _o_)                                              \
         |                       ^~~
   include/linux/atomic/atomic-arch-fallback.h:70:29: note: in expansion of macro 'arch_cmpxchg'
      70 | #define raw_cmpxchg_acquire arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2055:16: note: in expansion of macro 'raw_cmpxchg_acquire'
    2055 |         return raw_cmpxchg_acquire(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:81:24: error: '_n_' undeclared (first use in this function); did you mean '_p_'?
      81 |                 *_p_ = _n_;                                             \
         |                        ^~~
   include/linux/atomic/atomic-arch-fallback.h:70:29: note: in expansion of macro 'arch_cmpxchg'
      70 | #define raw_cmpxchg_acquire arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2055:16: note: in expansion of macro 'raw_cmpxchg_acquire'
    2055 |         return raw_cmpxchg_acquire(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
>> arch/arc/include/asm/cmpxchg.h:71:23: warning: unused variable '_new_' [-Wunused-variable]
      71 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
         |                       ^~~~~
   include/linux/atomic/atomic-arch-fallback.h:70:29: note: in expansion of macro 'arch_cmpxchg'
      70 | #define raw_cmpxchg_acquire arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2055:16: note: in expansion of macro 'raw_cmpxchg_acquire'
    2055 |         return raw_cmpxchg_acquire(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
>> arch/arc/include/asm/cmpxchg.h:70:23: warning: unused variable '_old_' [-Wunused-variable]
      70 |         unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));              \
         |                       ^~~~~
   include/linux/atomic/atomic-arch-fallback.h:70:29: note: in expansion of macro 'arch_cmpxchg'
      70 | #define raw_cmpxchg_acquire arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2055:16: note: in expansion of macro 'raw_cmpxchg_acquire'
    2055 |         return raw_cmpxchg_acquire(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg_release':
   arch/arc/include/asm/cmpxchg.h:80:23: error: '_o_' undeclared (first use in this function); did you mean '_p_'?
      80 |         if (_prev_ == _o_)                                              \
         |                       ^~~
   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
      82 | #define raw_cmpxchg_release arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2083:16: note: in expansion of macro 'raw_cmpxchg_release'
    2083 |         return raw_cmpxchg_release(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:81:24: error: '_n_' undeclared (first use in this function); did you mean '_p_'?
      81 |                 *_p_ = _n_;                                             \
         |                        ^~~
   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
      82 | #define raw_cmpxchg_release arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2083:16: note: in expansion of macro 'raw_cmpxchg_release'
    2083 |         return raw_cmpxchg_release(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
>> arch/arc/include/asm/cmpxchg.h:71:23: warning: unused variable '_new_' [-Wunused-variable]
      71 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
         |                       ^~~~~
   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
      82 | #define raw_cmpxchg_release arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2083:16: note: in expansion of macro 'raw_cmpxchg_release'
    2083 |         return raw_cmpxchg_release(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
>> arch/arc/include/asm/cmpxchg.h:70:23: warning: unused variable '_old_' [-Wunused-variable]
      70 |         unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));              \
         |                       ^~~~~
   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
      82 | #define raw_cmpxchg_release arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2083:16: note: in expansion of macro 'raw_cmpxchg_release'
    2083 |         return raw_cmpxchg_release(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg_relaxed':
   arch/arc/include/asm/cmpxchg.h:80:23: error: '_o_' undeclared (first use in this function); did you mean '_p_'?
      80 |         if (_prev_ == _o_)                                              \
         |                       ^~~
   include/linux/atomic/atomic-arch-fallback.h:91:29: note: in expansion of macro 'arch_cmpxchg'
      91 | #define raw_cmpxchg_relaxed arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2108:16: note: in expansion of macro 'raw_cmpxchg_relaxed'
    2108 |         return raw_cmpxchg_relaxed(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:81:24: error: '_n_' undeclared (first use in this function); did you mean '_p_'?
      81 |                 *_p_ = _n_;                                             \
         |                        ^~~
   include/linux/atomic/atomic-arch-fallback.h:91:29: note: in expansion of macro 'arch_cmpxchg'
      91 | #define raw_cmpxchg_relaxed arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2108:16: note: in expansion of macro 'raw_cmpxchg_relaxed'
    2108 |         return raw_cmpxchg_relaxed(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
>> arch/arc/include/asm/cmpxchg.h:71:23: warning: unused variable '_new_' [-Wunused-variable]
      71 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
         |                       ^~~~~
   include/linux/atomic/atomic-arch-fallback.h:91:29: note: in expansion of macro 'arch_cmpxchg'
      91 | #define raw_cmpxchg_relaxed arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2108:16: note: in expansion of macro 'raw_cmpxchg_relaxed'
    2108 |         return raw_cmpxchg_relaxed(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
>> arch/arc/include/asm/cmpxchg.h:70:23: warning: unused variable '_old_' [-Wunused-variable]
      70 |         unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));              \
         |                       ^~~~~
   include/linux/atomic/atomic-arch-fallback.h:91:29: note: in expansion of macro 'arch_cmpxchg'
      91 | #define raw_cmpxchg_relaxed arch_cmpxchg
         |                             ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2108:16: note: in expansion of macro 'raw_cmpxchg_relaxed'
    2108 |         return raw_cmpxchg_relaxed(&v->counter, old, new);
         |                ^~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:185: kernel/bounds.s] Error 1 shuffle=1050985161
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1425: prepare0] Error 2 shuffle=1050985161
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1050985161
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1050985161
   make: Target 'prepare' not remade because of errors.


vim +/_new_ +71 arch/arc/include/asm/cmpxchg.h

    66	
    67	#define arch_cmpxchg(ptr, old, new)				        \
    68	({									\
    69		volatile __typeof__(ptr) _p_ = (ptr);				\
  > 70		unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));		\
  > 71		unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));		\
    72		__typeof__(*(ptr)) _prev_;					\
    73		unsigned long __flags;						\
    74										\
    75		/*								\
    76		 * spin lock/unlock provide the needed smp_mb() before/after	\
    77		 */								\
    78		atomic_ops_lock(__flags);					\
    79		_prev_ = *_p_;							\
    80		if (_prev_ == _o_)						\
    81			*_p_ = _n_;						\
    82		atomic_ops_unlock(__flags);					\
    83		_prev_;								\
    84	})
    85	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
