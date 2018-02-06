From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 6 Feb 2018 21:04:47 +0000
Subject: [PATCH v2] arc: dts: use 'atmel' as manufacturer for at24 in
 axs10x_mb
In-Reply-To: <CAMRc=MfgLA2KDMFLM_GrbSb6MfQeAdHfVJXbnx-ss+S4xm72uw@mail.gmail.com>
References: <20180206110810.9093-1-brgl@bgdev.pl>
 <1517919923.6726.13.camel@synopsys.com>
 <CAMRc=MfgLA2KDMFLM_GrbSb6MfQeAdHfVJXbnx-ss+S4xm72uw@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <4881796E12491D4BB15146FE0209CE646802AACB@DE02WEMBXB.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Bartosz,

> -----Original Message-----
> From: Bartosz Golaszewski [mailto:brgl at bgdev.pl]
> Sent: Tuesday, February 6, 2018 7:02 PM
> To: Alexey Brodkin <Alexey.Brodkin at synopsys.com>
> Cc: linux-kernel at vger.kernel.org; mark.rutland at arm.com; Vineet.Gupta1 at synopsys.com; robh+dt at kernel.org;
> devicetree at vger.kernel.org; linux-snps-arc at lists.infradead.org
> Subject: Re: [PATCH v2] arc: dts: use 'atmel' as manufacturer for at24 in axs10x_mb
> 
> 2018-02-06 13:25 GMT+01:00 Alexey Brodkin <Alexey.Brodkin at synopsys.com>:
> > Hi Bartosz,
> >
> > On Tue, 2018-02-06@12:08 +0100, Bartosz Golaszewski wrote:
> >> Using compatible strings without the <manufacturer> part for at24 is
> >> deprecated since commit 6da28acf745f ("dt-bindings: at24: consistently
> >> document the compatible property"). Use a correct 'atmel,<model>'
> >> value.
> >>
> >> Signed-off-by: Bartosz Golaszewski <brgl at bgdev.pl>
> >
> > So my further input might be a bit unexpected :)
> >
> > I took a look at the real board and understood that we specified in .dts
> > wrong ICs. Those Atmel parts are not connected to the CPU at all (used by some
> > external device) and instead I2C EEPROM we really have connected (but not yet
> > obviously used in the Linux kernel) is NXP's PCF8594C-2.
> >
> > That said we may accept your change because it doesn't break anything
> > and then I'll send an update to axs10x_mb.dts with replacement of EEPROM nodes.
> > Or we may drop your change at all since I'm going to replace corresponding nodes.
> >
> > -Alexey
> 
> Looks like PCF8594C-2 is compatible with atmel,24c04 - when you'll be
> submitting this patch, please extend the at24 DT bindings with a new
> naming exception (just like the one for renesas).

Thanks for checking this.

> Feel free to drop this patch if you plan to submit the fix soon -
> otherwise, apply it if it may take some time.

No I think it worth applying especially in the light of your comment about NXP EEPROM.

Vineet, could you please take this one?

-Alexey
