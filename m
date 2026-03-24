Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E4CE9A77B
	for <linux-snps-arc@archiver.kernel.org>; Tue, 24 Mar 2026 12:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HodJeqdyNEMVs5KRItAVX8A026286VBtLjdcK7qYFe0=; b=OKXJ8uojiQCvbI
	rU3xAc4h4DWn+97WEdi0fscw60/4MNAvm46/LZ1LHelHR6ZnfrULBoOz/amTlFWFzHRaTGcDbAAj+
	SmB41iQgLsLZecYWwWjD7CQkUcrsjsTemZnsjDN9fZZVsAAWFIQDO0wnb1+t+gS25CeHm1XSWYwrA
	CwViLPYpj5mQDOQU2IEn3KZBCYHsjgLBsBKaFb6dOzetvJun/PndBuMaZnjFtxeiXlC2ugL6iB0Sw
	r3z/GoFCnWGqshZSjoqf9kKLuNCVO+0cs9zHvnFAh/wFqhHMcBr7HBdNfQyac/6f3yeTRh//f0dBi
	QdVBczOwomxjbFO4iHVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50rA-00000001NMG-0xeu;
	Tue, 24 Mar 2026 12:27:36 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50r7-00000001NLv-31xn
	for linux-snps-arc@lists.infradead.org;
	Tue, 24 Mar 2026 12:27:34 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-82a3d3235c9so1111493b3a.2
        for <linux-snps-arc@lists.infradead.org>; Tue, 24 Mar 2026 05:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774355252; x=1774960052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RwSnjFcjq1oUFhDGo0eVz8ywdnnal2i+ieo63wHrZYg=;
        b=kCoSlAsyOuOc79pWvv1c9Xx6JS00s0BFihWX33ZmmHbH1kVCivO5Z8kNyjMCJ5tL3I
         h5waKA9FHab25pxoPfen/yL5ki67HYnUMTD6F4oFAaKlLgipMpTnoeX2HB9oVBOpTdNQ
         z4hHCkaVOhrv3SbcOBb6IW/Dl7FMWfUwHY//yrxXyvZWX0E58bEFWZSoWExHTcXSlPP0
         /de0Bm02w20Ew3wo5w5VCDFGCoeVZmMA+BoCq6sBAHWlo5zU2aEH8cb73Dk8LEY/eeRW
         KBGAVG3uT/qDiw0SZX4DS6nsQ2TQM+b7OuKAcx8hDZ8LWviUoFWILXiTp9Tm7gyNTjbf
         WXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774355252; x=1774960052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwSnjFcjq1oUFhDGo0eVz8ywdnnal2i+ieo63wHrZYg=;
        b=FW9Ruf0ncC0guBY7S1APZ7OSPr2yqqC3SiS1EBAivJWy/M42en0m1ZALhwKkqqYjhs
         0Gi8J6n5fudkscacVldVxhf8uyDhQVPTZ26O2NmmPr8BFNgxjrtY6m6h8PtF4vOPqxWv
         jbiO8vJV4DxOoThpsV622HLF3AsNJdVEBSA8WYYMkp6zNnpS8nNCBDVTrbalw4A/wvpp
         es1TOoaa5q7vhwB0D0VzC/TJyLM8pnWrsyblgOumYQWis9f22XYw5xMJq6nnmCFjfw9Z
         rZejLxgVMRwrdLfWvE6zowPbzs9yae5JW3irdAmka+USTgLQdo3nDpFusXxssB0hX49n
         94Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVXmGR2DSKlwHx4Jfv/cV6EKIRQudOp18TSJxc2CJAyionkQViOPD4sRfKK1G1WYsNXdwkj9hXI1nKkPGz8/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFxFuHwoFvtAs8hkbpsvml6jhK45IuwaVmZCIx6+hIaQ6EaDZY
	25UbMeUcyAkhfXicxcGgh3ItU/5Svz32fqTenkl8ISR0NXMVxje86myYebKomBG4
X-Gm-Gg: ATEYQzzAkyHbF9SDAAxAvdl5vOq4UUhnmnclSX+5GRJUnO6sLFjjXv8oGCOyart+X2d
	te5gQLt2Ph657M+VBZ81Q7U6m3txIvQnj9G1kdByHEKQP6i1DCbCcPzzlSD21wOy1QQokcSKsel
	kI8Krw2GbKgEC1mvktkQFgtqxyTqZEGrm3fgKvCh5pYbX2FoOQJHu/NjYrNacX8Q89DyUkUh+Rm
	rMc13utH7SCQ9XqLIPUE+6oXz8J9mm5ezj48+a7DYsyuZZoGt6xTAHCo2jOlqr6jSeyhn5dVF9t
	elhsWpQ8N82Upjzx5Fv+78Ey61iCuVJaCaLVI/ce4kQb53wiIV+3HMtoPcJg2nnZDvRhfIkaGee
	4d63lcevPt1YuEAxObvbbWAFin9bsA3XcoMnPDzRQ+T2bhH7ABRaJ4nEvWKQdRPpJg5fe1/yN1j
	umhFIfZKl6aeRzbMo5ujzDYO5SIC3M7K24Pm0pzvlJ2K3FdDsYZNVW+w==
X-Received: by 2002:a05:6a00:6c8d:b0:82a:7f28:c79b with SMTP id d2e1a72fcca58-82a8c2ef7bfmr13798915b3a.31.1774355252204;
        Tue, 24 Mar 2026 05:27:32 -0700 (PDT)
Received: from ZC-202510311500 ([61.185.217.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409f409sm12224583b3a.31.2026.03.24.05.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 05:27:31 -0700 (PDT)
From: Haoyu Lu <hechushiguitu666@gmail.com>
To: arc@lists.infradead.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	"haoyu . lu" <hechushiguitu666@gmail.com>
Subject: [PATCH] arch/arc: bpf_jit: fix missing newline in pr_err messages
Date: Tue, 24 Mar 2026 20:27:02 +0800
Message-ID: <20260324122703.641-1-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_052733_786316_AC98BAFF 
X-CRM114-Status: UNSURE (   8.87  )
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

From: haoyu.lu <hechushiguitu666@gmail.com>

Add missing newline to pr_err messages in arch/arc/net/bpf_jit_arcv2.c.

Fixes: f122668ddcce ("ARC: Add eBPF JIT support")
Signed-off-by: haoyu.lu <hechushiguitu666@gmail.com>
---
 arch/arc/net/bpf_jit_arcv2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arc/net/bpf_jit_arcv2.c b/arch/arc/net/bpf_jit_arcv2.c
index 6d989b6d88c6..7ee50aeae5a4 100644
--- a/arch/arc/net/bpf_jit_arcv2.c
+++ b/arch/arc/net/bpf_jit_arcv2.c
@@ -2427,7 +2427,7 @@ u8 arc_prologue(u8 *buf, u32 usage, u16 frame_size)

 #ifdef ARC_BPF_JIT_DEBUG
 	if ((usage & BIT(ARC_R_FP)) && frame_size == 0) {
-		pr_err("FP is being saved while there is no frame.");
+		pr_err("FP is being saved while there is no frame.\n");
 		BUG();
 	}
 #endif
@@ -2454,7 +2454,7 @@ u8 arc_epilogue(u8 *buf, u32 usage, u16 frame_size)

 #ifdef ARC_BPF_JIT_DEBUG
 	if ((usage & BIT(ARC_R_FP)) && frame_size == 0) {
-		pr_err("FP is being saved while there is no frame.");
+		pr_err("FP is being saved while there is no frame.\n");
 		BUG();
 	}
 #endif
@@ -2868,7 +2868,7 @@ u8 gen_jmp_64(u8 *buf, u8 rd, u8 rs, u8 cond, u32 curr_off, u32 targ_off)
 		break;
 	default:
 #ifdef ARC_BPF_JIT_DEBUG
-		pr_err("64-bit jump condition is not known.");
+		pr_err("64-bit jump condition is not known.\n");
 		BUG();
 #endif
 	}
@@ -2948,7 +2948,7 @@ u8 gen_jmp_32(u8 *buf, u8 rd, u8 rs, u8 cond, u32 curr_off, u32 targ_off)
 	 */
 	if (cond >= ARC_CC_LAST) {
 #ifdef ARC_BPF_JIT_DEBUG
-		pr_err("32-bit jump condition is not known.");
+		pr_err("32-bit jump condition is not known.\n");
 		BUG();
 #endif
 		return 0;
--
2.53.0.windows.1

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
