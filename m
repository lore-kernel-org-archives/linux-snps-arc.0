Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A42C25B5C
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Apr 2024 15:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kGiTvuM8jDAgGvanQGnEQln/XfGm+mpzcJPmVw1WaAI=; b=c+Cd8YNMiQ5f+g
	lrq2RdQulj5uckXFk/sDyyZDIA2Y6QnT1AB+cskA6e7PzKeurJD1t7o7KVV9+TXXvnnu/QKe2vuUS
	8KpeloNqg4DuVy5p0G0wiv0HsmMwPNpn+in35tAgN+SVwrBco+oW69oGBVqKHAfQv1sBgaQ3alguM
	alEL+YD06uUXIN2eIzxK0qJwcjOHDC4ZKIOjuiGj+XO59scNxQ/pERsWiFTAoX5gTeNC7kA/zGbAf
	2t0mQYrdt7whsHuN+D31cn27thyEL2GOg9IvgyUEYobZ4ZT/qiISqjpohGRcoGX+eLv/+IeIdBd7f
	aAZjUC8T9l8a4CnVyjMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1p7c-0000000704x-2t1T;
	Tue, 30 Apr 2024 15:10:20 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1p7U-00000006zwM-1LPy
	for linux-snps-arc@lists.infradead.org;
	Tue, 30 Apr 2024 15:10:19 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vahedi.org; s=key1;
	t=1714489809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VfSnPeVCVkUGi4VI5lIsW6g4DNHbR+mnvz8KC46gLFc=;
	b=PAP61obuORUIIwCQU7VdC6J1sNwb2X9tOuT+/KoWAvP2joyQDKaeUnvCBaAvWv33JtwNpE
	SPc+5+tJdrViDWlhaLpaKgwV7G05G0tOKPV0QEgCsTeCLI4zazaqujn+xXaFfiKsP25xh+
	caQHj2qP+V7gZPp3wWZjeR3GZ0LzqZWAtH5d8dd+BQ4j+SWCeMkbKEpmXSBJtzeMNGvi3s
	VHVnSAL69TWUcQ3f497yAGA6VmWYtoNM5UdqyE58dHp6YlfGw6BOph0E9FK2rhPVghUGbB
	q7oyFm7khBGC4WzQqen4fmk6qrP9LpwNbMhwp/AhuQMVid43in9OnVlRjTjCAA==
From: Shahab Vahedi <list+bpf@vahedi.org>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
Cc: Shahab Vahedi <list+bpf@vahedi.org>,
	Shahab Vahedi <shahab@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH 6/7] v2: Fix most of the "Checks" from "checkpatch.pl"
Date: Tue, 30 Apr 2024 17:09:36 +0200
Message-Id: <20240430150937.39793-7-list+bpf@vahedi.org>
In-Reply-To: <20240430150937.39793-1-list+bpf@vahedi.org>
References: <20240430150937.39793-1-list+bpf@vahedi.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_081013_486606_50D4A204 
X-CRM114-Status: GOOD (  11.01  )
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

If they're left untouched, then it was decided like that.

The command that was used for checkpatch.pl:

$ checkpatch.pl ... --strict --no-signoff                          \
                    --ignore AVOID_BUG,SPLIT_STRING,COMMIT_MESSAGE \
                    --git <before_start>..<end>
---
 arch/arc/net/bpf_jit.h       | 121 ++++++++++++++++++-----------------
 arch/arc/net/bpf_jit_arcv2.c |  84 ++++++++++++------------
 arch/arc/net/bpf_jit_core.c  |  67 ++++++++++---------
 3 files changed, 135 insertions(+), 137 deletions(-)

diff --git a/arch/arc/net/bpf_jit.h b/arch/arc/net/bpf_jit.h
index 9fc70d97415b..ec44873c42d1 100644
--- a/arch/arc/net/bpf_jit.h
+++ b/arch/arc/net/bpf_jit.h
@@ -39,75 +39,75 @@
 
 /************** Functions that the back-end must provide **************/
 /* Extension for 32-bit operations. */
-extern inline u8 zext(u8 *buf, u8 rd);
+inline u8 zext(u8 *buf, u8 rd);
 /***** Moves *****/
-extern u8 mov_r32(u8 *buf, u8 rd, u8 rs, u8 sign_ext);
-extern u8 mov_r32_i32(u8 *buf, u8 reg, s32 imm);
-extern u8 mov_r64(u8 *buf, u8 rd, u8 rs, u8 sign_ext);
-extern u8 mov_r64_i32(u8 *buf, u8 reg, s32 imm);
-extern u8 mov_r64_i64(u8 *buf, u8 reg, u32 lo, u32 hi);
+u8 mov_r32(u8 *buf, u8 rd, u8 rs, u8 sign_ext);
+u8 mov_r32_i32(u8 *buf, u8 reg, s32 imm);
+u8 mov_r64(u8 *buf, u8 rd, u8 rs, u8 sign_ext);
+u8 mov_r64_i32(u8 *buf, u8 reg, s32 imm);
+u8 mov_r64_i64(u8 *buf, u8 reg, u32 lo, u32 hi);
 /***** Loads and stores *****/
-extern u8 load_r(u8 *buf, u8 rd, u8 rs, s16 off, u8 size, bool sign_ext);
-extern u8 store_r(u8 *buf, u8 rd, u8 rs, s16 off, u8 size);
-extern u8 store_i(u8 *buf, s32 imm, u8 rd, s16 off, u8 size);
+u8 load_r(u8 *buf, u8 rd, u8 rs, s16 off, u8 size, bool sign_ext);
+u8 store_r(u8 *buf, u8 rd, u8 rs, s16 off, u8 size);
+u8 store_i(u8 *buf, s32 imm, u8 rd, s16 off, u8 size);
 /***** Addition *****/
-extern u8 add_r32(u8 *buf, u8 rd, u8 rs);
-extern u8 add_r32_i32(u8 *buf, u8 rd, s32 imm);
-extern u8 add_r64(u8 *buf, u8 rd, u8 rs);
-extern u8 add_r64_i32(u8 *buf, u8 rd, s32 imm);
+u8 add_r32(u8 *buf, u8 rd, u8 rs);
+u8 add_r32_i32(u8 *buf, u8 rd, s32 imm);
+u8 add_r64(u8 *buf, u8 rd, u8 rs);
+u8 add_r64_i32(u8 *buf, u8 rd, s32 imm);
 /***** Subtraction *****/
-extern u8 sub_r32(u8 *buf, u8 rd, u8 rs);
-extern u8 sub_r32_i32(u8 *buf, u8 rd, s32 imm);
-extern u8 sub_r64(u8 *buf, u8 rd, u8 rs);
-extern u8 sub_r64_i32(u8 *buf, u8 rd, s32 imm);
+u8 sub_r32(u8 *buf, u8 rd, u8 rs);
+u8 sub_r32_i32(u8 *buf, u8 rd, s32 imm);
+u8 sub_r64(u8 *buf, u8 rd, u8 rs);
+u8 sub_r64_i32(u8 *buf, u8 rd, s32 imm);
 /***** Multiplication *****/
-extern u8 mul_r32(u8 *buf, u8 rd, u8 rs);
-extern u8 mul_r32_i32(u8 *buf, u8 rd, s32 imm);
-extern u8 mul_r64(u8 *buf, u8 rd, u8 rs);
-extern u8 mul_r64_i32(u8 *buf, u8 rd, s32 imm);
+u8 mul_r32(u8 *buf, u8 rd, u8 rs);
+u8 mul_r32_i32(u8 *buf, u8 rd, s32 imm);
+u8 mul_r64(u8 *buf, u8 rd, u8 rs);
+u8 mul_r64_i32(u8 *buf, u8 rd, s32 imm);
 /***** Division *****/
-extern u8 div_r32(u8 *buf, u8 rd, u8 rs, bool sign_ext);
-extern u8 div_r32_i32(u8 *buf, u8 rd, s32 imm, bool sign_ext);
+u8 div_r32(u8 *buf, u8 rd, u8 rs, bool sign_ext);
+u8 div_r32_i32(u8 *buf, u8 rd, s32 imm, bool sign_ext);
 /***** Remainder *****/
-extern u8 mod_r32(u8 *buf, u8 rd, u8 rs, bool sign_ext);
-extern u8 mod_r32_i32(u8 *buf, u8 rd, s32 imm, bool sign_ext);
+u8 mod_r32(u8 *buf, u8 rd, u8 rs, bool sign_ext);
+u8 mod_r32_i32(u8 *buf, u8 rd, s32 imm, bool sign_ext);
 /***** Bitwise AND *****/
-extern u8 and_r32(u8 *buf, u8 rd, u8 rs);
-extern u8 and_r32_i32(u8 *buf, u8 rd, s32 imm);
-extern u8 and_r64(u8 *buf, u8 rd, u8 rs);
-extern u8 and_r64_i32(u8 *buf, u8 rd, s32 imm);
+u8 and_r32(u8 *buf, u8 rd, u8 rs);
+u8 and_r32_i32(u8 *buf, u8 rd, s32 imm);
+u8 and_r64(u8 *buf, u8 rd, u8 rs);
+u8 and_r64_i32(u8 *buf, u8 rd, s32 imm);
 /***** Bitwise OR *****/
-extern u8 or_r32(u8 *buf, u8 rd, u8 rs);
-extern u8 or_r32_i32(u8 *buf, u8 rd, s32 imm);
-extern u8 or_r64(u8 *buf, u8 rd, u8 rs);
-extern u8 or_r64_i32(u8 *buf, u8 rd, s32 imm);
+u8 or_r32(u8 *buf, u8 rd, u8 rs);
+u8 or_r32_i32(u8 *buf, u8 rd, s32 imm);
+u8 or_r64(u8 *buf, u8 rd, u8 rs);
+u8 or_r64_i32(u8 *buf, u8 rd, s32 imm);
 /***** Bitwise XOR *****/
-extern u8 xor_r32(u8 *buf, u8 rd, u8 rs);
-extern u8 xor_r32_i32(u8 *buf, u8 rd, s32 imm);
-extern u8 xor_r64(u8 *buf, u8 rd, u8 rs);
-extern u8 xor_r64_i32(u8 *buf, u8 rd, s32 imm);
+u8 xor_r32(u8 *buf, u8 rd, u8 rs);
+u8 xor_r32_i32(u8 *buf, u8 rd, s32 imm);
+u8 xor_r64(u8 *buf, u8 rd, u8 rs);
+u8 xor_r64_i32(u8 *buf, u8 rd, s32 imm);
 /***** Bitwise Negate *****/
-extern u8 neg_r32(u8 *buf, u8 r);
-extern u8 neg_r64(u8 *buf, u8 r);
+u8 neg_r32(u8 *buf, u8 r);
+u8 neg_r64(u8 *buf, u8 r);
 /***** Bitwise left shift *****/
-extern u8 lsh_r32(u8 *buf, u8 rd, u8 rs);
-extern u8 lsh_r32_i32(u8 *buf, u8 rd, u8 imm);
-extern u8 lsh_r64(u8 *buf, u8 rd, u8 rs);
-extern u8 lsh_r64_i32(u8 *buf, u8 rd, s32 imm);
+u8 lsh_r32(u8 *buf, u8 rd, u8 rs);
+u8 lsh_r32_i32(u8 *buf, u8 rd, u8 imm);
+u8 lsh_r64(u8 *buf, u8 rd, u8 rs);
+u8 lsh_r64_i32(u8 *buf, u8 rd, s32 imm);
 /***** Bitwise right shift (logical) *****/
-extern u8 rsh_r32(u8 *buf, u8 rd, u8 rs);
-extern u8 rsh_r32_i32(u8 *buf, u8 rd, u8 imm);
-extern u8 rsh_r64(u8 *buf, u8 rd, u8 rs);
-extern u8 rsh_r64_i32(u8 *buf, u8 rd, s32 imm);
+u8 rsh_r32(u8 *buf, u8 rd, u8 rs);
+u8 rsh_r32_i32(u8 *buf, u8 rd, u8 imm);
+u8 rsh_r64(u8 *buf, u8 rd, u8 rs);
+u8 rsh_r64_i32(u8 *buf, u8 rd, s32 imm);
 /***** Bitwise right shift (arithmetic) *****/
-extern u8 arsh_r32(u8 *buf, u8 rd, u8 rs);
-extern u8 arsh_r32_i32(u8 *buf, u8 rd, u8 imm);
-extern u8 arsh_r64(u8 *buf, u8 rd, u8 rs);
-extern u8 arsh_r64_i32(u8 *buf, u8 rd, s32 imm);
+u8 arsh_r32(u8 *buf, u8 rd, u8 rs);
+u8 arsh_r32_i32(u8 *buf, u8 rd, u8 imm);
+u8 arsh_r64(u8 *buf, u8 rd, u8 rs);
+u8 arsh_r64_i32(u8 *buf, u8 rd, s32 imm);
 /***** Frame related *****/
-extern u32 mask_for_used_regs(u8 bpf_reg, bool is_call);
-extern u8 arc_prologue(u8 *buf, u32 usage, u16 frame_size);
-extern u8 arc_epilogue(u8 *buf, u32 usage, u16 frame_size);
+u32 mask_for_used_regs(u8 bpf_reg, bool is_call);
+u8 arc_prologue(u8 *buf, u32 usage, u16 frame_size);
+u8 arc_epilogue(u8 *buf, u32 usage, u16 frame_size);
 /***** Jumps *****/
 /*
  * Different sorts of conditions (ARC enum as opposed to BPF_*).
@@ -130,6 +130,7 @@ enum ARC_CC {
 	ARC_CC_SET,		/* test        */
 	ARC_CC_LAST
 };
+
 /*
  * A few notes:
  *
@@ -144,13 +145,13 @@ enum ARC_CC {
  *   things simpler (offsets are in the range of u32 which is more than
  *   enough).
  */
-extern bool check_jmp_32(u32 curr_off, u32 targ_off, u8 cond);
-extern bool check_jmp_64(u32 curr_off, u32 targ_off, u8 cond);
-extern u8 gen_jmp_32(u8 *buf, u8 rd, u8 rs, u8 cond, u32 c_off, u32 t_off);
-extern u8 gen_jmp_64(u8 *buf, u8 rd, u8 rs, u8 cond, u32 c_off, u32 t_off);
+bool check_jmp_32(u32 curr_off, u32 targ_off, u8 cond);
+bool check_jmp_64(u32 curr_off, u32 targ_off, u8 cond);
+u8 gen_jmp_32(u8 *buf, u8 rd, u8 rs, u8 cond, u32 c_off, u32 t_off);
+u8 gen_jmp_64(u8 *buf, u8 rd, u8 rs, u8 cond, u32 c_off, u32 t_off);
 /***** Miscellaneous *****/
-extern u8 gen_func_call(u8 *buf, ARC_ADDR func_addr, bool external_func);
-extern u8 arc_to_bpf_return(u8 *buf);
+u8 gen_func_call(u8 *buf, ARC_ADDR func_addr, bool external_func);
+u8 arc_to_bpf_return(u8 *buf);
 /*
  * - Perform byte swaps on "rd" based on the "size".
  * - If "force" is set, do it unconditionally. Otherwise, consider the
diff --git a/arch/arc/net/bpf_jit_arcv2.c b/arch/arc/net/bpf_jit_arcv2.c
index 8b7ae2f11f38..31bfb6e9ce00 100644
--- a/arch/arc/net/bpf_jit_arcv2.c
+++ b/arch/arc/net/bpf_jit_arcv2.c
@@ -5,7 +5,7 @@
  * Copyright (c) 2024 Synopsys Inc.
  * Author: Shahab Vahedi <shahab@synopsys.com>
  */
-#include <asm/bug.h>
+#include <linux/bug.h>
 #include "bpf_jit.h"
 
 /* ARC core registers. */
@@ -91,7 +91,6 @@ const u8 bpf2arc[][2] = {
 #define REG_LO(r) (bpf2arc[(r)][0])
 #define REG_HI(r) (bpf2arc[(r)][1])
 
-
 /*
  * To comply with ARCv2 ABI, BPF's arg5 must be put on stack. After which,
  * the stack needs to be restored by ARG5_SIZE.
@@ -201,7 +200,7 @@ enum {
  * c:  cccccc		source
  */
 #define OPC_MOV_CC	0x20ca0000
-#define MOV_CC_I	(1 << 5)
+#define MOV_CC_I	BIT(5)
 #define OPC_MOVU_CC	(OPC_MOV_CC | MOV_CC_I)
 
 /*
@@ -289,7 +288,7 @@ enum {
 #define OPC_ADD		0x20000000
 /* Addition with updating the pertinent flags in "status32" register. */
 #define OPC_ADDF	(OPC_ADD | FLAG(1))
-#define ADDI		(1 << 22)
+#define ADDI		BIT(22)
 #define ADDI_U6(x)	OP_C(x)
 #define OPC_ADDI	(OPC_ADD | ADDI)
 #define OPC_ADDIF	(OPC_ADDI | FLAG(1))
@@ -307,7 +306,7 @@ enum {
  * c:  cccccc		the 2nd input operand
  */
 #define OPC_ADC		0x20010000
-#define ADCI		(1 << 22)
+#define ADCI		BIT(22)
 #define ADCI_U6(x)	OP_C(x)
 #define OPC_ADCI	(OPC_ADC | ADCI)
 
@@ -326,7 +325,7 @@ enum {
 #define OPC_SUB		0x20020000
 /* Subtraction with updating the pertinent flags in "status32" register. */
 #define OPC_SUBF	(OPC_SUB | FLAG(1))
-#define SUBI		(1 << 22)
+#define SUBI		BIT(22)
 #define SUBI_U6(x)	OP_C(x)
 #define OPC_SUBI	(OPC_SUB | SUBI)
 #define OPC_SUB_I	(OPC_SUB | OP_IMM)
@@ -526,7 +525,7 @@ enum {
  * c:  cccccc		amount to be shifted
  */
 #define OPC_ASL		0x28000000
-#define ASL_I		(1 << 22)
+#define ASL_I		BIT(22)
 #define ASLI_U6(x)	OP_C((x) & 31)
 #define OPC_ASLI	(OPC_ASL | ASL_I)
 
@@ -629,13 +628,13 @@ enum {
 
 static inline void emit_2_bytes(u8 *buf, u16 bytes)
 {
-	*((u16 *) buf) = bytes;
+	*((u16 *)buf) = bytes;
 }
 
 static inline void emit_4_bytes(u8 *buf, u32 bytes)
 {
-	emit_2_bytes(buf+0, bytes >>     16);
-	emit_2_bytes(buf+2, bytes  & 0xffff);
+	emit_2_bytes(buf, bytes >> 16);
+	emit_2_bytes(buf + 2, bytes & 0xffff);
 }
 
 static inline u8 bpf_to_arc_size(u8 size)
@@ -686,7 +685,7 @@ static u8 arc_mov_i(u8 *buf, u8 rd, s32 imm)
 
 	if (buf) {
 		emit_4_bytes(buf, insn);
-		emit_4_bytes(buf+INSN_len_normal, imm);
+		emit_4_bytes(buf + INSN_len_normal, imm);
 	}
 	return INSN_len_normal + INSN_len_imm;
 }
@@ -698,7 +697,7 @@ static u8 arc_mov_i_fixed(u8 *buf, u8 rd, s32 imm)
 
 	if (buf) {
 		emit_4_bytes(buf, insn);
-		emit_4_bytes(buf+INSN_len_normal, imm);
+		emit_4_bytes(buf + INSN_len_normal, imm);
 	}
 	return INSN_len_normal + INSN_len_imm;
 }
@@ -843,7 +842,7 @@ static u8 arc_add_i(u8 *buf, u8 ra, u8 rb, s32 imm)
 
 	if (buf) {
 		emit_4_bytes(buf, insn);
-		emit_4_bytes(buf+INSN_len_normal, imm);
+		emit_4_bytes(buf + INSN_len_normal, imm);
 	}
 	return INSN_len_normal + INSN_len_imm;
 }
@@ -905,7 +904,7 @@ static u8 arc_sub_i(u8 *buf, u8 ra, s32 imm)
 
 	if (buf) {
 		emit_4_bytes(buf, insn);
-		emit_4_bytes(buf+INSN_len_normal, imm);
+		emit_4_bytes(buf + INSN_len_normal, imm);
 	}
 	return INSN_len_normal + INSN_len_imm;
 }
@@ -974,7 +973,7 @@ static u8 arc_mpy_i(u8 *buf, u8 ra, u8 rb, s32 imm)
 
 	if (buf) {
 		emit_4_bytes(buf, insn);
-		emit_4_bytes(buf+INSN_len_normal, imm);
+		emit_4_bytes(buf + INSN_len_normal, imm);
 	}
 	return INSN_len_normal + INSN_len_imm;
 }
@@ -996,7 +995,7 @@ static u8 arc_mpydu_i(u8 *buf, u8 ra, s32 imm)
 
 	if (buf) {
 		emit_4_bytes(buf, insn);
-		emit_4_bytes(buf+INSN_len_normal, imm);
+		emit_4_bytes(buf + INSN_len_normal, imm);
 	}
 	return INSN_len_normal + INSN_len_imm;
 }
@@ -1018,7 +1017,7 @@ static u8 arc_divu_i(u8 *buf, u8 rd, s32 imm)
 
 	if (buf) {
 		emit_4_bytes(buf, insn);
-		emit_4_bytes(buf+INSN_len_normal, imm);
+		emit_4_bytes(buf + INSN_len_normal, imm);
 	}
 	return INSN_len_normal + INSN_len_imm;
 }
@@ -1040,7 +1039,7 @@ static u8 arc_divs_i(u8 *buf, u8 rd, s32 imm)
 
 	if (buf) {
 		emit_4_bytes(buf, insn);
-		emit_4_bytes(buf+INSN_len_normal, imm);
+		emit_4_bytes(buf + INSN_len_normal, imm);
 	}
 	return INSN_len_normal + INSN_len_imm;
 }
@@ -1062,7 +1061,7 @@ static u8 arc_remu_i(u8 *buf, u8 rd, s32 imm)
 
 	if (buf) {
 		emit_4_bytes(buf, insn);
-		emit_4_bytes(buf+INSN_len_normal, imm);
+		emit_4_bytes(buf + INSN_len_normal, imm);
 	}
 	return INSN_len_normal + INSN_len_imm;
 }
@@ -1084,7 +1083,7 @@ static u8 arc_rems_i(u8 *buf, u8 rd, s32 imm)
 
 	if (buf) {
 		emit_4_bytes(buf, insn);
-		emit_4_bytes(buf+INSN_len_normal, imm);
+		emit_4_bytes(buf + INSN_len_normal, imm);
 	}
 	return INSN_len_normal + INSN_len_imm;
 }
@@ -1106,7 +1105,7 @@ static u8 arc_and_i(u8 *buf, u8 rd, s32 imm)
 
 	if (buf) {
 		emit_4_bytes(buf, insn);
-		emit_4_bytes(buf+INSN_len_normal, imm);
+		emit_4_bytes(buf + INSN_len_normal, imm);
 	}
 	return INSN_len_normal + INSN_len_imm;
 }
@@ -1151,7 +1150,7 @@ static u8 arc_or_i(u8 *buf, u8 rd, s32 imm)
 
 	if (buf) {
 		emit_4_bytes(buf, insn);
-		emit_4_bytes(buf+INSN_len_normal, imm);
+		emit_4_bytes(buf + INSN_len_normal, imm);
 	}
 	return INSN_len_normal + INSN_len_imm;
 }
@@ -1171,7 +1170,7 @@ static u8 arc_xor_i(u8 *buf, u8 rd, s32 imm)
 
 	if (buf) {
 		emit_4_bytes(buf, insn);
-		emit_4_bytes(buf+INSN_len_normal, imm);
+		emit_4_bytes(buf + INSN_len_normal, imm);
 	}
 	return INSN_len_normal + INSN_len_imm;
 }
@@ -1449,7 +1448,7 @@ static u8 adjust_mem_access(u8 *buf, s16 *off, u8 size,
 	if (!IN_S9_RANGE(*off) ||
 	    (size == BPF_DW && !IN_S9_RANGE(*off + 4))) {
 		len += arc_add_i(BUF(buf, len),
-				 REG_LO(JIT_REG_TMP), REG_LO(rm), (u32) (*off));
+				 REG_LO(JIT_REG_TMP), REG_LO(rm), (u32)(*off));
 		*arc_reg_mem = REG_LO(JIT_REG_TMP);
 		*off = 0;
 	}
@@ -1468,7 +1467,7 @@ u8 store_r(u8 *buf, u8 rs, u8 rd, s16 off, u8 size)
 		len += arc_st_r(BUF(buf, len), REG_LO(rs), arc_reg_mem,
 				off, ZZ_4_byte);
 		len += arc_st_r(BUF(buf, len), REG_HI(rs), arc_reg_mem,
-				off+4, ZZ_4_byte);
+				off + 4, ZZ_4_byte);
 	} else {
 		u8 zz = bpf_to_arc_size(size);
 
@@ -1504,7 +1503,7 @@ u8 store_i(u8 *buf, s32 imm, u8 rd, s16 off, u8 size)
 		imm = (imm >= 0 ? 0 : -1);
 		len += arc_mov_i(BUF(buf, len), arc_rs, imm);
 		len += arc_st_r(BUF(buf, len), arc_rs, arc_reg_mem,
-				off+4, ZZ_4_byte);
+				off + 4, ZZ_4_byte);
 	} else {
 		u8 zz = bpf_to_arc_size(size);
 
@@ -1579,14 +1578,14 @@ u8 load_r(u8 *buf, u8 rd, u8 rs, s16 off, u8 size, bool sign_ext)
 		 */
 		if (REG_LO(rd) != arc_reg_mem) {
 			len += arc_ld_r(BUF(buf, len), REG_LO(rd), arc_reg_mem,
-					off+0, ZZ_4_byte);
+					off, ZZ_4_byte);
 			len += arc_ld_r(BUF(buf, len), REG_HI(rd), arc_reg_mem,
-					off+4, ZZ_4_byte);
+					off + 4, ZZ_4_byte);
 		} else {
 			len += arc_ld_r(BUF(buf, len), REG_HI(rd), arc_reg_mem,
-					off+4, ZZ_4_byte);
+					off + 4, ZZ_4_byte);
 			len += arc_ld_r(BUF(buf, len), REG_LO(rd), arc_reg_mem,
-					off+0, ZZ_4_byte);
+					off, ZZ_4_byte);
 		}
 	}
 
@@ -1984,7 +1983,7 @@ u8 lsh_r64_i32(u8 *buf, u8 rd, s32 imm)
 	const u8 t0   = REG_LO(JIT_REG_TMP);
 	const u8 B_lo = REG_LO(rd);
 	const u8 B_hi = REG_HI(rd);
-	const u8 n    = (u8) imm;
+	const u8 n    = (u8)imm;
 	u8 len = 0;
 
 	if (n == 0) {
@@ -2079,7 +2078,7 @@ u8 rsh_r64_i32(u8 *buf, u8 rd, s32 imm)
 	const u8 t0   = REG_LO(JIT_REG_TMP);
 	const u8 B_lo = REG_LO(rd);
 	const u8 B_hi = REG_HI(rd);
-	const u8 n    = (u8) imm;
+	const u8 n    = (u8)imm;
 	u8 len = 0;
 
 	if (n == 0) {
@@ -2177,7 +2176,7 @@ u8 arsh_r64_i32(u8 *buf, u8 rd, s32 imm)
 	const u8 t0   = REG_LO(JIT_REG_TMP);
 	const u8 B_lo = REG_LO(rd);
 	const u8 B_hi = REG_HI(rd);
-	const u8 n    = (u8) imm;
+	const u8 n    = (u8)imm;
 	u8 len = 0;
 
 	if (n == 0) {
@@ -2418,14 +2417,14 @@ u8 arc_prologue(u8 *buf, u32 usage, u16 frame_size)
 	}
 
 	/* Deal with fp last. */
-	if ((usage & BIT(ARC_R_FP)) || (frame_size > 0))
+	if ((usage & BIT(ARC_R_FP)) || frame_size > 0)
 		len += arc_push_r(BUF(buf, len), ARC_R_FP);
 
 	if (frame_size > 0)
 		len += frame_create(BUF(buf, len), frame_size);
 
 #ifdef ARC_BPF_JIT_DEBUG
-	if ((usage & BIT(ARC_R_FP)) && (frame_size == 0)) {
+	if ((usage & BIT(ARC_R_FP)) && frame_size == 0) {
 		pr_err("FP is being saved while there is no frame.");
 		BUG();
 	}
@@ -2452,7 +2451,7 @@ u8 arc_epilogue(u8 *buf, u32 usage, u16 frame_size)
 	u32 gp_regs = 0;
 
 #ifdef ARC_BPF_JIT_DEBUG
-	if ((usage & BIT(ARC_R_FP)) && (frame_size == 0)) {
+	if ((usage & BIT(ARC_R_FP)) && frame_size == 0) {
 		pr_err("FP is being saved while there is no frame.");
 		BUG();
 	}
@@ -2462,7 +2461,7 @@ u8 arc_epilogue(u8 *buf, u32 usage, u16 frame_size)
 		len += frame_restore(BUF(buf, len));
 
 	/* Deal with fp first. */
-	if ((usage & BIT(ARC_R_FP)) || (frame_size > 0))
+	if ((usage & BIT(ARC_R_FP)) || frame_size > 0)
 		len += arc_pop_r(BUF(buf, len), ARC_R_FP);
 
 	gp_regs = usage & ~(BIT(ARC_R_BLINK) | BIT(ARC_R_FP));
@@ -2533,12 +2532,12 @@ const struct {
 
 	struct {
 		u8 cond[JCC64_NR_OF_JMPS];
-	} jmp[ARC_CC_SLE+1];
+	} jmp[ARC_CC_SLE + 1];
 } arcv2_64_jccs = {
 	.jit_off = {
-		INSN_len_normal*1,
-		INSN_len_normal*2,
-		INSN_len_normal*4
+		INSN_len_normal * 1,
+		INSN_len_normal * 2,
+		INSN_len_normal * 4
 	},
 	/*
 	 *   cmp  rd_hi, rs_hi
@@ -2639,7 +2638,7 @@ const struct {
  */
 static inline s32 get_displacement(u32 curr_off, u32 targ_off)
 {
-	return (s32) (targ_off - (curr_off & ~3L));
+	return (s32)(targ_off - (curr_off & ~3L));
 }
 
 /*
@@ -2704,7 +2703,6 @@ static u8 gen_jset_64(u8 *buf, u8 rd, u8 rs, u32 curr_off, u32 targ_off)
 	return len;
 }
 
-
 /*
  * Verify if all the jumps for a JITed jcc64 operation are valid,
  * by consulting the data stored at "arcv2_64_jccs".
diff --git a/arch/arc/net/bpf_jit_core.c b/arch/arc/net/bpf_jit_core.c
index 6692272fa1ac..00c99b339b4a 100644
--- a/arch/arc/net/bpf_jit_core.c
+++ b/arch/arc/net/bpf_jit_core.c
@@ -5,7 +5,7 @@
  * Copyright (c) 2024 Synopsys Inc.
  * Author: Shahab Vahedi <shahab@synopsys.com>
  */
-#include <asm/bug.h>
+#include <linux/bug.h>
 #include "bpf_jit.h"
 
 /*
@@ -30,18 +30,18 @@ static void dump_bytes(const u8 *buf, u32 len, const char *header)
 
 	for (i = 0, j = 0; i < len; i++) {
 		/* Last input byte? */
-		if (i == len-1) {
-			j += scnprintf(line+j, 64-j, "0x%02x", buf[i]);
+		if (i == len - 1) {
+			j += scnprintf(line + j, 64 - j, "0x%02x", buf[i]);
 			pr_info("%s\n", line);
 			break;
 		}
 		/* End of line? */
 		else if (i % 8 == 7) {
-			j += scnprintf(line+j, 64-j, "0x%02x", buf[i]);
+			j += scnprintf(line + j, 64 - j, "0x%02x", buf[i]);
 			pr_info("%s\n", line);
 			j = 0;
 		} else {
-			j += scnprintf(line+j, 64-j, "0x%02x, ", buf[i]);
+			j += scnprintf(line + j, 64 - j, "0x%02x, ", buf[i]);
 		}
 	}
 }
@@ -126,7 +126,7 @@ static void vm_dump(const struct bpf_prog *prog)
 {
 #ifdef ARC_BPF_JIT_DEBUG
 	if (bpf_jit_enable > 1)
-		dump_bytes((u8 *) prog->insns, 8*prog->len, " VM  ");
+		dump_bytes((u8 *)prog->insns, 8 * prog->len, " VM  ");
 #endif
 }
 
@@ -222,8 +222,8 @@ static void jit_ctx_cleanup(struct jit_context *ctx)
 			bpf_jit_prog_release_other(ctx->orig_prog, ctx->prog);
 	}
 
-	maybe_free(ctx, (void **) &ctx->bpf2insn);
-	maybe_free(ctx, (void **) &ctx->jit_data);
+	maybe_free(ctx, (void **)&ctx->bpf2insn);
+	maybe_free(ctx, (void **)&ctx->jit_data);
 
 	if (!ctx->bpf2insn)
 		ctx->bpf2insn_valid = false;
@@ -267,8 +267,8 @@ static void analyze_reg_usage(struct jit_context *ctx)
 /* Verify that no instruction will be emitted when there is no buffer. */
 static inline int jit_buffer_check(const struct jit_context *ctx)
 {
-	if (ctx->emit == true) {
-		if (ctx->jit.buf == NULL) {
+	if (ctx->emit) {
+		if (!ctx->jit.buf) {
 			pr_err("bpf-jit: inconsistence state; no "
 			       "buffer to emit instructions.\n");
 			return -EINVAL;
@@ -333,7 +333,6 @@ static inline s32 get_index_for_insn(const struct jit_context *ctx,
 	return (insn - ctx->prog->insnsi);
 }
 
-
 /*
  * In most of the cases, the "offset" is read from "insn->off". However,
  * if it is an unconditional BPF_JMP32, then it comes from "insn->imm".
@@ -608,7 +607,7 @@ static int handle_jumps(const struct jit_context *ctx,
 	 *    (curr_off) will have increased to a point where the necessary
 	 *    instructions can be inserted by "gen_jmp_{32,64}()".
 	 */
-	if (has_imm(insn) && (cond != ARC_CC_AL)) {
+	if (has_imm(insn) && cond != ARC_CC_AL) {
 		if (j32) {
 			*len += mov_r32_i32(BUF(buf, *len), JIT_REG_TMP,
 					    insn->imm);
@@ -685,7 +684,7 @@ static int handle_call(struct jit_context *ctx,
 	if (!fixed && !addr)
 		set_need_for_extra_pass(ctx);
 
-	*len = gen_func_call(buf, (ARC_ADDR) addr, in_kernel_func);
+	*len = gen_func_call(buf, (ARC_ADDR)addr, in_kernel_func);
 
 	if (insn->src_reg != BPF_PSEUDO_CALL) {
 		/* Assigning ABI's return reg to JIT's return reg. */
@@ -714,7 +713,7 @@ static int handle_ld_imm64(struct jit_context *ctx,
 		return -EINVAL;
 	}
 
-	*len = mov_r64_i64(buf, insn->dst_reg, insn->imm, (insn+1)->imm);
+	*len = mov_r64_i64(buf, insn->dst_reg, insn->imm, (insn + 1)->imm);
 
 	if (bpf_pseudo_func(insn))
 		set_need_for_extra_pass(ctx);
@@ -841,7 +840,7 @@ static int handle_insn(struct jit_context *ctx, u32 idx)
 		break;
 	/* dst = src (32-bit) */
 	case BPF_ALU | BPF_MOV | BPF_X:
-		len = mov_r32(buf, dst, src, (u8) off);
+		len = mov_r32(buf, dst, src, (u8)off);
 		break;
 	/* dst = imm32 (32-bit) */
 	case BPF_ALU | BPF_MOV | BPF_K:
@@ -934,7 +933,7 @@ static int handle_insn(struct jit_context *ctx, u32 idx)
 		break;
 	/* dst = src (64-bit) */
 	case BPF_ALU64 | BPF_MOV | BPF_X:
-		len = mov_r64(buf, dst, src, (u8) off);
+		len = mov_r64(buf, dst, src, (u8)off);
 		break;
 	/* dst = imm32 (sign extend to 64-bit) */
 	case BPF_ALU64 | BPF_MOV | BPF_K:
@@ -1074,7 +1073,7 @@ static int handle_body(struct jit_context *ctx)
 		CHECK_RET(handle_insn(ctx, i));
 		if (ret > 0) {
 			/* "ret" is 1 if two (64-bit) chunks were consumed. */
-			ctx->bpf2insn[i+1] = ctx->bpf2insn[i];
+			ctx->bpf2insn[i + 1] = ctx->bpf2insn[i];
 			i++;
 		}
 	}
@@ -1103,7 +1102,7 @@ static void fill_ill_insn(void *area, unsigned int size)
 	const u16 unimp_s = 0x79e0;
 
 	if (size & 1) {
-		*((u8 *) area + (size - 1)) = 0xff;
+		*((u8 *)area + (size - 1)) = 0xff;
 		size -= 1;
 	}
 
@@ -1141,8 +1140,7 @@ static int jit_prepare_final_mem_alloc(struct jit_context *ctx)
 	}
 
 	if (ctx->need_extra_pass) {
-		ctx->jit_data = kzalloc(sizeof(struct arc_jit_data),
-					GFP_KERNEL);
+		ctx->jit_data = kzalloc(sizeof(*ctx->jit_data), GFP_KERNEL);
 		if (!ctx->jit_data)
 			return -ENOMEM;
 	}
@@ -1224,23 +1222,23 @@ static void jit_finalize(struct jit_context *ctx)
 {
 	struct bpf_prog *prog = ctx->prog;
 
-	ctx->success    = true;
-	prog->bpf_func  = (void *) ctx->jit.buf;
+	ctx->success = true;
+	prog->bpf_func = (void *)ctx->jit.buf;
 	prog->jited_len = ctx->jit.len;
-	prog->jited     = 1;
+	prog->jited = 1;
 
 	/* We're going to need this information for the "do_extra_pass()". */
 	if (ctx->need_extra_pass) {
 		ctx->jit_data->bpf_header = ctx->bpf_header;
-		ctx->jit_data->bpf2insn   = ctx->bpf2insn;
-		prog->aux->jit_data       = (void *) ctx->jit_data;
+		ctx->jit_data->bpf2insn = ctx->bpf2insn;
+		prog->aux->jit_data = (void *)ctx->jit_data;
 	} else {
 		/*
 		 * If things seem finalised, then mark the JITed memory
 		 * as R-X and flush it.
 		 */
 		bpf_jit_binary_lock_ro(ctx->bpf_header);
-		flush_icache_range((unsigned long) ctx->bpf_header,
+		flush_icache_range((unsigned long)ctx->bpf_header,
 				   (unsigned long)
 				   BUF(ctx->jit.buf, ctx->jit.len));
 		prog->aux->jit_data = NULL;
@@ -1258,30 +1256,31 @@ static void jit_finalize(struct jit_context *ctx)
  */
 static inline int check_jit_context(const struct bpf_prog *prog)
 {
-	if (prog->aux->jit_data == NULL) {
+	if (!prog->aux->jit_data) {
 		pr_notice("bpf-jit: no jit data for the extra pass.\n");
 		return 1;
-	} else
+	} else {
 		return 0;
+	}
 }
 
 /* Reuse the previous pass's data. */
 static int jit_resume_context(struct jit_context *ctx)
 {
 	struct arc_jit_data *jdata =
-		(struct arc_jit_data *) ctx->prog->aux->jit_data;
+		(struct arc_jit_data *)ctx->prog->aux->jit_data;
 
 	if (!jdata) {
 		pr_err("bpf-jit: no jit data for the extra pass.\n");
 		return -EINVAL;
 	}
 
-	ctx->jit.buf        = (u8 *) ctx->prog->bpf_func;
-	ctx->jit.len        = ctx->prog->jited_len;
-	ctx->bpf_header     = jdata->bpf_header;
-	ctx->bpf2insn       = (u32 *) jdata->bpf2insn;
+	ctx->jit.buf = (u8 *)ctx->prog->bpf_func;
+	ctx->jit.len = ctx->prog->jited_len;
+	ctx->bpf_header = jdata->bpf_header;
+	ctx->bpf2insn = (u32 *)jdata->bpf2insn;
 	ctx->bpf2insn_valid = ctx->bpf2insn ? true : false;
-	ctx->jit_data       = jdata;
+	ctx->jit_data = jdata;
 
 	return 0;
 }
-- 
2.35.8


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
