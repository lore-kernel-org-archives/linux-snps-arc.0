Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02612C433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Jun 2022 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ghJ6aqhRSVkkdoJl3Z7wHrTD5kz6ogf4IP35W9lyomA=; b=Mc6W+bGiq1LOeT
	1OjIQmKC8D7alaZkvyYRhGRfDeX9kX7IsIAmNcMnKNQbXu4a9U4SUlp+hh5M2AuxlMbciAwZL775f
	43uQygfeSVrUO1IZ3bsAjz7bJNxOwXLLNMNZTY3h1hsa2/0iCpKmhhBhqm0gFztJ36lUQ0jOAtyNO
	c6w3plOlJBPkZtwxX0fp5+mNZiOZeHJLgN+cUeadu+QcmUsmL1PThgZIgkC8bRuJqnQ2XtAgnJ5h5
	HRngebv7rNENNP6qbK2gO0nCzOudlnSp0wUh0wMwW2qaSaL3VBwHhtx5ORLgK2ahgEpvolG4PkDSa
	zacjaTw9m2P89aYlGk6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4k8J-002Zif-0M; Fri, 24 Jun 2022 14:18:03 +0000
Received: from mail.baikalelectronics.com ([87.245.175.230])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4k7A-002ZBx-MW; Fri, 24 Jun 2022 14:16:55 +0000
Received: from mail (mail.baikal.int [192.168.51.25])
	by mail.baikalelectronics.com (Postfix) with ESMTP id E54E616C6;
	Fri, 24 Jun 2022 17:17:48 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.baikalelectronics.com E54E616C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=baikalelectronics.ru; s=mail; t=1656080268;
	bh=dQq5OIsnVRth+sqzHkFlLdBrOb42QdxbS+CEp9Nsxcw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=KeUXpB9bEA0u9yM7Z2Ev9snyCvK8y8lKnsRCFAiWur9+aSzfP+/uMp/3F131g9uAe
	 XVxjrqtrh9QIemz8UmkQzuU1Me9/FA1UrMTniWYthPE9bA32Rz8BOvbJd1r5dPwOI4
	 fT7ClKUUCylTGTFzMfmnQ+QUFVJ9Fdlh0dDLEdpM=
Received: from localhost (192.168.53.207) by mail (192.168.51.25) with
 Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 24 Jun 2022 17:16:29 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson
	<bjorn.andersson@linaro.org>, Felipe Balbi <balbi@kernel.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Vladimir Zapolskiy <vz@mleia.com>, Alexey
 Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>, Rob
 Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski
	<krzk@kernel.org>, <linux-usb@vger.kernel.org>, Khuong Dinh
	<khuong@os.amperecomputing.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: Serge Semin <Sergey.Semin@baikalelectronics.ru>, Serge Semin
	<fancer.lancer@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-snps-arc@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND v9 5/5] arm64: dts: apm: Harmonize DWC USB3 DT nodes name
Date: Fri, 24 Jun 2022 17:16:21 +0300
Message-ID: <20220624141622.7149-6-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_071653_127396_537BB1BC 
X-CRM114-Status: GOOD (  11.19  )
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

In accordance with the DWC USB3 bindings the corresponding node
name is suppose to comply with the Generic USB HCD DT schema, which
requires the USB nodes to have the name acceptable by the regexp:
"^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
named despite of the warning comment about possible backward
compatibility issues.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi | 4 ++--
 arch/arm64/boot/dts/apm/apm-storm.dtsi     | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
index a83c82c50e29..832dd85b00bd 100644
--- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
@@ -597,8 +597,8 @@ serial0: serial@10600000 {
 			interrupts = <0x0 0x4c 0x4>;
 		};
 
-		/* Do not change dwusb name, coded for backward compatibility */
-		usb0: dwusb@19000000 {
+		/* Node-name might need to be coded as dwusb for backward compatibility */
+		usb0: usb@19000000 {
 			status = "disabled";
 			compatible = "snps,dwc3";
 			reg =  <0x0 0x19000000 0x0 0x100000>;
diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index 0f37e77f5459..1520a945b7f9 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -923,8 +923,8 @@ sata3: sata@1a800000 {
 			phy-names = "sata-phy";
 		};
 
-		/* Do not change dwusb name, coded for backward compatibility */
-		usb0: dwusb@19000000 {
+		/* Node-name might need to be coded as dwusb for backward compatibility */
+		usb0: usb@19000000 {
 			status = "disabled";
 			compatible = "snps,dwc3";
 			reg =  <0x0 0x19000000 0x0 0x100000>;
@@ -933,7 +933,7 @@ usb0: dwusb@19000000 {
 			dr_mode = "host";
 		};
 
-		usb1: dwusb@19800000 {
+		usb1: usb@19800000 {
 			status = "disabled";
 			compatible = "snps,dwc3";
 			reg =  <0x0 0x19800000 0x0 0x100000>;
-- 
2.35.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
