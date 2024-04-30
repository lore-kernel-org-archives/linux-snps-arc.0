Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7302CC25B10
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Apr 2024 15:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vC7buN5h2jwx6RQoA/jXBZ7e/LZjzGDi+wpMCv6K1k4=; b=sU7p0Q1mxkMD/u
	4zRsLYqRR2z8UexzfgEKiG5Zgp2XVH0ihbIVy0Y+ZxzKv3jSd8RoWXwDJVjpNpizHl7cSdo+znYpX
	0Gb9ZRs3Jq9CfDOYB+ChAXoGfqkhB4apZYkymyDTOnirqFkBd10MAp4CSd6eI67wvc3Q8XFHN/69G
	Op7Uq15ILIurEq8bXmaR0B0qHAwPyk+7uYn5n1l/KIXyhHO33xrXaPBbk4sdBVQpAcNDs9Qb70WhN
	vhwLClOLIR/PyP8bAYTA7HAz8iQnmrkSkAWO97puz1u/ttZphblD5HxJ96Q9GvtL986Dy1y5FMy07
	M0prMx4Rywz+tFnPSWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1p7b-0000000704O-43ur;
	Tue, 30 Apr 2024 15:10:20 +0000
Received: from out-183.mta0.migadu.com ([91.218.175.183])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1p7V-00000006zxK-0Ooj
	for linux-snps-arc@lists.infradead.org;
	Tue, 30 Apr 2024 15:10:16 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vahedi.org; s=key1;
	t=1714489809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yP0Tj5WBarB+Jyjo4h0BnOQOGOKx2J+3QabMD2B1BrQ=;
	b=QEwgkc3qoAA+Bnkn6MVF9AT4ZYKaB78ngx3BNYwilajg+qN3GyH9niKR0E04Fp+rGNvczJ
	9iR5iAs28FstVW+xaROfiZtDjD+m8cDkQjrcLumm8BHMVXYwr/PYamMWYUxtzSTFtNRRBO
	v1ee1CFNJuKdyYKrTmhBrrDFWtGwR3lbET0ZWmog+iW8UhYQr24g5KLb/48W0MqO7xkz8J
	qZhUkXN7XU+7deAoSQZnUSrnCpnYWSd+TWvYLSrnUTZTI4IaDzvX6Yhtg12OGdlPp8kEgO
	UQNspqGKiDkCrbdCBG5FytSN3RHCUmQVdQy+SQO18mdcoHz4Xp5Hboy3HDetiA==
From: Shahab Vahedi <list+bpf@vahedi.org>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
Cc: Shahab Vahedi <list+bpf@vahedi.org>,
	Shahab Vahedi <shahab@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH 7/7] v2: Check "bpf_jit_binary_lock_ro()" return value
Date: Tue, 30 Apr 2024 17:09:37 +0200
Message-Id: <20240430150937.39793-8-list+bpf@vahedi.org>
In-Reply-To: <20240430150937.39793-1-list+bpf@vahedi.org>
References: <20240430150937.39793-1-list+bpf@vahedi.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_081013_582364_3A1BBAFB 
X-CRM114-Status: UNSURE (   9.85  )
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

From: Shahab Vahedi <shahab@synopsys.com>

...after the rebase.
---
 arch/arc/net/bpf_jit_core.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/arch/arc/net/bpf_jit_core.c b/arch/arc/net/bpf_jit_core.c
index 00c99b339b4a..6f6b4ffccf2c 100644
--- a/arch/arc/net/bpf_jit_core.c
+++ b/arch/arc/net/bpf_jit_core.c
@@ -1218,15 +1218,10 @@ static int jit_compile(struct jit_context *ctx)
  *
  * prog->jited=1, prog->jited_len=..., prog->bpf_func=...
  */
-static void jit_finalize(struct jit_context *ctx)
+static int jit_finalize(struct jit_context *ctx)
 {
 	struct bpf_prog *prog = ctx->prog;
 
-	ctx->success = true;
-	prog->bpf_func = (void *)ctx->jit.buf;
-	prog->jited_len = ctx->jit.len;
-	prog->jited = 1;
-
 	/* We're going to need this information for the "do_extra_pass()". */
 	if (ctx->need_extra_pass) {
 		ctx->jit_data->bpf_header = ctx->bpf_header;
@@ -1237,7 +1232,10 @@ static void jit_finalize(struct jit_context *ctx)
 		 * If things seem finalised, then mark the JITed memory
 		 * as R-X and flush it.
 		 */
-		bpf_jit_binary_lock_ro(ctx->bpf_header);
+		if (bpf_jit_binary_lock_ro(ctx->bpf_header)) {
+			pr_err("bpf-jit: Could not lock the JIT memory.\n");
+			return -EFAULT;
+		}
 		flush_icache_range((unsigned long)ctx->bpf_header,
 				   (unsigned long)
 				   BUF(ctx->jit.buf, ctx->jit.len));
@@ -1245,8 +1243,15 @@ static void jit_finalize(struct jit_context *ctx)
 		bpf_prog_fill_jited_linfo(prog, ctx->bpf2insn);
 	}
 
+	ctx->success = true;
+	prog->bpf_func = (void *)ctx->jit.buf;
+	prog->jited_len = ctx->jit.len;
+	prog->jited = 1;
+
 	jit_ctx_cleanup(ctx);
 	jit_dump(ctx);
+
+	return 0;
 }
 
 /*
@@ -1354,7 +1359,10 @@ static struct bpf_prog *do_normal_pass(struct bpf_prog *prog)
 		return prog;
 	}
 
-	jit_finalize(&ctx);
+	if (jit_finalize(&ctx)) {
+		jit_ctx_cleanup(&ctx);
+		return prog;
+	}
 
 	return ctx.prog;
 }
@@ -1389,7 +1397,10 @@ static struct bpf_prog *do_extra_pass(struct bpf_prog *prog)
 		return prog;
 	}
 
-	jit_finalize(&ctx);
+	if (jit_finalize(&ctx)) {
+		jit_ctx_cleanup(&ctx);
+		return prog;
+	}
 
 	return ctx.prog;
 }
-- 
2.35.8


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
