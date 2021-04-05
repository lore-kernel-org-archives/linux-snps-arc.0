Return-Path: <SRS0=9+m5=JC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F2AC433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Apr 2021 14:32:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62CC661284
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Apr 2021 14:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62CC661284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4zPCyeYFm718RDXIHHil6ySCKYvdUuYb2xSRPRAhi7g=; b=pu8pWesHYC5hPGoRWg8jbJi66
	SqVRip0nM5Mkdj8Me1vux8GcEnvLwt1WoeX9BkOg9V2Zpow8smBCcqL+2+gfymYVS2V5gmbJOSGMF
	XXTwdAPeB3wjNn7C6BYzqkKBzQDvteI6ey+4BMMGcEmbe5M0La2obm8KuYCA4fL2PlN6JRY9s2OV5
	dmXrdjrD8VcTKo9gPQa+eR27sVO+BR5vAxiBsKGLNRuoxdxgMjwoNvK3I47kJuH1OR2RxWEru1dvf
	moGWDdw5i6vdoTpOpa5AYDiRN5uDkeifeSFQtl1wq/6VzVfG6ydpQC1wvEY/KdXGFOJmCIHclHR17
	2FR36BCZA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTQHT-00HPiC-Un; Mon, 05 Apr 2021 14:32:43 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTQHK-00HPe4-TG
 for linux-snps-arc@lists.infradead.org; Mon, 05 Apr 2021 14:32:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id
 y20-20020a1c4b140000b029011f294095d3so592338wma.3
 for <linux-snps-arc@lists.infradead.org>; Mon, 05 Apr 2021 07:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WpMshF9WUsdtJUGU8Fhgh+vZmUfhSBfrnYZEgnqW7JI=;
 b=EdhxKA1Wj6QWKGJeY4DsStDw21VO1nBbX+MdXrg1iqcvW7nEs3djHL5UngqgGikjaE
 hy9veL/tdrVez9Ntx6ef+fS96ueY6AJp0ZJzOeEM7nt4DUhPRk/5f1KaBgOlWznoSAre
 hZ6on1zgwr/QpTq0t+N+57C28bAWRLOuhI+m2FOCDIY6VdJaY0/MdREM0VlevSDsIQMu
 oP0qcydOmP0pbky4nG1DE8zDwlAjCbgp3Lm611iMwfIw+emkHuwsKZZYf3k1GEOWvVlE
 m9JvTzWVPjAN5wrcZQKjU8FY0zltsvdH4Z9AAGdQGiZ8wsRBm+kZM9RSR6GQBtrwyoUM
 wVHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WpMshF9WUsdtJUGU8Fhgh+vZmUfhSBfrnYZEgnqW7JI=;
 b=QzpPQnzncaj65XsYu6SkCJ/gXrnl7xyC6e6FCOjjNDq2KoUCbqgbcrsjyqQV4H4sBd
 8+v0HyOvB2c7aPyCWXEMh7hDCg2iDDue6hpUj9txFNGYdnoa7jsa4lFm74xAPOQnOan0
 WBBtRhdxx9WN3S6Rg0sZk4NdSPUtXCSNCnE7ZtGvGLhRf0YMDWne5f/ABVaWbK81k2T+
 6Ht2+0SN2JZbXYutBOxo6ljSqzTeNL1L1oxWgZoQbW6phOljCa0fdqgNQG6TKP2XFlTN
 tdrgAo918RaLI088YpYS8dd6pd8sL6QmwA+SzhdavYvyWwDIr1GwpSmLoE7zLOSIwOvu
 AKrA==
X-Gm-Message-State: AOAM533VMsI9ptsWwTIiEv7dLCMgxhfIfVkxe4DPaxoR3H4u0v8bdAmc
 DynQUKbg/kB3PQXwafAq9tM=
X-Google-Smtp-Source: ABdhPJzA+Mk3Z0Rt2/rdSs+Fz9/m9gSqLvvU/Yu0/IaGPs85UCVNLSSgCWwUsoKMMQthsHSRWpJlTg==
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr25229205wmk.53.1617633154541; 
 Mon, 05 Apr 2021 07:32:34 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:34 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Cc: linux-snps-arc@lists.infradead.org, claziss@synopsys.com,
 shahab@synopsys.com, cmiranda@synopsys.com
Subject: [PATCH 23/27] arcv3: BCR and AUX register changes
Date: Mon,  5 Apr 2021 15:31:34 +0100
Message-Id: <20210405143138.17016-24-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_153235_027315_18F78C41 
X-CRM114-Status: UNSURE (   9.13  )
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

From: Cupertino Miranda <cmiranda@synopsys.com>

---
 target/arc/regs-detail.def | 40 ++++++++++++++++++++++++++++++++++++++
 target/arc/regs-impl.c     |  5 +++++
 target/arc/regs.def        | 20 +++++++++++++++++++
 3 files changed, 65 insertions(+)

diff --git a/target/arc/regs-detail.def b/target/arc/regs-detail.def
index 6f0cc94809..48b26d6cb0 100644
--- a/target/arc/regs-detail.def
+++ b/target/arc/regs-detail.def
@@ -39,8 +39,10 @@ DEF(0xa,   ARC_OPCODE_ARCALL,  NONE, status32)
 DEF(0xb,   ARC_OPCODE_ARCV2,   NONE, status32_p0)
 DEF(0xc,   ARC_OPCODE_ARCv2EM, NONE, sec_extra)
 DEF(0xd,   ARC_OPCODE_ARCV2,   NONE, aux_user_sp)
+DEF(0xd,   ARC_OPCODE_V3_ALL,  NONE, aux_user_sp)
 DEF(0xe,   ARC_OPCODE_ARC700,  NONE, clk_enable)
 DEF(0xe,   ARC_OPCODE_ARCV2,   NONE, aux_irq_ctrl)
+DEF(0xe,   ARC_OPCODE_V3_ALL,  NONE, aux_irq_ctrl)
 DEF(0xf,   ARC_OPCODE_ARC700,  NONE, bpu_flush)
 DEF(0xf,   ARC_OPCODE_ARCv2HS, NONE, debugi)
 DEF(0x10,  ARC_OPCODE_ARCV1,   NONE, ivic)
@@ -75,6 +77,7 @@ DEF(0x23,  ARC_OPCODE_ARCALL,  NONE, limit0)
 DEF(0x24,  ARC_OPCODE_ARCV1,   NONE, pcport)
 DEF(0x25,  ARC_OPCODE_ARC700,  NONE, int_vector_base)
 DEF(0x25,  ARC_OPCODE_ARCV2,   NONE, int_vector_base)
+DEF(0x25,  ARC_OPCODE_V3_ALL,  NONE, int_vector_base)
 DEF(0x26,  ARC_OPCODE_ARC600,  NONE, aux_vbfdw_mode)
 DEF(0x27,  ARC_OPCODE_ARC600,  NONE, aux_vbfdw_bm0)
 DEF(0x28,  ARC_OPCODE_ARC600,  NONE, aux_vbfdw_bm1)
@@ -116,6 +119,7 @@ DEF(0x41,  ARC_OPCODE_ARCV1,   NONE, aux_macmode)
 DEF(0x42,  ARC_OPCODE_ARC600,  NONE, lsp_newval)
 DEF(0x43,  ARC_OPCODE_ARCV1,   NONE, aux_irq_lv12)
 DEF(0x43,  ARC_OPCODE_ARCV2,   NONE, aux_irq_act)
+DEF(0x43,  ARC_OPCODE_V3_ALL,  NONE, aux_irq_act)
 DEF(0x44,  ARC_OPCODE_ARCV1,   NONE, aux_xmac0)
 DEF(0x45,  ARC_OPCODE_ARCV1,   NONE, aux_xmac1)
 DEF(0x46,  ARC_OPCODE_ARCV1,   NONE, aux_xmac2)
@@ -126,7 +130,9 @@ DEF(0x4a,  ARC_OPCODE_ARCALL,  NONE, dc_ivdl)
 DEF(0x4b,  ARC_OPCODE_ARCALL,  NONE, dc_flsh)
 DEF(0x4c,  ARC_OPCODE_ARCALL,  NONE, dc_fldl)
 DEF(0x4d,  ARC_OPCODE_ARCV2,   NONE, dc_startr)
+DEF(0x4d,  ARC_OPCODE_V3_ALL,  NONE, dc_startr)
 DEF(0x4e,  ARC_OPCODE_ARCV2,   NONE, dc_endr)
+DEF(0x4e,  ARC_OPCODE_V3_ALL,  NONE, dc_endr)
 DEF(0x50,  ARC_OPCODE_NONE,    NONE, hexdata)
 DEF(0x51,  ARC_OPCODE_NONE,    NONE, hexctrl)
 DEF(0x52,  ARC_OPCODE_NONE,    NONE, led)
@@ -191,13 +197,17 @@ DEF(0x100, ARC_OPCODE_ARCALL,  NONE, count1)
 DEF(0x101, ARC_OPCODE_ARCALL,  NONE, control1)
 DEF(0x102, ARC_OPCODE_ARCALL,  NONE, limit1)
 DEF(0x103, ARC_OPCODE_ARCV2,   NONE, aux_rtc_ctrl)
+DEF(0x103, ARC_OPCODE_V3_ALL,  NONE, aux_rtc_ctrl)
 DEF(0x104, ARC_OPCODE_ARCV2,   NONE, aux_rtc_low)
+DEF(0x104, ARC_OPCODE_V3_ALL,  NONE, aux_rtc_low)
 DEF(0x105, ARC_OPCODE_ARCV2,   NONE, aux_rtc_high)
+DEF(0x105, ARC_OPCODE_V3_ALL,  NONE, aux_rtc_high)
 DEF(0x200, ARC_OPCODE_ARCV1,   NONE, aux_irq_lev)
 DEF(0x200, ARC_OPCODE_ARCV2,   NONE, irq_priority_pending)
 DEF(0x201, ARC_OPCODE_ARCALL,  NONE, aux_irq_hint)
 DEF(0x202, ARC_OPCODE_ARC600,  NONE, aux_inter_core_interrupt)
 DEF(0x206, ARC_OPCODE_ARCV2,   NONE, irq_priority)
+DEF(0x206, ARC_OPCODE_V3_ALL,  NONE, irq_priority)
 DEF(0x210, ARC_OPCODE_ARC700,  NONE, aes_aux_0)
 DEF(0x211, ARC_OPCODE_ARC700,  NONE, aes_aux_1)
 DEF(0x212, ARC_OPCODE_ARC700,  NONE, aes_aux_2)
@@ -273,10 +283,15 @@ DEF(0x408, ARC_OPCODE_ARC700,  NONE, tlbcommand)
 DEF(0x409, ARC_OPCODE_ARC700,  NONE, pid)
 DEF(0x409, ARC_OPCODE_ARCALL,  NONE, mpuen)
 DEF(0x40a, ARC_OPCODE_ARCV2,   NONE, icause)
+DEF(0x40a, ARC_OPCODE_V3_ALL,  NONE, icause)
 DEF(0x40b, ARC_OPCODE_ARCV2,   NONE, irq_select)
+DEF(0x40b, ARC_OPCODE_V3_ALL,  NONE, irq_select)
 DEF(0x40c, ARC_OPCODE_ARCV2,   NONE, irq_enable)
+DEF(0x40c, ARC_OPCODE_V3_ALL,  NONE, irq_enable)
 DEF(0x40d, ARC_OPCODE_ARCV2,   NONE, irq_trigger)
+DEF(0x40d, ARC_OPCODE_V3_ALL,  NONE, irq_trigger)
 DEF(0x40f, ARC_OPCODE_ARCV2,   NONE, irq_status)
+DEF(0x40f, ARC_OPCODE_V3_ALL,  NONE, irq_status)
 DEF(0x410, ARC_OPCODE_ARCALL,  NONE, xpu)
 DEF(0x412, ARC_OPCODE_ARCALL,  NONE, bta)
 DEF(0x413, ARC_OPCODE_ARC700,  NONE, bta_l1)
@@ -497,12 +512,17 @@ DEF(0xff, ARC_OPCODE_DEFAULT,  NONE, unimp_bcr)
 /* Actual BCR implementations */
 
 DEF(0x6d, ARC_OPCODE_ARCv2HS, NONE, mpu_build)
+DEF(0x6d, ARC_OPCODE_V3_ALL,  NONE, mpu_build)
 DEF(0x6f, ARC_OPCODE_ARCv2HS, NONE, mmu_build)
 DEF(0x75, ARC_OPCODE_ARCALL, NONE, timer_build)
 DEF(0xf3, ARC_OPCODE_ARCV2,  NONE, irq_build)
+DEF(0xf3, ARC_OPCODE_V3_ALL, NONE, irq_build)
 DEF(0x72, ARC_OPCODE_ARCV2,  NONE, d_cache_build)
+DEF(0x72, ARC_OPCODE_V3_ALL, NONE, d_cache_build)
 DEF(0x77, ARC_OPCODE_ARCV2,  NONE, i_cache_build)
+DEF(0x77, ARC_OPCODE_V3_ALL, NONE, i_cache_build)
 DEF(0x7b, ARC_OPCODE_ARCV2,  NONE, mpy_build)
+DEF(0x7b, ARC_OPCODE_V3_ALL, NONE, mpy_build)
 
 /* OLD BCR definitions */
 /*
@@ -538,3 +558,23 @@ DEF (0xfc,  ARC_OPCODE_ARCALL,  NONE, vlc_build)
 DEF (0xfd,  ARC_OPCODE_ARCALL,  NONE, simd_dma_build)
 DEF (0xfe,  ARC_OPCODE_ARCALL,  NONE, ifetch_queue_build)
 */
+
+/* ARCV3 definitions. */
+
+DEF (0x7,   ARC_OPCODE_V3_ALL,   NONE, memseg)
+DEF (0x16,  ARC_OPCODE_V3_ALL,   NONE, ic_ivir)
+DEF (0x17,  ARC_OPCODE_V3_ALL,   NONE, ic_endr)
+DEF (0x460, ARC_OPCODE_V3_ALL,   NONE, mmu_rtp0)
+DEF (0x461, ARC_OPCODE_V3_ALL,   NONE, mmu_rtp0hi)
+DEF (0x462, ARC_OPCODE_V3_ALL,   NONE, mmu_rtp1)
+DEF (0x463, ARC_OPCODE_V3_ALL,   NONE, mmu_rtp1hi)
+DEF (0x464, ARC_OPCODE_V3_ALL,   NONE, tlbindex)
+DEF (0x465, ARC_OPCODE_V3_ALL,   NONE, mmuv6_tlbcommand)
+DEF (0x466, ARC_OPCODE_V3_ALL,   NONE, mmu_tlb_data0)
+DEF (0x467, ARC_OPCODE_V3_ALL,   NONE, mmu_tlb_data1)
+DEF (0x468, ARC_OPCODE_V3_ALL,   NONE, mmu_ctrl)
+DEF (0x469, ARC_OPCODE_V3_ALL,   NONE, mmu_ttbcr)
+DEF (0x46a, ARC_OPCODE_V3_ALL,   NONE, mmu_mem_attr)
+DEF (0x46b, ARC_OPCODE_V3_ALL,   NONE, mmu_fault_status)
+DEF (0xc1,  ARC_OPCODE_V3_ALL,   NONE, isa_config)
+DEF (0x6f,  ARC_OPCODE_V3_ALL,   NONE, mmuv6_build)
diff --git a/target/arc/regs-impl.c b/target/arc/regs-impl.c
index 18a307fdc4..d7ae57e8cf 100644
--- a/target/arc/regs-impl.c
+++ b/target/arc/regs-impl.c
@@ -46,6 +46,11 @@ static target_ulong get_identity(CPUARCState *env)
         arcver = 0x54;
         break;
 
+    /* TODO: Add V3/ARC32. */
+    case ARC_OPCODE_V3_ARC64:
+        arcver = 0x70;
+        break;
+
     default:
         arcver = 0;
 
diff --git a/target/arc/regs.def b/target/arc/regs.def
index 5dc3764266..9c0e81d884 100644
--- a/target/arc/regs.def
+++ b/target/arc/regs.def
@@ -410,3 +410,23 @@ AUX_REG (xylsbasey, NULL, NULL)
 AUX_REG (aux_rtc_ctrl, aux_timer_get, aux_timer_set)
 AUX_REG (aux_rtc_low, aux_timer_get, aux_timer_set)
 AUX_REG (aux_rtc_high, aux_timer_get, aux_timer_set)
+
+/* ARCV3 specific registers. */
+
+AUX_REG_GETTER(arc_mmuv6_aux_get)
+AUX_REG_SETTER(arc_mmuv6_aux_set)
+
+AUX_REG (mmuv6_build, arc_mmuv6_aux_get, NULL)
+AUX_REG (mmuv6_tlbcommand,  arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+
+AUX_REG (mmu_ctrl, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+AUX_REG (mmu_, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+AUX_REG (mmu_rtp0, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+AUX_REG (mmu_rtp0hi, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+AUX_REG (mmu_rtp1, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+AUX_REG (mmu_rtp1hi, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+AUX_REG (mmu_ttbcr, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+AUX_REG (mmu_tlb_data0, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+AUX_REG (mmu_tlb_data1, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+AUX_REG (mmu_fault_status, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
+AUX_REG (mmu_mem_attr, arc_mmuv6_aux_get, arc_mmuv6_aux_set)
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
