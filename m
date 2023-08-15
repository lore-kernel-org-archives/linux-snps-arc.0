Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40032C05052
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Aug 2023 00:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J9dXt+Ma6aJbROmrPf31vtyNoGBWs0M2VnnfLkPQxFc=; b=gbD+Fe0cG+/Zsu
	MFLU1QMEQ5lR4W65UTgqCOHXgAOcl+NHXBUMy81Syg/aePICLUyxLOVdL48XjTazf1gJOyI2EMl3e
	tASIqGcdUfB9Xp9fiebxmmz1sZnDj5uXWAnBNIaUgpfvhJ+Wy9BSmGjNfPkDolLq871Ib2zAc3LJA
	OehHx7O0FhppPGpALWTB3UygeJ1YdVZ/o+gRpvtVYZ9EX0+LYUjCkFB1R04OClQPv53LnmM4zqBl4
	lPZ4LV/P2KLbkR1HtzqnZURZIQszKI+XzlZ4y+Q7Hq6HUo/JKf4N95mddwAyiHzXBxAmpyL6CZo1N
	U8BDf1VePWLpZ5sj3dDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qViEU-000caS-1o;
	Tue, 15 Aug 2023 00:48:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qViEP-000cUT-1g
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Aug 2023 00:48:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1232464006;
	Tue, 15 Aug 2023 00:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342FFC433C7;
	Tue, 15 Aug 2023 00:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692060500;
	bh=+ggOxNlO23GQYPQs86USV0qxaHwyNkCE70FT4o/Cdb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PKlrCQUi2gLF06LPw1KAAhsC7djngjGIZumeC4G0AwhKlZg203W0347Gn35YnCCQR
	 qXwHdo28JesYiJr5sCG3gbqSJjGDMzzZcnDwlsPdRcg5Dkp55cTz8IQD0oM1OC7sEJ
	 z8wJ6ejLtv3g+wXxA1enTbngLf2nHMPGmpb1tVQO3KvSps1t4da7ID0SkeC154IAyP
	 a/DnOVco/FdawyA8DEjkMUcQ/WIbBi3L176Up7c7BsUiEyZqve5dOaLNzReyRfb6AE
	 eBSwqvotPTwYxjKk9pB3gy4BvuCW3UrrDSUlEtV5ke2ZM2geBlcEENovrkGx9lxAmF
	 mz2RbJTVXcb3w==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 05/20] ARC: boot log: eliminate struct cpuinfo_arc #1: mm
Date: Mon, 14 Aug 2023 17:47:58 -0700
Message-Id: <20230815004813.555115-6-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815004813.555115-1-vgupta@kernel.org>
References: <20230815004813.555115-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_174821_645118_DBD3C8E1 
X-CRM114-Status: GOOD (  22.12  )
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

This is first step in eliminating struct cpuinfo_arc[NR_CPUS]

Back when we had just ARCompact ISA, the idea was to read/bit-fiddle
the BCRs once and and cache decoded information in a global struct ready
to use.

With ARCv2 it was modified to contained abstract / ISA agnostic
information.

However with ARCv3 there 's too much disparity to abstract in common
structures. So drop the entire decode once and store paradigm. Afterall
there's only 2 users of this machinery anyways:  boot printing and
cat /proc/cpuinfo. None is performance critical to warrant locking away
resident memory per cpu.

This patch is first step in that direction
 - decouples struct cpuinfo_arc_mmu from global struct cpuinfo_arc
 - mmu code still has a trimmed down static version of
   struct cpuinfo_arc_mmu to cache information needed in performance
   critical code such as tlb flush routines
 - folds read_decode_mmu_bcr() into arc_mmu_mumbojumbo()
 - setup_processor() directly calls arc_mmu_init() and not via
   arc_cpu_init()

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/arcregs.h | 27 +++++++---
 arch/arc/include/asm/setup.h   |  1 -
 arch/arc/kernel/setup.c        |  4 +-
 arch/arc/mm/tlb.c              | 92 +++++++++++++---------------------
 4 files changed, 57 insertions(+), 67 deletions(-)

diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
index 2162023195c5..af00cbe9b850 100644
--- a/arch/arc/include/asm/arcregs.h
+++ b/arch/arc/include/asm/arcregs.h
@@ -185,6 +185,27 @@ struct bcr_uarch_build_arcv2 {
 #endif
 };
 
+struct bcr_mmu_3 {
+#ifdef CONFIG_CPU_BIG_ENDIAN
+	unsigned int ver:8, ways:4, sets:4, res:3, sasid:1, pg_sz:4,
+		     u_itlb:4, u_dtlb:4;
+#else
+	unsigned int u_dtlb:4, u_itlb:4, pg_sz:4, sasid:1, res:3, sets:4,
+		     ways:4, ver:8;
+#endif
+};
+
+struct bcr_mmu_4 {
+#ifdef CONFIG_CPU_BIG_ENDIAN
+	unsigned int ver:8, sasid:1, sz1:4, sz0:4, res:2, pae:1,
+		     n_ways:2, n_entry:2, n_super:2, u_itlb:3, u_dtlb:3;
+#else
+	/*           DTLB      ITLB      JES        JE         JA      */
+	unsigned int u_dtlb:3, u_itlb:3, n_super:2, n_entry:2, n_ways:2,
+		     pae:1, res:2, sz0:4, sz1:4, sasid:1, ver:8;
+#endif
+};
+
 struct bcr_mpy {
 #ifdef CONFIG_CPU_BIG_ENDIAN
 	unsigned int pad:8, x1616:8, dsp:4, cycles:2, type:2, ver:8;
@@ -307,11 +328,6 @@ struct bcr_generic {
  * Generic structures to hold build configuration used at runtime
  */
 
-struct cpuinfo_arc_mmu {
-	unsigned int ver:4, pg_sz_k:8, s_pg_sz_m:8, pad:10, sasid:1, pae:1;
-	unsigned int sets:12, ways:4, u_dtlb:8, u_itlb:8;
-};
-
 struct cpuinfo_arc_cache {
 	unsigned int sz_k:14, line_len:8, assoc:4, alias:1, vipt:1, pad:4;
 };
@@ -326,7 +342,6 @@ struct cpuinfo_arc_ccm {
 
 struct cpuinfo_arc {
 	struct cpuinfo_arc_cache icache, dcache, slc;
-	struct cpuinfo_arc_mmu mmu;
 	struct cpuinfo_arc_bpu bpu;
 	struct bcr_identity core;
 	struct bcr_isa_arcv2 isa;
diff --git a/arch/arc/include/asm/setup.h b/arch/arc/include/asm/setup.h
index 374138832c5a..76443f198778 100644
--- a/arch/arc/include/asm/setup.h
+++ b/arch/arc/include/asm/setup.h
@@ -36,7 +36,6 @@ long __init arc_get_mem_sz(void);
 
 extern void arc_mmu_init(void);
 extern char *arc_mmu_mumbojumbo(int cpu_id, char *buf, int len);
-extern void read_decode_mmu_bcr(void);
 
 extern void arc_cache_init(void);
 extern char *arc_cache_mumbojumbo(int cpu_id, char *buf, int len);
diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
index 41f07b3e594e..094461540f8a 100644
--- a/arch/arc/kernel/setup.c
+++ b/arch/arc/kernel/setup.c
@@ -186,7 +186,6 @@ static void read_arc_build_cfg_regs(void)
 	/* Read CCM BCRs for boot reporting even if not enabled in Kconfig */
 	read_decode_ccm_bcr(cpu);
 
-	read_decode_mmu_bcr();
 	read_decode_cache_bcr();
 
 	if (is_isa_arcompact()) {
@@ -256,7 +255,7 @@ static void read_arc_build_cfg_regs(void)
 		cpu->isa.be = IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
 
 		 /* there's no direct way to distinguish 750 vs. 770 */
-		if (unlikely(cpu->core.family < 0x34 || cpu->mmu.ver < 3))
+		if (unlikely(cpu->core.family < 0x34))
 			cpu->name = "ARC750";
 	} else {
 		cpu->isa = isa;
@@ -463,6 +462,7 @@ void setup_processor(void)
 	arc_init_IRQ();
 
 	pr_info("%s", arc_cpu_mumbojumbo(cpu_id, str, sizeof(str)));
+	pr_info("%s", arc_mmu_mumbojumbo(cpu_id, str, sizeof(str)));
 
 	arc_mmu_init();
 	arc_cache_init();
diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
index 2a3105a682c3..17e32c707367 100644
--- a/arch/arc/mm/tlb.c
+++ b/arch/arc/mm/tlb.c
@@ -18,7 +18,9 @@
 /* A copy of the ASID from the PID reg is kept in asid_cache */
 DEFINE_PER_CPU(unsigned int, asid_cache) = MM_CTXT_FIRST_CYCLE;
 
-static int __read_mostly pae_exists;
+static struct cpuinfo_arc_mmu {
+	unsigned int ver, pg_sz_k, s_pg_sz_m, pae, sets, ways;
+} mmuinfo;
 
 /*
  * Utility Routine to erase a J-TLB entry
@@ -131,7 +133,7 @@ static void tlb_entry_insert(unsigned int pd0, phys_addr_t pd1)
 
 noinline void local_flush_tlb_all(void)
 {
-	struct cpuinfo_arc_mmu *mmu = &cpuinfo_arc700[smp_processor_id()].mmu;
+	struct cpuinfo_arc_mmu *mmu = &mmuinfo;
 	unsigned long flags;
 	unsigned int entry;
 	int num_tlb = mmu->sets * mmu->ways;
@@ -560,89 +562,63 @@ void local_flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
  * the cpuinfo structure for later use.
  * No Validation is done here, simply read/convert the BCRs
  */
-void read_decode_mmu_bcr(void)
+char *arc_mmu_mumbojumbo(int c, char *buf, int len)
 {
-	struct cpuinfo_arc_mmu *mmu = &cpuinfo_arc700[smp_processor_id()].mmu;
-	unsigned int tmp;
-	struct bcr_mmu_3 {
-#ifdef CONFIG_CPU_BIG_ENDIAN
-	unsigned int ver:8, ways:4, sets:4, res:3, sasid:1, pg_sz:4,
-		     u_itlb:4, u_dtlb:4;
-#else
-	unsigned int u_dtlb:4, u_itlb:4, pg_sz:4, sasid:1, res:3, sets:4,
-		     ways:4, ver:8;
-#endif
-	} *mmu3;
-
-	struct bcr_mmu_4 {
-#ifdef CONFIG_CPU_BIG_ENDIAN
-	unsigned int ver:8, sasid:1, sz1:4, sz0:4, res:2, pae:1,
-		     n_ways:2, n_entry:2, n_super:2, u_itlb:3, u_dtlb:3;
-#else
-	/*           DTLB      ITLB      JES        JE         JA      */
-	unsigned int u_dtlb:3, u_itlb:3, n_super:2, n_entry:2, n_ways:2,
-		     pae:1, res:2, sz0:4, sz1:4, sasid:1, ver:8;
-#endif
-	} *mmu4;
+	struct cpuinfo_arc_mmu *mmu = &mmuinfo;
+	unsigned int bcr, u_dtlb, u_itlb, sasid;
+	struct bcr_mmu_3 *mmu3;
+	struct bcr_mmu_4 *mmu4;
+	char super_pg[64] = "";
+	int n = 0;
 
-	tmp = read_aux_reg(ARC_REG_MMU_BCR);
-	mmu->ver = (tmp >> 24);
+	bcr = read_aux_reg(ARC_REG_MMU_BCR);
+	mmu->ver = (bcr >> 24);
 
 	if (is_isa_arcompact() && mmu->ver == 3) {
-		mmu3 = (struct bcr_mmu_3 *)&tmp;
+		mmu3 = (struct bcr_mmu_3 *)&bcr;
 		mmu->pg_sz_k = 1 << (mmu3->pg_sz - 1);
 		mmu->sets = 1 << mmu3->sets;
 		mmu->ways = 1 << mmu3->ways;
-		mmu->u_dtlb = mmu3->u_dtlb;
-		mmu->u_itlb = mmu3->u_itlb;
-		mmu->sasid = mmu3->sasid;
+		u_dtlb = mmu3->u_dtlb;
+		u_itlb = mmu3->u_itlb;
+		sasid = mmu3->sasid;
 	} else {
-		mmu4 = (struct bcr_mmu_4 *)&tmp;
+		mmu4 = (struct bcr_mmu_4 *)&bcr;
 		mmu->pg_sz_k = 1 << (mmu4->sz0 - 1);
 		mmu->s_pg_sz_m = 1 << (mmu4->sz1 - 11);
 		mmu->sets = 64 << mmu4->n_entry;
 		mmu->ways = mmu4->n_ways * 2;
-		mmu->u_dtlb = mmu4->u_dtlb * 4;
-		mmu->u_itlb = mmu4->u_itlb * 4;
-		mmu->sasid = mmu4->sasid;
-		pae_exists = mmu->pae = mmu4->pae;
+		u_dtlb = mmu4->u_dtlb * 4;
+		u_itlb = mmu4->u_itlb * 4;
+		sasid = mmu4->sasid;
+		mmu->pae = mmu4->pae;
 	}
-}
 
-char *arc_mmu_mumbojumbo(int cpu_id, char *buf, int len)
-{
-	int n = 0;
-	struct cpuinfo_arc_mmu *p_mmu = &cpuinfo_arc700[cpu_id].mmu;
-	char super_pg[64] = "";
-
-	if (p_mmu->s_pg_sz_m)
-		scnprintf(super_pg, 64, "%dM Super Page %s",
-			  p_mmu->s_pg_sz_m,
-			  IS_USED_CFG(CONFIG_TRANSPARENT_HUGEPAGE));
+	if (mmu->s_pg_sz_m)
+		scnprintf(super_pg, 64, "/%dM%s",
+			  mmu->s_pg_sz_m,
+			  IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) ? " (THP enabled)":"");
 
 	n += scnprintf(buf + n, len - n,
-		      "MMU [v%x]\t: %dk PAGE, %s, swalk %d lvl, JTLB %d (%dx%d), uDTLB %d, uITLB %d%s%s\n",
-		       p_mmu->ver, p_mmu->pg_sz_k, super_pg,  CONFIG_PGTABLE_LEVELS,
-		       p_mmu->sets * p_mmu->ways, p_mmu->sets, p_mmu->ways,
-		       p_mmu->u_dtlb, p_mmu->u_itlb,
-		       IS_AVAIL2(p_mmu->pae, ", PAE40 ", CONFIG_ARC_HAS_PAE40));
+		      "MMU [v%x]\t: %dk%s, swalk %d lvl, JTLB %dx%d, uDTLB %d, uITLB %d%s%s\n",
+		       mmu->ver, mmu->pg_sz_k, super_pg, CONFIG_PGTABLE_LEVELS,
+		       mmu->sets, mmu->ways,
+		       u_dtlb, u_itlb,
+		       IS_AVAIL2(mmu->pae, ", PAE40 ", CONFIG_ARC_HAS_PAE40));
 
 	return buf;
 }
 
 int pae40_exist_but_not_enab(void)
 {
-	return pae_exists && !is_pae40_enabled();
+	return mmuinfo.pae && !is_pae40_enabled();
 }
 
 void arc_mmu_init(void)
 {
-	struct cpuinfo_arc_mmu *mmu = &cpuinfo_arc700[smp_processor_id()].mmu;
-	char str[256];
+	struct cpuinfo_arc_mmu *mmu = &mmuinfo;
 	int compat = 0;
 
-	pr_info("%s", arc_mmu_mumbojumbo(0, str, sizeof(str)));
-
 	/*
 	 * Can't be done in processor.h due to header include dependencies
 	 */
@@ -719,7 +695,7 @@ volatile int dup_pd_silent; /* Be silent abt it or complain (default) */
 void do_tlb_overlap_fault(unsigned long cause, unsigned long address,
 			  struct pt_regs *regs)
 {
-	struct cpuinfo_arc_mmu *mmu = &cpuinfo_arc700[smp_processor_id()].mmu;
+	struct cpuinfo_arc_mmu *mmu = &mmuinfo;
 	unsigned long flags;
 	int set, n_ways = mmu->ways;
 
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
