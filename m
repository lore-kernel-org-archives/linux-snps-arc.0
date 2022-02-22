Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41ADC433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Feb 2022 14:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=glkjrpAt2hqbvSoyo/51amNo0Tj0gwnkUCB/lccaZM4=; b=ErVo3vphPsp8RV
	0SEPr+oxm5tW+ETHIYuyIO9kxxnSI9yVH9G85zq4S0yIgReq8jyflsKp+Vfx06JIL7d9pteordhTG
	6Ul/tk0oKAuTKA5Iit6nDPhnhhTudGErZekd3goiqH5m9ynYXb0WVFR1Z2XXkZ8XMwXJ4l8IOUsn8
	qcUeqlB9vKRFN0rkviyxsT4YZw7j90ZLtzEI/BeLP3DvJG40oxmZ2DY0sFxRD7wai3VfVqqPnAxuc
	HCjZS6c1KCxK3guXseNlTuwN73Cao7z7R1Zh6XSghUhZ612I/BfVhiI2MC9T6czecxtRQtdc4nCaW
	mTHVOuYrwmciTpRuXMQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMVws-009qWh-Tv; Tue, 22 Feb 2022 14:15:26 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMVwo-009qQN-VW
 for linux-snps-arc@lists.infradead.org; Tue, 22 Feb 2022 14:15:24 +0000
Received: by mail-lf1-x129.google.com with SMTP id f37so25026783lfv.8
 for <linux-snps-arc@lists.infradead.org>; Tue, 22 Feb 2022 06:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7/AR/oo0PGIb8snkFogpz0BMiLJb7XO6QjAC0YUi3h0=;
 b=l9d0hSl9PAx/UBXDaQG1o785praxJ/mhMXCkphnvHIkzdjjxO5aKakQnoeb6fH5saG
 2kWXexlayptLZw6wsY8LVwTqChr0rh1bISFpjIDdn7Y6BDgPSI3x9INScg2X2M2hWy0b
 UEGG+xLhuO6Vn9RKzvxuYxYY+exTnJkr08zLdrhfzMRWUFWM4r/hoXAyi2ySWqFyko+z
 L7te79AwU2pcuAKruE5i0AtaYkPu6SgNj8miPORWwFjXAvl1G7jhESw0PFcA5eQnUb03
 6p+2u4urIAZBu/QbFr0zIKVMNmhebQNNAqjxgqe7frnd80pYup8pxb12fsFb2CDsCabK
 /wsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7/AR/oo0PGIb8snkFogpz0BMiLJb7XO6QjAC0YUi3h0=;
 b=WrTlYBmwdYMlRJDyyqzlNal71dEmxOaRU0VmMIYIqnDtzsvPo0qZeNyXaFrT6a2lwB
 EsZ5wRe9vCF3C/dGvEHclzk2fs/ZPCntyBMo8K0wWNIcWE35SJwegxcQ92JP3ofcO7yM
 CNFBLOE4Ng1oQbAA9g/WtyVXOsVdzwkD33spfRiUegOxH+P9mRY3ruRG6UT4PzJa5amM
 L9xNjHVq2a8cV9rmqOufOxheEJx6bWmO+iemfWyzRab8f/QIsZ8wlFOvL5DYsW9w0kan
 dk588SVsMfp5n5A/q0VwE5TyfFsRQ4R8AFzTNMQ1vQxepOoGMd4Cp63EI6CT7NUtgOjA
 Scxg==
X-Gm-Message-State: AOAM532z52nDHZqRbfxhOOrhRJ8JHrcIS5dAN4fTBZ7Rhm54hQBpCNfW
 lc67ihO02QgoD7RMdxfdZtcNgEhk4nI=
X-Google-Smtp-Source: ABdhPJzNzPu6BtjCRz+DClqrMQFnaruE9Mf+XZZl7RpOAo4T9tLH+0wVX5DZbuRuca/9/qigwLMwhA==
X-Received: by 2002:a05:6512:318c:b0:43a:b36:a1cb with SMTP id
 i12-20020a056512318c00b0043a0b36a1cbmr15915094lfe.665.1645539320821; 
 Tue, 22 Feb 2022 06:15:20 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id m8sm1707047ljb.131.2022.02.22.06.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:15:20 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [RFC PATCH 06/13] ARCv2: memset: elide unaligned handling if hardware
 supports
Date: Tue, 22 Feb 2022 17:14:59 +0300
Message-Id: <20220222141506.4003433-7-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222141506.4003433-1-geomatsi@gmail.com>
References: <20220222141506.4003433-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_061523_077356_6F32CA37 
X-CRM114-Status: GOOD (  10.65  )
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

The only functional change is eliding the unaligned buffer head
handling. Also cleanup macros adding argument default values.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/lib/memset-archs.S | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/arch/arc/lib/memset-archs.S b/arch/arc/lib/memset-archs.S
index d0a5cec4cdca..330e22f7cf3c 100644
--- a/arch/arc/lib/memset-archs.S
+++ b/arch/arc/lib/memset-archs.S
@@ -17,43 +17,43 @@
 
 #if L1_CACHE_SHIFT == 6
 
-.macro PREALLOC_INSTR	reg, off
-	prealloc	[\reg, \off]
+.macro PREALLOCR s, off=0
+	prealloc [\s, \off]
 .endm
 
-.macro PREFETCHW_INSTR	reg, off
-	prefetchw	[\reg, \off]
+.macro PREFETCHWR s, off=0
+	prefetchw [\s, \off]
 .endm
 
 #else
 
-.macro PREALLOC_INSTR	reg, off
+.macro PREALLOCR s, off=0
 .endm
 
-.macro PREFETCHW_INSTR	reg, off
+.macro PREFETCHWR s, off=0
 .endm
 
 #endif
 
 ENTRY_CFI(memset)
+	; return if size 0 (happens lot)
 	mov.f	0, r2
-;;; if size is zero
 	jz.d	[blink]
-	mov	r3, r0		; don't clobber ret val
+	mov	r3, r0	; make a copy of input pointer reg
 
-	PREFETCHW_INSTR	r0, 0	; Prefetch the first write location
+	PREFETCHWR r0
 
-;;; if length < 8
-	brls.d.nt	r2, 8, .Lsmallchunk
-	mov.f	lp_count,r2
+	; small 1-8 byte handled in tail byte loop :-)
+	brlo	r2, 8, .Lbyteloop
 
-	and.f	r4, r0, 0x03
-	rsub	lp_count, r4, 4
-	lpnz	@.Laligndestination
-	;; LOOP BEGIN
+#ifndef CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS
+	; handle any starting unaligned bytes (upto 3)
+	and.f	lp_count, r0, 0x3
+	lpnz	1f
 	stb.ab	r1, [r3,1]
 	sub	r2, r2, 1
-.Laligndestination:
+1:
+#endif
 
 ;;; Destination is aligned
 	and	r1, r1, 0xFF
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
