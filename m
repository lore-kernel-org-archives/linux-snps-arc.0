Return-Path: <SRS0=yiNs=M3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4277C19F39
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Aug 2021 19:16:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FD7A61040
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Aug 2021 19:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FD7A61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GQPlJFE01uEJdvNpOU2/7i0+SP4PThLt/VNNowTmzU0=; b=lbQueNYBc1dygu
	YdbIIUmyUf2EO8O98GQzmVLdhBoUPLgw5vMS+y1cLZV9hHbyoOSYV1hf43BMfJJoLwDhoMFCNvwvJ
	7B3B6SPs11yCYFHC2d+61fqaZEKjMGdCMjCC2yQhFYq/AoLbSU2NT/VVFF+wOJ4M1LRXN/7UjIAB7
	wHTQ4RWkbRWKYRfLmvu2yMqQorJlpPMMN4w4w+zgbLjWy0N5vy5XC3KZdxZFw07FkbRM9AYbHUs9X
	kX1BF2TGCDhvFNbYGdC+KOdMpP5xSiXpL2wgYkLgciMcb45K6+hnl4cJNx8v5NLVHsT83yU3VKVDo
	yzJ3PKb2TUkUzekORN3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBMNC-007HYQ-UA; Wed, 04 Aug 2021 19:16:14 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBMN9-007HSt-7S
 for linux-snps-arc@lists.infradead.org; Wed, 04 Aug 2021 19:16:14 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3F34540DBA;
 Wed,  4 Aug 2021 19:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1628104567; bh=ETzGMk/ObfVL8wKfDVOEoi0RM2tas4Uky7iyu8ZWips=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c+o0MSTNHiEFFu5uApAXwSL8QsJ2m0J8c8AVi+iXZVELxkY34RA6BH7mhFuF2thX1
 qpPdtcyjIbLSKhUujw5prCfXP3sOhkQSLwO4cYWc8SFnEoIB1OupxNsk8ZD3pDQEer
 B/geApv/HiJj0ivLUNHqy+/NRm1FJsYRbNlA+o9Sb0mJl7V3TVWvgeq4xAPo+E465a
 olrkHURomE+z81JTeR/RuwITqKqctlHIXo/d0Go2o9Z6H6HCsQ0/rRtZXX3LG/OA2e
 PI6oWnrawOnpZAL/83WAWB+Nhz59mwWhaJkJUzzItURzBEz4PxTN04qFTAGbhihwMv
 QDlKTdbNe4hvw==
Received: from vineetg-Latitude-7400.internal.synopsys.com
 (snps-fugpbdpduq.internal.synopsys.com [10.202.17.37])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mailhost.synopsys.com (Postfix) with ESMTPSA id EB36AA0094;
 Wed,  4 Aug 2021 19:16:06 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Cc: Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, Vladimir Isaev <Vladimir.Isaev@synopsys.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 11/11] ARC: atomic_cmpxchg/atomic_xchg: implement relaxed
 variants
Date: Wed,  4 Aug 2021 12:15:54 -0700
Message-Id: <20210804191554.1252776-12-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210804191554.1252776-1-vgupta@synopsys.com>
References: <20210804191554.1252776-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_121611_378478_BC4BA3D4 
X-CRM114-Status: GOOD (  15.21  )
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

And move them out of cmpxchg.h to canonical atomic.h

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/include/asm/atomic.h  | 27 +++++++++++++++++++++++++++
 arch/arc/include/asm/cmpxchg.h | 23 -----------------------
 2 files changed, 27 insertions(+), 23 deletions(-)

diff --git a/arch/arc/include/asm/atomic.h b/arch/arc/include/asm/atomic.h
index ee88e1dbaab5..52ee51e1ff7c 100644
--- a/arch/arc/include/asm/atomic.h
+++ b/arch/arc/include/asm/atomic.h
@@ -22,6 +22,33 @@
 #include <asm/atomic-spinlock.h>
 #endif
 
+#define arch_atomic_cmpxchg(v, o, n)					\
+({									\
+	arch_cmpxchg(&((v)->counter), (o), (n));			\
+})
+
+#ifdef arch_cmpxchg_relaxed
+#define arch_atomic_cmpxchg_relaxed(v, o, n)				\
+({									\
+	arch_cmpxchg_relaxed(&((v)->counter), (o), (n));		\
+})
+#endif
+
+#define arch_atomic_xchg(v, n)						\
+({									\
+	arch_xchg(&((v)->counter), (n));				\
+})
+
+#ifdef arch_xchg_relaxed
+#define arch_atomic_xchg_relaxed(v, n)					\
+({									\
+	arch_xchg_relaxed(&((v)->counter), (n));			\
+})
+#endif
+
+/*
+ * 64-bit atomics
+ */
 #ifdef CONFIG_GENERIC_ATOMIC64
 #include <asm-generic/atomic64.h>
 #else
diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index e2ae0eb1ca07..c5b544a5fe81 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -80,14 +80,6 @@
 
 #endif
 
-/*
- * atomic_cmpxchg is same as cmpxchg
- *   LLSC: only different in data-type, semantics are exactly same
- *  !LLSC: cmpxchg() has to use an external lock atomic_ops_lock to guarantee
- *         semantics, and this lock also happens to be used by atomic_*()
- */
-#define arch_atomic_cmpxchg(v, o, n) ((int)arch_cmpxchg(&((v)->counter), (o), (n)))
-
 /*
  * xchg
  */
@@ -148,19 +140,4 @@
 
 #endif
 
-/*
- * "atomic" variant of xchg()
- * REQ: It needs to follow the same serialization rules as other atomic_xxx()
- * Since xchg() doesn't always do that, it would seem that following definition
- * is incorrect. But here's the rationale:
- *   SMP : Even xchg() takes the atomic_ops_lock, so OK.
- *   LLSC: atomic_ops_lock are not relevant at all (even if SMP, since LLSC
- *         is natively "SMP safe", no serialization required).
- *   UP  : other atomics disable IRQ, so no way a difft ctxt atomic_xchg()
- *         could clobber them. atomic_xchg() itself would be 1 insn, so it
- *         can't be clobbered by others. Thus no serialization required when
- *         atomic_xchg is involved.
- */
-#define arch_atomic_xchg(v, new) (arch_xchg(&((v)->counter), new))
-
 #endif
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
