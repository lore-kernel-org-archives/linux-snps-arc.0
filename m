Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412ADD2069D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Oct 2024 05:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jc/AA8HvVV5FwVFonqls8WTWynhSDSWXlkqFaKGlcTE=; b=tz7ezawKW7skq+
	qB0U9UZX0v1XCTA/8+83Gtl/I2b530vaH5cOMqm4zMJfhbZDix1uHPIysv+/yBG2yaEihgUNgFyyb
	8BOOHcActeMqO7AorDlo4YikQVfPzHDvgJIAkKjBgWMhaqojRfaBnXKaCnVJkjlFwO4lUpswbJ/RT
	pWOV2uSMHMF9TW/5T632V0Iv9nCP7EAGjUmjeiZjIlilXORAF3YqDRSC79g7n4yS7vyqwlbmSF4AF
	YRBeqV9UK3iPlJFCMRzbEPCTF3ot/zOn+zfGC5KL4tbj+MNheJvgKmpeybZ4zyALrO68Y24gt/IlR
	lISLy4QrhiXonxEjKvlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0wcN-0000000Aa3l-3l6j;
	Wed, 16 Oct 2024 05:30:43 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0wcJ-0000000Aa0z-0ZTE
	for linux-snps-arc@lists.infradead.org;
	Wed, 16 Oct 2024 05:30:41 +0000
Message-ID: <cf861787-f8d2-4dd0-ae6b-1f49bd768a8f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729056633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aktKdncQvhC4zHX0AneX7OeeDzFNEtNJOtT3XD697Vc=;
	b=UtC8bZ+qM2jaduHZlbLlCmtynoI2MY7cHTCindjVv1wYfqi5QGNg12vbgqW0W/QfIbjMGP
	yr0Mdl5yiE28eGk7NBX+6IfNJWjzQpQo9D3sToKhRs3wKiCbIUaeqDS4f6cGaRhXmbfbWm
	aV7Dz6S7hqL+SzFRjVi7ryjie+IPfxM=
Date: Tue, 15 Oct 2024 22:30:27 -0700
MIME-Version: 1.0
Subject: Re: include/linux/compiler_types.h:328:45: error: call to
 '__compiletime_assert_315' declared with attribute error: BUILD_BUG_ON
 failed: (PTRS_PER_PTE * sizeof(pte_t)) > PAGE_SIZE
To: kernel test robot <lkp@intel.com>, Vineet Gupta <vgupta@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org
References: <202409160223.xydgucbY-lkp@intel.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <202409160223.xydgucbY-lkp@intel.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_223039_756603_60CBD75A 
X-CRM114-Status: GOOD (  15.96  )
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

On 9/15/24 11:07, kernel test robot wrote:
> Hi Vineet,
>
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   98f7e32f20d28ec452afb208f9cffc08448a2652
> commit: d9820ff76f95fa26d33e412254a89cd65b23142d ARC: mm: switch pgtable_t back to struct page *
> date:   3 years, 1 month ago
> config: arc-randconfig-r064-20240915 (https://download.01.org/0day-ci/archive/20240916/202409160223.xydgucbY-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409160223.xydgucbY-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409160223.xydgucbY-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    arch/arc/mm/init.c:35:13: warning: no previous prototype for 'arc_get_mem_sz' [-Wmissing-prototypes]
>       35 | long __init arc_get_mem_sz(void)
>          |             ^~~~~~~~~~~~~~
>    arch/arc/mm/init.c:88:13: warning: no previous prototype for 'setup_arch_memory' [-Wmissing-prototypes]
>       88 | void __init setup_arch_memory(void)
>          |             ^~~~~~~~~~~~~~~~~
>    In file included from <command-line>:
>    arch/arc/mm/init.c: In function 'mem_init':

I can't reproduce them anymore.


>>> include/linux/compiler_types.h:328:45: error: call to '__compiletime_assert_315' declared with attribute error: BUILD_BUG_ON failed: (PTRS_PER_PTE * sizeof(pte_t)) > PAGE_SIZE
>      328 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>          |                                             ^
>    include/linux/compiler_types.h:309:25: note: in definition of macro '__compiletime_assert'
>      309 |                         prefix ## suffix();                             \
>          |                         ^~~~~~
>    include/linux/compiler_types.h:328:9: note: in expansion of macro '_compiletime_assert'
>      328 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>          |         ^~~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>       39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>          |                                     ^~~~~~~~~~~~~~~~~~
>    include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>       50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
>          |         ^~~~~~~~~~~~~~~~
>    arch/arc/mm/init.c:194:9: note: in expansion of macro 'BUILD_BUG_ON'
>      194 |         BUILD_BUG_ON((PTRS_PER_PTE * sizeof(pte_t)) > PAGE_SIZE);
>          |         ^~~~~~~~~~~~

Posted a patch for this [1]

[1] http://lists.infradead.org/pipermail/linux-snps-arc/2024-October/008319.html

Thx,
-Vineet


>
>
> vim +/__compiletime_assert_315 +328 include/linux/compiler_types.h
>
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  314  
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  315  #define _compiletime_assert(condition, msg, prefix, suffix) \
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  316  	__compiletime_assert(condition, msg, prefix, suffix)
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  317  
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  318  /**
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  319   * compiletime_assert - break build and emit msg if condition is false
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  320   * @condition: a compile-time constant condition to check
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  321   * @msg:       a message to emit if condition is false
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  322   *
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  323   * In tradition of POSIX assert, this macro will break the build if the
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  324   * supplied condition is *false*, emitting the supplied error message if the
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  325   * compiler has support to do so.
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  326   */
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  327  #define compiletime_assert(condition, msg) \
> eb5c2d4b45e3d2 Will Deacon 2020-07-21 @328  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
> eb5c2d4b45e3d2 Will Deacon 2020-07-21  329  
>
> :::::: The code at line 328 was first introduced by commit
> :::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h
>
> :::::: TO: Will Deacon <will@kernel.org>
> :::::: CC: Will Deacon <will@kernel.org>
>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
