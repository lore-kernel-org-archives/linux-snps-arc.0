Return-Path: <SRS0=eli2=EF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F807C4363A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 03:43:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEF9320EDD
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 03:43:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sF4emRo+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BHCZ7qEx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEF9320EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X0YmWmZLliPLBRU3XAxfriNN5pU58bcLnYBYQQFJolA=; b=sF4emRo+in23i6u+z9yBzbkIoo
	F5XcHp5OTEu6H6xKWo0u4UAiPjT2taHBwxyJ5/FZmlKDfkHBDn3AxeClpZE7IY/bIhD/dT7lzU7dU
	Jx4rf3L/VD0/fhCGqfyfhmcgIzJfjziOfluMgjNKEHFo9pT8cNJpbFrBkTfDf0Wdj/UEr6MJ9kWcS
	FCLqE6K0bDUSnkM29hiNTTZOuVf4HirzHs4kXY56yHsepbyuz7DJ34KyaL3hsgchj3xWBjbkc1rSi
	lOCG/QpxLsJwq9EvA8NGZn9y6/DwSGCD5ZmB1AsXHHwMMlDi08s4lDya8GuM/lTsl19UZnLzlIxwE
	4khQiQrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYLJi-0006Gs-D7; Fri, 30 Oct 2020 03:43:06 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYLJf-0006G6-Dy
 for linux-snps-arc@lists.infradead.org; Fri, 30 Oct 2020 03:43:04 +0000
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com
 [10.205.2.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6C7FFC00BE;
 Fri, 30 Oct 2020 03:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1604029380; bh=kjSG/8bFRPHkB2CFhnWfjh3ZEfK5o+yA97DGB8dFr8Q=;
 h=From:To:Cc:Subject:Date:From;
 b=BHCZ7qExbozK0aztY3F+sO2bo5sMXt3MQCMvIei+aHMEQmme6f7GoSn5F6N16QbGa
 RNLb4mppRiQ47BkQy46JjM/ycrcLEYjAKERrG7ceL1u8pLcORqsiaqA1tHVqV4x2DR
 yycR2UpJGAcQiQJsvbmtiDy2if7YTifraxJ9emc5QkcoAnQuC9WByhzZjMl4czCIEe
 Xc/fIKrAM79L5Z17Up4+2japJZOJuPXu+EPvlDmx3Njlj9JrVj0m1Qh7aRm9Ne6nHy
 ImAZEcP1QTpb7nagOp2YdYB9guHmyCn+GM5GdLRTDXlh5aHEsXU0BWg217aInhbh91
 icafQBl+WmbRA==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 21938A0072;
 Fri, 30 Oct 2020 03:42:56 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Subject: [PATCH] ARC: [plat-hsdk] Remap CCMs super early in asm boot trampoline
Date: Thu, 29 Oct 2020 20:42:54 -0700
Message-Id: <20201030034254.4166696-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_234303_708673_4CBB8B2F 
X-CRM114-Status: GOOD (  17.40  )
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
Cc: linux-mm@kvack.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

ARC HSDK platform stopped booting on released v5.10-rc1, getting stuck
in startup of non master SMP cores.

This was bisected to upstream commit 7fef431be9c9ac25
"(mm/page_alloc: place pages to tail in __free_pages_core())"
That commit itself is harmless, it just exposed a subtle assumption in
our platform code (hence CC'ing linux-mm just as FYI in case some other
arches / platforms trip on it).

The upstream commit is semantically disruptive as it reverses the order
of page allocations (actually it can be good test for hardware
verification to exercise different memory patterns altogether).
For ARC HSDK platform that meant a remapped memory region (pertaining to
unused Closely Coupled Memory) started getting used early for dynamice
allocations, while not effectively remapped on all the cores, triggering
memory error exception on those cores.

The fix is to move the CCM remapping from early platform code to to early core
boot code. And while it is undesirable to riddle common boot code with
platform quirks, there is no other way to do this since the faltering code
involves setting up stack itself so even function calls are not allowed at
that point.

If anyone is interested, all the gory details can be found at Link below.

Link: https://github.com/foss-for-synopsys-dwc-arc-processors/linux/issues/32
Cc: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/kernel/head.S        | 17 ++++++++++++++++-
 arch/arc/plat-hsdk/platform.c | 17 -----------------
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/arch/arc/kernel/head.S b/arch/arc/kernel/head.S
index 17fd1ed700cc..9152782444b5 100644
--- a/arch/arc/kernel/head.S
+++ b/arch/arc/kernel/head.S
@@ -67,7 +67,22 @@
 	sr	r5, [ARC_REG_LPB_CTRL]
 1:
 #endif /* CONFIG_ARC_LPB_DISABLE */
-#endif
+
+	/* On HSDK, CCMs need to remapped super early */
+#ifdef CONFIG_ARC_SOC_HSDK
+	mov	r6, 0x60000000
+	lr	r5, [ARC_REG_ICCM_BUILD]
+	breq	r5, 0, 1f
+	sr	r6, [ARC_REG_AUX_ICCM]
+1:
+	lr	r5, [ARC_REG_DCCM_BUILD]
+	breq	r5, 0, 2f
+	sr	r6, [ARC_REG_AUX_DCCM]
+2:
+#endif	/* CONFIG_ARC_SOC_HSDK */
+
+#endif	/* CONFIG_ISA_ARCV2 */
+
 	; Config DSP_CTRL properly, so kernel may use integer multiply,
 	; multiply-accumulate, and divide operations
 	DSP_EARLY_INIT
diff --git a/arch/arc/plat-hsdk/platform.c b/arch/arc/plat-hsdk/platform.c
index 0b63fc095b99..b3ea1fa11f87 100644
--- a/arch/arc/plat-hsdk/platform.c
+++ b/arch/arc/plat-hsdk/platform.c
@@ -17,22 +17,6 @@ int arc_hsdk_axi_dmac_coherent __section(".data") = 0;
 
 #define ARC_CCM_UNUSED_ADDR	0x60000000
 
-static void __init hsdk_init_per_cpu(unsigned int cpu)
-{
-	/*
-	 * By default ICCM is mapped to 0x7z while this area is used for
-	 * kernel virtual mappings, so move it to currently unused area.
-	 */
-	if (cpuinfo_arc700[cpu].iccm.sz)
-		write_aux_reg(ARC_REG_AUX_ICCM, ARC_CCM_UNUSED_ADDR);
-
-	/*
-	 * By default DCCM is mapped to 0x8z while this area is used by kernel,
-	 * so move it to currently unused area.
-	 */
-	if (cpuinfo_arc700[cpu].dccm.sz)
-		write_aux_reg(ARC_REG_AUX_DCCM, ARC_CCM_UNUSED_ADDR);
-}
 
 #define ARC_PERIPHERAL_BASE	0xf0000000
 #define CREG_BASE		(ARC_PERIPHERAL_BASE + 0x1000)
@@ -339,5 +323,4 @@ static const char *hsdk_compat[] __initconst = {
 MACHINE_START(SIMULATION, "hsdk")
 	.dt_compat	= hsdk_compat,
 	.init_early     = hsdk_init_early,
-	.init_per_cpu	= hsdk_init_per_cpu,
 MACHINE_END
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
