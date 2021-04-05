Return-Path: <SRS0=9+m5=JC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC800C43460
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Apr 2021 14:32:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CB7461284
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Apr 2021 14:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CB7461284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=thg2ldjRbgUnEMDLBmV6XmHy8B5bNMxPPTqhjXTxmak=; b=MNKU2eMDeaZdC/Ki/CCZ93hCL
	waXb5FqKCMHqeh9LCj0bdR+5ZDpQy1opn/DcPohgQbFexBFcQCR/axm71mXGX9JJBAMRVxlMORrua
	L/wAfryZLdqPxK6QIXxmc3b0YDsLDW2Drpg3B+9zYlfJPwYz6dgHVqa9BbQcl8X4lfSKROSIkRywt
	OqYwrR3xu6dlRNdBbtawSUZEPwYIFe8MBVIR400/TkChXXqfVQ+Iwq+WmOuzsYEEa9QzW2UPKwGl0
	DM6J3w4DzPSebT0SP41jYOY2py83R/HG6nyJaoSD9tGJkRaAqS27mKzZCITDulsMZRIYVvfKMz6kE
	RGQU1+O6g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTQHO-00HPft-GG; Mon, 05 Apr 2021 14:32:38 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTQHJ-00HPcZ-8L
 for linux-snps-arc@lists.infradead.org; Mon, 05 Apr 2021 14:32:35 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so7659174wmy.5
 for <linux-snps-arc@lists.infradead.org>; Mon, 05 Apr 2021 07:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JhZpQG5mMQ79/nAvtg+AVfjzq1Z9qY3ELTdEF/RZurI=;
 b=bRQJfs+9hOPjRSgH4Dezuzkx4Qb9ShCQl2ywFsRc6XoicFmhFf8YH/BFyLAEq+u3If
 teP6xDCajIgsq8T09jexafqKPjgDDSJAlkKdYFCbWojtfyzjGXugIVXuj30LhZp68POu
 GT78PyegC0t5KaXOr9QW62gETyka5bRoiRYsKYbkk5xxGE56L1RB4XAhzO/CEXxJynQZ
 uRZCw0yH/AX6limoUJkj9krHKyi/vk1alkJ3mVPBAbgv8XMsicUquKZdzcnbaw4M/X7p
 PSogNtOX4xfoGBuL+g32wv/rtqQPZ7GdpXY3HZz6HKCfQgEm5EM7Hh/eLFriB750MQKp
 gIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JhZpQG5mMQ79/nAvtg+AVfjzq1Z9qY3ELTdEF/RZurI=;
 b=PLpE0698L+KK13Ew5KXJJQplJADyP3P50/7G2+P00WYaMzqdZa999B3Oe9dQ0N7YmV
 Cgv8WhuJkc5jUt9A2Tfibt8OHOTPAZ6+qR/bZQ0wrOM3IcgJSTyZAdmWqvrzDTK/J/JR
 EDeLHoH9u9+TVYSGUdQhY0xqH821jvzzTqh8K1tazfs75ValFa12h9/coNHQu2bQeUCe
 3vcTmghvfgBUm+7RHxPovorsMriqvn2DLNRq+QzcB+6UFrIE3C7D4QJn0+JQofIX0hVm
 SjFoCUViwI+ywdTPMESpjDNR0BBo9OcCKWYdzuO+KfNr9QjfWoB53lgFzphQrY5wrbbr
 Cn+Q==
X-Gm-Message-State: AOAM530NaN3UMg/T9W35GABQn1k5KX1wm2/1H+G7HNiqeYzXq+q2KIHY
 GVh9q9oCFJ+G4x7PDDS2vCQ=
X-Google-Smtp-Source: ABdhPJzOEX98nZVcBJbwT2Gj5t1w+ohBeRR6WbLF+RlwTHhQqEj7XSOwe0dFktufEw2eyL5DKd3ANg==
X-Received: by 2002:a05:600c:4f4f:: with SMTP id
 m15mr25533609wmq.29.1617633151703; 
 Mon, 05 Apr 2021 07:32:31 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:31 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Cc: linux-snps-arc@lists.infradead.org, claziss@synopsys.com,
 shahab@synopsys.com, cmiranda@synopsys.com
Subject: [PATCH 21/27] arcv3: TCG instruction generator changes
Date: Mon,  5 Apr 2021 15:31:32 +0100
Message-Id: <20210405143138.17016-22-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_153233_365337_A7F6EE3E 
X-CRM114-Status: GOOD (  11.78  )
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

From: Cupertino Miranda <cmiranda@synopsys.com>

---
 target/arc/translate.c | 180 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/target/arc/translate.c b/target/arc/translate.c
index 1712fcc9c3..6b2102394f 100644
--- a/target/arc/translate.c
+++ b/target/arc/translate.c
@@ -303,6 +303,15 @@ static bool read_and_decode_context(DisasContext *ctx,
                                         cpu_ldl_code(ctx->env,
                                         ctx->cpc + length));
         length += 4;
+#ifdef TARGET_ARCV3
+    } else if(ctx->insn.signed_limm_p) {
+        ctx->insn.limm = ARRANGE_ENDIAN(true,
+                                        cpu_ldl_code (ctx->env,
+                                        ctx->cpc + length));
+        if(ctx->insn.limm & 0x80000000)
+          ctx->insn.limm += 0xffffffff00000000;
+        length += 4;
+#endif
     } else {
         ctx->insn.limm = 0;
     }
@@ -747,7 +756,14 @@ arc_gen_SR(DisasCtxt *ctx, TCGv src2, TCGv src1)
 {
     int ret = DISAS_NEXT;
 
+#ifdef TARGET_ARCV2
+    writeAuxReg(src2, src1);
+#elif TARGET_ARCV3
+    TCGv temp = tcg_temp_local_new();
+    tcg_gen_andi_tl(temp, src1, 0xffffffff);
     writeAuxReg(src2, src1);
+    tcg_temp_free(temp);
+#endif
     return ret;
 }
 int
@@ -770,6 +786,169 @@ arc_gen_SYNC(DisasCtxt *ctx)
 }
 
 
+#ifdef TARGET_ARCV3
+/*
+ * The mpyl instruction is a 64x64 signed multipler that produces
+ * a 64-bit product (the lower 64-bit of the actual prodcut).
+ */
+int
+arc_gen_MPYL(DisasCtxt *ctx, TCGv a, TCGv b, TCGv c)
+{
+    if ((getFFlag () == true)) {
+        arc_gen_excp(ctx, EXCP_INST_ERROR, 0, 0);
+        return DISAS_NEXT;
+    }
+
+    TCGLabel *done = gen_new_label();
+
+    if (ctx->insn.cc) {
+        TCGv cc = tcg_temp_local_new();
+        arc_gen_verifyCCFlag(ctx, cc);
+        tcg_gen_brcondi_tl(TCG_COND_NE, cc, 1, done);
+        tcg_temp_free(cc);
+    }
+
+    TCGv_i64 lo = tcg_temp_local_new_i64();
+    TCGv_i64 hi = tcg_temp_local_new_i64();
+
+    tcg_gen_muls2_i64(lo, hi, b, c);
+    tcg_gen_mov_tl(a, lo);
+
+    tcg_temp_free_i64(hi);
+    tcg_temp_free_i64(lo);
+    gen_set_label(done);
+
+    return DISAS_NEXT;
+}
+
+/*
+ * The mpyml instruction is a 64x64 signed multipler that produces
+ * a 64-bit product (the higher 64-bit of the actual prodcut).
+ */
+int
+arc_gen_MPYML(DisasCtxt *ctx, TCGv a, TCGv b, TCGv c)
+{
+    if ((getFFlag () == true)) {
+        arc_gen_excp(ctx, EXCP_INST_ERROR, 0, 0);
+        return DISAS_NEXT;
+    }
+
+    TCGLabel *done = gen_new_label();
+
+    if (ctx->insn.cc) {
+        TCGv cc = tcg_temp_local_new();
+        arc_gen_verifyCCFlag(ctx, cc);
+        tcg_gen_brcondi_tl(TCG_COND_NE, cc, 1, done);
+        tcg_temp_free(cc);
+    }
+
+    TCGv lo = tcg_temp_local_new();
+    TCGv hi = tcg_temp_local_new();
+    tcg_gen_muls2_i64(lo, hi, b, c);
+    tcg_gen_mov_tl(a, hi);
+
+    tcg_temp_free(hi);
+    tcg_temp_free(lo);
+    gen_set_label(done);
+
+    return DISAS_NEXT;
+}
+
+/*
+ * The mpymul instruction is a 64x64 unsigned multipler that produces
+ * a 64-bit product (the higher 64-bit of the actual prodcut).
+ */
+int
+arc_gen_MPYMUL(DisasCtxt *ctx, TCGv a, TCGv b, TCGv c)
+{
+    if ((getFFlag () == true)) {
+        arc_gen_excp(ctx, EXCP_INST_ERROR, 0, 0);
+        return DISAS_NEXT;
+    }
+
+    TCGLabel *done = gen_new_label();
+
+    if (ctx->insn.cc) {
+        TCGv cc = tcg_temp_local_new();
+        arc_gen_verifyCCFlag(ctx, cc);
+        tcg_gen_brcondi_tl(TCG_COND_NE, cc, 1, done);
+        tcg_temp_free(cc);
+    }
+
+    TCGv lo = tcg_temp_local_new();
+    TCGv hi = tcg_temp_local_new();
+
+    tcg_gen_mulu2_i64(lo, hi, b, c);
+    tcg_gen_mov_tl(a, hi);
+
+    tcg_temp_free(hi);
+    tcg_temp_free(lo);
+    gen_set_label(done);
+
+    return DISAS_NEXT;
+}
+
+/*
+ * The mpymsul instruction is a 64x64 signedxunsigned multipler that
+ * produces * a 64-bit product (the higher 64-bit of the actual prodcut).
+ */
+int
+arc_gen_MPYMSUL(DisasCtxt *ctx, TCGv a, TCGv b, TCGv c)
+{
+    if ((getFFlag () == true)) {
+        arc_gen_excp(ctx, EXCP_INST_ERROR, 0, 0);
+        return DISAS_NEXT;
+    }
+
+    TCGLabel *done = gen_new_label();
+
+    if (ctx->insn.cc) {
+        TCGv cc = tcg_temp_local_new();
+        arc_gen_verifyCCFlag(ctx, cc);
+        tcg_gen_brcondi_tl(TCG_COND_NE, cc, 1, done);
+        tcg_temp_free(cc);
+    }
+
+    TCGv lo = tcg_temp_local_new();
+    TCGv hi = tcg_temp_local_new();
+    tcg_gen_mulsu2_tl(lo, hi, b, c);
+    tcg_gen_mov_tl(a, hi);
+
+    tcg_temp_free(hi);
+    tcg_temp_free(lo);
+    gen_set_label(done);
+
+    return DISAS_NEXT;
+}
+
+/*
+ * a = b + (c << 32)
+ */
+int
+arc_gen_ADDHL(DisasCtxt *ctx, TCGv a, TCGv b, TCGv c)
+{
+    TCGLabel *done = gen_new_label();
+
+    if (ctx->insn.cc) {
+        TCGv cc = tcg_temp_local_new();
+        arc_gen_verifyCCFlag(ctx, cc);
+        tcg_gen_brcondi_tl(TCG_COND_NE, cc, 1, done);
+        tcg_temp_free(cc);
+    }
+
+    TCGv shifted = tcg_temp_local_new();
+    tcg_gen_shli_tl(shifted, c, 32);
+    tcg_gen_add_tl(a, b, shifted);
+
+    tcg_temp_free(shifted);
+    gen_set_label(done);
+
+    return DISAS_NEXT;
+}
+
+#endif
+#ifdef TARGET_ARCV2
+
 /*
  * Function to add boiler plate code for conditional execution.
  * It will add tcg_gen codes only if there is a condition to
@@ -1208,6 +1387,7 @@ arc_gen_VSUB4H(DisasCtxt *ctx, TCGv dest, TCGv_i32 b, TCGv_i32 c)
     }
     return DISAS_NEXT;
 }
+#endif
 
 int
 arc_gen_SWI(DisasCtxt *ctx, TCGv a)
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
