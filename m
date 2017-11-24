From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 24 Nov 2017 17:23:17 +0000
Subject: glxgears on Etnaviv: couldn't get an RGB, Double-buffered visual
In-Reply-To: <1511543472.16502.38.camel@pengutronix.de>
References: <1511539365.3497.67.camel@synopsys.com>
 <1511539893.16502.34.camel@pengutronix.de>
 <1511540718.3497.73.camel@synopsys.com>
 <1511541502.16502.36.camel@pengutronix.de>
 <1511542141.3497.93.camel@synopsys.com>
 <1511543472.16502.38.camel@pengutronix.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1511544197.3497.101.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Lucas,

On Fri, 2017-11-24@18:11 +0100, Lucas Stach wrote:
> Am Freitag, den 24.11.2017, 16:49 +0000 schrieb Alexey Brodkin:
> [...]
> > 
> > > 
> > > Yes, a "core" in Vivante speak is a GPU with one DMA frontend. A
> > > single
> > > frontend can feed both 3D and 2D acceleration engines behind it. On
> > > i.MX6 the 2D and 3D engine are on separate cores, but Marvell Dove
> > > has
> > > a combined 2D/3D core.
> > 
> > Hm, that sounds encouraging. The next question would be if Marvel
> > Dove is
> > supported in Etnaviv DDX? I guess it's called Armada so the answer if
> > yes, right?
> 
> Yes, the Dove was the original platform for the Armada X.Org driver.
> Combined 2D/3D cores are supported just fine by etnaviv.

Sweet!
Maybe another question then.
To get kmscube working on our board which uses essentially different
bit-streamer device "udl" as opposed to "imx-drm" I had just to say:
---------------------->8----------------------
export MESA_LOADER_DRIVER_OVERRIDE=imx-drm
---------------------->8----------------------
and then all the magic has happened.

Will it be
?a) required
?b) enough
for Vivante X.org driver?

> > > > If we happen to not have 2D core if that's a no go for us for
> > > > anything?
> > > 
> > > I don't know if the DDX works properly without 2D acceleration.
> > > Weston
> > > on the other hand only relies on the 3D accel core for doing
> > > compositing, so even if you don't have a 2D engine you will be able
> > > to
> > > launch a modern Linux graphics stack.
> > 
> > That's really cool! I'm much more interested in Weston ATM, which is
> > actually another separate question :)
> > I tried to find some details on how to run Weston on Wandboard
> > but seems like I was looking at wrong Google again... do you
> > know any good manuals for doing that?
> 
> There really is no magic to it. Or better there is, but it's all hidden
> in the Mesa implementation.
> 
> You need at least Mesa 17.2 and Weston 3.0 for etnaviv to work
> properly. Other than that just set XDG_RUNTIME_DIR to something
> sensible and launch Weston with "weston --tty=63", done.

Cool, will try that!

> > > The etnaviv DDX could also emulate 2D accel over the 3D core by
> > > using
> > > the X.Org glamor module, but no one has bothered to implement this
> > > yet.
> > 
> > Ok we'll see if above case (combined cores) is applicable to us and
> > then
> > we'll see what to do.
> > 
> > > 
> > > > 
> > > > In the meantime I'll try to figure out if we have 2D core or not.
> > > 
> > > You can find out what your GPU provides by looking at the feature
> > > bits.
> > > chipFeatures_PIPE_2D, chipFeatures_PIPE_3D and chipFeatures_PIPE_VG
> > > is
> > > what you are looking out for.
> > 

> > Does that info helps to decipher these bits?
> 
> Unfortunately we forgot to expose the major feature bits register in
> debugfs. It's gpu->identity.features in the kernel driver, the
> interesting bits in there are chipFeatures_PIPE_3D and
> chipFeatures_PIPE_2D.

Noted!

Are you going to add that yourself sometime soon or shall I do it?

-Alexey
