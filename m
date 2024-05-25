Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3237CC25B78
	for <linux-snps-arc@archiver.kernel.org>; Sat, 25 May 2024 03:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jznPfDyWToga/NOcdbgYNQmiJM5uVTQe2Bf6PVmHALM=; b=B/vx1gJNC2flxH
	s+IJP8VnW97K4/byhwmXCj74m6jmr0yu9ntCziat2nnnQjbs4k0YFDw93KjulHjDLle2Jm2pINoeD
	c/PQmlYZeJj2b9VWAfpKV5e2V5NWE1anMSKYgsGkn62t4rGEdhRtdj/eCYU+KeUOvted4z8BUNUmm
	DqAKVailoBrSA7hEOhVakOZOUmnVJCcBRqNoAsW8UG6knfp9LQ5gGEk1iKi1cvoYG2zelKYdzQ4rK
	cQU6HtmCfwPztzYX0ruSLaCWMukU/iSg5oQMPUse1/+YfQ0j1TmHUIXl/pCylmoCluK5mNeqTmWJQ
	9riMH3so0XUGF3reQueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAiWX-0000000AMdN-306L;
	Sat, 25 May 2024 03:56:49 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAiWQ-0000000AMby-2JZF
	for linux-snps-arc@lists.infradead.org;
	Sat, 25 May 2024 03:56:45 +0000
X-Envelope-To: bpf@vger.kernel.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vahedi.org; s=key1;
	t=1716609391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ESjsEOrjOSUIfpoJSGAmqJmoqMNxjpwHbfQn63f4et0=;
	b=owQSQSqFjjRZyiqkZ1lWmrHkb+jDpAVPpTMBtoA0eogMnMYaTrerBBvWNg9E5wlJ7U038L
	TKTUXEyk0C7Xltx6Ohr0kRPxexeYtxSgp4uy4A2ZrLoD2rsVolmmhHBWXCmbwoJmsYWNkB
	v++GPO6jxBRhG5io7GQ12w1tAUVkWkb2BEJQFhz/eVwBNkxVuvWjCBod4/JZ8FOhxI/Oin
	bCDrcEdyopMhHrTnSPN5Wd/ElyKqmFkAEKzuqzT+d6wA6PfLpcTM/TEt2etaW3vFEQS3vN
	s/RppA0LsAxAZ+3rVvnLqdfv9lgvxBFKeh1EvAWo+Az16ZSygoSme2WD8A1Omg==
X-Envelope-To: list+bpf@vahedi.org
X-Envelope-To: shahab@synopsys.com
X-Envelope-To: vgupta@kernel.org
X-Envelope-To: ast@kernel.org
X-Envelope-To: linux-snps-arc@lists.infradead.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shahab Vahedi <list+bpf@vahedi.org>
To: bpf@vger.kernel.org
Cc: Shahab Vahedi <list+bpf@vahedi.org>,
	Shahab Vahedi <shahab@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH bpf-next] ARC, bpf: Fix issues reported by the static analyzers
Date: Sat, 25 May 2024 05:56:28 +0200
Message-Id: <20240525035628.1026-1-list+bpf@vahedi.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_205643_644372_50C61582 
X-CRM114-Status: GOOD (  20.49  )
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

Also updated couple of comments along the way.

One of the issues reported was indeed a bug in the code:

  memset(ctx, 0, sizeof(ctx))      // original line
  memset(ctx, 0, sizeof(*ctx))     // fixed line

That was a nice catch.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202405222314.UG5F2NHn-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202405232036.Xqoc3b0J-lkp@intel.com/
Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
---
 arch/arc/net/bpf_jit.h       |  2 +-
 arch/arc/net/bpf_jit_arcv2.c | 10 ++++++----
 arch/arc/net/bpf_jit_core.c  | 22 +++++++++++-----------
 3 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/arch/arc/net/bpf_jit.h b/arch/arc/net/bpf_jit.h
index 34dfcac531d5..d688bb422fd5 100644
--- a/arch/arc/net/bpf_jit.h
+++ b/arch/arc/net/bpf_jit.h
@@ -39,7 +39,7 @@
 
 /************** Functions that the back-end must provide **************/
 /* Extension for 32-bit operations. */
-inline u8 zext(u8 *buf, u8 rd);
+u8 zext(u8 *buf, u8 rd);
 /***** Moves *****/
 u8 mov_r32(u8 *buf, u8 rd, u8 rs, u8 sign_ext);
 u8 mov_r32_i32(u8 *buf, u8 reg, s32 imm);
diff --git a/arch/arc/net/bpf_jit_arcv2.c b/arch/arc/net/bpf_jit_arcv2.c
index 31bfb6e9ce00..4458e409ca0a 100644
--- a/arch/arc/net/bpf_jit_arcv2.c
+++ b/arch/arc/net/bpf_jit_arcv2.c
@@ -62,7 +62,7 @@ enum {
  *   If/when we decide to add ARCv2 instructions that do use register pairs,
  *   the mapping, hopefully, doesn't need to be revisited.
  */
-const u8 bpf2arc[][2] = {
+static const u8 bpf2arc[][2] = {
 	/* Return value from in-kernel function, and exit value from eBPF */
 	[BPF_REG_0] = {ARC_R_8, ARC_R_9},
 	/* Arguments from eBPF program to in-kernel function */
@@ -1302,7 +1302,7 @@ static u8 arc_b(u8 *buf, s32 offset)
 
 /************* Packers (Deal with BPF_REGs) **************/
 
-inline u8 zext(u8 *buf, u8 rd)
+u8 zext(u8 *buf, u8 rd)
 {
 	if (rd != BPF_REG_FP)
 		return arc_movi_r(buf, REG_HI(rd), 0);
@@ -2235,6 +2235,7 @@ u8 gen_swap(u8 *buf, u8 rd, u8 size, u8 endian, bool force, bool do_zext)
 			break;
 		default:
 			/* The caller must have handled this. */
+			break;
 		}
 	} else {
 		/*
@@ -2253,6 +2254,7 @@ u8 gen_swap(u8 *buf, u8 rd, u8 size, u8 endian, bool force, bool do_zext)
 			break;
 		default:
 			/* The caller must have handled this. */
+			break;
 		}
 	}
 
@@ -2517,7 +2519,7 @@ u8 arc_epilogue(u8 *buf, u32 usage, u16 frame_size)
 #define JCC64_NR_OF_JMPS 3	/* Number of jumps in jcc64 template. */
 #define JCC64_INSNS_TO_END 3	/* Number of insn. inclusive the 2nd jmp to end. */
 #define JCC64_SKIP_JMP 1	/* Index of the "skip" jump to "end". */
-const struct {
+static const struct {
 	/*
 	 * "jit_off" is common between all "jmp[]" and is coupled with
 	 * "cond" of each "jmp[]" instance. e.g.:
@@ -2883,7 +2885,7 @@ u8 gen_jmp_64(u8 *buf, u8 rd, u8 rs, u8 cond, u32 curr_off, u32 targ_off)
  * The "ARC_CC_SET" becomes "CC_unequal" because of the "tst"
  * instruction that precedes the conditional branch.
  */
-const u8 arcv2_32_jmps[ARC_CC_LAST] = {
+static const u8 arcv2_32_jmps[ARC_CC_LAST] = {
 	[ARC_CC_UGT] = CC_great_u,
 	[ARC_CC_UGE] = CC_great_eq_u,
 	[ARC_CC_ULT] = CC_less_u,
diff --git a/arch/arc/net/bpf_jit_core.c b/arch/arc/net/bpf_jit_core.c
index 6f6b4ffccf2c..e3628922c24a 100644
--- a/arch/arc/net/bpf_jit_core.c
+++ b/arch/arc/net/bpf_jit_core.c
@@ -159,7 +159,7 @@ static void jit_dump(const struct jit_context *ctx)
 /* Initialise the context so there's no garbage. */
 static int jit_ctx_init(struct jit_context *ctx, struct bpf_prog *prog)
 {
-	memset(ctx, 0, sizeof(ctx));
+	memset(ctx, 0, sizeof(*ctx));
 
 	ctx->orig_prog = prog;
 
@@ -167,7 +167,7 @@ static int jit_ctx_init(struct jit_context *ctx, struct bpf_prog *prog)
 	ctx->prog = bpf_jit_blind_constants(prog);
 	if (IS_ERR(ctx->prog))
 		return PTR_ERR(ctx->prog);
-	ctx->blinded = (ctx->prog == ctx->orig_prog ? false : true);
+	ctx->blinded = (ctx->prog != ctx->orig_prog);
 
 	/* If the verifier doesn't zero-extend, then we have to do it. */
 	ctx->do_zext = !ctx->prog->aux->verifier_zext;
@@ -1182,12 +1182,12 @@ static int jit_prepare(struct jit_context *ctx)
 }
 
 /*
- * All the "handle_*()" functions have been called before by the
- * "jit_prepare()". If there was an error, we would know by now.
- * Therefore, no extra error checking at this point, other than
- * a sanity check at the end that expects the calculated length
- * (jit.len) to be equal to the length of generated instructions
- * (jit.index).
+ * jit_compile() is the real compilation phase. jit_prepare() is
+ * invoked before jit_compile() as a dry-run to make sure everything
+ * will go OK and allocate the necessary memory.
+ *
+ * In the end, jit_compile() checks if it has produced the same number
+ * of instructions as jit_prepare() would.
  */
 static int jit_compile(struct jit_context *ctx)
 {
@@ -1407,9 +1407,9 @@ static struct bpf_prog *do_extra_pass(struct bpf_prog *prog)
 
 /*
  * This function may be invoked twice for the same stream of BPF
- * instructions. The "extra pass" happens, when there are "call"s
- * involved that their addresses are not known during the first
- * invocation.
+ * instructions. The "extra pass" happens, when there are
+ * (re)locations involved that their addresses are not known
+ * during the first run.
  */
 struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *prog)
 {
-- 
2.39.4


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
