Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43120C38159
	for <linux-snps-arc@archiver.kernel.org>; Wed, 18 Jan 2023 15:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jkZo5vyX7bFkUMWZ9scfjks1KGeSCY3jxrLjYfqb5XU=; b=bp5jpqtDaFOhjA
	aaeZ5LiFwtvc6ZAGyzzO+TtXIOUJ48P9ygnGVrIg3aCGjY47/HniXBggpvPg9YDxsFG0dr2yOWhkC
	vGxze2krWpR8uGHw6tafNBNC6rS51m3DAMl0BadgrOhNo4UjSahadYuTkiLpqzvveXeiWnSRVRx6k
	Jbgob7GiCAkWgiLDi1P5tX780gnmsLIwl+aYKOYKHSIfIN1A+eYtr/8gdKuVM6uq5tqW0pF5O/JCr
	b4i1oCmB+ZbJbaDfoFuWbsmQ7vRhN86cojphwlf2hawCQ1aZNvjReE75s8NhvXkk4Qrr7PkuSN1/0
	swP4qafdzUtiS8c+WHeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIATt-001aaN-Vn; Wed, 18 Jan 2023 15:36:05 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIATf-001aSf-De; Wed, 18 Jan 2023 15:35:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674056151; x=1705592151;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V+7w/6DVh6oOTj/5Q6BI82PHATnPnRgB/JN4Ard83Dk=;
  b=BggohAOKve+OBWdfXDRzh8DGCfnA4daG0J0GJYiqk21y4XLhntoYriLg
   +Olvz+pnPA7vRQtb7la29gkl0qM/lI3TLcgQbFODZ78fi8qSBnN22sHU8
   pw9pUd4h904taC2beXf0M5UlvDhxlyhI7Vc5XulB6Lv64g2GEd2FDmqyi
   HTnDf+voT/id43uIdmftQxBDbrHG/GPwXu3nPPxNqj+mMLZ+AM5LASWsN
   tzWKQRHPndbgU3e1migZaH24RIlsdPmV6CwGJYU7+EYXcm8+aNWaRf0La
   GENGnt8X/F40L0vzeEyKk7MwDgxkaojcBXVV0O2KZpvvbJ1J2H4PbItt3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="305381643"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="305381643"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 07:35:47 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10593"; a="833614590"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="833614590"
Received: from lab-ah.igk.intel.com ([10.102.42.211])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 07:35:41 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v5 0/7] Introduce __xchg, non-atomic xchg
Date: Wed, 18 Jan 2023 16:35:22 +0100
Message-Id: <20230118153529.57695-1-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_073551_517266_6323C1BC 
X-CRM114-Status: GOOD (  13.24  )
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

Hi all,

The helper is tiny and there are advices we can live without it, so
I want to present few arguments why it would be good to have it:

1. Code readability/simplification/number of lines:
  - decreases number of lines,
  - it often eliminates local variables,
  - for real examples see patches 3+.

2. Presence of similar helpers in other somehow related languages/libs:

a) Rust[1]: 'replace' from std::mem module, there is also 'take'
    helper (__xchg(&x, 0)), which is the same as private helper in
    i915 - fetch_and_zero, see latest patch.
b) C++ [2]: 'exchange' from utility header.

If the idea is OK there are still 2 questions to answer:

1. Name of the helper, __xchg follows kernel conventions,
    but for me Rust names are also OK.
2. Where to put the helper:
a) as in this patchset include/linux/non-atomic/xchg.h,
    proposed by Andy Shevchenko,
b) include/linux/utils.h ? any better name? Some kind
    of container for simple helpers.

All __xchg conversions were performed using cocci script,
then manually adjusted if necessary.

There is lot of places it can be used in, I have just chosen
some of them. I can provide cocci script to detect others (not all),
if necessary.

Changes:
v2: squashed all __xchg -> __arch_xchg t one patch (Arnd)
v3: fixed alpha/xchg_local (lkp@intel.com)
v4: adjusted indentation (Heiko)
v5: added more __xchg conversions - patches 3-6, added tags

[1]: https://doc.rust-lang.org/std/mem/index.html
[2]: https://en.cppreference.com/w/cpp/header/utility

Regards
Andrzej

Andrzej Hajda (7):
  arch: rename all internal names __xchg to __arch_xchg
  linux/include: add non-atomic version of xchg
  arch/*/uprobes: simplify arch_uretprobe_hijack_return_addr
  llist: simplify __llist_del_all
  io_uring: use __xchg if possible
  qed: use __xchg if possible
  drm/i915/gt: use __xchg instead of internal helper

 arch/alpha/include/asm/cmpxchg.h              | 10 +++++-----
 arch/arc/include/asm/cmpxchg.h                |  4 ++--
 arch/arm/include/asm/cmpxchg.h                |  7 ++++---
 arch/arm/probes/uprobes/core.c                |  8 ++------
 arch/arm64/include/asm/cmpxchg.h              |  7 +++----
 arch/arm64/kernel/probes/uprobes.c            |  9 ++-------
 arch/csky/kernel/probes/uprobes.c             |  9 ++-------
 arch/hexagon/include/asm/cmpxchg.h            | 10 +++++-----
 arch/ia64/include/asm/cmpxchg.h               |  2 +-
 arch/ia64/include/uapi/asm/cmpxchg.h          |  4 ++--
 arch/loongarch/include/asm/cmpxchg.h          |  4 ++--
 arch/m68k/include/asm/cmpxchg.h               |  6 +++---
 arch/mips/include/asm/cmpxchg.h               |  4 ++--
 arch/mips/kernel/uprobes.c                    | 10 ++--------
 arch/openrisc/include/asm/cmpxchg.h           | 10 +++++-----
 arch/parisc/include/asm/cmpxchg.h             |  4 ++--
 arch/powerpc/include/asm/cmpxchg.h            |  4 ++--
 arch/powerpc/kernel/uprobes.c                 | 10 ++--------
 arch/riscv/include/asm/atomic.h               |  2 +-
 arch/riscv/include/asm/cmpxchg.h              |  4 ++--
 arch/riscv/kernel/probes/uprobes.c            |  9 ++-------
 arch/s390/include/asm/cmpxchg.h               |  8 ++++----
 arch/s390/kernel/uprobes.c                    |  7 ++-----
 arch/sh/include/asm/cmpxchg.h                 |  4 ++--
 arch/sparc/include/asm/cmpxchg_32.h           |  4 ++--
 arch/sparc/include/asm/cmpxchg_64.h           |  6 +++---
 arch/sparc/kernel/uprobes.c                   |  7 ++-----
 arch/xtensa/include/asm/cmpxchg.h             |  4 ++--
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
 .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |  4 ++--
 .../drm/i915/gt/intel_execlists_submission.c  |  4 ++--
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |  4 ++--
 drivers/gpu/drm/i915/gt/intel_gsc.c           |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            |  4 ++--
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  2 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  6 +++---
 drivers/gpu/drm/i915/gt/intel_migrate.c       |  2 +-
 drivers/gpu/drm/i915/gt/intel_rc6.c           |  2 +-
 drivers/gpu/drm/i915/gt/intel_rps.c           |  2 +-
 drivers/gpu/drm/i915/gt/selftest_context.c    |  2 +-
 .../drm/i915/gt/selftest_ring_submission.c    |  2 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c     |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  2 +-
 drivers/gpu/drm/i915/i915_utils.h             |  1 +
 include/linux/llist.h                         |  6 ++----
 include/linux/non-atomic/xchg.h               | 19 +++++++++++++++++++
 include/linux/qed/qed_chain.h                 | 19 +++++++------------
 io_uring/io_uring.c                           |  7 ++-----
 io_uring/slist.h                              |  6 ++----
 51 files changed, 126 insertions(+), 155 deletions(-)
 create mode 100644 include/linux/non-atomic/xchg.h

-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
