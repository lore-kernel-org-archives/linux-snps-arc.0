From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 22 Apr 2016 14:53:48 +0000
Subject: [PATCH 0/4 v6] drm: Add support of ARC PGU display controller
In-Reply-To: <1461071980-5916-1-git-send-email-abrodkin@synopsys.com>
References: <1461071980-5916-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1461336820.3205.10.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi David,

On Tue, 2016-04-19@16:19 +0300, Alexey Brodkin wrote:
> This series add support of ARC PGU display controller.
> ARC PGU is a quite simple byte streamer that gets data from the framebuffer
> and pushes it to hte connected encoder (DP or HDMI).
> 
> It was tested on ARC SDP boards (axs101/103 in particular).
> 
> Note following series (v6) that introduces drm_connector_register_all()
> is a prerequisite now: https://lkml.org/lkml/2016/4/19/299
> 
> Changes v5 -> v6:
> ?* "arc: Add our own implementation of fb_pgprotect()" was already applied to
> ???ARC's tree and available in linux-next:
> ???http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=e5e0a65cd20a7a892a87e6bd73bdc3d83726d725
> 
> Changes v4 -> v5:
> ?* Removed encode node from DT bindings example (as suggested by Rob)
> 
> Changes v3 -> v4:
> ?* Main driver author is now set properly (thanks Carlos for all your efforts)
> ?* Implemented correct hsync and vsync setup (thanks Jose)
> ?* Dummy call-backs were removed (as suggested by Daniel)
> ?* Obsolete load()/unload() call-backs were removed (as suggested by Daniel)
> ?* With above in mind we were able to adopt recently introduced
> ???drm_connector_register_all()/drm_connector_unregister_all()
> ?* Implemented setup of properties (uncached) for FB user-pages
> ?* Minor clean-up in DT binding docs and axs10x_mb.dtsi
> 
> Changes v2 -> v3:
> ?* Improved failure path if arcpgu_connector wasn't allocated.
> ?* Fixed driver building as module.
> ?* Implemented uncached mapping of user-space FB pages.
> ?* Again updated DT bindings docs.
> 
> Changes v1 -> v2:
> ?* Clean-up of DT bindings documentation.
> ?* Added missing "pxlclk" clock in axs10x_mb.dtsi.

That's my first submission of a DRM driver and I'm wondering
which tree/branch should I use as a reference to rebase my
patches and send you a pull request?

Especially given there's a prerequisite which is still only in
linux-next:?http://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=54d2c2da0946368b96b63e6daed7920f3
681243e

Regards,
Alexey
