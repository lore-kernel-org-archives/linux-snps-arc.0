From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 5 Apr 2018 11:10:03 +0000
Subject: DRM_UDL and GPU under Xserver
In-Reply-To: <CAKMK7uF1syoNga8wKect9E0oet2fVaj9XWFE5AA6Pu4ND56HVQ@mail.gmail.com>
References: <1522872371.4851.106.camel@synopsys.com>
 <CAKMK7uG1_B-r+XxVzMusMOBd=udhp8EdL59f375AG5+MO02O4g@mail.gmail.com>
 <1522912595.4577.5.camel@synopsys.com>
 <CAKMK7uE5HHDCQ5=t5Z2TcheZd7etREUoHmTVK=q3wxMdSMZK5w@mail.gmail.com>
 <1522924162.3779.16.camel@pengutronix.de>
 <CAKMK7uF1syoNga8wKect9E0oet2fVaj9XWFE5AA6Pu4ND56HVQ@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1522926602.4587.10.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Daniel, Lucas,

On Thu, 2018-04-05@12:59 +0200, Daniel Vetter wrote:
> On Thu, Apr 5, 2018@12:29 PM, Lucas Stach <l.stach@pengutronix.de> wrote:
> > Am Donnerstag, den 05.04.2018, 11:32 +0200 schrieb Daniel Vetter:
> > > On Thu, Apr 5, 2018 at 9:16 AM, Alexey Brodkin
> > > <Alexey.Brodkin@synopsys.com> wrote:
> > > > Hi Daniel,
> > > > 
> > > > On Thu, 2018-04-05@08:18 +0200, Daniel Vetter wrote:
> > > > > On Wed, Apr 4, 2018 at 10:06 PM, Alexey Brodkin
> > > > > <Alexey.Brodkin@synopsys.com> wrote:
> > > > > > Hello,
> > > > > > 
> > > > > > We're trying to use DisplayLink USB2-to-HDMI adapter to render
> > > > > > GPU-accelerated graphics.
> > > > > > Hardware setup is as simple as a devboard + DisplayLink
> > > > > > adapter.
> > > > > > Devboards we use for this experiment are:
> > > > > >  * Wandboard Quad (based on IMX6 SoC with Vivante GPU) or
> > > > > >  * HSDK (based on Synopsys ARC HS38 SoC with Vivante GPU as
> > > > > > well)
> > > > > > 
> > > > > > I'm sure any other board with DRM supported GPU will work,
> > > > > > those we just used
> > > > > > as the very recent Linux kernels could be easily run on them
> > > > > > both.
> > > > > > 
> > > > > > Basically the problem is UDL needs to be explicitly notified
> > > > > > about new data
> > > > > > to be rendered on the screen compared to typical bit-streamers
> > > > > > that infinitely
> > > > > > scan a dedicated buffer in memory.
> > > > > > 
> > > > > > In case of UDL there're just 2 ways for this notification:
> > > > > >  1) DRM_IOCTL_MODE_PAGE_FLIP that calls drm_crtc_funcs-
> > > > > > > page_flip()
> > > > > > 
> > > > > >  2) DRM_IOCTL_MODE_DIRTYFB that calls drm_framebuffer_funcs-
> > > > > > > dirty()
> > > > > > 
> > > > > > But neither of IOCTLs happen when we run Xserver with xf86-
> > > > > > video-armada driver
> > > > > > (see https://urldefense.proofpoint.com/v2/url?u=http-3A__git.ar
> > > > > > m.linux.org.uk_cgit_xf86-2Dvideo-2Darmada.git_log_-3Fh-
> > > > > > 3Dunstable-2Ddevel&d=DwIBaQ&;
> > > > > > c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkh
> > > > > > pk5R81I&m=oEAlP64L9vkuUs_k3kGwwwlN1WJbDMJbCo0uDhwKwwk&s=3ZHj-
> > > > > > 6JXZBLSTWg_4KMnL0VNi7z8c0RxHzj2U5ywVIw&e=).
> > > > > > 
> > > > > > Is it something missing in Xserver or in UDL driver?
> > > > > 
> > > > > Use the -modesetting driverr for UDL, that one works correctly.
> > > > 
> > > > If you're talking about "modesetting" driver of Xserver [1] then
> > > > indeed
> > > > picture is displayed on the screen. But there I guess won't be any
> > > > 3D acceleration.
> > > > 
> > > > At least that's what was suggested to me earlier here [2] by Lucas:
> > > > ---------------------------->8---------------------------
> > > > For 3D acceleration to work under X you need the etnaviv specific
> > > > DDX
> > > > driver, which can be found here:
> > > > 
> > > > https://urldefense.proofpoint.com/v2/url?u=http-3A__git.arm.linux.org.uk_cgit_xf86-2Dvideo-2Darmada.git_log_-3Fh-3Dunsta&d=DwIBaQ&c=DPL6_X_6Jk
> > > > XFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=FleDFAQb2lBcZk5DMld7qpeSrB5Srsb4XPQecA5BPvU&s=YUzMQWe3lpC_pjGqRjb4MvRYh16ZBbealqf
> > > > rywlqjKE&e=
> > > > ble-devel
> > > 
> > > You definitely want to use -modesetting for UDL. And I thought with
> > > glamour and the corresponding mesa work you should also get
> > > accelaration. Insisting that you must use a driver-specific ddx is
> > > broken, the world doesn't work like that anymore.
> > 
> > On etnaviv the world definitely still works like this. The etnaviv DDX
> > uses the dedicated 2D hardware of the Vivante GPUs, which is much
> > faster and efficient than going through Glamor.
> > Especially since almost all X accel operations are done on linear
> > buffers, while the 3D GPU can only ever do tiled on both sampler and
> > render, where some multi-pipe 3D cores can't even read the tiling they
> > write out. So Glamor is an endless copy fest using the resolve engine
> > on those.
> 
> Ah right, I've forgotten about the vivante 2d cores again.
> 
> > If using etnaviv with UDL is a use-case that need to be supported, one
> > would need to port the UDL specifics from -modesetting to the -armada
> > DDX.
> 
> I don't think this makes sense.

I'm not really sure it has something to do with Etnaviv in particular.
Given UDL might be attached to any board with any GPU that would mean we'd
need to add those "UDL specifics from -modesetting" in all xf86-video-drivers,
right?

> > > Lucas, can you pls clarify? Also, why does -armada bind against all
> > > kms drivers, that's probaly too much.
> > 
> > I think that's a local modification done by Alexey. The armada driver
> > only binds to armada and imx-drm by default.

Actually it all magically works without any modifications.
I just start X with the following xorg.conf [1]:
------------------------>8--------------------------
Section "Device"
	Identifier	"Driver0"
	Screen		0
	Driver		"armada"
EndSection
------------------------>8--------------------------

In fact in case of "kmscube" I had to trick Mesa like that:
------------------------>8--------------------------
export MESA_LOADER_DRIVER_OVERRIDE=imx-drm
------------------------>8--------------------------
And then UDL out works perfectly fine (that's because "kmscube"
explicitly calls drmModePageFlip()).

As for Xserver nothing special was done.

[1] http://git.arm.linux.org.uk/cgit/xf86-video-armada.git/tree/conf/xorg-sample.conf?h=unstable-devel

-Alexey
