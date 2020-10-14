Return-Path: <SRS0=Sdks=DV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901E9C43467
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 10:18:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1157F20723
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 10:18:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M84I/Qlf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1157F20723
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/9YW0lCTdIPWowMQ+/ge4Xyo1+y038GlkAtW4+t0JGk=; b=M84I/QlfR6zWSA85YorVegrLQ
	5CDer08VCA429DWH7vT2XAkEtox5pbTiqJEoR8+mw7B06SmAPjk7quoIHvqLWQOzjq9xq099cXEMO
	gp9Fe+gYIxuayLnkEglbk+TVjJluuM/X+uHG5FfcTN+lzo85LnwLn42GeI3WbPChF5YhFq+gzgzqe
	Q31p3mE10nymMKr5/gSiYpSY18V1irrwZo3hHXNZYZco6UeYoQJhFQBLesg09kW97LEfsFATOR9Tu
	NvOobyY8wnEK89ITKJJdtJtfC7szNH55ypFdfZLjn3/9MjcV3be9wcg3/mY7MK9SVpd6XMnI/V7zj
	yjxZoq+mw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSdrg-0005x4-Gf; Wed, 14 Oct 2020 10:18:36 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSdnW-0003eU-1k; Wed, 14 Oct 2020 10:14:22 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 595658002548;
 Wed, 14 Oct 2020 10:14:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GjCpbGu3yfxE; Wed, 14 Oct 2020 13:14:16 +0300 (MSK)
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH 17/20] dt-bindings: usb: qcom,dwc3: Validate DWC3 sub-node
Date: Wed, 14 Oct 2020 13:13:59 +0300
Message-ID: <20201014101402.18271-18-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_061418_279710_7BE1BCCC 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-arm-msm@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Qualcomm msm8996/sc7180/sdm845 DWC3 compatible DT nodes are supposed to
have a DWC USB3 compatible sub-node to describe a fully functioning USB
interface. Let's use the available DWC USB3 DT schema to validate the
Qualcomm DWC3 sub-nodes.

Note since the generic DWC USB3 DT node is supposed to be named as generic
USB HCD ("^usb(@.*)?") one we have to accordingly fix the sub-nodes name
regexp and fix the DT node example.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Changelog v2:
- Discard the "^dwc3@[0-9a-f]+$" nodes from being acceptable as sub-nodes.
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index dac10848dd7f..8f8d781e73a0 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -103,11 +103,8 @@ properties:
 # Required child node:
 
 patternProperties:
-  "^dwc3@[0-9a-f]+$":
-    type: object
-    description:
-      A child node must exist to represent the core DWC3 IP block
-      The content of the node is defined in dwc3.txt.
+  "^usb@[0-9a-f]+$":
+    $ref: snps,dwc3.yaml#
 
 required:
   - compatible
@@ -160,7 +157,7 @@ examples:
 
             resets = <&gcc GCC_USB30_PRIM_BCR>;
 
-            dwc3@a600000 {
+            usb@a600000 {
                 compatible = "snps,dwc3";
                 reg = <0 0x0a600000 0 0xcd00>;
                 interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.27.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
