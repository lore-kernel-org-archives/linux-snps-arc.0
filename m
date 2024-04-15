Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6B8C4345F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Apr 2024 21:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6v/45MbCur7DUNhYf8aa3ZQ9hsFxngls4NineFiy2B8=; b=AqP/x1B1Cj6fgy
	gaZBXP4ZLLJGIBuh9a3D7BJqAC31LacNTgkXEat14+KeaOKqjU8/mrwbHGcidbshK+ZP+VWyrr0NV
	Xc0gGxPqaQozN1sO7F9gDBwNuo9G+7EJLHbdSIWtxMD/vbQXU0qRwVx8wgPMn0t2/sPCoWgfIev+Q
	PXldehXPHNK13m8rsPJ/8FMfnvbDZyW/tXmVmj74w4D3P9t4WAzy395LIXrTkgfiywvB3fzoU5KBT
	sEu+nyWdGgYiHbNMFc3igZZCDR267xCFsfBvtMXrn2vQhlvtFgXT8coCsK9eaqJ5ZLey5s314Wvp9
	KBqOdc2Nja/XOo8aaRUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwTYq-00000009vJu-1tan;
	Mon, 15 Apr 2024 21:08:20 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwTYn-00000009v8L-2KH8
	for linux-snps-arc@lists.infradead.org;
	Mon, 15 Apr 2024 21:08:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713215297; x=1744751297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HTswpeWTqlqRO4Z7nRnbsNegu7NAlPW8sxScnc8V1YY=;
  b=HYSbYJxtlhDUUUUzkQUE+0WhHd+EWVJiRcBOC1cKUL3p38c4OueToCgn
   h6NyRjtVr0zn/WQIgKVW76b2euBblWS3eyMm74C/FUvgOfAWPgV+TyGiO
   gf3wiIZ3GLe6X8/ChJplMaYiRSeJzIAy2zvEy0JAPHHiwhK+/ZJatp+r7
   Ar2OZPyZjMZVZBWM3rnmRdcMPxdLvThgkPeqJ4LC3ir443YoBMNmrLzgt
   tPlwgHgRk3RBtrt8QDRW/piJNuhQPGhiAfhkPUE+g2i1llH4EOVfRXzN0
   xHIY0aX3FGcyV9/vHPAYr/98b3i5dy6CL2b4RIn80tbsEpgrWqME+1Rwg
   Q==;
X-CSE-ConnectionGUID: AE6kCyNURAu0xca/4Jog9A==
X-CSE-MsgGUID: f3NuTAO8SYur8gNQCGcVBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="12404592"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="12404592"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 14:07:58 -0700
X-CSE-ConnectionGUID: n4v3mX0uQn2ombcOmLA+yA==
X-CSE-MsgGUID: Su4Kic6XR3SVPA36LZfymQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="26834182"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 15 Apr 2024 14:07:57 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwTYQ-0004eb-2e;
	Mon, 15 Apr 2024 21:07:54 +0000
Date: Tue, 16 Apr 2024 05:07:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-snps-arc@lists.infradead.org
Subject: [linux-next:master 4535/6266] arch/arc/include/asm/cmpxchg.h:73:27:
 error: implicit declaration of function 'cmpxchg_emu_u8'
Message-ID: <202404160503.zFIp77TO-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_140817_637452_3E55D78C 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6bd343537461b57f3efe5dfc5fc193a232dfef1e
commit: d4f26ed66a53be57567bf71d60e80a116cec34e1 [4535/6266] ARC: Emulate one-byte cmpxchg
config: arc-randconfig-r016-20230816 (https://download.01.org/0day-ci/archive/20240416/202404160503.zFIp77TO-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404160503.zFIp77TO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404160503.zFIp77TO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from kernel/bounds.c:13:
   arch/arc/include/asm/bitops.h: In function '__fls':
   arch/arc/include/asm/bitops.h:137:17: error: implicit declaration of function '__builtin_arc_fls'; did you mean '__builtin_arc_flag'? [-Werror=implicit-function-declaration]
     137 |         return  __builtin_arc_fls(x);
         |                 ^~~~~~~~~~~~~~~~~
         |                 __builtin_arc_flag
   In file included from arch/arc/include/asm/atomic.h:31,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arc/include/asm/bitops.h:188:
   arch/arc/include/asm/atomic64-arcv2.h: At top level:
   arch/arc/include/asm/atomic64-arcv2.h:13:3: error: conflicting types for 'atomic64_t'; have 'struct <anonymous>'
      13 | } atomic64_t;
         |   ^~~~~~~~~~
   In file included from include/linux/page-flags.h:9,
                    from kernel/bounds.c:10:
   include/linux/types.h:184:3: note: previous declaration of 'atomic64_t' with type 'atomic64_t'
     184 | } atomic64_t;
         |   ^~~~~~~~~~
   In file included from arch/arc/include/asm/atomic.h:13:
   include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg':
>> arch/arc/include/asm/cmpxchg.h:73:27: error: implicit declaration of function 'cmpxchg_emu_u8' [-Werror=implicit-function-declaration]
      73 |                 __flags = cmpxchg_emu_u8((volatile u8 *)_p_, _o_, _n_); \
         |                           ^~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
    2026 |         return raw_cmpxchg(&v->counter, old, new);
         |                ^~~~~~~~~~~
   In file included from arch/arc/include/uapi/asm/byteorder.h:14,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/arc/include/asm/bitops.h:192:
   include/linux/byteorder/big_endian.h: At top level:
   include/linux/byteorder/big_endian.h:8:2: warning: #warning inconsistent configuration, needs CONFIG_CPU_BIG_ENDIAN [-Wcpp]
       8 | #warning inconsistent configuration, needs CONFIG_CPU_BIG_ENDIAN
         |  ^~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:117: kernel/bounds.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1197: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:240: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:240: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/cmpxchg_emu_u8 +73 arch/arc/include/asm/cmpxchg.h

    62	
    63	#define arch_cmpxchg(ptr, old, new)				        \
    64	({									\
    65		volatile __typeof__(ptr) _p_ = (ptr);				\
    66		__typeof__(*(ptr)) _o_ = (old);					\
    67		__typeof__(*(ptr)) _n_ = (new);					\
    68		__typeof__(*(ptr)) _prev_;					\
    69		unsigned long __flags;						\
    70										\
    71		switch(sizeof((_p_))) {						\
    72		case 1:								\
  > 73			__flags = cmpxchg_emu_u8((volatile u8 *)_p_, _o_, _n_);	\
    74			_prev_ = (__typeof__(*(ptr)))__flags;			\
    75			break;							\
    76			break;							\
    77		case 4:								\
    78			/*							\
    79			 * spin lock/unlock provide the needed smp_mb()		\
    80			 * before/after						\
    81			 */							\
    82			atomic_ops_lock(__flags);				\
    83			_prev_ = *_p_;						\
    84			if (_prev_ == _o_)					\
    85				*_p_ = _n_;					\
    86			atomic_ops_unlock(__flags);				\
    87			break;							\
    88		default:							\
    89			BUILD_BUG();						\
    90		}								\
    91										\
    92		_prev_;								\
    93	})
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
