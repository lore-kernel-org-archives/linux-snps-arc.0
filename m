Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DC5C5B543
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Jun 2025 11:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1tdIwAd6CT3lPVqjSAhGXrQlmVwnxSJTcgK+5Kl5dwI=; b=ji167LrT7VK8up
	g4Ty7ShFaqlkf/N0VVEIN6i6bkQgnhZQ7HS2v0I8jgUpk98olpDx/izhSgOVUkoGXP0zmFMIpEDHq
	iAs5bZRWYZkKFZJQrpW7tb2tMK9X0IzgjL1296KOUxndJ/+YhqHizGqYRGyXWfCK005gMvDFkpKW9
	rHIRgxTTGc6rBWAsecNHmmrUOc1DCffUT/S9lHZs6cfERgVTll//LevbmBCmlGVH+nm+z722G3yF9
	JhZPXYCv7JDti7640XvcZh+AxmFVXhK/iHT3GUb6hj2UcGVk1XuoCYoM8fuPoIcdVvQKz1aAuPThr
	Mlq7UlnUUHBssgbP2Wkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmAE-0000000DCHb-3oY4;
	Wed, 04 Jun 2025 11:20:10 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmAC-0000000DCHE-1vkG
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Jun 2025 11:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749036008; x=1780572008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YHd4xZcBCdKBN8J++MiZTkfPsgwm7PVknj53DY0Zn6A=;
  b=d9cI759goLtVJzMajHUSedDnAzQs0DFBpL5KtXEw8ncGJXRV5jmqjplG
   pPj7J2iy/fQlOzDwu0+IxuMfjIbhBxs4xIPMH6rB7XVbczaBulcxLChnE
   hq26khpJlY7FVvjIOC18yPGBxWkbFWhPJThY7gFFoBFtOaL5MjD1lWKmN
   5ILSl+3fjzvEuhu29t/zqMkWVrBMF08wxrtVopbLjLOHKItSkxmMhPA0o
   ZCaagkwC1w1mg/HaXadZIra8bYRgvyChCcuTErPONyHj7W4t3i8Prv6W5
   ckSU/3sHpd4Y0jy/9Vk1yHpvjn3+0rtnNdYMlvGDyPzQ07z1X5mm86DhC
   A==;
X-CSE-ConnectionGUID: Ff+EZSznRk+zQJzwWbwHoA==
X-CSE-MsgGUID: 45/36Xw/R2inKIzEHAeODA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51255275"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="51255275"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 04:20:08 -0700
X-CSE-ConnectionGUID: MC94g4S0Th6O+mli522cZA==
X-CSE-MsgGUID: 8+xvg4u4TM+exkC+Lk/Z8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="176110094"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa002.jf.intel.com with ESMTP; 04 Jun 2025 04:20:07 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMmA7-0001g2-2j;
	Wed, 04 Jun 2025 11:20:03 +0000
Date: Wed, 4 Jun 2025 19:19:49 +0800
From: kernel test robot <lkp@intel.com>
To: Shahab Vahedi <shahab@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: arch/arc/net/bpf_jit_arcv2.c:2236:3: error: label at end of compound
 statement
Message-ID: <202506041921.lFErMU6Q-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_042008_559379_216B3B18 
X-CRM114-Status: UNSURE (   9.45  )
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
head:   5abc7438f1e9d62e91ad775cc83c9594c48d2282
commit: f122668ddcce450c2585f0be4bf4478d6fd6176b ARC: Add eBPF JIT support
date:   1 year, 1 month ago
config: arc-randconfig-2005-20250604 (https://download.01.org/0day-ci/archive/20250604/202506041921.lFErMU6Q-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506041921.lFErMU6Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506041921.lFErMU6Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arc/net/bpf_jit_arcv2.c: In function 'gen_swap':
>> arch/arc/net/bpf_jit_arcv2.c:2236:3: error: label at end of compound statement
      default:
      ^~~~~~~
   arch/arc/net/bpf_jit_arcv2.c:2254:3: error: label at end of compound statement
      default:
      ^~~~~~~
   arch/arc/net/bpf_jit_arcv2.c: In function 'gen_jmp_64':
   arch/arc/net/bpf_jit_arcv2.c:2867:2: error: label at end of compound statement
     default:
     ^~~~~~~
--
   {standard input}: Assembler messages:
>> {standard input}:32583: Error: flag mismatch for instruction 'mpyd'


vim +2236 arch/arc/net/bpf_jit_arcv2.c

  2199	
  2200	u8 gen_swap(u8 *buf, u8 rd, u8 size, u8 endian, bool force, bool do_zext)
  2201	{
  2202		u8 len = 0;
  2203	#ifdef __BIG_ENDIAN
  2204		const u8 host_endian = BPF_FROM_BE;
  2205	#else
  2206		const u8 host_endian = BPF_FROM_LE;
  2207	#endif
  2208		if (host_endian != endian || force) {
  2209			switch (size) {
  2210			case 16:
  2211				/*
  2212				 * r = B4B3_B2B1 << 16 --> r = B2B1_0000
  2213				 * then, swape(r) would become the desired 0000_B1B2
  2214				 */
  2215				len = arc_asli_r(buf, REG_LO(rd), REG_LO(rd), 16);
  2216				fallthrough;
  2217			case 32:
  2218				len += arc_swape_r(BUF(buf, len), REG_LO(rd));
  2219				if (do_zext)
  2220					len += zext(BUF(buf, len), rd);
  2221				break;
  2222			case 64:
  2223				/*
  2224				 * swap "hi" and "lo":
  2225				 *   hi ^= lo;
  2226				 *   lo ^= hi;
  2227				 *   hi ^= lo;
  2228				 * and then swap the bytes in "hi" and "lo".
  2229				 */
  2230				len  = arc_xor_r(buf, REG_HI(rd), REG_LO(rd));
  2231				len += arc_xor_r(BUF(buf, len), REG_LO(rd), REG_HI(rd));
  2232				len += arc_xor_r(BUF(buf, len), REG_HI(rd), REG_LO(rd));
  2233				len += arc_swape_r(BUF(buf, len), REG_LO(rd));
  2234				len += arc_swape_r(BUF(buf, len), REG_HI(rd));
  2235				break;
> 2236			default:
  2237				/* The caller must have handled this. */
  2238			}
  2239		} else {
  2240			/*
  2241			 * If the same endianness, there's not much to do other
  2242			 * than zeroing out the upper bytes based on the "size".
  2243			 */
  2244			switch (size) {
  2245			case 16:
  2246				len = arc_and_i(buf, REG_LO(rd), 0xffff);
  2247				fallthrough;
  2248			case 32:
  2249				if (do_zext)
  2250					len += zext(BUF(buf, len), rd);
  2251				break;
  2252			case 64:
  2253				break;
  2254			default:
  2255				/* The caller must have handled this. */
  2256			}
  2257		}
  2258	
  2259		return len;
  2260	}
  2261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
