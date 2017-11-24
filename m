From: l.stach@pengutronix.de (Lucas Stach)
Date: Fri, 24 Nov 2017 17:38:22 +0100
Subject: glxgears on Etnaviv: couldn't get an RGB, Double-buffered visual
In-Reply-To: <1511540718.3497.73.camel@synopsys.com>
References: <1511539365.3497.67.camel@synopsys.com>
 <1511539893.16502.34.camel@pengutronix.de>
 <1511540718.3497.73.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1511541502.16502.36.camel@pengutronix.de>
To: linux-snps-arc@lists.infradead.org

Am Freitag, den 24.11.2017, 16:25 +0000 schrieb Alexey Brodkin:
> Hi Lucas,
> 
> On Fri, 2017-11-24@17:11 +0100, Lucas Stach wrote:
> > Hi Alexey,
> > 
> > Am Freitag, den 24.11.2017, 16:02 +0000 schrieb Alexey Brodkin:
> > > 
> > > Hello,
> > > 
> > > Being in the middle of bring-up of the new board with Vivante GPU (HSDK namely,
> > > see?https://urldefense.proofpoint.com/v2/url?u=https-3A__git.kernel.org_pub_scm_linux_kernel_git_torvalds_linux.git_tree_arch_arc_plat-2Dhsdk&d=Dw
> > > IDaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=ZXa-564Jm43PXsqGXCf2US2DY7C0qIlCw6c56pL-
> > > bLY&s=ZJSI1u6GgsRHNIcONVFfIKvn1AWaB38GmtCN1dGB3w0&e=)
> > > I was looking at simple 3D test apps to see how Etnaviv works on the hardware.
> > > 
> > > So far I was able to get kmscube working perfectly fine and the next item I took
> > > was glxgears (for some reason I was under impression that's de facto "Hello world" app
> > > in the GPU world). But apparently even with Xserver up and running glxgears doesn't work.
> > > 
> > > Moreover I tried the same thing on Wandboard Quad but to no avail as well.
> > > That's what I saw:
> > > ------------------------->8---------------------
> > > # glxgears
> > > Error: couldn't get an RGB, Double-buffered visual
> > > 
> > > # glxinfo
> > > name of display: :0
> > > Error: couldn't find RGB GLX visual or fbconfig?
> > > ------------------------->8---------------------
> > > 
> > > Googling didn't help here unfortunately so maybe some pointers could be
> > > suggested here... like what do I do wrong and if glxgears is supposed to
> > > work on top of DRM GPU at all?
> > > 
> > > Thanks a lot in advance!
> > 
> > For 3D acceleration to work under X you need the etnaviv specific DDX
> > driver, which can be found here:
> > 
> > https://urldefense.proofpoint.com/v2/url?u=http-3A__git.arm.linux.org.uk_cgit_xf86-2Dvideo-2Darmada.git_log_-3Fh-3Dunstable-2Ddevel&d=DwIDaQ&c=DPL6_
> > X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=ZXa-564Jm43PXsqGXCf2US2DY7C0qIlCw6c56pL-
> > bLY&s=ZzK2fxA6_XlN6pGnf2Tpo6qKzzQh76ocWZ6IDR-WPtc&e=
> 
> Thanks for the pointer, still a couple of questions below...
> 
> > Don't let you get confused by the name, the armada driver implements
> > support for both armada drm and imx-drm and the etnaviv DDX. This
> > provides 2D acceleration on the Vivante 2D cores, as well a the DRI2/3
> > bit necessary to get a 3D context on X.
> 
> From Wandboard's .dts I see that 2D core is a separate node with separate
> set of registers mapped at a different location in memory, right?
> 
> Do you know if that's possible if the same one memory-mapped register set
> controls both 3D and 2D engine?

Yes, a "core" in Vivante speak is a GPU with one DMA frontend. A single
frontend can feed both 3D and 2D acceleration engines behind it. On
i.MX6 the 2D and 3D engine are on separate cores, but Marvell Dove has
a combined 2D/3D core.

> If we happen to not have 2D core if that's a no go for us for anything?

I don't know if the DDX works properly without 2D acceleration. Weston
on the other hand only relies on the 3D accel core for doing
compositing, so even if you don't have a 2D engine you will be able to
launch a modern Linux graphics stack.

The etnaviv DDX could also emulate 2D accel over the 3D core by using
the X.Org glamor module, but no one has bothered to implement this yet.

> 
> In the meantime I'll try to figure out if we have 2D core or not.

You can find out what your GPU provides by looking at the feature bits.
chipFeatures_PIPE_2D, chipFeatures_PIPE_3D and chipFeatures_PIPE_VG is
what you are looking out for.

Regards,
Lucas
