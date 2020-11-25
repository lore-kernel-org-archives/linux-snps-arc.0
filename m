Return-Path: <SRS0=zEZc=E7=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A7DBC5519F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 25 Nov 2020 08:32:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF60A20857
	for <linux-snps-arc@archiver.kernel.org>; Wed, 25 Nov 2020 08:32:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rTAeJlb+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF60A20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O5hck1BUbYlwnWU/fVLPPS+ILcyWQ1bsjmHFQAS25cw=; b=rTAeJlb+rlmrC8SSCEFSpWE/M
	x+lYp0VHwDvBAW9z4A5kQpiJJUpeXdhVEtOxIuHGiTgQl4PbI6alZs4YwAoXpXAgY5fqFTrCMAPan
	xRPApVFGJcwYE387BBXcPbxnNej3AVbnswpDCwYOwfQ/t73tpfCm24LvKfMxeurPORUbdtSQN9L6Y
	0ZuixZQQhrhjFOtL7EMBOTYqqMSVvwOe6A9EVfgfRh+OJxPCjfuFY3OB7m4eeYZQThSm6/J52yIHV
	s8PXz8+fRMoP7XG34+OVmJELn8iaWPwgZ01On6QBCCXi0lCN2QnDrNjPV5N2En1Jem3bCXYVMhecz
	kWAcpqkDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khqDj-0004jk-VJ; Wed, 25 Nov 2020 08:32:12 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khqDe-0004ih-R4; Wed, 25 Nov 2020 08:32:07 +0000
Date: Wed, 25 Nov 2020 11:32:02 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 10/18] dt-bindings: usb: Convert DWC USB3 bindings to
 DT schema
Message-ID: <20201125083202.ytoyd62bg3s7kvvg@mobilestation>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
 <20201111090853.14112-11-Sergey.Semin@baikalelectronics.ru>
 <20201111201423.GA1938179@bogus>
 <20201112102946.ipcsiidty4ut4kap@mobilestation>
 <20201121124228.GA2039998@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201121124228.GA2039998@robh.at.kernel.org>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_033207_172783_4FA834BB 
X-CRM114-Status: GOOD (  38.61  )
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
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Manu Gautam <mgautam@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sat, Nov 21, 2020 at 06:42:28AM -0600, Rob Herring wrote:
> On Thu, Nov 12, 2020 at 01:29:46PM +0300, Serge Semin wrote:
> > On Wed, Nov 11, 2020 at 02:14:23PM -0600, Rob Herring wrote:
> > > On Wed, Nov 11, 2020 at 12:08:45PM +0300, Serge Semin wrote:
> > > > DWC USB3 DT node is supposed to be compliant with the Generic xHCI
> > > > Controller schema, but with additional vendor-specific properties, the
> > > > controller-specific reference clocks and PHYs. So let's convert the
> > > > currently available legacy text-based DWC USB3 bindings to the DT schema
> > > > and make sure the DWC USB3 nodes are also validated against the
> > > > usb-xhci.yaml schema.
> > > > 
> > > > Note we have to discard the nodename restriction of being prefixed with
> > > > "dwc3@" string, since in accordance with the usb-hcd.yaml schema USB nodes
> > > > are supposed to be named as "^usb(@.*)".
> > > > 
> > > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > > 
> > > > ---
> > > > 
> > > > Changelog v2:
> > > > - Discard '|' from the descriptions, since we don't need to preserve
> > > >   the text formatting in any of them.
> > > > - Drop quotes from around the string constants.
> > > > - Fix the "clock-names" prop description to be referring the enumerated
> > > >   clock-names instead of the ones from the Databook.
> > > > 
> > > > Changelog v3:
> > > > - Apply usb-xhci.yaml# schema only if the controller is supposed to work
> > > >   as either host or otg.
> > > > 
> > > > Changelog v4:
> > > > - Apply usb-drd.yaml schema first. If the controller is configured
> > > >   to work in a gadget mode only, then apply the usb.yaml schema too,
> > > >   otherwise apply the usb-xhci.yaml schema.
> > > > - Discard the Rob'es Reviewed-by tag. Please review the patch one more
> > > >   time.
> > > > ---
> > > >  .../devicetree/bindings/usb/dwc3.txt          | 125 --------
> > > >  .../devicetree/bindings/usb/snps,dwc3.yaml    | 303 ++++++++++++++++++
> > > >  2 files changed, 303 insertions(+), 125 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> 
> 
> > > > diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > > > new file mode 100644
> > > > index 000000000000..079617891da6
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > > > @@ -0,0 +1,303 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Synopsys DesignWare USB3 Controller
> > > > +
> > > > +maintainers:
> > > > +  - Felipe Balbi <balbi@kernel.org>
> > > > +
> > > > +description:
> > > > +  This is usually a subnode to DWC3 glue to which it is connected, but can also
> > > > +  be presented as a standalone DT node with an optional vendor-specific
> > > > +  compatible string.
> > > > +
> > 
> > > > +allOf:
> > > > +  - $ref: usb-drd.yaml#
> > > > +  - if:
> > > > +      properties:
> > > > +        dr_mode:
> > > > +          const: peripheral
> 

> Another thing, this evaluates to true if dr_mode is not present. You 
> need to add 'required'?

Right. Will something like this do that?

+ allOf:
+  - $ref: usb-drd.yaml#
+  - if:
+      properties:
+        dr_mode:
+          const: peripheral
+ 
+      required:
+        - dr_mode
+    then:
+      $ref: usb.yaml#
+    else
+      $ref: usb-xhci.yaml#

> If dr_mode is otg, then don't you need to apply 
> both usb.yaml and usb-xhci.yaml?

No I don't. Since there is no peripheral-specific DT schema, then the
only schema any USB-gadget node needs to pass is usb.yaml, which
is already included into the usb-xhci.yaml schema. So for pure OTG devices
with xHCI host and gadget capabilities it's enough to evaluate: allOf:
[$ref: usb-drd.yaml#, $ref: usb-xhci.yaml#].  Please see the
sketch/ASCII-figure below and the following text for details.

-Sergey

> 
> > > > +    then:
> > > > +      $ref: usb.yaml#
> > > 
> > > This part could be done in usb-drd.yaml?
> > 
> > Originally I was thinking about that, but then in order to minimize
> > the properties validation I've decided to split the properties in
> > accordance with the USB controllers functionality:
> > 
> >             +----- USB Gadget/Peripheral Controller. There is no
> >             |      specific schema for the gadgets since there is no
> >             |      common gadget properties (at least I failed to find
> >             |      ones). So the pure gadget controllers need to be
> >             |      validated just against usb.yaml schema.
> >             |
> > usb.yaml <--+-- usb-hcd.yaml - Generic USB Host Controller. The schema
> >                 ^              turns out to include the OHCI/UHCI/EHCI
> >                 |              properties, which AFAICS are also
> >                 |              applicable for the other host controllers.
> >                 |              So any USB host controller node needs to
> >                 |              be validated against this schema.
> >                 |
> >                 +- usb-xhci.yaml - Generic xHCI Host controller.
> > 
> > usb-drd.yaml -- USB Dual-Role/OTG Controllers. It describes the
> >                 DRD/OTG-specific properties and nothing else. So normally
> >                 it should be applied together with one of the
> >                 schemas described above.
> > 
> > So the use-cases of the suggested schemas is following:
> > 
> > 1) USB Controller is pure gadget? Then:
> >    + allOf:
> >    +  - $ref: usb.yaml#
> > 2) USB Controller is pure USB host (including OHCI/UHCI/EHCI)?
> >    + allOf:
> >    +   - $ref: usb-hcd.yaml#
> >    Note this prevents us from fixing all the currently available USB DT
> >    schemas, which already apply the usb-hcd.yaml schema.
> > 3) USB Controller is pure xHCI host controller? Then:
> >    + allOf:
> >    +   - $ref: usb-xhci.yaml#
> > 4) USB Controller is Dual-Role/OTG controller with USB 2.0 host? Then:
> >    + allOf:
> >    +   - $ref: usb-drd.yaml#
> >    +   - $ref: usb-hcd.yaml#
> > 5) USB Controller is Dual-Role/OTG controller with xHCI host? Then:
> >    + allOf:
> >    +   - $ref: usb-drd.yaml#
> >    +   - $ref: usb-xhci.yaml#
> > 6) USB Controller is Dual-Role/OTG controller which can only be a
> >    gadget? Then:
> >    + allOf:
> >    +   - $ref: usb-drd.yaml#
> >    +   - $ref: usb.yaml#
> > 
> > * Don't know really if controllers like in 6)-th really exist. Most
> > * likely they are still internally capable of dual-roling, but due to
> > * some conditions can be used as gadgets only.
> > 
> > It looks a bit complicated, but at least by having such design we'd minimize
> > the number of properties validation.
> > 

[...]

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
