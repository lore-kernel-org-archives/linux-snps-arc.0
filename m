Return-Path: <SRS0=K3hJ=EQ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA0DBC5517A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Nov 2020 03:54:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 683AA20829
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Nov 2020 03:54:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bZXSTUvd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQI18Qbo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 683AA20829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=twcnROTe0hiKCTRqD91ueHt3/sfvuBhBBJPzXXI09hw=; b=bZXSTUvdToFCbZJPhPO8TlZEg
	NqgGA8N342QyRQEVK9ScXf8B3GO46StXdq6UAk52ctslh4DsG9q28l4RaGnAXM0oLMaW2fwkHSS5h
	pDgQMG1eStcKysUU2glBX29J43kAuQaeQ9RtaB9EPFcpDV1ndZkTAX+bSTY7LWacGZWL4iN5JXa9b
	7ijC71sANo76lm4qeCkESbrqJS3I62KrvILn/jVgGNjKrBEYXk3g0bvLBe97cYxRyZsj2PLo+REDT
	8aFZEW9PJDRGYgxwpsq+tmjeIpVzyqMxdo1ySkskhgtUp7hkW6i8Pmy9ciuL0gHazXvkrCIgAW5kD
	PpPaPrLjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcKjN-0001dw-H3; Tue, 10 Nov 2020 03:54:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcKjI-0001bj-Qw
 for linux-snps-arc@lists.infradead.org; Tue, 10 Nov 2020 03:54:02 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4475B20E65;
 Tue, 10 Nov 2020 03:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604980440;
 bh=7ztnYkMLU7W1/hYN9RH7Mo/BzV5XRX/k8BGYnIAvE5E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QQI18QboP1syENeLqHdJ2nopNCVVOJMbyL+4ohkezbk/wqubQybEwXjSXfNynfUcD
 tRq0XP5Yzxg82JjKYgIZu0U8wvqsjhDUaW+7K5EpiBmNx26tRlCOjMXcVvb3MwesmV
 wLk+4HYnM0Nv7loi2wg0td+rZ098WN5eFbfoyxH4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 29/55] ARC: [plat-hsdk] Remap CCMs super early in
 asm boot trampoline
Date: Mon,  9 Nov 2020 22:52:52 -0500
Message-Id: <20201110035318.423757-29-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201110035318.423757-1-sashal@kernel.org>
References: <20201110035318.423757-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_225401_094839_429F6130 
X-CRM114-Status: GOOD (  19.18  )
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
Cc: linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-snps-arc@lists.infradead.org, Sasha Levin <sashal@kernel.org>,
 David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Vineet Gupta <vgupta@synopsys.com>

[ Upstream commit 3b57533b460c8dc22a432684b7e8d22571f34d2e ]

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
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/kernel/head.S        | 17 ++++++++++++++++-
 arch/arc/plat-hsdk/platform.c | 17 -----------------
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/arch/arc/kernel/head.S b/arch/arc/kernel/head.S
index 17fd1ed700cca..9152782444b55 100644
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
index 0b961a2a10b8e..22c9e2c9c0283 100644
--- a/arch/arc/plat-hsdk/platform.c
+++ b/arch/arc/plat-hsdk/platform.c
@@ -17,22 +17,6 @@ int arc_hsdk_axi_dmac_coherent __section(.data) = 0;
 
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
2.27.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
