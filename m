From: daniel@ffwll.ch (Daniel Vetter)
Date: Mon, 14 Mar 2016 08:00:09 +0100
Subject: [PATCH 1/4 v3] drm: Add support of ARC PGU display controller
In-Reply-To: <1457710959-9562-2-git-send-email-abrodkin@synopsys.com>
References: <1457710959-9562-1-git-send-email-abrodkin@synopsys.com>
 <1457710959-9562-2-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160314070009.GN14170@phenom.ffwll.local>
To: linux-snps-arc@lists.infradead.org

On Fri, Mar 11, 2016@06:42:36PM +0300, Alexey Brodkin wrote:
> ARC PGU could be found on some development boards from Synopsys.
> This is a simple byte streamer that reads data from a framebuffer
> and sends data to the single encoder.
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: David Airlie <airlied at linux.ie>
> Cc: dri-devel at lists.freedesktop.org
> Cc: linux-snps-arc at lists.infradead.org
> Cc: Jose Abreu <joabreu at synopsys.com>
> ---
> 
> Changes v2 -> v3:
>  * Improved failure path if arcpgu_connector wasn't allocated (thanks Jose).
>  * Fixed driver building as module (reported by 0-DAY kernel test infrastruct.)
>  * Implemented uncached mapping of user-space FB pages.
> 
> No changes v1 -> v2.
> 

Bunch of comments below to update your driver to latest styles and best
practices.

Cheers, Daniel

>  drivers/gpu/drm/Kconfig            |   2 +
>  drivers/gpu/drm/Makefile           |   1 +
>  drivers/gpu/drm/arc/Kconfig        |  10 ++
>  drivers/gpu/drm/arc/Makefile       |   2 +
>  drivers/gpu/drm/arc/arcpgu.h       |  50 +++++++
>  drivers/gpu/drm/arc/arcpgu_crtc.c  | 274 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/arc/arcpgu_drv.c   | 252 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/arc/arcpgu_fbdev.c | 245 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/arc/arcpgu_hdmi.c  | 207 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/arc/arcpgu_regs.h  |  36 +++++
>  10 files changed, 1079 insertions(+)
>  create mode 100644 drivers/gpu/drm/arc/Kconfig
>  create mode 100644 drivers/gpu/drm/arc/Makefile
>  create mode 100644 drivers/gpu/drm/arc/arcpgu.h
>  create mode 100644 drivers/gpu/drm/arc/arcpgu_crtc.c
>  create mode 100644 drivers/gpu/drm/arc/arcpgu_drv.c
>  create mode 100644 drivers/gpu/drm/arc/arcpgu_fbdev.c
>  create mode 100644 drivers/gpu/drm/arc/arcpgu_hdmi.c
>  create mode 100644 drivers/gpu/drm/arc/arcpgu_regs.h
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index f2a74d0..9e4f2f1 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -281,3 +281,5 @@ source "drivers/gpu/drm/imx/Kconfig"
>  source "drivers/gpu/drm/vc4/Kconfig"
>  
>  source "drivers/gpu/drm/etnaviv/Kconfig"
> +
> +source "drivers/gpu/drm/arc/Kconfig"
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 6eb94fc..c338d04 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -78,3 +78,4 @@ obj-y			+= panel/
>  obj-y			+= bridge/
>  obj-$(CONFIG_DRM_FSL_DCU) += fsl-dcu/
>  obj-$(CONFIG_DRM_ETNAVIV) += etnaviv/
> +obj-$(CONFIG_DRM_ARCPGU)+= arc/
> diff --git a/drivers/gpu/drm/arc/Kconfig b/drivers/gpu/drm/arc/Kconfig
> new file mode 100644
> index 0000000..f9a13b6
> --- /dev/null
> +++ b/drivers/gpu/drm/arc/Kconfig
> @@ -0,0 +1,10 @@
> +config DRM_ARCPGU
> +	tristate "ARC PGU"
> +	depends on DRM && OF
> +	select DRM_KMS_CMA_HELPER
> +	select DRM_KMS_FB_HELPER
> +	select DRM_KMS_HELPER
> +	help
> +	  Choose this option if you have an ARC PGU controller.
> +
> +	  If M is selected the module will be called arcpgu.
> diff --git a/drivers/gpu/drm/arc/Makefile b/drivers/gpu/drm/arc/Makefile
> new file mode 100644
> index 0000000..736ee6f
> --- /dev/null
> +++ b/drivers/gpu/drm/arc/Makefile
> @@ -0,0 +1,2 @@
> +arcpgu-y := arcpgu_crtc.o arcpgu_hdmi.o arcpgu_fbdev.o arcpgu_drv.o
> +obj-$(CONFIG_DRM_ARCPGU) += arcpgu.o
> diff --git a/drivers/gpu/drm/arc/arcpgu.h b/drivers/gpu/drm/arc/arcpgu.h
> new file mode 100644
> index 0000000..86574b6
> --- /dev/null
> +++ b/drivers/gpu/drm/arc/arcpgu.h
> @@ -0,0 +1,50 @@
> +/*
> + * ARC PGU DRM driver.
> + *
> + * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#ifndef _ARCPGU_H_
> +#define _ARCPGU_H_
> +
> +struct arcpgu_drm_private {
> +	void __iomem		*regs;
> +	struct clk		*clk;
> +	struct drm_fbdev_cma	*fbdev;
> +	struct drm_framebuffer	*fb;
> +	struct list_head	event_list;
> +	struct drm_crtc		crtc;
> +	struct drm_plane	*plane;
> +};
> +
> +#define crtc_to_arcpgu_priv(x) container_of(x, struct arcpgu_drm_private, crtc)
> +
> +static inline void arc_pgu_write(struct arcpgu_drm_private *arcpgu,
> +				 unsigned int reg, u32 value)
> +{
> +	iowrite32(value, arcpgu->regs + reg);
> +}
> +
> +static inline u32 arc_pgu_read(struct arcpgu_drm_private *arcpgu,
> +			       unsigned int reg)
> +{
> +	return ioread32(arcpgu->regs + reg);
> +}
> +
> +int arc_pgu_setup_crtc(struct drm_device *dev);
> +int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np);
> +struct drm_fbdev_cma *arcpgu_fbdev_cma_init(struct drm_device *dev,
> +	unsigned int preferred_bpp, unsigned int num_crtc,
> +	unsigned int max_conn_count);
> +
> +#endif
> diff --git a/drivers/gpu/drm/arc/arcpgu_crtc.c b/drivers/gpu/drm/arc/arcpgu_crtc.c
> new file mode 100644
> index 0000000..0fe5c8a
> --- /dev/null
> +++ b/drivers/gpu/drm/arc/arcpgu_crtc.c
> @@ -0,0 +1,274 @@
> +/*
> + * ARC PGU DRM driver.
> + *
> + * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_plane_helper.h>
> +#include <linux/clk.h>
> +#include <linux/platform_data/simplefb.h>
> +
> +#include "arcpgu.h"
> +#include "arcpgu_regs.h"
> +
> +#define ENCODE_PGU_XY(x, y)	((((x) - 1) << 16) | ((y) - 1))
> +
> +static struct simplefb_format supported_formats[] = {
> +	{ "r5g6b5", 16, {11, 5}, {5, 6}, {0, 5}, {0, 0}, DRM_FORMAT_RGB565 },
> +	{ "r8g8b8", 24, {16, 8}, {8, 8}, {0, 8}, {0, 0}, DRM_FORMAT_RGB888 },
> +};
> +
> +static void arc_pgu_set_pxl_fmt(struct drm_crtc *crtc)
> +{
> +	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
> +	uint32_t pixel_format = crtc->primary->state->fb->pixel_format;
> +	struct simplefb_format *format = NULL;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(supported_formats); i++) {
> +		if (supported_formats[i].fourcc == pixel_format)
> +			format = &supported_formats[i];
> +	}
> +
> +	if (WARN_ON(!format))
> +		return;
> +
> +	if (format->fourcc == DRM_FORMAT_RGB888)
> +		arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
> +			      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) |
> +					   ARCPGU_MODE_RGB888_MASK);
> +
> +}
> +
> +static const struct drm_crtc_funcs arc_pgu_crtc_funcs = {
> +	.destroy = drm_crtc_cleanup,
> +	.set_config = drm_atomic_helper_set_config,
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.reset = drm_atomic_helper_crtc_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
> +};
> +
> +static void arc_pgu_crtc_mode_set_nofb(struct drm_crtc *crtc)
> +{
> +	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
> +	struct drm_display_mode *m = &crtc->state->adjusted_mode;
> +
> +	arc_pgu_write(arcpgu, ARCPGU_REG_FMT,
> +		      ENCODE_PGU_XY(m->crtc_htotal, m->crtc_vtotal));
> +
> +	arc_pgu_write(arcpgu, ARCPGU_REG_HSYNC,
> +		      ENCODE_PGU_XY(m->crtc_hsync_start - m->crtc_hdisplay,
> +				    m->crtc_hsync_end - m->crtc_hdisplay));
> +
> +	arc_pgu_write(arcpgu, ARCPGU_REG_VSYNC,
> +		      ENCODE_PGU_XY(m->crtc_vsync_start - m->crtc_vdisplay,
> +				    m->crtc_vsync_end - m->crtc_vdisplay));
> +
> +	arc_pgu_write(arcpgu, ARCPGU_REG_ACTIVE,
> +		      ENCODE_PGU_XY(m->crtc_hblank_end - m->crtc_hblank_start,
> +				    m->crtc_vblank_end - m->crtc_vblank_start));
> +
> +	arc_pgu_write(arcpgu, ARCPGU_REG_STRIDE, 0);
> +	arc_pgu_write(arcpgu, ARCPGU_REG_START_SET, 1);
> +
> +	arc_pgu_set_pxl_fmt(crtc);
> +
> +	clk_set_rate(arcpgu->clk, m->crtc_clock * 1000);
> +}
> +
> +static void arc_pgu_crtc_enable(struct drm_crtc *crtc)
> +{
> +	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
> +
> +	clk_prepare_enable(arcpgu->clk);
> +	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
> +		      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) |
> +		      ARCPGU_CTRL_ENABLE_MASK);
> +}
> +
> +static void arc_pgu_crtc_disable(struct drm_crtc *crtc)
> +{
> +	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
> +
> +	if (!crtc->primary->fb)
> +		return;
> +
> +	clk_disable_unprepare(arcpgu->clk);
> +	arc_pgu_write(arcpgu, ARCPGU_REG_CTRL,
> +			      arc_pgu_read(arcpgu, ARCPGU_REG_CTRL) &
> +			      ~ARCPGU_CTRL_ENABLE_MASK);
> +}
> +
> +static int arc_pgu_crtc_atomic_check(struct drm_crtc *crtc,
> +				     struct drm_crtc_state *state)
> +{
> +	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
> +	struct drm_display_mode *mode = &state->adjusted_mode;
> +	long rate, clk_rate = mode->clock * 1000;
> +
> +	rate = clk_round_rate(arcpgu->clk, clk_rate);
> +	if (rate != clk_rate)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static void arc_pgu_crtc_atomic_begin(struct drm_crtc *crtc,
> +				      struct drm_crtc_state *state)
> +{
> +	struct arcpgu_drm_private *arcpgu = crtc_to_arcpgu_priv(crtc);
> +	unsigned long flags;
> +
> +	if (crtc->state->event) {
> +		struct drm_pending_vblank_event *event = crtc->state->event;
> +
> +		crtc->state->event = NULL;
> +		event->pipe = drm_crtc_index(crtc);
> +
> +		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
> +
> +		spin_lock_irqsave(&crtc->dev->event_lock, flags);
> +		list_add_tail(&event->base.link, &arcpgu->event_list);
> +		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
> +	}
> +}
> +
> +static void arc_pgu_crtc_atomic_flush(struct drm_crtc *crtc,
> +				      struct drm_crtc_state *state)
> +{
> +}
> +
> +static bool arc_pgu_crtc_mode_fixup(struct drm_crtc *crtc,
> +				    const struct drm_display_mode *mode,
> +				    struct drm_display_mode *adjusted_mode)
> +{
> +	return true;
> +}

You can drop the above 2 dummy functions.

> +
> +static const struct drm_crtc_helper_funcs arc_pgu_crtc_helper_funcs = {
> +	.mode_fixup	= arc_pgu_crtc_mode_fixup,
> +	.mode_set	= drm_helper_crtc_mode_set,
> +	.mode_set_base	= drm_helper_crtc_mode_set_base,
> +	.mode_set_nofb	= arc_pgu_crtc_mode_set_nofb,
> +	.enable		= arc_pgu_crtc_enable,
> +	.disable	= arc_pgu_crtc_disable,
> +	.prepare	= arc_pgu_crtc_disable,
> +	.commit		= arc_pgu_crtc_enable,
> +	.atomic_check	= arc_pgu_crtc_atomic_check,
> +	.atomic_begin	= arc_pgu_crtc_atomic_begin,
> +	.atomic_flush	= arc_pgu_crtc_atomic_flush,
> +};
> +
> +static int arc_pgu_plane_atomic_check(struct drm_plane *plane,
> +				      struct drm_plane_state *state)
> +{
> +	return 0;
> +}

You don't need dummy functions for this.

> +
> +static void arc_pgu_plane_atomic_update(struct drm_plane *plane,
> +					struct drm_plane_state *state)
> +{
> +	struct arcpgu_drm_private *arcpgu;
> +	struct drm_gem_cma_object *gem;
> +
> +	if (!plane->state->crtc || !plane->state->fb)
> +		return;
> +
> +	arcpgu = crtc_to_arcpgu_priv(plane->state->crtc);
> +	gem = drm_fb_cma_get_gem_obj(plane->state->fb, 0);
> +	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->paddr);
> +}
> +
> +static const struct drm_plane_helper_funcs arc_pgu_plane_helper_funcs = {
> +	.prepare_fb = NULL,
> +	.cleanup_fb = NULL,
> +	.atomic_check = arc_pgu_plane_atomic_check,
> +	.atomic_update = arc_pgu_plane_atomic_update,
> +};
> +
> +static void arc_pgu_plane_destroy(struct drm_plane *plane)
> +{
> +	drm_plane_helper_disable(plane);
> +	drm_plane_cleanup(plane);
> +}
> +
> +static const struct drm_plane_funcs arc_pgu_plane_funcs = {
> +	.update_plane		= drm_atomic_helper_update_plane,
> +	.disable_plane		= drm_atomic_helper_disable_plane,
> +	.destroy		= arc_pgu_plane_destroy,
> +	.reset			= drm_atomic_helper_plane_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
> +};
> +
> +static struct drm_plane *arc_pgu_plane_init(struct drm_device *drm)
> +{
> +	struct arcpgu_drm_private *arcpgu = drm->dev_private;
> +	struct drm_plane *plane = NULL;
> +	u32 formats[ARRAY_SIZE(supported_formats)], i;
> +	int ret;
> +
> +	plane = devm_kzalloc(drm->dev, sizeof(*plane), GFP_KERNEL);
> +	if (!plane)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i = 0; i < ARRAY_SIZE(supported_formats); i++)
> +		formats[i] = supported_formats[i].fourcc;
> +
> +	ret = drm_universal_plane_init(drm, plane, 0xff, &arc_pgu_plane_funcs,
> +				       formats, ARRAY_SIZE(formats),
> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	drm_plane_helper_add(plane, &arc_pgu_plane_helper_funcs);
> +	arcpgu->plane = plane;
> +
> +	return plane;
> +}
> +
> +void arc_pgu_crtc_suspend(struct drm_crtc *crtc)
> +{
> +	arc_pgu_crtc_disable(crtc);
> +}
> +
> +void arc_pgu_crtc_resume(struct drm_crtc *crtc)
> +{
> +	arc_pgu_crtc_enable(crtc);
> +}

Please use the atomic suspend/resume helper that Thierry recently merged.
See the kerneldoc of drm_atomic_helper_suspend as a starting point for how
it works and how it's supposed to be used.

> +
> +int arc_pgu_setup_crtc(struct drm_device *drm)
> +{
> +	struct arcpgu_drm_private *arcpgu = drm->dev_private;
> +	struct drm_plane *primary;
> +	int ret;
> +
> +	primary = arc_pgu_plane_init(drm);
> +	if (IS_ERR(primary))
> +		return PTR_ERR(primary);
> +
> +	ret = drm_crtc_init_with_planes(drm, &arcpgu->crtc, primary, NULL,
> +					&arc_pgu_crtc_funcs, NULL);
> +	if (ret) {
> +		arc_pgu_plane_destroy(primary);
> +		return ret;
> +	}
> +
> +	drm_crtc_helper_add(&arcpgu->crtc, &arc_pgu_crtc_helper_funcs);
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
> new file mode 100644
> index 0000000..d47481d
> --- /dev/null
> +++ b/drivers/gpu/drm/arc/arcpgu_drv.c
> @@ -0,0 +1,252 @@
> +/*
> + * ARC PGU DRM driver.
> + *
> + * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#include <linux/clk.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_atomic_helper.h>
> +
> +#include "arcpgu.h"
> +#include "arcpgu_regs.h"
> +
> +static void arcpgu_fb_output_poll_changed(struct drm_device *dev)
> +{
> +	struct arcpgu_drm_private *arcpgu = dev->dev_private;
> +
> +	if (arcpgu->fbdev)
> +		drm_fbdev_cma_hotplug_event(arcpgu->fbdev);
> +}
> +
> +static int arcpgu_atomic_commit(struct drm_device *dev,
> +				    struct drm_atomic_state *state, bool async)
> +{
> +	return drm_atomic_helper_commit(dev, state, false);

Note that this isn't really async if you ever get around to implement
fence support or vblank support. Just fyi.

> +}
> +
> +static struct drm_mode_config_funcs arcpgu_drm_modecfg_funcs = {
> +	.fb_create  = drm_fb_cma_create,
> +	.output_poll_changed = arcpgu_fb_output_poll_changed,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = arcpgu_atomic_commit,
> +};
> +
> +static void arcpgu_setup_mode_config(struct drm_device *drm)
> +{
> +	drm_mode_config_init(drm);
> +	drm->mode_config.min_width = 0;
> +	drm->mode_config.min_height = 0;
> +	drm->mode_config.max_width = 1920;
> +	drm->mode_config.max_height = 1080;
> +	drm->mode_config.funcs = &arcpgu_drm_modecfg_funcs;
> +}
> +
> +int arcpgu_gem_mmap(struct file *filp, struct vm_area_struct *vma)
> +{
> +	int ret;
> +
> +	ret = drm_gem_mmap(filp, vma);
> +	if (ret)
> +		return ret;
> +
> +	vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
> +	return 0;
> +}
> +
> +static const struct file_operations arcpgu_drm_ops = {
> +	.owner = THIS_MODULE,
> +	.open = drm_open,
> +	.release = drm_release,
> +	.unlocked_ioctl = drm_ioctl,
> +#ifdef CONFIG_COMPAT
> +	.compat_ioctl = drm_compat_ioctl,
> +#endif
> +	.poll = drm_poll,
> +	.read = drm_read,
> +	.llseek = no_llseek,
> +	.mmap = arcpgu_gem_mmap,
> +};
> +
> +static void arcpgu_preclose(struct drm_device *drm, struct drm_file *file)
> +{
> +	struct arcpgu_drm_private *arcpgu = drm->dev_private;
> +	struct drm_pending_vblank_event *e, *t;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&drm->event_lock, flags);
> +	list_for_each_entry_safe(e, t, &arcpgu->event_list, base.link) {
> +		if (e->base.file_priv != file)
> +			continue;
> +		list_del(&e->base.link);
> +		e->base.destroy(&e->base);
> +	}
> +	spin_unlock_irqrestore(&drm->event_lock, flags);
> +}
> +
> +static void arcpgu_lastclose(struct drm_device *drm)
> +{
> +	struct arcpgu_drm_private *arcpgu = drm->dev_private;
> +
> +	drm_fbdev_cma_restore_mode(arcpgu->fbdev);
> +}
> +
> +static int arcpgu_load(struct drm_device *drm, unsigned long flags)
> +{
> +	struct platform_device *pdev = drm->platformdev;
> +	struct arcpgu_drm_private *arcpgu;
> +	struct device_node *encoder_node;
> +	struct resource *res;
> +	int ret;
> +
> +	arcpgu = devm_kzalloc(&pdev->dev, sizeof(*arcpgu), GFP_KERNEL);
> +	if (arcpgu == NULL)
> +		return -ENOMEM;
> +
> +	drm->dev_private = arcpgu;
> +
> +	arcpgu->clk = devm_clk_get(drm->dev, "pxlclk");
> +	if (IS_ERR(arcpgu->clk))
> +		return PTR_ERR(arcpgu->clk);
> +
> +	INIT_LIST_HEAD(&arcpgu->event_list);
> +
> +	arcpgu_setup_mode_config(drm);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	arcpgu->regs = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(arcpgu->regs)) {
> +		dev_err(drm->dev, "Could not remap IO mem\n");
> +		return PTR_ERR(arcpgu->regs);
> +	}
> +
> +	dev_info(drm->dev, "arc_pgu ID: 0x%x\n",
> +		 arc_pgu_read(arcpgu, ARCPGU_REG_ID));
> +
> +	if (dma_set_mask_and_coherent(drm->dev, DMA_BIT_MASK(32)))
> +		return -ENODEV;
> +
> +	if (arc_pgu_setup_crtc(drm) < 0)
> +		return -ENODEV;
> +
> +	/* find the encoder node and initialize it */
> +	encoder_node = of_parse_phandle(drm->dev->of_node, "encoder-slave", 0);
> +	if (!encoder_node) {
> +		dev_err(drm->dev, "failed to get an encoder slave node\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = arcpgu_drm_hdmi_init(drm, encoder_node);
> +	if (ret < 0)
> +		return ret;
> +
> +	drm_mode_config_reset(drm);
> +	drm_kms_helper_poll_init(drm);
> +
> +	arcpgu->fbdev = arcpgu_fbdev_cma_init(drm, 16,
> +					      drm->mode_config.num_crtc,
> +					      drm->mode_config.num_connector);
> +	if (IS_ERR(arcpgu->fbdev)) {
> +		ret = PTR_ERR(arcpgu->fbdev);
> +		arcpgu->fbdev = NULL;
> +		return -ENODEV;
> +	}
> +
> +	platform_set_drvdata(pdev, arcpgu);
> +	return 0;
> +}
> +
> +int arcpgu_unload(struct drm_device *drm)
> +{
> +	struct arcpgu_drm_private *arcpgu = drm->dev_private;
> +
> +	if (arcpgu->fbdev) {
> +		drm_fbdev_cma_fini(arcpgu->fbdev);
> +		arcpgu->fbdev = NULL;
> +	}
> +	drm_kms_helper_poll_fini(drm);
> +	drm_vblank_cleanup(drm);
> +	drm_mode_config_cleanup(drm);
> +
> +	return 0;
> +}
> +
> +static struct drm_driver arcpgu_drm_driver = {
> +	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME |
> +			   DRIVER_ATOMIC,
> +	.preclose = arcpgu_preclose,
> +	.lastclose = arcpgu_lastclose,
> +	.name = "drm-arcpgu",
> +	.desc = "ARC PGU Controller",
> +	.date = "20160219",
> +	.major = 1,
> +	.minor = 0,
> +	.patchlevel = 0,
> +	.fops = &arcpgu_drm_ops,
> +	.load = arcpgu_load,
> +	.unload = arcpgu_unload,

Load and unload hooks are deprecated (it's a classic midlayer mistake).
Please use drm_dev_alloc/register pairs directly instead, and put your
device setup code in-between. Similar for unloading. There's a bunch of
example drivers converted already.

> +	.dumb_create = drm_gem_cma_dumb_create,
> +	.dumb_map_offset = drm_gem_cma_dumb_map_offset,
> +	.dumb_destroy = drm_gem_dumb_destroy,
> +	.get_vblank_counter = drm_vblank_no_hw_counter,
> +	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
> +	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> +	.gem_free_object = drm_gem_cma_free_object,
> +	.gem_vm_ops = &drm_gem_cma_vm_ops,
> +	.gem_prime_export = drm_gem_prime_export,
> +	.gem_prime_import = drm_gem_prime_import,
> +	.gem_prime_get_sg_table = drm_gem_cma_prime_get_sg_table,
> +	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
> +	.gem_prime_vmap = drm_gem_cma_prime_vmap,
> +	.gem_prime_vunmap = drm_gem_cma_prime_vunmap,
> +	.gem_prime_mmap = drm_gem_cma_prime_mmap,
> +};
> +
> +static int arcpgu_probe(struct platform_device *pdev)
> +{
> +	return drm_platform_init(&arcpgu_drm_driver, pdev);

... or read the kerneldoc of this function, which also explains what you
should do ;-)

> +}
> +
> +static int arcpgu_remove(struct platform_device *pdev)
> +{
> +	struct drm_device *drm = dev_get_drvdata(&pdev->dev);
> +
> +	drm_put_dev(drm);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id arcpgu_of_table[] = {
> +	{.compatible = "snps,arcpgu"},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(of, arcpgu_of_table);
> +
> +static struct platform_driver arcpgu_platform_driver = {
> +	.probe = arcpgu_probe,
> +	.remove = arcpgu_remove,
> +	.driver = {
> +		   .name = "arcpgu",
> +		   .owner = THIS_MODULE,
> +		   .of_match_table = arcpgu_of_table,
> +		   },
> +};
> +
> +module_platform_driver(arcpgu_platform_driver);
> +
> +MODULE_AUTHOR("Carlos Palminha <palminha at synopsys.com");
> +MODULE_DESCRIPTION("ARC PGU DRM driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/gpu/drm/arc/arcpgu_fbdev.c b/drivers/gpu/drm/arc/arcpgu_fbdev.c
> new file mode 100644
> index 0000000..6f67706
> --- /dev/null
> +++ b/drivers/gpu/drm/arc/arcpgu_fbdev.c
> @@ -0,0 +1,245 @@
> +/*
> + * ARC PGU DRM driver.
> + *
> + * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +
> +struct drm_fb_cma {
> +	struct drm_framebuffer		fb;
> +	struct drm_gem_cma_object	*obj[4];
> +};
> +
> +struct drm_fbdev_cma {
> +	struct drm_fb_helper	fb_helper;
> +	struct drm_fb_cma	*fb;
> +};
> +
> +static inline struct drm_fbdev_cma *to_fbdev_cma(struct drm_fb_helper *helper)
> +{
> +	return container_of(helper, struct drm_fbdev_cma, fb_helper);
> +}
> +
> +static inline struct drm_fb_cma *to_fb_cma(struct drm_framebuffer *fb)
> +{
> +	return container_of(fb, struct drm_fb_cma, fb);
> +}
> +
> +static void drm_fb_cma_destroy(struct drm_framebuffer *fb)
> +{
> +	struct drm_fb_cma *fb_cma = to_fb_cma(fb);
> +	int i;
> +
> +	for (i = 0; i < 4; i++) {
> +		if (fb_cma->obj[i])
> +			drm_gem_object_unreference_unlocked(&fb_cma->obj[i]->base);
> +	}
> +
> +	drm_framebuffer_cleanup(fb);
> +	kfree(fb_cma);
> +}
> +
> +static int drm_fb_cma_create_handle(struct drm_framebuffer *fb,
> +	struct drm_file *file_priv, unsigned int *handle)
> +{
> +	struct drm_fb_cma *fb_cma = to_fb_cma(fb);
> +
> +	return drm_gem_handle_create(file_priv,
> +			&fb_cma->obj[0]->base, handle);
> +}
> +
> +static struct drm_framebuffer_funcs drm_fb_cma_funcs = {
> +	.destroy	= drm_fb_cma_destroy,
> +	.create_handle	= drm_fb_cma_create_handle,
> +};
> +
> +static struct drm_fb_cma *drm_fb_cma_alloc(struct drm_device *dev,
> +	const struct drm_mode_fb_cmd2 *mode_cmd,
> +	struct drm_gem_cma_object **obj,
> +	unsigned int num_planes)
> +{
> +	struct drm_fb_cma *fb_cma;
> +	int ret;
> +	int i;
> +
> +	fb_cma = kzalloc(sizeof(*fb_cma), GFP_KERNEL);
> +	if (!fb_cma)
> +		return ERR_PTR(-ENOMEM);
> +
> +	drm_helper_mode_fill_fb_struct(&fb_cma->fb, mode_cmd);
> +
> +	for (i = 0; i < num_planes; i++)
> +		fb_cma->obj[i] = obj[i];
> +
> +	ret = drm_framebuffer_init(dev, &fb_cma->fb, &drm_fb_cma_funcs);
> +	if (ret) {
> +		dev_err(dev->dev, "Failed to initialize framebuffer: %d\n", ret);
> +		kfree(fb_cma);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return fb_cma;
> +}
> +
> +/*
> + * This function is the only reason to have a copy of drm_fbdev_cma_init()
> + * here in this driver.
> + *
> + * In its turn this mmap() is required to mark user-space page as non-cached
> + * because it is just a mirror or real hardware frame-buffer.
> + */
> +static int arcpgu_mmap(struct fb_info *info, struct vm_area_struct *vma)
> +{
> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> +	return vm_iomap_memory(vma, info->fix.smem_start, info->fix.smem_len);
> +}

This looks very fishy, no other drm driver even bothers with providing an
fb_mmap hook. What exactly do you need this for? Assuming you've mmapped
your fbcon drm_framebuffer correctly for kernel access things should just
work ...

> +
> +static struct fb_ops drm_fbdev_cma_ops = {
> +	.owner		= THIS_MODULE,
> +	.fb_mmap	= arcpgu_mmap,
> +	.fb_fillrect	= drm_fb_helper_sys_fillrect,
> +	.fb_copyarea	= drm_fb_helper_sys_copyarea,
> +	.fb_imageblit	= drm_fb_helper_sys_imageblit,
> +	.fb_check_var	= drm_fb_helper_check_var,
> +	.fb_set_par	= drm_fb_helper_set_par,
> +	.fb_blank	= drm_fb_helper_blank,
> +	.fb_pan_display	= drm_fb_helper_pan_display,
> +	.fb_setcmap	= drm_fb_helper_setcmap,
> +};
> +
> +static int drm_fbdev_cma_create(struct drm_fb_helper *helper,
> +	struct drm_fb_helper_surface_size *sizes)
> +{
> +	struct drm_fbdev_cma *fbdev_cma = to_fbdev_cma(helper);
> +	struct drm_mode_fb_cmd2 mode_cmd = { 0 };
> +	struct drm_device *dev = helper->dev;
> +	struct drm_gem_cma_object *obj;
> +	struct drm_framebuffer *fb;
> +	unsigned int bytes_per_pixel;
> +	unsigned long offset;
> +	struct fb_info *fbi;
> +	size_t size;
> +	int ret;
> +
> +	DRM_DEBUG_KMS("surface width(%d), height(%d) and bpp(%d)\n",
> +			sizes->surface_width, sizes->surface_height,
> +			sizes->surface_bpp);
> +
> +	bytes_per_pixel = DIV_ROUND_UP(sizes->surface_bpp, 8);
> +
> +	mode_cmd.width = sizes->surface_width;
> +	mode_cmd.height = sizes->surface_height;
> +	mode_cmd.pitches[0] = sizes->surface_width * bytes_per_pixel;
> +	mode_cmd.pixel_format = drm_mode_legacy_fb_format(sizes->surface_bpp,
> +		sizes->surface_depth);
> +
> +	size = mode_cmd.pitches[0] * mode_cmd.height;
> +	obj = drm_gem_cma_create(dev, size);
> +	if (IS_ERR(obj))
> +		return -ENOMEM;
> +
> +	fbi = drm_fb_helper_alloc_fbi(helper);
> +	if (IS_ERR(fbi)) {
> +		ret = PTR_ERR(fbi);
> +		goto err_gem_free_object;
> +	}
> +
> +	fbdev_cma->fb = drm_fb_cma_alloc(dev, &mode_cmd, &obj, 1);
> +	if (IS_ERR(fbdev_cma->fb)) {
> +		dev_err(dev->dev, "Failed to allocate DRM framebuffer.\n");
> +		ret = PTR_ERR(fbdev_cma->fb);
> +		goto err_fb_info_destroy;
> +	}
> +
> +	fb = &fbdev_cma->fb->fb;
> +	helper->fb = fb;
> +
> +	fbi->par = helper;
> +	fbi->flags = FBINFO_FLAG_DEFAULT;
> +	fbi->fbops = &drm_fbdev_cma_ops;
> +
> +	drm_fb_helper_fill_fix(fbi, fb->pitches[0], fb->depth);
> +	drm_fb_helper_fill_var(fbi, helper, sizes->fb_width, sizes->fb_height);
> +
> +	offset = fbi->var.xoffset * bytes_per_pixel;
> +	offset += fbi->var.yoffset * fb->pitches[0];
> +
> +	dev->mode_config.fb_base = (resource_size_t)obj->paddr;
> +	fbi->screen_base = obj->vaddr + offset;
> +	fbi->fix.smem_start = (unsigned long)(obj->paddr + offset);
> +	fbi->screen_size = size;
> +	fbi->fix.smem_len = size;
> +
> +	return 0;
> +
> +err_fb_info_destroy:
> +	drm_fb_helper_release_fbi(helper);
> +err_gem_free_object:
> +	dev->driver->gem_free_object(&obj->base);
> +	return ret;
> +}
> +
> +static const struct drm_fb_helper_funcs drm_fb_cma_helper_funcs = {
> +	.fb_probe = drm_fbdev_cma_create,
> +};
> +
> +struct drm_fbdev_cma *arcpgu_fbdev_cma_init(struct drm_device *dev,
> +	unsigned int preferred_bpp, unsigned int num_crtc,
> +	unsigned int max_conn_count)
> +{
> +	struct drm_fbdev_cma *fbdev_cma;
> +	struct drm_fb_helper *helper;
> +	int ret;
> +
> +	fbdev_cma = kzalloc(sizeof(*fbdev_cma), GFP_KERNEL);
> +	if (!fbdev_cma) {
> +		dev_err(dev->dev, "Failed to allocate drm fbdev.\n");
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	helper = &fbdev_cma->fb_helper;
> +
> +	drm_fb_helper_prepare(dev, helper, &drm_fb_cma_helper_funcs);
> +
> +	ret = drm_fb_helper_init(dev, helper, num_crtc, max_conn_count);
> +	if (ret < 0) {
> +		dev_err(dev->dev, "Failed to initialize drm fb helper.\n");
> +		goto err_free;
> +	}
> +
> +	ret = drm_fb_helper_single_add_all_connectors(helper);
> +	if (ret < 0) {
> +		dev_err(dev->dev, "Failed to add connectors.\n");
> +		goto err_drm_fb_helper_fini;
> +
> +	}
> +
> +	ret = drm_fb_helper_initial_config(helper, preferred_bpp);
> +	if (ret < 0) {
> +		dev_err(dev->dev, "Failed to set initial hw configuration.\n");
> +		goto err_drm_fb_helper_fini;
> +	}
> +
> +	return fbdev_cma;
> +
> +err_drm_fb_helper_fini:
> +	drm_fb_helper_fini(helper);
> +err_free:
> +	kfree(fbdev_cma);
> +
> +	return ERR_PTR(ret);
> +}
> diff --git a/drivers/gpu/drm/arc/arcpgu_hdmi.c b/drivers/gpu/drm/arc/arcpgu_hdmi.c
> new file mode 100644
> index 0000000..7adafa3
> --- /dev/null
> +++ b/drivers/gpu/drm/arc/arcpgu_hdmi.c
> @@ -0,0 +1,207 @@
> +/*
> + * ARC PGU DRM driver.
> + *
> + * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_encoder_slave.h>
> +#include <drm/drm_atomic_helper.h>
> +
> +#include "arcpgu.h"
> +
> +struct arcpgu_drm_connector {
> +	struct drm_connector connector;
> +	struct drm_encoder_slave *encoder_slave;
> +};
> +
> +static int arcpgu_drm_connector_get_modes(struct drm_connector *connector)
> +{
> +	const struct drm_encoder_slave_funcs *sfuncs;
> +	struct drm_encoder_slave *slave;
> +	struct arcpgu_drm_connector *con =
> +		container_of(connector, struct arcpgu_drm_connector, connector);
> +
> +	slave = con->encoder_slave;
> +	if (slave == NULL) {
> +		dev_err(connector->dev->dev,
> +			"connector_get_modes: cannot find slave encoder for connector\n");
> +		return 0;
> +	}
> +
> +	sfuncs = slave->slave_funcs;
> +	if (sfuncs->get_modes == NULL)
> +		return 0;
> +
> +	return sfuncs->get_modes(&slave->base, connector);
> +}
> +
> +struct drm_encoder *
> +arcpgu_drm_connector_best_encoder(struct drm_connector *connector)
> +{
> +	struct drm_encoder_slave *slave;
> +	struct arcpgu_drm_connector *con =
> +		container_of(connector, struct arcpgu_drm_connector, connector);
> +
> +	slave = con->encoder_slave;
> +	if (slave == NULL) {
> +		dev_err(connector->dev->dev,
> +			"connector_best_encoder: cannot find slave encoder for connector\n");
> +		return NULL;
> +	}
> +
> +	return &slave->base;
> +}
> +
> +static enum drm_connector_status
> +arcpgu_drm_connector_detect(struct drm_connector *connector, bool force)
> +{
> +	enum drm_connector_status status = connector_status_unknown;
> +	const struct drm_encoder_slave_funcs *sfuncs;
> +	struct drm_encoder_slave *slave;
> +
> +	struct arcpgu_drm_connector *con =
> +		container_of(connector, struct arcpgu_drm_connector, connector);
> +
> +	slave = con->encoder_slave;
> +	if (slave == NULL) {
> +		dev_err(connector->dev->dev,
> +			"connector_detect: cannot find slave encoder for connector\n");
> +		return status;
> +	}
> +
> +	sfuncs = slave->slave_funcs;
> +	if (sfuncs && sfuncs->detect)
> +		return sfuncs->detect(&slave->base, connector);
> +
> +	dev_err(connector->dev->dev, "connector_detect: could not detect slave funcs\n");
> +	return status;
> +}
> +
> +static void arcpgu_drm_connector_destroy(struct drm_connector *connector)
> +{
> +	drm_connector_unregister(connector);
> +	drm_connector_cleanup(connector);
> +}
> +
> +static const struct drm_connector_helper_funcs
> +arcpgu_drm_connector_helper_funcs = {
> +	.get_modes = arcpgu_drm_connector_get_modes,
> +	.best_encoder = arcpgu_drm_connector_best_encoder,
> +};
> +
> +static const struct drm_connector_funcs arcpgu_drm_connector_funcs = {
> +	.dpms = drm_helper_connector_dpms,
> +	.reset = drm_atomic_helper_connector_reset,
> +	.detect = arcpgu_drm_connector_detect,
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = arcpgu_drm_connector_destroy,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static struct drm_encoder_helper_funcs arcpgu_drm_encoder_helper_funcs = {
> +	.dpms = drm_i2c_encoder_dpms,
> +	.mode_fixup = drm_i2c_encoder_mode_fixup,
> +	.mode_set = drm_i2c_encoder_mode_set,
> +	.prepare = drm_i2c_encoder_prepare,
> +	.commit = drm_i2c_encoder_commit,
> +	.detect = drm_i2c_encoder_detect,
> +};
> +
> +static struct drm_encoder_funcs arcpgu_drm_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
> +int arcpgu_drm_hdmi_init(struct drm_device *drm, struct device_node *np)
> +{
> +	struct arcpgu_drm_connector *arcpgu_connector;
> +	struct drm_i2c_encoder_driver *driver;
> +	struct drm_encoder_slave *encoder;
> +	struct drm_connector *connector;
> +	struct i2c_client *i2c_slave;
> +	int ret;
> +
> +	encoder = devm_kzalloc(drm->dev, sizeof(*encoder), GFP_KERNEL);
> +	if (encoder == NULL)
> +		return -ENOMEM;
> +
> +	i2c_slave = of_find_i2c_device_by_node(np);
> +	if (!i2c_slave || !i2c_get_clientdata(i2c_slave)) {
> +		dev_err(drm->dev, "failed to find i2c slave encoder\n");
> +		return -EPROBE_DEFER;
> +	}
> +
> +	if (i2c_slave->dev.driver == NULL) {
> +		dev_err(drm->dev, "failed to find i2c slave driver\n");
> +		return -EPROBE_DEFER;
> +	}
> +
> +	driver =
> +	    to_drm_i2c_encoder_driver(to_i2c_driver(i2c_slave->dev.driver));
> +	ret = driver->encoder_init(i2c_slave, drm, encoder);
> +	if (ret) {
> +		dev_err(drm->dev, "failed to initialize i2c encoder slave\n");
> +		return ret;
> +	}
> +
> +	encoder->base.possible_crtcs = 1;
> +	encoder->base.possible_clones = 0;
> +	ret = drm_encoder_init(drm, &encoder->base, &arcpgu_drm_encoder_funcs,
> +			       DRM_MODE_ENCODER_TMDS, NULL);
> +	if (ret)
> +		return ret;
> +
> +	drm_encoder_helper_add(&encoder->base,
> +			       &arcpgu_drm_encoder_helper_funcs);
> +
> +	arcpgu_connector = devm_kzalloc(drm->dev, sizeof(*arcpgu_connector),
> +					GFP_KERNEL);
> +	if (!arcpgu_connector) {
> +		ret = -ENOMEM;
> +		goto error_encoder_cleanup;
> +	}
> +
> +	connector = &arcpgu_connector->connector;
> +	drm_connector_helper_add(connector, &arcpgu_drm_connector_helper_funcs);
> +	ret = drm_connector_init(drm, connector, &arcpgu_drm_connector_funcs,
> +			DRM_MODE_CONNECTOR_HDMIA);
> +	if (ret < 0) {
> +		dev_err(drm->dev, "failed to initialize drm connector\n");
> +		goto error_encoder_cleanup;
> +	}
> +
> +	ret = drm_connector_register(connector);
> +	if (ret < 0) {
> +		dev_err(drm->dev, "failed to regiter DRM connector and helper funcs\n");
> +		goto error_connector_cleanup;
> +	}
> +
> +	ret = drm_mode_connector_attach_encoder(connector, &encoder->base);
> +	if (ret < 0) {
> +		dev_err(drm->dev, "could not attach connector to encoder\n");
> +		drm_connector_unregister(connector);
> +		goto error_connector_cleanup;
> +	}
> +
> +	arcpgu_connector->encoder_slave = encoder;
> +
> +	return 0;
> +
> +error_connector_cleanup:
> +	drm_connector_cleanup(connector);
> +
> +error_encoder_cleanup:
> +	drm_encoder_cleanup(&encoder->base);
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/arc/arcpgu_regs.h b/drivers/gpu/drm/arc/arcpgu_regs.h
> new file mode 100644
> index 0000000..f04165f
> --- /dev/null
> +++ b/drivers/gpu/drm/arc/arcpgu_regs.h
> @@ -0,0 +1,36 @@
> +/*
> + * ARC PGU DRM driver.
> + *
> + * Copyright (C) 2016 Synopsys, Inc. (www.synopsys.com)
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#ifndef _ARC_PGU_REGS_H_
> +#define _ARC_PGU_REGS_H_
> +
> +#define ARCPGU_REG_CTRL		0x00
> +#define ARCPGU_REG_STAT		0x04
> +#define ARCPGU_REG_FMT		0x10
> +#define ARCPGU_REG_HSYNC	0x14
> +#define ARCPGU_REG_VSYNC	0x18
> +#define ARCPGU_REG_ACTIVE	0x1c
> +#define ARCPGU_REG_BUF0_ADDR	0x40
> +#define ARCPGU_REG_STRIDE	0x50
> +#define ARCPGU_REG_START_SET	0x84
> +
> +#define ARCPGU_REG_ID		0x3FC
> +
> +#define ARCPGU_CTRL_ENABLE_MASK	0x02
> +#define ARCPGU_MODE_RGB888_MASK	0x04
> +#define ARCPGU_STAT_BUSY_MASK	0x02
> +
> +#endif
> -- 
> 2.5.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel at lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
