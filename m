From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 14 Mar 2016 11:15:59 +0000
Subject: [PATCH 1/4 v3] drm: Add support of ARC PGU display controller
In-Reply-To: <20160314070009.GN14170@phenom.ffwll.local>
References: <1457710959-9562-1-git-send-email-abrodkin@synopsys.com>
 <1457710959-9562-2-git-send-email-abrodkin@synopsys.com>
 <20160314070009.GN14170@phenom.ffwll.local>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1457954159.3306.24.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Daniel,

On Mon, 2016-03-14@08:00 +0100, Daniel Vetter wrote:
> On Fri, Mar 11, 2016@06:42:36PM +0300, Alexey Brodkin wrote:
> > 
> > ARC PGU could be found on some development boards from Synopsys.
> > This is a simple byte streamer that reads data from a framebuffer
> > and sends data to the single encoder.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > Cc: David Airlie <airlied at linux.ie>
> > Cc: dri-devel at lists.freedesktop.org
> > Cc: linux-snps-arc at lists.infradead.org
> > Cc: Jose Abreu <joabreu at synopsys.com>
> > ---
> > 
> > Changes v2 -> v3:
> > ?* Improved failure path if arcpgu_connector wasn't allocated (thanks Jose).
> > ?* Fixed driver building as module (reported by 0-DAY kernel test infrastruct.)
> > ?* Implemented uncached mapping of user-space FB pages.
> > 
> > No changes v1 -> v2.
> > 
> Bunch of comments below to update your driver to latest styles and best
> practices.
> 
> Cheers, Daniel

Thanks for doing that review!

> > +
> > +static void arc_pgu_crtc_atomic_flush(struct drm_crtc *crtc,
> > +				??????struct drm_crtc_state *state)
> > +{
> > +}
> > +
> > +static bool arc_pgu_crtc_mode_fixup(struct drm_crtc *crtc,
> > +				????const struct drm_display_mode *mode,
> > +				????struct drm_display_mode *adjusted_mode)
> > +{
> > +	return true;
> > +}
> You can drop the above 2 dummy functions.

Ok will do.

> > 
> > +
> > +static const struct drm_crtc_helper_funcs arc_pgu_crtc_helper_funcs = {
> > +	.mode_fixup	= arc_pgu_crtc_mode_fixup,
> > +	.mode_set	= drm_helper_crtc_mode_set,
> > +	.mode_set_base	= drm_helper_crtc_mode_set_base,
> > +	.mode_set_nofb	= arc_pgu_crtc_mode_set_nofb,
> > +	.enable		= arc_pgu_crtc_enable,
> > +	.disable	= arc_pgu_crtc_disable,
> > +	.prepare	= arc_pgu_crtc_disable,
> > +	.commit		= arc_pgu_crtc_enable,
> > +	.atomic_check	= arc_pgu_crtc_atomic_check,
> > +	.atomic_begin	= arc_pgu_crtc_atomic_begin,
> > +	.atomic_flush	= arc_pgu_crtc_atomic_flush,
> > +};
> > +
> > +static int arc_pgu_plane_atomic_check(struct drm_plane *plane,
> > +				??????struct drm_plane_state *state)
> > +{
> > +	return 0;
> > +}
> You don't need dummy functions for this.

Ditto.

> > +
> > +void arc_pgu_crtc_suspend(struct drm_crtc *crtc)
> > +{
> > +	arc_pgu_crtc_disable(crtc);
> > +}
> > +
> > +void arc_pgu_crtc_resume(struct drm_crtc *crtc)
> > +{
> > +	arc_pgu_crtc_enable(crtc);
> > +}
> Please use the atomic suspend/resume helper that Thierry recently merged.
> See the kerneldoc of drm_atomic_helper_suspend as a starting point for how
> it works and how it's supposed to be used.

Well looks like this is a reminder if dummy copy-paste.
We don't support PM in that driver yet, so I'll remove both functions
for now.

> > +static int arcpgu_atomic_commit(struct drm_device *dev,
> > +				????struct drm_atomic_state *state, bool async)
> > +{
> > +	return drm_atomic_helper_commit(dev, state, false);
> Note that this isn't really async if you ever get around to implement
> fence support or vblank support. Just fyi.

Ok but for now should I leave it as it is?

> > +static struct drm_driver arcpgu_drm_driver = {
> > +	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME |
> > +			???DRIVER_ATOMIC,
> > +	.preclose = arcpgu_preclose,
> > +	.lastclose = arcpgu_lastclose,
> > +	.name = "drm-arcpgu",
> > +	.desc = "ARC PGU Controller",
> > +	.date = "20160219",
> > +	.major = 1,
> > +	.minor = 0,
> > +	.patchlevel = 0,
> > +	.fops = &arcpgu_drm_ops,
> > +	.load = arcpgu_load,
> > +	.unload = arcpgu_unload,
> Load and unload hooks are deprecated (it's a classic midlayer mistake).
> Please use drm_dev_alloc/register pairs directly instead, and put your
> device setup code in-between. Similar for unloading. There's a bunch of
> example drivers converted already.

Ok I took "atmel-hlcdc" as example.
And that's interesting.

If I put my?arcpgu_load() in between?drm_dev_alloc() and
drm_dev_register() then I'm getting this on the driver probe:
---------------------------------->8-------------------------------
[drm] Initialized drm 1.1.0 20060810
arcpgu e0017000.pgu: arc_pgu ID: 0xabbabaab
------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at lib/kobject.c:244 kobject_add_internal+0x17c/0x498()
kobject_add_internal failed for card0-HDMI-A-1 (error: -2 parent: card0)
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 4.5.0-rc3-01062-ga447822-dirty #17

Stack Trace:
? arc_unwind_core.constprop.1+0xa4/0x110
? warn_slowpath_fmt+0x6e/0xfc
? kobject_add_internal+0x17c/0x498
? kobject_add+0x98/0xe4
? device_add+0xc6/0x734
? device_create_with_groups+0x12a/0x144
? drm_sysfs_connector_add+0x54/0xe8
? arcpgu_drm_hdmi_init+0xd4/0x17c
? arcpgu_probe+0x138/0x24c
? platform_drv_probe+0x2e/0x6c
? really_probe+0x212/0x35c
? __driver_attach+0x90/0x94
? bus_for_each_dev+0x46/0x80
? bus_add_driver+0x14e/0x1b4
? driver_register+0x64/0x108
? do_one_initcall+0x86/0x194
? kernel_init_freeable+0xf0/0x188
---[ end trace c67166ad43ddcce2 ]---
[drm:drm_sysfs_connector_add] adding "HDMI-A-1" to sysfs
[drm:drm_sysfs_connector_add] *ERROR* failed to register connector device: -2
arcpgu e0017000.pgu: failed to regiter DRM connector and helper funcs
arcpgu: probe of e0017000.pgu failed with error -2
---------------------------------->8-------------------------------

But if I move arcpgu_load() after drm_dev_register() then everything
starts properly and I may see HDMI screen works perfectly fine.

Any thoughts?


> > 
> > +	.dumb_create = drm_gem_cma_dumb_create,
> > +	.dumb_map_offset = drm_gem_cma_dumb_map_offset,
> > +	.dumb_destroy = drm_gem_dumb_destroy,
> > +	.get_vblank_counter = drm_vblank_no_hw_counter,
> > +	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> > +	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> > +	.gem_free_object = drm_gem_cma_free_object,
> > +	.gem_vm_ops = &drm_gem_cma_vm_ops,
> > +	.gem_prime_export = drm_gem_prime_export,
> > +	.gem_prime_import = drm_gem_prime_import,
> > +	.gem_prime_get_sg_table = drm_gem_cma_prime_get_sg_table,
> > +	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
> > +	.gem_prime_vmap = drm_gem_cma_prime_vmap,
> > +	.gem_prime_vunmap = drm_gem_cma_prime_vunmap,
> > +	.gem_prime_mmap = drm_gem_cma_prime_mmap,
> > +};
> > +
> > +static int arcpgu_probe(struct platform_device *pdev)
> > +{
> > +	return drm_platform_init(&arcpgu_drm_driver, pdev);
> ... or read the kerneldoc of this function, which also explains what you
> should do ;-)

Could you please point me to the relevant document?
I wasn't able to find anything related from the first glance :(

> > +
> > +/*
> > + * This function is the only reason to have a copy of drm_fbdev_cma_init()
> > + * here in this driver.
> > + *
> > + * In its turn this mmap() is required to mark user-space page as non-cached
> > + * because it is just a mirror or real hardware frame-buffer.
> > + */
> > +static int arcpgu_mmap(struct fb_info *info, struct vm_area_struct *vma)
> > +{
> > +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> > +	return vm_iomap_memory(vma, info->fix.smem_start, info->fix.smem_len);
> > +}
> This looks very fishy, no other drm driver even bothers with providing an
> fb_mmap hook. What exactly do you need this for? Assuming you've mmapped
> your fbcon drm_framebuffer correctly for kernel access things should just
> work ...

Indeed for kernel there's non need to that hack. Kernel deals directly with HW
frame-buffer area (that address we get from gem->paddr). And so every byte written gets
picked up by PGU and is then rendered on the display.

But when user-space opens /dev/fb0 and mmaps() it deals with memory pages which
are by default (at least on ARC) marked as "cached". I.e. user-space application
(I use that nice demo app?https://github.com/qtproject/qt/blob/4.8/examples/qws/framebuffer/main.c)
deals with frame-buffer via data cache. And that has 2 problems:
?[1] Since no explicit cache flush gets executed some data is left in data cache,
? ? ?i.e. some parts of the picture never reaches real PGU.
? ? ?See what happens on display -?http://imgur.com/iAbnnx3
? ? ?Those missing lines are exactly those 32-byte missing cache lines.
?[2] Even if we manage to flush data somehow massive amount of data that goes
? ? ?through data cache (let's sat 1080p at 30Hz) will thrash it and as a result
? ? ?there will be no benefit for other cache users to use cache.

So we fix it simply marking pages mapped to user-space apps as uncached
that effectively routes all FB data directly to memry instead of polluting cache.

Hopefully that explanation makes sense.

-Alexey
