From: daniel@ffwll.ch (Daniel Vetter)
Date: Fri, 18 Mar 2016 18:23:28 +0100
Subject: [PATCH 1/4 v3] drm: Add support of ARC PGU display controller
In-Reply-To: <1458288709.12484.15.camel@synopsys.com>
References: <1457710959-9562-1-git-send-email-abrodkin@synopsys.com>
 <1457710959-9562-2-git-send-email-abrodkin@synopsys.com>
 <20160314070009.GN14170@phenom.ffwll.local>
 <1457954159.3306.24.camel@synopsys.com>
 <20160315081056.GS14170@phenom.ffwll.local>
 <1458055486.4174.16.camel@synopsys.com>
 <20160315155940.GL14170@phenom.ffwll.local>
 <1458246430.3134.14.camel@synopsys.com>
 <20160318080257.GD14170@phenom.ffwll.local>
 <1458288709.12484.15.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160318172327.GH14170@phenom.ffwll.local>
To: linux-snps-arc@lists.infradead.org

On Fri, Mar 18, 2016@08:11:49AM +0000, Alexey Brodkin wrote:
> Hi Daniel,
> 
> On Fri, 2016-03-18@09:02 +0100, Daniel Vetter wrote:
> > On Thu, Mar 17, 2016@08:27:10PM +0000, Alexey Brodkin wrote:
> > > 
> > > Hi Daniel,
> > > 
> > > On Tue, 2016-03-15@16:59 +0100, Daniel Vetter wrote:
> > > > 
> > > > On Tue, Mar 15, 2016@03:24:46PM +0000, Alexey Brodkin wrote:
> > > > > 
> > > > > On Tue, 2016-03-15@09:10 +0100, Daniel Vetter wrote:
> > > > > > 
> > > > > > On Mon, Mar 14, 2016@11:15:59AM +0000, Alexey Brodkin wrote:
> > > > > > > 
> > > > > > > On Mon, 2016-03-14@08:00 +0100, Daniel Vetter wrote:
> > > > > > > > 
> > > > > > > > On Fri, Mar 11, 2016@06:42:36PM +0300, Alexey Brodkin wrote:
> > > > > > > > > 
> > > > > > > > > ?
> > > > > > > > > +static struct drm_driver arcpgu_drm_driver = {
> > > > > > > > > +	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME |
> > > > > > > > > +			???DRIVER_ATOMIC,
> > > > > > > > > +	.preclose = arcpgu_preclose,
> > > > > > > > > +	.lastclose = arcpgu_lastclose,
> > > > > > > > > +	.name = "drm-arcpgu",
> > > > > > > > > +	.desc = "ARC PGU Controller",
> > > > > > > > > +	.date = "20160219",
> > > > > > > > > +	.major = 1,
> > > > > > > > > +	.minor = 0,
> > > > > > > > > +	.patchlevel = 0,
> > > > > > > > > +	.fops = &arcpgu_drm_ops,
> > > > > > > > > +	.load = arcpgu_load,
> > > > > > > > > +	.unload = arcpgu_unload,
> > > > > > > > Load and unload hooks are deprecated (it's a classic midlayer mistake).
> > > > > > > > Please use drm_dev_alloc/register pairs directly instead, and put your
> > > > > > > > device setup code in-between. Similar for unloading. There's a bunch of
> > > > > > > > example drivers converted already.
> > > > > > > Ok I took "atmel-hlcdc" as example.
> > > > > > > And that's interesting.
> > > > > > > 
> > > > > > > If I put my?arcpgu_load() in between?drm_dev_alloc() and
> > > > > > > drm_dev_register() then I'm getting this on the driver probe:
> > > > > > > ---------------------------------->8-------------------------------
> > > > > > > [drm] Initialized drm 1.1.0 20060810
> > > > > > > arcpgu e0017000.pgu: arc_pgu ID: 0xabbabaab
> > > > > > > ------------[ cut here ]------------
> > > > > > > WARNING: CPU: 0 PID: 1 at lib/kobject.c:244 kobject_add_internal+0x17c/0x498()
> > > > > > > kobject_add_internal failed for card0-HDMI-A-1 (error: -2 parent: card0)
> > > > > > > Modules linked in:
> > > > > > > CPU: 0 PID: 1 Comm: swapper Not tainted 4.5.0-rc3-01062-ga447822-dirty #17
> > > > > > > 
> > > > > > > Stack Trace:
> > > > > > > ? arc_unwind_core.constprop.1+0xa4/0x110
> > > > > > > ? warn_slowpath_fmt+0x6e/0xfc
> > > > > > > ? kobject_add_internal+0x17c/0x498
> > > > > > > ? kobject_add+0x98/0xe4
> > > > > > > ? device_add+0xc6/0x734
> > > > > > > ? device_create_with_groups+0x12a/0x144
> > > > > > > ? drm_sysfs_connector_add+0x54/0xe8
> > > > > > > ? arcpgu_drm_hdmi_init+0xd4/0x17c
> > > > > > > ? arcpgu_probe+0x138/0x24c
> > > > > > > ? platform_drv_probe+0x2e/0x6c
> > > > > > > ? really_probe+0x212/0x35c
> > > > > > > ? __driver_attach+0x90/0x94
> > > > > > > ? bus_for_each_dev+0x46/0x80
> > > > > > > ? bus_add_driver+0x14e/0x1b4
> > > > > > > ? driver_register+0x64/0x108
> > > > > > > ? do_one_initcall+0x86/0x194
> > > > > > > ? kernel_init_freeable+0xf0/0x188
> > > > > > > ---[ end trace c67166ad43ddcce2 ]---
> > > > > > > [drm:drm_sysfs_connector_add] adding "HDMI-A-1" to sysfs
> > > > > > > [drm:drm_sysfs_connector_add] *ERROR* failed to register connector device: -2
> > > > > > > arcpgu e0017000.pgu: failed to regiter DRM connector and helper funcs
> > > > > > > arcpgu: probe of e0017000.pgu failed with error -2
> > > > > > > ---------------------------------->8-------------------------------
> > > > > > > 
> > > > > > > But if I move arcpgu_load() after drm_dev_register() then everything
> > > > > > > starts properly and I may see HDMI screen works perfectly fine.
> > > > > > > 
> > > > > > > Any thoughts?
> > > > > > Oops, yeah missed that detail. If you look at atmel it has a loop to
> > > > > > register all the drm connectors _after_ calling drm_dev_register().
> > > > > > Totally forgot about that. Can you pls
> > > > > > - Extract a new drm_connector_register_all() function
> > > > > > ? (atmel_hlcdc_dc_connector_plug_all seems to be the best template),
> > > > > > ? including kerneldoc.
> > > > > > - Adjust kerneldoc of drm_dev_register() to mention
> > > > > > ? drm_connector_register_all() and that ordering constraint.
> > > > > > - Roll that helper out to all the drivers that currently hand-roll it (one
> > > > > > ? patch per driver).
> > > > > > 
> > > > > > I know a bit of work but imo not too much, and by doing some small
> > > > > > refactoring every time someone stumbles over a drm pitfall we keep the
> > > > > > subsystem clean&easy to understand. You're up for this? Would be a prep
> > > > > > series, I'll happily review it to get it merged fast. Just a few weeks ago
> > > > > > I merged 20+ patches to make ->mode_fixup hooks optional and remove dummy
> > > > > > ones all over the subsystem, in other words: You'll have my full attention
> > > > > > ;-)
> > > > > Sure, I'm ready to pay that price :)
> > > > > Stay tuned and patches will follow.
> > > > Awesome, looking forward to your patches.
> > > Sorry it took longer for me to finally put my hands on that work but anyways.
> > > 
> > > I'm looking now at how drivers use existing?drm_connector_unplug_all() and
> > > their implementation of what would be?drm_connector_plug_all() and see
> > > in some implementations people wraps both helpers with
> > > mutex_{lock|unlock}(&dev->mode_config.mutex). But not everybody does this.
> > > 
> > > So essentially my questions are:
> > > ?[1] If it's necessary to get hold of that mutex before execution of either helper?
> > In plug_all I think so, unplug_all has a FIXME comment about how locking
> > against sysfs is horrible and it's all going to blow up. But we did
> > recently change the connector sysfs files, so maybe that's fixed now. Not
> > sure.
> >
> > > ?[2] If this is really necessary then IMHO it makes sense to move mutex_lock/unlock
> > > ? ? ?in helpers itself, right?
> > Yeah, locking in the helper makes imo sense.
> 
> Hm, now I'm even more confused :)
> Above you're not sure if this locking is safe (at least on unplug) but here you say
> it makes sense (not mentioning the case - both helpers or only on "plugging").
> 
> I may indeed try to embed mutex locks in both helpers but what if it works for me but
> others will get broken stuff?

Sorry, I meant only embed it it for register_all. And keep the FIXME
comment for unregister_all (well unplug_all as it's called still). Fixing
up sysfs vs. mode_config.mutex is a lot more work than just this.

> > Aside: I'd vote for
> > register_all/unregister_all for consistency with drm_connector_register.
> > register/unregister has a very clear meaning of "publish the object to
> > userspace/other kernel subsystems". plug/unplug is confusing in DRM
> > because of hotplug.
> 
> Well but what should happen to existing unplug() then?
> Should I rename it to unregister_all() in the same change?

Yes, that's what I'd do. I think that's clearer, if we go with a strict
distinction between register/unregister and hotplug handling.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
