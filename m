From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 27 Oct 2016 09:07:55 +0000
Subject: Build regressions/improvements in v4.9-rc1
In-Reply-To: <20161027090722.3ba2badc@free-electrons.com>
References: <1476688913-15648-1-git-send-email-geert@linux-m68k.org>
 <CAMuHMdVety8LeBgM1ZHfqw=NMjH5_=sQR=LLypQ1-YjxnuvaiQ@mail.gmail.com>
 <00b16c44-79b8-43b8-6516-13c8bb92eb03@synopsys.com>
 <5541266.ySlPfDOezF@wuerfel>
 <9a0f80b3-adb3-36de-d59f-885ac29ea2e6@synopsys.com>
 <87inso4kxb.fsf@concordia.ellerman.id.au>
 <1476879762.26312.12.camel@synopsys.com>
 <87shriwtpp.fsf@concordia.ellerman.id.au>
 <20161027090722.3ba2badc@free-electrons.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1477559240.2561.8.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Thomas, Michael,

On Thu, 2016-10-27@09:07 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 27 Oct 2016 10:56:02 +1100, Michael Ellerman wrote:
> 
> > 
> > > 
> > > Hm... that's strange - it used to work but doesn't work with newer Buildroot...
> > > 
> > > Anyways if something very simple (i.e. with no extra libraries) works for you just go
> > > ahead and grab pre-built image that Thomas Petazzoni builds.
> > > 
> > > That's the most recent one:
> > > http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2016.08-613-ge98b4dd.tar.bz2??
> > 
> > Thanks, I grabbed that and it works for axs103_smp_defconfig:
> > 
> > ? http://kisskb.ellerman.id.au/kisskb/buildresult/12840656/
> > 
> > 
> > It doesn't work for axs101_defconfig, saying:
> > 
> > ? arch/arc/Makefile:29: *** Toolchain not configured for ARCompact builds.??Stop.
> 
> axs101 is using a 770 core, while the toolchain is built for the HS38
> core. I'm somewhat surprised that a single ARC toolchain cannot produce
> code for both 770 and HS38, but it seems to be the case.
> 
> So you need a separate toolchain for ARC770.

Indeed axs101 uses ARC770 core which is ARCv1 AKA ARCompact ISA while
axs103 sports the same base-board but CPU daughter-card contains ARC HS38 core
which has ARCv2 ISA (binary incompatible with ARCompact).

Essentially both gcc and binutils will happily build for both architectures given
proper options were passed on the command line. But Linux kernel gets linked with
pre-built libgcc (it is a part of toolchain). And so it all boils down to a requirement
to have multilibbed uClibc toolchain. Which we don't have.

I think we discussed it a couple of times already and probably at some point will have it
but for now we have to use 2 different toolchains for ARCompact and ARCv2 cores.

I hope explanation above makes some sense.

-Alexey
