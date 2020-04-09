Return-Path: <SRS0=Kc19=5Z=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AF7C2BB1D
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Apr 2020 02:56:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F35E520757
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Apr 2020 02:56:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bQArgKCc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="i333LtH1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F35E520757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0kDzfP4DG6PC8EpIbrjmhhgpiKQRyYmCSnirYTQBoT0=; b=bQArgKCcbaC8Wr
	jfoQtz/MagMg0ln0jCjwIfvSk2NKyIq+EMuLPQ3V/2aRxAlRrwymY5401o4aul30zTqd4n/HrpluL
	u5v0SlbPTvGJh9kYLAwrhYHzXI2en+rxs1ZSKoPVih9x5MRvo+vLE2zl3gn9sSlb0z2gFIdTS7cOJ
	chyJHAxed6cwq85+Ie2bBFGNe80RAbH7rnrhb5yz+UgkUPdQ9ljMPyHc0q7T5Q3DJ0K0mmFtcDDLH
	Ne+Zvf/7+M5PYnAfGEUyXLCWUopAG7X0cIr+Qtl/Ps8fZwieB9PGfahn3wdvKMNlRJ79tQ/ELyjTz
	wlKFuHZ1oyhsxBTpR5UA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMNMs-0005aS-8r; Thu, 09 Apr 2020 02:56:38 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMNMn-0005Wh-4i
 for linux-snps-arc@lists.infradead.org; Thu, 09 Apr 2020 02:56:36 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B89E7406A1;
 Thu,  9 Apr 2020 02:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586400992; bh=aypvYEQyWKudZF3h1xRJ4DVhfYw0cD1cRprf5dDEl2A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i333LtH19uHQ25P42N5MSlkbX5Ru+P9qITIIbILjR/39I8qx/OWg2hMOKyH0F/oZr
 kvGO003wL7xiVf9C+xMUn7rNaRx9cxhyHOb4UUElLDAfYW9aym8sGOmijPhRTzy12b
 ufvw/HsfwCtnZlygmDX0X/1dW5OWL8EYcb3Dr+lBzPR9iRrKdFMPHYRK1yR+GSaNik
 QBuolx4pjH+pjhJHE29Ps6Vsw7ItK3FbJ28rXMboMtRM8C9vHH8zunK3Le5hnK/wth
 UpUM7rMJ91F78y09Se17diBUv3kjBy2FS6D28OuyDr8wovYK2YRL5KZpJfETjbtI2I
 gLQc7WnGR8lBg==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 8BFC1A00CC;
 Thu,  9 Apr 2020 02:56:32 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v5 04/14] ARC: Atomics and Locking primitives
Date: Wed,  8 Apr 2020 19:56:05 -0700
Message-Id: <20200409025615.27003-5-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409025615.27003-1-vgupta@synopsys.com>
References: <20200409025615.27003-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200408_195633_212816_19B78C16 
X-CRM114-Status: GOOD (  13.24  )
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

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 sysdeps/arc/atomic-machine.h      | 69 +++++++++++++++++++++++++++++++
 sysdeps/arc/nptl/bits/semaphore.h | 32 ++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 sysdeps/arc/atomic-machine.h
 create mode 100644 sysdeps/arc/nptl/bits/semaphore.h

diff --git a/sysdeps/arc/atomic-machine.h b/sysdeps/arc/atomic-machine.h
new file mode 100644
index 000000000000..6cf128dc7fa8
--- /dev/null
+++ b/sysdeps/arc/atomic-machine.h
@@ -0,0 +1,69 @@
+/* Low-level functions for atomic operations. ARC version.
+   Copyright (C) 2012-2020 Free Software Foundation, Inc.
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
+#ifndef _ARC_BITS_ATOMIC_H
+#define _ARC_BITS_ATOMIC_H 1
+
+#include <stdint.h>
+
+typedef int32_t atomic32_t;
+typedef uint32_t uatomic32_t;
+typedef int_fast32_t atomic_fast32_t;
+typedef uint_fast32_t uatomic_fast32_t;
+
+typedef intptr_t atomicptr_t;
+typedef uintptr_t uatomicptr_t;
+typedef intmax_t atomic_max_t;
+typedef uintmax_t uatomic_max_t;
+
+#define __HAVE_64B_ATOMICS 0
+#define USE_ATOMIC_COMPILER_BUILTINS 1
+
+/* ARC does have legacy atomic EX reg, [mem] instruction but the micro-arch
+   is not as optimal as LLOCK/SCOND specially for SMP.  */
+#define ATOMIC_EXCHANGE_USES_CAS 1
+
+#define __arch_compare_and_exchange_bool_8_acq(mem, newval, oldval)	\
+  (abort (), 0)
+#define __arch_compare_and_exchange_bool_16_acq(mem, newval, oldval)	\
+  (abort (), 0)
+#define __arch_compare_and_exchange_bool_64_acq(mem, newval, oldval)	\
+  (abort (), 0)
+
+#define __arch_compare_and_exchange_val_8_int(mem, newval, oldval, model)	\
+  (abort (), (__typeof (*mem)) 0)
+#define __arch_compare_and_exchange_val_16_int(mem, newval, oldval, model)	\
+  (abort (), (__typeof (*mem)) 0)
+#define __arch_compare_and_exchange_val_64_int(mem, newval, oldval, model)	\
+  (abort (), (__typeof (*mem)) 0)
+
+#define __arch_compare_and_exchange_val_32_int(mem, newval, oldval, model)	\
+  ({										\
+    typeof (*mem) __oldval = (oldval);                                  	\
+    __atomic_compare_exchange_n (mem, (void *) &__oldval, newval, 0,    	\
+                                 model, __ATOMIC_RELAXED);              	\
+    __oldval;                                                           	\
+  })
+
+#define atomic_compare_and_exchange_val_acq(mem, new, old)		\
+  __atomic_val_bysize (__arch_compare_and_exchange_val, int,		\
+		       mem, new, old, __ATOMIC_ACQUIRE)
+
+#define atomic_full_barrier()  ({ asm volatile ("dmb 3":::"memory"); })
+
+#endif /* _ARC_BITS_ATOMIC_H */
diff --git a/sysdeps/arc/nptl/bits/semaphore.h b/sysdeps/arc/nptl/bits/semaphore.h
new file mode 100644
index 000000000000..772dc4cb9b01
--- /dev/null
+++ b/sysdeps/arc/nptl/bits/semaphore.h
@@ -0,0 +1,32 @@
+/* Machine-specific POSIX semaphore type layouts.  ARC version.
+   Copyright (C) 2002-2020 Free Software Foundation, Inc.
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
+   License along with the GNU C Library; if not, see
+   <https://www.gnu.org/licenses/>.  */
+
+#ifndef _SEMAPHORE_H
+# error "Never use <bits/semaphore.h> directly; include <semaphore.h> instead."
+#endif
+
+#define __SIZEOF_SEM_T	16
+
+/* Value returned if `sem_open' failed.  */
+#define SEM_FAILED      ((sem_t *) 0)
+
+typedef union
+{
+  char __size[__SIZEOF_SEM_T];
+  long int __align;
+} sem_t;
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
