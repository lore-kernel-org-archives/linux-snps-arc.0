From: daniel@ffwll.ch (Daniel Vetter)
Date: Fri, 13 Apr 2018 17:52:08 +0200
Subject: DRM_UDL and GPU under Xserver
In-Reply-To: <1523267150.5268.18.camel@synopsys.com>
References: <CAKMK7uE5HHDCQ5=t5Z2TcheZd7etREUoHmTVK=q3wxMdSMZK5w@mail.gmail.com>
 <1522924162.3779.16.camel@pengutronix.de>
 <CAKMK7uF1syoNga8wKect9E0oet2fVaj9XWFE5AA6Pu4ND56HVQ@mail.gmail.com>
 <1522926602.4587.10.camel@synopsys.com>
 <20180405134421.GV3881@phenom.ffwll.local>
 <1522953580.3977.10.camel@synopsys.com>
 <20180409083127.GL31310@phenom.ffwll.local>
 <1523264135.5268.14.camel@synopsys.com>
 <20180409091706.GU31310@phenom.ffwll.local>
 <1523267150.5268.18.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180413155208.GA31310@phenom.ffwll.local>
To: linux-snps-arc@lists.infradead.org

On Mon, Apr 09, 2018@09:45:51AM +0000, Alexey Brodkin wrote:
> Hi Daniel,
> 
> On Mon, 2018-04-09@11:17 +0200, Daniel Vetter wrote:
> > On Mon, Apr 09, 2018@08:55:36AM +0000, Alexey Brodkin wrote:
> > > Hi Daniel,
> > > 
> > > On Mon, 2018-04-09@10:31 +0200, Daniel Vetter wrote:
> > > > On Thu, Apr 05, 2018@06:39:41PM +0000, Alexey Brodkin wrote:
> > > > > Hi Daniel, all,
> > > 
> > > [snip]
> > > 
> > > > > Ok it was quite some time ago so I forgot about that completely.
> > > > > I really made one trivial change in xf86-video-armada:
> > > > > ------------------------>8--------------------------
> > > > > --- a/src/armada_module.c
> > > > > +++ b/src/armada_module.c
> > > > > @@ -26,7 +26,7 @@
> > > > >  #define ARMADA_NAME            "armada"
> > > > >  #define ARMADA_DRIVER_NAME     "armada"
> > > > >  
> > > > > -#define DRM_MODULE_NAMES       "armada-drm", "imx-drm"
> > > > > +#define DRM_MODULE_NAMES       "armada-drm", "imx-drm", "udl"
> > > > >  #define DRM_DEFAULT_BUS_ID     NULL
> > > > > ------------------------>8--------------------------
> > > > > 
> > > > > Otherwise Xserver fails on start which is expected given "imx-drm" is intentionally removed.
> > > 
> > > Here I meant I explicitly disabled DRM_IMX in the kernel configuraion
> > > so that it is not used in run-time.
> > > 
> > > > You need to keep imx-drm around. And then light up the udl display using
> > > > prime. Afaiui it should all just work (but with maybe a few disconnected
> > > > outputs from imx-drm around that you don't need, but that's not a
> > > > problem).
> > > 
> > > And given my comment above I don't really see any difference between
> > > DRM_IMX and DRM_UDL (except their HW implmentation which I guess should
> > > not bother upper layers) so why do wee need to treat them differently?
> > > 
> > > Most probably I'm missing something but my thought was if we have
> > > 2 equally well supported KMS devices we may easily swap them and still
> > > have resulting setup functional.
> > 
> > armada is not a generic drm driver, but can only be used for armada-drm
> > and imx-drm. You can't just use it with any drm device, for that you need
> > a generic driver like -modesetting.
> 
> But "armada" is the name of xf86 "driver" only which then uses true DRM_ETNAVIV
> kernel driver. That's why I'm a bit confused.
> 
> And from what I see DRM_ETNAVIV happily works with either DRM_xxx frame-buffer
> device be it DRM_IMX or DRM_UDL.

Names are irrelevant and often just historical accidents. Armada was
origianlly only for armada, but then extended to support etnaviv 2d core,
then extended to IMX.

That the kernel properly share buffers between all of them is kinda
orthogonal to what armada-the-X11-driver supports.

Yes graphics is complicated, that's why touching and changing random stuff
you don't fully understand is not a good idea :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
