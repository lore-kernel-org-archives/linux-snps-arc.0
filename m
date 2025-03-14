Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E1D5C28B2F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 Mar 2025 07:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WkcPVO6ADZwbabGPWVC4/kh0IAQRo6y3yrRdOASxoD0=; b=FhdORhf6FgNwGV
	YUek5+wBbd+6KpZTuA3AntFajOb3L8NIiYLbSH4kmPkA1fR3ThoYA2zI4xiHLc5Hn9TeHre7DNgTu
	YuKUXThNcO6Y0+REAyhDESvKIrnkpHzeYL6uqN5WcFFCaW92odzw6uTf05tgVVc5xs6GNCqCKhf7R
	vew9zbrZR4ohQnL0VvXZ8VYwdT67/KesYPjWSLwKCR6UXI2SSXJi8bGWtL0W/Awv75ELnPAGGFe07
	yCGfDyrv/o/15fWjHh+7F5Cv4bzbZH38YBkFB3oj4sq4rtDKVxIXk8uf1W3gMMDxkdlBekTd0oR97
	2gcCSOZjvB7XaNvmQE0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tszCa-0000000DGk7-3dVh;
	Fri, 14 Mar 2025 07:11:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tszCL-0000000DGgQ-0w6F
	for linux-snps-arc@bombadil.infradead.org;
	Fri, 14 Mar 2025 07:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=b7cjOjVg2lOMeYAeeJG2p6u0MZuPm1eTCEoNIyjOSV0=; b=TuUbv+a6U8/StGFbBIq2ygCvBv
	rQ+shNrulcMk37XrARCDsNs9Xwds/UCyLxU+XczTawOV3etgBfOP2e2TvtebT5qqvXfwPMLI788bb
	dHTnTCfWmzz+3iMM6BnEuzv24WNVE7jAaiG/jJjzwZuaVHE5yvPqqnekZX8h0AuljdGfOeyL2ort3
	gLDqdCR+IpLS2Z88DeACD8UhAB5ycRFFM9ng7AwcT5JDFqqj7xbZj9lBjhQReKiuNuwnXObIadUV7
	29WPjR6mKPNu9YKq9sJ4sOtnw/3upMbG+MPtMvATwmCTHG0l9+KUYeMdbdAPCVfPGx+5m660oQotn
	H6edEeSA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tszCF-00000002qsC-2z3T
	for linux-snps-arc@lists.infradead.org;
	Fri, 14 Mar 2025 07:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741936259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b7cjOjVg2lOMeYAeeJG2p6u0MZuPm1eTCEoNIyjOSV0=;
	b=XuKooT/0hiPSBXnihA1vNt4+466ZpY/cPabQmv++Y8xDy0QGTK1ZRqkRDGjafULv4BLwyM
	jhHvZsbJf1FzLpdbll7N0d26RYTnS7u95kL07AI2p/dL+24hx/8h3+mRD6vPdeec5yAmhi
	qXw1Ix+t+Tu7jAsPAjuwe8NdLRRl2WI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741936266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b7cjOjVg2lOMeYAeeJG2p6u0MZuPm1eTCEoNIyjOSV0=;
	b=Yr3gw6jD1pbFiiGNdfj+4AOijlRRo0M/4detoiDbtGoKfb0cCvoK/iL+Oeo24T+B8GgdIc
	KbH5bXdwiah2mM0p6fA3VcsOhWUs+31XVqtqagZxu4TKjkZm/9ghvHfUxiYrhpZuwU58y0
	zxJGiqxpKywUk3j0jWQ9OvfrzWdysb4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-655-z9DIsXXRO-WXzDzejg6-MQ-1; Fri,
 14 Mar 2025 03:10:57 -0400
X-MC-Unique: z9DIsXXRO-WXzDzejg6-MQ-1
X-Mimecast-MFC-AGG-ID: z9DIsXXRO-WXzDzejg6-MQ_1741936256
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2391E1955DCD;
	Fri, 14 Mar 2025 07:10:56 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.82])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1A62D1801747;
	Fri, 14 Mar 2025 07:10:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH 05/41] arc: Replace __ASSEMBLY__ with __ASSEMBLER__ in the non-uapi headers
Date: Fri, 14 Mar 2025 08:09:36 +0100
Message-ID: <20250314071013.1575167-6-thuth@redhat.com>
In-Reply-To: <20250314071013.1575167-1-thuth@redhat.com>
References: <20250314071013.1575167-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_071107_991936_C3D2F876 
X-CRM114-Status: GOOD (  16.65  )
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

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize on
the __ASSEMBLER__ macro that is provided by the compilers now.

This is a completely mechanical patch (done with a simple "sed -i"
statement).

Cc: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/arc/include/asm/arcregs.h            | 2 +-
 arch/arc/include/asm/atomic.h             | 4 ++--
 arch/arc/include/asm/bitops.h             | 4 ++--
 arch/arc/include/asm/bug.h                | 4 ++--
 arch/arc/include/asm/cache.h              | 4 ++--
 arch/arc/include/asm/current.h            | 4 ++--
 arch/arc/include/asm/dsp-impl.h           | 2 +-
 arch/arc/include/asm/dsp.h                | 4 ++--
 arch/arc/include/asm/dwarf.h              | 4 ++--
 arch/arc/include/asm/entry.h              | 4 ++--
 arch/arc/include/asm/irqflags-arcv2.h     | 4 ++--
 arch/arc/include/asm/irqflags-compact.h   | 4 ++--
 arch/arc/include/asm/jump_label.h         | 4 ++--
 arch/arc/include/asm/linkage.h            | 6 +++---
 arch/arc/include/asm/mmu-arcv2.h          | 4 ++--
 arch/arc/include/asm/mmu.h                | 2 +-
 arch/arc/include/asm/page.h               | 4 ++--
 arch/arc/include/asm/pgtable-bits-arcv2.h | 4 ++--
 arch/arc/include/asm/pgtable-levels.h     | 4 ++--
 arch/arc/include/asm/pgtable.h            | 4 ++--
 arch/arc/include/asm/processor.h          | 4 ++--
 arch/arc/include/asm/ptrace.h             | 4 ++--
 arch/arc/include/asm/switch_to.h          | 2 +-
 arch/arc/include/asm/thread_info.h        | 4 ++--
 24 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
index 005d9e4d187a0..a31bbf5c8bbc8 100644
--- a/arch/arc/include/asm/arcregs.h
+++ b/arch/arc/include/asm/arcregs.h
@@ -144,7 +144,7 @@
 #define ARC_AUX_AGU_MOD2	0x5E2
 #define ARC_AUX_AGU_MOD3	0x5E3
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <soc/arc/arc_aux.h>
 
diff --git a/arch/arc/include/asm/atomic.h b/arch/arc/include/asm/atomic.h
index 592d7fffc223c..e615c42b93bab 100644
--- a/arch/arc/include/asm/atomic.h
+++ b/arch/arc/include/asm/atomic.h
@@ -6,7 +6,7 @@
 #ifndef _ASM_ARC_ATOMIC_H
 #define _ASM_ARC_ATOMIC_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/types.h>
 #include <linux/compiler.h>
@@ -31,6 +31,6 @@
 #include <asm/atomic64-arcv2.h>
 #endif
 
-#endif	/* !__ASSEMBLY__ */
+#endif	/* !__ASSEMBLER__ */
 
 #endif
diff --git a/arch/arc/include/asm/bitops.h b/arch/arc/include/asm/bitops.h
index f5a936496f060..5340c28713927 100644
--- a/arch/arc/include/asm/bitops.h
+++ b/arch/arc/include/asm/bitops.h
@@ -10,7 +10,7 @@
 #error only <linux/bitops.h> can be included directly
 #endif
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/types.h>
 #include <linux/compiler.h>
@@ -192,6 +192,6 @@ static inline __attribute__ ((const)) unsigned long __ffs(unsigned long x)
 #include <asm-generic/bitops/le.h>
 #include <asm-generic/bitops/ext2-atomic-setbit.h>
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif
diff --git a/arch/arc/include/asm/bug.h b/arch/arc/include/asm/bug.h
index 4c453ba96c519..171c16021f709 100644
--- a/arch/arc/include/asm/bug.h
+++ b/arch/arc/include/asm/bug.h
@@ -6,7 +6,7 @@
 #ifndef _ASM_ARC_BUG_H
 #define _ASM_ARC_BUG_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <asm/ptrace.h>
 
@@ -29,6 +29,6 @@ void die(const char *str, struct pt_regs *regs, unsigned long address);
 
 #include <asm-generic/bug.h>
 
-#endif	/* !__ASSEMBLY__ */
+#endif	/* !__ASSEMBLER__ */
 
 #endif
diff --git a/arch/arc/include/asm/cache.h b/arch/arc/include/asm/cache.h
index f0f1fc5d62b66..040a97f4dd829 100644
--- a/arch/arc/include/asm/cache.h
+++ b/arch/arc/include/asm/cache.h
@@ -23,7 +23,7 @@
  */
 #define ARC_UNCACHED_ADDR_SPACE	0xc0000000
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/build_bug.h>
 
@@ -65,7 +65,7 @@
 extern int ioc_enable;
 extern unsigned long perip_base, perip_end;
 
-#endif	/* !__ASSEMBLY__ */
+#endif	/* !__ASSEMBLER__ */
 
 /* Instruction cache related Auxiliary registers */
 #define ARC_REG_IC_BCR		0x77	/* Build Config reg */
diff --git a/arch/arc/include/asm/current.h b/arch/arc/include/asm/current.h
index 06be89f6f2f05..03ffd005f3fa6 100644
--- a/arch/arc/include/asm/current.h
+++ b/arch/arc/include/asm/current.h
@@ -9,7 +9,7 @@
 #ifndef _ASM_ARC_CURRENT_H
 #define _ASM_ARC_CURRENT_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #ifdef CONFIG_ARC_CURR_IN_REG
 
@@ -20,6 +20,6 @@ register struct task_struct *curr_arc asm("gp");
 #include <asm-generic/current.h>
 #endif /* ! CONFIG_ARC_CURR_IN_REG */
 
-#endif /* ! __ASSEMBLY__ */
+#endif /* ! __ASSEMBLER__ */
 
 #endif /* _ASM_ARC_CURRENT_H */
diff --git a/arch/arc/include/asm/dsp-impl.h b/arch/arc/include/asm/dsp-impl.h
index cd5636dfeb6f4..fd5fdaad90c16 100644
--- a/arch/arc/include/asm/dsp-impl.h
+++ b/arch/arc/include/asm/dsp-impl.h
@@ -11,7 +11,7 @@
 
 #define DSP_CTRL_DISABLED_ALL		0
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 /* clobbers r5 register */
 .macro DSP_EARLY_INIT
diff --git a/arch/arc/include/asm/dsp.h b/arch/arc/include/asm/dsp.h
index f496dbc4640b2..eeaaf4e4eabd3 100644
--- a/arch/arc/include/asm/dsp.h
+++ b/arch/arc/include/asm/dsp.h
@@ -7,7 +7,7 @@
 #ifndef __ASM_ARC_DSP_H
 #define __ASM_ARC_DSP_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /*
  * DSP-related saved registers - need to be saved only when you are
@@ -24,6 +24,6 @@ struct dsp_callee_regs {
 #endif
 };
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_ARC_DSP_H */
diff --git a/arch/arc/include/asm/dwarf.h b/arch/arc/include/asm/dwarf.h
index a0d5ebe1bc3f5..1524c5cf8b59e 100644
--- a/arch/arc/include/asm/dwarf.h
+++ b/arch/arc/include/asm/dwarf.h
@@ -6,7 +6,7 @@
 #ifndef _ASM_ARC_DWARF_H
 #define _ASM_ARC_DWARF_H
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 #ifdef ARC_DW2_UNWIND_AS_CFI
 
@@ -38,6 +38,6 @@
 
 #endif	/* !ARC_DW2_UNWIND_AS_CFI */
 
-#endif	/* __ASSEMBLY__ */
+#endif	/* __ASSEMBLER__ */
 
 #endif	/* _ASM_ARC_DWARF_H */
diff --git a/arch/arc/include/asm/entry.h b/arch/arc/include/asm/entry.h
index 38c35722cebf0..f453af251a1a1 100644
--- a/arch/arc/include/asm/entry.h
+++ b/arch/arc/include/asm/entry.h
@@ -13,7 +13,7 @@
 #include <asm/processor.h>	/* For VMALLOC_START */
 #include <asm/mmu.h>
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 #ifdef CONFIG_ISA_ARCOMPACT
 #include <asm/entry-compact.h>	/* ISA specific bits */
@@ -146,7 +146,7 @@
 
 #endif	/* CONFIG_ARC_CURR_IN_REG */
 
-#else	/* !__ASSEMBLY__ */
+#else	/* !__ASSEMBLER__ */
 
 extern void do_signal(struct pt_regs *);
 extern void do_notify_resume(struct pt_regs *);
diff --git a/arch/arc/include/asm/irqflags-arcv2.h b/arch/arc/include/asm/irqflags-arcv2.h
index fb3c21f1a2383..30aea562f8aa6 100644
--- a/arch/arc/include/asm/irqflags-arcv2.h
+++ b/arch/arc/include/asm/irqflags-arcv2.h
@@ -50,7 +50,7 @@
 #define ISA_INIT_STATUS_BITS	(STATUS_IE_MASK | __AD_ENB | \
 					(ARCV2_IRQ_DEF_PRIO << 1))
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /*
  * Save IRQ state and disable IRQs
@@ -170,6 +170,6 @@ static inline void arc_softirq_clear(int irq)
 	seti
 .endm
 
-#endif	/* __ASSEMBLY__ */
+#endif	/* __ASSEMBLER__ */
 
 #endif
diff --git a/arch/arc/include/asm/irqflags-compact.h b/arch/arc/include/asm/irqflags-compact.h
index 936a2f21f315e..85c2f6bcde0c1 100644
--- a/arch/arc/include/asm/irqflags-compact.h
+++ b/arch/arc/include/asm/irqflags-compact.h
@@ -40,7 +40,7 @@
 
 #define ISA_INIT_STATUS_BITS	STATUS_IE_MASK
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /******************************************************************
  * IRQ Control Macros
@@ -196,6 +196,6 @@ static inline int arch_irqs_disabled(void)
 	flag	\scratch
 .endm
 
-#endif	/* __ASSEMBLY__ */
+#endif	/* __ASSEMBLER__ */
 
 #endif
diff --git a/arch/arc/include/asm/jump_label.h b/arch/arc/include/asm/jump_label.h
index a339223d9e052..66ead75784d97 100644
--- a/arch/arc/include/asm/jump_label.h
+++ b/arch/arc/include/asm/jump_label.h
@@ -2,7 +2,7 @@
 #ifndef _ASM_ARC_JUMP_LABEL_H
 #define _ASM_ARC_JUMP_LABEL_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/stringify.h>
 #include <linux/types.h>
@@ -68,5 +68,5 @@ struct jump_entry {
 	jump_label_t key;
 };
 
-#endif  /* __ASSEMBLY__ */
+#endif  /* __ASSEMBLER__ */
 #endif
diff --git a/arch/arc/include/asm/linkage.h b/arch/arc/include/asm/linkage.h
index 8a3fb71e9cfad..ba3cb65b5eaa4 100644
--- a/arch/arc/include/asm/linkage.h
+++ b/arch/arc/include/asm/linkage.h
@@ -12,7 +12,7 @@
 #define __ALIGN		.align 4
 #define __ALIGN_STR	__stringify(__ALIGN)
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 .macro ST2 e, o, off
 #ifdef CONFIG_ARC_HAS_LL64
@@ -61,7 +61,7 @@
 	CFI_ENDPROC ASM_NL	\
 	.size name, .-name
 
-#else	/* !__ASSEMBLY__ */
+#else	/* !__ASSEMBLER__ */
 
 #ifdef CONFIG_ARC_HAS_ICCM
 #define __arcfp_code __section(".text.arcfp")
@@ -75,6 +75,6 @@
 #define __arcfp_data __section(".data")
 #endif
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif
diff --git a/arch/arc/include/asm/mmu-arcv2.h b/arch/arc/include/asm/mmu-arcv2.h
index 41412642f2796..5e5482026ac90 100644
--- a/arch/arc/include/asm/mmu-arcv2.h
+++ b/arch/arc/include/asm/mmu-arcv2.h
@@ -69,7 +69,7 @@
 
 #define PTE_BITS_NON_RWX_IN_PD1	(PAGE_MASK_PHYS | _PAGE_CACHEABLE)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 struct mm_struct;
 extern int pae40_exist_but_not_enab(void);
@@ -100,6 +100,6 @@ static inline void mmu_setup_pgd(struct mm_struct *mm, void *pgd)
 	sr \reg, [ARC_REG_PID]
 .endm
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif
diff --git a/arch/arc/include/asm/mmu.h b/arch/arc/include/asm/mmu.h
index 4ae2db59d494c..e3b35ceab582b 100644
--- a/arch/arc/include/asm/mmu.h
+++ b/arch/arc/include/asm/mmu.h
@@ -6,7 +6,7 @@
 #ifndef _ASM_ARC_MMU_H
 #define _ASM_ARC_MMU_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/threads.h>	/* NR_CPUS */
 
diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
index def0dfb95b436..9720fe6b2c245 100644
--- a/arch/arc/include/asm/page.h
+++ b/arch/arc/include/asm/page.h
@@ -19,7 +19,7 @@
 
 #endif /* CONFIG_ARC_HAS_PAE40 */
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define clear_page(paddr)		memset((paddr), 0, PAGE_SIZE)
 #define copy_user_page(to, from, vaddr, pg)	copy_page(to, from)
@@ -136,6 +136,6 @@ static inline unsigned long virt_to_pfn(const void *kaddr)
 #include <asm-generic/memory_model.h>   /* page_to_pfn, pfn_to_page */
 #include <asm-generic/getorder.h>
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif
diff --git a/arch/arc/include/asm/pgtable-bits-arcv2.h b/arch/arc/include/asm/pgtable-bits-arcv2.h
index 8ebec1b21d246..a8fdb4fe1fbd6 100644
--- a/arch/arc/include/asm/pgtable-bits-arcv2.h
+++ b/arch/arc/include/asm/pgtable-bits-arcv2.h
@@ -75,7 +75,7 @@
  *     This is to enable COW mechanism
  */
 	/* xwr */
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #define pte_write(pte)		(pte_val(pte) & _PAGE_WRITE)
 #define pte_dirty(pte)		(pte_val(pte) & _PAGE_DIRTY)
@@ -142,6 +142,6 @@ PTE_BIT_FUNC(swp_clear_exclusive, &= ~(_PAGE_SWP_EXCLUSIVE));
 #include <asm/hugepage.h>
 #endif
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif
diff --git a/arch/arc/include/asm/pgtable-levels.h b/arch/arc/include/asm/pgtable-levels.h
index 86e1482264630..e7680b74e2c68 100644
--- a/arch/arc/include/asm/pgtable-levels.h
+++ b/arch/arc/include/asm/pgtable-levels.h
@@ -85,7 +85,7 @@
 
 #define PTRS_PER_PTE		BIT(PMD_SHIFT - PAGE_SHIFT)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #if CONFIG_PGTABLE_LEVELS > 3
 #include <asm-generic/pgtable-nop4d.h>
@@ -183,6 +183,6 @@
 #define pmd_leaf(x)		(pmd_val(x) & _PAGE_HW_SZ)
 #endif
 
-#endif	/* !__ASSEMBLY__ */
+#endif	/* !__ASSEMBLER__ */
 
 #endif
diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
index 4cf45a99fd792..bd580e2b62d7c 100644
--- a/arch/arc/include/asm/pgtable.h
+++ b/arch/arc/include/asm/pgtable.h
@@ -19,7 +19,7 @@
  */
 #define	USER_PTRS_PER_PGD	(TASK_SIZE / PGDIR_SIZE)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 extern char empty_zero_page[PAGE_SIZE];
 #define ZERO_PAGE(vaddr)	(virt_to_page(empty_zero_page))
@@ -29,6 +29,6 @@ extern pgd_t swapper_pg_dir[] __aligned(PAGE_SIZE);
 /* to cope with aliasing VIPT cache */
 #define HAVE_ARCH_UNMAPPED_AREA
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif
diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
index d606658e2fe73..7f7901ac6643c 100644
--- a/arch/arc/include/asm/processor.h
+++ b/arch/arc/include/asm/processor.h
@@ -11,7 +11,7 @@
 #ifndef __ASM_ARC_PROCESSOR_H
 #define __ASM_ARC_PROCESSOR_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <asm/ptrace.h>
 #include <asm/dsp.h>
@@ -66,7 +66,7 @@ extern void start_thread(struct pt_regs * regs, unsigned long pc,
 
 extern unsigned int __get_wchan(struct task_struct *p);
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 /*
  * Default System Memory Map on ARC
diff --git a/arch/arc/include/asm/ptrace.h b/arch/arc/include/asm/ptrace.h
index cf79df0b25705..f6c052af8f4d3 100644
--- a/arch/arc/include/asm/ptrace.h
+++ b/arch/arc/include/asm/ptrace.h
@@ -10,7 +10,7 @@
 #include <uapi/asm/ptrace.h>
 #include <linux/compiler.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 typedef union {
 	struct {
@@ -172,6 +172,6 @@ static inline unsigned long regs_get_register(struct pt_regs *regs,
 extern int syscall_trace_enter(struct pt_regs *);
 extern void syscall_trace_exit(struct pt_regs *);
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_PTRACE_H */
diff --git a/arch/arc/include/asm/switch_to.h b/arch/arc/include/asm/switch_to.h
index 1f85de8288b17..5806106a65f90 100644
--- a/arch/arc/include/asm/switch_to.h
+++ b/arch/arc/include/asm/switch_to.h
@@ -6,7 +6,7 @@
 #ifndef _ASM_ARC_SWITCH_TO_H
 #define _ASM_ARC_SWITCH_TO_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/sched.h>
 #include <asm/dsp-impl.h>
diff --git a/arch/arc/include/asm/thread_info.h b/arch/arc/include/asm/thread_info.h
index 12daaf3a61eaf..255d2c7742190 100644
--- a/arch/arc/include/asm/thread_info.h
+++ b/arch/arc/include/asm/thread_info.h
@@ -24,7 +24,7 @@
 #define THREAD_SIZE     (PAGE_SIZE << THREAD_SIZE_ORDER)
 #define THREAD_SHIFT	(PAGE_SHIFT << THREAD_SIZE_ORDER)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/thread_info.h>
 
@@ -62,7 +62,7 @@ static inline __attribute_const__ struct thread_info *current_thread_info(void)
 	return (struct thread_info *)(sp & ~(THREAD_SIZE - 1));
 }
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 
 /*
  * thread information flags
-- 
2.48.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
