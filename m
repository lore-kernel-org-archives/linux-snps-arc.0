From: l.stach@pengutronix.de (Lucas Stach)
Date: Fri, 24 Nov 2017 17:11:33 +0100
Subject: glxgears on Etnaviv: couldn't get an RGB, Double-buffered visual
In-Reply-To: <1511539365.3497.67.camel@synopsys.com>
References: <1511539365.3497.67.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1511539893.16502.34.camel@pengutronix.de>
To: linux-snps-arc@lists.infradead.org

Hi Alexey,

Am Freitag, den 24.11.2017, 16:02 +0000 schrieb Alexey Brodkin:
> Hello,
> 
> Being in the middle of bring-up of the new board with Vivante GPU (HSDK namely,
> see?https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arc/plat-hsdk)
> I was looking at simple 3D test apps to see how Etnaviv works on the hardware.
> 
> So far I was able to get kmscube working perfectly fine and the next item I took
> was glxgears (for some reason I was under impression that's de facto "Hello world" app
> in the GPU world). But apparently even with Xserver up and running glxgears doesn't work.
> 
> Moreover I tried the same thing on Wandboard Quad but to no avail as well.
> That's what I saw:
> ------------------------->8---------------------
> # glxgears
> Error: couldn't get an RGB, Double-buffered visual
> 
> # glxinfo
> name of display: :0
> Error: couldn't find RGB GLX visual or fbconfig?
> ------------------------->8---------------------
> 
> Googling didn't help here unfortunately so maybe some pointers could be
> suggested here... like what do I do wrong and if glxgears is supposed to
> work on top of DRM GPU at all?
> 
> Thanks a lot in advance!

For 3D acceleration to work under X you need the etnaviv specific DDX
driver, which can be found here:

http://git.arm.linux.org.uk/cgit/xf86-video-armada.git/log/?h=unstable-devel

Don't let you get confused by the name, the armada driver implements
support for both armada drm and imx-drm and the etnaviv DDX. This
provides 2D acceleration on the Vivante 2D cores, as well a the DRI2/3
bit necessary to get a 3D context on X.

Regards,
Lucas
