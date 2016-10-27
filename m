From: thomas.petazzoni@free-electrons.com (Thomas Petazzoni)
Date: Thu, 27 Oct 2016 09:07:22 +0200
Subject: Build regressions/improvements in v4.9-rc1
In-Reply-To: <87shriwtpp.fsf@concordia.ellerman.id.au>
References: <1476688913-15648-1-git-send-email-geert@linux-m68k.org>
 <CAMuHMdVety8LeBgM1ZHfqw=NMjH5_=sQR=LLypQ1-YjxnuvaiQ@mail.gmail.com>
 <00b16c44-79b8-43b8-6516-13c8bb92eb03@synopsys.com>
 <5541266.ySlPfDOezF@wuerfel>
 <9a0f80b3-adb3-36de-d59f-885ac29ea2e6@synopsys.com>
 <87inso4kxb.fsf@concordia.ellerman.id.au>
 <1476879762.26312.12.camel@synopsys.com>
 <87shriwtpp.fsf@concordia.ellerman.id.au>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161027090722.3ba2badc@free-electrons.com>
To: linux-snps-arc@lists.infradead.org

Hello,

On Thu, 27 Oct 2016 10:56:02 +1100, Michael Ellerman wrote:

> > Hm... that's strange - it used to work but doesn't work with newer Buildroot...
> >
> > Anyways if something very simple (i.e. with no extra libraries) works for you just go
> > ahead and grab pre-built image that Thomas Petazzoni builds.
> >
> > That's the most recent one:
> > http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2016.08-613-ge98b4dd.tar.bz2  
> 
> Thanks, I grabbed that and it works for axs103_smp_defconfig:
> 
>   http://kisskb.ellerman.id.au/kisskb/buildresult/12840656/
> 
> 
> It doesn't work for axs101_defconfig, saying:
> 
>   arch/arc/Makefile:29: *** Toolchain not configured for ARCompact builds.  Stop.

axs101 is using a 770 core, while the toolchain is built for the HS38
core. I'm somewhat surprised that a single ARC toolchain cannot produce
code for both 770 and HS38, but it seems to be the case.

So you need a separate toolchain for ARC770.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
