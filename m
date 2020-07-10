Return-Path: <SRS0=2YWT=AV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1132BC433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 23:38:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9EED20657
	for <linux-snps-arc@archiver.kernel.org>; Fri, 10 Jul 2020 23:38:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A/6DtGsF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DcX9l2yL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9EED20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=alV9uM9M4Vz77bcMN7ful++Stp2CGEs8teE3ZAhyxgA=; b=A/6DtGsFO0lu6t7t0zDVv02HU
	tSOwDgW8YB7hwU6Beuhs07zR8FJGeX4F5Fo1dpAmPpdREJnRtDfpZjk7Uulux89NN124cLSjPKJbs
	fcyJnyLnKurQQVvUtFR3sGXQjWZz5kmW2eBTMSQXkzYeSxEicd4OauZRLN93mdsOgpgvVaKiWmQig
	bqCwX8atm8ToVkzUvbO7ZElmgKMJpgK79nuK/ZpZxXEtW8qC/0l8gkXEHhE2YhX4U0aH6GOZ5KWhB
	xei5BBO61hSQcDp8GBYpA2FlJ/eEWzpMxqQ2xYWg/GqvYGSdZkETqo2fEooPhuIZ8zHHQ5sIGAXCA
	C10NO7o/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ju2b1-0008Cb-61; Fri, 10 Jul 2020 23:38:23 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ju2au-00088Y-86
 for linux-snps-arc@lists.infradead.org; Fri, 10 Jul 2020 23:38:21 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4D25E40A38;
 Fri, 10 Jul 2020 23:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1594424294; bh=OfGdUP5kYBRDl8S/tXAQUVs4HqFZCacza53+h83Mc1U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DcX9l2yLxDnSF8ZTnYsHyym8bvtOEdbmV/1xgOK8xIUbIY7N6PkKM2+H+uYyvJAZ+
 lyw/6vDiUroLcwzh1A8q1MrXTovWPDYUTBltyqLnXMSCjRrZENHhNQDwbVMkhNPdD/
 B0vLYa1gHTRFeFIwXdmnwocAGeaf8c4iG57FXS8rnOaXs91ePNaiEVD+JQcZg3pPJH
 sxf6Qcp1w9I/QR1xpg3XB4InJM27J6WPdDHPfGQ1lrcFBzOs9WJHu5LKEymg489uzp
 DFCMFFblWTTABpCNLAfVcobvp6xGLjU7ZsWQhPqqiYIVELiLiu8NLtdxSnbGFuqDyw
 WheGPvBTzD5aw==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id B4A87A009D;
 Fri, 10 Jul 2020 23:38:13 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [COMMITTED 03/13] ARC: Thread Local Storage support
Date: Fri, 10 Jul 2020 16:38:00 -0700
Message-Id: <20200710233810.18720-3-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200710233810.18720-1-vgupta@synopsys.com>
References: <20200710233810.18720-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_193816_616268_248B1E70 
X-CRM114-Status: GOOD (  21.19  )
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
 linux-snps-arc@lists.infradead.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This includes all 4 TLS addressing models

Reviewed-by: Adhemerval Zanella  <adhemerval.zanella@linaro.org>
---
 sysdeps/arc/dl-tls.h             |  30 +++++++
 sysdeps/arc/libc-tls.c           |  27 ++++++
 sysdeps/arc/nptl/tcb-offsets.sym |  11 +++
 sysdeps/arc/nptl/tls.h           | 139 +++++++++++++++++++++++++++++++
 sysdeps/arc/stackinfo.h          |  33 ++++++++
 5 files changed, 240 insertions(+)
 create mode 100644 sysdeps/arc/dl-tls.h
 create mode 100644 sysdeps/arc/libc-tls.c
 create mode 100644 sysdeps/arc/nptl/tcb-offsets.sym
 create mode 100644 sysdeps/arc/nptl/tls.h
 create mode 100644 sysdeps/arc/stackinfo.h

diff --git a/sysdeps/arc/dl-tls.h b/sysdeps/arc/dl-tls.h
new file mode 100644
index 000000000000..0f3626d197c9
--- /dev/null
+++ b/sysdeps/arc/dl-tls.h
@@ -0,0 +1,30 @@
+/* Thread-local storage handling in the ELF dynamic linker.  ARC version.
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
+/* Type used for the representation of TLS information in the GOT.  */
+typedef struct
+{
+  unsigned long int ti_module;
+  unsigned long int ti_offset;
+} tls_index;
+
+extern void *__tls_get_addr (tls_index *ti);
+
+/* Value used for dtv entries for which the allocation is delayed.  */
+#define TLS_DTV_UNALLOCATED	((void *) -1l)
diff --git a/sysdeps/arc/libc-tls.c b/sysdeps/arc/libc-tls.c
new file mode 100644
index 000000000000..234932c29512
--- /dev/null
+++ b/sysdeps/arc/libc-tls.c
@@ -0,0 +1,27 @@
+/* Thread-local storage handling in the ELF dynamic linker.  ARC version.
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
+#include <csu/libc-tls.c>
+#include <dl-tls.h>
+
+void *
+__tls_get_addr (tls_index *ti)
+{
+  dtv_t *dtv = THREAD_DTV ();
+  return (char *) dtv[1].pointer.val + ti->ti_offset;
+}
diff --git a/sysdeps/arc/nptl/tcb-offsets.sym b/sysdeps/arc/nptl/tcb-offsets.sym
new file mode 100644
index 000000000000..64c432c22e76
--- /dev/null
+++ b/sysdeps/arc/nptl/tcb-offsets.sym
@@ -0,0 +1,11 @@
+#include <sysdep.h>
+#include <tls.h>
+
+-- Derive offsets relative to the thread register.
+#define thread_offsetof(mem)	(long)(offsetof (struct pthread, mem) - sizeof (struct pthread))
+
+MULTIPLE_THREADS_OFFSET		offsetof (struct pthread, header.multiple_threads)
+TLS_PRE_TCB_SIZE		sizeof (struct pthread)
+TLS_TCB_SIZE            	sizeof (tcbhead_t)
+
+PTHREAD_TID			offsetof (struct pthread, tid)
diff --git a/sysdeps/arc/nptl/tls.h b/sysdeps/arc/nptl/tls.h
new file mode 100644
index 000000000000..184b550ab5c9
--- /dev/null
+++ b/sysdeps/arc/nptl/tls.h
@@ -0,0 +1,139 @@
+/* Definition for thread-local data handling.  NPTL/ARC version.
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
+#ifndef _ARC_NPTL_TLS_H
+#define _ARC_NPTL_TLS_H	1
+
+#include <dl-sysdep.h>
+
+#ifndef __ASSEMBLER__
+
+# include <stdbool.h>
+# include <stddef.h>
+# include <stdint.h>
+
+#include <dl-dtv.h>
+
+/* Get system call information.  */
+# include <sysdep.h>
+
+/* The TLS blocks start right after the TCB.  */
+# define TLS_DTV_AT_TP	1
+# define TLS_TCB_AT_TP	0
+
+/* Get the thread descriptor definition.  */
+# include <nptl/descr.h>
+
+typedef struct
+{
+  dtv_t *dtv;
+  uintptr_t pointer_guard;
+} tcbhead_t;
+
+/* This is the size of the initial TCB.  */
+# define TLS_INIT_TCB_SIZE	sizeof (tcbhead_t)
+
+/* Alignment requirements for the initial TCB.  */
+# define TLS_INIT_TCB_ALIGN	__alignof__ (struct pthread)
+
+/* This is the size of the TCB.  */
+#ifndef TLS_TCB_SIZE
+# define TLS_TCB_SIZE		sizeof (tcbhead_t)
+#endif
+
+/* Alignment requirements for the TCB.  */
+# define TLS_TCB_ALIGN		__alignof__ (struct pthread)
+
+/* This is the size we need before TCB.  */
+# define TLS_PRE_TCB_SIZE	sizeof (struct pthread)
+
+/* Install the dtv pointer.  The pointer passed is to the element with
+   index -1 which contain the length.  */
+# define INSTALL_DTV(tcbp, dtvp) \
+  (((tcbhead_t *) (tcbp))->dtv = (dtvp) + 1)
+
+/* Install new dtv for current thread.  */
+# define INSTALL_NEW_DTV(dtv) \
+  (THREAD_DTV() = (dtv))
+
+/* Return dtv of given thread descriptor.  */
+# define GET_DTV(tcbp) \
+  (((tcbhead_t *) (tcbp))->dtv)
+
+/* Code to initially initialize the thread pointer.  */
+# define TLS_INIT_TP(tcbp)					\
+  ({                                            		\
+	long result_var;					\
+	__builtin_set_thread_pointer (tcbp);     		\
+	result_var = INTERNAL_SYSCALL_CALL (arc_settls, (tcbp));\
+	INTERNAL_SYSCALL_ERROR_P (result_var)			\
+	  ? "settls syscall error" : NULL;			\
+   })
+
+/* Value passed to 'clone' for initialization of the thread register.  */
+# define TLS_DEFINE_INIT_TP(tp, pd) void *tp = (pd) + 1
+
+/* Return the address of the dtv for the current thread.  */
+# define THREAD_DTV() \
+  (((tcbhead_t *) __builtin_thread_pointer ())->dtv)
+
+/* Return the thread descriptor for the current thread.  */
+# define THREAD_SELF \
+ ((struct pthread *)__builtin_thread_pointer () - 1)
+
+/* Magic for libthread_db to know how to do THREAD_SELF.  */
+# define DB_THREAD_SELF \
+  CONST_THREAD_AREA (32, sizeof (struct pthread))
+
+/* Access to data in the thread descriptor is easy.  */
+# define THREAD_GETMEM(descr, member) \
+  descr->member
+# define THREAD_GETMEM_NC(descr, member, idx) \
+  descr->member[idx]
+# define THREAD_SETMEM(descr, member, value) \
+  descr->member = (value)
+# define THREAD_SETMEM_NC(descr, member, idx, value) \
+  descr->member[idx] = (value)
+
+/* Get and set the global scope generation counter in struct pthread.  */
+#define THREAD_GSCOPE_IN_TCB      1
+#define THREAD_GSCOPE_FLAG_UNUSED 0
+#define THREAD_GSCOPE_FLAG_USED   1
+#define THREAD_GSCOPE_FLAG_WAIT   2
+#define THREAD_GSCOPE_RESET_FLAG() \
+  do									     \
+    { int __res								     \
+	= atomic_exchange_rel (&THREAD_SELF->header.gscope_flag,	     \
+			       THREAD_GSCOPE_FLAG_UNUSED);		     \
+      if (__res == THREAD_GSCOPE_FLAG_WAIT)				     \
+	lll_futex_wake (&THREAD_SELF->header.gscope_flag, 1, LLL_PRIVATE);   \
+    }									     \
+  while (0)
+#define THREAD_GSCOPE_SET_FLAG() \
+  do									     \
+    {									     \
+      THREAD_SELF->header.gscope_flag = THREAD_GSCOPE_FLAG_USED;	     \
+      atomic_write_barrier ();						     \
+    }									     \
+  while (0)
+#define THREAD_GSCOPE_WAIT() \
+  GL(dl_wait_lookup_done) ()
+
+#endif /* !__ASSEMBLER__ */
+
+#endif	/* tls.h */
diff --git a/sysdeps/arc/stackinfo.h b/sysdeps/arc/stackinfo.h
new file mode 100644
index 000000000000..02ae1cd8c425
--- /dev/null
+++ b/sysdeps/arc/stackinfo.h
@@ -0,0 +1,33 @@
+/* Stack environment definitions for ARC.
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
+/* This file contains a bit of information about the stack allocation
+   of the processor.  */
+
+#ifndef _STACKINFO_H
+#define _STACKINFO_H	1
+
+#include <elf.h>
+
+/* On ARC the stack grows down.  */
+#define _STACK_GROWS_DOWN	1
+
+/* Default to a non-executable stack.  */
+#define DEFAULT_STACK_PERMS (PF_R|PF_W)
+
+#endif	/* stackinfo.h */
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
