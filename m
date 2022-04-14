Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570A4C433F5
	for <linux-snps-arc@archiver.kernel.org>; Thu, 14 Apr 2022 08:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQaTwmoLJ094h62aXYW+bitoCEWQl46ZovBB6238/Hc=; b=FGmIL8XJMDkZZW
	ry4oSilR8mFMC3JvAuABjQKqeD+me6nx9bYbZvzdTzzRiG7EkEiCXpF8sTJq9HCXyFLKilBdHeX8/
	ZgWMt+zv+HQqSSGY1AkIDpykeRLhxwQpYTt0rRkGaD+9FQugsaAW1FZ+3Nlin+hscpJaJC9e4Uu18
	E/rpXwmyPNt48jJ1VUycsrGjTz3hVNMhtDgks81VK0cC8GUQjFAVLsaauq3XV3O1n+GlJj0VnP2j3
	4AUtBTWmjxwMBU15Xd+9v1Iotp1Yt86KM9tKRuG9gI1ab8J8eTG0cCnKL1X+zxflBJthjNVOJuBq4
	AwyozY+2k3YrxTGGU6iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neufZ-004VHW-L8; Thu, 14 Apr 2022 08:17:37 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neufV-004VDG-3p
 for linux-snps-arc@lists.infradead.org; Thu, 14 Apr 2022 08:17:35 +0000
Received: by mail-lf1-x131.google.com with SMTP id u7so7753398lfs.8
 for <linux-snps-arc@lists.infradead.org>; Thu, 14 Apr 2022 01:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NGAvoeVIngOGtPiGuOfhgEMzn/Y4E21SywZv5A/pFlY=;
 b=AIXcXEAgM1T/vvrJgSMg/A+jo5ikcih093elZ80CvifcEQd8fmOkrWzqNqYpUs41+4
 ok6B4OqwrZKTLri20PKFGH68CXrAR8TafBdD/M0anQVAbNYAAcwNaNIzNuXbyUxWRKqO
 RS7Hk2KzVYNHNJDNt5B4lcBs4m6NojBAtw+vKpZjmt1+RIrLhmWRjYsXAeMfGsBUG3kG
 ABRDjGU62vhtvJeCyEYuWg+db1ISZ8Q2gcTxDo/vGUD6SjyIgOUGf/Vs41VlXgaAFkkS
 /MVWYiHF+AU0wNAunxjD2sVJ6Ur0FLeqRWJ2kmESidOT/scVtLemtmIGSkw3csrS0Dnz
 yvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NGAvoeVIngOGtPiGuOfhgEMzn/Y4E21SywZv5A/pFlY=;
 b=HYTSvjVB6NRx8Io2N9987uQLyhx/aXt77JqGlUDAKbcd/CQcBhfV18hXGw9Nkj+J61
 uiEzlSDJilT1QPYXxwOLRFfBKjW20YFUc5yBAvEuRR8YKNv0IwlNs8gzHcFdbmkQ5bqC
 NaOWLxj5KUITYpgXjFzA5pY9rQSnKavLvmxO5VoJRMuoVUn8guK8A15XaOspQFMaEVe9
 SzL4s4qjGNYviDiA2ExaU6vxruUJeb1hDoO1fiJlYEgQ3iqWng/ZuUHolj12R0yhR3Re
 Ky5/dOPlfx6DGWQMNwmJQHk3nVSiqVcmsPtWHgzk7plG8iJNgDV3MakRBLBWLDtCXeBR
 PGUw==
X-Gm-Message-State: AOAM531JuAztoitrFsUrIi5yGhTpNl84xEGPJKGY8CR9FC2rueBE4XJR
 D7MyO1m1F/WknwJ8AB8YtJ/zQ3pYK2ySPRi/
X-Google-Smtp-Source: ABdhPJz7ZaZ1rUlWJmPJsOpRm//9yqTVFgiwKRf/5Pkd7534iAfH7TYGS4wiLBKBjLWJGXNcQH0JHw==
X-Received: by 2002:a05:6512:13a9:b0:448:9dd3:b84 with SMTP id
 p41-20020a05651213a900b004489dd30b84mr1194703lfa.556.1649924250380; 
 Thu, 14 Apr 2022 01:17:30 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 v20-20020a2e87d4000000b0024b638069b1sm117116ljj.39.2022.04.14.01.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 01:17:30 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [PATCH v2 4/4] ARC: disasm: handle ARCv2 case in kprobe get/set
 functions
Date: Thu, 14 Apr 2022 11:17:24 +0300
Message-Id: <20220414081724.3177956-5-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414081724.3177956-1-geomatsi@gmail.com>
References: <20220414081724.3177956-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_011733_209489_73C8E47C 
X-CRM114-Status: GOOD (  13.63  )
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

From: Sergey Matyukevich <sergey.matyukevich@synopsys.com>

Current implementation of get_reg/set_reg implies ARCompact layout
of pt_regs structure. Meanwhile pt_regs structure differs between
ARCompact and ARCv2. Update those functions to handle ARCv2.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 arch/arc/kernel/disasm.c | 64 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 2 deletions(-)

diff --git a/arch/arc/kernel/disasm.c b/arch/arc/kernel/disasm.c
index 03f8b1be0c3a..38f5f8325322 100644
--- a/arch/arc/kernel/disasm.c
+++ b/arch/arc/kernel/disasm.c
@@ -434,14 +434,31 @@ long __kprobes get_reg(int reg, struct pt_regs *regs,
 {
 	long *p;
 
+#if defined(CONFIG_ISA_ARCOMPACT)
 	if (reg <= 12) {
 		p = &regs->r0;
 		return p[-reg];
 	}
+#else /* CONFIG_ISA_ARCV2 */
+	if (reg <= 11) {
+		p = &regs->r0;
+		return p[reg];
+	}
 
+	if (reg == 12)
+		return regs->r12;
+	if (reg == 30)
+		return regs->r30;
+#ifdef CONFIG_ARC_HAS_ACCL_REGS
+	if (reg == 58)
+		return regs->r58;
+	if (reg == 59)
+		return regs->r59;
+#endif
+#endif
 	if (cregs && (reg <= 25)) {
 		p = &cregs->r13;
-		return p[13-reg];
+		return p[13 - reg];
 	}
 
 	if (reg == 26)
@@ -461,6 +478,7 @@ void __kprobes set_reg(int reg, long val, struct pt_regs *regs,
 {
 	long *p;
 
+#if defined(CONFIG_ISA_ARCOMPACT)
 	switch (reg) {
 	case 0 ... 12:
 		p = &regs->r0;
@@ -469,7 +487,37 @@ void __kprobes set_reg(int reg, long val, struct pt_regs *regs,
 	case 13 ... 25:
 		if (cregs) {
 			p = &cregs->r13;
-			p[13-reg] = val;
+			p[13 - reg] = val;
+		}
+		break;
+	case 26:
+		regs->gp = val;
+		break;
+	case 27:
+		regs->fp = val;
+		break;
+	case 28:
+		regs->sp = val;
+		break;
+	case 31:
+		regs->blink = val;
+		break;
+	default:
+		break;
+	}
+#else /* CONFIG_ISA_ARCV2 */
+	switch (reg) {
+	case 0 ... 11:
+		p = &regs->r0;
+		p[reg] = val;
+		break;
+	case 12:
+		regs->r12 = val;
+		break;
+	case 13 ... 25:
+		if (cregs) {
+			p = &cregs->r13;
+			p[13 - reg] = val;
 		}
 		break;
 	case 26:
@@ -481,12 +529,24 @@ void __kprobes set_reg(int reg, long val, struct pt_regs *regs,
 	case 28:
 		regs->sp = val;
 		break;
+	case 30:
+		regs->r30 = val;
+		break;
 	case 31:
 		regs->blink = val;
 		break;
+#ifdef CONFIG_ARC_HAS_ACCL_REGS
+	case 58:
+		regs->r58 = val;
+		break;
+	case 59:
+		regs->r59 = val;
+		break;
+#endif
 	default:
 		break;
 	}
+#endif
 }
 
 /*
-- 
2.35.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
