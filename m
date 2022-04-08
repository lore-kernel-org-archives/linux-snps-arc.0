Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB74C433FE
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Apr 2022 15:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBnCf+WJKbU9Qa8XTbEhVV5V9MlTzQhPa0lMcPY+2jI=; b=bICx6dwhDx4VPt
	zhRJ1vw0dWmmGrvNwOk1ES9t/3D41RK73X/DZgf8xlrTV0VOZ90fayyR1MH1ff73KktmjecbuA4PA
	movDM2QEuIrEpB0hm44l5y3v/w9ZTP1cnR9Kb+PfCjIFKChMOiF0uQB1oiCE9FmFAc3O0pKbQry0X
	QryZTzQ2L3QYRA6rpokaY36rZhdSU068qdhdTHA8wZLBOiD4lkCYZYl16mYL0zt+zcLr+CCcpFVDd
	vNHUohs+ullAdobWEQNOkzOwd2BsaiSnesqJkOLjF82gwNM68XkwzlBiOwHwhym/HjQFfdyjvZ18K
	+GLNdS9aKPPri1ykWg7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncr04-000OAm-Nz; Fri, 08 Apr 2022 15:58:16 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncr02-000O83-1a
 for linux-snps-arc@lists.infradead.org; Fri, 08 Apr 2022 15:58:15 +0000
Received: by mail-lj1-x230.google.com with SMTP id bn33so12054766ljb.6
 for <linux-snps-arc@lists.infradead.org>; Fri, 08 Apr 2022 08:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=28vXyj4csP+UjTHmfGT5B5evlTjLgv4LltE4LFcbdQE=;
 b=Z4o552de9eGoot/AOOXaKVS5O5g9VfDHYrU/rUHXsUmLOC6Yh7/elPMjR9USpjvc/i
 tjBkV5KPjqVHTs6lUYFw8jxkts4oBAUQ3F6Ak9eKe2RbKwELy5jrBQZ0lvzuypc4sKTk
 oN6PFpIQhke7TOZ70K3Rtyl2X1HG+Yil9XFsXk6plviS5cMiNggyCsbte0DqNsaCGnHF
 0Dsdv+idEqYGfq/s7Vlo2oxQBXnoxygIFETMRwAwnoLcB0IBWywILXpDqsIW6F0sRxQq
 WzMNGP5yChlEH3Q6TSCrNzwqy2HMd8gBkhGdiL2hi1QIQcK7wFhHsG34+UOoaUjpmSrE
 ZCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=28vXyj4csP+UjTHmfGT5B5evlTjLgv4LltE4LFcbdQE=;
 b=D3DE6zXTWNP4y1K3jPN4m+hTQ0aID7kNyYq+H63v62UIIbVwzi+qSaCOABB72yOM6i
 2tBDt9QyxrLopFRz537exBMY330XXcebO0CBiERJiGS+d1otIi46vrRYpvTp7HXIxuTK
 cEDsI3bAt1UCMhPbEsWSGFC2xDab2Iimn40McMLMGhcPK4veVqVPrxrVAKvXMUvKmYP6
 b8u1SKl6ryMwoYFCiJt2D64ml9cdQ9K34ZxINKNl4kJ1DxyPFK+JYbuBjpB+QinrSmCK
 5UCnqk2XO3mx5+ZJh1T+CmbGA/Wv9R5F4Q4v8a34u35nTHpvDDraLpJfk6uki8gbZUID
 ThqQ==
X-Gm-Message-State: AOAM533VsHK+CBWZLlxWc0olduwZQvt1CrqaqCKggouXzLNheLHOnXW+
 4sAQVipc1SWxVGci/EvGQEHHET+Or5wcVQ==
X-Google-Smtp-Source: ABdhPJzYnnmA1qDW8XMzOG8v1FMjRB8+FDFYMDdcz7a0wxwMDHFAZpaxKdt4SGU/KnFVBtCq55a50A==
X-Received: by 2002:a2e:300c:0:b0:24b:4f09:793e with SMTP id
 w12-20020a2e300c000000b0024b4f09793emr2336310ljw.2.1649433489854; 
 Fri, 08 Apr 2022 08:58:09 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 r9-20020a2e9949000000b0024b46eef85bsm461826ljj.127.2022.04.08.08.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 08:58:09 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [PATCH 2/4] ARC: enable HAVE_REGS_AND_STACK_ACCESS_API feature
Date: Fri,  8 Apr 2022 18:58:02 +0300
Message-Id: <20220408155804.587197-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408155804.587197-1-geomatsi@gmail.com>
References: <20220408155804.587197-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_085814_149028_3E6714E6 
X-CRM114-Status: GOOD (  16.05  )
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
