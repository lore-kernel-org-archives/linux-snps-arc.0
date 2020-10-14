Return-Path: <SRS0=Sdks=DV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE06AC43467
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 18:35:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B0832222A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 18:35:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TtOk4Q/E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nxtl/dHd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B0832222A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VcUOLN1W5qVRzWhVV0EjTHAWInlbCa+SmHjhBXcUX4M=; b=TtOk4Q/EnYlrJOFXi2C2p78X5
	8/9DXr5jbkzMnqOJ2KgqeHfSgloJiZWogyUczE9O1eulGnU4wyJya9MYBDLcpK1bN8sXaepCcfOA9
	doHThpAgxFt6K5hSIWi2p2VE+ObKD4mfvPrIFRHMHF4z2FhPkmBJLfWxp3z0SnFF19lAZjmNeolwj
	JPeiTfZiTohuTHyWiX8+Odg5if0GHna+VIWVvKKAAhrD0ydEdi93aFfrcEwTHuJMELwHkY6VbOyJ7
	f66nMwzvmSN1hxCoMKcI1C0nIA3FVSNjjXWfknDsFFYFlYGVIA6YMHh044b/zwu5iTnqV54TSSV8P
	ijYhvH1yQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSlcc-0005Au-U7; Wed, 14 Oct 2020 18:35:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSlcX-0005AA-Nm; Wed, 14 Oct 2020 18:35:30 +0000
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7DC3522251;
 Wed, 14 Oct 2020 18:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602700528;
 bh=Pda5e4mTtOE+ZlY6hUmRRRDO7I+9vJoYWhBous9Gcls=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Nxtl/dHdZ7CLXkL6MN1be5JT9IYal8nc0AVRMv+RNT4MsDKcXxFcuofFMEpVYHw7W
 4KBtqUuHJYkIGD8nRV/132Jn7FqBJdGy3JK+hWv+xxOCfynCjyVicOkyssuKASvY3K
 bsCu8vHUEQ9sbshtFpv/qUnCX5/ftN2jXsG2wgCE=
Received: by mail-ot1-f48.google.com with SMTP id t15so607555otk.0;
 Wed, 14 Oct 2020 11:35:28 -0700 (PDT)
X-Gm-Message-State: AOAM532SrMvCV0abiQ4+AUyknttxtfPen7RWIuofrjARScky0oiNiNMo
 M6wpM+mb7znpSOI+HnljQbS12OAc/sMMyG7BvQ==
X-Google-Smtp-Source: ABdhPJxmywHYTJ4dMOU2YaRv5iUSZXhICQXEppzBvIlKDcu6yZMwhcqON/hhJlbOheAOzFbJbkRhHRpm3BOL3wbOkQ8=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr18868oti.107.1602700527584;
 Wed, 14 Oct 2020 11:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
 <878sc8lx0e.fsf@kernel.org> <20201014143720.yny3jco5pkb7dr4b@mobilestation>
In-Reply-To: <20201014143720.yny3jco5pkb7dr4b@mobilestation>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 14 Oct 2020 13:35:16 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKNuYS1ojJMCx1whLgynz+cTZ-Hvxn5pEFJc_PUgA1hsg@mail.gmail.com>
Message-ID: <CAL_JsqKNuYS1ojJMCx1whLgynz+cTZ-Hvxn5pEFJc_PUgA1hsg@mail.gmail.com>
Subject: Re: [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_143529_936010_7D95F953 
X-CRM114-Status: GOOD (  22.58  )
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
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Oct 14, 2020 at 9:37 AM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> On Wed, Oct 14, 2020 at 05:09:37PM +0300, Felipe Balbi wrote:
> >
> > Hi Serge,
> >
> > Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:
> > > In accordance with the DWC USB3 bindings the corresponding node name is
> > > suppose to comply with Generic USB HCD DT schema, which requires the USB
> >
>
> > DWC3 is not a simple HDC, though.
>
> Yeah, strictly speaking it is equipped with a lot of vendor-specific stuff,
> which are tuned by the DWC USB3 driver in the kernel. But after that the
> controller is registered as xhci-hcd device so it's serviced by the xHCI driver,
> which then registers the HCD device so the corresponding DT node is supposed
> to be compatible with the next bindings: usb/usb-hcd.yaml, usb/usb-xhci.yaml
> and usb/snps,dwc3,yaml. I've created the later one so to validate the denoted
> compatibility.
>
> >
> > > nodes to have the name acceptable by the regexp: "^usb(@.*)?" . But a lot
> > > of the DWC USB3-compatible nodes defined in the ARM/ARM64 DTS files have
> > > name as "^dwc3@.*" or "^usb[1-3]@.*" or even "^dwusb@.*", which will cause
> > > the dtbs_check procedure failure. Let's fix the nodes naming to be
> > > compatible with the DWC USB3 DT schema to make dtbs_check happy.
> > >
> > > Note we don't change the DWC USB3-compatible nodes names of
> > > arch/arm64/boot/dts/apm/{apm-storm.dtsi,apm-shadowcat.dtsi} since the
> > > in-source comment says that the nodes name need to be preserved as
> > > "^dwusb@.*" for some backward compatibility.
> >
>
> > interesting, compatibility with what? Some debugfs files, perhaps? :-)
>
> Don't really know.) In my experience the worst type of such compatibility is
> connected with some bootloader magic, which may add/remove/modify properties
> to nodes with pre-defined names.

I seriously doubt anyone is using the APM machines with DT (even ACPI
is somewhat doubtful). I say change them. Or remove the dts files and
see what happens. Either way it can always be reverted.

Rob

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
