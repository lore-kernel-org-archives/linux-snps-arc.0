Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B32AC433FE
	for <linux-snps-arc@archiver.kernel.org>; Thu, 14 Apr 2022 08:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBnCf+WJKbU9Qa8XTbEhVV5V9MlTzQhPa0lMcPY+2jI=; b=udFPk3Wh7V1lyr
	y3OVp16zrX5oAf+E0SA/JyUe30KV81OpU2yAEUpp5fMG/FsB3tBca+dp801uTyQXrNbXDRWs+n34p
	FCTeOw/4R9w7RoDKAaR4X6ICPxIbVCh7AkVyl7uMd9EDOYEEgVUtfn/rUAlcpWCFYlwSDE0kBWy8U
	tZbz2xN3Kp9jIOpDvucMnonVtEXE+uAUIEkElkEHx1SxrzJP/Nu3K51I+TpSXul97QADoXrfPdqC2
	m/gy1ZK70hciqKbv7Zy3g4tnxOgWi82/5wSDHfLcnUp2ArQMFvhA8XoxksLyChHBc+CswbqLRKglY
	vT51mwu0MN6wKE+XVTLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neufW-004VFr-Uf; Thu, 14 Apr 2022 08:17:34 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neufT-004VCH-5F
 for linux-snps-arc@lists.infradead.org; Thu, 14 Apr 2022 08:17:33 +0000
Received: by mail-lf1-x129.google.com with SMTP id w19so7732210lfu.11
 for <linux-snps-arc@lists.infradead.org>; Thu, 14 Apr 2022 01:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=28vXyj4csP+UjTHmfGT5B5evlTjLgv4LltE4LFcbdQE=;
 b=PeHNe3LdB5EPHKX+E2GYcr1suQ6hrY0IcBSUwOl92mfIpB6JJ0L3evQoUUBSRa3xMO
 9F1xuAmTOEQtpbNewb/CyJ2jNBSebRm0PIqbJpkJhCKgZ4QwfpsL7MevImXM2R7BK9RP
 LPgAjnXzesFUE7m/MSlgTFXcomdGjA/9wa2ObfWiUAJYaYIf0v+Yxm+mC3gmELhKisxf
 ZL1VRG/Orp084G+FNNdbhbvZAZffq439RCdV2tMoW9vW0TqXlio/PE9UXMRud4jzxI37
 Mxe54JL3lMX9fDh+16sW9Q4+WSp//HCGGpm0gFnK4MMbsu5/u99/1Hbmo/BDkt+7Vpcg
 habg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=28vXyj4csP+UjTHmfGT5B5evlTjLgv4LltE4LFcbdQE=;
 b=XS1rsWrNp9clsQEG42gADYyyLROyXQ+at1aUXiJG1RKdUH/Jte1h0kCxV5bRHICg2i
 JG7t3V6YG4SDY1K2kDhNAD8+Af1oOE58UXL9lSdmLTNKQiR7w/BiVkI/KSJXyRtyCVDp
 mcm/NLukRbB2xT2Lqx2f8M0LMNdoATJ4598DKgmuU8+XOmj/qNz61+nqwCQQvuFfMmd9
 zBpmwo0B3eMHpkDD5dM9cJmm5pVzRE73aACl7eo6UPQxyYK21dcv1Rkk9SYZ+hRW42pv
 A6U4KK1XoUx0lMhwE+McGfiBjoOjH9coH8w5ZHcVkGM81vhlIwPxHIIktOefe8ZeDYVF
 pV4g==
X-Gm-Message-State: AOAM533jjkpDtLzQtAc/wlUKvDLN3iik0F9UDh9roNGC4uY0A3NWRHr+
 6YpibgkqE6uOghCeMytWVhlCLdSJeiOvAh0b
X-Google-Smtp-Source: ABdhPJzED4GBjb7pjyYFiM8TjuGLe3tELhtE4vPPPh6kYAjkxkTAOHC97QNz3pi6UqI+PxuUwMFEmQ==
X-Received: by 2002:a05:6512:1326:b0:45a:3a4:f25a with SMTP id
 x38-20020a056512132600b0045a03a4f25amr1175893lfu.575.1649924247821; 
 Thu, 14 Apr 2022 01:17:27 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 v20-20020a2e87d4000000b0024b638069b1sm117116ljj.39.2022.04.14.01.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 01:17:27 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [PATCH v2 1/4] ARC: enable HAVE_REGS_AND_STACK_ACCESS_API feature
Date: Thu, 14 Apr 2022 11:17:21 +0300
Message-Id: <20220414081724.3177956-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414081724.3177956-1-geomatsi@gmail.com>
References: <20220414081724.3177956-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_011731_249955_F5AB854C 
X-CRM114-Status: GOOD (  15.79  )
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

Enable HAVE_REGS_AND_STACK_ACCESS_API feature for ARC architecture,
including ARCcompact and ARCv2 flavors. Add supporting functions
and defines.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
---
 arch/arc/Kconfig              |   1 +
 arch/arc/include/asm/ptrace.h |  27 ++++++++
 arch/arc/kernel/ptrace.c      | 119 ++++++++++++++++++++++++++++++++++
 3 files changed, 147 insertions(+)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index e0a60a27e14d..3c850d0f431c 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -36,6 +36,7 @@ config ARC
 	select HAVE_KERNEL_LZMA
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
+	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_PERF_EVENTS
 	select IRQ_DOMAIN
diff --git a/arch/arc/include/asm/ptrace.h b/arch/arc/include/asm/ptrace.h
index cca8d6583e31..5869a74c0db2 100644
--- a/arch/arc/include/asm/ptrace.h
+++ b/arch/arc/include/asm/ptrace.h
@@ -8,6 +8,7 @@
 #define __ASM_ARC_PTRACE_H
 
 #include <uapi/asm/ptrace.h>
+#include <linux/compiler.h>
 
 #ifndef __ASSEMBLY__
 
@@ -54,6 +55,9 @@ struct pt_regs {
 
 	unsigned long user_r25;
 };
+
+#define MAX_REG_OFFSET offsetof(struct pt_regs, user_r25)
+
 #else
 
 struct pt_regs {
@@ -102,6 +106,8 @@ struct pt_regs {
 	unsigned long status32;
 };
 
+#define MAX_REG_OFFSET offsetof(struct pt_regs, status32)
+
 #endif
 
 /* Callee saved registers - need to be saved only when you are scheduled out */
@@ -154,6 +160,27 @@ static inline void instruction_pointer_set(struct pt_regs *regs,
 {
 	instruction_pointer(regs) = val;
 }
+
+static inline unsigned long kernel_stack_pointer(struct pt_regs *regs)
+{
+	return regs->sp;
+}
+
+extern int regs_query_register_offset(const char *name);
+extern const char *regs_query_register_name(unsigned int offset);
+extern bool regs_within_kernel_stack(struct pt_regs *regs, unsigned long addr);
+extern unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs,
+					       unsigned int n);
+
+static inline unsigned long regs_get_register(struct pt_regs *regs,
+					      unsigned int offset)
+{
+	if (unlikely(offset > MAX_REG_OFFSET))
+		return 0;
+
+	return *(unsigned long *)((unsigned long)regs + offset);
+}
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __ASM_PTRACE_H */
diff --git a/arch/arc/kernel/ptrace.c b/arch/arc/kernel/ptrace.c
index 54b419ac8bda..5fa5bceb83f3 100644
--- a/arch/arc/kernel/ptrace.c
+++ b/arch/arc/kernel/ptrace.c
@@ -9,6 +9,89 @@
 #include <linux/unistd.h>
 #include <linux/elf.h>
 
+struct pt_regs_offset {
+	const char *name;
+	int offset;
+};
+
+#define REG_OFFSET_NAME(r) {.name = #r, .offset = offsetof(struct pt_regs, r)}
+#define REG_OFFSET_END {.name = NULL, .offset = 0}
+
+#ifdef CONFIG_ISA_ARCOMPACT
+static const struct pt_regs_offset regoffset_table[] = {
+	REG_OFFSET_NAME(bta),
+	REG_OFFSET_NAME(lp_start),
+	REG_OFFSET_NAME(lp_end),
+	REG_OFFSET_NAME(lp_count),
+	REG_OFFSET_NAME(status32),
+	REG_OFFSET_NAME(ret),
+	REG_OFFSET_NAME(blink),
+	REG_OFFSET_NAME(fp),
+	REG_OFFSET_NAME(r26),
+	REG_OFFSET_NAME(r12),
+	REG_OFFSET_NAME(r11),
+	REG_OFFSET_NAME(r10),
+	REG_OFFSET_NAME(r9),
+	REG_OFFSET_NAME(r8),
+	REG_OFFSET_NAME(r7),
+	REG_OFFSET_NAME(r6),
+	REG_OFFSET_NAME(r5),
+	REG_OFFSET_NAME(r4),
+	REG_OFFSET_NAME(r3),
+	REG_OFFSET_NAME(r2),
+	REG_OFFSET_NAME(r1),
+	REG_OFFSET_NAME(r0),
+	REG_OFFSET_NAME(sp),
+	REG_OFFSET_NAME(orig_r0),
+	REG_OFFSET_NAME(event),
+	REG_OFFSET_NAME(user_r25),
+	REG_OFFSET_END,
+};
+
+#else
+
+static const struct pt_regs_offset regoffset_table[] = {
+	REG_OFFSET_NAME(orig_r0),
+	REG_OFFSET_NAME(event),
+	REG_OFFSET_NAME(bta),
+	REG_OFFSET_NAME(user_r25),
+	REG_OFFSET_NAME(r26),
+	REG_OFFSET_NAME(fp),
+	REG_OFFSET_NAME(sp),
+	REG_OFFSET_NAME(r12),
+	REG_OFFSET_NAME(r30),
+#ifdef CONFIG_ARC_HAS_ACCL_REGS
+	REG_OFFSET_NAME(r58),
+	REG_OFFSET_NAME(r59),
+#endif
+#ifdef CONFIG_ARC_DSP_SAVE_RESTORE_REGS
+	REG_OFFSET_NAME(DSP_CTRL),
+#endif
+	REG_OFFSET_NAME(r0),
+	REG_OFFSET_NAME(r1),
+	REG_OFFSET_NAME(r2),
+	REG_OFFSET_NAME(r3),
+	REG_OFFSET_NAME(r4),
+	REG_OFFSET_NAME(r5),
+	REG_OFFSET_NAME(r6),
+	REG_OFFSET_NAME(r7),
+	REG_OFFSET_NAME(r8),
+	REG_OFFSET_NAME(r9),
+	REG_OFFSET_NAME(r10),
+	REG_OFFSET_NAME(r11),
+	REG_OFFSET_NAME(blink),
+	REG_OFFSET_NAME(lp_end),
+	REG_OFFSET_NAME(lp_start),
+	REG_OFFSET_NAME(lp_count),
+	REG_OFFSET_NAME(ei),
+	REG_OFFSET_NAME(ldi),
+	REG_OFFSET_NAME(jli),
+	REG_OFFSET_NAME(ret),
+	REG_OFFSET_NAME(status32),
+	REG_OFFSET_END,
+};
+#endif
+
 static struct callee_regs *task_callee_regs(struct task_struct *tsk)
 {
 	struct callee_regs *tmp = (struct callee_regs *)tsk->thread.callee_reg;
@@ -267,3 +350,39 @@ asmlinkage void syscall_trace_exit(struct pt_regs *regs)
 {
 	ptrace_report_syscall_exit(regs, 0);
 }
+
+int regs_query_register_offset(const char *name)
+{
+	const struct pt_regs_offset *roff;
+
+	for (roff = regoffset_table; roff->name != NULL; roff++)
+		if (!strcmp(roff->name, name))
+			return roff->offset;
+	return -EINVAL;
+}
+
+const char *regs_query_register_name(unsigned int offset)
+{
+	const struct pt_regs_offset *roff;
+	for (roff = regoffset_table; roff->name != NULL; roff++)
+		if (roff->offset == offset)
+			return roff->name;
+	return NULL;
+}
+
+bool regs_within_kernel_stack(struct pt_regs *regs, unsigned long addr)
+{
+	return (addr & ~(THREAD_SIZE - 1))  ==
+		(kernel_stack_pointer(regs) & ~(THREAD_SIZE - 1));
+}
+
+unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs, unsigned int n)
+{
+	unsigned long *addr = (unsigned long *)kernel_stack_pointer(regs);
+
+	addr += n;
+	if (regs_within_kernel_stack(regs, (unsigned long)addr))
+		return *addr;
+	else
+		return 0;
+}
-- 
2.35.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
