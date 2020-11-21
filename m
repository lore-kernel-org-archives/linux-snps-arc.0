Return-Path: <SRS0=1K/0=E4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1D2C56202
	for <linux-snps-arc@archiver.kernel.org>; Sun, 22 Nov 2020 00:10:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20CD520731
	for <linux-snps-arc@archiver.kernel.org>; Sun, 22 Nov 2020 00:10:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YIUoERuE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20CD520731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WCRnfCLhgMMPmTFwtJXy7saHeWtCb0/W20/Q9uYZ0/E=; b=YIUoERuEXx5f8FarPj8lhPwNT
	YMpg0ZAtvMt9G1II2eNO8kh0WCx8dOdrayycSbNfQcCulrh5/hjos6yp74SuuOJrAK1qsh2th5afc
	S7geK8gxLjdQeWvMskQ97lUBj1kNz3OtjqBpn7UukTad+AwSpt3LvqTG9mqtqHOn4aDsZmlf5ow9j
	P55hkQXNXhem31TxFdPgSYj3ljt69aBSzptvfglrC3KI8UUVjW7ArDwy4tthKNgmyYxlH1OXj7zv2
	s/NTbUS5D6N15d8MShmAe+8zDnDpIT5K+Yjm3Iv7oBkXzbpmoSMQWqOroqADaDz8NmLl3UpZrEpao
	ttHvay6Jg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgcxa-0001cM-CS; Sun, 22 Nov 2020 00:10:30 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgcxU-0001bC-4P; Sun, 22 Nov 2020 00:10:26 +0000
Received: by mail-oi1-f193.google.com with SMTP id c80so15325210oib.2;
 Sat, 21 Nov 2020 16:10:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LXozwdRHE+FZ/b1kx40K82ndXVnop5+OHYheS/QS4jo=;
 b=STKLa6b4MPovc9Ukuni8jGLMzMdztZB2zlKIB0m55jk5EJQxpLeSCKaP6+nIFcyCKN
 UK4x+zgLAAFpvvAN21r3u6A+oQ9s0eU9C/jH9a7JvcrHiMVgpNg6/98ICrhv7aBwE44c
 NmzPdnZXGEEympS2X8QYlJwU16+pxNaX40NbnmkkJ3UfcWIcm+Qcp75Vt4exCot1X4VU
 BuxhNgiz8fAxS1+sWb4p5N4aa6VNh6HhSW2AoOXaiIxBpC7EV3+mkpY4JafEpGXgRZTg
 oLDj/kkBQBc4YfyFkm9S4oi4GXR6oo7cqpLt5pYiOZRs0Jh6btV5imfIGeLz7HlBUPd2
 eSeQ==
X-Gm-Message-State: AOAM532iIZ5lgR0EdGszJ5S1xcs+Jnuxed2P+X4aKiocxOOxo3U9s/ib
 n1OWld30gN+JyuwVonLLex36F2pJIg==
X-Google-Smtp-Source: ABdhPJyZmtH8yI4iwnUoY7nWj64qFOXfpNj0wrhnUYk0B6zYwkPCqh8WJqMVW1w4lXiO0MnHEnfvKg==
X-Received: by 2002:a54:4394:: with SMTP id u20mr3639506oiv.70.1605962557518; 
 Sat, 21 Nov 2020 04:42:37 -0800 (PST)
Received: from xps15 ([2607:fb90:5feb:6270:cdf7:680e:59f2:6ccd])
 by smtp.gmail.com with ESMTPSA id u4sm1581412ote.71.2020.11.21.04.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 04:42:36 -0800 (PST)
Received: (nullmailer pid 2064982 invoked by uid 1000);
 Sat, 21 Nov 2020 12:42:28 -0000
Date: Sat, 21 Nov 2020 06:42:28 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v4 10/18] dt-bindings: usb: Convert DWC USB3 bindings to
 DT schema
Message-ID: <20201121124228.GA2039998@robh.at.kernel.org>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
 <20201111090853.14112-11-Sergey.Semin@baikalelectronics.ru>
 <20201111201423.GA1938179@bogus>
 <20201112102946.ipcsiidty4ut4kap@mobilestation>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112102946.ipcsiidty4ut4kap@mobilestation>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_191024_223506_67187EF4 
X-CRM114-Status: GOOD (  48.84  )
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

On Thu, Nov 12, 2020 at 01:29:46PM +0300, Serge Semin wrote:
> On Wed, Nov 11, 2020 at 02:14:23PM -0600, Rob Herring wrote:
> > On Wed, Nov 11, 2020 at 12:08:45PM +0300, Serge Semin wrote:
> > > DWC USB3 DT node is supposed to be compliant with the Generic xHCI
> > > Controller schema, but with additional vendor-specific properties, the
> > > controller-specific reference clocks and PHYs. So let's convert the
> > > currently available legacy text-based DWC USB3 bindings to the DT schema
> > > and make sure the DWC USB3 nodes are also validated against the
> > > usb-xhci.yaml schema.
> > > 
> > > Note we have to discard the nodename restriction of being prefixed with
> > > "dwc3@" string, since in accordance with the usb-hcd.yaml schema USB nodes
> > > are supposed to be named as "^usb(@.*)".
> > > 
> > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > 
> > > ---
> > > 
> > > Changelog v2:
> > > - Discard '|' from the descriptions, since we don't need to preserve
> > >   the text formatting in any of them.
> > > - Drop quotes from around the string constants.
> > > - Fix the "clock-names" prop description to be referring the enumerated
> > >   clock-names instead of the ones from the Databook.
> > > 
> > > Changelog v3:
> > > - Apply usb-xhci.yaml# schema only if the controller is supposed to work
> > >   as either host or otg.
> > > 
> > > Changelog v4:
> > > - Apply usb-drd.yaml schema first. If the controller is configured
> > >   to work in a gadget mode only, then apply the usb.yaml schema too,
> > >   otherwise apply the usb-xhci.yaml schema.
> > > - Discard the Rob'es Reviewed-by tag. Please review the patch one more
> > >   time.
> > > ---
> > >  .../devicetree/bindings/usb/dwc3.txt          | 125 --------
> > >  .../devicetree/bindings/usb/snps,dwc3.yaml    | 303 ++++++++++++++++++
> > >  2 files changed, 303 insertions(+), 125 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
> > >  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml


> > > diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > > new file mode 100644
> > > index 000000000000..079617891da6
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > > @@ -0,0 +1,303 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Synopsys DesignWare USB3 Controller
> > > +
> > > +maintainers:
> > > +  - Felipe Balbi <balbi@kernel.org>
> > > +
> > > +description:
> > > +  This is usually a subnode to DWC3 glue to which it is connected, but can also
> > > +  be presented as a standalone DT node with an optional vendor-specific
> > > +  compatible string.
> > > +
> 
> > > +allOf:
> > > +  - $ref: usb-drd.yaml#
> > > +  - if:
> > > +      properties:
> > > +        dr_mode:
> > > +          const: peripheral

Another thing, this evaluates to true if dr_mode is not present. You 
need to add 'required'? If dr_mode is otg, then don't you need to apply 
both usb.yaml and usb-xhci.yaml?

> > > +    then:
> > > +      $ref: usb.yaml#
> > 
> > This part could be done in usb-drd.yaml?
> 
> Originally I was thinking about that, but then in order to minimize
> the properties validation I've decided to split the properties in
> accordance with the USB controllers functionality:
> 
>             +----- USB Gadget/Peripheral Controller. There is no
>             |      specific schema for the gadgets since there is no
>             |      common gadget properties (at least I failed to find
>             |      ones). So the pure gadget controllers need to be
>             |      validated just against usb.yaml schema.
>             |
> usb.yaml <--+-- usb-hcd.yaml - Generic USB Host Controller. The schema
>                 ^              turns out to include the OHCI/UHCI/EHCI
>                 |              properties, which AFAICS are also
>                 |              applicable for the other host controllers.
>                 |              So any USB host controller node needs to
>                 |              be validated against this schema.
>                 |
>                 +- usb-xhci.yaml - Generic xHCI Host controller.
> 
> usb-drd.yaml -- USB Dual-Role/OTG Controllers. It describes the
>                 DRD/OTG-specific properties and nothing else. So normally
>                 it should be applied together with one of the
>                 schemas described above.
> 
> So the use-cases of the suggested schemas is following:
> 
> 1) USB Controller is pure gadget? Then:
>    + allOf:
>    +  - $ref: usb.yaml#
> 2) USB Controller is pure USB host (including OHCI/UHCI/EHCI)?
>    + allOf:
>    +   - $ref: usb-hcd.yaml#
>    Note this prevents us from fixing all the currently available USB DT
>    schemas, which already apply the usb-hcd.yaml schema.
> 3) USB Controller is pure xHCI host controller? Then:
>    + allOf:
>    +   - $ref: usb-xhci.yaml#
> 4) USB Controller is Dual-Role/OTG controller with USB 2.0 host? Then:
>    + allOf:
>    +   - $ref: usb-drd.yaml#
>    +   - $ref: usb-hcd.yaml#
> 5) USB Controller is Dual-Role/OTG controller with xHCI host? Then:
>    + allOf:
>    +   - $ref: usb-drd.yaml#
>    +   - $ref: usb-xhci.yaml#
> 6) USB Controller is Dual-Role/OTG controller which can only be a
>    gadget? Then:
>    + allOf:
>    +   - $ref: usb-drd.yaml#
>    +   - $ref: usb.yaml#
> 
> * Don't know really if controllers like in 6)-th really exist. Most
> * likely they are still internally capable of dual-roling, but due to
> * some conditions can be used as gadgets only.
> 
> It looks a bit complicated, but at least by having such design we'd minimize
> the number of properties validation.
> 
> Alternatively we could implement a hierarchy like this (as you, Rob,
> suggested in the comment above): 
> 
>             +-- USB Gadget/Peripheral Controller
>             |
>             +-- usb-drd.yaml - USB Dual-Role/OTG Controllers
>             |   
> usb.yaml <--+-- usb-dcd.yaml - Generic USB Host Controller
>                 ^
>                 |
>                 +- usb-xhci.yaml - Generic xHCI Host controller
> 
> But, for instance, if we got to have an OTG controller with USB 2.0
> host capability, the schema would have needed to be validated as
> described in 4) in the list above. That would have caused the usb.yaml
> schema validation twice.
> 
> Of course I could have missed or misunderstood something. So any
> suggestion, any help with making things easier would be very
> appreciated. I asked Greg what he was thinking in this matter in
> the previous patchset thread, but he didn't respond.
> 
> > 
> > > +    else:
> > > +      $ref: usb-xhci.yaml#
> > 
> > I'd really prefer if all the schema can just be applied unconditionally. 
> > Shouldn't someone (like a bootloader) be able to change dr_mode without 
> > changing anything else to set the mode? That would imply all the 
> > schemas can be applied.
> 
> Theoretically it's possible, but I don't really know whether it can be
> practically met. Of course I fully agree with you and it's preferable to
> simplify the schema by getting rid of the condition if it's possible.
> 
> My point of using the conditional schema here has been based
> on the driver implementation. According to the driver code if OTG mode is
> enabled by means of the dr_mode property, then the controller can work as
> either host or gadget. If either host or gadget mode is enabled in
> the dr_mode property, the mode updating won't be supported. So any
> properties specific to the unsupported mode will be just ignored.
> 
> In addition to that DWC USB3 IP-core can be synthesized with different
> DWC_USB3_MODE parameter value. The controller can be either device
> (gadget), or host, or DRD, or HUB. In that case the dr_mode should be
> set in accordance with that parameter value. It means that the
> DWC USB3 controller will support the features in accordance with the
> selected parameter.
> 
> Should we really bother with all of that? Could we just apply the
> schema like: allOf: [$ref: usb-drd.yaml#, $ref: usb-hcd.yaml#] and
> have the things much easier seeing the host-specific properties aren't
> required anyway? That's the main question. I've decided to bother,
> since it give us a better hardware description. If you think it's better
> to keep things easier, I'll be ok with this. It won't be that
> contradicting to the hardware capabilities after all.

Okay, it's probably better to keep things like you have them given 
there's so many combinations of USB controllers.

Rob

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
