Return-Path: <SRS0=oiN1=56=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F51C2BA19
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Apr 2020 18:14:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53ACF2078A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Apr 2020 18:14:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="plfRAb+a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53ACF2078A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F7D59cWqwOtOZVNWUVUnXY1Btkgn3cRYK5uMV6SM1+8=; b=plfRAb+aL6G6Zt
	jjjv2Ph+PeeM8e9BdlhsRGeJT22fsG6TYUVwId+kahZYOP+EoBL91OPMOOBDBRTIFrEoYh/A2BAvG
	TKB8JgsZVPhlBzjc44DzwZcZ5KDN+ZEjEtx0NNcB0Oo2+kFfddltw+86cJzqZJTh0qrffJICj/tku
	HX3tSfKXN4OVgNQXYSPfZRwJs3axXRvJgjzhMxUS7HHYM04kpKWmXBpPJzc93/vGI75EReQew57qO
	ZL+ILM4/uOcNdWMYvbr1RZVyPL7KwCdqhwMc8oQ0V95wpfGY/FpT+ScAFDPWTRl4L2htgCLmEHNDk
	2fomRIiTNWW+RGhXTO4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOQ4c-0004HE-FS; Tue, 14 Apr 2020 18:14:14 +0000
Received: from asavdk4.altibox.net ([109.247.116.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOQ4Y-00041N-FU
 for linux-snps-arc@lists.infradead.org; Tue, 14 Apr 2020 18:14:12 +0000
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E06EC80441;
 Tue, 14 Apr 2020 20:12:01 +0200 (CEST)
Date: Tue, 14 Apr 2020 20:11:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH v2 1/2] DRM: ARC: add HDMI 2.0 TX encoder support
Message-ID: <20200414181155.GA21071@ravnborg.org>
References: <20200414144402.27643-1-Eugeniy.Paltsev@synopsys.com>
 <20200414144402.27643-2-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414144402.27643-2-Eugeniy.Paltsev@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=jIQo8A4GAAAA:8 a=VwQbUJbxAAAA:8 a=irhMBndJ4tJQUlVCqRwA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=Lf5xNeLK5dgiOs8hzIjU:22
 a=AjGcO6oz07-iQ99wixmX:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_111411_052588_6C6F27CD 
X-CRM114-Status: GOOD (  23.25  )
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
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Eugeniy.

On Tue, Apr 14, 2020 at 05:44:01PM +0300, Eugeniy Paltsev wrote:
> The Synopsys ARC SoCs (like HSDK4xD) include on-chip DesignWare HDMI
> encoders. Support them with a platform driver to provide platform glue
> data to the dw-hdmi driver.


Drivers looks lean and clean.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

But really take this as I found no whitespace erros or something...

A few drive-by comments below.

	Sam

> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  MAINTAINERS                       |   6 ++
>  drivers/gpu/drm/Makefile          |   2 +-
>  drivers/gpu/drm/arc/Kconfig       |   7 ++
>  drivers/gpu/drm/arc/Makefile      |   1 +
>  drivers/gpu/drm/arc/arc-dw-hdmi.c | 126 ++++++++++++++++++++++++++++++
>  5 files changed, 141 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/arc/arc-dw-hdmi.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a6fbdf354d34..2aaed1190370 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1258,6 +1258,12 @@ S:	Supported
>  F:	drivers/gpu/drm/arc/
>  F:	Documentation/devicetree/bindings/display/snps,arcpgu.txt
>  
> +ARC DW HDMI DRIVER
> +M:	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> +S:	Supported
> +F:	drivers/gpu/drm/arc/arc-dw-hdmi.c
> +F:	Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml

I am confused about the filename of the binding.
Binding files are often named after their compatible.
But the compatible is: snps,dw-hdmi-hsdk

And the biding file seems to be named after the driver name.
This seems wrong - and I do nto see it explained.

> +
>  ARCNET NETWORK LAYER
>  M:	Michael Grzeschik <m.grzeschik@pengutronix.de>
>  L:	netdev@vger.kernel.org
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 6493088a0fdd..5b0bcf7f45cd 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -109,7 +109,7 @@ obj-y			+= panel/
>  obj-y			+= bridge/
>  obj-$(CONFIG_DRM_FSL_DCU) += fsl-dcu/
>  obj-$(CONFIG_DRM_ETNAVIV) += etnaviv/
> -obj-$(CONFIG_DRM_ARCPGU)+= arc/
> +obj-y			+= arc/
>  obj-y			+= hisilicon/
>  obj-$(CONFIG_DRM_ZTE)	+= zte/
>  obj-$(CONFIG_DRM_MXSFB)	+= mxsfb/
> diff --git a/drivers/gpu/drm/arc/Kconfig b/drivers/gpu/drm/arc/Kconfig
> index e8f3d63e0b91..baec9d2a4fba 100644
> --- a/drivers/gpu/drm/arc/Kconfig
> +++ b/drivers/gpu/drm/arc/Kconfig
> @@ -8,3 +8,10 @@ config DRM_ARCPGU
>  	  Choose this option if you have an ARC PGU controller.
>  
>  	  If M is selected the module will be called arcpgu.
> +
> +config DRM_ARC_DW_HDMI
> +	tristate "ARC DW HDMI"
> +	depends on DRM && OF
> +	select DRM_DW_HDMI
> +	help
> +	  Synopsys DW HDMI driver for various ARC development boards
> diff --git a/drivers/gpu/drm/arc/Makefile b/drivers/gpu/drm/arc/Makefile
> index c7028b7427b3..7a156d8c2c3c 100644
> --- a/drivers/gpu/drm/arc/Makefile
> +++ b/drivers/gpu/drm/arc/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  arcpgu-y := arcpgu_crtc.o arcpgu_hdmi.o arcpgu_sim.o arcpgu_drv.o
>  obj-$(CONFIG_DRM_ARCPGU) += arcpgu.o
> +obj-$(CONFIG_DRM_ARC_DW_HDMI) += arc-dw-hdmi.o
> diff --git a/drivers/gpu/drm/arc/arc-dw-hdmi.c b/drivers/gpu/drm/arc/arc-dw-hdmi.c
> new file mode 100644
> index 000000000000..4869dd668a51
> --- /dev/null
> +++ b/drivers/gpu/drm/arc/arc-dw-hdmi.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +//
> +// Synopsys DW HDMI driver for various ARC development boards
> +//
> +// Copyright (C) 2020 Synopsys
> +// Author: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> +
> +#include <linux/component.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <drm/bridge/dw_hdmi.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_encoder_slave.h>
> +#include <drm/drm_of.h>
> +
> +static const struct dw_hdmi_mpll_config snps_hdmi_mpll_cfg[] = {
> +	{
> +		27000000, {
> +			{ 0x00B3, 0x0000 },
> +			{ 0x00B3, 0x0000 },
> +			{ 0x00B3, 0x0000 }
> +		},
> +	}, {
> +		74250000, {
> +			{ 0x0072, 0x0001},
> +			{ 0x0072, 0x0001},
> +			{ 0x0072, 0x0001}
> +		},
> +	}, {
> +		148500000, {
> +			{ 0x0051, 0x0002},
> +			{ 0x0051, 0x0002},
> +			{ 0x0051, 0x0002}
> +		},
> +	}, {
> +		~0UL, {
> +			{ 0x00B3, 0x0000 },
> +			{ 0x00B3, 0x0000 },
> +			{ 0x00B3, 0x0000 },
> +		},
> +	}
> +};
> +
> +static const struct dw_hdmi_curr_ctrl snps_hdmi_cur_ctr[] = {
> +	/* pixelclk    bpp8    bpp10   bpp12 */
This comment is very useful. Could you put one on top of
snps_hdmi_mpll_cfg too?

> +	{ 27000000,  { 0x0000, 0x0000, 0x0000 }, },
> +	{ 74250000,  { 0x0008, 0x0008, 0x0008 }, },
> +	{ 148500000, { 0x001b, 0x001b, 0x001b }, },
> +	{ ~0UL,      { 0x0000, 0x0000, 0x0000 }, }
> +};
> +
> +
> +static const struct dw_hdmi_phy_config snps_hdmi_phy_config[] = {
> +	/* pixelclk   symbol  term    vlev */
> +	{ 27000000,   0x8009, 0x0004, 0x0232},
> +	{ 74250000,   0x8009, 0x0004, 0x0232},
> +	{ 148500000,  0x8009, 0x0004, 0x0232},
> +	{ ~0UL,       0x8009, 0x0004, 0x0232}
> +};
> +
> +static enum drm_mode_status snps_dw_hdmi_mode_valid(struct drm_connector *con,
> +						    const struct drm_display_mode *mode)
> +{
> +	return MODE_OK;
> +}

dw_hdmi_bridge_mode_valid() will return MODE_OK if no operation
is assigned to .mode_valid.
So I think it is not needed.

Or I have missed something, which is also quite possible.

> +
> +static struct dw_hdmi_plat_data snps_dw_hdmi_drv_data = {
> +	.mpll_cfg   = snps_hdmi_mpll_cfg,
> +	.cur_ctr    = snps_hdmi_cur_ctr,
> +	.phy_config = snps_hdmi_phy_config,
> +	.mode_valid = snps_dw_hdmi_mode_valid,
> +};
> +
static const struct of_device_id snps_dw_hdmi_dt_ids[] = {
	{ .compatible = "snps,dw-hdmi-hsdk", .data = &snps_dw_hdmi_drv_data },
	{ /* sentinel */ },
	
Bracing looked strange. Consider the above format.
Ignore if line becomes a few char too long (IMO).

	Sam

> +};
> +MODULE_DEVICE_TABLE(of, snps_dw_hdmi_dt_ids);
> +
> +static int snps_dw_hdmi_probe(struct platform_device *pdev)
> +{
> +	const struct dw_hdmi_plat_data *plat_data;
> +	const struct of_device_id *match;
> +	struct dw_hdmi *hdmi;
> +
> +	if (!pdev->dev.of_node)
> +		return -ENODEV;
> +
> +	match = of_match_node(snps_dw_hdmi_dt_ids, pdev->dev.of_node);
> +	plat_data = match->data;
> +
> +	hdmi = dw_hdmi_probe(pdev, plat_data);
> +	if (IS_ERR(hdmi))
> +		return PTR_ERR(hdmi);
> +
> +	platform_set_drvdata(pdev, hdmi);
> +
> +	return 0;
> +}
> +
> +static int snps_dw_hdmi_remove(struct platform_device *pdev)
> +{
> +	struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
> +
> +	dw_hdmi_remove(hdmi);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver snps_dw_hdmi_platform_driver = {
> +	.probe  = snps_dw_hdmi_probe,
> +	.remove = snps_dw_hdmi_remove,
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +		.of_match_table = snps_dw_hdmi_dt_ids,
> +	},
> +};
> +module_platform_driver(snps_dw_hdmi_platform_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("ARC specific DW-HDMI driver extension");
> +MODULE_AUTHOR("Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>");
> -- 
> 2.21.1

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
