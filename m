Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FC0C10F16
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Apr 2024 15:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CcXgqQRLRGQ14AKgDtjIg2L9TmT3L5naKn5voquxoCQ=; b=fIauMcSf1FIgAe
	F73k5SSfDy5OJqWmZLKkMW6CbdsaAcUB9L+nrPsOgqTJINaVHP3mnZTHFW++4iSzgg48nbXnJJCBU
	u1MK1upFCpsbshA/GRcKxBbQ4+yJTzQ6g0yATpoXhFxK6oJpC7bV/x0X2ZO+0evLTQK5UAGzR8KO0
	G93ULtbkJN/wBE9tVV7BW5SeefOvdf/HN7lA7rLtkhQ7QtJEgd3M3hHTCSM1CnbxRU2m74XVvwpGS
	x8XUAGZey5RXiQrns4koJMAJktEYNEiBhyy1+nAxQ3XUY1XrQIUQ9R/EcsTvfumIhjjkGeYJciKhq
	B46rucNH9sT64GpjZcLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1p7Z-0000000702F-4AtN;
	Tue, 30 Apr 2024 15:10:18 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1p7T-00000006zv5-1xj7
	for linux-snps-arc@lists.infradead.org;
	Tue, 30 Apr 2024 15:10:14 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vahedi.org; s=key1;
	t=1714489808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9b3XzO2xzKYs1JrShujVR/pAtQLI0ERqzQjQ8vNsA4I=;
	b=nOOXDr/OMCVbEW51CdavyoRaKGoTqWyadwr1uaYqyj7X4mXJBKg1As4x7MbpHRqppt+w6Y
	+IvH9TwZn/3tsYjMtroZ3DMBc8DJ9EnuaCJbdiJ3wb6iY3bpKBTOVoVDS8jcI26gBQD4+H
	kMjhuzI49Cg/hacNvgfsvcAFs7X/k5ccxH4jAJcy0h6ZGlsS50UaeInUsCU8dYnZfPasu7
	4Vf/aUzlVxpGKKc0NCvgq/sPAqH+gu+j8eyJukCiXHs8Bb4+VATf5LdEkPfC3PiHAFY8P1
	UrQYy6qk/r/pCfmpzQx4DUCavV5DDwVevHhye3U2YbIRDGS6LGKGZT8wHi4DOA==
From: Shahab Vahedi <list+bpf@vahedi.org>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
Cc: Shahab Vahedi <list+bpf@vahedi.org>,
	Shahab Vahedi <shahab@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH 2/7] v2: Turn "zext_thyself" from global into a context var
Date: Tue, 30 Apr 2024 17:09:32 +0200
Message-Id: <20240430150937.39793-3-list+bpf@vahedi.org>
In-Reply-To: <20240430150937.39793-1-list+bpf@vahedi.org>
References: <20240430150937.39793-1-list+bpf@vahedi.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_081011_987746_0159A4E5 
X-CRM114-Status: GOOD (  23.79  )
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

From: Shahab Vahedi <shahab@synopsys.com>

also:

- Update some comments along the way.
- Refactor the gen_swap()'s "if/else" to present the logic better
- Remove "extern" from the proto-type
---
 arch/arc/net/bpf_jit.h       | 14 +++++-----
 arch/arc/net/bpf_jit_arcv2.c | 51 ++++++++++++++++++------------------
 arch/arc/net/bpf_jit_core.c  | 25 +++++++++---------
 3 files changed, 44 insertions(+), 46 deletions(-)

diff --git a/arch/arc/net/bpf_jit.h b/arch/arc/net/bpf_jit.h
index ecad47b8b796..9fc70d97415b 100644
--- a/arch/arc/net/bpf_jit.h
+++ b/arch/arc/net/bpf_jit.h
@@ -37,10 +37,6 @@
  */
 #define BUF(b, n) (((b) != NULL) ? ((b) + (n)) : (b))
 
-/************* Globals that have effects on code generation ***********/
-/* An indicator if zero-extend must be done for the 32-bit operations. */
-extern bool zext_thyself;
-
 /************** Functions that the back-end must provide **************/
 /* Extension for 32-bit operations. */
 extern inline u8 zext(u8 *buf, u8 rd);
@@ -156,10 +152,12 @@ extern u8 gen_jmp_64(u8 *buf, u8 rd, u8 rs, u8 cond, u32 c_off, u32 t_off);
 extern u8 gen_func_call(u8 *buf, ARC_ADDR func_addr, bool external_func);
 extern u8 arc_to_bpf_return(u8 *buf);
 /*
- * Perform byte swaps on "rd" based on the "size". If "force" is
- * set to "true", do it unconditionally. Otherwise, consider the
- * desired "endian"ness and the host endianness.
+ * - Perform byte swaps on "rd" based on the "size".
+ * - If "force" is set, do it unconditionally. Otherwise, consider the
+ *   desired "endian"ness and the host endianness.
+ * - For data "size"s up to 32 bits, perform a zero-extension if asked
+ *   by the "do_zext" boolean.
  */
-extern u8 gen_swap(u8 *buf, u8 rd, u8 size, u8 endian, bool force);
+u8 gen_swap(u8 *buf, u8 rd, u8 size, u8 endian, bool force, bool do_zext);
 
 #endif /* _ARC_BPF_JIT_H */
diff --git a/arch/arc/net/bpf_jit_arcv2.c b/arch/arc/net/bpf_jit_arcv2.c
index b9e803f04a36..8b7ae2f11f38 100644
--- a/arch/arc/net/bpf_jit_arcv2.c
+++ b/arch/arc/net/bpf_jit_arcv2.c
@@ -1305,7 +1305,7 @@ static u8 arc_b(u8 *buf, s32 offset)
 
 inline u8 zext(u8 *buf, u8 rd)
 {
-	if (zext_thyself && rd != BPF_REG_FP)
+	if (rd != BPF_REG_FP)
 		return arc_movi_r(buf, REG_HI(rd), 0);
 	else
 		return 0;
@@ -2198,7 +2198,7 @@ u8 arsh_r64_i32(u8 *buf, u8 rd, s32 imm)
 	return len;
 }
 
-u8 gen_swap(u8 *buf, u8 rd, u8 size, u8 endian, bool force)
+u8 gen_swap(u8 *buf, u8 rd, u8 size, u8 endian, bool force, bool do_zext)
 {
 	u8 len = 0;
 #ifdef __BIG_ENDIAN
@@ -2206,36 +2206,19 @@ u8 gen_swap(u8 *buf, u8 rd, u8 size, u8 endian, bool force)
 #else
 	const u8 host_endian = BPF_FROM_LE;
 #endif
-	/*
-	 * If the same endianness, there's not much to do other
-	 * than zeroing out the upper bytes based on the "size".
-	 */
-	if ((force == false) && (host_endian == endian)) {
-		switch (size) {
-		case 16:
-			len += arc_and_i(BUF(buf, len), REG_LO(rd), 0xffff);
-			fallthrough;
-		case 32:
-			len += zext(BUF(buf, len), rd);
-			fallthrough;
-		case 64:
-			break;
-		default:
-			/* The caller must have handled this. */
-		}
-	} else {
+	if (host_endian != endian || force) {
 		switch (size) {
 		case 16:
 			/*
 			 * r = B4B3_B2B1 << 16 --> r = B2B1_0000
-			 * swape(r) is 0000_B1B2
+			 * then, swape(r) would become the desired 0000_B1B2
 			 */
-			len += arc_asli_r(BUF(buf, len),
-					  REG_LO(rd), REG_LO(rd), 16);
+			len = arc_asli_r(buf, REG_LO(rd), REG_LO(rd), 16);
 			fallthrough;
 		case 32:
 			len += arc_swape_r(BUF(buf, len), REG_LO(rd));
-			len += zext(BUF(buf, len), rd);
+			if (do_zext)
+				len += zext(BUF(buf, len), rd);
 			break;
 		case 64:
 			/*
@@ -2245,7 +2228,7 @@ u8 gen_swap(u8 *buf, u8 rd, u8 size, u8 endian, bool force)
 			 *   hi ^= lo;
 			 * and then swap the bytes in "hi" and "lo".
 			 */
-			len += arc_xor_r(BUF(buf, len), REG_HI(rd), REG_LO(rd));
+			len  = arc_xor_r(buf, REG_HI(rd), REG_LO(rd));
 			len += arc_xor_r(BUF(buf, len), REG_LO(rd), REG_HI(rd));
 			len += arc_xor_r(BUF(buf, len), REG_HI(rd), REG_LO(rd));
 			len += arc_swape_r(BUF(buf, len), REG_LO(rd));
@@ -2254,6 +2237,24 @@ u8 gen_swap(u8 *buf, u8 rd, u8 size, u8 endian, bool force)
 		default:
 			/* The caller must have handled this. */
 		}
+	} else {
+		/*
+		 * If the same endianness, there's not much to do other
+		 * than zeroing out the upper bytes based on the "size".
+		 */
+		switch (size) {
+		case 16:
+			len = arc_and_i(buf, REG_LO(rd), 0xffff);
+			fallthrough;
+		case 32:
+			if (do_zext)
+				len += zext(BUF(buf, len), rd);
+			break;
+		case 64:
+			break;
+		default:
+			/* The caller must have handled this. */
+		}
 	}
 
 	return len;
diff --git a/arch/arc/net/bpf_jit_core.c b/arch/arc/net/bpf_jit_core.c
index eea1a469a195..79ec0bbf1153 100644
--- a/arch/arc/net/bpf_jit_core.c
+++ b/arch/arc/net/bpf_jit_core.c
@@ -8,9 +8,6 @@
 #include <asm/bug.h>
 #include "bpf_jit.h"
 
-/* Sane initial values for the globals */
-bool zext_thyself = true;
-
 /*
  * Check for the return value. A pattern used oftenly in this file.
  * There must be a "ret" variable of type "int" in the scope.
@@ -86,6 +83,7 @@ struct arc_jit_data {
  * jit:			The JIT buffer and its length.
  * bpf_header:		The JITed program header. "jit.buf" points inside it.
  * emit:		If set, opcodes are written to memory; else, a dry-run.
+ * do_zext:		If true, 32-bit sub-regs must be zero extended.
  * bpf2insn:		Maps BPF insn indices to their counterparts in jit.buf.
  * bpf2insn_valid:	Indicates if "bpf2ins" is populated with the mappings.
  * jit_data:		A piece of memory to transfer data to the next pass.
@@ -105,6 +103,7 @@ struct jit_context {
 	struct jit_buffer		jit;
 	struct bpf_binary_header	*bpf_header;
 	bool				emit;
+	bool				do_zext;
 	u32				*bpf2insn;
 	bool				bpf2insn_valid;
 	struct arc_jit_data		*jit_data;
@@ -185,7 +184,7 @@ static int jit_ctx_init(struct jit_context *ctx, struct bpf_prog *prog)
 	ctx->success            = false;
 
 	/* If the verifier doesn't zero-extend, then we have to do it. */
-	zext_thyself = !ctx->prog->aux->verifier_zext;
+	ctx->do_zext = !ctx->prog->aux->verifier_zext;
 
 	return 0;
 }
@@ -250,8 +249,7 @@ static void jit_ctx_cleanup(struct jit_context *ctx)
 	}
 
 	ctx->emit = false;
-	/* Global booleans set to false. */
-	zext_thyself = false;
+	ctx->do_zext = false;
 }
 
 /*
@@ -415,7 +413,7 @@ static inline void set_need_for_extra_pass(struct jit_context *ctx)
  * the back-end for the swap.
  */
 static int handle_swap(u8 *buf, u8 rd, u8 size, u8 endian,
-		       bool force, u8 *len)
+		       bool force, bool do_zext, u8 *len)
 {
 	/* Sanity check on the size. */
 	switch (size) {
@@ -428,7 +426,7 @@ static int handle_swap(u8 *buf, u8 rd, u8 size, u8 endian,
 		return -EINVAL;
 	}
 
-	*len = gen_swap(buf, rd, size, endian, force);
+	*len = gen_swap(buf, rd, size, endian, force, do_zext);
 
 	return 0;
 }
@@ -866,7 +864,7 @@ static int handle_insn(struct jit_context *ctx, u32 idx)
 	case BPF_ALU64 | BPF_END | BPF_FROM_LE: {
 		CHECK_RET(handle_swap(buf, dst, imm, BPF_SRC(code),
 				      BPF_CLASS(code) == BPF_ALU64,
-				      &len));
+				      ctx->do_zext, &len));
 		break;
 	}
 	/* dst += src (64-bit) */
@@ -1049,11 +1047,12 @@ static int handle_insn(struct jit_context *ctx, u32 idx)
 
 	if (BPF_CLASS(code) == BPF_ALU) {
 		/*
-		 * Even 64-bit swaps are of type BPF_ALU (and not BPF_ALU64).
-		 * Therefore, the routine responsible for "swap" specifically
-		 * takes care of calling "zext()" based on the input "size".
+		 * Skip the "swap" instructions. Even 64-bit swaps are of type
+		 * BPF_ALU (and not BPF_ALU64). Therefore, for the swaps, one
+		 * has to look at the "size" of the operations rather than the
+		 * ALU type. "gen_swap()" specifically takes care of that.
 		 */
-		if (BPF_OP(code) != BPF_END)
+		if (BPF_OP(code) != BPF_END && ctx->do_zext)
 			len += zext(BUF(buf, len), dst);
 	}
 
-- 
2.35.8


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
