Return-Path: <SRS0=sYE2=EP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA33C2D0A3
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Nov 2020 13:22:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5658C208FE
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Nov 2020 13:22:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RwncLr1Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5658C208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=asem.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z4ljpjTF5qEDUlTOEaNwRqcP/VjQSmElF8EmWgLDG0U=; b=RwncLr1YoF/NYR2glKdNe1liV7
	I4cA8JFeO7rd9H3pBKkY1UsWjLDWqFczEe5nzmgjj+DdAG8amm8jXzNnFhdv4hR74q+YVcTDSZsyt
	K7n/uuoj8jrly7dYHVzgd1Lp0ez6Pht7gkt+xW4PkFv6ukrD/xmljoNW8SyL6TYE0kSaA4dWz/8CP
	FC8IY04QDiJbMJWX2NXiyeN4+RRq7nX5Wgi1WSA7SVCRhKB38KG7mL2Wbv4hnVNO4afrJPtQ4HbaG
	mSwao5o57gUhSxwkaqTDctghpyVkAcNfY6U37ICZUMUwFm89KEMDWoZKwryzoy6xTCX51PBPG2GF0
	py4+kkNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc77h-00014H-20; Mon, 09 Nov 2020 13:22:17 +0000
Received: from smtp.asem.it ([151.1.184.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc77e-0000yh-9H
 for linux-snps-arc@lists.infradead.org; Mon, 09 Nov 2020 13:22:15 +0000
Received: from webmail.asem.it by asem.it (smtp.asem.it)
 (SecurityGateway 6.5.2) with ESMTP id SG000594617.MSG 
 for <linux-snps-arc@lists.infradead.org>; Mon, 09 Nov 2020 14:22:09 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 9 Nov
 2020 14:22:06 +0100
Received: from flavio-x.asem.intra (172.16.17.208) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Mon, 9 Nov 2020 14:22:06 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: Vineet Gupta <vgupta@synopsys.com>
Subject: [PATCH] ARC: mm: fix spelling mistakes
Date: Mon, 9 Nov 2020 14:21:30 +0100
Message-ID: <20201109132130.34555-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A09020B.5FA9427F.0071, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0 (_st=1 _vt=0 _iwf=0)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_082214_507175_01D0A6FB 
X-CRM114-Status: GOOD (  12.33  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Flavio Suligoi <f.suligoi@asem.it>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 arch/arc/mm/tlb.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
index c340acd989a0..9bb3c24f3677 100644
--- a/arch/arc/mm/tlb.c
+++ b/arch/arc/mm/tlb.c
@@ -30,14 +30,14 @@
  *  -Changes related to MMU v2 (Rel 4.8)
  *
  * Vineetg: Aug 29th 2008
- *  -In TLB Flush operations (Metal Fix MMU) there is a explict command to
+ *  -In TLB Flush operations (Metal Fix MMU) there is a explicit command to
  *    flush Micro-TLBS. If TLB Index Reg is invalid prior to TLBIVUTLB cmd,
  *    it fails. Thus need to load it with ANY valid value before invoking
  *    TLBIVUTLB cmd
  *
  * Vineetg: Aug 21th 2008:
  *  -Reduced the duration of IRQ lockouts in TLB Flush routines
- *  -Multiple copies of TLB erase code seperated into a "single" function
+ *  -Multiple copies of TLB erase code separated into a "single" function
  *  -In TLB Flush routines, interrupt disabling moved UP to retrieve ASID
  *       in interrupt-safe region.
  *
@@ -66,7 +66,7 @@
  *
  * Although J-TLB is 2 way set assoc, ARC700 caches J-TLB into uTLBS which has
  * much higher associativity. u-D-TLB is 8 ways, u-I-TLB is 4 ways.
- * Given this, the thrasing problem should never happen because once the 3
+ * Given this, the thrashing problem should never happen because once the 3
  * J-TLB entries are created (even though 3rd will knock out one of the prev
  * two), the u-D-TLB and u-I-TLB will have what is required to accomplish memcpy
  *
@@ -127,7 +127,7 @@ static void utlb_invalidate(void)
 	 * There was however an obscure hardware bug, where uTLB flush would
 	 * fail when a prior probe for J-TLB (both totally unrelated) would
 	 * return lkup err - because the entry didn't exist in MMU.
-	 * The Workround was to set Index reg with some valid value, prior to
+	 * The Workaround was to set Index reg with some valid value, prior to
 	 * flush. This was fixed in MMU v3
 	 */
 	unsigned int idx;
@@ -272,7 +272,7 @@ noinline void local_flush_tlb_all(void)
 }
 
 /*
- * Flush the entrie MM for userland. The fastest way is to move to Next ASID
+ * Flush the entire MM for userland. The fastest way is to move to Next ASID
  */
 noinline void local_flush_tlb_mm(struct mm_struct *mm)
 {
@@ -303,7 +303,7 @@ noinline void local_flush_tlb_mm(struct mm_struct *mm)
  * Difference between this and Kernel Range Flush is
  *  -Here the fastest way (if range is too large) is to move to next ASID
  *      without doing any explicit Shootdown
- *  -In case of kernel Flush, entry has to be shot down explictly
+ *  -In case of kernel Flush, entry has to be shot down explicitly
  */
 void local_flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			   unsigned long end)
@@ -620,7 +620,7 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long vaddr_unaligned,
  * Super Page size is configurable in hardware (4K to 16M), but fixed once
  * RTL builds.
  *
- * The exact THP size a Linx configuration will support is a function of:
+ * The exact THP size a Linux configuration will support is a function of:
  *  - MMU page size (typical 8K, RTL fixed)
  *  - software page walker address split between PGD:PTE:PFN (typical
  *    11:8:13, but can be changed with 1 line)
@@ -698,7 +698,7 @@ void local_flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 
 #endif
 
-/* Read the Cache Build Confuration Registers, Decode them and save into
+/* Read the Cache Build Configuration Registers, Decode them and save into
  * the cpuinfo structure for later use.
  * No Validation is done here, simply read/convert the BCRs
  */
@@ -803,13 +803,13 @@ void arc_mmu_init(void)
 	pr_info("%s", arc_mmu_mumbojumbo(0, str, sizeof(str)));
 
 	/*
-	 * Can't be done in processor.h due to header include depenedencies
+	 * Can't be done in processor.h due to header include dependencies
 	 */
 	BUILD_BUG_ON(!IS_ALIGNED((CONFIG_ARC_KVADDR_SIZE << 20), PMD_SIZE));
 
 	/*
 	 * stack top size sanity check,
-	 * Can't be done in processor.h due to header include depenedencies
+	 * Can't be done in processor.h due to header include dependencies
 	 */
 	BUILD_BUG_ON(!IS_ALIGNED(STACK_TOP, PMD_SIZE));
 
@@ -881,7 +881,7 @@ void arc_mmu_init(void)
  *      the duplicate one.
  * -Knob to be verbose abt it.(TODO: hook them up to debugfs)
  */
-volatile int dup_pd_silent; /* Be slient abt it or complain (default) */
+volatile int dup_pd_silent; /* Be silent abt it or complain (default) */
 
 void do_tlb_overlap_fault(unsigned long cause, unsigned long address,
 			  struct pt_regs *regs)
@@ -948,7 +948,7 @@ void do_tlb_overlap_fault(unsigned long cause, unsigned long address,
 
 /***********************************************************************
  * Diagnostic Routines
- *  -Called from Low Level TLB Hanlders if things don;t look good
+ *  -Called from Low Level TLB Handlers if things don;t look good
  **********************************************************************/
 
 #ifdef CONFIG_ARC_DBG_TLB_PARANOIA
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
