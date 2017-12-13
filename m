From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 13 Dec 2017 21:53:06 +0000
Subject: UDL's fbdev doesn't work for user-space apps
In-Reply-To: <370a9121-788d-a0eb-e4cb-c3b09f7bd6ce@tronnes.org>
References: <1512387175.4977.24.camel@synopsys.com>
 <370a9121-788d-a0eb-e4cb-c3b09f7bd6ce@tronnes.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1513201984.9373.28.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Noralf,

On Tue, 2017-12-12@22:58 +0100, Noralf Tr?nnes wrote:
> Den 04.12.2017 12.32, skrev Alexey Brodkin:
> > Hello,
> > 
> > I'm trying to use DisplayLink USB2.0-to-HDMI adapter as the one and only
> > video output and I want to get Xserver working on top of that.
> > 
> > I'm not very familiar with all the parts of Linux GPU/video stack
> > (especially its user-space counterpart) so my assumptions might be wrong
> > in that case please correct me.
> > 
> > My first [probably incorrect] assumption is Xserver requires fbdev (/dev/fbX)
> > and it cannot use DRI video card natively. Is that correct?
> > 
> > So to get /ded/fb0 with UDL I just enabled CONFIG_DRM_UDL & CONFIG_DRM_FBDEV_EMULATION.
> > That gave me boot console on HDMI screen and I was full of expectations.
> > But when I tried to use /dev/fb0 from whatever user-space app nothing got
> > displayed on the screen... as well as no error messages appeared.
> > 
> > After eyeballing at UDL code (especially in comparison with QXC which uses deferredio
> > as well) I noticed that in UDL fb_deferred_io_init() is called from udl_fb_open(),
> > i.e. .fb_open call-back (in other words every time user-space app opens /dev/fb0)
> > while in QXC this is done only once and much earlier in qxlfb_create(), which is
> > called with .fb_probe call-back. So moved fb_deferred_io_init() in UDL driver from
> > udl_fb_open() to udlfb_create() which is also called from .fb_probe.
> > 
> > With that change I finally got video output via fbdev from user-space app,
> > but only on the first run. The next attempt to run inevitably ends with
> > kernel crash showing the following stack-trace (having half of the new screen
> > rendered on display):
> > ------------------------>8-------------------------
> > Stack Trace:
> >    udl_handle_damage+0x48/0x210
> >    udl_crtc_mode_set+0x6ee/0x754
> >    drm_crtc_helper_set_mode+0x25e/0x438
> >    drm_crtc_helper_set_config+0x6d6/0x814
> >    __drm_mode_set_config_internal+0x48/0xc8
> >    drm_mode_setcrtc+0x320/0x478
> >    drm_ioctl+0x22c/0x3e4
> >    SyS_ioctl+0xa4/0x8cc
> >    EV_Trap+0x108/0x10c
> > random: crng init done
> > ------------------------>8-------------------------
> > 
> > I'm wondering if UDL driver (its DRM flavor) was ever tested for
> > fbdev in user-space? If so and it really works for somebody
> > maybe I'm doing something terribly wrong - in that case any comments
> > are very welcome.
> 
> udl uses shmem buffers which doesn't work with fbdev deferred io.
> They fight over page->lru and page->mapping. See this commit:
> drm/udl: disable fb_defio by default
> 677d23b70bf949f75746c80cbae92c233c6b5e2a

Well that's interesting indeed, but IMHO that's not the most important
problem with UDL as of now since DRI-aware apps and Xserver stuff work
fine with /dev/dri/cardX. What bothers me is some problem [probably] with
export of its DMA buffers, so Vivante GPU does render stuff but it is not displayed
on the screen... in absense of error messages I'd conclude that the GPU
just renders to some virtuall addresses which are not mapped to UDL's
"frame-buffers". And it's not about improper handling of caches - I tried
with data caches disabled but still to no avail :(

-Alexey
