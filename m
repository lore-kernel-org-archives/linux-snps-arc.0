Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741C7C98304
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2026 21:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBvOLMWjOx1N47Ag9V2Yxw1ryS/JDnTRqatj56s2PE4=; b=JGTrgBq58AoZlE
	tVr0/3LpDKnT3WgMT7HSytm1EJ8ZiqFq2mQA3V1uYHB7l5xz3/TTrEnlH1QXaUXBmctCIIopFl6Wt
	62qhHHGlHwMKjNpif2vSzWys0k+W/vxmDgL9vEtQeQYcOYrTVCxWA99CSGh8gxNB3A+pMeZrqIhbD
	OgX0GUOsoWAs6hSY2zdTxRtaUicEK0xOP6C5ytQcYkmLxTpCnPloarlfDrHrrpDUdrw/eth6pNz9e
	7sfTQMlkLivXRyFcZS5Lt408lnlcfgWkqEWszg1z6HHhZPXW9gTiPsJ5Nx9puFz1R3NF5V1thNmky
	bS+yw2mhzw79u+Ava3OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9UHq-00000009YJN-0Pyn;
	Wed, 23 Sep 2026 21:13:54 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9UHo-00000009YHf-0K3C
	for linux-snps-arc@lists.infradead.org;
	Wed, 23 Sep 2026 21:13:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790198017; bh=WFQPIuFgCtxNIzreo62j+db
	AQSRUt1ZPJeoZDwkNdZk=; b=GrvJXsDzVsTGItj84jiCfMNVAm32j21Jw2znyw9LS89Fd8aTG/
	WdCtqy64QcwQvLGNJFRVmPK8ElF9STIm5CVmb9yH+JLqGLBY5DdZnCWjqs6d+vEc4t+7GeYTTNY
	g8nhxcvHFDDSckBLGER5RmYvFJvc7DcwB/mrm+wl64JiLzI9Qze+D99kWkIi7X+QIQ+jLZimkm9
	5jfqmFN78YZscjJ65Znq9YpAULeCssSIx9bhc+VrRWpL8/Gd+xmedLBRQRkM2yeKIbBe68ybja1
	ces3008A+w19nAgzdKD1amE7rmoHXYo1W74xz1VerlVknyjcULppDJZqxZpHko71Ycg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790198017; bh=WFQPIuFgCtxNIzreo62j+db
	AQSRUt1ZPJeoZDwkNdZk=; b=uSqc6GAMfwIrUvpEslRqX1VA/G7v/OYYZ8MagUhBVqlhHySR9i
	4lvwinwW+bsAVGUpUgYs9tx4TNlvZZ+sUEDg==;
Date: Wed, 23 Sep 2026 22:13:37 +0100
From: Bradley Morgan <brads@mainlining.org>
To: kernel test robot <lkp@intel.com>
CC: oe-kbuild-all@lists.linux.dev, linux-snps-arc@lists.infradead.org,
 "Paul E. McKenney" <paulmck@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5Bpaulmckrcu=3Acmpxchg2=2E202?=
 =?US-ASCII?Q?6=2E09=2E22a_25/28=5D_arch/arc/incl?=
 =?US-ASCII?Q?ude/asm/cmpxchg=2Eh=3A71=3A23=3A_war?=
 =?US-ASCII?Q?ning=3A_unused_variable_=27=5Fnew=5F=27?=
In-Reply-To: <202609240539.AkulvjVe-lkp@intel.com>
References: <202609240539.AkulvjVe-lkp@intel.com>
Message-ID: <1849D2CD-4FCF-41BE-86D2-B4DDCF59D20B@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_141352_275255_3E72779F 
X-CRM114-Status: GOOD (  12.36  )
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

On 23 September 2026 22:12:09 BST, kernel test robot <lkp@intel.com> wrote:
>tree:   https://github.com/paulmckrcu/linux cmpxchg2.2026.09.22a
>head:   54c282c15475ebfae4712fe3ab637c9d19c723d6
>commit: b6d4f6af38f85e7948fd64f9bf09cbb858b4dade [25/28] ARC: Emulate two-byte cmpxchg
>config: arc-randconfig-1001-20260924 (https://download.01.org/0day-ci/archive/20260924/202609240539.AkulvjVe-lkp@intel.com/config)
>compiler: arc-linux-gcc (GCC) 14.3.0
>reproduce (this is a W=1 build):
>(https://download.01.org/0day-ci/archive/20260924/202609240539.AkulvjVe-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new
>version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes:
>https://lore.kernel.org/oe-kbuild-all/202609240539.AkulvjVe-lkp@intel.com/
>
>All warnings (new ones prefixed by >>):
>
>   In file included from arch/arc/include/asm/atomic.h:13,
>                    from include/linux/atomic.h:7,
>                    from include/asm-generic/bitops/lock.h:5,
>                    from arch/arc/include/asm/bitops.h:190,
>                    from include/linux/bitops.h:67,
>                    from include/linux/log2.h:12,
>                    from kernel/bounds.c:14:
>   include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg':
>   arch/arc/include/asm/cmpxchg.h:80:23: error: '_o_' undeclared (first use in this function); did you mean '_p_'?
>      80 |         if (_prev_ == _o_)                                              \
>         |                       ^~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
>    2026 |         return raw_cmpxchg(&v->counter, old, new);
>         |                ^~~~~~~~~~~
>   arch/arc/include/asm/cmpxchg.h:80:23: note: each undeclared identifier is reported only once for each function it appears in
>      80 |         if (_prev_ == _o_)                                              \
>         |                       ^~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
>    2026 |         return raw_cmpxchg(&v->counter, old, new);
>         |                ^~~~~~~~~~~
>   arch/arc/include/asm/cmpxchg.h:81:24: error: '_n_' undeclared (first use in this function); did you mean '_p_'?
>      81 |                 *_p_ = _n_;                                             \
>         |                        ^~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
>    2026 |         return raw_cmpxchg(&v->counter, old, new);
>         |                ^~~~~~~~~~~
>>> arch/arc/include/asm/cmpxchg.h:71:23: warning: unused variable '_new_'
>[-Wunused-variable]
>      71 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
>         |                       ^~~~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
>    2026 |         return raw_cmpxchg(&v->counter, old, new);
>         |                ^~~~~~~~~~~
>>> arch/arc/include/asm/cmpxchg.h:70:23: warning: unused variable '_old_'
>[-Wunused-variable]
>      70 |         unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));              \
>         |                       ^~~~~
>   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
>      55 | #define raw_cmpxchg arch_cmpxchg
>         |                     ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
>    2026 |         return raw_cmpxchg(&v->counter, old, new);
>         |                ^~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg_acquire':
>   arch/arc/include/asm/cmpxchg.h:80:23: error: '_o_' undeclared (first use in this function); did you mean '_p_'?
>      80 |         if (_prev_ == _o_)                                              \
>         |                       ^~~
>   include/linux/atomic/atomic-arch-fallback.h:70:29: note: in expansion of macro 'arch_cmpxchg'
>      70 | #define raw_cmpxchg_acquire arch_cmpxchg
>         |                             ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:2055:16: note: in expansion of macro 'raw_cmpxchg_acquire'
>    2055 |         return raw_cmpxchg_acquire(&v->counter, old, new);
>         |                ^~~~~~~~~~~~~~~~~~~
>   arch/arc/include/asm/cmpxchg.h:81:24: error: '_n_' undeclared (first use in this function); did you mean '_p_'?
>      81 |                 *_p_ = _n_;                                             \
>         |                        ^~~
>   include/linux/atomic/atomic-arch-fallback.h:70:29: note: in expansion of macro 'arch_cmpxchg'
>      70 | #define raw_cmpxchg_acquire arch_cmpxchg
>         |                             ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:2055:16: note: in expansion of macro 'raw_cmpxchg_acquire'
>    2055 |         return raw_cmpxchg_acquire(&v->counter, old, new);
>         |                ^~~~~~~~~~~~~~~~~~~
>>> arch/arc/include/asm/cmpxchg.h:71:23: warning: unused variable '_new_'
>[-Wunused-variable]
>      71 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
>         |                       ^~~~~
>   include/linux/atomic/atomic-arch-fallback.h:70:29: note: in expansion of macro 'arch_cmpxchg'
>      70 | #define raw_cmpxchg_acquire arch_cmpxchg
>         |                             ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:2055:16: note: in expansion of macro 'raw_cmpxchg_acquire'
>    2055 |         return raw_cmpxchg_acquire(&v->counter, old, new);
>         |                ^~~~~~~~~~~~~~~~~~~
>>> arch/arc/include/asm/cmpxchg.h:70:23: warning: unused variable '_old_'
>[-Wunused-variable]
>      70 |         unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));              \
>         |                       ^~~~~
>   include/linux/atomic/atomic-arch-fallback.h:70:29: note: in expansion of macro 'arch_cmpxchg'
>      70 | #define raw_cmpxchg_acquire arch_cmpxchg
>         |                             ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:2055:16: note: in expansion of macro 'raw_cmpxchg_acquire'
>    2055 |         return raw_cmpxchg_acquire(&v->counter, old, new);
>         |                ^~~~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg_release':
>   arch/arc/include/asm/cmpxchg.h:80:23: error: '_o_' undeclared (first use in this function); did you mean '_p_'?
>      80 |         if (_prev_ == _o_)                                              \
>         |                       ^~~
>   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
>      82 | #define raw_cmpxchg_release arch_cmpxchg
>         |                             ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:2083:16: note: in expansion of macro 'raw_cmpxchg_release'
>    2083 |         return raw_cmpxchg_release(&v->counter, old, new);
>         |                ^~~~~~~~~~~~~~~~~~~
>   arch/arc/include/asm/cmpxchg.h:81:24: error: '_n_' undeclared (first use in this function); did you mean '_p_'?
>      81 |                 *_p_ = _n_;                                             \
>         |                        ^~~
>   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
>      82 | #define raw_cmpxchg_release arch_cmpxchg
>         |                             ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:2083:16: note: in expansion of macro 'raw_cmpxchg_release'
>    2083 |         return raw_cmpxchg_release(&v->counter, old, new);
>         |                ^~~~~~~~~~~~~~~~~~~
>>> arch/arc/include/asm/cmpxchg.h:71:23: warning: unused variable '_new_'
>[-Wunused-variable]
>      71 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
>         |                       ^~~~~
>   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
>      82 | #define raw_cmpxchg_release arch_cmpxchg
>         |                             ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:2083:16: note: in expansion of macro 'raw_cmpxchg_release'
>    2083 |         return raw_cmpxchg_release(&v->counter, old, new);
>         |                ^~~~~~~~~~~~~~~~~~~
>>> arch/arc/include/asm/cmpxchg.h:70:23: warning: unused variable '_old_'
>[-Wunused-variable]
>      70 |         unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));              \
>         |                       ^~~~~
>   include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
>      82 | #define raw_cmpxchg_release arch_cmpxchg
>         |                             ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:2083:16: note: in expansion of macro 'raw_cmpxchg_release'
>    2083 |         return raw_cmpxchg_release(&v->counter, old, new);
>         |                ^~~~~~~~~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg_relaxed':
>   arch/arc/include/asm/cmpxchg.h:80:23: error: '_o_' undeclared (first use in this function); did you mean '_p_'?
>      80 |         if (_prev_ == _o_)                                              \
>         |                       ^~~
>   include/linux/atomic/atomic-arch-fallback.h:91:29: note: in expansion of macro 'arch_cmpxchg'
>      91 | #define raw_cmpxchg_relaxed arch_cmpxchg
>         |                             ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:2108:16: note: in expansion of macro 'raw_cmpxchg_relaxed'
>    2108 |         return raw_cmpxchg_relaxed(&v->counter, old, new);
>         |                ^~~~~~~~~~~~~~~~~~~
>   arch/arc/include/asm/cmpxchg.h:81:24: error: '_n_' undeclared (first use in this function); did you mean '_p_'?
>      81 |                 *_p_ = _n_;                                             \
>         |                        ^~~
>   include/linux/atomic/atomic-arch-fallback.h:91:29: note: in expansion of macro 'arch_cmpxchg'
>      91 | #define raw_cmpxchg_relaxed arch_cmpxchg
>         |                             ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:2108:16: note: in expansion of macro 'raw_cmpxchg_relaxed'
>    2108 |         return raw_cmpxchg_relaxed(&v->counter, old, new);
>         |                ^~~~~~~~~~~~~~~~~~~
>>> arch/arc/include/asm/cmpxchg.h:71:23: warning: unused variable '_new_'
>[-Wunused-variable]
>      71 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
>         |                       ^~~~~
>   include/linux/atomic/atomic-arch-fallback.h:91:29: note: in expansion of macro 'arch_cmpxchg'
>      91 | #define raw_cmpxchg_relaxed arch_cmpxchg
>         |                             ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:2108:16: note: in expansion of macro 'raw_cmpxchg_relaxed'
>    2108 |         return raw_cmpxchg_relaxed(&v->counter, old, new);
>         |                ^~~~~~~~~~~~~~~~~~~
>>> arch/arc/include/asm/cmpxchg.h:70:23: warning: unused variable '_old_'
>[-Wunused-variable]
>      70 |         unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));              \
>         |                       ^~~~~
>   include/linux/atomic/atomic-arch-fallback.h:91:29: note: in expansion of macro 'arch_cmpxchg'
>      91 | #define raw_cmpxchg_relaxed arch_cmpxchg
>         |                             ^~~~~~~~~~~~
>   include/linux/atomic/atomic-arch-fallback.h:2108:16: note: in expansion of macro 'raw_cmpxchg_relaxed'
>    2108 |         return raw_cmpxchg_relaxed(&v->counter, old, new);
>         |                ^~~~~~~~~~~~~~~~~~~
>   make[3]: *** [scripts/Makefile.build:185: kernel/bounds.s] Error 1 shuffle=1050985161
>   make[3]: Target 'prepare' not remade because of errors.
>   make[2]: *** [Makefile:1425: prepare0] Error 2 shuffle=1050985161
>   make[2]: Target 'prepare' not remade because of errors.
>   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1050985161
>   make[1]: Target 'prepare' not remade because of errors.
>   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1050985161
>   make: Target 'prepare' not remade because of errors.
>
>
>vim +/_new_ +71 arch/arc/include/asm/cmpxchg.h
>
>    66	
>    67	#define arch_cmpxchg(ptr, old, new)				        \
>    68	({									\
>    69		volatile __typeof__(ptr) _p_ = (ptr);				\
>  > 70		unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));		\
>  > 71		unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));		\
>    72		__typeof__(*(ptr)) _prev_;					\
>    73		unsigned long __flags;						\
>    74										\
>    75		/*								\
>    76		 * spin lock/unlock provide the needed smp_mb() before/after	\
>    77		 */								\
>    78		atomic_ops_lock(__flags);					\
>    79		_prev_ = *_p_;							\
>    80		if (_prev_ == _o_)						\
>    81			*_p_ = _n_;						\
>    82		atomic_ops_unlock(__flags);					\
>    83		_prev_;								\
>    84	})
>    85	
>
>--
>0-DAY CI Kernel Test Service
>https://github.com/intel/lkp-tests/wiki
Apparently nobody uses arc 
--- Thanks!
"I'm not a very positive person" - Linus torvalds

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
