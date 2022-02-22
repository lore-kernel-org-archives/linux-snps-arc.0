Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D7DC433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Feb 2022 14:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ualibFKomsf6ERw2fXvFuSk0EcVLBcqtsDR/S8JkJs8=; b=2QCByk2h9eDNpi
	iMPw3GtHlvOXCVhGdB4OCIrbjNiDfVzYSmqKJyAh/bEG3OZ6wWonYRBk2oSEWxwnRP+jGmXfOlYol
	vxd74qlNuRCZYGbqhBS4xc2DvNmAInaFPd8DR9EaPbgaVxtQo4L+mhz9nSh4mbHM9lTEza7kXJn3l
	Z1rMhsmtMtj4QqpEbMLiiXNNK9cDhpsTwqB+o0BW4X097fNL+V/0OOSuFvdnV1c7ykSFlF1o5uoAw
	0iIhOIf2uTHrFmxewIql2k1iyYkvyNom0s83YoajQH9lpPFVqDAFHDg53QKR59rxBQO+Y9CRZCwD4
	bU8wOGx5FEf6MnmpgqAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMVx8-009qgq-ED; Tue, 22 Feb 2022 14:15:42 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMVwp-009qRb-PS
 for linux-snps-arc@lists.infradead.org; Tue, 22 Feb 2022 14:15:25 +0000
Received: by mail-lj1-x22a.google.com with SMTP id bn33so19734785ljb.6
 for <linux-snps-arc@lists.infradead.org>; Tue, 22 Feb 2022 06:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ktOBNej0g/Uj8BKdLJx4BaSGgVL1F6tDM267OvBO3ZA=;
 b=U1k3mR2MfJQ0oy1+mdpwILdgh/7GfSFNkRpGLPdKBzwtZgCfeug1Cl61afylGDbaMY
 QPgu1YyqtW+7E7mlO7w0Pg5kvVpnC1sVOQUFL1yJ+qSy1PCDGlFwMyq6yZjveL6edTiI
 VQoH2JjYC9jDkfClV7GRvu+n8ZysoHkfbZvC6yB25nt6k7kAMaceUJ3W66H1XnhO45kN
 4fWoYY5RIsatwI8a0n+vWFDcl5UVWPmoR1ja3y/3tjIeLwdtYExCW0PrmydnQdTK9LFG
 WEu8KKULiyrjic4AWsy4TkW99WgBCa8/1wFAuR9ujcMMUWywmaEj7kojUvvcBpytTrmW
 wbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ktOBNej0g/Uj8BKdLJx4BaSGgVL1F6tDM267OvBO3ZA=;
 b=CggAdrse95InIqPwfsEpY6xSqz5ORDbefOOEAYOGSAqHg+z55d5Ii6104xgDEBJHYC
 mgEC6D3ckmArjBz5abUpeRlFDeNdGs8nvCas01VV7VSebNkhF8slnj3syrtH2m1l5g+m
 qUC9ZIKSOQy4xKCzXdgUKJ/DyA+hVzvtelL7oxiWMZBrernqBmwL+/62/3KiZ2SqijlF
 iIcvjrXnY0GDjB4zGUJNa43V/FGA6IIQXuVvOX8wCZOm9y4IXQlFb/8PD4JR+u1dTveq
 FDq9agzTFP9wIvyfcigK+VM7z4QCEcrxk+Grrgt0SsTEbEd6aAx2D7GPgfXKTxlIyrkD
 LwPw==
X-Gm-Message-State: AOAM532PhGKZiG6fa6aPhASH9JI1WakQZ47HOgl8sWhuefOCQ3yzeQHG
 CJLyWmILb3zPML8eSb/EGJ5kag+jyu8=
X-Google-Smtp-Source: ABdhPJz8WwxeWaO0FSdLUWfANQ5uZ13jG/CZRY7Nbbg+NK/RtpYyU6tB0dHziJMQZKwP6+IIp4HwwQ==
X-Received: by 2002:a2e:7809:0:b0:246:853:5594 with SMTP id
 t9-20020a2e7809000000b0024608535594mr17639585ljc.41.1645539321537; 
 Tue, 22 Feb 2022 06:15:21 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id m8sm1707047ljb.131.2022.02.22.06.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:15:21 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [RFC PATCH 07/13] ARCv2: memset: rewrite using double load/stores
Date: Tue, 22 Feb 2022 17:15:00 +0300
Message-Id: <20220222141506.4003433-8-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222141506.4003433-1-geomatsi@gmail.com>
References: <20220222141506.4003433-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_061523_876241_771967E4 
X-CRM114-Status: GOOD (  11.16  )
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

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/lib/memset-archs.S | 112 ++++++++++++++----------------------
 1 file changed, 43 insertions(+), 69 deletions(-)

diff --git a/arch/arc/lib/memset-archs.S b/arch/arc/lib/memset-archs.S
index 330e22f7cf3c..a9a0ccef761d 100644
--- a/arch/arc/lib/memset-archs.S
+++ b/arch/arc/lib/memset-archs.S
@@ -5,6 +5,7 @@
 
 #include <linux/linkage.h>
 #include <asm/cache.h>
+#include <asm/assembler.h>
 
 /*
  * The memset implementation below is optimized to use prefetchw and prealloc
@@ -55,7 +56,7 @@ ENTRY_CFI(memset)
 1:
 #endif
 
-;;; Destination is aligned
+	; promote memset pattern from char to int (double actually for STD)
 	and	r1, r1, 0xFF
 	asl	r4, r1, 8
 	or	r4, r4, r1
@@ -63,75 +64,48 @@ ENTRY_CFI(memset)
 	or	r5, r5, r4
 	mov	r4, r5
 
-	sub3	lp_count, r2, 8
-	cmp     r2, 64
-	bmsk.hi	r2, r2, 5
-	mov.ls	lp_count, 0
-	add3.hi	r2, r2, 8
-
-;;; Convert len to Dwords, unfold x8
-	lsr.f	lp_count, lp_count, 6
-
-	lpnz	@.Lset64bytes
-	;; LOOP START
-	PREALLOC_INSTR	r3, 64	; alloc next line w/o fetching
-
-#ifdef CONFIG_ARC_HAS_LL64
-	std.ab	r4, [r3, 8]
-	std.ab	r4, [r3, 8]
-	std.ab	r4, [r3, 8]
-	std.ab	r4, [r3, 8]
-	std.ab	r4, [r3, 8]
-	std.ab	r4, [r3, 8]
-	std.ab	r4, [r3, 8]
-	std.ab	r4, [r3, 8]
-#else
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-#endif
-.Lset64bytes:
-
-	lsr.f	lp_count, r2, 5 ;Last remaining  max 124 bytes
-	lpnz	.Lset32bytes
-	;; LOOP START
-#ifdef CONFIG_ARC_HAS_LL64
-	std.ab	r4, [r3, 8]
-	std.ab	r4, [r3, 8]
-	std.ab	r4, [r3, 8]
-	std.ab	r4, [r3, 8]
-#else
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-	st.ab	r4, [r3, 4]
-#endif
-.Lset32bytes:
-
-	and.f	lp_count, r2, 0x1F ;Last remaining 31 bytes
-.Lsmallchunk:
-	lpnz	.Lcopy3bytes
-	;; LOOP START
+	; Loop #a:
+	; - Updates 1 cache line worth data (64 bytes) per iteration
+	; - PREALLOC the next line.
+	;
+	; = Only entered if at least 2 lines worth of work (i.e. >= 128 bytes),
+	;   else PREALLOC for next can "bleed" past end of buffer, causing data
+	;   corruption issue if that line is owned by some other core.
+	; = Last 64 bytes (even for min 128 bytes work) are NOT done here to
+	;   avoid PREALLOC issue
+
+	sub     r6, r2, 64
+	cmp	r2, 64
+	bmsk.hi	r2, r2, 5	; trailing 63 bytes
+	mov.ls	r6, 0
+	add.hi	r2, r2, 64	; line skipped in loop below
+
+	lsr.f	lp_count, r6, 6
+	lpnz	2f
+	PREALLOCR r3, 64
+	ST64.ab	r4, r3, 8
+	ST64.ab	r4, r3, 8
+	ST64.ab	r4, r3, 8
+	ST64.ab	r4, r3, 8
+	ST64.ab	r4, r3, 8
+	ST64.ab	r4, r3, 8
+	ST64.ab	r4, r3, 8
+	ST64.ab	r4, r3, 8
+2:
+	; Loop #b: Remaining 32 / 64 bytes
+	lsr.f	lp_count, r2, 5
+	lpnz	.Lbyteloop
+	ST64.ab	r4, r3, 8
+	ST64.ab	r4, r3, 8
+	ST64.ab	r4, r3, 8
+	ST64.ab	r4, r3, 8
+
+.Lbyteloop:
+	; Loop #c: straggler 31 bytes
+	and.f	lp_count, r2, 0x1F
+	lpnz	4f
 	stb.ab	r1, [r3, 1]
-.Lcopy3bytes:
-
+4:
 	j	[blink]
 
 END_CFI(memset)
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
