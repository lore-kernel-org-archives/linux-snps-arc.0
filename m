From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 19 Jan 2018 19:23:32 +0000
Subject: [PATCH v2] ARC: Force disable IOC if we don't want to use it
In-Reply-To: <77182f1e-8dbc-6d82-f940-c2b7e7105570@synopsys.com>
References: <20171218152920.4696-1-abrodkin@synopsys.com>
 <77182f1e-8dbc-6d82-f940-c2b7e7105570@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1516389811.5254.6.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Fri, 2018-01-19@11:17 -0800, Vineet Gupta wrote:
> On 12/18/2017 07:29 AM, Alexey Brodkin wrote:
> > If software that was executed before Linux kernel [like boot-ROM or
> > bootloader] enabled IOC but we'd like to not use it [mostly for
> > debugging of weird DMA issues] we essentially need to disable IOC.
> > So we do here.
> > 
> > Note we will only disable IOC if "ioc_enable" variable is force set to 0.
> > As of today that's only possible either before building right in
> > arch/arc/mm/cache.c or via debugger on target reght before execution of
> > the kernel starts.
> > 
> > We may make "ioc_enable" a boot-parameter later though.
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > ---
> > 
> > Chnages in v2:
> >   * Now disabling really works as in v1 we never entered
> >     disabling code if ioc_enable=0.
> >   * Do nothing if IOC was not enabled
> > 
> >   arch/arc/mm/cache.c | 42 ++++++++++++++++++++++++++++++++++++++++--
> >   1 file changed, 40 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arc/mm/cache.c b/arch/arc/mm/cache.c
> > index 69f77c113875..9cadf7b779ed 100644
> > --- a/arch/arc/mm/cache.c
> > +++ b/arch/arc/mm/cache.c
> > @@ -1186,6 +1186,40 @@ noinline void __init arc_ioc_setup(void)
> >   	__dc_enable();
> >   }
> >   
> > +/*
> > + * Disabling of IOC is quite a tricky action because
> > + * nobody knows what happens if there're IOC-ahndled tarnsactions in flight
> > + * when we're disabling IOC.
> > + *
> > + * And the problem is external DMA masters [that were initialized and set in a
> > + * bootlaoder that was executed before we got here] might continue to send data
> > + * to memory even at this point and we have no way to prevent that.
> 
> Isn't this a sufficient red flag to warrant NOT adding this to kernel !
> 
> I agree that the use case is bring up of a new RTL version etc with bootloader 
> already in there - but in that case can we NOT bypass those and run the kernel 
> bare metal ?
> 
> > + *
> > + * That said it's much safer to not enable IOC at all anywhere before
> > + * in boot-ROM, bootloader etc but if we do need to disable it in Linux kernel
> > + * it should be done as early as possible and made by master core while all
> > + * slaves aren't active.
> > + *
> 
> Again this is like saying - this is Pandora's Box - don't open it - which is more 
> of a invitation for others to actually open it !

I agree with all that above.

In fact I already sent a pull-request to Tom Rini for a series among other things 
disabling IOC in U-Boot, see:
1) Pull-request: https://lists.denx.de/pipermail/u-boot/2018-January/317602.html
2) Actual patch: http://git.denx.de/?p=u-boot/u-boot-arc.git;a=commit;h=b0146f9e29ca2e82262416aca65395c322a618f9

So indeed this patch for Linux could be dropped.

-Alexey
