Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA87C3ABC3
	for <linux-snps-arc@archiver.kernel.org>; Mon, 12 May 2025 05:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ag4wdmCIUnpR0bqxBDRgai7SepHtuKced1LAzb+adZ4=; b=SV4+dygp95AMFy
	rmpRcLckTf7NWRFfu0D1tnNm7QqcAS4+4xO/MUVF1YCjx20hNmgJsyMkwa08RmBOI1WKheIMyVIiw
	emmfrRXlWr6toO+XnE47VqU+azkG4t/3gvMdezGlZVxNMQyGMNjf7rRvdtVQwCAFa28LyU9nxdOVD
	WuUDj7Xh/YpqISV7+ZLkxeuDRXBi3jF60ueUxoxLhfsIkZQs4Md3rskzKAr4ai5WtDqk1aRIp24l1
	5WgAbUJSwJNpV5GGvjDcX1geYXoNLGfg7qJn1RPbd/J0RvRcnTwDqX6FLUVMVlaUtJhEIIyh/YMJV
	9GqJa7AO3QKOVOkLSO6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uELw6-00000008QfU-2Ob0;
	Mon, 12 May 2025 05:42:46 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uELu5-00000008QWP-3dbD
	for linux-snps-arc@lists.infradead.org;
	Mon, 12 May 2025 05:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747028442; x=1778564442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W1kuVJ1hrT0oinDKb+swhOeCE0WjQvxBfgFzwL9Ibyw=;
  b=BGA4m6uo3uO1GUhyPXZOw/JvDpWZKD57arijuIXJMoAtwDbLldPnVMhx
   fItdpyULYUSjEAyLNbYr1vQClO2eRtCeQ1lLzgWiSFGk052gNxxuRv26f
   AGV4A3FKbO3+qAgr3f2wtswsqxq0pwnmPagY0Q9eE7gy2QLppklvt4cMf
   cat+gbd8YzZuWXGdZZ8y8lEBEpn7nBY7JEj8tfLiAvjmFcXDO5HBJ+0sv
   GzsP7rOrcAnrHCgI0MXTVpipFLXd7lf3rKI1+fTK8FRf4/1xposcHHIG9
   dzX3vnSBvgc+MDxsoLAcSi8WxeOShMlBDDHlAZXeir9XSfWZ70Uo23EKb
   g==;
X-CSE-ConnectionGUID: 8sg+x+YIRSGVYKbV0804Vg==
X-CSE-MsgGUID: g6VdNR1kRCSj2QYm3KsQqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="66347959"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="66347959"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 22:40:41 -0700
X-CSE-ConnectionGUID: ZQBA3aluQGWuupA0PyYFuA==
X-CSE-MsgGUID: 7+0mR8SIQ7mI9xlte9HRDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="142380062"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 May 2025 22:40:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uELu0-000ECt-35;
	Mon, 12 May 2025 05:40:36 +0000
Date: Mon, 12 May 2025 13:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: Shahab Vahedi <shahab@synopsys.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>
Subject: arch/arc/net/bpf_jit_arcv2.c:2236:3: error: label at end of compound
 statement
Message-ID: <202505121349.qq0nmtYa-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_224041_982412_A826314F 
X-CRM114-Status: UNSURE (   9.80  )
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
head:   82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
commit: f122668ddcce450c2585f0be4bf4478d6fd6176b ARC: Add eBPF JIT support
date:   12 months ago
config: arc-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250512/202505121349.qq0nmtYa-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505121349.qq0nmtYa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505121349.qq0nmtYa-lkp@intel.com/

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
>> {standard input}:315: Error: flag mismatch for instruction 'mpydu'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM_XE [=m] && DRM_XE [=m]=m


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
