Return-Path: <SRS0=fi28=74=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23C7C433DF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Jun 2020 20:14:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 653F820756
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Jun 2020 20:14:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T6eWt6vq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LaRqLPas"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 653F820756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NHxKjbj71F2RDJfmpLcMtway5Y6PQdU1oF5cQ87bDHE=; b=T6eWt6vqkTvN0L
	3jr2r3tfYm4iSh3WHtYUZXFYtgij4PONtK24HeNPIZGsjUTrECb1a3z7It0Y8jcRBM4clp9emzpNE
	u8hq6tH1Q/h61PQs0Y++xLC/kbsMaf4m1tBUL9S18TmTZtP7FmmcZ6qlXUya8C6rAosNsxOoTVsjJ
	wL7xIlVjFZ6GOI5GggTAV9E3jI0jXqNoPpIRTp0LlzWy1ONwx7SDNIWc1xYb8i7dxYCBKYURnHVBZ
	xcWHCeeO0yUDSm1AGhujwrdSrRXSkgjsBMP9OF+63puLY/ikJNPbgqDOOsPdJpVGvzyUQrQFdkbnU
	tBRDvaltmYhZjNOBlVFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkvVL-0003aI-79; Mon, 15 Jun 2020 20:14:51 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkvVH-0003Wc-Ew
 for linux-snps-arc@lists.infradead.org; Mon, 15 Jun 2020 20:14:49 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E3B44C0BB1;
 Mon, 15 Jun 2020 20:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1592252086; bh=eyVsa+2curhuUZRwYpnjzVoyjdb1AXvZxrsBZkRKjyk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LaRqLPastik+/i5Wo7+WGFE3d+7bZ6eW/fguJ0uFtpnbzzXKvoL/nIVE0Jgr+8Rnx
 h8Xl1t009ZCQ1dpvny8N8jh6pUgISEOiOQEGrpsD8mTuXHq9jQuFagN/aWCxsAuMqR
 tlm9kuYxU72DhdVGkZbSWqS7me630ST28ROVRcoaLfgVxOM5QWk/JTs2eIh3o9d9SQ
 DtM0EXytUkBBOrBcjhByP+TknGzD/GaoLAfQVMOu6K9AMI3h2R6bLryT5DNz5otn68
 zIqcH75807e8Oo/la4nLTzdSFvAr9EYtMeRLxSA1f6dMR1fGYQicJNLke+0GGeBVWT
 xCbCxxM6CBB7Q==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 986E5A00A4;
 Mon, 15 Jun 2020 20:14:46 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v7 04/13] ARC: Atomics and Locking primitives
Date: Mon, 15 Jun 2020 13:14:32 -0700
Message-Id: <20200615201441.31820-5-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200615201441.31820-1-vgupta@synopsys.com>
References: <20200615201441.31820-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_131447_573835_5E0993E1 
X-CRM114-Status: GOOD (  12.49  )
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

---
 sysdeps/arc/atomic-machine.h | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 sysdeps/arc/atomic-machine.h

diff --git a/sysdeps/arc/atomic-machine.h b/sysdeps/arc/atomic-machine.h
new file mode 100644
index 000000000000..1c8638bb44ef
--- /dev/null
+++ b/sysdeps/arc/atomic-machine.h
@@ -0,0 +1,69 @@
+/* Low-level functions for atomic operations. ARC version.
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
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
