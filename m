Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA56C10F04
	for <linux-snps-arc@archiver.kernel.org>; Sat,  9 Dec 2023 00:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5BkN7T06zD7D57hU3QNMtKDHw93jVD8kwT/Wt9jK4j8=; b=2jpSvkcpGW9sk7
	4GeeUhTrfEuy3hZoa2IrEIXQjDLgsLeMRKb+QvCXsAQ+YKscm0TIntLRYzDHB7u2ksCYqw5Xz7MKe
	4Wawr6hj4Q2DzOYkeC5wj/nBfayUu/B/IaFwytCAvhs8Vgxeb60OG5s9dzt9ZI1rMoRIMElZ12hIG
	H0UFrSPlDoj9EDOQlsSfSCzhXlCYdlfZnktG0RjFHCHwOIgjhrSN+11EQE22oMilznzMebTcZaJSr
	+5E5OS6jcSHXObeqe6vGVLtoJAqUd4dzWIfVws+HZpdqepGM/dYPcsn/0lcLDjjf9/FCDHz/FVmNI
	kOvXWu7IlyIcjdT5UUkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBlHW-00GpWx-0G;
	Sat, 09 Dec 2023 00:33:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBlHQ-00GpTR-0j
	for linux-snps-arc@lists.infradead.org;
	Sat, 09 Dec 2023 00:33:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7BC9CB82E8E;
	Sat,  9 Dec 2023 00:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EAE1C433CC;
	Sat,  9 Dec 2023 00:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702081993;
	bh=HfN4FCjlth7Vk9IubBls0IpglFtSjvL1qN+UsAj39lQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=anZz7v2hpfNbkyFSUJMCZ9FQGWFTnfWc/NUD1PgvM8wwk1PI/vjkEP3/iyiqn/8Cb
	 3SwUGEYxfCmexYTN+sFB+Nsc5z9vzHiBuDebTKouuDHEskxBM5Yl+A8ssymxrS6ohZ
	 jwT67C+f1hIJ22+AvDneiRdA3hTwVpYWQrUsydZiwWnz3+zUaWqLiS69PF6Anix2el
	 VjxcOKGtGAziY/iI+w0QlDjHKAyRS0XQfpjY01+eHTsmePwnj+u6sXb/aCys1oEWOU
	 dVoigS4NK8WqK14xQjSppIVjm5X+NR1PuM+lpwz5MbXJsadYTHmW3zRLayoe6qle9N
	 J52WRAPLyiNCg==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Pavel.Kozlov@synopsys.com,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 2/5] ARC: entry: move ARCompact specific bits out of entry.h
Date: Fri,  8 Dec 2023 16:33:04 -0800
Message-Id: <20231209003307.480051-3-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231209003307.480051-1-vgupta@kernel.org>
References: <20231209003307.480051-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_163316_554940_4A9FD2E2 
X-CRM114-Status: UNSURE (   8.44  )
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

 - PUSHAUX/POPAUX helpers to ARCompact entry
 - use gas provided "push"/pop pseudo instructions

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/entry-compact.h | 55 ++++++++++++++++++++++-
 arch/arc/include/asm/entry.h         | 66 ----------------------------
 2 files changed, 54 insertions(+), 67 deletions(-)

diff --git a/arch/arc/include/asm/entry-compact.h b/arch/arc/include/asm/entry-compact.h
index 9841f1186417..92c3e9f13252 100644
--- a/arch/arc/include/asm/entry-compact.h
+++ b/arch/arc/include/asm/entry-compact.h
@@ -33,6 +33,59 @@
 #include <asm/irqflags-compact.h>
 #include <asm/thread_info.h>	/* For THREAD_SIZE */
 
+/* Note on the LD/ST addr modes with addr reg wback
+ *
+ * LD.a same as LD.aw
+ *
+ * LD.a    reg1, [reg2, x]  => Pre Incr
+ *      Eff Addr for load = [reg2 + x]
+ *
+ * LD.ab   reg1, [reg2, x]  => Post Incr
+ *      Eff Addr for load = [reg2]
+ */
+
+.macro PUSHAX aux
+	lr	r9, [\aux]
+	push	r9
+.endm
+
+.macro POPAX aux
+	pop	r9
+	sr	r9, [\aux]
+.endm
+
+.macro  SAVE_R0_TO_R12
+	push	r0
+	push	r1
+	push	r2
+	push	r3
+	push	r4
+	push	r5
+	push	r6
+	push	r7
+	push	r8
+	push	r9
+	push	r10
+	push	r11
+	push	r12
+.endm
+
+.macro RESTORE_R12_TO_R0
+	pop	r12
+	pop	r11
+	pop	r10
+	pop	r9
+	pop	r8
+	pop	r7
+	pop	r6
+	pop	r5
+	pop	r4
+	pop	r3
+	pop	r2
+	pop	r1
+	pop	r0
+.endm
+
 .macro SAVE_ABI_CALLEE_REGS
 	push	r13
 	push	r14
@@ -267,7 +320,7 @@
 	SWITCH_TO_KERNEL_STK
 
 
-	PUSH	0x003\LVL\()abcd    /* Dummy ECR */
+	st.a	0x003\LVL\()abcd, [sp, -4]	/* Dummy ECR */
 	sub	sp, sp, 8	    /* skip orig_r0 (not needed)
 				       skip pt_regs->sp, already saved above */
 
diff --git a/arch/arc/include/asm/entry.h b/arch/arc/include/asm/entry.h
index 8e4e40d2d54a..cf1ba376e992 100644
--- a/arch/arc/include/asm/entry.h
+++ b/arch/arc/include/asm/entry.h
@@ -21,72 +21,6 @@
 #include <asm/entry-arcv2.h>
 #endif
 
-/* Note on the LD/ST addr modes with addr reg wback
- *
- * LD.a same as LD.aw
- *
- * LD.a    reg1, [reg2, x]  => Pre Incr
- *      Eff Addr for load = [reg2 + x]
- *
- * LD.ab   reg1, [reg2, x]  => Post Incr
- *      Eff Addr for load = [reg2]
- */
-
-.macro PUSH reg
-	st.a	\reg, [sp, -4]
-.endm
-
-.macro PUSHAX aux
-	lr	r9, [\aux]
-	PUSH	r9
-.endm
-
-.macro POP reg
-	ld.ab	\reg, [sp, 4]
-.endm
-
-.macro POPAX aux
-	POP	r9
-	sr	r9, [\aux]
-.endm
-
-/*--------------------------------------------------------------
- * Helpers to save/restore Scratch Regs:
- * used by Interrupt/Exception Prologue/Epilogue
- *-------------------------------------------------------------*/
-.macro  SAVE_R0_TO_R12
-	PUSH	r0
-	PUSH	r1
-	PUSH	r2
-	PUSH	r3
-	PUSH	r4
-	PUSH	r5
-	PUSH	r6
-	PUSH	r7
-	PUSH	r8
-	PUSH	r9
-	PUSH	r10
-	PUSH	r11
-	PUSH	r12
-.endm
-
-.macro RESTORE_R12_TO_R0
-	POP	r12
-	POP	r11
-	POP	r10
-	POP	r9
-	POP	r8
-	POP	r7
-	POP	r6
-	POP	r5
-	POP	r4
-	POP	r3
-	POP	r2
-	POP	r1
-	POP	r0
-
-.endm
-
 /*
  * save user mode callee regs as struct callee_regs
  *  - needed by fork/do_signal/unaligned-access-emulation.
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
