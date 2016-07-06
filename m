From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 6 Jul 2016 08:45:50 +0000
Subject: ath9k-htc on OHCI -> bogus usb xfer
In-Reply-To: <577CC3A2.5070607@de.bosch.com>
References: <1467721137.3144.81.camel@synopsys.com>
 <577BED2D.7070209@rempel-privat.de> <1467739821.3086.13.camel@synopsys.com>
 <577C041C.7080905@rempel-privat.de> <1467790987.3086.15.camel@synopsys.com>
 <577CC035.1000404@de.bosch.com> <1467793848.3086.37.camel@synopsys.com>
 <577CC3A2.5070607@de.bosch.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1467794679.3086.42.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi?Oleksij,

On Wed, 2016-07-06@10:38 +0200, fixed-term.Oleksij.Rempel wrote:
> 
> On 06.07.2016 10:32, Alexey Brodkin wrote:
> > 
> > Hi Oleksij,
> > 
> > On Wed, 2016-07-06@10:24 +0200, fixed-term.Oleksij.Rempel wrote:
> > > 
> > > ?
> > > Hm... this Endpoint should be Interrupt, not Bulk. If you search for
> > > lsusb of this kind of adapter all of them list EP3 and EP4 as Interrupt.
> > > 
> > > what did went wrong here? Is it not working in USB High Speed mode?
> > Unfortunately as of now on that board EHCI doesn't work.
> > 
> > That's not a problem of a particular USB device but something in either
> > ECHI host controller or its integration. I do hope we will fix it sometime soon
> > (this is a development board and USB controller is implemented in FPGA so
> > there's a chance to fix stuff later on).
> > 
> > So given only OHCI works on the board I went forward and attempted to use it
> > with Wi-Fi USB dongle.
>
> I did some tests for 2 years on OHCI controller on x86. There was no
> noticable issues. It was even a bit faster then Intels EHCI. I don't
> think OHCI alone is the source of this problem.

Well I was also surprised how well that dongle works with that board in
OHCI mode. I saw quite consistent ~4-5 Mbit/second rates when doing Speedtest
from my smartphone. So IMHO it's completely usable. Especially on that kind of
HW which has main CPU running at just 100MHz.

> On other side, so far i know, this adapter claims to provide usb full
> speed support, (Not only high speed) and may use different usb
> descriptor for this. May be this is the problem.

So is there something we may do with all that?

-Alexey
