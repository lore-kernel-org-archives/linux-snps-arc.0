From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 27 Oct 2016 09:39:40 +0000
Subject: Build regressions/improvements in v4.9-rc1
In-Reply-To: <CAMuHMdUER2iSdACaU6uEO=122XyBPiVyKn3gW_uJJr2xbJMHYw@mail.gmail.com>
References: <1476688913-15648-1-git-send-email-geert@linux-m68k.org>
 <CAMuHMdVety8LeBgM1ZHfqw=NMjH5_=sQR=LLypQ1-YjxnuvaiQ@mail.gmail.com>
 <00b16c44-79b8-43b8-6516-13c8bb92eb03@synopsys.com>
 <5541266.ySlPfDOezF@wuerfel>
 <9a0f80b3-adb3-36de-d59f-885ac29ea2e6@synopsys.com>
 <87inso4kxb.fsf@concordia.ellerman.id.au>
 <1476879762.26312.12.camel@synopsys.com>
 <87shriwtpp.fsf@concordia.ellerman.id.au>
 <20161027090722.3ba2badc@free-electrons.com>
 <1477559240.2561.8.camel@synopsys.com>
 <20161027111118.5c585d51@free-electrons.com>
 <CAMuHMdUER2iSdACaU6uEO=122XyBPiVyKn3gW_uJJr2xbJMHYw@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1477561144.2561.19.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Thomas,

On Thu, 2016-10-27@11:24 +0200, Geert Uytterhoeven wrote:
> On Thu, Oct 27, 2016 at 11:11 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > 
> > On Thu, 27 Oct 2016 09:07:55 +0000, Alexey Brodkin wrote:
> > 
> > > 
> > > > 
> > > > axs101 is using a 770 core, while the toolchain is built for the HS38
> > > > core. I'm somewhat surprised that a single ARC toolchain cannot produce
> > > > code for both 770 and HS38, but it seems to be the case.
> > > > 
> > > > So you need a separate toolchain for ARC770.
> > > 
> > > Indeed axs101 uses ARC770 core which is ARCv1 AKA ARCompact ISA while
> > > axs103 sports the same base-board but CPU daughter-card contains ARC HS38 core
> > > which has ARCv2 ISA (binary incompatible with ARCompact).
> > > 
> > > Essentially both gcc and binutils will happily build for both architectures given
> > > proper options were passed on the command line. But Linux kernel gets linked with
> > > pre-built libgcc (it is a part of toolchain). And so it all boils down to a requirement
> > > to have multilibbed uClibc toolchain. Which we don't have.
> > 
> > Interesting. Why is libgcc linked with the kernel on ARC? I don't think
> > that's the case on other architectures: the kernel is freestanding and
> > provides everything that it needs without relying on the compiler
> > runtime.
> 
> ARC is not the only one:
> 
> $ git grep print-libgcc-file-name
> arch/arc/Makefile:LIBGCC := $(shell $(CC) $(cflags-y) --print-libgcc-file-name)
> arch/h8300/boot/compressed/Makefile:LIBGCC := $(shell
> $(CROSS-COMPILE)$(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
> arch/hexagon/Makefile:LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS)
> -print-libgcc-file-name)
> arch/m32r/Makefile:LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS)
> -print-libgcc-file-name)
> arch/nios2/Makefile:LIBGCC?????????:= $(shell $(CC) $(KBUILD_CFLAGS)
> $(KCFLAGS) -print-libgcc-file-name)
> arch/openrisc/Makefile:LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS)
> -print-libgcc-file-name)
> arch/parisc/Makefile:LIBGCC = $(shell $(CC) $(KBUILD_CFLAGS)
> -print-libgcc-file-name)
> arch/tile/Makefile:??$(shell $(CC) $(KBUILD_CFLAGS) $(KCFLAGS)
> -print-libgcc-file-name)
> arch/xtensa/Makefile:LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS)
> -print-libgcc-file-name)
> arch/xtensa/boot/boot-redboot/Makefile:LIBGCC := $(shell $(CC)
> $(KBUILD_CFLAGS) -print-libgcc-file-name)

Right.

I'm not 100% sure about all the details in case of Linux kernel on ARC
but I actually implemented decoupling from libgcc in U-Boot for ARC.
And from that experience I know what was required out of libgcc, see
http://git.denx.de/?p=u-boot.git;a=patch;h=a67ef280f46803e319639f5380ff8da6c6b7fbe7

And these are functions required by U-Boot (most probably the same is applied to kernel):
1) so-called millicode, stuff like?__ld_rX_to_rY,?__st_rX_to_rX
2) shifts: __ashldi3,?__ashrdi3,?__lshrdi3,?
3) divisions:?udivmodsi4,?__divsi3,?__modsi3,?__udivsi3,?__umodsi3

Indeed it is possible to have so-called private libgcc in kernel as well but
benefit will be only for people building kernels but not user-space because
in absence of multilibbed toolchain 2 separate toolchains will be required anyways.

Still we'll have to pay an additional maintenance price to keep kernel's libgcc in
sync with the one from gcc.

-Alexey
