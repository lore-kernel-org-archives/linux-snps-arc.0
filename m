Return-Path: <SRS0=/nRw=AM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5711BC433E1
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Jul 2020 00:06:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E59D820722
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Jul 2020 00:06:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vS4OUONU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="f6DRMiSn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E59D820722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y9Zray4t80hFCzw60A9tAtXvPXF2IVMjA6lQTiJBwOM=; b=vS4OUONUWm5RKTb0iqrxpgjrs
	LfGJwy1dszAMQ8CjOKzts29K1zQDGVVIwU5EKEt71zviDU7luarNGPg2bbzorJ9PGujCPrPbGJ1Ks
	Y36QCQFQ210PCtleo4N3NtQ9hWjycaf3QggyvcDeuUyghY4Z5nfHiV+kxwGfq7dPmKpZdLZwT7bpp
	OZClkq/6I5TqGgGjUcECTKc725Jl0hfl8WEwNYpoD9C0LKy3l8wCirwhz8H5ZbxgD9dEWq54EuUFq
	zpTxlmtcrS1gugPfQP2DanISvgFevCz26Ml5NoDz2dDQtTWtQwH5SU8pc5pzBMFk8vrLF61BJUbhY
	pZlR8yucQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqQHB-00058y-Cp; Wed, 01 Jul 2020 00:06:57 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqQH8-00058J-Io
 for linux-snps-arc@lists.infradead.org; Wed, 01 Jul 2020 00:06:56 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 52775C0098;
 Wed,  1 Jul 2020 00:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1593562012; bh=FNNLGZ0v6mkm+h/FZjDnxRWv9IvIFagff+ylzIWqzHE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f6DRMiSnGU4i2pCTwQ5/CJ52KjZSVs+Oxr5R9Ber7WNKsgxQ9KLyFo5ouLOotBKPM
 Em8cGsQ/MhqLO3BJkiZFb1yr5PQSfRBo8YQZRc8ZxhW7s3loHmAVC+fCevilYzsmGW
 Kz0yXCbVm74wXCoVc1hXLISU6NtlOwBoBp/mON+yJX93mHtTOfgFN/92MK23LHRVH+
 LhTRsZfpiRYh6Xw49gRs7qYvv47AM/z7oJtA1KF6gjlV1bAuGeTxXO8a1kpnQC+fkw
 Y0GssZ8nCAQxyLKXiDG0bB4Aw+ZSaDnWU8m7z7QG6mJvOElPw88XisdIUeP/chOj/u
 qZJnaa1yq5ovg==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 1784EA0096;
 Wed,  1 Jul 2020 00:06:49 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v7.1 01/13] ARC: ABI Implementation
Date: Tue, 30 Jun 2020 17:06:43 -0700
Message-Id: <20200701000643.14065-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200615201441.31820-2-vgupta@synopsys.com>
References: <20200615201441.31820-2-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_200654_923761_7526789D 
X-CRM114-Status: GOOD (  18.80  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This code deals with the ARC ABI.
---
   Changes since v7:
     - Used void * (iso int *) in tls-macros.h
---
 sysdeps/arc/__longjmp.S       | 49 ++++++++++++++++++++++++
 sysdeps/arc/abort-instr.h     |  2 +
 sysdeps/arc/bits/endianness.h | 15 ++++++++
 sysdeps/arc/bits/setjmp.h     | 26 +++++++++++++
 sysdeps/arc/bsd-_setjmp.S     |  1 +
 sysdeps/arc/bsd-setjmp.S      |  1 +
 sysdeps/arc/dl-runtime.h      | 42 ++++++++++++++++++++
 sysdeps/arc/dl-sysdep.h       | 25 ++++++++++++
 sysdeps/arc/dl-trampoline.S   | 72 +++++++++++++++++++++++++++++++++++
 sysdeps/arc/gccframe.h        | 21 ++++++++++
 sysdeps/arc/jmpbuf-offsets.h  | 22 +++++++++++
 sysdeps/arc/jmpbuf-unwind.h   | 47 +++++++++++++++++++++++
 sysdeps/arc/machine-gmon.h    | 35 +++++++++++++++++
 sysdeps/arc/memusage.h        | 23 +++++++++++
 sysdeps/arc/setjmp.S          | 66 ++++++++++++++++++++++++++++++++
 sysdeps/arc/sysdep.h          | 53 ++++++++++++++++++++++++++
 sysdeps/arc/tls-macros.h      | 47 +++++++++++++++++++++++
 17 files changed, 547 insertions(+)
 create mode 100644 sysdeps/arc/__longjmp.S
 create mode 100644 sysdeps/arc/abort-instr.h
 create mode 100644 sysdeps/arc/bits/endianness.h
 create mode 100644 sysdeps/arc/bits/setjmp.h
 create mode 100644 sysdeps/arc/bsd-_setjmp.S
 create mode 100644 sysdeps/arc/bsd-setjmp.S
 create mode 100644 sysdeps/arc/dl-runtime.h
 create mode 100644 sysdeps/arc/dl-sysdep.h
 create mode 100644 sysdeps/arc/dl-trampoline.S
 create mode 100644 sysdeps/arc/gccframe.h
 create mode 100644 sysdeps/arc/jmpbuf-offsets.h
 create mode 100644 sysdeps/arc/jmpbuf-unwind.h
 create mode 100644 sysdeps/arc/machine-gmon.h
 create mode 100644 sysdeps/arc/memusage.h
 create mode 100644 sysdeps/arc/setjmp.S
 create mode 100644 sysdeps/arc/sysdep.h
 create mode 100644 sysdeps/arc/tls-macros.h

diff --git a/sysdeps/arc/__longjmp.S b/sysdeps/arc/__longjmp.S
new file mode 100644
index 000000000000..fcbf1bb6c0e2
--- /dev/null
+++ b/sysdeps/arc/__longjmp.S
@@ -0,0 +1,49 @@
+/* longjmp for ARC.
+   Copyright (C) 2020 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public License as
+   published by the Free Software Foundation; either version 2.1 of the
+   License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <https://www.gnu.org/licenses/>.  */
+
+#include <sysdep.h>
+#include <jmpbuf-offsets.h>
+
+/* @ r0 = jump buffer from which regs will be restored
+   @ r1 = value that setjmp( ) will return due to this longjmp.  */
+
+ENTRY (__longjmp)
+
+	LDR (blink, r0,  0)
+	LDR (sp,    r0,  1)
+	LDR (fp,    r0,  2)
+	LDR (gp,    r0,  3)
+
+	LDR (r13,   r0,  4)
+	LDR (r14,   r0,  5)
+	LDR (r15,   r0,  6)
+	LDR (r16,   r0,  7)
+	LDR (r17,   r0,  8)
+	LDR (r18,   r0,  9)
+	LDR (r19,   r0, 10)
+	LDR (r20,   r0, 11)
+	LDR (r21,   r0, 12)
+	LDR (r22,   r0, 13)
+	LDR (r23,   r0, 14)
+	LDR (r24,   r0, 15)
+
+	mov.f  r0, r1
+	j.d    [blink]
+	mov.z  r0, 1	/* don't return 0 to setjmp callsite from longjmp.  */
+
+END (__longjmp)
diff --git a/sysdeps/arc/abort-instr.h b/sysdeps/arc/abort-instr.h
new file mode 100644
index 000000000000..49f33613c404
--- /dev/null
+++ b/sysdeps/arc/abort-instr.h
@@ -0,0 +1,2 @@
+/* FLAG 1 is privilege mode only instruction, hence will crash any program.  */
+#define ABORT_INSTRUCTION asm ("flag 1")
diff --git a/sysdeps/arc/bits/endianness.h b/sysdeps/arc/bits/endianness.h
new file mode 100644
index 000000000000..8f17ca84b485
--- /dev/null
+++ b/sysdeps/arc/bits/endianness.h
@@ -0,0 +1,15 @@
+#ifndef _BITS_ENDIANNESS_H
+#define _BITS_ENDIANNESS_H 1
+
+#ifndef _BITS_ENDIAN_H
+# error "Never use <bits/endian.h> directly; include <endian.h> instead."
+#endif
+
+/* ARC has selectable endianness.  */
+#ifdef __BIG_ENDIAN__
+# define __BYTE_ORDER __BIG_ENDIAN
+#else
+# define __BYTE_ORDER __LITTLE_ENDIAN
+#endif
+
+#endif /* bits/endianness.h */
diff --git a/sysdeps/arc/bits/setjmp.h b/sysdeps/arc/bits/setjmp.h
new file mode 100644
index 000000000000..6bba95fafe0f
--- /dev/null
+++ b/sysdeps/arc/bits/setjmp.h
@@ -0,0 +1,26 @@
+/* Define the machine-dependent type `jmp_buf'.  ARC version.
+   Copyright (C) 2020 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <https://www.gnu.org/licenses/>.  */
+
+#ifndef _ARC_BITS_SETJMP_H
+#define _ARC_BITS_SETJMP_H 1
+
+/* Saves r13-r25 (callee-saved), fp (frame pointer), sp (stack pointer),
+   blink (branch-n-link).  */
+typedef long int __jmp_buf[32];
+
+#endif
diff --git a/sysdeps/arc/bsd-_setjmp.S b/sysdeps/arc/bsd-_setjmp.S
new file mode 100644
index 000000000000..90b99cd8c3e0
--- /dev/null
+++ b/sysdeps/arc/bsd-_setjmp.S
@@ -0,0 +1 @@
+/* _setjmp is in setjmp.S.  */
diff --git a/sysdeps/arc/bsd-setjmp.S b/sysdeps/arc/bsd-setjmp.S
new file mode 100644
index 000000000000..d3b823c118bc
--- /dev/null
+++ b/sysdeps/arc/bsd-setjmp.S
@@ -0,0 +1 @@
+/* setjmp is in setjmp.S.  */
diff --git a/sysdeps/arc/dl-runtime.h b/sysdeps/arc/dl-runtime.h
new file mode 100644
index 000000000000..833e72c7385b
--- /dev/null
+++ b/sysdeps/arc/dl-runtime.h
@@ -0,0 +1,42 @@
+/* Helpers for On-demand PLT fixup for shared objects.  ARC version.
+   Copyright (C) 2020 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public License as
+   published by the Free Software Foundation; either version 2.1 of the
+   License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <https://www.gnu.org/licenses/>.  */
+
+/* PLT jump into resolver passes PC of PLTn, while _dl_fixup expects the
+   address of corresponding .rela.plt entry.
+
+    - @plt0: runtime pc of first plt entry (DT_PLTGOT)
+    - @pltn: runtime pc of plt entry being resolved
+    - @size: size of .plt.rela entry (unused).  */
+static inline uintptr_t
+reloc_index (uintptr_t plt0, uintptr_t pltn, size_t size)
+{
+  unsigned long int idx = pltn - plt0;
+
+  /* PLT trampoline is 16 bytes. */
+  idx /= 16;
+
+  /* Exclude PLT0 and PLT1.  */
+  return idx - 2;
+}
+
+static inline uintptr_t
+reloc_offset (uintptr_t plt0, uintptr_t pltn)
+{
+  size_t sz = sizeof (ElfW(Rela));
+  return reloc_index (plt0, pltn, sz) * sz;
+}
diff --git a/sysdeps/arc/dl-sysdep.h b/sysdeps/arc/dl-sysdep.h
new file mode 100644
index 000000000000..aefec2ba056a
--- /dev/null
+++ b/sysdeps/arc/dl-sysdep.h
@@ -0,0 +1,25 @@
+/* System-specific settings for dynamic linker code.  ARC version.
+   Copyright (C) 2020 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <https://www.gnu.org/licenses/>.  */
+
+#include_next <dl-sysdep.h>
+
+/* _dl_argv cannot be attribute_relro, because _dl_start_user
+   might write into it after _dl_start returns.  */
+#define DL_ARGV_NOT_RELRO 1
+
+#define DL_EXTERN_PROTECTED_DATA
diff --git a/sysdeps/arc/dl-trampoline.S b/sysdeps/arc/dl-trampoline.S
new file mode 100644
index 000000000000..eb2a030046d6
--- /dev/null
+++ b/sysdeps/arc/dl-trampoline.S
@@ -0,0 +1,72 @@
+/* PLT trampolines.  ARC version.
+   Copyright (C) 2020 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <https://www.gnu.org/licenses/>.  */
+
+#include <sysdep.h>
+#include <libc-symbols.h>
+
+#include <sysdep.h>
+#include <sys/syscall.h>
+
+/* resolver has atypical calling ABI (r11 and r12)
+        PLTn which lands us here, sets up
+	r11 = Module info (tpnt pointer as expected by resolver)
+	r12 = PC of the PLTn itself - needed by resolver to find
+	      corresponding .rela.plt entry.  */
+
+ENTRY (_dl_runtime_resolve)
+
+	/* save args to func being resolved before entering resolver.  */
+	push_s	r0
+	push_s	r1
+	push_s	r2
+	push_s	r3
+	st.a	r4, [sp, -4]
+	st.a	r5, [sp, -4]
+	st.a	r6, [sp, -4]
+	st.a	r7, [sp, -4]
+	st.a	r8, [sp, -4]
+	st.a	r9, [sp, -4]
+	cfi_adjust_cfa_offset (40)
+	push_s	blink
+	cfi_adjust_cfa_offset (4)
+	cfi_rel_offset (blink, 0)
+
+	mov_s 	r1, r12
+	bl.d  	_dl_fixup
+	mov   	r0, r11
+
+	/* restore regs back.  */
+	ld.ab	blink,[sp, 4]
+	cfi_adjust_cfa_offset (-4)
+	cfi_restore (blink)
+	ld.ab	r9, [sp, 4]
+	ld.ab	r8, [sp, 4]
+	ld.ab	r7, [sp, 4]
+	ld.ab	r6, [sp, 4]
+	ld.ab	r5, [sp, 4]
+	ld.ab	r4, [sp, 4]
+	pop_s   r3
+	pop_s   r2
+	pop_s   r1
+	cfi_adjust_cfa_offset (-36)
+
+	j_s.d   [r0]    /* r0 has resolved function addr.  */
+	pop_s   r0      /* restore first arg to resolved call.  */
+	cfi_adjust_cfa_offset (-4)
+	cfi_restore (r0)
+END (_dl_runtime_resolve)
diff --git a/sysdeps/arc/gccframe.h b/sysdeps/arc/gccframe.h
new file mode 100644
index 000000000000..296857ba9ccc
--- /dev/null
+++ b/sysdeps/arc/gccframe.h
@@ -0,0 +1,21 @@
+/* Definition of object in frame unwind info.  ARC version.
+   Copyright (C) 2020 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <https://www.gnu.org/licenses/>.  */
+
+#define FIRST_PSEUDO_REGISTER 40
+
+#include <sysdeps/generic/gccframe.h>
diff --git a/sysdeps/arc/jmpbuf-offsets.h b/sysdeps/arc/jmpbuf-offsets.h
new file mode 100644
index 000000000000..e7551cad3b47
--- /dev/null
+++ b/sysdeps/arc/jmpbuf-offsets.h
@@ -0,0 +1,22 @@
+/* Private macros for accessing __jmp_buf contents.  ARC version.
+   Copyright (C) 2020 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <https://www.gnu.org/licenses/>.  */
+
+#define JB_SP	1
+
+/* Helper for generic ____longjmp_chk.  */
+#define JB_FRAME_ADDRESS(buf) ((void *) (unsigned long int) (buf[JB_SP]))
diff --git a/sysdeps/arc/jmpbuf-unwind.h b/sysdeps/arc/jmpbuf-unwind.h
new file mode 100644
index 000000000000..697d3e2ee5e5
--- /dev/null
+++ b/sysdeps/arc/jmpbuf-unwind.h
@@ -0,0 +1,47 @@
+/* Examine __jmp_buf for unwinding frames.  ARC version.
+   Copyright (C) 2020 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <https://www.gnu.org/licenses/>.  */
+
+#include <setjmp.h>
+#include <jmpbuf-offsets.h>
+#include <stdint.h>
+#include <unwind.h>
+
+/* Test if longjmp to JMPBUF would unwind the frame
+   containing a local variable at ADDRESS.  */
+
+#define _JMPBUF_UNWINDS(jmpbuf, address, demangle) \
+  ((void *) (address) < (void *) demangle (jmpbuf[JB_SP]))
+
+#define _JMPBUF_CFA_UNWINDS_ADJ(_jmpbuf, _context, _adj) \
+  _JMPBUF_UNWINDS_ADJ (_jmpbuf, (void *) _Unwind_GetCFA (_context), _adj)
+
+static inline uintptr_t __attribute__ ((unused))
+_jmpbuf_sp (__jmp_buf jmpbuf)
+{
+  uintptr_t sp = jmpbuf[JB_SP];
+#ifdef PTR_DEMANGLE
+  PTR_DEMANGLE (sp);
+#endif
+  return sp;
+}
+
+#define _JMPBUF_UNWINDS_ADJ(_jmpbuf, _address, _adj) \
+  ((uintptr_t) (_address) - (_adj) < (uintptr_t) (_jmpbuf_sp (_jmpbuf) - (_adj)))
+
+/* We use the normal longjmp for unwinding.  */
+#define __libc_unwind_longjmp(buf, val) __libc_longjmp (buf, val)
diff --git a/sysdeps/arc/machine-gmon.h b/sysdeps/arc/machine-gmon.h
new file mode 100644
index 000000000000..a0d4e95a945d
--- /dev/null
+++ b/sysdeps/arc/machine-gmon.h
@@ -0,0 +1,35 @@
+/* Machine-dependent definitions for profiling support.  ARC version.
+   Copyright (C) 2020 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <https://www.gnu.org/licenses/>.  */
+
+#include <sysdep.h>
+
+#define _MCOUNT_DECL(frompc, selfpc)					\
+static void								\
+__mcount_internal (unsigned long int frompc, unsigned long int selfpc)
+
+/* This is very simple as gcc does all the heavy lifting at _mcount call site
+    - sets up caller's blink in r0, so frompc is setup correctly
+    - preserve argument registers for original call.  */
+
+#define MCOUNT								\
+void									\
+_mcount (void *frompc)							\
+{									\
+  __mcount_internal ((unsigned long int) frompc,			\
+		     (unsigned long int) __builtin_return_address (0));	\
+}
diff --git a/sysdeps/arc/memusage.h b/sysdeps/arc/memusage.h
new file mode 100644
index 000000000000..724bc4de1312
--- /dev/null
+++ b/sysdeps/arc/memusage.h
@@ -0,0 +1,23 @@
+/* Machine-specific definitions for memory usage profiling, ARC version.
+   Copyright (C) 2020 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <https://www.gnu.org/licenses/>.  */
+
+#define GETSP() ({ register uintptr_t stack_ptr asm ("sp"); stack_ptr; })
+
+#define uatomic32_t unsigned int
+
+#include <sysdeps/generic/memusage.h>
diff --git a/sysdeps/arc/setjmp.S b/sysdeps/arc/setjmp.S
new file mode 100644
index 000000000000..01cc3af98237
--- /dev/null
+++ b/sysdeps/arc/setjmp.S
@@ -0,0 +1,66 @@
+/* setjmp for ARC.
+   Copyright (C) 2020 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <https://www.gnu.org/licenses/>.  */
+
+
+#include <sysdep.h>
+
+/* Upon entry r0 = jump buffer into which regs will be saved.  */
+ENTRY (setjmp)
+	b.d	__sigsetjmp
+	mov	r1, 1		/* save signals.  */
+END (setjmp)
+
+/* Upon entry r0 = jump buffer into which regs will be saved.  */
+ENTRY (_setjmp)
+	b.d	__sigsetjmp
+	mov	r1, 0		/* don't save signals.  */
+END (_setjmp)
+libc_hidden_def (_setjmp)
+
+/* Upon entry
+   r0 = jump buffer into which regs will be saved
+   r1 = do we need to save signals.  */
+ENTRY (__sigsetjmp)
+
+	/* Make a note of where longjmp will return to.
+	   that will be right next to this setjmp call-site in BLINK
+	   since "C" caller of this routine will do a branch-n-link.  */
+
+	STR (blink, r0,  0)
+	STR (sp,    r0,  1)
+	STR (fp,    r0,  2)
+	STR (gp,    r0,  3)
+
+	STR (r13,   r0,  4)
+	STR (r14,   r0,  5)
+	STR (r15,   r0,  6)
+	STR (r16,   r0,  7)
+	STR (r17,   r0,  8)
+	STR (r18,   r0,  9)
+	STR (r19,   r0, 10)
+	STR (r20,   r0, 11)
+	STR (r21,   r0, 12)
+	STR (r22,   r0, 13)
+	STR (r23,   r0, 14)
+	STR (r24,   r0, 15)
+
+	b    __sigjmp_save
+
+END (__sigsetjmp)
+
+libc_hidden_def (__sigsetjmp)
diff --git a/sysdeps/arc/sysdep.h b/sysdeps/arc/sysdep.h
new file mode 100644
index 000000000000..9ac295bdf35b
--- /dev/null
+++ b/sysdeps/arc/sysdep.h
@@ -0,0 +1,53 @@
+/* Assembler macros for ARC.
+   Copyright (C) 2020 Free Software Foundation, Inc.
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public License as
+   published by the Free Software Foundation; either version 2.1 of the
+   License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library; if not, see
+   <https://www.gnu.org/licenses/>.  */
+
+#include <sysdeps/generic/sysdep.h>
+
+#ifdef	__ASSEMBLER__
+
+/* Syntactic details of assembler.
+   ; is not newline but comment, # is also for comment.  */
+# define ASM_SIZE_DIRECTIVE(name) .size name,.-name
+
+# define ENTRY(name)						\
+	.align 4				ASM_LINE_SEP	\
+	.globl C_SYMBOL_NAME(name)		ASM_LINE_SEP	\
+	.type C_SYMBOL_NAME(name),%function	ASM_LINE_SEP	\
+	C_LABEL(name)				ASM_LINE_SEP	\
+	cfi_startproc				ASM_LINE_SEP	\
+	CALL_MCOUNT
+
+# undef  END
+# define END(name)						\
+	cfi_endproc				ASM_LINE_SEP	\
+	ASM_SIZE_DIRECTIVE(name)
+
+# ifdef SHARED
+#  define PLTJMP(_x)	_x##@plt
+# else
+#  define PLTJMP(_x)	_x
+# endif
+
+# define L(label) .L##label
+
+# define CALL_MCOUNT		/* Do nothing for now.  */
+
+# define STR(reg, rbase, off)	st  reg, [rbase, off * 4]
+# define LDR(reg, rbase, off)	ld  reg, [rbase, off * 4]
+
+#endif	/* __ASSEMBLER__ */
diff --git a/sysdeps/arc/tls-macros.h b/sysdeps/arc/tls-macros.h
new file mode 100644
index 000000000000..7a076182b977
--- /dev/null
+++ b/sysdeps/arc/tls-macros.h
@@ -0,0 +1,47 @@
+/* Macros to support TLS testing in times of missing compiler support.  ARC version.
+   Copyright (C) 2020 Free Software Foundation, Inc.
+
+   This file is part of the GNU C Library.
+
+   The GNU C Library is free software; you can redistribute it and/or
+   modify it under the terms of the GNU Lesser General Public
+   License as published by the Free Software Foundation; either
+   version 2.1 of the License, or (at your option) any later version.
+
+   The GNU C Library is distributed in the hope that it will be useful,
+   but WITHOUT ANY WARRANTY; without even the implied warranty of
+   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+   Lesser General Public License for more details.
+
+   You should have received a copy of the GNU Lesser General Public
+   License along with the GNU C Library.  If not, see
+   <https://www.gnu.org/licenses/>.  */
+
+
+/* For now.  */
+#define TLS_LD(x)	TLS_IE(x)
+
+#define TLS_GD(x)					\
+  ({ void *__result;					\
+     __asm__ ("add r0, pcl, @" #x "@tlsgd      \n"     	\
+	  ".tls_gd_ld " #x "`bl __tls_get_addr@plt \n"	\
+	  "mov %0, r0                    \n"		\
+	  : "=&r" (__result)				\
+	  ::"r0","r1","r2","r3","r4","r5","r6","r7",	\
+	    "r8","r9","r10","r11","r12");		\
+     __result; })
+
+#define TLS_LE(x)					\
+  ({ void *__result;					\
+     void *tp = __builtin_thread_pointer ();		\
+     __asm__ ("add %0, %1, @" #x "@tpoff   \n"		\
+	  : "=r" (__result) : "r"(tp));	        	\
+     __result; })
+
+#define TLS_IE(x)					\
+  ({ void *__result;					\
+     void *tp = __builtin_thread_pointer ();		\
+     __asm__ ("ld %0, [pcl, @" #x "@tlsie]      \n"     \
+	  "add %0, %1, %0                       \n"	\
+	  : "=&r" (__result) : "r" (tp));		\
+     __result; })
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
