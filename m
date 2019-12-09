Return-Path: <SRS0=/ZcC=Z7=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9AB7C43603
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Dec 2019 19:02:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BD522068E
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Dec 2019 19:02:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MUIqk0i5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SUBcyZ4W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BD522068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=olIQ5Du3GEchPoGzZli6+ZNI86Tm8H+byNXHObBFfUI=; b=MUIqk0i5AAuyF3
	Wqw4OAoCRbBVy501U1oFuvoxDV/33OPgpmLolGM0pEYuJWcwvwcGdrY2Xc2Y/qISJIMeURKpzc1X0
	ADqNB6lwi47PC6sxV9dltc7e1TUFirjCYA78UcNxCOA+yJenuCk9Z7Z6Kg+gVNERyNMQ2U6LccHzW
	JID4+X4wLPuumirU7EzMyuGMFzNPVzCnPaW8w44qM8r/NflEPNOVWJpIWxEesD1gqKlT8zjD1Tinx
	qfS1a2oVRtdiAbhHvb+FdCBWTqe2bwlBXHsfWTm7EQz8djpz6pDq8yje4vzWsQnT48k9AjwBRCzKV
	UzB18oOr7dMdWAxWG7nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieOIc-0004BJ-MU; Mon, 09 Dec 2019 19:02:26 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieOIa-0004AZ-9v
 for linux-snps-arc@lists.infradead.org; Mon, 09 Dec 2019 19:02:25 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CF76E402FD;
 Mon,  9 Dec 2019 19:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1575918144; bh=NlrOYfimGlNseBF+p6gvS/otswmK4It3xiYgdzzlMaI=;
 h=From:To:Cc:Subject:Date:From;
 b=SUBcyZ4WtGSpI3F6N2PAVgzOQhfLBBzGqxp/4myUlcJF4vvVqemDGto3Mqz+YaHVu
 uJY+eKnQLd8uwKGvaJxpajaFszFuG3OGTeiAi17ym5NcPqG0dmaFtir0vkCC4aV3+/
 y8CVH3f/VcnCUsyC+wEsvi/aMUTkuAHpD2O9Tywn9l07S7QlioP6OgG3eWA+Lao7Ou
 KHeKDDKVpb4BCM4IxgL3UZeh12Aaivqu1NGidmLVJxLaMYDIFFr4k79Qbiur5PxllE
 Bjev80FJLA2a9G7OcXyGHANpGmQ+p8Nq9DTZ2J9fjarbSoWM3o7XkcaKjnwFRKM3is
 D+s44mVJyEpPg==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.24])
 by mailhost.synopsys.com (Postfix) with ESMTP id 7FA70A007B;
 Mon,  9 Dec 2019 19:02:18 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: gcc-patches@gcc.gnu.org
Subject: [PATCH] PR 92846: [ARC] generate signaling FDCMPF for hard float
 comparisons
Date: Mon,  9 Dec 2019 11:02:18 -0800
Message-Id: <20191209190218.20544-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_110224_355680_A9F1270C 
X-CRM114-Status: GOOD (  10.80  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org, andrew.burgess@embecosm.com,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

ARC gcc generates FDCMP instructions which raises Invalid operation for
signaling NaN only. This causes glibc iseqsig() primitives to fail (in
the current ongoing glibc port to ARC)

So split up the hard float compares into two categories and for unordered
compares generate the FDCMPF instruction (vs. FDCMP) which raises exception
for either NaNs.

With this fix testsuite/gcc.dg/torture/pr52451.c passes for ARC.

Also passes 6 additional tests in glibc testsuite (test*iseqsig) and no
regressions

gcc/
xxxx-xx-xx  Vineet Gupta  <vgupta@synopsys.com>

	* config/arc/arc-modes.def (CC_FPUE): New Mode CC_FPUE which
	helps codegen generate exceptions even for quiet NaN.
	* config/arc/arc.c (arc_init_reg_tables): Handle New CC_FPUE mode.
	(get_arc_condition_code): Likewise.
	(arc_select_cc_mode): LT, LE, GT, GE to use the New CC_FPUE mode.
	* config/arc/arc.h (REVERSE_CONDITION): Handle New CC_FPUE mode.
	* config/arc/predicates.md (proper_comparison_operator): Likewise.
	* config/arc/fpu.md (cmpsf_fpu_trap): New Pattern for CC_FPUE.
	(cmpdf_fpu_trap): Likewise.

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 gcc/config/arc/arc-modes.def |  1 +
 gcc/config/arc/arc.c         |  8 ++++++--
 gcc/config/arc/arc.h         |  2 +-
 gcc/config/arc/fpu.md        | 24 ++++++++++++++++++++++++
 gcc/config/arc/predicates.md |  1 +
 5 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/gcc/config/arc/arc-modes.def b/gcc/config/arc/arc-modes.def
index 36a2f4abfb25..d16b6a289a15 100644
--- a/gcc/config/arc/arc-modes.def
+++ b/gcc/config/arc/arc-modes.def
@@ -38,4 +38,5 @@ VECTOR_MODES (INT, 16);       /* V16QI V8HI V4SI V2DI */
 
 /* FPU condition flags.  */
 CC_MODE (CC_FPU);
+CC_MODE (CC_FPUE);
 CC_MODE (CC_FPU_UNEQ);
diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
index 28305f459dcd..cbb95d6e9043 100644
--- a/gcc/config/arc/arc.c
+++ b/gcc/config/arc/arc.c
@@ -1564,6 +1564,7 @@ get_arc_condition_code (rtx comparison)
 	default : gcc_unreachable ();
 	}
     case E_CC_FPUmode:
+    case E_CC_FPUEmode:
       switch (GET_CODE (comparison))
 	{
 	case EQ	       : return ARC_CC_EQ;
@@ -1686,11 +1687,13 @@ arc_select_cc_mode (enum rtx_code op, rtx x, rtx y)
       case UNLE:
       case UNGT:
       case UNGE:
+	return CC_FPUmode;
+
       case LT:
       case LE:
       case GT:
       case GE:
-	return CC_FPUmode;
+	return CC_FPUEmode;
 
       case LTGT:
       case UNEQ:
@@ -1844,7 +1847,7 @@ arc_init_reg_tables (void)
 	  if (i == (int) CCmode || i == (int) CC_ZNmode || i == (int) CC_Zmode
 	      || i == (int) CC_Cmode
 	      || i == CC_FP_GTmode || i == CC_FP_GEmode || i == CC_FP_ORDmode
-	      || i == CC_FPUmode || i == CC_FPU_UNEQmode)
+	      || i == CC_FPUmode || i == CC_FPUEmode || i == CC_FPU_UNEQmode)
 	    arc_mode_class[i] = 1 << (int) C_MODE;
 	  else
 	    arc_mode_class[i] = 0;
@@ -8401,6 +8404,7 @@ arc_reorg (void)
 
 	  /* Avoid FPU instructions.  */
 	  if ((GET_MODE (XEXP (XEXP (pc_target, 0), 0)) == CC_FPUmode)
+	      || (GET_MODE (XEXP (XEXP (pc_target, 0), 0)) == CC_FPUEmode)
 	      || (GET_MODE (XEXP (XEXP (pc_target, 0), 0)) == CC_FPU_UNEQmode))
 	    continue;
 
diff --git a/gcc/config/arc/arc.h b/gcc/config/arc/arc.h
index 4d7ac3281b41..c08ca3d0d432 100644
--- a/gcc/config/arc/arc.h
+++ b/gcc/config/arc/arc.h
@@ -1531,7 +1531,7 @@ enum arc_function_type {
   (((MODE) == CC_FP_GTmode || (MODE) == CC_FP_GEmode		 \
     || (MODE) == CC_FP_UNEQmode || (MODE) == CC_FP_ORDmode	 \
     || (MODE) == CC_FPXmode || (MODE) == CC_FPU_UNEQmode	 \
-    || (MODE) == CC_FPUmode)					 \
+    || (MODE) == CC_FPUmode || (MODE) == CC_FPUEmode)		 \
    ? reverse_condition_maybe_unordered ((CODE))			 \
    : reverse_condition ((CODE)))
 
diff --git a/gcc/config/arc/fpu.md b/gcc/config/arc/fpu.md
index 6289e9c3f593..6729795de542 100644
--- a/gcc/config/arc/fpu.md
+++ b/gcc/config/arc/fpu.md
@@ -242,6 +242,18 @@
    (set_attr "type" "fpu")
    (set_attr "predicable" "yes")])
 
+(define_insn "*cmpsf_fpu_trap"
+  [(set (reg:CC_FPUE CC_REG)
+	(compare:CC_FPUE (match_operand:SF 0 "register_operand"  "r,  r,r")
+			(match_operand:SF 1 "nonmemory_operand" "r,CfZ,F")))]
+  "TARGET_FP_SP_BASE"
+  "fscmpf%?\\t%0,%1"
+  [(set_attr "length" "4,4,8")
+   (set_attr "iscompact" "false")
+   (set_attr "cond" "set")
+   (set_attr "type" "fpu")
+   (set_attr "predicable" "yes")])
+
 (define_insn "*cmpsf_fpu_uneq"
   [(set (reg:CC_FPU_UNEQ CC_REG)
 	(compare:CC_FPU_UNEQ
@@ -338,6 +350,18 @@
    (set_attr "type" "fpu")
    (set_attr "predicable" "yes")])
 
+(define_insn "*cmpdf_fpu_trap"
+  [(set (reg:CC_FPUE CC_REG)
+	(compare:CC_FPUE (match_operand:DF 0 "even_register_operand"  "r")
+			(match_operand:DF 1 "even_register_operand"  "r")))]
+  "TARGET_FP_DP_BASE"
+  "fdcmpf%? %0, %1"
+  [(set_attr "length" "4")
+   (set_attr "iscompact" "false")
+   (set_attr "cond" "set")
+   (set_attr "type" "fpu")
+   (set_attr "predicable" "yes")])
+
 (define_insn "*cmpdf_fpu_uneq"
   [(set (reg:CC_FPU_UNEQ CC_REG)
 	(compare:CC_FPU_UNEQ
diff --git a/gcc/config/arc/predicates.md b/gcc/config/arc/predicates.md
index e0013b32f0f5..4d2ad7ba6789 100644
--- a/gcc/config/arc/predicates.md
+++ b/gcc/config/arc/predicates.md
@@ -439,6 +439,7 @@
 	      || code == ORDERED || code == UNORDERED);
 
     case E_CC_FPUmode:
+    case E_CC_FPUEmode:
       return 1;
     case E_CC_FPU_UNEQmode:
       return 1;
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
