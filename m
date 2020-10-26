Return-Path: <SRS0=oLQF=EC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01887C2D0A3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Oct 2020 00:13:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC32E20754
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Oct 2020 00:13:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vz0mU7yn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/IDBpwB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC32E20754
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m3MqKLoQc21juhpqxUnZPcKgG4nDVvMqgRZ0JSBVu3k=; b=Vz0mU7yntpSAr+BCzAM/WNOr5
	wQmCb3xgLGp7xH+pfTywcwRH1NAltPQ5APME8m3ntx6ow/nv2NA6H4u3HAERRbj4T25abzW++4qBf
	bxNg1e1R4MqpGEDV+KIJPr+xYKYm9zsTlpNGDAc3FI9fQA405alUdoDmbCHxIQrk2dGajgDDsdEZk
	ddiyp6Ne9hVA4qmqddp36TfNxjwhtYl/642q1jdY+1PrVNZ5dN5peQdQQKYYuJjrfHSBFJ84hdwZH
	sGlQvy8boWDu7LL2t0RCEEU4KbMnP9tHUZRaU63o5XRvUhTBmuYPZkxuTdChnttpqYBVD8EYifLUR
	zcYTcwCkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXCc0-0003MY-Ga; Tue, 27 Oct 2020 00:13:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXCLh-0003tV-5u
 for linux-snps-arc@lists.infradead.org; Mon, 26 Oct 2020 23:56:27 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 18B2A20B1F;
 Mon, 26 Oct 2020 23:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603756582;
 bh=cWeSsh3qN4L40RKXSAhIjwG++878JP/Vd+vcjn7wHko=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n/IDBpwB3AcnAcRS/53emNsurWkvwHxZDSjhGTyJUcYZZjckQVaB7zOjnSvYZDtHH
 fc48a5nu2IHKlxkMKsWEL4c5+cW9A5p2mCsn4HKUAHJXWOtpVBP+QEhUIgn1+Ca4c1
 tkixf0Uo+ylTs1Wewc2PDj1ga0cznqnN3m4PSwGY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 55/80] ARC: [dts] fix the errors detected by
 dtbs_check
Date: Mon, 26 Oct 2020 19:54:51 -0400
Message-Id: <20201026235516.1025100-55-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026235516.1025100-1-sashal@kernel.org>
References: <20201026235516.1025100-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_195625_597208_408E8DE8 
X-CRM114-Status: GOOD (  12.78  )
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
Cc: Sasha Levin <sashal@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Zhen Lei <thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Zhen Lei <thunder.leizhen@huawei.com>

[ Upstream commit 05b1be68c4d6d76970025e6139bfd735c2256ee5 ]

xxx/arc/boot/dts/axs101.dt.yaml: dw-apb-ictl@e0012000: $nodename:0: \
'dw-apb-ictl@e0012000' does not match '^interrupt-controller(@[0-9a-f,]+)*$'
 From schema: xxx/interrupt-controller/snps,dw-apb-ictl.yaml

The node name of the interrupt controller must start with
"interrupt-controller" instead of "dw-apb-ictl".

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/boot/dts/axc001.dtsi         | 2 +-
 arch/arc/boot/dts/axc003.dtsi         | 2 +-
 arch/arc/boot/dts/axc003_idu.dtsi     | 2 +-
 arch/arc/boot/dts/vdk_axc003.dtsi     | 2 +-
 arch/arc/boot/dts/vdk_axc003_idu.dtsi | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arc/boot/dts/axc001.dtsi b/arch/arc/boot/dts/axc001.dtsi
index 6ec1fcdfc0d7f..92247288d0562 100644
--- a/arch/arc/boot/dts/axc001.dtsi
+++ b/arch/arc/boot/dts/axc001.dtsi
@@ -85,7 +85,7 @@ arcpct0: pct {
 	 * avoid duplicating the MB dtsi file given that IRQ from
 	 * this intc to cpu intc are different for axs101 and axs103
 	 */
-	mb_intc: dw-apb-ictl@e0012000 {
+	mb_intc: interrupt-controller@e0012000 {
 		#interrupt-cells = <1>;
 		compatible = "snps,dw-apb-ictl";
 		reg = < 0x0 0xe0012000 0x0 0x200 >;
diff --git a/arch/arc/boot/dts/axc003.dtsi b/arch/arc/boot/dts/axc003.dtsi
index ac8e1b463a709..cd1edcf4f95ef 100644
--- a/arch/arc/boot/dts/axc003.dtsi
+++ b/arch/arc/boot/dts/axc003.dtsi
@@ -129,7 +129,7 @@ mmc@15000 {
 	 * avoid duplicating the MB dtsi file given that IRQ from
 	 * this intc to cpu intc are different for axs101 and axs103
 	 */
-	mb_intc: dw-apb-ictl@e0012000 {
+	mb_intc: interrupt-controller@e0012000 {
 		#interrupt-cells = <1>;
 		compatible = "snps,dw-apb-ictl";
 		reg = < 0x0 0xe0012000 0x0 0x200 >;
diff --git a/arch/arc/boot/dts/axc003_idu.dtsi b/arch/arc/boot/dts/axc003_idu.dtsi
index 9da21e7fd246f..70779386ca796 100644
--- a/arch/arc/boot/dts/axc003_idu.dtsi
+++ b/arch/arc/boot/dts/axc003_idu.dtsi
@@ -135,7 +135,7 @@ mmc@15000 {
 	 * avoid duplicating the MB dtsi file given that IRQ from
 	 * this intc to cpu intc are different for axs101 and axs103
 	 */
-	mb_intc: dw-apb-ictl@e0012000 {
+	mb_intc: interrupt-controller@e0012000 {
 		#interrupt-cells = <1>;
 		compatible = "snps,dw-apb-ictl";
 		reg = < 0x0 0xe0012000 0x0 0x200 >;
diff --git a/arch/arc/boot/dts/vdk_axc003.dtsi b/arch/arc/boot/dts/vdk_axc003.dtsi
index f8be7ba8dad49..c21d0eb07bf67 100644
--- a/arch/arc/boot/dts/vdk_axc003.dtsi
+++ b/arch/arc/boot/dts/vdk_axc003.dtsi
@@ -46,7 +46,7 @@ debug_uart: dw-apb-uart@5000 {
 
 	};
 
-	mb_intc: dw-apb-ictl@e0012000 {
+	mb_intc: interrupt-controller@e0012000 {
 		#interrupt-cells = <1>;
 		compatible = "snps,dw-apb-ictl";
 		reg = < 0xe0012000 0x200 >;
diff --git a/arch/arc/boot/dts/vdk_axc003_idu.dtsi b/arch/arc/boot/dts/vdk_axc003_idu.dtsi
index 0afa3e53a4e39..4d348853ac7c5 100644
--- a/arch/arc/boot/dts/vdk_axc003_idu.dtsi
+++ b/arch/arc/boot/dts/vdk_axc003_idu.dtsi
@@ -54,7 +54,7 @@ debug_uart: dw-apb-uart@5000 {
 
 	};
 
-	mb_intc: dw-apb-ictl@e0012000 {
+	mb_intc: interrupt-controller@e0012000 {
 		#interrupt-cells = <1>;
 		compatible = "snps,dw-apb-ictl";
 		reg = < 0xe0012000 0x200 >;
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
