Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCDCC4167D
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Feb 2022 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0kzKJMmNI8/ZF1xHpwOj5ItpI9psPShdBIpS10v8dYY=; b=EWks/bhKZ17HoN
	330okw1Scsdnq56ba+v6B8ZoAiZZjgs29oNaOqTLn4B3GF9JOIhq4592o4FkbVYynq9HNspaeY14J
	rAGPl1RbI3mpOsa0KVHht8Zn2VB4Zra+cnuCBG/DRzou9Lu12/2/6F4W6aYfMtsKT1X0ysYVjThcg
	3aypGcSQojwtYOl/hkDMCIR27RKAtXecXby7U2zLWen30ZqdADlFkeAWHKXFhQZ2bpsoFOcP4+Co2
	R4k1AW7uPpGjLzLK5Ympc0T8kJnO17iNj8agUiMNbyHWoo38LvzGkyFp7mN2cTZz6u4C0QgbJfRU2
	25YgntiUNfxFF4gA1SIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMVx9-009qhl-AX; Tue, 22 Feb 2022 14:15:43 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMVws-009qV1-IF
 for linux-snps-arc@lists.infradead.org; Tue, 22 Feb 2022 14:15:28 +0000
Received: by mail-lf1-x12a.google.com with SMTP id b9so25085889lfv.7
 for <linux-snps-arc@lists.infradead.org>; Tue, 22 Feb 2022 06:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1bfGZO3qbkT9o7Ckyj5R6TFR89uvj42RXUW0v//exS4=;
 b=kG+GHEaJEFS+qOt7vxpB2NhBAjeJxt8pvA79ZueRg3CkVlSLqQWi7mkJzJ/F23P5u+
 PRrjr8inKKWKDmpyvBEVl+Zb0pX5ZGVtc39P0+f1r+m77wcXYR4aZyb6ejqkmynHTzLR
 qA2K19+QC/TbN4zlrzuKYniTertKMstTfYULxqwuTUN4QS3XZlMqfgJPYQL3/YK0u/nD
 np+Iy161MgSBNPKQjuN0uhIhi8XYlqQ31M5rfedWLzRmcbQF/f+BMjLcOcdmIX5xfRNP
 b6QbxLLpNL3jFexV3iOMfE5uJyu4jA/oF1XD2bZ+pth6uThCB5CQ9/ueNFaECxmvToUL
 9asQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1bfGZO3qbkT9o7Ckyj5R6TFR89uvj42RXUW0v//exS4=;
 b=AIvgvyzhXMfUNH50+EWx38MBSEeoCyDdmZOs9bNC2lkWSZ8i9qIu4OlOJ6+R5zWfOh
 AaVIkCb1zvhkmyUUq9DdOGDwDuVtc65g3+jvMX46uXNzT0lkFsV7hjqpBKSluBp3Kc4t
 XKMv82EMVpIQ37ae97+N2mH7eKiUgmvpf8k8mjh6fJ2/JqumSy/2pA/toYhZbvc2tRwU
 LJB7E95+S6XqS9CqdRfCmHqz3912QDtc0yUhqvvdi6Titj7CEle9NhDWDxjQB+ePV2vC
 LY9q5Exxb+daUaACUzXOnGJ8DThoxFFolehWExdleDhWFZ7g0SybR5hiGkngiKNpX9+S
 W1ew==
X-Gm-Message-State: AOAM530z3rLhkssgikmv36U3f3q7KcrDfV+r90qj/K6o8lHaZoxClJhQ
 SFCx/d1FtE6zDuHND8p3c6yXBLkEReM=
X-Google-Smtp-Source: ABdhPJyYdQVKllknihFiYQQFegZ7hHJ8FDPPwzCKBKKSNTP3gFHWJ7+Z5fsm71PDXrylrw/xPm99cg==
X-Received: by 2002:ac2:4e04:0:b0:442:bfb6:c832 with SMTP id
 e4-20020ac24e04000000b00442bfb6c832mr18366656lfr.519.1645539325050; 
 Tue, 22 Feb 2022 06:15:25 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id m8sm1707047ljb.131.2022.02.22.06.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:15:24 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [RFC PATCH 11/13] ARC: head: elide ZOL
Date: Tue, 22 Feb 2022 17:15:04 +0300
Message-Id: <20220222141506.4003433-12-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222141506.4003433-1-geomatsi@gmail.com>
References: <20220222141506.4003433-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_061526_669895_9552B0C8 
X-CRM114-Status: GOOD (  12.08  )
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

From: Vineet Gupta <vgupta@kernel.org>

Add entry implementation based on double load/stores
if ZOL is not supported.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/asm-macro-ll64-emul.h | 3 +++
 arch/arc/include/asm/entry.h               | 2 ++
 arch/arc/kernel/head.S                     | 8 +++++++-
 arch/arc/kernel/vmlinux.lds.S              | 2 +-
 4 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arc/include/asm/asm-macro-ll64-emul.h b/arch/arc/include/asm/asm-macro-ll64-emul.h
index 886320cc74ad..417c892d557e 100644
--- a/arch/arc/include/asm/asm-macro-ll64-emul.h
+++ b/arch/arc/include/asm/asm-macro-ll64-emul.h
@@ -15,6 +15,9 @@
 	.ifeqs	"\d", "r6"
 		st.ab	r7, [\s, \incr / 2]
 	.endif
+	.ifeqs	"\d", "0"
+		st.ab	\d, [\s, \incr / 2]
+	.endif
 .endm
 
 .macro LD64.ab d, s, incr
diff --git a/arch/arc/include/asm/entry.h b/arch/arc/include/asm/entry.h
index fcdd59d77f42..1bc9f730e1e2 100644
--- a/arch/arc/include/asm/entry.h
+++ b/arch/arc/include/asm/entry.h
@@ -7,6 +7,8 @@
 #ifndef __ASM_ARC_ENTRY_H
 #define __ASM_ARC_ENTRY_H
 
+#include <asm/asm-offsets.h>
+#include <asm/assembler.h>
 #include <asm/unistd.h>		/* For NR_syscalls defination */
 #include <asm/arcregs.h>
 #include <asm/ptrace.h>
diff --git a/arch/arc/kernel/head.S b/arch/arc/kernel/head.S
index 9152782444b5..17b5426d4ca4 100644
--- a/arch/arc/kernel/head.S
+++ b/arch/arc/kernel/head.S
@@ -121,13 +121,19 @@ ENTRY(stext)
 #endif
 
 	; Clear BSS before updating any globals
-	; XXX: use ZOL here
 	mov	r5, __bss_start
 	sub	r6, __bss_stop, r5
+#ifndef CONFIG_ARC_LACKS_ZOL
 	lsr.f	lp_count, r6, 2
 	lpnz	1f
 	st.ab   0, [r5, 4]
 1:
+#else
+	lsr	r6, r6, 3
+1:
+	ST64.ab	0, r5, 8
+	DBNZR	r6, 1b
+#endif
 
 	; Uboot - kernel ABI
 	;    r0 = [0] No uboot interaction, [1] cmdline in r2, [2] DTB in r2
diff --git a/arch/arc/kernel/vmlinux.lds.S b/arch/arc/kernel/vmlinux.lds.S
index 529ae50f9fe2..00aeb89bd169 100644
--- a/arch/arc/kernel/vmlinux.lds.S
+++ b/arch/arc/kernel/vmlinux.lds.S
@@ -107,7 +107,7 @@ SECTIONS
 
 	_edata = .;
 
-	BSS_SECTION(4, 4, 4)
+	BSS_SECTION(8, 8, 8)
 
 #ifdef CONFIG_ARC_DW2_UNWIND
 	. = ALIGN(PAGE_SIZE);
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
