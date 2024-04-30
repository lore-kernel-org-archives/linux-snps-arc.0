Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC121C25B10
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Apr 2024 15:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f3yT6lB6DEwDXFvRIO7o3UwDojVY/o5++MhI+56RTDs=; b=LF9SHHHauFuLFl
	1Y87WJKHbsBjmAqGuaQLY5QVuQ177tAUN9B3sqKgL7Ej/qwSCVkoI/U+XQ37tZKtdhnaVYp48KBHV
	fZ2eo6lFQ1m3b6i/mB5fbCV3ULYqFRAN9hAgqnQHaj2JOkwvNl1P9qZERQtVT2nrljfi/3Mwi2zMz
	/TTA1pb6LStUKN4sb6Mtho4hNnlmVMZkJMNV8tToSuW4IrIU9wjnl63tDvLscJmQGK+LngZ6aq5JQ
	s9ecAvvgNfNOLzR8NeEnfixUyPsrNPbPQnLCPGrP7EZfQmjj1wPg7ANUQ3s5maLRrNqGDPUdIdpUj
	yvhs6rPe0h+AJ4bkc3FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1p7Z-0000000701w-1Uk7;
	Tue, 30 Apr 2024 15:10:17 +0000
Received: from out-175.mta0.migadu.com ([2001:41d0:1004:224b::af])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1p7T-00000006zvU-2SzX
	for linux-snps-arc@lists.infradead.org;
	Tue, 30 Apr 2024 15:10:14 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vahedi.org; s=key1;
	t=1714489808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S/gFata7LB5jkMOWDAr1ONlFIHgWqNBA0WgGFOg3d/E=;
	b=FNfkPm1cxEKK+4PAS8/PHhbtHEYRdLXKwv6O5hr8AqN+CSrXLSeDIOdf4B31xowb5Svbh/
	MsMzcEZGikpmf6M28bDpbHONAEcADs0T8mQJ/c/imunHkzGPHjZzLqSpyb6H0h5pi84/lg
	6y0rFsFT9FX/76QCGsbVk3knwSYpaHSiGTRzxs5NXq2KPXqjJVla6C1S7nPyggB3nyKVkD
	ArS6m1wplhuqZLVjuaQZ42y1XoZ3rdVsjBRIHVPlOL4D1yRitCKlXkazp1NcCDUSA3aWJD
	m0KwlEE5vUU5E99A6gCLBXVll4TI+TSEoAhmS1yrzNuThDjHDVGuK0ER4EyG/g==
From: Shahab Vahedi <list+bpf@vahedi.org>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
Cc: Shahab Vahedi <list+bpf@vahedi.org>,
	Shahab Vahedi <shahab@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: [PATCH 3/7] v2: Use memset() in jit_ctx_init()
Date: Tue, 30 Apr 2024 17:09:33 +0200
Message-Id: <20240430150937.39793-4-list+bpf@vahedi.org>
In-Reply-To: <20240430150937.39793-1-list+bpf@vahedi.org>
References: <20240430150937.39793-1-list+bpf@vahedi.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_081011_963449_8720AB82 
X-CRM114-Status: UNSURE (   9.64  )
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

---
 arch/arc/net/bpf_jit_core.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/arch/arc/net/bpf_jit_core.c b/arch/arc/net/bpf_jit_core.c
index 79ec0bbf1153..9c0fdd514967 100644
--- a/arch/arc/net/bpf_jit_core.c
+++ b/arch/arc/net/bpf_jit_core.c
@@ -159,6 +159,8 @@ static void jit_dump(const struct jit_context *ctx)
 /* Initialise the context so there's no garbage. */
 static int jit_ctx_init(struct jit_context *ctx, struct bpf_prog *prog)
 {
+	memset(ctx, 0, sizeof(ctx));
+
 	ctx->orig_prog = prog;
 
 	/* If constant blinding was requested but failed, scram. */
@@ -167,25 +169,12 @@ static int jit_ctx_init(struct jit_context *ctx, struct bpf_prog *prog)
 		return PTR_ERR(ctx->prog);
 	ctx->blinded = (ctx->prog == ctx->orig_prog ? false : true);
 
-	ctx->jit.buf            = NULL;
-	ctx->jit.len            = 0;
-	ctx->jit.index          = 0;
-	ctx->bpf_header         = NULL;
-	ctx->bpf2insn           = NULL;
-	ctx->bpf2insn_valid     = false;
-	ctx->jit_data           = NULL;
-	ctx->arc_regs_clobbered = 0;
-	ctx->save_blink         = false;
-	ctx->frame_size         = 0;
-	ctx->epilogue_offset    = 0;
-	ctx->need_extra_pass    = false;
-	ctx->is_extra_pass	= ctx->prog->jited;
-	ctx->user_bpf_prog	= ctx->prog->is_func;
-	ctx->success            = false;
-
 	/* If the verifier doesn't zero-extend, then we have to do it. */
 	ctx->do_zext = !ctx->prog->aux->verifier_zext;
 
+	ctx->is_extra_pass = ctx->prog->jited;
+	ctx->user_bpf_prog = ctx->prog->is_func;
+
 	return 0;
 }
 
-- 
2.35.8


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
