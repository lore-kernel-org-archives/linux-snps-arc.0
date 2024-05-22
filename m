Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2154CC25B78
	for <linux-snps-arc@archiver.kernel.org>; Wed, 22 May 2024 15:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n9NWsdtAz11XcKQMmMJe2bqrZwVRtAhkByTkMHI1eyU=; b=qgdhu2YFi30SRv
	QpCj+0qkxoMP5FLTyxqlfr/CysAS0qtdKLBismAwaTEk99c3eRxVanNITRJ1zejfCkaOdufD1LjVo
	BxaJMv8jvxadh+yDqfnsRu3mNllfHrA8pq7XjbLyuDSwRuSTxGSf7tgV99zHaS7kncQVQsdO3CZwJ
	20gsJnWYhgZX6RfviH6f9Gx0unnfxwTAoHrc8ziMgfQ3To5iDfe2PiPRPtEFmP7L8F5UNopT25OAv
	S/H2D6CXQwY08rcVy8Fb5Yp7gs++Dfo8Szq5gmqi73fGRz1W0U1yc2sS0qRAbor1ch6Z5bATDjmSE
	Y0xRbdTNtfMe7J8bW3yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9nXw-00000003JHL-2Aaf;
	Wed, 22 May 2024 15:06:28 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9nXt-00000003JGR-1dfo
	for linux-snps-arc@lists.infradead.org;
	Wed, 22 May 2024 15:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716390386; x=1747926386;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qv0FoQjoCwEfgMkQVSH/WXa2+aVacXHUSQDy3m2KIU4=;
  b=Tf3hi9xHJic03GrzAX8am5kA3yyJUZyvuEbfE/0zbHXGWCd55okDXlxn
   J2gWEqEkkHnU6iH9Q64HcsfWfk20k+G/gV3TpIm0RG39/AghqJyeOzMm1
   YzJNvYJe6KBEzJ/P5nHo4T8CEdwsPX1vWV8rnJdPgU3o9sRRam6+VNN4m
   YMFfBrf+lW8049Hu2N8GtjupEOMtpCG/U6raxvFCdkcWFlJcsG4F8UWnY
   YviGTk/WQaW/PrzmojKPdtcUCflOZHv69cFIH4ZiZZFgHKWdFsEcWLxVf
   KUbDtICGB5ULYxAbZG1s2t6dpumDUwwoDjq3gQKq/RrNikIpunOP7pIgT
   w==;
X-CSE-ConnectionGUID: bPjJve1NRB2Of1DIh+kM9w==
X-CSE-MsgGUID: y6oDyqoHQGmlkqnw4fgZWQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="11647655"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="11647655"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 08:06:22 -0700
X-CSE-ConnectionGUID: byC7jGm3Tqi5b1v82Ld6Xg==
X-CSE-MsgGUID: ARlKyOfxQUiWaKr6PoEzyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="37797515"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 May 2024 08:06:20 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9nXe-0001fV-1f;
	Wed, 22 May 2024 15:06:12 +0000
Date: Wed, 22 May 2024 23:05:31 +0800
From: kernel test robot <lkp@intel.com>
To: Shahab Vahedi <shahab@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: arch/arc/net/bpf_jit.h:42:15: sparse: sparse: marked inline, but
 without a definition
Message-ID: <202405222314.UG5F2NHn-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_080625_518417_9E704D6C 
X-CRM114-Status: UNSURE (   9.29  )
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
head:   29c73fc794c83505066ee6db893b2a83ac5fac63
commit: f122668ddcce450c2585f0be4bf4478d6fd6176b ARC: Add eBPF JIT support
date:   10 days ago
config: arc-randconfig-r133-20240522 (https://download.01.org/0day-ci/archive/20240522/202405222314.UG5F2NHn-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240522/202405222314.UG5F2NHn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405222314.UG5F2NHn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arc/net/bpf_jit_core.c: note: in included file:
>> arch/arc/net/bpf_jit.h:42:15: sparse: sparse: marked inline, but without a definition
--
>> arch/arc/net/bpf_jit_arcv2.c:2238:17: sparse: sparse: statement expected after case label
   arch/arc/net/bpf_jit_arcv2.c:2256:17: sparse: sparse: statement expected after case label
   arch/arc/net/bpf_jit_arcv2.c:2872:9: sparse: sparse: statement expected after case label
>> arch/arc/net/bpf_jit_arcv2.c:65:10: sparse: sparse: symbol 'bpf2arc' was not declared. Should it be static?
>> arch/arc/net/bpf_jit_arcv2.c:2536:3: sparse: sparse: symbol 'arcv2_64_jccs' was not declared. Should it be static?
>> arch/arc/net/bpf_jit_arcv2.c:2886:10: sparse: sparse: symbol 'arcv2_32_jmps' was not declared. Should it be static?

vim +42 arch/arc/net/bpf_jit.h

    39	
    40	/************** Functions that the back-end must provide **************/
    41	/* Extension for 32-bit operations. */
  > 42	inline u8 zext(u8 *buf, u8 rd);
    43	/***** Moves *****/
    44	u8 mov_r32(u8 *buf, u8 rd, u8 rs, u8 sign_ext);
    45	u8 mov_r32_i32(u8 *buf, u8 reg, s32 imm);
    46	u8 mov_r64(u8 *buf, u8 rd, u8 rs, u8 sign_ext);
    47	u8 mov_r64_i32(u8 *buf, u8 reg, s32 imm);
    48	u8 mov_r64_i64(u8 *buf, u8 reg, u32 lo, u32 hi);
    49	/***** Loads and stores *****/
    50	u8 load_r(u8 *buf, u8 rd, u8 rs, s16 off, u8 size, bool sign_ext);
    51	u8 store_r(u8 *buf, u8 rd, u8 rs, s16 off, u8 size);
    52	u8 store_i(u8 *buf, s32 imm, u8 rd, s16 off, u8 size);
    53	/***** Addition *****/
    54	u8 add_r32(u8 *buf, u8 rd, u8 rs);
    55	u8 add_r32_i32(u8 *buf, u8 rd, s32 imm);
    56	u8 add_r64(u8 *buf, u8 rd, u8 rs);
    57	u8 add_r64_i32(u8 *buf, u8 rd, s32 imm);
    58	/***** Subtraction *****/
    59	u8 sub_r32(u8 *buf, u8 rd, u8 rs);
    60	u8 sub_r32_i32(u8 *buf, u8 rd, s32 imm);
    61	u8 sub_r64(u8 *buf, u8 rd, u8 rs);
    62	u8 sub_r64_i32(u8 *buf, u8 rd, s32 imm);
    63	/***** Multiplication *****/
    64	u8 mul_r32(u8 *buf, u8 rd, u8 rs);
    65	u8 mul_r32_i32(u8 *buf, u8 rd, s32 imm);
    66	u8 mul_r64(u8 *buf, u8 rd, u8 rs);
    67	u8 mul_r64_i32(u8 *buf, u8 rd, s32 imm);
    68	/***** Division *****/
    69	u8 div_r32(u8 *buf, u8 rd, u8 rs, bool sign_ext);
    70	u8 div_r32_i32(u8 *buf, u8 rd, s32 imm, bool sign_ext);
    71	/***** Remainder *****/
    72	u8 mod_r32(u8 *buf, u8 rd, u8 rs, bool sign_ext);
    73	u8 mod_r32_i32(u8 *buf, u8 rd, s32 imm, bool sign_ext);
    74	/***** Bitwise AND *****/
    75	u8 and_r32(u8 *buf, u8 rd, u8 rs);
    76	u8 and_r32_i32(u8 *buf, u8 rd, s32 imm);
    77	u8 and_r64(u8 *buf, u8 rd, u8 rs);
    78	u8 and_r64_i32(u8 *buf, u8 rd, s32 imm);
    79	/***** Bitwise OR *****/
    80	u8 or_r32(u8 *buf, u8 rd, u8 rs);
    81	u8 or_r32_i32(u8 *buf, u8 rd, s32 imm);
    82	u8 or_r64(u8 *buf, u8 rd, u8 rs);
    83	u8 or_r64_i32(u8 *buf, u8 rd, s32 imm);
    84	/***** Bitwise XOR *****/
    85	u8 xor_r32(u8 *buf, u8 rd, u8 rs);
    86	u8 xor_r32_i32(u8 *buf, u8 rd, s32 imm);
    87	u8 xor_r64(u8 *buf, u8 rd, u8 rs);
    88	u8 xor_r64_i32(u8 *buf, u8 rd, s32 imm);
    89	/***** Bitwise Negate *****/
    90	u8 neg_r32(u8 *buf, u8 r);
    91	u8 neg_r64(u8 *buf, u8 r);
    92	/***** Bitwise left shift *****/
    93	u8 lsh_r32(u8 *buf, u8 rd, u8 rs);
    94	u8 lsh_r32_i32(u8 *buf, u8 rd, u8 imm);
    95	u8 lsh_r64(u8 *buf, u8 rd, u8 rs);
    96	u8 lsh_r64_i32(u8 *buf, u8 rd, s32 imm);
    97	/***** Bitwise right shift (logical) *****/
    98	u8 rsh_r32(u8 *buf, u8 rd, u8 rs);
    99	u8 rsh_r32_i32(u8 *buf, u8 rd, u8 imm);
   100	u8 rsh_r64(u8 *buf, u8 rd, u8 rs);
   101	u8 rsh_r64_i32(u8 *buf, u8 rd, s32 imm);
   102	/***** Bitwise right shift (arithmetic) *****/
   103	u8 arsh_r32(u8 *buf, u8 rd, u8 rs);
   104	u8 arsh_r32_i32(u8 *buf, u8 rd, u8 imm);
   105	u8 arsh_r64(u8 *buf, u8 rd, u8 rs);
   106	u8 arsh_r64_i32(u8 *buf, u8 rd, s32 imm);
   107	/***** Frame related *****/
   108	u32 mask_for_used_regs(u8 bpf_reg, bool is_call);
   109	u8 arc_prologue(u8 *buf, u32 usage, u16 frame_size);
   110	u8 arc_epilogue(u8 *buf, u32 usage, u16 frame_size);
   111	/***** Jumps *****/
   112	/*
   113	 * Different sorts of conditions (ARC enum as opposed to BPF_*).
   114	 *
   115	 * Do not change the order of enums here. ARC_CC_SLE+1 is used
   116	 * to determine the number of JCCs.
   117	 */
   118	enum ARC_CC {
   119		ARC_CC_UGT = 0,		/* unsigned >  */
   120		ARC_CC_UGE,		/* unsigned >= */
   121		ARC_CC_ULT,		/* unsigned <  */
   122		ARC_CC_ULE,		/* unsigned <= */
   123		ARC_CC_SGT,		/*   signed >  */
   124		ARC_CC_SGE,		/*   signed >= */
   125		ARC_CC_SLT,		/*   signed <  */
   126		ARC_CC_SLE,		/*   signed <= */
   127		ARC_CC_AL,		/* always      */
   128		ARC_CC_EQ,		/*          == */
   129		ARC_CC_NE,		/*          != */
   130		ARC_CC_SET,		/* test        */
   131		ARC_CC_LAST
   132	};
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
