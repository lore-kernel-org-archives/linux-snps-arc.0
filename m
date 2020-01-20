Return-Path: <SRS0=X5Oj=3J=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F954C2D0DB
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Jan 2020 12:43:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E93E4207FF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Jan 2020 12:43:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ALJg7q+X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="dfNoa4S+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E93E4207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=d8GBBq5n8kPPi9iJxVWyFyDAfsnXhBKLO56T+pgUOnQ=; b=ALJg7q+Xyj/ksZSdXVLLYRJMXz
	6m4aUAOelN6UrOYEXbiof7wIyAuLQn+nYpxbpiR9x6z+ZV1g5LzMgOv3wcZXxmHQ/rVOcZyRPb1p3
	v+fE+77ACLGY+z4VuqwEHik3ZHMo5XfkT6f12TlEaE7MX0b42H9iFI7ZQhi4GYEUZ2vrY8iDUvVNE
	i2b94za+A2jH2n3kF61RZcENlwbraZl/YyK1o7WOpjwR/elzx79KLGeSGSySir71BWqko/97x7yLa
	OYxuzQV30C1Zop3bMTyMnrZfuehbrlFJJsVkgAyOAUL53hyp4qQV7hnVEeV2UyAIOKCKWGp9dlZmQ
	1aCNGoNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itWPI-0003fg-QK; Mon, 20 Jan 2020 12:43:52 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itWP8-0003dV-AQ
 for linux-snps-arc@lists.infradead.org; Mon, 20 Jan 2020 12:43:51 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2D648C0512;
 Mon, 20 Jan 2020 12:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579524221; bh=Te8F2jcoSDjKvMQSNXXFJnZD9+Fk6Qzc1XfC4fwYJ40=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dfNoa4S+vahGYrxjm6jXXrPQGs2fmcvV2ocdKvibgKdlw9Y91tjR/X4d/J8BfsQCC
 Na5i58NZs4Y9puMrYRghxiUT90pyBTR3Y/qs3EHJxjK/ayKG9gx+hovNTVuOBnvXBp
 ozhEvvyPRSccOAqBJ+0N31tpJY0P2d7zJIaIBKGmGZCzkYmODgmhFID5SMOCY5V9Co
 xHh5tv2uRubgzLRpbtz+4pc+M1QeNlUEZCzcJZPaXuD7ngAQ4FkCkjN/LUKWTDRyOt
 LOO7ACdk7HXm5p69dIGBd9nXIVOyxbMoPtvocURGnoFuYLWo5zsl+ggHigEzdGuhOL
 zvts5jBxDO/+g==
Received: from ru20arcgnu1.internal.synopsys.com
 (ru20arcgnu1.internal.synopsys.com [10.121.9.48])
 by mailhost.synopsys.com (Postfix) with ESMTP id 7DD47A0062;
 Mon, 20 Jan 2020 12:43:38 +0000 (UTC)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: u-boot@lists.denx.de
Subject: [RFC 1/2] include: Import non-atomic.h from Linux
Date: Mon, 20 Jan 2020 15:43:28 +0300
Message-Id: <20200120124329.3001-2-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20200120124329.3001-1-abrodkin@synopsys.com>
References: <20200120124329.3001-1-abrodkin@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_044342_477948_9538A169 
X-CRM114-Status: GOOD (  14.81  )
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
Cc: Tom Rini <trini@konsulko.com>, linux-snps-arc@lists.infradead.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, Rick Chen <rick@andestech.com>,
 uboot-snps-arc@synopsys.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This header contains implementations of some common bit ops:
 * __set_bit()/__clear_bit()/__change_bit()/test_bit()
 * __test_and_set_bit()/__test_and_clear_bit()/__test_and_change_bit()

No point in copy-pasting that again & again.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 include/asm-generic/bitops/non-atomic.h | 109 ++++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)
 create mode 100644 include/asm-generic/bitops/non-atomic.h

diff --git a/include/asm-generic/bitops/non-atomic.h b/include/asm-generic/bitops/non-atomic.h
new file mode 100644
index 0000000000..9b3be37fff
--- /dev/null
+++ b/include/asm-generic/bitops/non-atomic.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_NON_ATOMIC_H_
+#define _ASM_GENERIC_BITOPS_NON_ATOMIC_H_
+
+#include <asm/types.h>
+
+/**
+ * __set_bit - Set a bit in memory
+ * @nr: the bit to set
+ * @addr: the address to start counting from
+ *
+ * Unlike set_bit(), this function is non-atomic and may be reordered.
+ * If it's called on the same region of memory simultaneously, the effect
+ * may be that only one operation succeeds.
+ */
+static inline void __set_bit(int nr, volatile unsigned long *addr)
+{
+	unsigned long mask = BIT_MASK(nr);
+	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
+
+	*p  |= mask;
+}
+
+static inline void __clear_bit(int nr, volatile unsigned long *addr)
+{
+	unsigned long mask = BIT_MASK(nr);
+	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
+
+	*p &= ~mask;
+}
+
+/**
+ * __change_bit - Toggle a bit in memory
+ * @nr: the bit to change
+ * @addr: the address to start counting from
+ *
+ * Unlike change_bit(), this function is non-atomic and may be reordered.
+ * If it's called on the same region of memory simultaneously, the effect
+ * may be that only one operation succeeds.
+ */
+static inline void __change_bit(int nr, volatile unsigned long *addr)
+{
+	unsigned long mask = BIT_MASK(nr);
+	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
+
+	*p ^= mask;
+}
+
+/**
+ * __test_and_set_bit - Set a bit and return its old value
+ * @nr: Bit to set
+ * @addr: Address to count from
+ *
+ * This operation is non-atomic and can be reordered.
+ * If two examples of this operation race, one can appear to succeed
+ * but actually fail.  You must protect multiple accesses with a lock.
+ */
+static inline int __test_and_set_bit(int nr, volatile unsigned long *addr)
+{
+	unsigned long mask = BIT_MASK(nr);
+	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
+	unsigned long old = *p;
+
+	*p = old | mask;
+	return (old & mask) != 0;
+}
+
+/**
+ * __test_and_clear_bit - Clear a bit and return its old value
+ * @nr: Bit to clear
+ * @addr: Address to count from
+ *
+ * This operation is non-atomic and can be reordered.
+ * If two examples of this operation race, one can appear to succeed
+ * but actually fail.  You must protect multiple accesses with a lock.
+ */
+static inline int __test_and_clear_bit(int nr, volatile unsigned long *addr)
+{
+	unsigned long mask = BIT_MASK(nr);
+	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
+	unsigned long old = *p;
+
+	*p = old & ~mask;
+	return (old & mask) != 0;
+}
+
+/* WARNING: non atomic and it can be reordered! */
+static inline int __test_and_change_bit(int nr,
+					volatile unsigned long *addr)
+{
+	unsigned long mask = BIT_MASK(nr);
+	unsigned long *p = ((unsigned long *)addr) + BIT_WORD(nr);
+	unsigned long old = *p;
+
+	*p = old ^ mask;
+	return (old & mask) != 0;
+}
+
+/**
+ * test_bit - Determine whether a bit is set
+ * @nr: bit number to test
+ * @addr: Address to start counting from
+ */
+static inline int test_bit(int nr, const volatile unsigned long *addr)
+{
+	return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG - 1)));
+}
+
+#endif /* _ASM_GENERIC_BITOPS_NON_ATOMIC_H_ */
-- 
2.16.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
