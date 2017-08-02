From: daniel@ffwll.ch (Daniel Vetter)
Date: Wed, 2 Aug 2017 11:41:33 +0200
Subject: Please pull ARCPGU changes
In-Reply-To: <1501499465.6216.4.camel@synopsys.com>
References: <1501499465.6216.4.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170802094133.eethtbpa2okhz44f@phenom.ffwll.local>
To: linux-snps-arc@lists.infradead.org

On Mon, Jul 31, 2017@11:11:06AM +0000, Alexey Brodkin wrote:
> Hi Dave,
> 
> Could you please pull a couple of minor fixes for ARCPGU.
> These changes are based on today's drm-misc/drm-misc-next.

You can't send Dave a pull based on a random snapshot of drm-misc-next. If
you want to maintain your driver on top of drm-misc, then become part of
the group (arcgpu would fit imo). Otherwise you need to base your pulls on
top of Dave's tree. Also, your pull is missing the [PULL] tag in the
subject.
-Daniel

> 
> The following changes since commit 9dd2aca46a13cc7177625f0dc3aaf5b7ebc6fe74:
> 
> ? drm/rockchip: vop: rk3328: fix overlay abnormal (2017-07-31 08:44:18 +0800)
> 
> are available in the git repository at:
> 
> ? https://github.com/foss-for-synopsys-dwc-arc-processors/linux topic-arcpgu-updates
> 
> for you to fetch changes up to a8709950755748e9975d63faa624f2ba4b39f9d6:
> 
> ? drm: arcpgu: Allow some clock deviation in crtc->mode_valid() callback (2017-07-31 14:05:21 +0300)
> 
> ----------------------------------------------------------------
> Alexey Brodkin (2):
> ??????drm/arcpgu: Opt in debugfs
> ??????arcpgu: Simplify driver name
> 
> Jose Abreu (3):
> ??????drm: arcpgu: Fix mmap() callback
> ??????drm: arcpgu: Fix module unload
> ??????drm: arcpgu: Allow some clock deviation in crtc->mode_valid() callback
> 
> ?drivers/gpu/drm/arc/arcpgu_crtc.c |??7 ++++---
> ?drivers/gpu/drm/arc/arcpgu_drv.c??| 57 ++++++++++++++++++++++++++++++++-------------------------
> ?2 files changed, 36 insertions(+), 28 deletions(-)
> 
> Regards,
> Alexey
> _______________________________________________
> dri-devel mailing list
> dri-devel at lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
