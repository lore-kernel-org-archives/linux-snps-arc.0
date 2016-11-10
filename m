From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 10 Nov 2016 11:06:40 +0000
Subject: [PATCH v2] drm/arcpgu: Accommodate adv7511 switch to DRM bridge
In-Reply-To: <1478089382.2710.20.camel@synopsys.com>
References: <1476863178-15237-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <26a8cad6-118f-146f-f6ea-e9d539fc40a1@codeaurora.org>
 <1476869529.3348.27.camel@synopsys.com>
 <4881796E12491D4BB15146FE0209CE646784BA6F@DE02WEMBXB.internal.synopsys.com>
 <1478089382.2710.20.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478775952.2536.27.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Daniel, David,

On Wed, 2016-11-02@12:23 +0000, Alexey Brodkin wrote:
> Hi Daniel, David,
> 
> On Mon, 2016-10-24@18:33 +0000, Alexey Brodkin wrote:
> > 
> > Hi Daniel,
> > 
> > > 
> > > 
> > > -----Original Message-----
> > > From: linux-snps-arc [mailto:linux-snps-arc-bounces at lists.infradead.org] On Behalf Of Alexey Brodkin
> > > Sent: 19 ??????? 2016 ?. 12:33
> > > To: dri-devel at lists.freedesktop.org; architt at codeaurora.org; Eugeniy.Paltsev at synopsys.com
> > > Cc: linux-snps-arc at lists.infradead.org; linux-kernel at vger.kernel.org
> > > Subject: Re: [PATCH v2] drm/arcpgu: Accommodate adv7511 switch to DRM bridge
> > > 
> > > Hi Archit, all,
> > > 
> > > On Wed, 2016-10-19@14:43 +0530, Archit Taneja wrote:
> > > > 
> > > > 
> > > > 
> > > > On 10/19/2016 01:16 PM, Eugeniy Paltsev wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > ARC PGU driver starts crashing on initialization after
> > > > > 'commit e12c2f645557 ("drm/i2c: adv7511: Convert to drm_bridge")'
> > > > > This happenes because in "arcpgu_drm_hdmi_init" function we get pointer
> > > > > of "drm_i2c_encoder_driver" structure, which doesn't exist after
> > > > > adv7511 hdmi encoder interface changed from slave encoder to drm bridge.
> > > > > So, when we call "encoder_init" function from this structure driver
> > > > > crashes.
> > > 
> > > [snip]
> > > 
> > > > 
> > > > 
> > > > Looks good now.
> > > > 
> > > > Reviewed-by: Archit Taneja <architt at codeaurora.org>
> > > 
> > > And IMHO it would be really good to get this one back-ported to 4.8
> > > because it really fixes kernel crash if ARC PGU driver is used.
> > > 
> > > It might be a bit of a problem because patch itself a little-bit larger
> > > than formal requirement for stable backports but let's see if it gets accepted.
> > 
> > Could you please pick this one up?
> > I may alternatively send a pull-request to David but not sure if 1 patch worth it.
> > 
> > Also if that's not really too late it would be good to get this one in 4.9 since the patch
> > In question fixes a real driver crash on its instantiation.
> > Actually driver crash happens since 4.8 but I failed to notice it earlier and given amount
> > of changes I think there's barely a chance for it it to be accepted in stable branches...
> > which in its turn makes at least 4.9 very desirable.
> 
> Any chance this one gets accepted anytime soon?

Please treat this as another polite reminder to apply this patch.
If you prefer I may send a pull-request otherwise.

Regards,
Alexey
