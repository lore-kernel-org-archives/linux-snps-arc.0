From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 4 Apr 2018 20:06:12 +0000
Subject: DRM_UDL and GPU under Xserver
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1522872371.4851.106.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hello,

We're trying to use DisplayLink USB2-to-HDMI adapter to render GPU-accelerated graphics.
Hardware setup is as simple as a devboard + DisplayLink adapter.
Devboards we use for this experiment are:
 * Wandboard Quad (based on IMX6 SoC with Vivante GPU) or
 * HSDK (based on Synopsys ARC HS38 SoC with Vivante GPU as well)

I'm sure any other board with DRM supported GPU will work, those we just used
as the very recent Linux kernels could be easily run on them both.

Basically the problem is UDL needs to be explicitly notified about new data
to be rendered on the screen compared to typical bit-streamers that infinitely
scan a dedicated buffer in memory.

In case of UDL there're just 2 ways for this notification:
 1) DRM_IOCTL_MODE_PAGE_FLIP that calls drm_crtc_funcs->page_flip()
 2) DRM_IOCTL_MODE_DIRTYFB that calls drm_framebuffer_funcs->dirty()

But neither of IOCTLs happen when we run Xserver with xf86-video-armada driver
(see http://git.arm.linux.org.uk/cgit/xf86-video-armada.git/log/?h=unstable-devel).

Is it something missing in Xserver or in UDL driver?

Regards,
Alexey
