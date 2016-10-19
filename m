From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 19 Oct 2016 09:32:38 +0000
Subject: [PATCH v2] drm/arcpgu: Accommodate adv7511 switch to DRM bridge
In-Reply-To: <26a8cad6-118f-146f-f6ea-e9d539fc40a1@codeaurora.org>
References: <1476863178-15237-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <26a8cad6-118f-146f-f6ea-e9d539fc40a1@codeaurora.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1476869529.3348.27.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Archit, all,

On Wed, 2016-10-19@14:43 +0530, Archit Taneja wrote:
> 
> On 10/19/2016 01:16 PM, Eugeniy Paltsev wrote:
> > 
> > ARC PGU driver starts crashing on initialization after
> > 'commit e12c2f645557 ("drm/i2c: adv7511: Convert to drm_bridge")'
> > This happenes because in "arcpgu_drm_hdmi_init" function we get pointer
> > of "drm_i2c_encoder_driver" structure, which doesn't exist after
> > adv7511 hdmi encoder interface changed from slave encoder to drm bridge.
> > So, when we call "encoder_init" function from this structure driver
> > crashes.

[snip]

> Looks good now.
> 
> Reviewed-by: Archit Taneja <architt at codeaurora.org>

And IMHO it would be really good to get this one back-ported to 4.8
because it really fixes kernel crash if ARC PGU driver is used.

It might be a bit of a problem because patch itself a little-bit larger
than formal requirement for stable backports but let's see if it gets accepted.

-Alexey
