From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 12 Dec 2017 19:48:05 +0000
Subject: UDL's fbdev doesn't work for user-space apps
In-Reply-To: <20171209172022.GC19862@localhost>
References: <1512387175.4977.24.camel@synopsys.com>
 <86238def-82be-2ad1-63d0-b9a8dbf83db6@synopsys.com>
 <20171209172022.GC19862@localhost>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1513108084.4945.27.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Pavel,

On Sat, 2017-12-09@18:20 +0100, Pavel Machek wrote:
> On Mon 2017-12-04 11:50:40, Jose Abreu wrote:
> > 
> > Hi Alexey,
> > 
> > On 04-12-2017 11:32, Alexey Brodkin wrote:
> > > 
> > > My first [probably incorrect] assumption is Xserver requires fbdev (/dev/fbX)
> > > and it cannot use DRI video card natively. Is that correct?
> > > 
> > > 
> > 
> > Xserver can use DRI directly, you need to enable modesetting
> > driver in Xorg config or use the designated driver for your card
> > (if there is any).
> 
> Still, dev/fb1 should work.

Agree, but it doesn't :)
Even on completely different architectures (ARC and ARM).

> Can be tested using dd, even :-)

Most probably so but not in case of UDL as of today :(
I mean as long as it does't work dd etc make no sense.

-Alexey
