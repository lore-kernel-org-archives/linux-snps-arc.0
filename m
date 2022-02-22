Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E860C433FE
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Feb 2022 14:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7IZx37LfED5pBXTw/aGsatU/2MeHDE4qwiIQ5U0DjPk=; b=PW4NNuqw2bj5H3
	JFJSTpbSdq6jaq/59qIQO7e8IfKp3qtHCv2/EPHNioKhNkjrlX+1cuTnMCR6JQYoCADEMeMCoSKKi
	R/u6M6WWyp5cV1Jqc2qwZPv8eLwobBTGDHtaC7pssD3fCeJquLYPjxTJp8Xxght3ff8c12CihuXp/
	9/WPdCEFsc6kv7YiSZ6RkYO9XLKNd33DgwOg/n2xYYKuU+vNis3W0FMZmKByPqYJZCci8zsLhLdoa
	EyxDKeV8JmB2sOaRlTim6NPkfVZdBPVxHZ1dEb4FJm+9izmzrm2MtzTRE5R0P7ihIgKeW2mbxjS1E
	U5AiIN7iIFU6JK0p163A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMVwt-009qX0-De; Tue, 22 Feb 2022 14:15:27 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMVwn-009qPI-Lf
 for linux-snps-arc@lists.infradead.org; Tue, 22 Feb 2022 14:15:24 +0000
Received: by mail-lf1-x12f.google.com with SMTP id i11so25115849lfu.3
 for <linux-snps-arc@lists.infradead.org>; Tue, 22 Feb 2022 06:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vcErj78EOWMUmzjRArv6a5/k8YE5logSV0xqhR9DrSY=;
 b=qDHta80g+2VRNv89MZYdwVpGSOCdj5qKus3NiKbci9Egy0qwJBb5N1ubWZOC9Bz7mB
 84g97WDvQb476qHda/YBTlPmI3AYlf+LEI0GmJutWvMX6AvExbrZ0L0Lq/kHgQt/EbaX
 Nr+OlqUaACJUAnMiiDacGWgkyZmz2x4+9lPpEysPY6y3mAFOa40LWpFLAwfYT/3zeYGm
 XVrbLKhPU3C898Sy5Wt52h/MqdtqU6tKo52ATf6gELOYWJJxMO2SWGARlCA6R6L6WlzN
 1dwvt6oVPOAwEeK+3xZ4e0TnMQo1oUTBmaMJ5BOqJqjfat6R75zgUSnWD4FDZUSLIpYF
 Jpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vcErj78EOWMUmzjRArv6a5/k8YE5logSV0xqhR9DrSY=;
 b=izA8MyRPqvys6Ko6woOXOy7rBJ18VSrcZK4ZtsP+g3kNOAcQtmg+PG7VVrgQucI1AP
 fruZRmuR/p22DEobqDgf/BTU9uKPx/id9zDBBk0WX+tDNJGhl2flD9aA+TW0KtmTAGF4
 8ck8/A9pdczGMJc86Sm31fmfi+q08srq0xDVqXIT11+DkaAm45si+lAU0vxNALooVYFQ
 K9NfcIIN8qseJTqE1XIMp6zSG6wcf2odstbNpnJyMDZUVDYn9YlOVrvAyPo4O/HDSwze
 4YOIOPCkQD6b10MiIoENREjP7cDbUL0GDWiOvw4SAbWkuSJHoqgnaaLjYpdKtR3FcXWj
 lDOw==
X-Gm-Message-State: AOAM531MLS8yK8b1wvV0KRahPAObQMO4E+MgnZBG9LPoZzXi8B86JUc8
 FSCoE+cFjq07BHVRxP6hg2gnkBoAsWU=
X-Google-Smtp-Source: ABdhPJx5ibluK5rMv1C3y9uhXIRzmoEbzIR7Rd3t+LxidLWvF1uA79WzPRYihHBH+azU5Oq8kLn0vQ==
X-Received: by 2002:ac2:57cf:0:b0:439:94e:7c4a with SMTP id
 k15-20020ac257cf000000b00439094e7c4amr17364274lfo.23.1645539319343; 
 Tue, 22 Feb 2022 06:15:19 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id m8sm1707047ljb.131.2022.02.22.06.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:15:19 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [RFC PATCH 04/13] ARC: uaccess: elide ZOL, use double load/stores
Date: Tue, 22 Feb 2022 17:14:57 +0300
Message-Id: <20220222141506.4003433-5-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222141506.4003433-1-geomatsi@gmail.com>
References: <20220222141506.4003433-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_061521_800760_AB0AC218 
X-CRM114-Status: GOOD (  19.82  )
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

Upcoming ARCv3 lacks ZOL support, so provide alternative
uaccess implementations based on 64-bit memory operations.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/asm-macro-ll64-emul.h |  28 ++++
 arch/arc/include/asm/asm-macro-ll64.h      |  20 +++
 arch/arc/include/asm/assembler.h           |  12 ++
 arch/arc/include/asm/uaccess.h             |  12 ++
 arch/arc/lib/Makefile                      |   2 +
 arch/arc/lib/uaccess.S                     | 144 +++++++++++++++++++++
 6 files changed, 218 insertions(+)
 create mode 100644 arch/arc/include/asm/asm-macro-ll64-emul.h
 create mode 100644 arch/arc/include/asm/asm-macro-ll64.h
 create mode 100644 arch/arc/lib/uaccess.S

diff --git a/arch/arc/include/asm/asm-macro-ll64-emul.h b/arch/arc/include/asm/asm-macro-ll64-emul.h
new file mode 100644
index 000000000000..886320cc74ad
--- /dev/null
+++ b/arch/arc/include/asm/asm-macro-ll64-emul.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ * Abstraction for 64-bit load/store:
+ *   - Emulate 64-bit access with two 32-bit load/stores.
+ *   - In the non-emulated case, output register pair r<N>:r<N+1>
+ *     so macro takes only 1 output arg and determines the 2nd.
+ */
+
+.macro ST64.ab d, s, incr
+	st.ab	\d, [\s, \incr / 2]
+	.ifeqs	"\d", "r4"
+		st.ab	r5, [\s, \incr / 2]
+	.endif
+	.ifeqs	"\d", "r6"
+		st.ab	r7, [\s, \incr / 2]
+	.endif
+.endm
+
+.macro LD64.ab d, s, incr
+	ld.ab	\d, [\s, \incr / 2]
+	.ifeqs	"\d", "r4"
+		ld.ab	r5, [\s, \incr / 2]
+	.endif
+	.ifeqs	"\d", "r6"
+		ld.ab	r7, [\s, \incr / 2]
+	.endif
+.endm
diff --git a/arch/arc/include/asm/asm-macro-ll64.h b/arch/arc/include/asm/asm-macro-ll64.h
new file mode 100644
index 000000000000..89e05c923a26
--- /dev/null
+++ b/arch/arc/include/asm/asm-macro-ll64.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ * Abstraction for 64-bit load/store:
+ *   - Single instruction to double load/store
+ *   - output register pair r<N>:r<N+1> but only
+ *     first register needs to be specified
+ */
+
+.irp xx,,.ab
+.macro ST64\xx d, s, off=0
+	std\xx	\d, [\s, \off]
+.endm
+.endr
+
+.irp xx,,.ab
+.macro LD64\xx d, s, off=0
+	ldd\xx	\d, [\s, \off]
+.endm
+.endr
diff --git a/arch/arc/include/asm/assembler.h b/arch/arc/include/asm/assembler.h
index 426488ef27d4..1d69390c22ba 100644
--- a/arch/arc/include/asm/assembler.h
+++ b/arch/arc/include/asm/assembler.h
@@ -5,6 +5,12 @@
 
 #ifdef __ASSEMBLY__
 
+#ifdef CONFIG_ARC_HAS_LL64
+#include <asm/asm-macro-ll64.h>
+#else
+#include <asm/asm-macro-ll64-emul.h>
+#endif
+
 #ifdef CONFIG_ARC_LACKS_ZOL
 #include <asm/asm-macro-dbnz.h>
 #else
@@ -13,6 +19,12 @@
 
 #else	/* !__ASSEMBLY__ */
 
+#ifdef CONFIG_ARC_HAS_LL64
+asm(".include \"asm/asm-macro-ll64.h\"\n");
+#else
+asm(".include \"asm/asm-macro-ll64-emul.h\"\n");
+#endif
+
 /*
  * ARCv2 cores have both LPcc and DBNZ instructions (starting 3.5a release).
  * But in this context, LP present implies DBNZ not available (ARCompact ISA)
diff --git a/arch/arc/include/asm/uaccess.h b/arch/arc/include/asm/uaccess.h
index 9b009e64e79c..f5b97d977c1b 100644
--- a/arch/arc/include/asm/uaccess.h
+++ b/arch/arc/include/asm/uaccess.h
@@ -163,6 +163,7 @@
 	: "+r" (ret)				\
 	: "r" (src), "r" (dst), "ir" (-EFAULT))
 
+#ifndef CONFIG_ARC_LACKS_ZOL
 
 static inline unsigned long
 raw_copy_from_user(void *to, const void __user *from, unsigned long n)
@@ -660,6 +661,17 @@ static inline unsigned long __clear_user(void __user *to, unsigned long n)
 #define INLINE_COPY_TO_USER
 #define INLINE_COPY_FROM_USER
 
+#else
+
+extern unsigned long raw_copy_from_user(void *to, const void __user *from,
+					  unsigned long n);
+extern unsigned long raw_copy_to_user(void *to, const void __user *from,
+					unsigned long n);
+
+extern unsigned long __clear_user(void __user *to, unsigned long n);
+
+#endif
+
 #define __clear_user		__clear_user
 
 #include <asm/segment.h>
diff --git a/arch/arc/lib/Makefile b/arch/arc/lib/Makefile
index 30158ae69fd4..87d18f5013dc 100644
--- a/arch/arc/lib/Makefile
+++ b/arch/arc/lib/Makefile
@@ -13,3 +13,5 @@ lib-$(CONFIG_ISA_ARCV2)		+=memcpy-archs-unaligned.o
 else
 lib-$(CONFIG_ISA_ARCV2)		+=memcpy-archs.o
 endif
+
+lib-$(CONFIG_ARC_LACKS_ZOL)	+= uaccess.o
diff --git a/arch/arc/lib/uaccess.S b/arch/arc/lib/uaccess.S
new file mode 100644
index 000000000000..5093160a72d3
--- /dev/null
+++ b/arch/arc/lib/uaccess.S
@@ -0,0 +1,144 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * uaccess for ARCv3: avoids ZOL, uses 64-bit memory ops
+ *   ASSUMES unaligned access
+ */
+
+#include <linux/linkage.h>
+#include <asm/assembler.h>
+
+#ifndef CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS
+#error "Unaligned access support needed"
+#endif
+
+; Input
+;  - r0: dest, kernel
+;  - r1: src, user
+;  - r2: sz
+; Output
+;  - r0: Num bytes left to copy, 0 on success
+
+ENTRY_CFI(raw_copy_from_user)
+
+	add    r8, r0, r2
+
+	lsr.f  r3, r2, 4
+	bz     .L1dobytes
+
+	; chunks of 16 bytes
+10:	LD64.ab r4, r1, 8
+11:	LD64.ab r6, r1, 8
+	ST64.ab r4, r0, 8
+	ST64.ab r6, r0, 8
+	DBNZR  r3, 10b
+
+.L1dobytes:
+	; last 1-15 bytes
+	and.f  r3, r2, 0xf
+	bz     .L1done
+
+12:	ldb.ab r4, [r1, 1]
+	stb.ab r4, [r0, 1]
+	DBNZR  r3, 12b
+
+.L1done:
+	; bytes not copied = orig_src + sz - curr_src
+	j.d    [blink]
+	sub    r0, r8, r0
+END_CFI(raw_copy_from_user)
+
+.section __ex_table, "a"
+	.word 10b, .L1done
+	.word 11b, .L1done
+	.word 12b, .L1done
+.previous
+
+; Input
+;  - r0: dest, user
+;  - r1: src, kernel
+;  - r2: sz
+; Output
+;  - r0: Num bytes left to copy, 0 on success
+
+ENTRY_CFI(raw_copy_to_user)
+
+	add    r8, r1, r2
+
+	lsr.f  r3, r2, 4
+	bz     .L2dobytes
+
+	; chunks of 16 bytes
+2:	LD64.ab r4, r1, 8
+	LD64.ab r6, r1, 8
+20:	ST64.ab r4, r0, 8
+21:	ST64.ab r6, r0, 8
+	DBNZR  r3, 2b
+
+.L2dobytes:
+	; last 1-15 bytes
+	and.f  r3, r2, 0xf
+	bz     .L2done
+
+2:	ldb.ab r4, [r1, 1]
+22:	stb.ab r4, [r0, 1]
+	DBNZR  r3, 2b
+
+.L2done:
+	; bytes not copied = orig_src + sz - curr_src
+	j.d    [blink]
+	sub    r0, r8, r1
+
+END_CFI(raw_copy_to_user)
+
+.section __ex_table, "a"
+	.word 20b, .L2done
+	.word 21b, .L2done
+	.word 22b, .L2done
+.previous
+
+ENTRY_CFI(__clear_user)
+	add    r8, r0, r1
+
+	mov    r4, 0
+	mov    r5, 0
+
+	lsr.f  r3, r1, 4
+	bz     .L3dobytes
+
+	; chunks of 16 bytes
+30:	ST64.ab r4, r0, 8
+31:	ST64.ab r4, r0, 8
+	DBNZR  r3, 30b
+
+.L3dobytes:
+	; last 1-15 bytes
+	and.f  r3, r1, 0xf
+	bz     .L3done
+
+32:	stb.ab r4, [r0, 1]
+	DBNZR  r3, 32b
+
+.L3done:
+	; bytes not copied = orig_src + sz - curr_src
+	j.d    [blink]
+	sub    r0, r8, r0
+
+END_CFI(__clear_user)
+
+; Note that .fixup section is missing and that is not an omission
+;
+; .fixup is a level of indirection for user fault handling to do some extra work
+; before jumping off to a safe instruction (past the faulting LD/ST) in uaccess
+; code. This could be say setting up -EFAULT in return register for caller.
+; But if that is not needed (such as above where number of bytes copied/not-copied
+; is already in return reg r0) and fault handler only needs to resume to a valid PC
+; that label could be placed in __ex_table entry (otherwise be in .fixup)
+; do_page_fault() -> fixup_exception() use that to setup pt_regs->ret, which the
+; CPU exception handler resumes to. This also makes the handling more efficient
+; by removing a level of indirection.
+
+.section __ex_table, "a"
+	.word 30b, .L3done
+	.word 31b, .L3done
+	.word 32b, .L3done
+.previous
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
