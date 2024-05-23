Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF5CC25B79
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 May 2024 12:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CpMsyj3LHVPwkQW+LtEthVVqxFXEcdI6iEKLnhRXlQw=; b=IjlWbWtAFiUa3S
	geubP8969WW9xcjMqV+60MxVhB26jSXUU9PlLykxYIhAJckPA21nPJMdOZb6umVIHUsXMl9KIck+U
	hWJCUT03EuCUGtiNQyMNP6TtcT5e80QxNgiN4GjsRRvGKtN5lWmVZtEWDPYnISsAeXHkzaRvp0owS
	v7q89bLwwJBoaFAplVb2ePiZBWlfnLiqYQvrvpuGhq6EoNJ2nj0rffBZudz6NWKml7bLUhB2y+Lrp
	2gYX3J6FcWB9VZRCLvuq6MTCp+0/QZFJKnszXmq41Bf9F6olZUMkXJVduBxAmyVnKURGqLsNH+bl3
	L8UnnFSmcWyH+1Q0fqPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7iu-00000006DAY-2igs;
	Thu, 23 May 2024 12:39:08 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7ir-00000006D9t-0mfm
	for linux-snps-arc@lists.infradead.org;
	Thu, 23 May 2024 12:39:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716467945; x=1748003945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NxNHmDTyf45u7ZHwoFE+CVEyUDmnNLkRf5O6kktNz0o=;
  b=nv1WFLuZerMF3kEtoXGyr/jKcLWtk/aU+JNhrt+yKnVNAGKAk0ZMmO63
   dic3eSgR3S6Tdq3INQgp29iBkDLebyT9tLsxwuh8kue9FwdB8qDfTC4bT
   7wyjckxn/fiBdEzQ+pFCZN9vt3JPqDfH0Dxb8e1ft5wcU5fglYVCXNnBo
   5usq4f7neFyM5LakA/rQSblVmiHxqU0R7twRS71vfwoIMsDCgpwjaemjl
   WX7Eq+glORHghHZ8fMIbpeuypD1cPw2b/b/vcVNNNsUnspz0BkO+Jciui
   cUJfEAvVJ4eTWYCbOjDMV9FFs/RloOjpabzVZtR5MICtNj4FhATcaRSol
   Q==;
X-CSE-ConnectionGUID: Dw8hY4g/SiWRQhS8KU7+uA==
X-CSE-MsgGUID: JBkUqhNiQgi25Rk12d5Y8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16608182"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="16608182"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 05:39:03 -0700
X-CSE-ConnectionGUID: N0+VvKRtTvKSyJ7zisdmkw==
X-CSE-MsgGUID: yNXd5J9JSsKM+zgpr7BRxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; 
   d="scan'208";a="33666838"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 May 2024 05:39:00 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sA7il-0002q4-1Y;
	Thu, 23 May 2024 12:38:59 +0000
Date: Thu, 23 May 2024 20:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: Shahab Vahedi <shahab@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: arch/arc/net/bpf_jit_core.c:170:47-52: WARNING: conversion to bool
 not needed here
Message-ID: <202405232036.Xqoc3b0J-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_053905_284352_733C16A1 
X-CRM114-Status: UNSURE (   8.71  )
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
head:   c760b3725e52403dc1b28644fb09c47a83cacea6
commit: f122668ddcce450c2585f0be4bf4478d6fd6176b ARC: Add eBPF JIT support
date:   11 days ago
config: arc-randconfig-r062-20240523 (https://download.01.org/0day-ci/archive/20240523/202405232036.Xqoc3b0J-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405232036.Xqoc3b0J-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arc/net/bpf_jit_core.c:170:47-52: WARNING: conversion to bool not needed here
--
>> arch/arc/net/bpf_jit_core.c:162:16-22: ERROR: application of sizeof to pointer
--
>> arch/arc/net/bpf_jit_core.c:586:5-8: Unneeded variable: "ret". Return "0" on line 638

vim +170 arch/arc/net/bpf_jit_core.c

   158	
   159	/* Initialise the context so there's no garbage. */
   160	static int jit_ctx_init(struct jit_context *ctx, struct bpf_prog *prog)
   161	{
 > 162		memset(ctx, 0, sizeof(ctx));
   163	
   164		ctx->orig_prog = prog;
   165	
   166		/* If constant blinding was requested but failed, scram. */
   167		ctx->prog = bpf_jit_blind_constants(prog);
   168		if (IS_ERR(ctx->prog))
   169			return PTR_ERR(ctx->prog);
 > 170		ctx->blinded = (ctx->prog == ctx->orig_prog ? false : true);
   171	
   172		/* If the verifier doesn't zero-extend, then we have to do it. */
   173		ctx->do_zext = !ctx->prog->aux->verifier_zext;
   174	
   175		ctx->is_extra_pass = ctx->prog->jited;
   176		ctx->user_bpf_prog = ctx->prog->is_func;
   177	
   178		return 0;
   179	}
   180	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
