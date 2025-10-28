Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07DFCCD1BF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Oct 2025 14:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3irMeHm3+iMvj5kRR0Dr9ISk1UcJK7nwoSLxwyk88Po=; b=c/wIDXsxdm3gbv
	V5R50CN75Pg0tyG1m5o+IcRuVA+Wcub/7xQuvVRsBTXybUGpDFY5zr7G3jtPYougqlCtonY4FKXQm
	dnLukFeZLjvsQVpABjqQIgD3zXsMrF4Y2bA2XfCsjf2l/wiXpi1gi0UscGrHYk4XcbmXbdWFfMm4A
	xr0R7ZBmUntMIrW+y/sGW7E4Nheh02pT+3Zvi2CkFvaN1T/klIKvSFJA/HFFsaFJRvjLQwCTKfeoI
	8pUo29xs5Q065mlOivs/vwVcgYVg8O91Tyb5LTW+ERJWPq/Q+KLTFffbbcrvUYz/ahcANB9eCRq2K
	Wauvh6Zse2wZ/vYZ2X0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDkvg-0000000G6kp-1htg;
	Tue, 28 Oct 2025 14:44:08 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDkvd-0000000G6k6-44MN
	for linux-snps-arc@lists.infradead.org;
	Tue, 28 Oct 2025 14:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761662646; x=1793198646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uHlWjfN/mb18cUtiJHWf+tS/jejD/ik7CmtMoAVGbyE=;
  b=m+r4yTM4eI0qNjG4WuP0S0r7lX7M4SzMpdpb0/l9TiZh0Md1K2Kk4bP4
   AFAKY5XJ4wiPjCswxbIge7qIJ8gpsvsqWaRoMmDwupmJgHveNiTQCdxtH
   ED+1SfdhqKa4wNXE6IkIIZY5c1Wv5krKOhAXKTroUbdad8pmEfRn4yxh7
   bb9hjVDZ1BL1K3/V2Zxx+grE6OImz8gdoWrfOB+AHWXNF6ZP4Vz+2muVW
   rchuHMo7yqbqGScYxq8zh28kwPRVf49deS3BWuZkVzsRI0T1HGAHVzsJ1
   5/zWyBh4h7Q0jr/FyWwkpNfBWBT0mFt6ys3KtqPwGwYtPEKth2tVq33Hb
   A==;
X-CSE-ConnectionGUID: u8v5NKznQ6Cm19SfFQkYtQ==
X-CSE-MsgGUID: AsdYU63NREqPQJNMonfmJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63858548"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="63858548"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 07:44:05 -0700
X-CSE-ConnectionGUID: 55qJYwYyQL6oByaQat3B4w==
X-CSE-MsgGUID: 8fTEXKITSDekeW24gvCZqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="185822693"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 28 Oct 2025 07:44:04 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDkvZ-000JG0-2B;
	Tue, 28 Oct 2025 14:44:01 +0000
Date: Tue, 28 Oct 2025 22:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Vineet Gupta <vgupta@kernel.org>
Subject: include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse: sparse:
 cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
Message-ID: <202510282219.yD4DaWrP-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_074406_025780_179F226D 
X-CRM114-Status: UNSURE (   7.81  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd57572253bc356330dbe5b233c2e1d8426c66fd
commit: ea7caffedd011f7d40abe93a884ffbe46f122535 ARC: atomics: Implement arch_atomic64_cmpxchg using _relaxed
date:   5 months ago
config: arc-randconfig-r121-20251028 (https://download.01.org/0day-ci/archive/20251028/202510282219.yD4DaWrP-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510282219.yD4DaWrP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510282219.yD4DaWrP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/atomic64_test.c: note: in included file (through include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/arc/include/asm/bitops.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
>> include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   include/linux/atomic/atomic-arch-fallback.h:4181:16: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
   include/linux/atomic/atomic-arch-fallback.h:4181:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   include/linux/atomic/atomic-arch-fallback.h:4209:16: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
   include/linux/atomic/atomic-arch-fallback.h:4209:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   include/linux/atomic/atomic-arch-fallback.h:4234:16: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
   include/linux/atomic/atomic-arch-fallback.h:4234:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes f00df001)
>> include/linux/atomic/atomic-arch-fallback.h:4152:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   include/linux/atomic/atomic-arch-fallback.h:4181:16: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes f00df001)
   include/linux/atomic/atomic-arch-fallback.h:4181:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   include/linux/atomic/atomic-arch-fallback.h:4209:16: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes f00df001)
   include/linux/atomic/atomic-arch-fallback.h:4209:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   include/linux/atomic/atomic-arch-fallback.h:4234:16: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes f00df001)
   include/linux/atomic/atomic-arch-fallback.h:4234:16: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)

vim +4152 include/linux/atomic/atomic-arch-fallback.h

37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  4126  
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4127  /**
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4128   * raw_atomic64_cmpxchg() - atomic compare and exchange with full ordering
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4129   * @v: pointer to atomic64_t
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4130   * @old: s64 value to compare with
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4131   * @new: s64 value to assign
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4132   *
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4133   * If (@v == @old), atomically updates @v to @new with full ordering.
6dfee110c6cc7a include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2024-02-09  4134   * Otherwise, @v is not modified and relaxed ordering is provided.
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4135   *
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4136   * Safe to use in noinstr code; prefer atomic64_cmpxchg() elsewhere.
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4137   *
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4138   * Return: The original value of @v.
ad8110706f3811 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4139   */
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  4140  static __always_inline s64
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4141  raw_atomic64_cmpxchg(atomic64_t *v, s64 old, s64 new)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  4142  {
1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4143  #if defined(arch_atomic64_cmpxchg)
1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4144  	return arch_atomic64_cmpxchg(v, old, new);
1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4145  #elif defined(arch_atomic64_cmpxchg_relaxed)
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  4146  	s64 ret;
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  4147  	__atomic_pre_full_fence();
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4148  	ret = arch_atomic64_cmpxchg_relaxed(v, old, new);
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  4149  	__atomic_post_full_fence();
37f8173dd84936 include/linux/atomic-arch-fallback.h        Peter Zijlstra 2020-01-24  4150  	return ret;
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4151  #else
9257959a6e5b4f include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05 @4152  	return raw_cmpxchg(&v->counter, old, new);
d12157efc8e083 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4153  #endif
1d78814d41701c include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4154  }
d12157efc8e083 include/linux/atomic/atomic-arch-fallback.h Mark Rutland   2023-06-05  4155  

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
