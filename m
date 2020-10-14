Return-Path: <SRS0=Sdks=DV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F03C4363D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 21:23:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC3B822248
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 21:23:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L5mdAYFp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC3B822248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ynK1qSNF4P8eiKwxQXSq1V20K+dl0CCN09EoDLKwP4I=; b=L5mdAYFpta+8MXLOhwgc0eeVn
	rx2Y8cC2l5FpOvMdg+gmT9Pym51tSZELM6g2lHeln3QtQKIStU06POKtJuixXEPJe6m/tegzyiTLr
	SLFF5/CYfBfUagSyy+FNLn0h1lHN4aYXtUEbXAhBOeKBluOLWaC7V8WdCwFS2yO4f6W+aCzDwI87F
	I6qT/Vzd6u/tLzIPK3kl2Kp825MwmyAn3FS2j+Y5xyFvRn//0KsIr3re5c/DdrNVdlkVBOwBElOKh
	Pl+ROK3sIO3BF1mSDUfm5FcX9vAKSdxmWfryKbPpe9xuKWRS0mByPnJycV/TDJJ53S4aolWaN6SPx
	bK/l8c08w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSoEo-00069i-K9; Wed, 14 Oct 2020 21:23:10 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSoEk-00068K-Pb; Wed, 14 Oct 2020 21:23:07 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 12B99803073C;
 Wed, 14 Oct 2020 21:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id inYRWRerfTBc; Thu, 15 Oct 2020 00:23:05 +0300 (MSK)
Date: Thu, 15 Oct 2020 00:22:59 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
Message-ID: <20201014212259.ltckcgz2yrola7za@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
 <878sc8lx0e.fsf@kernel.org>
 <20201014143720.yny3jco5pkb7dr4b@mobilestation>
 <CAL_JsqKNuYS1ojJMCx1whLgynz+cTZ-Hvxn5pEFJc_PUgA1hsg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqKNuYS1ojJMCx1whLgynz+cTZ-Hvxn5pEFJc_PUgA1hsg@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_172307_107715_14FFF7CA 
X-CRM114-Status: GOOD (  20.23  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Linux USB List <linux-usb@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Wei Xu <xuwei5@hisilicon.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Mathias Nyman <mathias.nyman@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Serge Semin <fancer.lancer@gmail.com>, Li Yang <leoyang.li@nxp.com>,
 Manu Gautam <mgautam@codeaurora.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Oct 14, 2020 at 01:35:16PM -0500, Rob Herring wrote:
> On Wed, Oct 14, 2020 at 9:37 AM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> > On Wed, Oct 14, 2020 at 05:09:37PM +0300, Felipe Balbi wrote:
> > >
> > > Hi Serge,
> > >
> > > Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:
> > > > In accordance with the DWC USB3 bindings the corresponding node name is
> > > > suppose to comply with Generic USB HCD DT schema, which requires the USB
> > >
> >
> > > DWC3 is not a simple HDC, though.
> >
> > Yeah, strictly speaking it is equipped with a lot of vendor-specific stuff,
> > which are tuned by the DWC USB3 driver in the kernel. But after that the
> > controller is registered as xhci-hcd device so it's serviced by the xHCI driver,
> > which then registers the HCD device so the corresponding DT node is supposed
> > to be compatible with the next bindings: usb/usb-hcd.yaml, usb/usb-xhci.yaml
> > and usb/snps,dwc3,yaml. I've created the later one so to validate the denoted
> > compatibility.
> >
> > >
> > > > nodes to have the name acceptable by the regexp: "^usb(@.*)?" . But a lot
> > > > of the DWC USB3-compatible nodes defined in the ARM/ARM64 DTS files have
> > > > name as "^dwc3@.*" or "^usb[1-3]@.*" or even "^dwusb@.*", which will cause
> > > > the dtbs_check procedure failure. Let's fix the nodes naming to be
> > > > compatible with the DWC USB3 DT schema to make dtbs_check happy.
> > > >
> > > > Note we don't change the DWC USB3-compatible nodes names of
> > > > arch/arm64/boot/dts/apm/{apm-storm.dtsi,apm-shadowcat.dtsi} since the
> > > > in-source comment says that the nodes name need to be preserved as
> > > > "^dwusb@.*" for some backward compatibility.
> > >
> >
> > > interesting, compatibility with what? Some debugfs files, perhaps? :-)
> >
> > Don't really know.) In my experience the worst type of such compatibility is
> > connected with some bootloader magic, which may add/remove/modify properties
> > to nodes with pre-defined names.
> 

> I seriously doubt anyone is using the APM machines with DT (even ACPI
> is somewhat doubtful). I say change them. Or remove the dts files and
> see what happens. Either way it can always be reverted.

Ok. I'll change them in v3.

-Sergey

> 
> Rob

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
