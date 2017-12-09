From: pavel@ucw.cz (Pavel Machek)
Date: Sat, 9 Dec 2017 18:20:22 +0100
Subject: UDL's fbdev doesn't work for user-space apps
In-Reply-To: <86238def-82be-2ad1-63d0-b9a8dbf83db6@synopsys.com>
References: <1512387175.4977.24.camel@synopsys.com>
 <86238def-82be-2ad1-63d0-b9a8dbf83db6@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171209172022.GC19862@localhost>
To: linux-snps-arc@lists.infradead.org

On Mon 2017-12-04 11:50:40, Jose Abreu wrote:
> Hi Alexey,
> 
> On 04-12-2017 11:32, Alexey Brodkin wrote:
> > My first [probably incorrect] assumption is Xserver requires fbdev (/dev/fbX)
> > and it cannot use DRI video card natively. Is that correct?
> >
> >
> 
> Xserver can use DRI directly, you need to enable modesetting
> driver in Xorg config or use the designated driver for your card
> (if there is any).

Still, dev/fb1 should work. Can be tested using dd, even :-)

Best regards,
									Pavel
> 
> e.g.:
> 
> Section "Device"
>         Identifier "Card0"
>         Driver "modesetting"
>         Option "kmsdev" "/dev/dri/card0"
>         Option "SWcursor" "true"
>         BusID "PCI:X:X:X"
> EndSection
> 
> Best Regards,
> Jose Miguel Abreu

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
