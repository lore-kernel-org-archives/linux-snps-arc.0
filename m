From: thomas.petazzoni@free-electrons.com (Thomas Petazzoni)
Date: Thu, 27 Oct 2016 11:11:18 +0200
Subject: Build regressions/improvements in v4.9-rc1
In-Reply-To: <1477559240.2561.8.camel@synopsys.com>
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
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161027111118.5c585d51@free-electrons.com>
To: linux-snps-arc@lists.infradead.org

Hello,

On Thu, 27 Oct 2016 09:07:55 +0000, Alexey Brodkin wrote:

> > axs101 is using a 770 core, while the toolchain is built for the HS38
> > core. I'm somewhat surprised that a single ARC toolchain cannot produce
> > code for both 770 and HS38, but it seems to be the case.
> > 
> > So you need a separate toolchain for ARC770.  
> 
> Indeed axs101 uses ARC770 core which is ARCv1 AKA ARCompact ISA while
> axs103 sports the same base-board but CPU daughter-card contains ARC HS38 core
> which has ARCv2 ISA (binary incompatible with ARCompact).
> 
> Essentially both gcc and binutils will happily build for both architectures given
> proper options were passed on the command line. But Linux kernel gets linked with
> pre-built libgcc (it is a part of toolchain). And so it all boils down to a requirement
> to have multilibbed uClibc toolchain. Which we don't have.

Interesting. Why is libgcc linked with the kernel on ARC? I don't think
that's the case on other architectures: the kernel is freestanding and
provides everything that it needs without relying on the compiler
runtime.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
