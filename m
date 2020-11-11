Return-Path: <SRS0=5Nd8=ER=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09455C4742C
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Nov 2020 09:32:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86036206CA
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Nov 2020 09:32:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ygcl3HVQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86036206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G/PVSUE9M7w7YKtSAHG2Zw3PUPlVg0KkLknc2/uTEwM=; b=ygcl3HVQNSl5sB0tYg56+GVcj
	71MHpzHRZv87M93S9rm4RZ/N98GglRQWL8Zr0MjB9eiC/zAll2CaReVtpdtndr88y0Fzyvd1WGMrC
	mOxWngTCOgslJ1dBgqTd/sO2xCNwaiEwW4JCwW50j4N24QOyQ3LnHigmkqpL81TS3soxg6XSB2qt3
	WWRNt3Ung0RKg1Ozu0ELJB+JHRCPNSznP7DyNh49IWhYXStsFyIVnwwB+15qHrOkl+zTkTXYQlwDx
	6omx38Mp5lJix1sTzIkPloOCREdd95Z2qPECMWsFA+beBIvgO0mUSTE+YoJo/xU0JrG8y7MuMYVVR
	dxpGIlIPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcmUL-00055U-J6; Wed, 11 Nov 2020 09:32:25 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcmUD-000533-GB; Wed, 11 Nov 2020 09:32:20 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id B0C25803073E;
 Wed, 11 Nov 2020 09:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P3nRDF2DG9k5; Wed, 11 Nov 2020 12:32:16 +0300 (MSK)
Date: Wed, 11 Nov 2020 12:32:13 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 10/18] dt-bindings: usb: Convert DWC USB3 bindings to
 DT schema
Message-ID: <20201111093213.gio6mrowjvmvnzoi@mobilestation>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
 <20201111090853.14112-11-Sergey.Semin@baikalelectronics.ru>
 <20201111091628.GC4050@kozik-lap>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111091628.GC4050@kozik-lap>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_043217_870353_E8370E8C 
X-CRM114-Status: GOOD (  29.16  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Kevin Hilman <khilman@baylibre.com>, Andy Gross <agross@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-snps-arc@lists.infradead.org,
 devicetree@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Manu Gautam <mgautam@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Nov 11, 2020 at 10:16:28AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Nov 11, 2020 at 12:08:45PM +0300, Serge Semin wrote:
> > DWC USB3 DT node is supposed to be compliant with the Generic xHCI
> > Controller schema, but with additional vendor-specific properties, the
> > controller-specific reference clocks and PHYs. So let's convert the
> > currently available legacy text-based DWC USB3 bindings to the DT schema
> > and make sure the DWC USB3 nodes are also validated against the
> > usb-xhci.yaml schema.
> > 
> > Note we have to discard the nodename restriction of being prefixed with
> > "dwc3@" string, since in accordance with the usb-hcd.yaml schema USB nodes
> > are supposed to be named as "^usb(@.*)".
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > ---
> > 
> > Changelog v2:
> > - Discard '|' from the descriptions, since we don't need to preserve
> >   the text formatting in any of them.
> > - Drop quotes from around the string constants.
> > - Fix the "clock-names" prop description to be referring the enumerated
> >   clock-names instead of the ones from the Databook.
> > 
> > Changelog v3:
> > - Apply usb-xhci.yaml# schema only if the controller is supposed to work
> >   as either host or otg.
> > 
> > Changelog v4:
> > - Apply usb-drd.yaml schema first. If the controller is configured
> >   to work in a gadget mode only, then apply the usb.yaml schema too,
> >   otherwise apply the usb-xhci.yaml schema.
> > - Discard the Rob'es Reviewed-by tag. Please review the patch one more
> >   time.
> > ---
> >  .../devicetree/bindings/usb/dwc3.txt          | 125 --------
> >  .../devicetree/bindings/usb/snps,dwc3.yaml    | 303 ++++++++++++++++++
> >  2 files changed, 303 insertions(+), 125 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
> >  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> > deleted file mode 100644
> > index d03edf9d3935..000000000000
> > --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> > +++ /dev/null
> > @@ -1,125 +0,0 @@
> > -synopsys DWC3 CORE
> > -
> > -DWC3- USB3 CONTROLLER. Complies to the generic USB binding properties
> > -      as described in 'usb/generic.txt'
> > -
> > -Required properties:
> > - - compatible: must be "snps,dwc3"
> > - - reg : Address and length of the register set for the device
> > - - interrupts: Interrupts used by the dwc3 controller.

> > - - clock-names: list of clock names. Ideally should be "ref",
> > -                "bus_early", "suspend" but may be less or more.
> > - - clocks: list of phandle and clock specifier pairs corresponding to
> > -           entries in the clock-names property.
> > -
> > -Exception for clocks:
> > -  clocks are optional if the parent node (i.e. glue-layer) is compatible to
> > -  one of the following:
> > -    "cavium,octeon-7130-usb-uctl"
> > -    "qcom,dwc3"
> > -    "samsung,exynos5250-dwusb3"
> > -    "samsung,exynos5433-dwusb3"
> > -    "samsung,exynos7-dwusb3"
> > -    "sprd,sc9860-dwc3"
> > -    "st,stih407-dwc3"
> > -    "ti,am437x-dwc3"
> > -    "ti,dwc3"
> > -    "ti,keystone-dwc3"
> > -    "rockchip,rk3399-dwc3"
> > -    "xlnx,zynqmp-dwc3"
> 
> What happened with this part of dtschema? It sees you removed it.

You meant "bindings", right?

I don't think it's a good idea to implement that weak binding in the
generic DWC USB3 DT schema. Of course I could have created it under
the allOf conditional schema and stuff. But in that case we would have
needed to support the clock-related vendor-specific peculiarities in
both the generic DWC USB3 DT schema and in the vendor-specific binding
files. That wouldn't be that maintainable. As I see it all the
vendor-specific clock requirements should be reflected in the
glue-node DT schema. The DWC USB3 node binding just declares the
clocks as optional. Moreover the DWC USB3 driver also considers them
as optional.

-Sergey

> 
> Best regards,
> Krzysztof

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
