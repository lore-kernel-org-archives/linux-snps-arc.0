From: Liviu.Dudau@arm.com (Liviu.Dudau@arm.com)
Date: Fri, 3 Mar 2017 18:21:02 +0000
Subject: [PATCH] drm/arcpgu: Get rid of "encoder-slave" property
In-Reply-To: <1488563298.2940.33.camel@synopsys.com>
References: <1488554364-25579-1-git-send-email-abrodkin@synopsys.com>
 <20170303162837.GO917@e110455-lin.cambridge.arm.com>
 <1488563298.2940.33.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170303182102.GP917@e110455-lin.cambridge.arm.com>
To: linux-snps-arc@lists.infradead.org

On Fri, Mar 03, 2017@05:48:19PM +0000, Alexey Brodkin wrote:
> Hi Liviu,
> 
> On Fri, 2017-03-03@16:28 +0000, Liviu Dudau wrote:
> > On Fri, Mar 03, 2017@06:19:24PM +0300, Alexey Brodkin wrote:
> > > 
> > > -	/* find the encoder node and initialize it */
> > > -	encoder_node = of_parse_phandle(drm->dev->of_node, "encoder-slave", 0);
> > > -	if (encoder_node) {
> > > -		ret = arcpgu_drm_hdmi_init(drm, encoder_node);
> > > -		of_node_put(encoder_node);
> > > +	/* There is only one output port inside each device, find it */
> > > +	port = of_graph_get_next_endpoint(pdev->dev.of_node, NULL);
> > > +
> > > +	if (port) {
> > > +		if (of_device_is_available(port))
> > > +			encoder = of_graph_get_remote_port_parent(port);
> > > +		of_node_put(port);
> > > +	}
> > 
> > You must've been looking at some old version. Current version in -next uses
> > of_graph_get_remote_node() to replace all those lines you have added (see Rob
> > Herring's series to introduce of_graph_get_remote_node() function)
> 
> Hm, I'm not on Linus' master tree [1] and so I thought I was quite up to date :)
> Still I made a check of linux-next and don't see any changes in
> "drivers/gpu/drm/arm" compared to Linus' tree.
> 
> [1]?http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/gpu/drm/arm?id=e4563f6ba71792c77aeccb2092cc23149b44e642
> [2]?http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/arm?id=e4563f6ba71792c77aeccb2092cc23149b44e642
> 
> Could you please clarify which exact tree did you mean?

Sorry, I thought the series got pulled by one of the DRM trees, but it looks like
I was wrong. I was carrying a private copy in my internal tree, waiting for the
moment when it got pulled into drm-next or drm-misc-next.

Rob, do you have an update on your series introducing of_graph_get_remote_node() ?

Best regards,
Liviu

> 
> Anyways I just tried to rebase my patch on top of linux-next tree and now
> video output is broken for me - I only see some garbage on top of the screen
> so I'll need to investigate it first before moving forward with stuff you
> proposed :)
> 
> -Alexey

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ?\_(?)_/?
