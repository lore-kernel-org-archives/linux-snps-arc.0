Return-Path: <SRS0=yiNs=M3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D001CC4338F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Aug 2021 19:16:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D822600D4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Aug 2021 19:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D822600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DLfwi3D1WcwMI5HzO4EOf9qtV3UWso7Xv+25sePbDYI=; b=MDw5B+JVp33HkQ
	j4lMHRqDNYK+hTVRT4jZVUzhI2hw9ZeKwTDSqkB+Ar3McWVjxFWNyMiLBPSbKopzG7XtjMYN5QjOm
	gWsAOifguQStIhELY+Mv8GF4NsyVEL8G5tl9Ydk0Dh5huNth6t+Qt60ahgopHnkDhapdQq6zslsQz
	l/1auEYN98NaJ9BbOzuCwWYRm86D+iXGYM62d4Zby7PptIMETgNc+GpAeSRCkgyXRETY95X6rMO1A
	H6dDQZci943anunS08ZatC48tLQz1LGXdXzMvhsQb+A+oOIU4gk1PPBvd2IYbXRB7smjct97wZbnJ
	cxx0eQtxNQzfCHWP41qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBMN9-007HWf-NE; Wed, 04 Aug 2021 19:16:11 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBMN6-007HRI-VX
 for linux-snps-arc@lists.infradead.org; Wed, 04 Aug 2021 19:16:10 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 02AD5C0CD8;
 Wed,  4 Aug 2021 19:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1628104565; bh=GUlPhWysasMU3M5hFTCrzEu/YnDzJLWYAJ20nKaE6Hk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LJkuQpBqQaK6Z2FOtxn5p7RNDnLHu+AoaG+8/42sP9RlgxLTfKrfhEECnEwYS6xZr
 86Y8BtH5cv41D53KkLTpRjqpHSrhy7u17YZBVy+yvNEDtdrJmgU4m/nIQUbC1ned1G
 /V2CXPSP5I1lUoqdseUat9jvkKJGDK9jDl4zNj3gMYYTd+Tdif74Z5abFOkIjj2qRk
 mN4CH2ZwQO4sg+B2QrdW93e6v2FSe5aAR6MdSn4R+cAtZQD7eoeFh0vcgLKFb1ek7x
 thp22sXtRl/VU45m3E38cpnZevzPxV5ELlJVe6zl8i+/tf74sxIGodKCxQ1b+nAKgm
 OTrC9SmStEhPQ==
Received: from vineetg-Latitude-7400.internal.synopsys.com
 (snps-fugpbdpduq.internal.synopsys.com [10.202.17.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id 97E73A009B;
 Wed,  4 Aug 2021 19:16:04 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Cc: Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Vladimir Isaev <Vladimir.Isaev@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 02/11] ARC: atomic: !LLSC: remove hack in atomic_set() for for
 UP
Date: Wed,  4 Aug 2021 12:15:45 -0700
Message-Id: <20210804191554.1252776-3-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804191554.1252776-1-vgupta@synopsys.com>
References: <20210804191554.1252776-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_121609_078651_04F55476 
X-CRM114-Status: GOOD (  12.09  )
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

!LLSC atomics use spinlock (SMP) or irq-disable (UP) to implement
criticla regions. UP atomic_set() however was "cheating" by not doing
any of that so and still being functional.

Remove this anomaly (primarily as cleanup for future code improvements)
given that this config is not worth hassle of special case code.

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/include/asm/atomic-spinlock.h | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/arc/include/asm/atomic-spinlock.h b/arch/arc/include/asm/atomic-spinlock.h
index bdf87610b2d7..8c6fd0e651e5 100644
--- a/arch/arc/include/asm/atomic-spinlock.h
+++ b/arch/arc/include/asm/atomic-spinlock.h
@@ -3,12 +3,10 @@
 #ifndef _ASM_ARC_ATOMIC_SPLOCK_H
 #define _ASM_ARC_ATOMIC_SPLOCK_H
 
-#ifndef CONFIG_SMP
-
- /* violating atomic_xxx API locking protocol in UP for optimization sake */
-#define arch_atomic_set(v, i) WRITE_ONCE(((v)->counter), (i))
-
-#else
+/*
+ * Non hardware assisted Atomic-R-M-W
+ * Locking would change to irq-disabling only (UP) and spinlocks (SMP)
+ */
 
 static inline void arch_atomic_set(atomic_t *v, int i)
 {
@@ -30,13 +28,6 @@ static inline void arch_atomic_set(atomic_t *v, int i)
 
 #define arch_atomic_set_release(v, i)	arch_atomic_set((v), (i))
 
-#endif
-
-/*
- * Non hardware assisted Atomic-R-M-W
- * Locking would change to irq-disabling only (UP) and spinlocks (SMP)
- */
-
 #define ATOMIC_OP(op, c_op, asm_op)					\
 static inline void arch_atomic_##op(int i, atomic_t *v)			\
 {									\
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
