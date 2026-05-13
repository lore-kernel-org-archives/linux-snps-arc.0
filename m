Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81770CD4F35
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 May 2026 10:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Subject:Cc:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=31SFAiZkgv8ZQqZm8PzRRgue9FqssS1ummWAwOn3sXw=; b=aNYtKF0sRgvgVk
	iZ+Mo6k4IcxRi0cBJ9S+B/mhVbOWRTFZLhiw/pATo52S+ZaiYcTX6MD01vOv4CKnL7QUnTN6RdKuY
	E8FyNtnfFpmSz/QBbPQvQgyszPiAhx8f0ORrzin+JAGUry2Tbr/VhEh0/LV3CpsFhX/wo74UQwTAu
	GnaChL5muv2OLEiTxg+kfJ83GPQuIuwOVh/gJ1bOD8EMqNO+JOhsQL4HD2NgoQrKaxbHPTAl8o7EF
	RxPX98bYrNZuPe+qkWMnXNaQemB8XHnBcGCYZI8+VhINlycstrw+OxUuYA4kOJwUyXrP8CJrE/ALB
	J28WV8UwozSIaFTHUuHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN75g-00000002F4j-0WUl;
	Wed, 13 May 2026 10:45:24 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN75c-00000002F31-3c0Q
	for linux-snps-arc@lists.infradead.org;
	Wed, 13 May 2026 10:45:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778669121; x=1810205121;
  h=date:from:to:cc:subject:message-id;
  bh=XIBWJCtKiNO8Rm6wrLFw6CaZkxN/hzd99ZgWbA5ws7Y=;
  b=IWvoV9b9Vi5Te1rvMu5MyVca2cVJRBKicbxsF1GNtDFL5EVEBHehl1fe
   ucr/gXWMrtlELsMD409R4ZPLDJj2rh/r6H6cE+a3UM4Q+txZ86ZEm/O9r
   3S41J/zMD4v+90+3y1JFJM9Q4x0sXHNVty18sLVgWY5+gk26t0zE3e8nV
   0nEaTZVT2FjTKCIc9uXCT5CWf50fkVTMj/kaA2hRmUF9CSxkwN0iXkd2s
   OyUQvFn3a5CzrZlKHNlRlOBQ9piYgZIoxdoJPffVLMi0iBD/laSt0H60s
   sTAt4C2s/0cn8WkL2cYvFJhscDJvQcaJb74OorBbMmyOx24t1050U64si
   Q==;
X-CSE-ConnectionGUID: BqMeL4ZyR962FmGZFcgoUw==
X-CSE-MsgGUID: GxLEwdM6SXqGRYnIpDgT3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="83464593"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="83464593"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 03:45:20 -0700
X-CSE-ConnectionGUID: 8Y9l9NuDTb2Q/p9QuabcOg==
X-CSE-MsgGUID: jgOPQ0KZQ3e9Sa1qfIjXkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="233599545"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 May 2026 03:45:18 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN75X-000000003wt-15xQ;
	Wed, 13 May 2026 10:45:15 +0000
Date: Wed, 13 May 2026 18:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>
Subject: include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse:
 sparse: cast truncates bits from constant value (aaa31337c001d00d becomes
 c001d00d)
Message-ID: <202605131853.YyzJSW8K-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_034520_940096_ACA661E5 
X-CRM114-Status: UNSURE (   6.66  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1d5dcaa3bd65f2e8c9baa14a393d3a2dc5db7524
commit: ea7caffedd011f7d40abe93a884ffbe46f122535 ARC: atomics: Implement arch_atomic64_cmpxchg using _relaxed
date:   11 months ago
config: arc-randconfig-r121-20260513 (https://download.01.org/0day-ci/archive/20260513/202605131853.YyzJSW8K-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605131853.YyzJSW8K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ea7caffedd01 ("ARC: atomics: Implement arch_atomic64_cmpxchg using _relaxed")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605131853.YyzJSW8K-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/atomic64_test.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/arc/include/asm/bitops.h, include/linux/bitops.h, ...):
>> include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
   include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   include/linux/atomic/atomic-arch-fallback.h:4181:16: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
   include/linux/atomic/atomic-arch-fallback.h:4181:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   include/linux/atomic/atomic-arch-fallback.h:4209:16: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
   include/linux/atomic/atomic-arch-fallback.h:4209:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   include/linux/atomic/atomic-arch-fallback.h:4234:16: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
   include/linux/atomic/atomic-arch-fallback.h:4234:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
>> include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes f00df001)
   include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   include/linux/atomic/atomic-arch-fallback.h:4181:16: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes f00df001)
   include/linux/atomic/atomic-arch-fallback.h:4181:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   include/linux/atomic/atomic-arch-fallback.h:4209:16: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes f00df001)
   include/linux/atomic/atomic-arch-fallback.h:4209:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   include/linux/atomic/atomic-arch-fallback.h:4234:16: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes f00df001)
   include/linux/atomic/atomic-arch-fallback.h:4234:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)

vim +4152 include/linux/atomic/atomic-arch-fallback.h

37f8173dd84936e include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  4126  
ad8110706f38117 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4127  /**
ad8110706f38117 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4128   * raw_atomic64_cmpxchg() - atomic compare and exchange with full ordering
ad8110706f38117 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4129   * @v: pointer to atomic64_t
ad8110706f38117 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4130   * @old: s64 value to compare with
ad8110706f38117 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4131   * @new: s64 value to assign
ad8110706f38117 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4132   *
ad8110706f38117 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4133   * If (@v == @old), atomically updates @v to @new with full ordering.
6dfee110c6cc7a6 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2024-02-09  4134   * Otherwise, @v is not modified and relaxed ordering is provided.
ad8110706f38117 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4135   *
ad8110706f38117 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4136   * Safe to use in noinstr code; prefer atomic64_cmpxchg() elsewhere.
ad8110706f38117 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4137   *
ad8110706f38117 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4138   * Return: The original value of @v.
ad8110706f38117 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4139   */
37f8173dd84936e include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  4140  static __always_inline s64
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4141  raw_atomic64_cmpxchg(atomic64_t *v, s64 old, s64 new)
37f8173dd84936e include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  4142  {
1d78814d41701c2 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4143  #if defined(arch_atomic64_cmpxchg)
1d78814d41701c2 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4144  	return arch_atomic64_cmpxchg(v, old, new);
1d78814d41701c2 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4145  #elif defined(arch_atomic64_cmpxchg_relaxed)
37f8173dd84936e include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  4146  	s64 ret;
37f8173dd84936e include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  4147  	__atomic_pre_full_fence();
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4148  	ret = arch_atomic64_cmpxchg_relaxed(v, old, new);
37f8173dd84936e include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  4149  	__atomic_post_full_fence();
37f8173dd84936e include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  4150  	return ret;
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4151  #else
9257959a6e5b4fc include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05 @4152  	return raw_cmpxchg(&v->counter, old, new);
d12157efc8e083c include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4153  #endif
1d78814d41701c2 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4154  }
d12157efc8e083c include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4155  

:::::: The code at line 4152 was first introduced by commit
:::::: 9257959a6e5b4fca6fc8e985790bff62c2046f20 locking/atomic: scripts: restructure fallback ifdeffery

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
