Return-Path: <SRS0=5Nd8=ER=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D728C56202
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Nov 2020 09:34:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C0E820759
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Nov 2020 09:34:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nkE2qNba";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sdXPT9uf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C0E820759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KxOfeUfrEjC/qtwQ60d8wLobbBsubaDjxfvwxWcN59M=; b=nkE2qNba95cBMe3j7L307CJ66
	MRZeEy9AM1TGTKyrsuqTizQQbglpyjPiCDapqRVqLTFGRn08938kGjB0rzTksWU6qucR0d6RXv6P0
	+fxFiXEwbqn7Em9dKr+wZcMN1kfzGxJBJKc5UdsXnrQSD2RiPQtS7bcChMntGdAZ5VzPhb6iX3A4M
	7vMjCFVTTBlIV6WZRbPvAIX2PBPmkny02crA7uX7z2ceRC5I1DIrB+831n5gtneE4CR8XmHwwi8xP
	xTvcDQiNeQ4K0uwgmDl/0A6bwaSYYQhVx98tBA92zkf04lSH4ahVEII3G7HcQ4Kfozq4Y4J9A3djH
	GChnB+LeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcmWM-0005ZU-KI; Wed, 11 Nov 2020 09:34:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcmWH-0005Xr-Ap; Wed, 11 Nov 2020 09:34:26 +0000
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6FF30207BB;
 Wed, 11 Nov 2020 09:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605087263;
 bh=W9LKJJA9td+bZqyMuy9lW4F+N9UwVvkc4npiuY6/nL8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sdXPT9ufwr9fVZcL/j8i0rSkPmF0K8kpJ0B3ps32DH54CpwRWCpudFmVohdzuLLqI
 mHImJstvBqkfY7Bv9QjqAwcj6zjhETFN9xiOuLzk89U/QDTQzxtFAaQVcY7piZs788
 ANoy8zWl2BQ66ujk5xvfZlBDd0yTXXNHLJG4NJKQ=
Received: by mail-oi1-f178.google.com with SMTP id w188so1516010oib.1;
 Wed, 11 Nov 2020 01:34:23 -0800 (PST)
X-Gm-Message-State: AOAM533oPF8z2J7TINZBH8i7jMHp/iQgRVov2ef9RUxEoGQTNWhDvh1h
 88TZDiu3scvPvqcx9BKnsQgRMeKa/sbXFzH8LYs=
X-Google-Smtp-Source: ABdhPJxSx93RRc8sf7gftr2sW8DQOQItwMQjHP/P+aqjoIbJAaovKFXVmGh+T6eO80PhsSh1WpQNCpdbCpErwfeE5Gs=
X-Received: by 2002:aca:6004:: with SMTP id u4mr1701769oib.8.1605087262641;
 Wed, 11 Nov 2020 01:34:22 -0800 (PST)
MIME-Version: 1.0
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
 <20201111090853.14112-11-Sergey.Semin@baikalelectronics.ru>
 <20201111091628.GC4050@kozik-lap>
 <20201111093213.gio6mrowjvmvnzoi@mobilestation>
In-Reply-To: <20201111093213.gio6mrowjvmvnzoi@mobilestation>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 11 Nov 2020 10:34:10 +0100
X-Gmail-Original-Message-ID: <CAJKOXPcYQjNvuyxYFn3f=YV+P+xSj=5tJckH8w8GgE=rMbeE6w@mail.gmail.com>
Message-ID: <CAJKOXPcYQjNvuyxYFn3f=YV+P+xSj=5tJckH8w8GgE=rMbeE6w@mail.gmail.com>
Subject: Re: [PATCH v4 10/18] dt-bindings: usb: Convert DWC USB3 bindings to
 DT schema
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_043425_555661_AE260EF5 
X-CRM114-Status: GOOD (  36.50  )
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
 Serge Semin <fancer.lancer@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Manu Gautam <mgautam@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, 11 Nov 2020 at 10:32, Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> On Wed, Nov 11, 2020 at 10:16:28AM +0100, Krzysztof Kozlowski wrote:
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
> > >
> > > diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> > > deleted file mode 100644
> > > index d03edf9d3935..000000000000
> > > --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> > > +++ /dev/null
> > > @@ -1,125 +0,0 @@
> > > -synopsys DWC3 CORE
> > > -
> > > -DWC3- USB3 CONTROLLER. Complies to the generic USB binding properties
> > > -      as described in 'usb/generic.txt'
> > > -
> > > -Required properties:
> > > - - compatible: must be "snps,dwc3"
> > > - - reg : Address and length of the register set for the device
> > > - - interrupts: Interrupts used by the dwc3 controller.
>
> > > - - clock-names: list of clock names. Ideally should be "ref",
> > > -                "bus_early", "suspend" but may be less or more.
> > > - - clocks: list of phandle and clock specifier pairs corresponding to
> > > -           entries in the clock-names property.
> > > -
> > > -Exception for clocks:
> > > -  clocks are optional if the parent node (i.e. glue-layer) is compatible to
> > > -  one of the following:
> > > -    "cavium,octeon-7130-usb-uctl"
> > > -    "qcom,dwc3"
> > > -    "samsung,exynos5250-dwusb3"
> > > -    "samsung,exynos5433-dwusb3"
> > > -    "samsung,exynos7-dwusb3"
> > > -    "sprd,sc9860-dwc3"
> > > -    "st,stih407-dwc3"
> > > -    "ti,am437x-dwc3"
> > > -    "ti,dwc3"
> > > -    "ti,keystone-dwc3"
> > > -    "rockchip,rk3399-dwc3"
> > > -    "xlnx,zynqmp-dwc3"
> >
> > What happened with this part of dtschema? It sees you removed it.
>
> You meant "bindings", right?
>
> I don't think it's a good idea to implement that weak binding in the
> generic DWC USB3 DT schema. Of course I could have created it under
> the allOf conditional schema and stuff. But in that case we would have
> needed to support the clock-related vendor-specific peculiarities in
> both the generic DWC USB3 DT schema and in the vendor-specific binding
> files. That wouldn't be that maintainable. As I see it all the
> vendor-specific clock requirements should be reflected in the
> glue-node DT schema. The DWC USB3 node binding just declares the
> clocks as optional. Moreover the DWC USB3 driver also considers them
> as optional.

Sure, rationale is good, but it needs to be explained in commit msg.
Otherwise you state that you just "convert" but it's not a simple
conversion. The meaning is changed.


Best regards,
Krzysztof

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
