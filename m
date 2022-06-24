Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE92C43334
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Jun 2022 14:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ln2PZkjTSVUZjYX5YqZ+2ISsdTNdqXpQbzfXQ8UkRq0=; b=TusuGL//Z49jrD
	wxWTt4e6OlzCQ2miAmE0P2NlFdKfla1W6LuJCi0KB0/wF6DhJKoJvf2QYtgGfONf75/42usxnUzFp
	xU2dvLhuz1HZ/P+nCA6Pov22ONsNfpDI4F70rfcfX1HSuh5hjkvPbeOXXTIw0sx4b6HCmqlAs+jLK
	ARUq2cMg3+Ye4U0+SN4HPUDbpNk9VIyaBamXfGgwwjiI5lP6zfeTfXEqlSaqTMQawN8TB6WbtGWjZ
	5DHgXIa5ujyNFcmHNwm6OsnAEdvHBLgL+PNGNhNieAaGlzqDYhg6dqHcMirnT6XtNwQZb3yVMySMJ
	x/+csrfexU5LsjhS0btQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4k7V-002ZJ7-EH; Fri, 24 Jun 2022 14:17:13 +0000
Received: from mail.baikalelectronics.com ([87.245.175.230])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4k71-002Z9v-7w; Fri, 24 Jun 2022 14:16:44 +0000
Received: from mail (mail.baikal.int [192.168.51.25])
	by mail.baikalelectronics.com (Postfix) with ESMTP id E3DCF16C2;
	Fri, 24 Jun 2022 17:17:46 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.baikalelectronics.com E3DCF16C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=baikalelectronics.ru; s=mail; t=1656080266;
	bh=k9bAgIwAU1eSDSAOvId6WLyM2VAwff02HhIivmyRPvg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=Klm+jqAmLdOp9klTxYxXrTP5VcPkIzyufPE5vJFG6uL3wCDvPEN3vkUbtaSkhwVoT
	 dzkX2E4xmoqPg49FF4c+4uqO2mFTzt3Je0C8ryrbUOVqtBB9gmzzggYfe36Mh0y7Rk
	 5nXJ3UOUh81ockly/RGDK0tfAy98jfiGaF59MmFI=
Received: from localhost (192.168.53.207) by mail (192.168.51.25) with
 Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 24 Jun 2022 17:16:27 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson
	<bjorn.andersson@linaro.org>, Felipe Balbi <balbi@kernel.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Vladimir Zapolskiy <vz@mleia.com>, Alexey
 Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>, Rob
 Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski
	<krzk@kernel.org>, <linux-usb@vger.kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: Serge Semin <Sergey.Semin@baikalelectronics.ru>, Serge Semin
	<fancer.lancer@gmail.com>, Khuong Dinh <khuong@os.amperecomputing.com>,
	Patrice Chotard <patrice.chotard@st.com>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-snps-arc@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND v9 2/5] arm: dts: lpc18xx: Harmonize EHCI/OHCI DT nodes name
Date: Fri, 24 Jun 2022 17:16:18 +0300
Message-ID: <20220624141622.7149-3-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_071643_505567_9F9D71D3 
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

In accordance with the Generic EHCI/OHCI bindings the corresponding node
name is suppose to comply with the Generic USB HCD DT schema, which
requires the USB nodes to have the name acceptable by the regexp:
"^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
nodes are correctly named.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Acked-by: Vladimir Zapolskiy <vz@mleia.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/lpc18xx.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/lpc18xx.dtsi b/arch/arm/boot/dts/lpc18xx.dtsi
index 10b8249b8ab6..82ffd7b0ad8a 100644
--- a/arch/arm/boot/dts/lpc18xx.dtsi
+++ b/arch/arm/boot/dts/lpc18xx.dtsi
@@ -121,7 +121,7 @@ mmcsd: mmcsd@40004000 {
 			status = "disabled";
 		};
 
-		usb0: ehci@40006100 {
+		usb0: usb@40006100 {
 			compatible = "nxp,lpc1850-ehci", "generic-ehci";
 			reg = <0x40006100 0x100>;
 			interrupts = <8>;
@@ -133,7 +133,7 @@ usb0: ehci@40006100 {
 			status = "disabled";
 		};
 
-		usb1: ehci@40007100 {
+		usb1: usb@40007100 {
 			compatible = "nxp,lpc1850-ehci", "generic-ehci";
 			reg = <0x40007100 0x100>;
 			interrupts = <9>;
-- 
2.35.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
