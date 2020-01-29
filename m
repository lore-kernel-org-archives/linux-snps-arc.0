Return-Path: <SRS0=NTAw=3S=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08591C35240
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Jan 2020 11:08:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D118B20732
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Jan 2020 11:08:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nlTTuQJ5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="hZcZyIxe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D118B20732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aeNOrlWW7YeAvrsnTM51zhTCAW+LgW5aRBMvfkkcFcU=; b=nlTTuQJ5TcvuMY
	vBCMICPTOrbxa/+5phzO08fLF3No5ZeYI8ji0Y6qacBAA9GFLGHYx6WxdBeHquRnAr0ydZJr/ehHr
	lhf9mytgXs+XqPI1f+PpbG2UAIBxpNSsoFQjzs2mbJfjusix9n5tS5AgzmxocuYZFNepwpmvCRt/L
	5//hIaCnKykhcUu5++mixyeV9EviPEJPUE+M12MVWznRlMsuqAuIfkQ/i1PtVh2iVBNfBvUrSnVpG
	1H4nHP5S5UQ8KlyPTMkbU7uBBe9IAF68w05d9pLurF9eT9JC6xgp/0kRjATiQztlWo4Bd6B6HzNnm
	vQdMZc7ZmVX/EvigL0Og==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwlDA-0001mV-SX; Wed, 29 Jan 2020 11:08:44 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwlD8-0001lr-7l
 for linux-snps-arc@lists.infradead.org; Wed, 29 Jan 2020 11:08:43 +0000
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 90F9A4082A;
 Wed, 29 Jan 2020 11:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1580296120; bh=jwhbrJfLaB4zxlzssWRV7zKaT/HDGYWhPl9sgwxqKlI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hZcZyIxeTSvi2BcjA4BRtluqWDJEqKgHthiIVlfEXT0M3hqK17pc+NXscJtVixlMm
 8cPfEnXUwzrc3kHzCwUe3I6Wqrt+qQpFElWfZBJM5Fb8rEy9mhN9yjTzesUP7TtATo
 dzVsXJTh4u0LxkKxDDZ6wEYM9IpQx6iIGEhIUjIaK1yGYkPnzHCXs2ZX10us+tRt1P
 5YdI/yiwmbGOai9jg5Cy4x6qofuyxWsUYNDz6iv/vgB9HQdifyE05yhj/eIZ3hvzxv
 TOuohpSaYLg6OWHNWLMFDFeW5EoJPPj9ZO2ms4jsvgFNWPneMgNuRt4fsRzZdJyNu+
 LNDvW09QaSvPA==
Received: from paltsev-e7480.internal.synopsys.com (unknown [10.121.8.65])
 by mailhost.synopsys.com (Postfix) with ESMTP id BDA97A0073;
 Wed, 29 Jan 2020 11:08:38 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: uboot-snps-arc@synopsys.com, Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 2/2] CLK: HSDK: fix HDMI clock calculation
Date: Wed, 29 Jan 2020 14:08:30 +0300
Message-Id: <20200129110830.22004-2-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200129110830.22004-1-Eugeniy.Paltsev@synopsys.com>
References: <20200129110830.22004-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_030842_287025_9F0F76A7 
X-CRM114-Status: GOOD (  11.57  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: u-boot@lists.denx.de, linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

HDMI PLL has its own xtal with 27 MHz output but we treat it the same
way as other PLLs with 33.33 MHz input.
Fix that.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
---
 drivers/clk/clk-hsdk-cgu.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-hsdk-cgu.c b/drivers/clk/clk-hsdk-cgu.c
index 69e6b24b66c..4637b9fdf15 100644
--- a/drivers/clk/clk-hsdk-cgu.c
+++ b/drivers/clk/clk-hsdk-cgu.c
@@ -46,17 +46,21 @@
  *            |        |-->|CGU_TUN_IDIV_ROM|----------->
  *            |        |-->|CGU_TUN_IDIV_PWM|----------->
  *            |
- *            |   ------------
- *            |-->| HDMI PLL |
- *            |   ------------
- *            |        |
- *            |        |-->|CGU_HDMI_IDIV_APB|------>
- *            |
  *            |   -----------
  *            |-->| DDR PLL |
  *                -----------
  *                     |
  *                     |---------------------------->
+ *
+ *   ------------------
+ *   | 27.00 MHz xtal |
+ *   ------------------
+ *            |
+ *            |   ------------
+ *            |-->| HDMI PLL |
+ *                ------------
+ *                     |
+ *                     |-->|CGU_HDMI_IDIV_APB|------>
  */
 
 #define CGU_ARC_IDIV		0x080
@@ -117,7 +121,8 @@
 #define CREG_CORE_IF_CLK_DIV_2		0x1
 
 #define MIN_PLL_RATE			100000000 /* 100 MHz */
-#define PARENT_RATE			33333333 /* fixed clock - xtal */
+#define PARENT_RATE_33			33333333 /* fixed clock - xtal */
+#define PARENT_RATE_27			27000000 /* fixed clock - xtal */
 #define CGU_MAX_CLOCKS			26
 
 #define CGU_SYS_CLOCKS			16
@@ -237,6 +242,7 @@ struct hsdk_cgu_clk {
 };
 
 struct hsdk_pll_devdata {
+	const u32 parent_rate;
 	const struct hsdk_pll_cfg *pll_cfg;
 	int (*update_rate)(struct hsdk_cgu_clk *clk, unsigned long rate,
 			   const struct hsdk_pll_cfg *cfg);
@@ -248,16 +254,19 @@ static int hsdk_pll_comm_update_rate(struct hsdk_cgu_clk *, unsigned long,
 				     const struct hsdk_pll_cfg *);
 
 static const struct hsdk_pll_devdata core_pll_dat = {
+	.parent_rate = PARENT_RATE_33,
 	.pll_cfg = asdt_pll_cfg,
 	.update_rate = hsdk_pll_core_update_rate,
 };
 
 static const struct hsdk_pll_devdata sdt_pll_dat = {
+	.parent_rate = PARENT_RATE_33,
 	.pll_cfg = asdt_pll_cfg,
 	.update_rate = hsdk_pll_comm_update_rate,
 };
 
 static const struct hsdk_pll_devdata hdmi_pll_dat = {
+	.parent_rate = PARENT_RATE_27,
 	.pll_cfg = hdmi_pll_cfg,
 	.update_rate = hsdk_pll_comm_update_rate,
 };
@@ -372,6 +381,7 @@ static ulong pll_get(struct clk *sclk)
 	u64 rate;
 	u32 idiv, fbdiv, odiv;
 	struct hsdk_cgu_clk *clk = dev_get_priv(sclk->dev);
+	u32 parent_rate = clk->pll_devdata->parent_rate;
 
 	val = hsdk_pll_read(clk, CGU_PLL_CTRL);
 
@@ -379,7 +389,7 @@ static ulong pll_get(struct clk *sclk)
 
 	/* Check if PLL is bypassed */
 	if (val & CGU_PLL_CTRL_BYPASS)
-		return PARENT_RATE;
+		return parent_rate;
 
 	/* Check if PLL is disabled */
 	if (val & CGU_PLL_CTRL_PD)
@@ -392,7 +402,7 @@ static ulong pll_get(struct clk *sclk)
 	/* output divider = 2^(reg.odiv) */
 	odiv = 1 << ((val & CGU_PLL_CTRL_ODIV_MASK) >> CGU_PLL_CTRL_ODIV_SHIFT);
 
-	rate = (u64)PARENT_RATE * fbdiv;
+	rate = (u64)parent_rate * fbdiv;
 	do_div(rate, idiv * odiv);
 
 	return rate;
@@ -490,7 +500,8 @@ static ulong pll_set(struct clk *sclk, ulong rate)
 		}
 	}
 
-	pr_err("invalid rate=%ld Hz, parent_rate=%d Hz\n", best_rate, PARENT_RATE);
+	pr_err("invalid rate=%ld Hz, parent_rate=%d Hz\n", best_rate,
+	       clk->pll_devdata->parent_rate);
 
 	return -EINVAL;
 }
-- 
2.21.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
