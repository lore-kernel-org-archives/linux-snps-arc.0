Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A86DC43334
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Jun 2022 14:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0gOjW2PUx8Cee0S4IcKzXyK6Sg/m9dR2gNZDjWnaKb0=; b=0n/uj5UuW4ujiL
	WnS5lPJMe4gK509FbQ1Gbc8oq4aXjNmantz4XbquQR8fzvrxv1z8KzzsfYJ2Vk8XPYaRH1Z0nss7Y
	oiizPum81SoeesmcruAfTV2WFJr5Oeli1sRftuqnXTO/vbGZKThl6PhyM2V85oDss2Tz5xQcIADup
	p9tqiUJ3KZirKx7JkbQUZVHyMInPMX4ZOjfzKGd0L1kG4BOWcEx5Aa0arE+AACpIgLgvD3GtjQMeG
	/p8jiM8IvINwY8GGRofTriRD8JuRIbZ/nNGSRzUlz2D/tHfLVY4GYbtSItmgkSfr9S+XNzZm8lBo1
	XE5VBAtyYIbIxmgG7+/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4k7x-002ZVn-FY; Fri, 24 Jun 2022 14:17:41 +0000
Received: from mail.baikalelectronics.com ([87.245.175.230])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4k78-002ZBx-Np; Fri, 24 Jun 2022 14:16:52 +0000
Received: from mail (mail.baikal.int [192.168.51.25])
	by mail.baikalelectronics.com (Postfix) with ESMTP id 2CA7216C4;
	Fri, 24 Jun 2022 17:17:48 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.baikalelectronics.com 2CA7216C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=baikalelectronics.ru; s=mail; t=1656080268;
	bh=kDuuhLvgWjwCl2RDg/HQ/klWnKI9hNFxtPsc1NN2N1I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=brJscAwWCIlrNbG8lE0uiLSq9rStHDmfsZCrEEjOeeFTYQgm1NYf2JvL7PegwhbR6
	 oIioDC5oh7ZHvPLrgu823ZwI5mx6sL8OjIl+GwcG4R4aInfAKDC+2JpnxVfUpXqDol
	 dk6tsEgXLGLIv1+O2zvZI5jxtCktmqpDxUOnfOFU=
Received: from localhost (192.168.53.207) by mail (192.168.51.25) with
 Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 24 Jun 2022 17:16:28 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson
	<bjorn.andersson@linaro.org>, Felipe Balbi <balbi@kernel.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Vladimir Zapolskiy <vz@mleia.com>, Alexey
 Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>, Rob
 Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski
	<krzk@kernel.org>, <linux-usb@vger.kernel.org>, Patrice Chotard
	<patrice.chotard@foss.st.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: Serge Semin <Sergey.Semin@baikalelectronics.ru>, Serge Semin
	<fancer.lancer@gmail.com>, Khuong Dinh <khuong@os.amperecomputing.com>,
	Patrice Chotard <patrice.chotard@st.com>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-snps-arc@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND v9 4/5] arm: dts: stih407-family: Harmonize DWC USB3 DT nodes name
Date: Fri, 24 Jun 2022 17:16:20 +0300
Message-ID: <20220624141622.7149-5-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_071651_015803_887205D1 
X-CRM114-Status: UNSURE (   9.36  )
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

In accordance with the DWC USB3 bindings the corresponding node
name is suppose to comply with the Generic USB HCD DT schema, which
requires the USB nodes to have the name acceptable by the regexp:
"^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
named.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
---
 arch/arm/boot/dts/stih407-family.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 1713f7878117..7ba528315dbe 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -725,7 +725,7 @@ st_dwc3: dwc3@8f94000 {
 
 			status = "disabled";
 
-			dwc3: dwc3@9900000 {
+			dwc3: usb@9900000 {
 				compatible	= "snps,dwc3";
 				reg		= <0x09900000 0x100000>;
 				interrupts	= <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.35.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
