From: raj.khem@gmail.com (Khem Raj)
Date: Fri, 8 Feb 2019 09:41:30 -0800
Subject: [PATCH] linux-yocto: Add dependency on libgcc for ARC
In-Reply-To: <4881796E12491D4BB15146FE0209CE64681D6A80@DE02WEMBXB.internal.synopsys.com>
References: <20190208153221.4335-1-abrodkin@synopsys.com>
 <CAMKF1sqY_1h8j2KR322gF8swrvFapx1mJvicHn-U3bm0+m4-7g@mail.gmail.com>
 <4881796E12491D4BB15146FE0209CE64681D6A80@DE02WEMBXB.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAMKF1sp8g3AVQUQY-qiKSw7PpO1Su1NRavA-eW7yN2tnAcOnwA@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Fri, Feb 8, 2019 at 9:35 AM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> Hi Khem,
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem at gmail.com>
> > Sent: Friday, February 8, 2019 8:28 PM
> > To: Alexey Brodkin <alexey.brodkin at synopsys.com>
> > Cc: Patches and discussions about the oe-core layer <openembedded-core at lists.openembedded.org>; Ross
> > Burton <ross.burton at intel.com>; linux-snps-arc at lists.infradead.org; Bruce Ashfield
> > <bruce.ashfield at windriver.com>
> > Subject: Re: [PATCH] linux-yocto: Add dependency on libgcc for ARC
> >
> > On Fri, Feb 8, 2019 at 7:32 AM Alexey Brodkin
> > <alexey.brodkin@synopsys.com> wrote:
> > >
> > > As of now in case of ARC there's no in-kernel implementation of basic libgcc
> > > functions used for millicode, multiplication, division etc instead we simply
> > > link with libgcc.a which provides everything used by the compiler.
> > >
> >
> > this is something you would be fixing in kernel eventually?
> > we can carry this as a workaround until then but it really needs to be
> > fixed in kernel.
>
> Well we do have it in our plans but given this is more a nice feature
> than something critical (as currently used approach with libgcc works
> perfectly fine) it might not be done very soon.
>
> Thus we'll need to keep this work-around for now.
>
> BTW exporting of libgcc parts into kernel means we'll need to
> keep it in sync with real libgcc later which is not optimal as well.

aarch64 kernel also bootstrapped with lbgcc for quite a while and then
moved away
I can understand that there might be bigger fish to fry, but this is
not a insignificant issue
where you make kernel dependency on toolchain runtime go away.

>
> -Alexey
