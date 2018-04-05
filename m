From: daniel.vetter@ffwll.ch (Daniel Vetter)
Date: Thu, 5 Apr 2018 08:18:29 +0200
Subject: DRM_UDL and GPU under Xserver
In-Reply-To: <1522872371.4851.106.camel@synopsys.com>
References: <1522872371.4851.106.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAKMK7uG1_B-r+XxVzMusMOBd=udhp8EdL59f375AG5+MO02O4g@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Wed, Apr 4, 2018 at 10:06 PM, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
> Hello,
>
> We're trying to use DisplayLink USB2-to-HDMI adapter to render GPU-accelerated graphics.
> Hardware setup is as simple as a devboard + DisplayLink adapter.
> Devboards we use for this experiment are:
>  * Wandboard Quad (based on IMX6 SoC with Vivante GPU) or
>  * HSDK (based on Synopsys ARC HS38 SoC with Vivante GPU as well)
>
> I'm sure any other board with DRM supported GPU will work, those we just used
> as the very recent Linux kernels could be easily run on them both.
>
> Basically the problem is UDL needs to be explicitly notified about new data
> to be rendered on the screen compared to typical bit-streamers that infinitely
> scan a dedicated buffer in memory.
>
> In case of UDL there're just 2 ways for this notification:
>  1) DRM_IOCTL_MODE_PAGE_FLIP that calls drm_crtc_funcs->page_flip()
>  2) DRM_IOCTL_MODE_DIRTYFB that calls drm_framebuffer_funcs->dirty()
>
> But neither of IOCTLs happen when we run Xserver with xf86-video-armada driver
> (see http://git.arm.linux.org.uk/cgit/xf86-video-armada.git/log/?h=unstable-devel).
>
> Is it something missing in Xserver or in UDL driver?

Use the -modesetting driverr for UDL, that one works correctly.
Kernel-driver specific X drivers are kinda deprecated, and stuff like
this (and other bugfixes and improvements that don't propagate around)
are the reason for that.
-Daniel

>
> Regards,
> Alexey
>
>
>
>
>



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
