Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3029C433FE
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Feb 2022 14:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jlgoqyBIP9pRAdiFLEShE5/xjIp1azuIpJzMUZm83g8=; b=ZflPhURQNDd+Lo
	uOTDw/ql0b0KP/7fTGs1hcosk3Wp7BKTGRah2QbTh5nLUQKHeYxS1fPCvSZiUE0ACUxyyR2g43xgP
	5O6FPCrgbsPu45JARwrN5DX0duazNVrqhZIYQAVlDBOwiCamoA4FeP0cKVjlldsO13SYhOAowEcI+
	GmslmcOcDP4B9Jrsg93qO+kP+BMMY1Unr10Nn3FEK2o+a2P1Onx5HXcSIgtdlxy942+Xglen9gYlN
	2U9v5UzhKNKdZd9akgHCFa0d/6X+2s04XzDkneHU//+PIFEbg490J52bS+6GnuUpXGMaIUSG2GMnI
	bDM+lCe4eZ7jhXb8vOzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMVnL-009nhs-5M; Tue, 22 Feb 2022 14:05:35 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMVnG-009nfI-PS
 for linux-snps-arc@lists.infradead.org; Tue, 22 Feb 2022 14:05:33 +0000
Received: by mail-lj1-x236.google.com with SMTP id e17so19706376ljk.5
 for <linux-snps-arc@lists.infradead.org>; Tue, 22 Feb 2022 06:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zHWONupJWsFGmakaW1lJV/L/TehxNoS195CnP8hwM8A=;
 b=V9AtcJDhKRVAwPbQHW6Rff3ecRU/g4dGbffUnunMkGdQsYznwnEANwwy8nqU9BVFME
 YWG0A7WIjekTLonAHlc2f71QroOOcJKzHJOEusOjL/9X/KXHC5BOtf1YN3DfVxybtFsT
 XzXGB0zpM6b9YOqZifrytdO1MtYyvCljHZLCnW26pFK03qWlwwrJCE+7n+wqRzzW6Abs
 KYL3dZGNIO6JU3tLxFIvHsMA+6fED8/hUm7jo8oqXUQ2p0Umt1fy8d8e/yPYIz4bziJA
 5ylJVsdI2Iw+KxYIiMHYLGcHfRgH4jbdkB1PqDj5YrD6JPXYYwdUW5uGGPOVgKUO4O8V
 waBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zHWONupJWsFGmakaW1lJV/L/TehxNoS195CnP8hwM8A=;
 b=hV545mH9Z7vODROXEn24blC/E9NhZz7POaKjHhjgXSP+eUFEFxJk9uCjnAR7ZCnt7E
 LgTSSYVvGOSVxW4kBYNKfkstg5RyKDEZhix0eqFwymVwWOhx+CwAV9BemrJh1BCpHFeD
 +x10EOoCKnuTOi0h52MhrC5P/7DY3oRYztAGZoE0lVCf/lUjuodX6B6KDmc1W80XcWMv
 AphZglaeu4C14ti2pKBzNHDc/j1UBTmoi3OEDBHhFnGD4Od7bz7TI5HipLEP/FkEYLYI
 gK6e6Zfj56SJyCyMjTpVhbl9pFFLraSpVnCpHWbN07fqOboitvPm/xi8nYyQ3SXU6vep
 UyDw==
X-Gm-Message-State: AOAM5324cH05LCDCRAVboaNtfYA3V1RVrdXvMj/fXxpyKZQUOmPPREUj
 aguHpKarvDQ4EncEOZKwnyFlUCHknQg=
X-Google-Smtp-Source: ABdhPJxoFblna7VuX22AmFkC16Xkn9PJd2vk4cWKIpaWE3Q0uyJPdNHloJm2lfhXoeaYiUoZmUUryA==
X-Received: by 2002:a2e:7218:0:b0:246:4772:1fa0 with SMTP id
 n24-20020a2e7218000000b0024647721fa0mr3833512ljc.125.1645538729117; 
 Tue, 22 Feb 2022 06:05:29 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id a19sm512003ljq.80.2022.02.22.06.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:05:28 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [PATCH 1/2] ARC: atomic: cleanup atomic-llsc definitions
Date: Tue, 22 Feb 2022 17:05:24 +0300
Message-Id: <20220222140525.4002518-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222140525.4002518-1-geomatsi@gmail.com>
References: <20220222140525.4002518-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_060530_847332_2755FF49 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

From: Sergey Matyukevich <sergey.matyukevich@synopsys.com>

Remove redundant c_op macro argument. Only asm_op is needed
to define atomic operations using llock/scond.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
---
 arch/arc/include/asm/atomic-llsc.h | 32 +++++++++++++++---------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arc/include/asm/atomic-llsc.h b/arch/arc/include/asm/atomic-llsc.h
index 088d348781c1..1b0ffaeee16d 100644
--- a/arch/arc/include/asm/atomic-llsc.h
+++ b/arch/arc/include/asm/atomic-llsc.h
@@ -5,7 +5,7 @@
 
 #define arch_atomic_set(v, i) WRITE_ONCE(((v)->counter), (i))
 
-#define ATOMIC_OP(op, c_op, asm_op)					\
+#define ATOMIC_OP(op, asm_op)					\
 static inline void arch_atomic_##op(int i, atomic_t *v)			\
 {									\
 	unsigned int val;						\
@@ -21,7 +21,7 @@ static inline void arch_atomic_##op(int i, atomic_t *v)			\
 	: "cc");							\
 }									\
 
-#define ATOMIC_OP_RETURN(op, c_op, asm_op)				\
+#define ATOMIC_OP_RETURN(op, asm_op)				\
 static inline int arch_atomic_##op##_return_relaxed(int i, atomic_t *v)	\
 {									\
 	unsigned int val;						\
@@ -42,7 +42,7 @@ static inline int arch_atomic_##op##_return_relaxed(int i, atomic_t *v)	\
 #define arch_atomic_add_return_relaxed		arch_atomic_add_return_relaxed
 #define arch_atomic_sub_return_relaxed		arch_atomic_sub_return_relaxed
 
-#define ATOMIC_FETCH_OP(op, c_op, asm_op)				\
+#define ATOMIC_FETCH_OP(op, asm_op)				\
 static inline int arch_atomic_fetch_##op##_relaxed(int i, atomic_t *v)	\
 {									\
 	unsigned int val, orig;						\
@@ -69,23 +69,23 @@ static inline int arch_atomic_fetch_##op##_relaxed(int i, atomic_t *v)	\
 #define arch_atomic_fetch_or_relaxed		arch_atomic_fetch_or_relaxed
 #define arch_atomic_fetch_xor_relaxed		arch_atomic_fetch_xor_relaxed
 
-#define ATOMIC_OPS(op, c_op, asm_op)					\
-	ATOMIC_OP(op, c_op, asm_op)					\
-	ATOMIC_OP_RETURN(op, c_op, asm_op)				\
-	ATOMIC_FETCH_OP(op, c_op, asm_op)
+#define ATOMIC_OPS(op, asm_op)					\
+	ATOMIC_OP(op, asm_op)					\
+	ATOMIC_OP_RETURN(op, asm_op)				\
+	ATOMIC_FETCH_OP(op, asm_op)
 
-ATOMIC_OPS(add, +=, add)
-ATOMIC_OPS(sub, -=, sub)
+ATOMIC_OPS(add, add)
+ATOMIC_OPS(sub, sub)
 
 #undef ATOMIC_OPS
-#define ATOMIC_OPS(op, c_op, asm_op)					\
-	ATOMIC_OP(op, c_op, asm_op)					\
-	ATOMIC_FETCH_OP(op, c_op, asm_op)
+#define ATOMIC_OPS(op, asm_op)					\
+	ATOMIC_OP(op, asm_op)					\
+	ATOMIC_FETCH_OP(op, asm_op)
 
-ATOMIC_OPS(and, &=, and)
-ATOMIC_OPS(andnot, &= ~, bic)
-ATOMIC_OPS(or, |=, or)
-ATOMIC_OPS(xor, ^=, xor)
+ATOMIC_OPS(and, and)
+ATOMIC_OPS(andnot, bic)
+ATOMIC_OPS(or, or)
+ATOMIC_OPS(xor, xor)
 
 #define arch_atomic_andnot		arch_atomic_andnot
 
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
