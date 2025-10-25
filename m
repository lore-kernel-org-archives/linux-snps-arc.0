Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E215DCCF9E3
	for <linux-snps-arc@archiver.kernel.org>; Sat, 25 Oct 2025 16:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HS3Gh3JsXIN6AS7mst1u1crf1ZgyveP3LfjCfilG3jU=; b=J0mBYUQ/M/Tt4i
	EnHuXNNZnYYz5AvjHGt4x2aNx7uD0vDBx0pNn56jQQ1YeilycanQnYBp1DZFsXL4YOfCCVwzlmjjT
	287lTUfI9tfZ5qd9qM0AMyeUT8ftMkSLeZjK3omf1HlzsuCxke47Lsxv1elSu7DvbPEEnVtjDH1GT
	AY/37spGh5oG+kRHblHTDi3G2ZTaNZ5ACu3okAcB5Jaget6vZ4kwk78zVyOAC2iuXeW33IZEnllO7
	rKCTOblkcJTg8W0JKIB1ETMllWNz9D+eXt1MnqJq1MDQas8erWp+bxkKb0j7xWQcXJv7iqbuLSwlr
	nFTy4h99ACkPlpDmJMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh8e-0000000BW7d-2J7I;
	Sat, 25 Oct 2025 16:29:08 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh8b-0000000BW5k-1l0b
	for linux-snps-arc@lists.infradead.org;
	Sat, 25 Oct 2025 16:29:08 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-89e81dff0d1so163424185a.3
        for <linux-snps-arc@lists.infradead.org>; Sat, 25 Oct 2025 09:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761409743; x=1762014543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ww+ea11r2mZcngIR6hS8TfeQOLbyKE40FtRbqCbDFPg=;
        b=CxjxdCVLO7y3MmML3BAX53YaWQ+IdRODXVWhGN8i4JDMuTBeyH5h+5CNDJtkE8q2Pd
         bUl0JSOQ8ujYPW9E2wnbwsHqd2Ydq8eK0v5HbWyvUgHQEZPhm7LxajP61kYIC4QygnxN
         X/q6Snf1YbS19aiK5QBjVilyrxG4Q3E/8SQ/AR6+y2rGOBkg/31OQy7L7J5cC2B2HWSQ
         roHltUJee/MI/qGns8DJ0oBDVyjmEVs9wIthV0RpNqsUGYJMGUe8qEJH7LCwlZ7dtBik
         QIJb8hlcitCvEtT0cQF/G5EnUwaFGWHK9WXCPyVDpUIM4GOikWmvTOGbeAKI+lF0rKGD
         z75w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761409743; x=1762014543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ww+ea11r2mZcngIR6hS8TfeQOLbyKE40FtRbqCbDFPg=;
        b=I7wHMCZwywzkspsnnlKrgU+6nFmVS3ZaCStCaQFoOVtLk9UPHY0S6jS5VO9BD14OcL
         AELGPKuOieREL8zAnZQHB12jLIU56PGJoRulSqvzUxFoqHmjpvdNdk7QwaADSH4q/ZD7
         WZoGJfJZCkcuzjEaay6EHgfB7KsAdALQ5hK4aRSstAINU7u/NFfd8kX4LJcXNj1GjQkt
         WkqkqZPfEyXRgXSFH8l9+TNviBHBX5FoYkj08gDogUeHzCTfoyhwu/CnJWTyMwLYddXx
         lMwGMmW0PzvRiAugA3ISpU7NObyJvIz/uQ6t7glwtgs2I/sptQFbt5AOGokYwcCgHBrW
         0Q4w==
X-Forwarded-Encrypted: i=1; AJvYcCXrV4F+FCTf7aNXDP4gAojBcptmPyVjQ6TCd40fN9u+rKBBAvWEqrTBByB7M7XAl08GMau6fP3ZU59ZFT8c7A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yza6FMxE7jHOZ95T3KG3A1/oIXDGihSI044IOzXY6l5gwch82Tm
	xiQgMIdvBGrYwLgfpVQ5xdmBvGmafury2OrT6yX5quXjeqYRgMVPi57u
X-Gm-Gg: ASbGnctM3HL5dxNkl9QFq4ijUL7i0f8LxYfhAWANQMmRKfau0QaTML7lr+cZrgRD+WU
	aZOF0lLgbh6aaukFK9J8K0QvTDNgMFLY+aBKUUFJpHkRa0eI2zUCWE9cfzN38bvViM0AbHIPELJ
	qxB56AqeJSYbvGgvHV5uHox1FOAiidRjeDdRUI9cEyp7TBrHAJijHPKHKIkZ54KHL9nEElM+QvX
	j6xFSYCwpOsLer+OPee4hpRKHvD79XzeU4B9fA8gXNrcUSFr/qHoW7RAdU0HtDrURYBI2VOLu8l
	79XAgb3ahqK6fZEVaUlxuqE83SELWpSvPNkmU+IPxfW/CD/iVBD6WpnIET3JcUX1T9J9WZFEsrL
	o4TFenPO/q6AyYX8BNGmuBRM82yCUefErEtu139wLZc6MEH3FAAN6cVNKjlCz58TegNrr0pvM
X-Google-Smtp-Source: AGHT+IHMZ4dTmg9rBoFgf4k6Xv8Sl8LTQqiUABCpUVik33hBUWlLJwkT2aFro3ElO6setbLK2gCNyQ==
X-Received: by 2002:a05:620a:7108:b0:89f:3bd5:cadb with SMTP id af79cd13be357-89f3bd5d9c8mr332094585a.49.1761409743386;
        Sat, 25 Oct 2025 09:29:03 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f254abccbsm171351185a.31.2025.10.25.09.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:29:02 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Vineet Gupta <vgupta@kernel.org>,
	"Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 01/21] arc: disasm: rename BITS() for FIELD()
Date: Sat, 25 Oct 2025 12:28:37 -0400
Message-ID: <20251025162858.305236-2-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025162858.305236-1-yury.norov@gmail.com>
References: <20251025162858.305236-1-yury.norov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_092905_477580_A08E61FA 
X-CRM114-Status: GOOD (  15.35  )
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

In preparation for adding generic BITS() macro, rename the local one.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 arch/arc/include/asm/disasm.h | 62 +++++++++++++++++------------------
 arch/arc/kernel/disasm.c      | 46 +++++++++++++-------------
 2 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/arch/arc/include/asm/disasm.h b/arch/arc/include/asm/disasm.h
index 61fb4d7affa7..33a0e88e1e8c 100644
--- a/arch/arc/include/asm/disasm.h
+++ b/arch/arc/include/asm/disasm.h
@@ -29,44 +29,44 @@ enum flow {
 };
 
 #define IS_BIT(word, n)		((word) & (1<<n))
-#define BITS(word, s, e)	(((word) >> (s)) & (~((-2) << ((e) - (s)))))
+#define FIELD(word, s, e)	(((word) >> (s)) & (~((-2) << ((e) - (s)))))
 
-#define MAJOR_OPCODE(word)	(BITS((word), 27, 31))
-#define MINOR_OPCODE(word)	(BITS((word), 16, 21))
-#define FIELD_A(word)		(BITS((word), 0, 5))
-#define FIELD_B(word)		((BITS((word), 12, 14)<<3) | \
-				(BITS((word), 24, 26)))
-#define FIELD_C(word)		(BITS((word), 6, 11))
+#define MAJOR_OPCODE(word)	(FIELD((word), 27, 31))
+#define MINOR_OPCODE(word)	(FIELD((word), 16, 21))
+#define FIELD_A(word)		(FIELD((word), 0, 5))
+#define FIELD_B(word)		((FIELD((word), 12, 14)<<3) | \
+				(FIELD((word), 24, 26)))
+#define FIELD_C(word)		(FIELD((word), 6, 11))
 #define FIELD_u6(word)		FIELDC(word)
-#define FIELD_s12(word)		sign_extend(((BITS((word), 0, 5) << 6) | \
-					BITS((word), 6, 11)), 12)
+#define FIELD_s12(word)		sign_extend(((FIELD((word), 0, 5) << 6) | \
+					FIELD((word), 6, 11)), 12)
 
 /* note that for BL/BRcc these two macro's need another AND statement to mask
  * out bit 1 (make the result a multiple of 4) */
-#define FIELD_s9(word)		sign_extend(((BITS(word, 15, 15) << 8) | \
-					BITS(word, 16, 23)), 9)
-#define FIELD_s21(word)		sign_extend(((BITS(word, 6, 15) << 11) | \
-					(BITS(word, 17, 26) << 1)), 12)
-#define FIELD_s25(word)		sign_extend(((BITS(word, 0, 3) << 21) | \
-					(BITS(word, 6, 15) << 11) | \
-					(BITS(word, 17, 26) << 1)), 12)
+#define FIELD_s9(word)		sign_extend(((FIELD(word, 15, 15) << 8) | \
+					FIELD(word, 16, 23)), 9)
+#define FIELD_s21(word)		sign_extend(((FIELD(word, 6, 15) << 11) | \
+					(FIELD(word, 17, 26) << 1)), 12)
+#define FIELD_s25(word)		sign_extend(((FIELD(word, 0, 3) << 21) | \
+					(FIELD(word, 6, 15) << 11) | \
+					(FIELD(word, 17, 26) << 1)), 12)
 
 /* note: these operate on 16 bits! */
-#define FIELD_S_A(word)		((BITS((word), 2, 2)<<3) | BITS((word), 0, 2))
-#define FIELD_S_B(word)		((BITS((word), 10, 10)<<3) | \
-				BITS((word), 8, 10))
-#define FIELD_S_C(word)		((BITS((word), 7, 7)<<3) | BITS((word), 5, 7))
-#define FIELD_S_H(word)		((BITS((word), 0, 2)<<3) | BITS((word), 5, 8))
-#define FIELD_S_u5(word)	(BITS((word), 0, 4))
-#define FIELD_S_u6(word)	(BITS((word), 0, 4) << 1)
-#define FIELD_S_u7(word)	(BITS((word), 0, 4) << 2)
-#define FIELD_S_u10(word)	(BITS((word), 0, 7) << 2)
-#define FIELD_S_s7(word)	sign_extend(BITS((word), 0, 5) << 1, 9)
-#define FIELD_S_s8(word)	sign_extend(BITS((word), 0, 7) << 1, 9)
-#define FIELD_S_s9(word)	sign_extend(BITS((word), 0, 8), 9)
-#define FIELD_S_s10(word)	sign_extend(BITS((word), 0, 8) << 1, 10)
-#define FIELD_S_s11(word)	sign_extend(BITS((word), 0, 8) << 2, 11)
-#define FIELD_S_s13(word)	sign_extend(BITS((word), 0, 10) << 2, 13)
+#define FIELD_S_A(word)		((FIELD((word), 2, 2)<<3) | FIELD((word), 0, 2))
+#define FIELD_S_B(word)		((FIELD((word), 10, 10)<<3) | \
+				FIELD((word), 8, 10))
+#define FIELD_S_C(word)		((FIELD((word), 7, 7)<<3) | FIELD((word), 5, 7))
+#define FIELD_S_H(word)		((FIELD((word), 0, 2)<<3) | FIELD((word), 5, 8))
+#define FIELD_S_u5(word)	(FIELD((word), 0, 4))
+#define FIELD_S_u6(word)	(FIELD((word), 0, 4) << 1)
+#define FIELD_S_u7(word)	(FIELD((word), 0, 4) << 2)
+#define FIELD_S_u10(word)	(FIELD((word), 0, 7) << 2)
+#define FIELD_S_s7(word)	sign_extend(FIELD((word), 0, 5) << 1, 9)
+#define FIELD_S_s8(word)	sign_extend(FIELD((word), 0, 7) << 1, 9)
+#define FIELD_S_s9(word)	sign_extend(FIELD((word), 0, 8), 9)
+#define FIELD_S_s10(word)	sign_extend(FIELD((word), 0, 8) << 1, 10)
+#define FIELD_S_s11(word)	sign_extend(FIELD((word), 0, 8) << 2, 11)
+#define FIELD_S_s13(word)	sign_extend(FIELD((word), 0, 10) << 2, 13)
 
 #define STATUS32_L		0x00000100
 #define REG_LIMM		62
diff --git a/arch/arc/kernel/disasm.c b/arch/arc/kernel/disasm.c
index ccc7e8c39eb3..926b67c40346 100644
--- a/arch/arc/kernel/disasm.c
+++ b/arch/arc/kernel/disasm.c
@@ -100,12 +100,12 @@ void __kprobes disasm_instr(unsigned long addr, struct disasm_state *state,
 
 	case op_LD:  /* LD<zz> a,[b,s9] */
 		state->write = 0;
-		state->di = BITS(state->words[0], 11, 11);
+		state->di = FIELD(state->words[0], 11, 11);
 		if (state->di)
 			break;
-		state->x = BITS(state->words[0], 6, 6);
-		state->zz = BITS(state->words[0], 7, 8);
-		state->aa = BITS(state->words[0], 9, 10);
+		state->x = FIELD(state->words[0], 6, 6);
+		state->zz = FIELD(state->words[0], 7, 8);
+		state->aa = FIELD(state->words[0], 9, 10);
 		state->wb_reg = FIELD_B(state->words[0]);
 		if (state->wb_reg == REG_LIMM) {
 			state->instr_len += 4;
@@ -121,11 +121,11 @@ void __kprobes disasm_instr(unsigned long addr, struct disasm_state *state,
 
 	case op_ST:
 		state->write = 1;
-		state->di = BITS(state->words[0], 5, 5);
+		state->di = FIELD(state->words[0], 5, 5);
 		if (state->di)
 			break;
-		state->aa = BITS(state->words[0], 3, 4);
-		state->zz = BITS(state->words[0], 1, 2);
+		state->aa = FIELD(state->words[0], 3, 4);
+		state->zz = FIELD(state->words[0], 1, 2);
 		state->src1 = FIELD_C(state->words[0]);
 		if (state->src1 == REG_LIMM) {
 			state->instr_len += 4;
@@ -160,7 +160,7 @@ void __kprobes disasm_instr(unsigned long addr, struct disasm_state *state,
 				is_linked = 1;
 
 			fieldCisReg = 0;
-			op_format = BITS(state->words[0], 22, 23);
+			op_format = FIELD(state->words[0], 22, 23);
 			if (op_format == 0 || ((op_format == 3) &&
 				(!IS_BIT(state->words[0], 5)))) {
 				fieldC = FIELD_C(state->words[0]);
@@ -192,7 +192,7 @@ void __kprobes disasm_instr(unsigned long addr, struct disasm_state *state,
 			break;
 
 		case 40:	/* LPcc */
-			if (BITS(state->words[0], 22, 23) == 3) {
+			if (FIELD(state->words[0], 22, 23) == 3) {
 				/* Conditional LPcc u7 */
 				fieldC = FIELD_C(state->words[0]);
 
@@ -207,12 +207,12 @@ void __kprobes disasm_instr(unsigned long addr, struct disasm_state *state,
 			break;
 
 		case 48 ... 55:	/* LD a,[b,c] */
-			state->di = BITS(state->words[0], 15, 15);
+			state->di = FIELD(state->words[0], 15, 15);
 			if (state->di)
 				break;
-			state->x = BITS(state->words[0], 16, 16);
-			state->zz = BITS(state->words[0], 17, 18);
-			state->aa = BITS(state->words[0], 22, 23);
+			state->x = FIELD(state->words[0], 16, 16);
+			state->zz = FIELD(state->words[0], 17, 18);
+			state->aa = FIELD(state->words[0], 22, 23);
 			state->wb_reg = FIELD_B(state->words[0]);
 			if (state->wb_reg == REG_LIMM) {
 				state->instr_len += 4;
@@ -237,7 +237,7 @@ void __kprobes disasm_instr(unsigned long addr, struct disasm_state *state,
 		case 10:	/* MOV */
 			/* still need to check for limm to extract instr len */
 			/* MOV is special case because it only takes 2 args */
-			switch (BITS(state->words[0], 22, 23)) {
+			switch (FIELD(state->words[0], 22, 23)) {
 			case 0: /* OP a,b,c */
 				if (FIELD_C(state->words[0]) == REG_LIMM)
 					state->instr_len += 4;
@@ -258,7 +258,7 @@ void __kprobes disasm_instr(unsigned long addr, struct disasm_state *state,
 		default:
 			/* Not a Load, Jump or Loop instruction */
 			/* still need to check for limm to extract instr len */
-			switch (BITS(state->words[0], 22, 23)) {
+			switch (FIELD(state->words[0], 22, 23)) {
 			case 0: /* OP a,b,c */
 				if ((FIELD_B(state->words[0]) == REG_LIMM) ||
 				    (FIELD_C(state->words[0]) == REG_LIMM))
@@ -281,7 +281,7 @@ void __kprobes disasm_instr(unsigned long addr, struct disasm_state *state,
 
 	/* 16 Bit Instructions */
 	case op_LD_ADD: /* LD_S|LDB_S|LDW_S a,[b,c] */
-		state->zz = BITS(state->words[0], 3, 4);
+		state->zz = FIELD(state->words[0], 3, 4);
 		state->src1 = get_reg(FIELD_S_B(state->words[0]), regs, cregs);
 		state->src2 = get_reg(FIELD_S_C(state->words[0]), regs, cregs);
 		state->dest = FIELD_S_A(state->words[0]);
@@ -289,13 +289,13 @@ void __kprobes disasm_instr(unsigned long addr, struct disasm_state *state,
 
 	case op_ADD_MOV_CMP:
 		/* check for limm, ignore mov_s h,b (== mov_s 0,b) */
-		if ((BITS(state->words[0], 3, 4) < 3) &&
+		if ((FIELD(state->words[0], 3, 4) < 3) &&
 		    (FIELD_S_H(state->words[0]) == REG_LIMM))
 			state->instr_len += 4;
 		break;
 
 	case op_S:
-		subopcode = BITS(state->words[0], 5, 7);
+		subopcode = FIELD(state->words[0], 5, 7);
 		switch (subopcode) {
 		case 0:	/* j_s */
 		case 1:	/* j_s.d */
@@ -308,7 +308,7 @@ void __kprobes disasm_instr(unsigned long addr, struct disasm_state *state,
 				direct_call : indirect_jump;
 			break;
 		case 7:
-			switch (BITS(state->words[0], 8, 10)) {
+			switch (FIELD(state->words[0], 8, 10)) {
 			case 4:	/* jeq_s [blink] */
 			case 5:	/* jne_s [blink] */
 			case 6:	/* j_s [blink] */
@@ -367,8 +367,8 @@ void __kprobes disasm_instr(unsigned long addr, struct disasm_state *state,
 		/* note: we are ignoring possibility of:
 		 * ADD_S, SUB_S, PUSH_S, POP_S as these should not
 		 * cause unaligned exception anyway */
-		state->write = BITS(state->words[0], 6, 6);
-		state->zz = BITS(state->words[0], 5, 5);
+		state->write = FIELD(state->words[0], 6, 6);
+		state->zz = FIELD(state->words[0], 5, 5);
 		if (state->zz)
 			break;	/* byte accesses should not come here */
 		if (!state->write) {
@@ -385,7 +385,7 @@ void __kprobes disasm_instr(unsigned long addr, struct disasm_state *state,
 
 	case op_GP:	/* LD_S|LDB_S|LDW_S r0,[gp,s11/s9/s10] */
 		/* note: ADD_S r0, gp, s11 is ignored */
-		state->zz = BITS(state->words[0], 9, 10);
+		state->zz = FIELD(state->words[0], 9, 10);
 		state->src1 = get_reg(26, regs, cregs);
 		state->src2 = state->zz ? FIELD_S_s10(state->words[0]) :
 			FIELD_S_s11(state->words[0]);
@@ -405,7 +405,7 @@ void __kprobes disasm_instr(unsigned long addr, struct disasm_state *state,
 		break;
 
 	case op_B_S:
-		fieldA = (BITS(state->words[0], 9, 10) == 3) ?
+		fieldA = (FIELD(state->words[0], 9, 10) == 3) ?
 			FIELD_S_s7(state->words[0]) :
 			FIELD_S_s10(state->words[0]);
 		state->target = fieldA + (addr & ~0x03);
-- 
2.43.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
