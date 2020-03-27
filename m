Return-Path: <SRS0=+IpF=5M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7748C2D0E5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 15:54:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DFA920748
	for <linux-snps-arc@archiver.kernel.org>; Fri, 27 Mar 2020 15:54:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cXSS3pab";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ca+oPRlW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DFA920748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=751pyGrs3KrTYuAJtg9qrXU81nHFTjZZdPXClHfCuSU=; b=cXSS3pabSjQA+5
	j8TAaVUZcFAVA68RaDfhJ13hF4MQIwG9SRPYLbHZ6+21tFwDiXZiDDUf9X7d5HArKtzqbVe/JBJNA
	Q81r0NIXhrg7VHZ8PtQDpq76kPBQCLknCFeiKlKEwX1ZBQ9/JHBZe5Vc+f+WwdYZxxGjQ/fXAt7NJ
	IhzWgxscLUZSudA/8OK3Kk2ts1fe47oFUXukiLnB8mQI+Ka9UH3mHifiCwAe6Ut/a1d4FmvZ5SRap
	J4B8qR9uBkyXENLXZ8157YW3PMgp0s65p59nv5iFLglzWewzUHkIKn0gZH4khk9Co993Z88+6NbLr
	VK0C6v3r3iIERwbkSRWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHrJD-0004ln-5g; Fri, 27 Mar 2020 15:54:11 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHrJB-0004c7-9m
 for linux-snps-arc@lists.infradead.org; Fri, 27 Mar 2020 15:54:10 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5811340603;
 Fri, 27 Mar 2020 15:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585324447; bh=i2e0c2LqmgeW1R7eZp3z5uHb0cvu0fxZMLpreG/MeUc=;
 h=From:To:Cc:Subject:Date:From;
 b=ca+oPRlW+vWHw++d9ylzhKzyWZeLaRZwMd6Aipkv180h5dHqL5OUDvx0DNzfe8D84
 IqG5E7F0gYhGxtlNNSPr7uN7addj09iO0cz1axyVO55S1rZzRBWZyHyhc7dIANBwcy
 obq18xIWDC++GnjsB0qS9GwEYta+ktd/xa9DecS5SJcPSGFfZAWtowyItB/ZKWQQ8y
 MjtL9e+zp+ODLESv06CX9uEudj8vOGI/6d6KrOdSfNwb5dlW/qzlex0SCvk1jwh8HQ
 xtErlVfUdoNB0vs9DRuhUxTtPlXO0Ug3HJ3MCRab/HbMteWL5QXQk2oYFLmjQbhT10
 XNSiIc4Ym5X8g==
Received: from paltsev-e7480.internal.synopsys.com
 (ru20-e7250.internal.synopsys.com [10.225.49.134])
 by mailhost.synopsys.com (Postfix) with ESMTP id 6636DA005C;
 Fri, 27 Mar 2020 15:53:59 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [RFC] ARC: initial ftrace support
Date: Fri, 27 Mar 2020 18:53:55 +0300
Message-Id: <20200327155355.18668-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_085409_350796_65920719 
X-CRM114-Status: GOOD (  13.31  )
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
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Ingo Molnar <mingo@redhat.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Add initial ftrace support for ARCv2. We add support only for
function tracer (the simplest, not dynamic one), however it is
prerequisite for dynamic function tracer and other complex
ones.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 arch/arc/Kconfig              |  1 +
 arch/arc/include/asm/Kbuild   |  1 -
 arch/arc/include/asm/ftrace.h | 16 ++++++++++++++++
 arch/arc/kernel/Makefile      | 10 ++++++++++
 arch/arc/kernel/ftrace.c      | 27 +++++++++++++++++++++++++++
 5 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 arch/arc/include/asm/ftrace.h
 create mode 100644 arch/arc/kernel/ftrace.c

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index ff2a393b635c..4b8f750bd32b 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -48,6 +48,7 @@ config ARC
 	select PCI_SYSCALL if PCI
 	select PERF_USE_VMALLOC if ARC_CACHE_VIPT_ALIASING
 	select HAVE_ARCH_JUMP_LABEL if ISA_ARCV2 && !CPU_ENDIAN_BE32
+	select HAVE_FUNCTION_TRACER if ISA_ARCV2
 
 config ARCH_HAS_CACHE_LINE_SIZE
 	def_bool y
diff --git a/arch/arc/include/asm/Kbuild b/arch/arc/include/asm/Kbuild
index 1b505694691e..4e2f55bdf2ff 100644
--- a/arch/arc/include/asm/Kbuild
+++ b/arch/arc/include/asm/Kbuild
@@ -6,7 +6,6 @@ generic-y += div64.h
 generic-y += dma-mapping.h
 generic-y += emergency-restart.h
 generic-y += extable.h
-generic-y += ftrace.h
 generic-y += hardirq.h
 generic-y += hw_irq.h
 generic-y += irq_regs.h
diff --git a/arch/arc/include/asm/ftrace.h b/arch/arc/include/asm/ftrace.h
new file mode 100644
index 000000000000..92303e506edf
--- /dev/null
+++ b/arch/arc/include/asm/ftrace.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 Synopsys, Inc. (www.synopsys.com)
+ *
+ * Author: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
+ */
+
+#ifndef __ASM_ARC_FTRACE_H
+#define __ASM_ARC_FTRACE_H
+
+extern void _mcount(unsigned long parent_ip);
+
+/* 3 instructions 1x 16 bit + 1x 32 bit */
+#define MCOUNT_INSN_SIZE	6
+
+#endif /* __ASM_ARC_FTRACE_H */
diff --git a/arch/arc/kernel/Makefile b/arch/arc/kernel/Makefile
index 75539670431a..42c9c4b1cabd 100644
--- a/arch/arc/kernel/Makefile
+++ b/arch/arc/kernel/Makefile
@@ -22,12 +22,22 @@ obj-$(CONFIG_ARC_METAWARE_HLINK)	+= arc_hostlink.o
 obj-$(CONFIG_PERF_EVENTS)		+= perf_event.o
 obj-$(CONFIG_JUMP_LABEL)		+= jump_label.o
 
+
+obj-$(CONFIG_FUNCTION_TRACER)		+= ftrace.o
+
+ifdef CONFIG_FUNCTION_TRACER
+CFLAGS_REMOVE_ftrace.o = $(CC_FLAGS_FTRACE)
+endif
+
 obj-$(CONFIG_ARC_FPU_SAVE_RESTORE)	+= fpu.o
 ifdef CONFIG_ISA_ARCOMPACT
 CFLAGS_fpu.o   += -mdpfp
 endif
 
 ifdef CONFIG_ARC_DW2_UNWIND
+ifdef CONFIG_FUNCTION_TRACER
+CFLAGS_REMOVE_ctx_sw.o = $(CC_FLAGS_FTRACE)
+endif
 CFLAGS_ctx_sw.o += -fno-omit-frame-pointer
 obj-y += ctx_sw.o
 else
diff --git a/arch/arc/kernel/ftrace.c b/arch/arc/kernel/ftrace.c
new file mode 100644
index 000000000000..a61edf52bfe2
--- /dev/null
+++ b/arch/arc/kernel/ftrace.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2020 Synopsys, Inc. (www.synopsys.com)
+ *
+ * Author: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
+ */
+
+#include <linux/ftrace.h>
+
+noinline void ftrace_stub(unsigned long ip, unsigned long parent_ip,
+			  struct ftrace_ops *op, struct pt_regs *regs)
+{
+	/* do notning */
+}
+
+extern void (*ftrace_trace_function)(unsigned long, unsigned long,
+				     struct ftrace_ops*, struct pt_regs*);
+
+noinline void _mcount(unsigned long parent_ip)
+{
+	unsigned long ip = (unsigned long)__builtin_return_address(0);
+
+	if (unlikely(ftrace_trace_function != ftrace_stub))
+		ftrace_trace_function(ip - MCOUNT_INSN_SIZE, parent_ip,
+				      NULL, NULL);
+}
+EXPORT_SYMBOL(_mcount);
-- 
2.21.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
