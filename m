From: pavel@ucw.cz (Pavel Machek)
Date: Tue, 12 Dec 2017 22:12:14 +0100
Subject: UDL's fbdev doesn't work for user-space apps
In-Reply-To: <1513108084.4945.27.camel@synopsys.com>
References: <1512387175.4977.24.camel@synopsys.com>
 <86238def-82be-2ad1-63d0-b9a8dbf83db6@synopsys.com>
 <20171209172022.GC19862@localhost>
 <1513108084.4945.27.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171212211214.GA32613@amd>
To: linux-snps-arc@lists.infradead.org

On Tue 2017-12-12 19:48:05, Alexey Brodkin wrote:
> Hi Pavel,
> 
> On Sat, 2017-12-09@18:20 +0100, Pavel Machek wrote:
> > On Mon 2017-12-04 11:50:40, Jose Abreu wrote:
> > > 
> > > Hi Alexey,
> > > 
> > > On 04-12-2017 11:32, Alexey Brodkin wrote:
> > > > 
> > > > My first [probably incorrect] assumption is Xserver requires fbdev (/dev/fbX)
> > > > and it cannot use DRI video card natively. Is that correct?
> > > > 
> > > > 
> > > 
> > > Xserver can use DRI directly, you need to enable modesetting
> > > driver in Xorg config or use the designated driver for your card
> > > (if there is any).
> > 
> > Still, dev/fb1 should work.
> 
> Agree, but it doesn't :)
> Even on completely different architectures (ARC and ARM).

Yeah, would be nice to get it fixed :-). I remember it did not work
for me, either, and .. that's some time ago.

Architecture probably plays no role there.
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 181 bytes
Desc: Digital signature
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20171212/415fe8b9/attachment.sig>
