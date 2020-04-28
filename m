Return-Path: <SRS0=82UL=6M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CD7C83007
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Apr 2020 10:19:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C270206C0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Apr 2020 10:19:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IydthCyW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="kgKO0cBP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C270206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tFkqbeda3UJhAF1YdWHyUOP0heiFfSTsq3UQ3fPn+i4=; b=IydthCyW01nbIz
	QBzp2vvQu+c3GHLv7beyevH1Z+kUZ2QF1LvRkiMnmShmO4b/CgG8VBkU7CJyLgkUf/hqH4gFj7bBa
	lZFMRBW1fnRoi8sR5Ok3LddrE1Mi70NgbSD/DWl+/oLTFaCal7X9MuQhPs512SIg8sJ2Uvrc2AAoZ
	82c/pia0wJX/b27lVUsT0lUFnBDZDopEzUAjA7OaEgOXBEBoa2tKPByV6lMvhZnVJ1iZO1j0HAlzz
	jOxqq0asyUryOsGA0sd9qsEolU2LxN6CasBXR84k4f08zF/cA6QVE5FC9jC0wSCZO8RTUDSoy15mk
	mbAwnv47gNqKwIbx0hgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTNKW-0003YK-Tw; Tue, 28 Apr 2020 10:19:08 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTNKT-0003QF-Rv
 for linux-snps-arc@lists.infradead.org; Tue, 28 Apr 2020 10:19:07 +0000
Received: by mail-wm1-x343.google.com with SMTP id u127so2225877wmg.1
 for <linux-snps-arc@lists.infradead.org>; Tue, 28 Apr 2020 03:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=kG3pAr197zg/lS7mr8VNmBDpYyQu9IqibYfSDpBEn7k=;
 b=kgKO0cBP5Bssi7//kT69CO7mZYdf7AyFI1rR8/f/GDrUOTsB4qJ+hKHVFiJ9XtAS/o
 qP+mV4FkHAYXgBQdP2KVdASCvVYZOtS4NY0qKQYpCQ4aOLNXho1KhTsnQToVN3oudcCY
 PExtKt2Fx6dhe7iJ0BX5OyWPtd3rl8z+CcTqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=kG3pAr197zg/lS7mr8VNmBDpYyQu9IqibYfSDpBEn7k=;
 b=P+7oFb8Zds+5ZkSoyjo/WFvS21lrhNJurhtNE8cYpWrr5sDpWZvCCId8Nvz7i9fsOn
 68LDC6yLNuDmTbH2lLePV3IcVX4Z8/SlDk9phGLpYhKBG4IueNly43s8rCLxuJnQrSgB
 OT0pVwpSq6ySgvnAa6NQF7P8g9dcvcYix3wHnE/jyR0h0KVRMka4okQ/Ws9G9Fnl716o
 lEvdxAnzwHGVL7KKL171D6SBtv7hh4wOWK9L2GywDP+UKv+RKquabnAHOQ64Wu5jrFZT
 GwVGU3jh7NlM6x2c/wlIHgF1AZ9rhMsQ/xNPO6gM46FnHjiapT9cuGpiD70gRf7rOeFB
 amVg==
X-Gm-Message-State: AGi0PuZIZo+4EIQ6jKDpJ+PCZKtezsBrtsYhX5uED+xAkSPJa7lmsLJS
 IcBkiTCAENavFTOq8s1RH3sjZw==
X-Google-Smtp-Source: APiQypKo38IfQ2C40mSf8kIDZj3p6vDuj6I8VfusT2k9k8ZJbwXy1/pntxWf3JXgC9wEVd95IwAP8w==
X-Received: by 2002:a1c:a90a:: with SMTP id s10mr3498028wme.99.1588069142896; 
 Tue, 28 Apr 2020 03:19:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w18sm24063758wrn.55.2020.04.28.03.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 03:19:02 -0700 (PDT)
Date: Tue, 28 Apr 2020 12:19:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 1/2] DRM: ARC: add HDMI 2.0 TX encoder support
Message-ID: <20200428101900.GG3456981@phenom.ffwll.local>
Mail-Followup-To: Neil Armstrong <narmstrong@baylibre.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 dri-devel@lists.freedesktop.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
References: <20200414232929.22788-1-Eugeniy.Paltsev@synopsys.com>
 <20200414232929.22788-2-Eugeniy.Paltsev@synopsys.com>
 <20200415173320.GG3456981@phenom.ffwll.local>
 <267d49d8-a73a-0317-cb50-0f63f0ced049@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <267d49d8-a73a-0317-cb50-0f63f0ced049@baylibre.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_031905_910375_38D138B1 
X-CRM114-Status: GOOD (  38.48  )
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Apr 21, 2020 at 05:55:38PM +0200, Neil Armstrong wrote:
> On 15/04/2020 19:33, Daniel Vetter wrote:
> > On Wed, Apr 15, 2020 at 02:29:28AM +0300, Eugeniy Paltsev wrote:
> >> The Synopsys ARC SoCs (like HSDK4xD) include on-chip DesignWare HDMI
> >> encoders. Support them with a platform driver to provide platform glue
> >> data to the dw-hdmi driver.
> >>
> >> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> >> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> >> ---
> >>  MAINTAINERS                       |   6 ++
> >>  drivers/gpu/drm/Makefile          |   2 +-
> >>  drivers/gpu/drm/arc/Kconfig       |   7 ++
> >>  drivers/gpu/drm/arc/Makefile      |   1 +
> >>  drivers/gpu/drm/arc/arc-dw-hdmi.c | 116 ++++++++++++++++++++++++++++++
> >>  5 files changed, 131 insertions(+), 1 deletion(-)
> >>  create mode 100644 drivers/gpu/drm/arc/arc-dw-hdmi.c
> >>
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index a6fbdf354d34..2aaed1190370 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -1258,6 +1258,12 @@ S:	Supported
> >>  F:	drivers/gpu/drm/arc/
> >>  F:	Documentation/devicetree/bindings/display/snps,arcpgu.txt
> >>  
> >> +ARC DW HDMI DRIVER
> >> +M:	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> >> +S:	Supported
> >> +F:	drivers/gpu/drm/arc/arc-dw-hdmi.c
> >> +F:	Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml
> >> +
> >>  ARCNET NETWORK LAYER
> >>  M:	Michael Grzeschik <m.grzeschik@pengutronix.de>
> >>  L:	netdev@vger.kernel.org
> >> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> >> index 6493088a0fdd..5b0bcf7f45cd 100644
> >> --- a/drivers/gpu/drm/Makefile
> >> +++ b/drivers/gpu/drm/Makefile
> >> @@ -109,7 +109,7 @@ obj-y			+= panel/
> >>  obj-y			+= bridge/
> >>  obj-$(CONFIG_DRM_FSL_DCU) += fsl-dcu/
> >>  obj-$(CONFIG_DRM_ETNAVIV) += etnaviv/
> >> -obj-$(CONFIG_DRM_ARCPGU)+= arc/
> >> +obj-y			+= arc/
> >>  obj-y			+= hisilicon/
> >>  obj-$(CONFIG_DRM_ZTE)	+= zte/
> >>  obj-$(CONFIG_DRM_MXSFB)	+= mxsfb/
> >> diff --git a/drivers/gpu/drm/arc/Kconfig b/drivers/gpu/drm/arc/Kconfig
> >> index e8f3d63e0b91..baec9d2a4fba 100644
> >> --- a/drivers/gpu/drm/arc/Kconfig
> >> +++ b/drivers/gpu/drm/arc/Kconfig
> >> @@ -8,3 +8,10 @@ config DRM_ARCPGU
> >>  	  Choose this option if you have an ARC PGU controller.
> >>  
> >>  	  If M is selected the module will be called arcpgu.
> >> +
> >> +config DRM_ARC_DW_HDMI
> >> +	tristate "ARC DW HDMI"
> >> +	depends on DRM && OF
> >> +	select DRM_DW_HDMI
> >> +	help
> >> +	  Synopsys DW HDMI driver for various ARC development boards
> >> diff --git a/drivers/gpu/drm/arc/Makefile b/drivers/gpu/drm/arc/Makefile
> >> index c7028b7427b3..7a156d8c2c3c 100644
> >> --- a/drivers/gpu/drm/arc/Makefile
> >> +++ b/drivers/gpu/drm/arc/Makefile
> >> @@ -1,3 +1,4 @@
> >>  # SPDX-License-Identifier: GPL-2.0-only
> >>  arcpgu-y := arcpgu_crtc.o arcpgu_hdmi.o arcpgu_sim.o arcpgu_drv.o
> >>  obj-$(CONFIG_DRM_ARCPGU) += arcpgu.o
> >> +obj-$(CONFIG_DRM_ARC_DW_HDMI) += arc-dw-hdmi.o
> >> diff --git a/drivers/gpu/drm/arc/arc-dw-hdmi.c b/drivers/gpu/drm/arc/arc-dw-hdmi.c
> >> new file mode 100644
> >> index 000000000000..46a6ee09b302
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/arc/arc-dw-hdmi.c
> >> @@ -0,0 +1,116 @@
> >> +// SPDX-License-Identifier: GPL-2.0+
> >> +//
> >> +// Synopsys DW HDMI driver for various ARC development boards
> >> +//
> >> +// Copyright (C) 2020 Synopsys
> >> +// Author: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> >> +
> >> +#include <linux/component.h>
> >> +#include <linux/module.h>
> >> +#include <linux/platform_device.h>
> >> +#include <drm/bridge/dw_hdmi.h>
> >> +#include <drm/drm_crtc_helper.h>
> >> +#include <drm/drm_edid.h>
> >> +#include <drm/drm_encoder_slave.h>
> >> +#include <drm/drm_of.h>
> >> +
> >> +static const struct dw_hdmi_mpll_config snps_hdmi_mpll_cfg[] = {
> >> +	{
> >> +		27000000, {
> >> +			{ 0x00B3, 0x0000 },
> >> +			{ 0x00B3, 0x0000 },
> >> +			{ 0x00B3, 0x0000 }
> >> +		},
> >> +	}, {
> >> +		74250000, {
> >> +			{ 0x0072, 0x0001},
> >> +			{ 0x0072, 0x0001},
> >> +			{ 0x0072, 0x0001}
> >> +		},
> >> +	}, {
> >> +		148500000, {
> >> +			{ 0x0051, 0x0002},
> >> +			{ 0x0051, 0x0002},
> >> +			{ 0x0051, 0x0002}
> >> +		},
> >> +	}, {
> >> +		~0UL, {
> >> +			{ 0x00B3, 0x0000 },
> >> +			{ 0x00B3, 0x0000 },
> >> +			{ 0x00B3, 0x0000 },
> >> +		},
> >> +	}
> >> +};
> >> +
> >> +static const struct dw_hdmi_curr_ctrl snps_hdmi_cur_ctr[] = {
> >> +	/* pixelclk    bpp8    bpp10   bpp12 */
> >> +	{ 27000000,  { 0x0000, 0x0000, 0x0000 }, },
> >> +	{ 74250000,  { 0x0008, 0x0008, 0x0008 }, },
> >> +	{ 148500000, { 0x001b, 0x001b, 0x001b }, },
> >> +	{ ~0UL,      { 0x0000, 0x0000, 0x0000 }, }
> >> +};
> >> +
> >> +
> >> +static const struct dw_hdmi_phy_config snps_hdmi_phy_config[] = {
> >> +	/* pixelclk   symbol  term    vlev */
> >> +	{ 27000000,   0x8009, 0x0004, 0x0232},
> >> +	{ 74250000,   0x8009, 0x0004, 0x0232},
> >> +	{ 148500000,  0x8009, 0x0004, 0x0232},
> >> +	{ ~0UL,       0x8009, 0x0004, 0x0232}
> >> +};
> >> +
> >> +static struct dw_hdmi_plat_data snps_dw_hdmi_drv_data = {
> >> +	.mpll_cfg   = snps_hdmi_mpll_cfg,
> >> +	.cur_ctr    = snps_hdmi_cur_ctr,
> >> +	.phy_config = snps_hdmi_phy_config,
> >> +};
> >> +
> >> +static const struct of_device_id snps_dw_hdmi_dt_ids[] = {
> >> +	{ .compatible = "snps,arc-dw-hdmi-hsdk", .data = &snps_dw_hdmi_drv_data },
> >> +	{ /* sentinel */ }
> >> +};
> >> +MODULE_DEVICE_TABLE(of, snps_dw_hdmi_dt_ids);
> >> +
> >> +static int snps_dw_hdmi_probe(struct platform_device *pdev)
> >> +{
> >> +	const struct dw_hdmi_plat_data *plat_data;
> >> +	const struct of_device_id *match;
> >> +	struct dw_hdmi *hdmi;
> >> +
> >> +	if (!pdev->dev.of_node)
> >> +		return -ENODEV;
> >> +
> >> +	match = of_match_node(snps_dw_hdmi_dt_ids, pdev->dev.of_node);
> >> +	plat_data = match->data;
> >> +
> >> +	hdmi = dw_hdmi_probe(pdev, plat_data);
> > 
> > So this is kinda not how bridge drivers are supposed to be done nowadays,
> > direct calling into the driver was the old way, and dw-hdmi still works
> > like that. Modern way is roughly
> > - bridge drivers bind automatically to any bridge they support
> > - bridge drivers publish a bridge with drm_bridge_add()
> > - the driver using the bridge fishes out with dt magic using
> >   of_drm_find_bridge() or another of the related of_ functions
> 
> dw-hdmi is an IP, with some platform specific code and arrays to make it work
> on very different systems, thus we can't use this scheme everywhere....
> 
> Some platforms (like r-car) uses the "right" model because the IP is integrated
> as-is with the default PHY and as an independent IP on the system.
> 
> It's definitely not the case on Rockchip/Amlogic/Allwinner systems,
> and even worse on Amlogic system having a glue on top of the IP, and a
> custom PHY instead of the Synopsys PHY.
> 
> Thus it would be great this would be the case on a Synopsys SoC... but like
> other platforms they have platform specific parameters.
> 
> All this has been discussed and reviewed a few years ago, I would
> personally prefer "fishing out a bridge using dt magic" instead having
> 1k glue code around the IP.

I'm not opposed to the per-instance glue code, that seems required. I'm
kinda questioning where it is.

Current design is that the glue code is in the drm_device driver side of
things, with the drm_bridge somewhat awkward in-between. That doesn't seem
very clean.

I think more suitable for drm_bridge would be to push all the glue behind
the drm_bridge (maybe into separate files in a drm/bridge/dw-hdmi/
directory), and the drm_device driver side simply grabs a drm_bridge and
that's it. Then the drm_bridge abstraction lines up with the code
organization again. Atm it's a bit a confusing state of things.

Plan B would be to give up dw-hdmi being a drm_bridge, and rework dw-hdmi
to be some kind of helper library to build a driver for a specific dw-hdmi
instance. I think that would also be a clean design.

But right now we kinda have a bit of both, so not really abstracted, but
also not really a clean helper without midlayer either, and that doesn't
look great.
-Daniel

> 
> Neil
> 
> > 
> > I know a bit late, just spotted this because you brought your series here
> > up in my arc cleanup series, but can you pls look into adjusting
> > accordingly?
> > 
> > I shouldn't take more than moving this binding here into the dw-hdmi
> > driver, and switching arc itself over to the of_drm_find_bridge() call.
> > That way we could slowly work to transform old bridge drivers like dw-hdmi
> > to the new way, instead of adding more cases that will never get
> > converted.
> > 
> > Other upside is that arc stays a neat&tiny driver :-)
> > 
> > Thanks, Daniel
> > 
> >> +	if (IS_ERR(hdmi))
> >> +		return PTR_ERR(hdmi);
> >> +
> >> +	platform_set_drvdata(pdev, hdmi);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int snps_dw_hdmi_remove(struct platform_device *pdev)
> >> +{
> >> +	struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
> >> +
> >> +	dw_hdmi_remove(hdmi);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static struct platform_driver snps_dw_hdmi_platform_driver = {
> >> +	.probe  = snps_dw_hdmi_probe,
> >> +	.remove = snps_dw_hdmi_remove,
> >> +	.driver = {
> >> +		.name = KBUILD_MODNAME,
> >> +		.of_match_table = snps_dw_hdmi_dt_ids,
> >> +	},
> >> +};
> >> +module_platform_driver(snps_dw_hdmi_platform_driver);
> >> +
> >> +MODULE_LICENSE("GPL v2");
> >> +MODULE_DESCRIPTION("ARC specific DW-HDMI driver extension");
> >> +MODULE_AUTHOR("Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>");
> >> -- 
> >> 2.21.1
> >>
> > 
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
