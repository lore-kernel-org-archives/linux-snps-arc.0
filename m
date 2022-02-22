Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACEDC433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Feb 2022 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pqo5zceSRCvHkKXmW9EgYNJGYYWdD8fNzX6fs4RgebQ=; b=yGzaK3g2HAFVXP
	L12qETYnxHXJi0EvLgJHn1Po5twunm6ojhsf3Oo2DLaEHRKXYzACQfQL6OK8/oTc5Q6GfH8o6JFt/
	z0ipj74Sptyee5xWaDyB8SbBxYL2BpIm7SEL1/M2hZNWLCiRB7MqSbuKY3xrjB6gMq4GT5bTzetcs
	aa9/mW/WfNclwcjSFNs6oC2W/ohpn3hrS6AbMH7euFvPZuc+2bmHhFdJ8MwAgs1zVlL6dYo3a+vfx
	dbdq4P67L6uHHpcPXSqRjO64/ionYKUf6y985QHD93tC7kPFvgpQnHiE74GQDBSHy8dYCRJ5Wn9na
	MKnAlZj8+l7b8h29Cv6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMVxA-009qiS-3X; Tue, 22 Feb 2022 14:15:44 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMVwu-009qWt-Ky
 for linux-snps-arc@lists.infradead.org; Tue, 22 Feb 2022 14:15:34 +0000
Received: by mail-lj1-x232.google.com with SMTP id e2so16348646ljq.12
 for <linux-snps-arc@lists.infradead.org>; Tue, 22 Feb 2022 06:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O8AnGg6j/6brs8tJZW3EA88ySpYn8dyRUbWEEnyBkjI=;
 b=GpnXPuQvQyiXdN7cwGSPEv1BXLtEE3oxVSEoQwxL5AnuraPQ9KBCSrQSGwLaPR+n49
 mG0NI09rkiIeZOKXxHdobf+7leEvCRR3GXe9YMz5L5HehwoC2jjBgcOSNbea9O1OqVUz
 hop73AweoCxkah2vrwlxF1xZZnIY5X6wCy969TqQ+ANdsD2AWVOm5S1PvX1QALbZR79k
 xaRLuUwrW2epqyvKHKI9fvGoeAkPTPDS7wvus35RpL7HmDGFpwdm3pmj4cd0XGmoVsLC
 7ljM/tE/mH7bbB92jhGv3xewYJKT9KC/T1kdtR4Qx9xOef+FOeyK/67U9uMa3J9QGz49
 8IVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O8AnGg6j/6brs8tJZW3EA88ySpYn8dyRUbWEEnyBkjI=;
 b=otfPkf9rPCUyDlQkgpYEbxikgOmYzX6Horhuar1dZ034jS23ewv+Zo7v24JyxnXLPv
 giyOtYpxBIYtmU1MDfimzLMEdTbC8dBl8lQPCRg+Pvs0ae3ndKt3WuBohMDO8IFKOQSX
 t0xWxLZUWbbjBovKvgIS3AX1FwWolC7CzFuQG3ul3Sanw/wI4gWQGersCmtZ25xfBr0X
 FOfnwti7L7SwAbc+fAS4qVp6zyvTKNaB63r2kTB+eP/66n/Kg+FlHbbsu8DMd3lNbnv8
 V1qqKtUhN4doac2ZCdaHkUFaRNoUjtoryaJrLuQ/0FhU6bAjk2StF/N4UicILltXcFVd
 h6xw==
X-Gm-Message-State: AOAM533hD8eeF2aooiEJt71UPcaa7dQHO84JkMRGDS5480sd2snV8+ci
 Udpxfcj9rnpUvyMXOnsNGgh3BIPmBFw=
X-Google-Smtp-Source: ABdhPJzcxp3kpxO12vw/WsO8t0bY/SjSz+mRK80qeI9fhiyUaeDhNLx/mco/uQ+kkOQPE20+zg9Myg==
X-Received: by 2002:a2e:b0f6:0:b0:246:e95:c4ce with SMTP id
 h22-20020a2eb0f6000000b002460e95c4cemr18055037ljl.142.1645539326454; 
 Tue, 22 Feb 2022 06:15:26 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id m8sm1707047ljb.131.2022.02.22.06.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:15:26 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [RFC PATCH 13/13] ARC: pt_regs: handle the case when ZOL is not
 supported
Date: Tue, 22 Feb 2022 17:15:06 +0300
Message-Id: <20220222141506.4003433-14-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222141506.4003433-1-geomatsi@gmail.com>
References: <20220222141506.4003433-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_061528_776538_6AF8BC05 
X-CRM114-Status: GOOD (  17.24  )
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

- Entry code (interrupts/exceptions) need not save/restore ZOL regs
- Any userspace ZOL references (ptrace, signal frame, process start)
  reworked such that ZOL regs are Zero-on-read, Ingore-on-write since
  the ptrace ABI need not change

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/entry-arcv2.h |  4 ++++
 arch/arc/include/asm/ptrace.h      |  4 +++-
 arch/arc/kernel/asm-offsets.c      |  2 ++
 arch/arc/kernel/disasm.c           |  2 ++
 arch/arc/kernel/intc-arcv2.c       |  2 ++
 arch/arc/kernel/kgdb.c             |  4 ++++
 arch/arc/kernel/process.c          |  2 ++
 arch/arc/kernel/ptrace.c           | 12 ++++++++++++
 arch/arc/kernel/signal.c           |  8 ++++++++
 arch/arc/kernel/troubleshoot.c     |  3 +++
 arch/arc/kernel/unaligned.c        |  2 ++
 11 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/entry-arcv2.h b/arch/arc/include/asm/entry-arcv2.h
index 0ff4c0610561..e40a98d2ec29 100644
--- a/arch/arc/include/asm/entry-arcv2.h
+++ b/arch/arc/include/asm/entry-arcv2.h
@@ -117,11 +117,13 @@
 
 	st	blink, [sp, PT_blink]
 
+#ifndef CONFIG_ARC_LACKS_ZOL
 	lr	r10, [lp_end]
 	lr	r11, [lp_start]
 	ST2	r10, r11, PT_lpe
 
 	st	lp_count, [sp, PT_lpc]
+#endif
 
 	; skip JLI, LDI, EI for now
 .endm
@@ -205,12 +207,14 @@
 
 	ld	blink, [sp, PT_blink]
 
+#ifndef CONFIG_ARC_LACKS_ZOL
 	LD2	r10, r11, PT_lpe
 	sr	r10, [lp_end]
 	sr	r11, [lp_start]
 
 	ld	r10, [sp, PT_lpc]	; lp_count can't be target of LD
 	mov	lp_count, r10
+#endif
 
 	LD2	r0,  r1,  PT_r0
 	LD2	r2,  r3,  PT_r2
diff --git a/arch/arc/include/asm/ptrace.h b/arch/arc/include/asm/ptrace.h
index cca8d6583e31..9d2b1e7ba6a3 100644
--- a/arch/arc/include/asm/ptrace.h
+++ b/arch/arc/include/asm/ptrace.h
@@ -94,8 +94,10 @@ struct pt_regs {
 	unsigned long r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11;
 
 	unsigned long blink;
-	unsigned long lp_end, lp_start, lp_count;
 
+#ifndef CONFIG_ARC_LACKS_ZOL
+	unsigned long lp_end, lp_start, lp_count;
+#endif
 	unsigned long ei, ldi, jli;
 
 	unsigned long ret;
diff --git a/arch/arc/kernel/asm-offsets.c b/arch/arc/kernel/asm-offsets.c
index 0e884036ab74..e388d3420b3d 100644
--- a/arch/arc/kernel/asm-offsets.c
+++ b/arch/arc/kernel/asm-offsets.c
@@ -61,8 +61,10 @@ int main(void)
 	DEFINE(PT_r26, offsetof(struct pt_regs, r26));
 	DEFINE(PT_ret, offsetof(struct pt_regs, ret));
 	DEFINE(PT_blink, offsetof(struct pt_regs, blink));
+#ifndef CONFIG_ARC_LACKS_ZOL
 	DEFINE(PT_lpe, offsetof(struct pt_regs, lp_end));
 	DEFINE(PT_lpc, offsetof(struct pt_regs, lp_count));
+#endif
 	DEFINE(PT_user_r25, offsetof(struct pt_regs, user_r25));
 
 	DEFINE(SZ_CALLEE_REGS, sizeof(struct callee_regs));
diff --git a/arch/arc/kernel/disasm.c b/arch/arc/kernel/disasm.c
index 03f8b1be0c3a..c23d3829aef6 100644
--- a/arch/arc/kernel/disasm.c
+++ b/arch/arc/kernel/disasm.c
@@ -523,11 +523,13 @@ int __kprobes disasm_next_pc(unsigned long pc, struct pt_regs *regs,
 		*next_pc += instr_d.instr_len;
 	 }
 
+#ifndef CONFIG_ARC_LACKS_ZOL
 	 /* Zero Overhead Loop - end of the loop */
 	if (!(regs->status32 & STATUS32_L) && (*next_pc == regs->lp_end)
 		&& (regs->lp_count > 1)) {
 		*next_pc = regs->lp_start;
 	}
+#endif
 
 	return instr.is_branch;
 }
diff --git a/arch/arc/kernel/intc-arcv2.c b/arch/arc/kernel/intc-arcv2.c
index 5cda19d0aa91..7c1d8b2c4dce 100644
--- a/arch/arc/kernel/intc-arcv2.c
+++ b/arch/arc/kernel/intc-arcv2.c
@@ -48,7 +48,9 @@ void arc_init_IRQ(void)
 #ifndef CONFIG_ARC_IRQ_NO_AUTOSAVE
 	ictrl.save_nr_gpr_pairs = 6;	/* r0 to r11 (r12 saved manually) */
 	ictrl.save_blink = 1;
+#ifndef CONFIG_ARC_LACKS_ZOL
 	ictrl.save_lp_regs = 1;		/* LP_COUNT, LP_START, LP_END */
+#endif
 	ictrl.save_u_to_u = 0;		/* user ctxt saved on kernel stack */
 	ictrl.save_idx_regs = 1;	/* JLI, LDI, EI */
 #endif
diff --git a/arch/arc/kernel/kgdb.c b/arch/arc/kernel/kgdb.c
index 345a0000554c..6f237fdc6e54 100644
--- a/arch/arc/kernel/kgdb.c
+++ b/arch/arc/kernel/kgdb.c
@@ -27,9 +27,11 @@ static void to_gdb_regs(unsigned long *gdb_regs, struct pt_regs *kernel_regs,
 	gdb_regs[_BLINK]	= kernel_regs->blink;
 	gdb_regs[_RET]		= kernel_regs->ret;
 	gdb_regs[_STATUS32]	= kernel_regs->status32;
+#ifndef CONFIG_ARC_LACKS_ZOL
 	gdb_regs[_LP_COUNT]	= kernel_regs->lp_count;
 	gdb_regs[_LP_END]	= kernel_regs->lp_end;
 	gdb_regs[_LP_START]	= kernel_regs->lp_start;
+#endif
 	gdb_regs[_BTA]		= kernel_regs->bta;
 	gdb_regs[_STOP_PC]	= kernel_regs->ret;
 }
@@ -47,9 +49,11 @@ static void from_gdb_regs(unsigned long *gdb_regs, struct pt_regs *kernel_regs,
 	kernel_regs->blink	= gdb_regs[_BLINK];
 	kernel_regs->ret	= gdb_regs[_RET];
 	kernel_regs->status32	= gdb_regs[_STATUS32];
+#ifndef CONFIG_ARC_LACKS_ZOL
 	kernel_regs->lp_count	= gdb_regs[_LP_COUNT];
 	kernel_regs->lp_end	= gdb_regs[_LP_END];
 	kernel_regs->lp_start	= gdb_regs[_LP_START];
+#endif
 	kernel_regs->bta	= gdb_regs[_BTA];
 }
 
diff --git a/arch/arc/kernel/process.c b/arch/arc/kernel/process.c
index 8e90052f6f05..2de60b74d462 100644
--- a/arch/arc/kernel/process.c
+++ b/arch/arc/kernel/process.c
@@ -269,9 +269,11 @@ void start_thread(struct pt_regs *regs, unsigned long pc, unsigned long usp)
 
 	fpu_init_task(regs);
 
+#ifndef CONFIG_ARC_LACKS_ZOL
 	/* bogus seed values for debugging */
 	regs->lp_start = 0x10;
 	regs->lp_end = 0x80;
+#endif
 }
 
 /*
diff --git a/arch/arc/kernel/ptrace.c b/arch/arc/kernel/ptrace.c
index 883391977fdf..d3b98c9749e4 100644
--- a/arch/arc/kernel/ptrace.c
+++ b/arch/arc/kernel/ptrace.c
@@ -26,9 +26,15 @@ static int genregs_get(struct task_struct *target,
 
 	membuf_zero(&to, 4);	// pad
 	membuf_store(&to, ptregs->bta);
+#ifndef CONFIG_ARC_LACKS_ZOL
 	membuf_store(&to, ptregs->lp_start);
 	membuf_store(&to, ptregs->lp_end);
 	membuf_store(&to, ptregs->lp_count);
+#else
+	membuf_zero(&to, 4);	// ptregs->lp_start
+	membuf_zero(&to, 4);	// ptregs->lp_end
+	membuf_zero(&to, 4);	// ptregs->lp_count
+#endif
 	membuf_store(&to, ptregs->status32);
 	membuf_store(&to, ptregs->ret);
 	membuf_store(&to, ptregs->blink);
@@ -107,9 +113,15 @@ static int genregs_set(struct task_struct *target,
 	REG_IGNORE_ONE(pad);
 
 	REG_IN_ONE(scratch.bta, &ptregs->bta);
+#ifndef CONFIG_ARC_LACKS_ZOL
 	REG_IN_ONE(scratch.lp_start, &ptregs->lp_start);
 	REG_IN_ONE(scratch.lp_end, &ptregs->lp_end);
 	REG_IN_ONE(scratch.lp_count, &ptregs->lp_count);
+#else
+	REG_IGNORE_ONE(scratch.lp_start);
+	REG_IGNORE_ONE(scratch.lp_end);
+	REG_IGNORE_ONE(scratch.lp_count);
+#endif
 
 	REG_IGNORE_ONE(scratch.status32);
 
diff --git a/arch/arc/kernel/signal.c b/arch/arc/kernel/signal.c
index cb2f88502baf..449a4b0c6453 100644
--- a/arch/arc/kernel/signal.c
+++ b/arch/arc/kernel/signal.c
@@ -104,9 +104,15 @@ stash_usr_regs(struct rt_sigframe __user *sf, struct pt_regs *regs,
 	struct user_regs_struct uregs;
 
 	uregs.scratch.bta	= regs->bta;
+#ifndef CONFIG_ARC_LACKS_ZOL
 	uregs.scratch.lp_start	= regs->lp_start;
 	uregs.scratch.lp_end	= regs->lp_end;
 	uregs.scratch.lp_count	= regs->lp_count;
+#else
+	uregs.scratch.lp_start	= 0;
+	uregs.scratch.lp_end	= 0;
+	uregs.scratch.lp_count	= 0;
+#endif
 	uregs.scratch.status32	= regs->status32;
 	uregs.scratch.ret	= regs->ret;
 	uregs.scratch.blink	= regs->blink;
@@ -157,9 +163,11 @@ static int restore_usr_regs(struct pt_regs *regs, struct rt_sigframe __user *sf)
 
 	set_current_blocked(&set);
 	regs->bta	= uregs.scratch.bta;
+#ifndef CONFIG_ARC_LACKS_ZOL
 	regs->lp_start	= uregs.scratch.lp_start;
 	regs->lp_end	= uregs.scratch.lp_end;
 	regs->lp_count	= uregs.scratch.lp_count;
+#endif
 	regs->status32	= uregs.scratch.status32;
 	regs->ret	= uregs.scratch.ret;
 	regs->blink	= uregs.scratch.blink;
diff --git a/arch/arc/kernel/troubleshoot.c b/arch/arc/kernel/troubleshoot.c
index 7654c2e42dc0..acb7ee6c024d 100644
--- a/arch/arc/kernel/troubleshoot.c
+++ b/arch/arc/kernel/troubleshoot.c
@@ -22,8 +22,11 @@ static noinline void print_regs_scratch(struct pt_regs *regs)
 {
 	pr_cont("BTA: 0x%08lx\n SP: 0x%08lx  FP: 0x%08lx BLK: %pS\n",
 		regs->bta, regs->sp, regs->fp, (void *)regs->blink);
+
+#ifndef CONFIG_ARC_LACKS_ZOL
 	pr_cont("LPS: 0x%08lx\tLPE: 0x%08lx\tLPC: 0x%08lx\n",
 		regs->lp_start, regs->lp_end, regs->lp_count);
+#endif
 
 	pr_info("r00: 0x%08lx\tr01: 0x%08lx\tr02: 0x%08lx\n"	\
 		"r03: 0x%08lx\tr04: 0x%08lx\tr05: 0x%08lx\n"	\
diff --git a/arch/arc/kernel/unaligned.c b/arch/arc/kernel/unaligned.c
index d63ebd81f1c6..0937441bce04 100644
--- a/arch/arc/kernel/unaligned.c
+++ b/arch/arc/kernel/unaligned.c
@@ -244,11 +244,13 @@ int misaligned_fixup(unsigned long address, struct pt_regs *regs,
 	} else {
 		regs->ret += state.instr_len;
 
+#ifndef CONFIG_ARC_LACKS_ZOL
 		/* handle zero-overhead-loop */
 		if ((regs->ret == regs->lp_end) && (regs->lp_count)) {
 			regs->ret = regs->lp_start;
 			regs->lp_count--;
 		}
+#endif
 	}
 
 	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, address);
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
