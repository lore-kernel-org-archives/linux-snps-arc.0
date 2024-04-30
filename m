Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F25C4345F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Apr 2024 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PnfIws0tLRHoI/cm3f3ukdS9hD32o/VtXDQB15VSDCo=; b=12D6sHdXMUZ6Tb
	P4YCmJr1oNSCcGtvFDj6i33x6igDRzbI62SMxagPNZajo/jXyAo8E/vWOK3tNZkgR6DCMeT61qIO+
	/xbefrWX7ksGdqRnsA05NJUjIEzRprfXOezQ7o6Iepv4apcBZN1vJkVH8xZ/0pHrEuwAO83kE6DEJ
	5pSEAmb278E0LyDJBMeROKx6OrMmwjLoXdC5aqjT5wXqhrQjs5AXlZq11lamB/oiif6BxBbeFL4Lq
	7pBsYWaFdOT7LVSSlehXWu88mJWbiTZtH5OFZvVv7+mIspIoFo9an3IIwHJiO9N/9U8W8xG6LDoKg
	96ncQc9jQgX5TWwQ83xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1p7e-0000000706M-17PK;
	Tue, 30 Apr 2024 15:10:22 +0000
Received: from out-186.mta0.migadu.com ([2001:41d0:1004:224b::ba])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1p7S-00000006zuY-3o5E
	for linux-snps-arc@lists.infradead.org;
	Tue, 30 Apr 2024 15:10:20 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vahedi.org; s=key1;
	t=1714489807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q6O4rn8LEVEu5bXBOz4eYBHHtlqXHAQH3v2QTA0QKnc=;
	b=YX48wroB02hfc3aZWeqPMTiSluC9kxZHihviru3UYx8n7IWJ2TKrW8kOLq2ed4hvGRegPu
	W/e/YyXj4oRy1W2ORtSepB5L/gkTd2+mlqkGmOYwG7N7Ec6oScHbW0M9HScMvLxG0kwXZN
	2HukXnA5Stm+6yQSPLn2LYAlIkX7daYBvB6i1G+KdYDpiB8O6F5AR4gxoVbF3JEcHs7rZi
	EasubzL7BoAjPeyHTFr62byGeAqxewVqWmQTCLqKF0zWD5E9gJILM57r1U/UcSxsEWCqEJ
	HiqHs1kf+rGK9tyyLRX19Nqsuzq3NoiSF0HEx8ASZVcXgEPs7RHt9m8QytgdOw==
From: Shahab Vahedi <list+bpf@vahedi.org>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
Cc: Shahab Vahedi <list+bpf@vahedi.org>,
	Shahab Vahedi <shahab@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH 1/7] v2: Turn "emit" from global into a context var
Date: Tue, 30 Apr 2024 17:09:31 +0200
Message-Id: <20240430150937.39793-2-list+bpf@vahedi.org>
In-Reply-To: <20240430150937.39793-1-list+bpf@vahedi.org>
References: <20240430150937.39793-1-list+bpf@vahedi.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_081011_839256_A5A55579 
X-CRM114-Status: GOOD (  11.48  )
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

Plus an easter egg: Add "static" to do_{normal,extra}_pass() proto-type,
so GCC won't complain about missing proto-type before invocation.
---
 arch/arc/net/bpf_jit.h       |  14 +-
 arch/arc/net/bpf_jit_arcv2.c | 409 ++++++++++++++++++-----------------
 arch/arc/net/bpf_jit_core.c  |  78 +++----
 3 files changed, 256 insertions(+), 245 deletions(-)

diff --git a/arch/arc/net/bpf_jit.h b/arch/arc/net/bpf_jit.h
index 5c8b9eb0ac81..ecad47b8b796 100644
--- a/arch/arc/net/bpf_jit.h
+++ b/arch/arc/net/bpf_jit.h
@@ -26,14 +26,18 @@
  */
 #define JIT_REG_TMP MAX_BPF_JIT_REG
 
-/************* Globals that have effects on code generation ***********/
 /*
- * If "emit" is true, the instructions are actually generated. Else, the
- * generation part will be skipped and only the length of instruction is
- * returned by the responsible functions.
+ * Buffer access: If buffer "b" is not NULL, advance by "n" bytes.
+ *
+ * This macro must be used in any place that potentially requires a
+ * "buf + len". This way, we make sure that the "buf" argument for
+ * the underlying "arc_*(buf, ...)" ends up as NULL instead of something
+ * like "0+4" or "0+8", etc. Those "arc_*()" functions check their "buf"
+ * value to decide if instructions should be emitted or not.
  */
-extern bool emit;
+#define BUF(b, n) (((b) != NULL) ? ((b) + (n)) : (b))
 
+/************* Globals that have effects on code generation ***********/
 /* An indicator if zero-extend must be done for the 32-bit operations. */
 extern bool zext_thyself;
 
diff --git a/arch/arc/net/bpf_jit_arcv2.c b/arch/arc/net/bpf_jit_arcv2.c
index 8de8fb19a8d0..b9e803f04a36 100644
--- a/arch/arc/net/bpf_jit_arcv2.c
+++ b/arch/arc/net/bpf_jit_arcv2.c
@@ -661,7 +661,7 @@ static u8 arc_movi_r(u8 *buf, u8 reg, s16 imm)
 {
 	const u32 insn = OPC_MOVI | OP_B(reg) | MOVI_S12(imm);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -671,7 +671,7 @@ static u8 arc_mov_r(u8 *buf, u8 rd, u8 rs)
 {
 	const u32 insn = OPC_MOV | OP_B(rd) | OP_C(rs);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -684,7 +684,7 @@ static u8 arc_mov_i(u8 *buf, u8 rd, s32 imm)
 	if (IN_S12_RANGE(imm))
 		return arc_movi_r(buf, rd, imm);
 
-	if (emit) {
+	if (buf) {
 		emit_4_bytes(buf, insn);
 		emit_4_bytes(buf+INSN_len_normal, imm);
 	}
@@ -696,7 +696,7 @@ static u8 arc_mov_i_fixed(u8 *buf, u8 rd, s32 imm)
 {
 	const u32 insn = OPC_MOV | OP_B(rd) | OP_IMM;
 
-	if (emit) {
+	if (buf) {
 		emit_4_bytes(buf, insn);
 		emit_4_bytes(buf+INSN_len_normal, imm);
 	}
@@ -708,7 +708,7 @@ static u8 arc_mov_cc_r(u8 *buf, u8 cc, u8 rd, u8 rs)
 {
 	const u32 insn = OPC_MOV_CC | OP_B(rd) | OP_C(rs) | COND(cc);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -718,7 +718,7 @@ static u8 arc_movu_cc_r(u8 *buf, u8 cc, u8 rd, u8 imm)
 {
 	const u32 insn = OPC_MOVU_CC | OP_B(rd) | OP_C(imm) | COND(cc);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -728,7 +728,7 @@ static u8 arc_sexb_r(u8 *buf, u8 rd, u8 rs)
 {
 	const u32 insn = OPC_SEXB | OP_B(rd) | OP_C(rs);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -738,7 +738,7 @@ static u8 arc_sexh_r(u8 *buf, u8 rd, u8 rs)
 {
 	const u32 insn = OPC_SEXH | OP_B(rd) | OP_C(rs);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -749,7 +749,7 @@ static u8 arc_st_r(u8 *buf, u8 reg, u8 reg_mem, s16 off, u8 zz)
 	const u32 insn = OPC_STORE | STORE_ZZ(zz) | OP_C(reg) |
 		OP_B(reg_mem) | STORE_S9(off);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -759,7 +759,7 @@ static u8 arc_push_r(u8 *buf, u8 reg)
 {
 	const u32 insn = OPC_PUSH | OP_C(reg);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -770,7 +770,7 @@ static u8 arc_ld_r(u8 *buf, u8 reg, u8 reg_mem, s16 off, u8 zz)
 	const u32 insn = OPC_LDU | LOAD_ZZ(zz) | LOAD_C(reg) |
 		OP_B(reg_mem) | LOAD_S9(off);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -781,7 +781,7 @@ static u8 arc_ldx_r(u8 *buf, u8 reg, u8 reg_mem, s16 off, u8 zz)
 	const u32 insn = OPC_LDS | LOAD_ZZ(zz) | LOAD_C(reg) |
 		OP_B(reg_mem) | LOAD_S9(off);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -791,7 +791,7 @@ static u8 arc_pop_r(u8 *buf, u8 reg)
 {
 	const u32 insn = OPC_POP | LOAD_C(reg);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -801,7 +801,7 @@ static u8 arc_add_r(u8 *buf, u8 ra, u8 rc)
 {
 	const u32 insn = OPC_ADD | OP_A(ra) | OP_B(ra) | OP_C(rc);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -811,7 +811,7 @@ static u8 arc_addf_r(u8 *buf, u8 ra, u8 rc)
 {
 	const u32 insn = OPC_ADDF | OP_A(ra) | OP_B(ra) | OP_C(rc);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -821,7 +821,7 @@ static u8 arc_addif_r(u8 *buf, u8 ra, u8 u6)
 {
 	const u32 insn = OPC_ADDIF | OP_A(ra) | OP_B(ra) | ADDI_U6(u6);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -831,7 +831,7 @@ static u8 arc_addi_r(u8 *buf, u8 ra, u8 u6)
 {
 	const u32 insn = OPC_ADDI | OP_A(ra) | OP_B(ra) | ADDI_U6(u6);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -841,7 +841,7 @@ static u8 arc_add_i(u8 *buf, u8 ra, u8 rb, s32 imm)
 {
 	const u32 insn = OPC_ADD_I | OP_A(ra) | OP_B(rb);
 
-	if (emit) {
+	if (buf) {
 		emit_4_bytes(buf, insn);
 		emit_4_bytes(buf+INSN_len_normal, imm);
 	}
@@ -853,7 +853,7 @@ static u8 arc_adc_r(u8 *buf, u8 ra, u8 rc)
 {
 	const u32 insn = OPC_ADC | OP_A(ra) | OP_B(ra) | OP_C(rc);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -863,7 +863,7 @@ static u8 arc_adci_r(u8 *buf, u8 ra, u8 u6)
 {
 	const u32 insn = OPC_ADCI | OP_A(ra) | OP_B(ra) | ADCI_U6(u6);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -873,7 +873,7 @@ static u8 arc_sub_r(u8 *buf, u8 ra, u8 rc)
 {
 	const u32 insn = OPC_SUB | OP_A(ra) | OP_B(ra) | OP_C(rc);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -883,7 +883,7 @@ static u8 arc_subf_r(u8 *buf, u8 ra, u8 rc)
 {
 	const u32 insn = OPC_SUBF | OP_A(ra) | OP_B(ra) | OP_C(rc);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -893,7 +893,7 @@ static u8 arc_subi_r(u8 *buf, u8 ra, u8 u6)
 {
 	const u32 insn = OPC_SUBI | OP_A(ra) | OP_B(ra) | SUBI_U6(u6);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -903,7 +903,7 @@ static u8 arc_sub_i(u8 *buf, u8 ra, s32 imm)
 {
 	const u32 insn = OPC_SUB_I | OP_A(ra) | OP_B(ra);
 
-	if (emit) {
+	if (buf) {
 		emit_4_bytes(buf, insn);
 		emit_4_bytes(buf+INSN_len_normal, imm);
 	}
@@ -915,7 +915,7 @@ static u8 arc_sbc_r(u8 *buf, u8 ra, u8 rc)
 {
 	const u32 insn = OPC_SBC | OP_A(ra) | OP_B(ra) | OP_C(rc);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -925,7 +925,7 @@ static u8 arc_cmp_r(u8 *buf, u8 rb, u8 rc)
 {
 	const u32 insn = OPC_CMP | OP_B(rb) | OP_C(rc);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -942,7 +942,7 @@ static u8 arc_cmpz_r(u8 *buf, u8 rb, u8 rc)
 {
 	const u32 insn = OPC_CMP | OP_B(rb) | OP_C(rc) | CC_equal;
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -952,7 +952,7 @@ static u8 arc_neg_r(u8 *buf, u8 ra, u8 rb)
 {
 	const u32 insn = OPC_NEG | OP_A(ra) | OP_B(rb);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -962,7 +962,7 @@ static u8 arc_mpy_r(u8 *buf, u8 ra, u8 rb, u8 rc)
 {
 	const u32 insn = OPC_MPY | OP_A(ra) | OP_B(rb) | OP_C(rc);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -972,7 +972,7 @@ static u8 arc_mpy_i(u8 *buf, u8 ra, u8 rb, s32 imm)
 {
 	const u32 insn = OPC_MPYI | OP_A(ra) | OP_B(rb);
 
-	if (emit) {
+	if (buf) {
 		emit_4_bytes(buf, insn);
 		emit_4_bytes(buf+INSN_len_normal, imm);
 	}
@@ -984,7 +984,7 @@ static u8 arc_mpydu_r(u8 *buf, u8 ra, u8 rc)
 {
 	const u32 insn = OPC_MPYDU | OP_A(ra) | OP_B(ra) | OP_C(rc);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -994,7 +994,7 @@ static u8 arc_mpydu_i(u8 *buf, u8 ra, s32 imm)
 {
 	const u32 insn = OPC_MPYDUI | OP_A(ra) | OP_B(ra);
 
-	if (emit) {
+	if (buf) {
 		emit_4_bytes(buf, insn);
 		emit_4_bytes(buf+INSN_len_normal, imm);
 	}
@@ -1006,7 +1006,7 @@ static u8 arc_divu_r(u8 *buf, u8 rd, u8 rs)
 {
 	const u32 insn = OPC_DIVU | OP_A(rd) | OP_B(rd) | OP_C(rs);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -1016,7 +1016,7 @@ static u8 arc_divu_i(u8 *buf, u8 rd, s32 imm)
 {
 	const u32 insn = OPC_DIVUI | OP_A(rd) | OP_B(rd);
 
-	if (emit) {
+	if (buf) {
 		emit_4_bytes(buf, insn);
 		emit_4_bytes(buf+INSN_len_normal, imm);
 	}
@@ -1028,7 +1028,7 @@ static u8 arc_divs_r(u8 *buf, u8 rd, u8 rs)
 {
 	const u32 insn = OPC_DIVS | OP_A(rd) | OP_B(rd) | OP_C(rs);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -1038,7 +1038,7 @@ static u8 arc_divs_i(u8 *buf, u8 rd, s32 imm)
 {
 	const u32 insn = OPC_DIVSI | OP_A(rd) | OP_B(rd);
 
-	if (emit) {
+	if (buf) {
 		emit_4_bytes(buf, insn);
 		emit_4_bytes(buf+INSN_len_normal, imm);
 	}
@@ -1050,7 +1050,7 @@ static u8 arc_remu_r(u8 *buf, u8 rd, u8 rs)
 {
 	const u32 insn = OPC_REMU | OP_A(rd) | OP_B(rd) | OP_C(rs);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -1060,7 +1060,7 @@ static u8 arc_remu_i(u8 *buf, u8 rd, s32 imm)
 {
 	const u32 insn = OPC_REMUI | OP_A(rd) | OP_B(rd);
 
-	if (emit) {
+	if (buf) {
 		emit_4_bytes(buf, insn);
 		emit_4_bytes(buf+INSN_len_normal, imm);
 	}
@@ -1072,7 +1072,7 @@ static u8 arc_rems_r(u8 *buf, u8 rd, u8 rs)
 {
 	const u32 insn = OPC_REMS | OP_A(rd) | OP_B(rd) | OP_C(rs);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -1082,7 +1082,7 @@ static u8 arc_rems_i(u8 *buf, u8 rd, s32 imm)
 {
 	const u32 insn = OPC_REMSI | OP_A(rd) | OP_B(rd);
 
-	if (emit) {
+	if (buf) {
 		emit_4_bytes(buf, insn);
 		emit_4_bytes(buf+INSN_len_normal, imm);
 	}
@@ -1094,7 +1094,7 @@ static u8 arc_and_r(u8 *buf, u8 rd, u8 rs)
 {
 	const u32 insn = OPC_AND | OP_A(rd) | OP_B(rd) | OP_C(rs);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -1104,7 +1104,7 @@ static u8 arc_and_i(u8 *buf, u8 rd, s32 imm)
 {
 	const u32 insn = OPC_ANDI | OP_A(rd) | OP_B(rd);
 
-	if (emit) {
+	if (buf) {
 		emit_4_bytes(buf, insn);
 		emit_4_bytes(buf+INSN_len_normal, imm);
 	}
@@ -1116,7 +1116,7 @@ static u8 arc_tst_r(u8 *buf, u8 rd, u8 rs)
 {
 	const u32 insn = OPC_TST | OP_B(rd) | OP_C(rs);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -1131,7 +1131,7 @@ static u8 arc_tstz_r(u8 *buf, u8 rd, u8 rs)
 {
 	const u32 insn = OPC_TST | OP_B(rd) | OP_C(rs) | CC_equal;
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -1140,7 +1140,7 @@ static u8 arc_or_r(u8 *buf, u8 rd, u8 rs1, u8 rs2)
 {
 	const u32 insn = OPC_OR | OP_A(rd) | OP_B(rs1) | OP_C(rs2);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -1149,7 +1149,7 @@ static u8 arc_or_i(u8 *buf, u8 rd, s32 imm)
 {
 	const u32 insn = OPC_ORI | OP_A(rd) | OP_B(rd);
 
-	if (emit) {
+	if (buf) {
 		emit_4_bytes(buf, insn);
 		emit_4_bytes(buf+INSN_len_normal, imm);
 	}
@@ -1160,7 +1160,7 @@ static u8 arc_xor_r(u8 *buf, u8 rd, u8 rs)
 {
 	const u32 insn = OPC_XOR | OP_A(rd) | OP_B(rd) | OP_C(rs);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -1169,7 +1169,7 @@ static u8 arc_xor_i(u8 *buf, u8 rd, s32 imm)
 {
 	const u32 insn = OPC_XORI | OP_A(rd) | OP_B(rd);
 
-	if (emit) {
+	if (buf) {
 		emit_4_bytes(buf, insn);
 		emit_4_bytes(buf+INSN_len_normal, imm);
 	}
@@ -1180,7 +1180,7 @@ static u8 arc_not_r(u8 *buf, u8 rd, u8 rs)
 {
 	const u32 insn = OPC_NOT | OP_B(rd) | OP_C(rs);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -1189,7 +1189,7 @@ static u8 arc_btst_i(u8 *buf, u8 rs, u8 imm)
 {
 	const u32 insn = OPC_BTSTU6 | OP_B(rs) | BTST_U6(imm);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -1198,7 +1198,7 @@ static u8 arc_asl_r(u8 *buf, u8 rd, u8 rs1, u8 rs2)
 {
 	const u32 insn = OPC_ASL | OP_A(rd) | OP_B(rs1) | OP_C(rs2);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -1207,7 +1207,7 @@ static u8 arc_asli_r(u8 *buf, u8 rd, u8 rs, u8 imm)
 {
 	const u32 insn = OPC_ASLI | OP_A(rd) | OP_B(rs) | ASLI_U6(imm);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -1216,7 +1216,7 @@ static u8 arc_asr_r(u8 *buf, u8 rd, u8 rs1, u8 rs2)
 {
 	const u32 insn = OPC_ASR | OP_A(rd) | OP_B(rs1) | OP_C(rs2);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -1225,7 +1225,7 @@ static u8 arc_asri_r(u8 *buf, u8 rd, u8 rs, u8 imm)
 {
 	const u32 insn = OPC_ASRI | OP_A(rd) | OP_B(rs) | ASRI_U6(imm);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -1234,7 +1234,7 @@ static u8 arc_lsr_r(u8 *buf, u8 rd, u8 rs1, u8 rs2)
 {
 	const u32 insn = OPC_LSR | OP_A(rd) | OP_B(rs1) | OP_C(rs2);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -1243,7 +1243,7 @@ static u8 arc_lsri_r(u8 *buf, u8 rd, u8 rs, u8 imm)
 {
 	const u32 insn = OPC_LSRI | OP_A(rd) | OP_B(rs) | LSRI_U6(imm);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -1252,14 +1252,14 @@ static u8 arc_swape_r(u8 *buf, u8 r)
 {
 	const u32 insn = OPC_SWAPE | OP_B(r) | OP_C(r);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
 
 static u8 arc_jmp_return(u8 *buf)
 {
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, OPC_J_BLINK);
 	return INSN_len_normal;
 }
@@ -1268,7 +1268,7 @@ static u8 arc_jl(u8 *buf, u8 reg)
 {
 	const u32 insn = OPC_JL | OP_C(reg);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -1282,7 +1282,7 @@ static u8 arc_bcc(u8 *buf, u8 cc, int offset)
 {
 	const u32 insn = OPC_BCC | BCC_S21(offset) | COND(cc);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -1296,7 +1296,7 @@ static u8 arc_b(u8 *buf, s32 offset)
 {
 	const u32 insn = OPC_B | B_S25(offset);
 
-	if (emit)
+	if (buf)
 		emit_4_bytes(buf, insn);
 	return INSN_len_normal;
 }
@@ -1348,8 +1348,10 @@ u8 mov_r64(u8 *buf, u8 rd, u8 rs, u8 sign_ext)
 		len = mov_r32(buf, rd, rs, sign_ext);
 
 		/* Now propagate the sign bit of LO to HI. */
-		if (sign_ext == 8 || sign_ext == 16 || sign_ext == 32)
-			len += arc_asri_r(buf+len, REG_HI(rd), REG_LO(rd), 31);
+		if (sign_ext == 8 || sign_ext == 16 || sign_ext == 32) {
+			len += arc_asri_r(BUF(buf, len),
+					  REG_HI(rd), REG_LO(rd), 31);
+		}
 
 		return len;
 	}
@@ -1362,10 +1364,10 @@ u8 mov_r64(u8 *buf, u8 rd, u8 rs, u8 sign_ext)
 	len = arc_mov_r(buf, REG_LO(rd), REG_LO(rs));
 
 	if (rs != BPF_REG_FP)
-		len += arc_mov_r(buf+len, REG_HI(rd), REG_HI(rs));
+		len += arc_mov_r(BUF(buf, len), REG_HI(rd), REG_HI(rs));
 	/* BPF_REG_FP is mapped to 32-bit "fp" register. */
 	else
-		len += arc_movi_r(buf+len, REG_HI(rd), 0);
+		len += arc_movi_r(BUF(buf, len), REG_HI(rd), 0);
 
 	return len;
 }
@@ -1380,9 +1382,9 @@ u8 mov_r64_i32(u8 *buf, u8 reg, s32 imm)
 	/* BPF_REG_FP is mapped to 32-bit "fp" register. */
 	if (reg != BPF_REG_FP) {
 		if (imm >= 0)
-			len += arc_movi_r(buf+len, REG_HI(reg), 0);
+			len += arc_movi_r(BUF(buf, len), REG_HI(reg), 0);
 		else
-			len += arc_movi_r(buf+len, REG_HI(reg), -1);
+			len += arc_movi_r(BUF(buf, len), REG_HI(reg), -1);
 	}
 
 	return len;
@@ -1420,7 +1422,7 @@ u8 mov_r64_i64(u8 *buf, u8 reg, u32 lo, u32 hi)
 	u8 len;
 
 	len  = arc_mov_i_fixed(buf, REG_LO(reg), lo);
-	len += arc_mov_i_fixed(buf+len, REG_HI(reg), hi);
+	len += arc_mov_i_fixed(BUF(buf, len), REG_HI(reg), hi);
 
 	return len;
 }
@@ -1446,7 +1448,7 @@ static u8 adjust_mem_access(u8 *buf, s16 *off, u8 size,
 
 	if (!IN_S9_RANGE(*off) ||
 	    (size == BPF_DW && !IN_S9_RANGE(*off + 4))) {
-		len += arc_add_i(buf+len,
+		len += arc_add_i(BUF(buf, len),
 				 REG_LO(JIT_REG_TMP), REG_LO(rm), (u32) (*off));
 		*arc_reg_mem = REG_LO(JIT_REG_TMP);
 		*off = 0;
@@ -1463,14 +1465,15 @@ u8 store_r(u8 *buf, u8 rs, u8 rd, s16 off, u8 size)
 	len = adjust_mem_access(buf, &off, size, rd, &arc_reg_mem);
 
 	if (size == BPF_DW) {
-		len += arc_st_r(buf+len, REG_LO(rs), arc_reg_mem, off,
-				ZZ_4_byte);
-		len += arc_st_r(buf+len, REG_HI(rs), arc_reg_mem, off+4,
-				ZZ_4_byte);
+		len += arc_st_r(BUF(buf, len), REG_LO(rs), arc_reg_mem,
+				off, ZZ_4_byte);
+		len += arc_st_r(BUF(buf, len), REG_HI(rs), arc_reg_mem,
+				off+4, ZZ_4_byte);
 	} else {
 		u8 zz = bpf_to_arc_size(size);
 
-		len += arc_st_r(buf+len, REG_LO(rs), arc_reg_mem, off, zz);
+		len += arc_st_r(BUF(buf, len), REG_LO(rs), arc_reg_mem,
+				off, zz);
 	}
 
 	return len;
@@ -1495,18 +1498,18 @@ u8 store_i(u8 *buf, s32 imm, u8 rd, s16 off, u8 size)
 	len = adjust_mem_access(buf, &off, size, rd, &arc_reg_mem);
 
 	if (size == BPF_DW) {
-		len += arc_mov_i(buf+len, arc_rs, imm);
-		len += arc_st_r(buf+len, arc_rs, arc_reg_mem, off,
-				ZZ_4_byte);
+		len += arc_mov_i(BUF(buf, len), arc_rs, imm);
+		len += arc_st_r(BUF(buf, len), arc_rs, arc_reg_mem,
+				off, ZZ_4_byte);
 		imm = (imm >= 0 ? 0 : -1);
-		len += arc_mov_i(buf+len, arc_rs, imm);
-		len += arc_st_r(buf+len, arc_rs, arc_reg_mem, off+4,
-				ZZ_4_byte);
+		len += arc_mov_i(BUF(buf, len), arc_rs, imm);
+		len += arc_st_r(BUF(buf, len), arc_rs, arc_reg_mem,
+				off+4, ZZ_4_byte);
 	} else {
 		u8 zz = bpf_to_arc_size(size);
 
-		len += arc_mov_i(buf+len, arc_rs, imm);
-		len += arc_st_r(buf+len, arc_rs, arc_reg_mem, off, zz);
+		len += arc_mov_i(BUF(buf, len), arc_rs, imm);
+		len += arc_st_r(BUF(buf, len), arc_rs, arc_reg_mem, off, zz);
 	}
 
 	return len;
@@ -1523,12 +1526,12 @@ static u8 push_r64(u8 *buf, u8 reg)
 #ifdef __LITTLE_ENDIAN
 	/* BPF_REG_FP is mapped to 32-bit "fp" register. */
 	if (reg != BPF_REG_FP)
-		len += arc_push_r(buf+len, REG_HI(reg));
-	len += arc_push_r(buf+len, REG_LO(reg));
+		len += arc_push_r(BUF(buf, len), REG_HI(reg));
+	len += arc_push_r(BUF(buf, len), REG_LO(reg));
 #else
-	len += arc_push_r(buf+len, REG_LO(reg));
+	len += arc_push_r(BUF(buf, len), REG_LO(reg));
 	if (reg != BPF_REG_FP)
-		len += arc_push_r(buf+len, REG_HI(reg));
+		len += arc_push_r(BUF(buf, len), REG_HI(reg));
 #endif
 
 	return len;
@@ -1546,18 +1549,19 @@ u8 load_r(u8 *buf, u8 rd, u8 rs, s16 off, u8 size, bool sign_ext)
 
 		/* Use LD.X only if the data size is less than 32-bit. */
 		if (sign_ext && (zz == ZZ_1_byte || zz == ZZ_2_byte)) {
-			len += arc_ldx_r(buf+len, REG_LO(rd), arc_reg_mem,
-					 off, zz);
+			len += arc_ldx_r(BUF(buf, len), REG_LO(rd),
+					 arc_reg_mem, off, zz);
 		} else {
-			len += arc_ld_r(buf+len, REG_LO(rd), arc_reg_mem,
-					off, zz);
+			len += arc_ld_r(BUF(buf, len), REG_LO(rd),
+					arc_reg_mem, off, zz);
 		}
 
 		if (sign_ext) {
 			/* Propagate the sign bit to the higher reg. */
-			len += arc_asri_r(buf+len, REG_HI(rd), REG_LO(rd), 31);
+			len += arc_asri_r(BUF(buf, len),
+					  REG_HI(rd), REG_LO(rd), 31);
 		} else {
-			len += arc_movi_r(buf+len, REG_HI(rd), 0);
+			len += arc_movi_r(BUF(buf, len), REG_HI(rd), 0);
 		}
 	} else if (size == BPF_DW) {
 		/*
@@ -1574,14 +1578,14 @@ u8 load_r(u8 *buf, u8 rd, u8 rs, s16 off, u8 size, bool sign_ext)
 		 *   ld rx, [rb, off+0]
 		 */
 		if (REG_LO(rd) != arc_reg_mem) {
-			len += arc_ld_r(buf+len, REG_LO(rd), arc_reg_mem,
+			len += arc_ld_r(BUF(buf, len), REG_LO(rd), arc_reg_mem,
 					off+0, ZZ_4_byte);
-			len += arc_ld_r(buf+len, REG_HI(rd), arc_reg_mem,
+			len += arc_ld_r(BUF(buf, len), REG_HI(rd), arc_reg_mem,
 					off+4, ZZ_4_byte);
 		} else {
-			len += arc_ld_r(buf+len, REG_HI(rd), arc_reg_mem,
+			len += arc_ld_r(BUF(buf, len), REG_HI(rd), arc_reg_mem,
 					off+4, ZZ_4_byte);
-			len += arc_ld_r(buf+len, REG_LO(rd), arc_reg_mem,
+			len += arc_ld_r(BUF(buf, len), REG_LO(rd), arc_reg_mem,
 					off+0, ZZ_4_byte);
 		}
 	}
@@ -1607,7 +1611,7 @@ u8 add_r64(u8 *buf, u8 rd, u8 rs)
 	u8 len;
 
 	len  = arc_addf_r(buf, REG_LO(rd), REG_LO(rs));
-	len += arc_adc_r(buf+len, REG_HI(rd), REG_HI(rs));
+	len += arc_adc_r(BUF(buf, len), REG_HI(rd), REG_HI(rs));
 	return len;
 }
 
@@ -1617,10 +1621,10 @@ u8 add_r64_i32(u8 *buf, u8 rd, s32 imm)
 
 	if (IN_U6_RANGE(imm)) {
 		len  = arc_addif_r(buf, REG_LO(rd), imm);
-		len += arc_adci_r(buf+len, REG_HI(rd), 0);
+		len += arc_adci_r(BUF(buf, len), REG_HI(rd), 0);
 	} else {
 		len  = mov_r64_i32(buf, JIT_REG_TMP, imm);
-		len += add_r64(buf+len, rd, JIT_REG_TMP);
+		len += add_r64(BUF(buf, len), rd, JIT_REG_TMP);
 	}
 	return len;
 }
@@ -1643,7 +1647,7 @@ u8 sub_r64(u8 *buf, u8 rd, u8 rs)
 	u8 len;
 
 	len  = arc_subf_r(buf, REG_LO(rd), REG_LO(rs));
-	len += arc_sbc_r(buf+len, REG_HI(rd), REG_HI(rs));
+	len += arc_sbc_r(BUF(buf, len), REG_HI(rd), REG_HI(rs));
 	return len;
 }
 
@@ -1652,7 +1656,7 @@ u8 sub_r64_i32(u8 *buf, u8 rd, s32 imm)
 	u8 len;
 
 	len  = mov_r64_i32(buf, JIT_REG_TMP, imm);
-	len += sub_r64(buf+len, rd, JIT_REG_TMP);
+	len += sub_r64(BUF(buf, len), rd, JIT_REG_TMP);
 	return len;
 }
 
@@ -1672,8 +1676,8 @@ u8 neg_r64(u8 *buf, u8 r)
 	u8 len;
 
 	len  = arc_not_r(buf, REG_LO(r), REG_LO(r));
-	len += arc_not_r(buf+len, REG_HI(r), REG_HI(r));
-	len += add_r64_i32(buf+len, r, 1);
+	len += arc_not_r(BUF(buf, len), REG_HI(r), REG_HI(r));
+	len += add_r64_i32(BUF(buf, len), r, 1);
 	return len;
 }
 
@@ -1707,10 +1711,10 @@ u8 mul_r64(u8 *buf, u8 rd, u8 rs)
 	u8 len;
 
 	len  = arc_mpy_r(buf, t0, B_hi, C_lo);
-	len += arc_mpy_r(buf+len, t1, B_lo, C_hi);
-	len += arc_mpydu_r(buf+len, B_lo, C_lo);
-	len += arc_add_r(buf+len, B_hi, t0);
-	len += arc_add_r(buf+len, B_hi, t1);
+	len += arc_mpy_r(BUF(buf, len), t1, B_lo, C_hi);
+	len += arc_mpydu_r(BUF(buf, len), B_lo, C_lo);
+	len += arc_add_r(BUF(buf, len), B_hi, t0);
+	len += arc_add_r(BUF(buf, len), B_hi, t1);
 
 	return len;
 }
@@ -1755,15 +1759,15 @@ u8 mul_r64_i32(u8 *buf, u8 rd, s32 imm)
 
 	/* Is the sign-extension of the immediate "-1"? */
 	if (imm < 0)
-		len += arc_neg_r(buf+len, t1, B_lo);
+		len += arc_neg_r(BUF(buf, len), t1, B_lo);
 
-	len += arc_mpy_i(buf+len, t0, B_hi, imm);
-	len += arc_mpydu_i(buf+len, B_lo, imm);
-	len += arc_add_r(buf+len, B_hi, t0);
+	len += arc_mpy_i(BUF(buf, len), t0, B_hi, imm);
+	len += arc_mpydu_i(BUF(buf, len), B_lo, imm);
+	len += arc_add_r(BUF(buf, len), B_hi, t0);
 
 	/* Add the "sign*B_lo" part, if necessary. */
 	if (imm < 0)
-		len += arc_add_r(buf+len, B_hi, t1);
+		len += arc_add_r(BUF(buf, len), B_hi, t1);
 
 	return len;
 }
@@ -1820,8 +1824,8 @@ u8 and_r64(u8 *buf, u8 rd, u8 rs)
 {
 	u8 len;
 
-	len  = arc_and_r(buf,     REG_LO(rd), REG_LO(rs));
-	len += arc_and_r(buf+len, REG_HI(rd), REG_HI(rs));
+	len  = arc_and_r(buf, REG_LO(rd), REG_LO(rs));
+	len += arc_and_r(BUF(buf, len), REG_HI(rd), REG_HI(rs));
 	return len;
 }
 
@@ -1830,7 +1834,7 @@ u8 and_r64_i32(u8 *buf, u8 rd, s32 imm)
 	u8 len;
 
 	len  = mov_r64_i32(buf, JIT_REG_TMP, imm);
-	len += and_r64(buf+len, rd, JIT_REG_TMP);
+	len += and_r64(BUF(buf, len), rd, JIT_REG_TMP);
 	return len;
 }
 
@@ -1853,8 +1857,8 @@ u8 or_r64(u8 *buf, u8 rd, u8 rs)
 {
 	u8 len;
 
-	len  = arc_or_r(buf,     REG_LO(rd), REG_LO(rd), REG_LO(rs));
-	len += arc_or_r(buf+len, REG_HI(rd), REG_HI(rd), REG_HI(rs));
+	len  = arc_or_r(buf, REG_LO(rd), REG_LO(rd), REG_LO(rs));
+	len += arc_or_r(BUF(buf, len), REG_HI(rd), REG_HI(rd), REG_HI(rs));
 	return len;
 }
 
@@ -1863,7 +1867,7 @@ u8 or_r64_i32(u8 *buf, u8 rd, s32 imm)
 	u8 len;
 
 	len  = mov_r64_i32(buf, JIT_REG_TMP, imm);
-	len += or_r64(buf+len, rd, JIT_REG_TMP);
+	len += or_r64(BUF(buf, len), rd, JIT_REG_TMP);
 	return len;
 }
 
@@ -1881,8 +1885,8 @@ u8 xor_r64(u8 *buf, u8 rd, u8 rs)
 {
 	u8 len;
 
-	len  = arc_xor_r(buf,     REG_LO(rd), REG_LO(rs));
-	len += arc_xor_r(buf+len, REG_HI(rd), REG_HI(rs));
+	len  = arc_xor_r(buf, REG_LO(rd), REG_LO(rs));
+	len += arc_xor_r(BUF(buf, len), REG_HI(rd), REG_HI(rs));
 	return len;
 }
 
@@ -1891,7 +1895,7 @@ u8 xor_r64_i32(u8 *buf, u8 rd, s32 imm)
 	u8 len;
 
 	len  = mov_r64_i32(buf, JIT_REG_TMP, imm);
-	len += xor_r64(buf+len, rd, JIT_REG_TMP);
+	len += xor_r64(BUF(buf, len), rd, JIT_REG_TMP);
 	return len;
 }
 
@@ -1952,15 +1956,15 @@ u8 lsh_r64(u8 *buf, u8 rd, u8 rs)
 	u8 len;
 
 	len  = arc_not_r(buf, t0, C_lo);
-	len += arc_lsri_r(buf+len, t1, B_lo, 1);
-	len += arc_lsr_r(buf+len, t1, t1, t0);
-	len += arc_mov_r(buf+len, t0, C_lo);
-	len += arc_asl_r(buf+len, B_lo, B_lo, t0);
-	len += arc_asl_r(buf+len, B_hi, B_hi, t0);
-	len += arc_or_r(buf+len, B_hi, B_hi, t1);
-	len += arc_btst_i(buf+len, t0, 5);
-	len += arc_mov_cc_r(buf+len, CC_unequal, B_hi, B_lo);
-	len += arc_movu_cc_r(buf+len, CC_unequal, B_lo, 0);
+	len += arc_lsri_r(BUF(buf, len), t1, B_lo, 1);
+	len += arc_lsr_r(BUF(buf, len), t1, t1, t0);
+	len += arc_mov_r(BUF(buf, len), t0, C_lo);
+	len += arc_asl_r(BUF(buf, len), B_lo, B_lo, t0);
+	len += arc_asl_r(BUF(buf, len), B_hi, B_hi, t0);
+	len += arc_or_r(BUF(buf, len), B_hi, B_hi, t1);
+	len += arc_btst_i(BUF(buf, len), t0, 5);
+	len += arc_mov_cc_r(BUF(buf, len), CC_unequal, B_hi, B_lo);
+	len += arc_movu_cc_r(BUF(buf, len), CC_unequal, B_lo, 0);
 
 	return len;
 }
@@ -1987,12 +1991,12 @@ u8 lsh_r64_i32(u8 *buf, u8 rd, s32 imm)
 		return 0;
 	} else if (n <= 31) {
 		len  = arc_lsri_r(buf, t0, B_lo, 32 - n);
-		len += arc_asli_r(buf+len, B_lo, B_lo, n);
-		len += arc_asli_r(buf+len, B_hi, B_hi, n);
-		len += arc_or_r(buf+len, B_hi, B_hi, t0);
+		len += arc_asli_r(BUF(buf, len), B_lo, B_lo, n);
+		len += arc_asli_r(BUF(buf, len), B_hi, B_hi, n);
+		len += arc_or_r(BUF(buf, len), B_hi, B_hi, t0);
 	} else if (n <= 63) {
 		len  = arc_asli_r(buf, B_hi, B_lo, n - 32);
-		len += arc_movi_r(buf+len, B_lo, 0);
+		len += arc_movi_r(BUF(buf, len), B_lo, 0);
 	}
 	/* n >= 64 is undefined behaviour. */
 
@@ -2047,15 +2051,15 @@ u8 rsh_r64(u8 *buf, u8 rd, u8 rs)
 	u8 len;
 
 	len  = arc_not_r(buf, t0, C_lo);
-	len += arc_asli_r(buf+len, t1, B_hi, 1);
-	len += arc_asl_r(buf+len, t1, t1, t0);
-	len += arc_mov_r(buf+len, t0, C_lo);
-	len += arc_lsr_r(buf+len, B_hi, B_hi, t0);
-	len += arc_lsr_r(buf+len, B_lo, B_lo, t0);
-	len += arc_or_r(buf+len, B_lo, B_lo, t1);
-	len += arc_btst_i(buf+len, t0, 5);
-	len += arc_mov_cc_r(buf+len, CC_unequal, B_lo, B_hi);
-	len += arc_movu_cc_r(buf+len, CC_unequal, B_hi, 0);
+	len += arc_asli_r(BUF(buf, len), t1, B_hi, 1);
+	len += arc_asl_r(BUF(buf, len), t1, t1, t0);
+	len += arc_mov_r(BUF(buf, len), t0, C_lo);
+	len += arc_lsr_r(BUF(buf, len), B_hi, B_hi, t0);
+	len += arc_lsr_r(BUF(buf, len), B_lo, B_lo, t0);
+	len += arc_or_r(BUF(buf, len), B_lo, B_lo, t1);
+	len += arc_btst_i(BUF(buf, len), t0, 5);
+	len += arc_mov_cc_r(BUF(buf, len), CC_unequal, B_lo, B_hi);
+	len += arc_movu_cc_r(BUF(buf, len), CC_unequal, B_hi, 0);
 
 	return len;
 }
@@ -2082,12 +2086,12 @@ u8 rsh_r64_i32(u8 *buf, u8 rd, s32 imm)
 		return 0;
 	} else if (n <= 31) {
 		len  = arc_asli_r(buf, t0, B_hi, 32 - n);
-		len += arc_lsri_r(buf+len, B_lo, B_lo, n);
-		len += arc_lsri_r(buf+len, B_hi, B_hi, n);
-		len += arc_or_r(buf+len, B_lo, B_lo, t0);
+		len += arc_lsri_r(BUF(buf, len), B_lo, B_lo, n);
+		len += arc_lsri_r(BUF(buf, len), B_hi, B_hi, n);
+		len += arc_or_r(BUF(buf, len), B_lo, B_lo, t0);
 	} else if (n <= 63) {
 		len  = arc_lsri_r(buf, B_lo, B_hi, n - 32);
-		len += arc_movi_r(buf+len, B_hi, 0);
+		len += arc_movi_r(BUF(buf, len), B_hi, 0);
 	}
 	/* n >= 64 is undefined behaviour. */
 
@@ -2144,16 +2148,16 @@ u8 arsh_r64(u8 *buf, u8 rd, u8 rs)
 	u8 len;
 
 	len  = arc_not_r(buf, t0, C_lo);
-	len += arc_asli_r(buf+len, t1, B_hi, 1);
-	len += arc_asl_r(buf+len, t1, t1, t0);
-	len += arc_mov_r(buf+len, t0, C_lo);
-	len += arc_asr_r(buf+len, B_hi, B_hi, t0);
-	len += arc_lsr_r(buf+len, B_lo, B_lo, t0);
-	len += arc_or_r(buf+len, B_lo, B_lo, t1);
-	len += arc_btst_i(buf+len, t0, 5);
-	len += arc_asri_r(buf+len, t0, B_hi, 31);
-	len += arc_mov_cc_r(buf+len, CC_unequal, B_lo, B_hi);
-	len += arc_mov_cc_r(buf+len, CC_unequal, B_hi, t0);
+	len += arc_asli_r(BUF(buf, len), t1, B_hi, 1);
+	len += arc_asl_r(BUF(buf, len), t1, t1, t0);
+	len += arc_mov_r(BUF(buf, len), t0, C_lo);
+	len += arc_asr_r(BUF(buf, len), B_hi, B_hi, t0);
+	len += arc_lsr_r(BUF(buf, len), B_lo, B_lo, t0);
+	len += arc_or_r(BUF(buf, len), B_lo, B_lo, t1);
+	len += arc_btst_i(BUF(buf, len), t0, 5);
+	len += arc_asri_r(BUF(buf, len), t0, B_hi, 31);
+	len += arc_mov_cc_r(BUF(buf, len), CC_unequal, B_lo, B_hi);
+	len += arc_mov_cc_r(BUF(buf, len), CC_unequal, B_hi, t0);
 
 	return len;
 }
@@ -2180,14 +2184,14 @@ u8 arsh_r64_i32(u8 *buf, u8 rd, s32 imm)
 		return 0;
 	} else if (n <= 31) {
 		len  = arc_asli_r(buf, t0, B_hi, 32 - n);
-		len += arc_lsri_r(buf+len, B_lo, B_lo, n);
-		len += arc_asri_r(buf+len, B_hi, B_hi, n);
-		len += arc_or_r(buf+len, B_lo, B_lo, t0);
+		len += arc_lsri_r(BUF(buf, len), B_lo, B_lo, n);
+		len += arc_asri_r(BUF(buf, len), B_hi, B_hi, n);
+		len += arc_or_r(BUF(buf, len), B_lo, B_lo, t0);
 	} else if (n <= 63) {
 		len  = arc_asri_r(buf, B_lo, B_hi, n - 32);
-		len += arc_movi_r(buf+len, B_hi, -1);
-		len += arc_btst_i(buf+len, B_lo, 31);
-		len += arc_movu_cc_r(buf+len, CC_equal, B_hi, 0);
+		len += arc_movi_r(BUF(buf, len), B_hi, -1);
+		len += arc_btst_i(BUF(buf, len), B_lo, 31);
+		len += arc_movu_cc_r(BUF(buf, len), CC_equal, B_hi, 0);
 	}
 	/* n >= 64 is undefined behaviour. */
 
@@ -2209,10 +2213,10 @@ u8 gen_swap(u8 *buf, u8 rd, u8 size, u8 endian, bool force)
 	if ((force == false) && (host_endian == endian)) {
 		switch (size) {
 		case 16:
-			len += arc_and_i(buf+len, REG_LO(rd), 0xffff);
+			len += arc_and_i(BUF(buf, len), REG_LO(rd), 0xffff);
 			fallthrough;
 		case 32:
-			len += zext(buf+len, rd);
+			len += zext(BUF(buf, len), rd);
 			fallthrough;
 		case 64:
 			break;
@@ -2226,11 +2230,12 @@ u8 gen_swap(u8 *buf, u8 rd, u8 size, u8 endian, bool force)
 			 * r = B4B3_B2B1 << 16 --> r = B2B1_0000
 			 * swape(r) is 0000_B1B2
 			 */
-			len += arc_asli_r(buf+len, REG_LO(rd), REG_LO(rd), 16);
+			len += arc_asli_r(BUF(buf, len),
+					  REG_LO(rd), REG_LO(rd), 16);
 			fallthrough;
 		case 32:
-			len += arc_swape_r(buf+len, REG_LO(rd));
-			len += zext(buf+len, rd);
+			len += arc_swape_r(BUF(buf, len), REG_LO(rd));
+			len += zext(BUF(buf, len), rd);
 			break;
 		case 64:
 			/*
@@ -2240,11 +2245,11 @@ u8 gen_swap(u8 *buf, u8 rd, u8 size, u8 endian, bool force)
 			 *   hi ^= lo;
 			 * and then swap the bytes in "hi" and "lo".
 			 */
-			len += arc_xor_r(buf+len, REG_HI(rd), REG_LO(rd));
-			len += arc_xor_r(buf+len, REG_LO(rd), REG_HI(rd));
-			len += arc_xor_r(buf+len, REG_HI(rd), REG_LO(rd));
-			len += arc_swape_r(buf+len, REG_LO(rd));
-			len += arc_swape_r(buf+len, REG_HI(rd));
+			len += arc_xor_r(BUF(buf, len), REG_HI(rd), REG_LO(rd));
+			len += arc_xor_r(BUF(buf, len), REG_LO(rd), REG_HI(rd));
+			len += arc_xor_r(BUF(buf, len), REG_HI(rd), REG_LO(rd));
+			len += arc_swape_r(BUF(buf, len), REG_LO(rd));
+			len += arc_swape_r(BUF(buf, len), REG_HI(rd));
 			break;
 		default:
 			/* The caller must have handled this. */
@@ -2271,9 +2276,9 @@ static inline u8 frame_create(u8 *buf, u16 size)
 
 	len = arc_mov_r(buf, ARC_R_FP, ARC_R_SP);
 	if (IN_U6_RANGE(size))
-		len += arc_subi_r(buf+len, ARC_R_SP, size);
+		len += arc_subi_r(BUF(buf, len), ARC_R_SP, size);
 	else
-		len += arc_sub_i(buf+len, ARC_R_SP, size);
+		len += arc_sub_i(BUF(buf, len), ARC_R_SP, size);
 	return len;
 }
 
@@ -2298,7 +2303,7 @@ static u8 bpf_to_arc_return(u8 *buf)
 	u8 len;
 
 	len  = arc_mov_r(buf, ARC_R_0, REG_LO(BPF_REG_0));
-	len += arc_mov_r(buf+len, ARC_R_1, REG_HI(BPF_REG_0));
+	len += arc_mov_r(BUF(buf, len), ARC_R_1, REG_HI(BPF_REG_0));
 	return len;
 }
 
@@ -2313,7 +2318,7 @@ u8 arc_to_bpf_return(u8 *buf)
 	u8 len;
 
 	len  = arc_mov_r(buf, REG_LO(BPF_REG_0), ARC_R_0);
-	len += arc_mov_r(buf+len, REG_HI(BPF_REG_0), ARC_R_1);
+	len += arc_mov_r(BUF(buf, len), REG_HI(BPF_REG_0), ARC_R_1);
 	return len;
 }
 
@@ -2342,7 +2347,7 @@ static u8 jump_and_link(u8 *buf, u32 addr)
 	u8 len;
 
 	len  = arc_mov_i_fixed(buf, REG_LO(JIT_REG_TMP), addr);
-	len += arc_jl(buf+len, REG_LO(JIT_REG_TMP));
+	len += arc_jl(BUF(buf, len), REG_LO(JIT_REG_TMP));
 	return len;
 }
 
@@ -2401,22 +2406,22 @@ u8 arc_prologue(u8 *buf, u32 usage, u16 frame_size)
 
 	/* Deal with blink first. */
 	if (usage & BIT(ARC_R_BLINK))
-		len += arc_push_r(buf+len, ARC_R_BLINK);
+		len += arc_push_r(BUF(buf, len), ARC_R_BLINK);
 
 	gp_regs = usage & ~(BIT(ARC_R_BLINK) | BIT(ARC_R_FP));
 	while (gp_regs) {
 		u8 reg = __builtin_ffs(gp_regs) - 1;
 
-		len += arc_push_r(buf+len, reg);
+		len += arc_push_r(BUF(buf, len), reg);
 		gp_regs &= ~BIT(reg);
 	}
 
 	/* Deal with fp last. */
 	if ((usage & BIT(ARC_R_FP)) || (frame_size > 0))
-		len += arc_push_r(buf+len, ARC_R_FP);
+		len += arc_push_r(BUF(buf, len), ARC_R_FP);
 
 	if (frame_size > 0)
-		len += frame_create(buf+len, frame_size);
+		len += frame_create(BUF(buf, len), frame_size);
 
 #ifdef ARC_BPF_JIT_DEBUG
 	if ((usage & BIT(ARC_R_FP)) && (frame_size == 0)) {
@@ -2453,28 +2458,28 @@ u8 arc_epilogue(u8 *buf, u32 usage, u16 frame_size)
 #endif
 
 	if (frame_size > 0)
-		len += frame_restore(buf+len);
+		len += frame_restore(BUF(buf, len));
 
 	/* Deal with fp first. */
 	if ((usage & BIT(ARC_R_FP)) || (frame_size > 0))
-		len += arc_pop_r(buf+len, ARC_R_FP);
+		len += arc_pop_r(BUF(buf, len), ARC_R_FP);
 
 	gp_regs = usage & ~(BIT(ARC_R_BLINK) | BIT(ARC_R_FP));
 	while (gp_regs) {
 		/* "usage" is 32-bit, each bit indicating an ARC register. */
 		u8 reg = 31 - __builtin_clz(gp_regs);
 
-		len += arc_pop_r(buf+len, reg);
+		len += arc_pop_r(BUF(buf, len), reg);
 		gp_regs &= ~BIT(reg);
 	}
 
 	/* Deal with blink last. */
 	if (usage & BIT(ARC_R_BLINK))
-		len += arc_pop_r(buf+len, ARC_R_BLINK);
+		len += arc_pop_r(BUF(buf, len), ARC_R_BLINK);
 
 	/* Wrap up the return value and jump back to the caller. */
-	len += bpf_to_arc_return(buf+len);
-	len += arc_jmp_return(buf+len);
+	len += bpf_to_arc_return(BUF(buf, len));
+	len += arc_jmp_return(BUF(buf, len));
 
 	return len;
 }
@@ -2672,10 +2677,10 @@ static int gen_j_eq_64(u8 *buf, u8 rd, u8 rs, bool eq,
 	s32 disp;
 	u8 len = 0;
 
-	len += arc_cmp_r(buf+len, REG_HI(rd), REG_HI(rs));
-	len += arc_cmpz_r(buf+len, REG_LO(rd), REG_LO(rs));
+	len += arc_cmp_r(BUF(buf, len), REG_HI(rd), REG_HI(rs));
+	len += arc_cmpz_r(BUF(buf, len), REG_LO(rd), REG_LO(rs));
 	disp = get_displacement(curr_off + len, targ_off);
-	len += arc_bcc(buf+len, eq ? CC_equal : CC_unequal, disp);
+	len += arc_bcc(BUF(buf, len), eq ? CC_equal : CC_unequal, disp);
 
 	return len;
 }
@@ -2690,10 +2695,10 @@ static u8 gen_jset_64(u8 *buf, u8 rd, u8 rs, u32 curr_off, u32 targ_off)
 	u8 len = 0;
 	s32 disp;
 
-	len += arc_tst_r(buf+len, REG_HI(rd), REG_HI(rs));
-	len += arc_tstz_r(buf+len, REG_LO(rd), REG_LO(rs));
+	len += arc_tst_r(BUF(buf, len), REG_HI(rd), REG_HI(rs));
+	len += arc_tstz_r(BUF(buf, len), REG_LO(rd), REG_LO(rs));
 	disp = get_displacement(curr_off + len, targ_off);
-	len += arc_bcc(buf+len, CC_unequal, disp);
+	len += arc_bcc(BUF(buf, len), CC_unequal, disp);
 
 	return len;
 }
@@ -2808,19 +2813,19 @@ static u8 gen_jcc_64(u8 *buf, u8 rd, u8 rs, u8 cond,
 
 	/* b<c1> @target */
 	disp = get_displacement(curr_off + len, targ_off);
-	len += arc_bcc(buf+len, cc[0], disp);
+	len += arc_bcc(BUF(buf, len), cc[0], disp);
 
 	/* b<c2> @end */
 	end_off = curr_off + len + (JCC64_INSNS_TO_END * INSN_len_normal);
 	disp = get_displacement(curr_off + len, end_off);
-	len += arc_bcc(buf+len, cc[1], disp);
+	len += arc_bcc(BUF(buf, len), cc[1], disp);
 
 	/* cmp rd_lo, rs_lo */
-	len += arc_cmp_r(buf+len, REG_LO(rd), REG_LO(rs));
+	len += arc_cmp_r(BUF(buf, len), REG_LO(rd), REG_LO(rs));
 
 	/* b<c3> @target */
 	disp = get_displacement(curr_off + len, targ_off);
-	len += arc_bcc(buf+len, cc[2], disp);
+	len += arc_bcc(BUF(buf, len), cc[2], disp);
 
 	return len;
 }
@@ -2960,7 +2965,7 @@ u8 gen_jmp_32(u8 *buf, u8 rd, u8 rs, u8 cond, u32 curr_off, u32 targ_off)
 		 * should always point to the jump instruction.
 		 */
 		disp = get_displacement(curr_off + len, targ_off);
-		len += arc_bcc(buf+len, arcv2_32_jmps[cond], disp);
+		len += arc_bcc(BUF(buf, len), arcv2_32_jmps[cond], disp);
 	} else {
 		/* The straight forward unconditional jump. */
 		disp = get_displacement(curr_off, targ_off);
@@ -2990,12 +2995,12 @@ u8 gen_func_call(u8 *buf, ARC_ADDR func_addr, bool external_func)
 	 * is done. The stack is readjusted either way after the call.
 	 */
 	if (external_func)
-		len += push_r64(buf+len, BPF_REG_5);
+		len += push_r64(BUF(buf, len), BPF_REG_5);
 
-	len += jump_and_link(buf+len, func_addr);
+	len += jump_and_link(BUF(buf, len), func_addr);
 
 	if (external_func)
-		len += arc_add_i(buf+len, ARC_R_SP, ARC_R_SP, ARG5_SIZE);
+		len += arc_add_i(BUF(buf, len), ARC_R_SP, ARC_R_SP, ARG5_SIZE);
 
 	return len;
 }
diff --git a/arch/arc/net/bpf_jit_core.c b/arch/arc/net/bpf_jit_core.c
index 730a715d324e..eea1a469a195 100644
--- a/arch/arc/net/bpf_jit_core.c
+++ b/arch/arc/net/bpf_jit_core.c
@@ -9,7 +9,6 @@
 #include "bpf_jit.h"
 
 /* Sane initial values for the globals */
-bool emit = true;
 bool zext_thyself = true;
 
 /*
@@ -86,6 +85,7 @@ struct arc_jit_data {
  * orig_prog:		The original eBPF program before any possible change.
  * jit:			The JIT buffer and its length.
  * bpf_header:		The JITed program header. "jit.buf" points inside it.
+ * emit:		If set, opcodes are written to memory; else, a dry-run.
  * bpf2insn:		Maps BPF insn indices to their counterparts in jit.buf.
  * bpf2insn_valid:	Indicates if "bpf2ins" is populated with the mappings.
  * jit_data:		A piece of memory to transfer data to the next pass.
@@ -104,6 +104,7 @@ struct jit_context {
 	struct bpf_prog			*orig_prog;
 	struct jit_buffer		jit;
 	struct bpf_binary_header	*bpf_header;
+	bool				emit;
 	u32				*bpf2insn;
 	bool				bpf2insn_valid;
 	struct arc_jit_data		*jit_data;
@@ -248,8 +249,8 @@ static void jit_ctx_cleanup(struct jit_context *ctx)
 		ctx->jit.len    = 0;
 	}
 
+	ctx->emit = false;
 	/* Global booleans set to false. */
-	emit = false;
 	zext_thyself = false;
 }
 
@@ -277,14 +278,14 @@ static void analyze_reg_usage(struct jit_context *ctx)
 }
 
 /* Verify that no instruction will be emitted when there is no buffer. */
-static inline int jit_buffer_check(const struct jit_buffer *jbuf)
+static inline int jit_buffer_check(const struct jit_context *ctx)
 {
-	if (emit == true) {
-		if (jbuf->buf == NULL) {
+	if (ctx->emit == true) {
+		if (ctx->jit.buf == NULL) {
 			pr_err("bpf-jit: inconsistence state; no "
 			       "buffer to emit instructions.\n");
 			return -EINVAL;
-		} else if (jbuf->index > jbuf->len) {
+		} else if (ctx->jit.index > ctx->jit.len) {
 			pr_err("bpf-jit: estimated JIT length is less "
 			       "than the emitted instructions.\n");
 			return -EFAULT;
@@ -294,31 +295,31 @@ static inline int jit_buffer_check(const struct jit_buffer *jbuf)
 }
 
 /* On a dry-run (emit=false), "jit.len" is growing gradually. */
-static inline void jit_buffer_update(struct jit_buffer *jbuf, u32 n)
+static inline void jit_buffer_update(struct jit_context *ctx, u32 n)
 {
-	if (!emit)
-		jbuf->len += n;
+	if (!ctx->emit)
+		ctx->jit.len += n;
 	else
-		jbuf->index += n;
+		ctx->jit.index += n;
 }
 
 /* Based on "emit", determine the address where instructions are emitted. */
-static inline u8 *effective_jit_buf(const struct jit_buffer *jbuf)
+static inline u8 *effective_jit_buf(const struct jit_context *ctx)
 {
-	return emit ? jbuf->buf + jbuf->index : NULL;
+	return ctx->emit ? (ctx->jit.buf + ctx->jit.index) : NULL;
 }
 
 /* Prologue based on context variables set by "analyze_reg_usage()". */
 static int handle_prologue(struct jit_context *ctx)
 {
 	int ret;
-	u8 *buf = effective_jit_buf(&ctx->jit);
+	u8 *buf = effective_jit_buf(ctx);
 	u32 len = 0;
 
-	CHECK_RET(jit_buffer_check(&ctx->jit));
+	CHECK_RET(jit_buffer_check(ctx));
 
 	len = arc_prologue(buf, ctx->arc_regs_clobbered, ctx->frame_size);
-	jit_buffer_update(&ctx->jit, len);
+	jit_buffer_update(ctx, len);
 
 	return 0;
 }
@@ -327,13 +328,13 @@ static int handle_prologue(struct jit_context *ctx)
 static int handle_epilogue(struct jit_context *ctx)
 {
 	int ret;
-	u8 *buf = effective_jit_buf(&ctx->jit);
+	u8 *buf = effective_jit_buf(ctx);
 	u32 len = 0;
 
-	CHECK_RET(jit_buffer_check(&ctx->jit));
+	CHECK_RET(jit_buffer_check(ctx));
 
 	len = arc_epilogue(buf, ctx->arc_regs_clobbered, ctx->frame_size);
-	jit_buffer_update(&ctx->jit, len);
+	jit_buffer_update(ctx, len);
 
 	return 0;
 }
@@ -597,7 +598,7 @@ static int handle_jumps(const struct jit_context *ctx,
 {
 	u8 cond;
 	int ret = 0;
-	u8 *buf = effective_jit_buf(&ctx->jit);
+	u8 *buf = effective_jit_buf(ctx);
 	const bool j32 = (BPF_CLASS(insn->code) == BPF_JMP32) ? true : false;
 	const u8 rd = insn->dst_reg;
 	u8 rs = insn->src_reg;
@@ -622,10 +623,10 @@ static int handle_jumps(const struct jit_context *ctx,
 	 */
 	if (has_imm(insn) && (cond != ARC_CC_AL)) {
 		if (j32) {
-			*len += mov_r32_i32(buf + *len, JIT_REG_TMP,
+			*len += mov_r32_i32(BUF(buf, *len), JIT_REG_TMP,
 					    insn->imm);
 		} else {
-			*len += mov_r64_i32(buf + *len, JIT_REG_TMP,
+			*len += mov_r64_i32(BUF(buf, *len), JIT_REG_TMP,
 					    insn->imm);
 		}
 		rs = JIT_REG_TMP;
@@ -641,10 +642,10 @@ static int handle_jumps(const struct jit_context *ctx,
 	}
 
 	if (j32) {
-		*len += gen_jmp_32(buf + *len, rd, rs, cond,
+		*len += gen_jmp_32(BUF(buf, *len), rd, rs, cond,
 				   curr_off, targ_off);
 	} else {
-		*len += gen_jmp_64(buf + *len, rd, rs, cond,
+		*len += gen_jmp_64(BUF(buf, *len), rd, rs, cond,
 				   curr_off, targ_off);
 	}
 
@@ -655,7 +656,7 @@ static int handle_jumps(const struct jit_context *ctx,
 static int handle_jmp_epilogue(struct jit_context *ctx,
 			       const struct bpf_insn *insn, u8 *len)
 {
-	u8 *buf = effective_jit_buf(&ctx->jit);
+	u8 *buf = effective_jit_buf(ctx);
 	u32 curr_off = 0, epi_off = 0;
 
 	/* Check the offset only if the data is available. */
@@ -683,7 +684,7 @@ static int handle_call(struct jit_context *ctx,
 	int  ret;
 	bool in_kernel_func, fixed = false;
 	u64  addr = 0;
-	u8  *buf = effective_jit_buf(&ctx->jit);
+	u8  *buf = effective_jit_buf(ctx);
 
 	ret = bpf_jit_get_func_addr(ctx->prog, insn, ctx->is_extra_pass,
 				    &addr, &fixed);
@@ -701,7 +702,7 @@ static int handle_call(struct jit_context *ctx,
 
 	if (insn->src_reg != BPF_PSEUDO_CALL) {
 		/* Assigning ABI's return reg to JIT's return reg. */
-		*len += arc_to_bpf_return(buf + *len);
+		*len += arc_to_bpf_return(BUF(buf, *len));
 	}
 
 	return 0;
@@ -718,7 +719,7 @@ static int handle_ld_imm64(struct jit_context *ctx,
 			   u8 *len)
 {
 	const s32 idx = get_index_for_insn(ctx, insn);
-	u8 *buf = effective_jit_buf(&ctx->jit);
+	u8 *buf = effective_jit_buf(ctx);
 
 	/* We're about to consume 2 VM instructions. */
 	if (is_last_insn(ctx->prog, idx)) {
@@ -754,7 +755,7 @@ static int handle_insn(struct jit_context *ctx, u32 idx)
 	const u8  src  = insn->src_reg;
 	const s16 off  = insn->off;
 	const s32 imm  = insn->imm;
-	u8 *buf = effective_jit_buf(&ctx->jit);
+	u8 *buf = effective_jit_buf(ctx);
 	u8  len = 0;
 	int ret = 0;
 
@@ -1053,10 +1054,10 @@ static int handle_insn(struct jit_context *ctx, u32 idx)
 		 * takes care of calling "zext()" based on the input "size".
 		 */
 		if (BPF_OP(code) != BPF_END)
-			len += zext(buf+len, dst);
+			len += zext(BUF(buf, len), dst);
 	}
 
-	jit_buffer_update(&ctx->jit, len);
+	jit_buffer_update(ctx, len);
 
 	return ret;
 }
@@ -1067,14 +1068,14 @@ static int handle_body(struct jit_context *ctx)
 	bool populate_bpf2insn = false;
 	const struct bpf_prog *prog = ctx->prog;
 
-	CHECK_RET(jit_buffer_check(&ctx->jit));
+	CHECK_RET(jit_buffer_check(ctx));
 
 	/*
 	 * Record the mapping for the instructions during the dry-run.
 	 * Doing it this way allows us to have the mapping ready for
 	 * the jump instructions during the real compilation phase.
 	 */
-	if (!emit)
+	if (!ctx->emit)
 		populate_bpf2insn = true;
 
 	for (u32 i = 0; i < prog->len; i++) {
@@ -1173,7 +1174,7 @@ static int jit_prepare(struct jit_context *ctx)
 	int ret;
 
 	/* Dry run. */
-	emit = false;
+	ctx->emit = false;
 
 	CHECK_RET(jit_prepare_early_mem_alloc(ctx));
 
@@ -1207,7 +1208,7 @@ static int jit_compile(struct jit_context *ctx)
 	int ret;
 
 	/* Let there be code. */
-	emit = true;
+	ctx->emit = true;
 
 	CHECK_RET(handle_prologue(ctx));
 
@@ -1252,7 +1253,8 @@ static void jit_finalize(struct jit_context *ctx)
 		 */
 		bpf_jit_binary_lock_ro(ctx->bpf_header);
 		flush_icache_range((unsigned long) ctx->bpf_header,
-				   (unsigned long) ctx->jit.buf + ctx->jit.len);
+				   (unsigned long)
+				   BUF(ctx->jit.buf, ctx->jit.len));
 		prog->aux->jit_data = NULL;
 		bpf_prog_fill_jited_linfo(prog, ctx->bpf2insn);
 	}
@@ -1315,7 +1317,7 @@ static int jit_patch_relocations(struct jit_context *ctx)
 	const struct bpf_prog *prog = ctx->prog;
 	int ret;
 
-	emit = true;
+	ctx->emit = true;
 	for (u32 i = 0; i < prog->len; i++) {
 		const struct bpf_insn *insn = &prog->insnsi[i];
 		u8 dummy;
@@ -1341,7 +1343,7 @@ static int jit_patch_relocations(struct jit_context *ctx)
  * to get the necessary data for the real compilation phase,
  * jit_compile().
  */
-struct bpf_prog *do_normal_pass(struct bpf_prog *prog)
+static struct bpf_prog *do_normal_pass(struct bpf_prog *prog)
 {
 	struct jit_context ctx;
 
@@ -1377,7 +1379,7 @@ struct bpf_prog *do_normal_pass(struct bpf_prog *prog)
  * again to get the newly translated addresses in order to resolve
  * the "call"s.
  */
-struct bpf_prog *do_extra_pass(struct bpf_prog *prog)
+static struct bpf_prog *do_extra_pass(struct bpf_prog *prog)
 {
 	struct jit_context ctx;
 
-- 
2.35.8


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
