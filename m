Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37ED1C05052
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Aug 2023 00:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PRiWwNdO8mmIwPtAWRLrYj3KUhLUSTUYGE/X8K4qbdI=; b=pcR2cjG1MnBs3Z
	p7sA+JoSEn+QkmxC99noiZ5qEAt1qtwNDLV1DxzmPF3ilYT74JkA8if7Fy+pfzHddHFICN3rdvehM
	9dish+lmdCPYcxXAdxQSOdJXcCMmLykLyFaBR+bcSQBCNbRoGQMcTljxOVPk2ZVTloz5GhoUXEqGW
	tLyoYmNXi2PxNqJm2C+mAv2drwkC1POHJaITcyV2elIXhQMdjwlw3+MqlCBnP+3s/53tzhM9VOQC+
	VVzL+VjDHihDJ/z27VxoVZeA3ELCApODFSyM+YxNseSTAiJR9IkazsiNAsDWKva01oOwKvlkKqbV0
	ULJBbs+0keMB4ou5Cprg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qViEb-000chX-2Z;
	Tue, 15 Aug 2023 00:48:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qViEV-000cay-0b
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Aug 2023 00:48:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A044464A88;
	Tue, 15 Aug 2023 00:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26A6C433CA;
	Tue, 15 Aug 2023 00:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692060506;
	bh=1BADrAn43TtzTGU0kqF+Zvl5nVwUsJU38y9W7psm8MY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eLNu23dD5QSdJObrGEnxdpemvcC+18UMeZE6hXgAPhHQsgLsKHCJpbuYRTXrmFiOV
	 XwNeEPKWd4f4HEWCq8BmFzCLDFiq7h0eql8936uifKcufKQoRj7R3wP0JVBwCE/QPj
	 +JfIgxZz9hNn/d/JRuVUApX33VjifohyA6IoCcpwoNfNKVt4Mth3WBgVRFQ6cpCFlw
	 r+9GpehN5tWaVb+hponcVkSEs9p6BhGrX350OkycjBIlbxbNvd+KaodssBjtGJ3Ffa
	 5oq7iSd1G97VRfO4d2gQ8Y/hIZOhWB6lPdfCPecRf+CIANaA011C5RtKQydctsFS0F
	 +pB5GqP/WaecA==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 19/20] ARCv2: entry: rearrange pt_regs slightly
Date: Mon, 14 Aug 2023 17:48:12 -0700
Message-Id: <20230815004813.555115-20-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815004813.555115-1-vgupta@kernel.org>
References: <20230815004813.555115-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_174827_327476_3650F2B0 
X-CRM114-Status: GOOD (  10.76  )
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

Instead of r26,fp,sp,r12,r30 order as fp,r30,r12,r26,sp

 - keeps SP at well known position (right abive hardware autosave)
 - r26,r12 saved specifically for ARCv2 (and not in ARCv3) kept
   closer for easy ifdef'ry later

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/entry-arcv2.h | 12 ++++++------
 arch/arc/include/asm/ptrace.h      |  9 +++++----
 arch/arc/kernel/asm-offsets.c      |  7 ++++---
 3 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/arch/arc/include/asm/entry-arcv2.h b/arch/arc/include/asm/entry-arcv2.h
index a030eae93d35..4d13320e0c1b 100644
--- a/arch/arc/include/asm/entry-arcv2.h
+++ b/arch/arc/include/asm/entry-arcv2.h
@@ -149,10 +149,10 @@
  */
 .macro __SAVE_REGFILE_SOFT
 
-	ST2	gp, fp, PT_r26		; gp (r26), fp (r27)
-
-	st	r12, [sp, PT_r12]
+	st	fp,  [sp, PT_fp]	; r27
 	st	r30, [sp, PT_r30]
+	st	r12, [sp, PT_r12]
+	st	r26, [sp, PT_r26]	; gp
 
 	; Saving pt_regs->sp correctly requires some extra work due to the way
 	; Auto stack switch works
@@ -187,10 +187,10 @@
 /*------------------------------------------------------------------------*/
 .macro __RESTORE_REGFILE_SOFT
 
-	LD2	gp, fp, PT_r26		; gp (r26), fp (r27)
-
-	ld	r12, [sp, PT_r12]
+	ld	fp,  [sp, PT_fp]
 	ld	r30, [sp, PT_r30]
+	ld	r12, [sp, PT_r12]
+	ld	r26, [sp, PT_r26]
 
 	; Restore SP (into AUX_USER_SP) only if returning to U mode
 	;  - for K mode, it will be implicitly restored as stack is unwound
diff --git a/arch/arc/include/asm/ptrace.h b/arch/arc/include/asm/ptrace.h
index 2bf8ea96ea21..3a054b695f28 100644
--- a/arch/arc/include/asm/ptrace.h
+++ b/arch/arc/include/asm/ptrace.h
@@ -77,11 +77,10 @@ struct pt_regs {
 
 	unsigned long bta;	/* erbta */
 
-	unsigned long r26;	/* gp */
 	unsigned long fp;
-	unsigned long sp;	/* user/kernel sp depending on where we came from  */
-
-	unsigned long r12, r30;
+	unsigned long r30;
+	unsigned long r12;
+	unsigned long r26;	/* gp */
 
 #ifdef CONFIG_ARC_HAS_ACCL_REGS
 	unsigned long r58, r59;	/* ACCL/ACCH used by FPU / DSP MPY */
@@ -90,6 +89,8 @@ struct pt_regs {
 	unsigned long DSP_CTRL;
 #endif
 
+	unsigned long sp;	/* user/kernel sp depending on entry  */
+
 	/*------- Below list auto saved by h/w -----------*/
 	unsigned long r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11;
 
diff --git a/arch/arc/kernel/asm-offsets.c b/arch/arc/kernel/asm-offsets.c
index e46688975868..478768c88f46 100644
--- a/arch/arc/kernel/asm-offsets.c
+++ b/arch/arc/kernel/asm-offsets.c
@@ -62,11 +62,9 @@ int main(void)
 	DEFINE(PT_r26, offsetof(struct pt_regs, r26));
 	DEFINE(PT_ret, offsetof(struct pt_regs, ret));
 	DEFINE(PT_blink, offsetof(struct pt_regs, blink));
+	OFFSET(PT_fp, pt_regs, fp);
 	DEFINE(PT_lpe, offsetof(struct pt_regs, lp_end));
 	DEFINE(PT_lpc, offsetof(struct pt_regs, lp_count));
-	DEFINE(SZ_CALLEE_REGS, sizeof(struct callee_regs));
-	DEFINE(SZ_PT_REGS, sizeof(struct pt_regs));
-
 #ifdef CONFIG_ISA_ARCV2
 	OFFSET(PT_r12, pt_regs, r12);
 	OFFSET(PT_r30, pt_regs, r30);
@@ -79,5 +77,8 @@ int main(void)
 	OFFSET(PT_DSP_CTRL, pt_regs, DSP_CTRL);
 #endif
 
+	DEFINE(SZ_CALLEE_REGS, sizeof(struct callee_regs));
+	DEFINE(SZ_PT_REGS, sizeof(struct pt_regs));
+
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
