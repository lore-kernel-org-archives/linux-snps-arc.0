From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Wed, 10 Aug 2016 19:03:33 +0200
Subject: Problems building arc-2016.09-eng007 toolchain with 2.6.35
 kernel headers
In-Reply-To: <7a1076af-3db3-7c92-c6bd-9b67cca6422c@synopsys.com>
References: <CAGXr9JG_P19fWQMtGN7gzJ7SYOVy=b=8DiD9M8++6_wngZ8NvA@mail.gmail.com>
 <7a1076af-3db3-7c92-c6bd-9b67cca6422c@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160810170333.GS22524@waldemar-brodkorb.de>
To: linux-snps-arc@lists.infradead.org

Hi,
Vineet Gupta wrote,

> On 08/08/2016 02:44 PM, Petri Gynther wrote:
> > uclibc-ng & ARC developers:
> >
> > I'm trying to use buildroot to build the latest ARC toolchain
> > (arc-2016.09-eng007) against our vendor-provided 2.6.35.12 ARC Linux
> > kernel. (Yes, it is an ancient kernel, but that's what I have to work
> > with for now, unfortunately.)
> >
> > ...
> >
> >
> > Questions:
> > 1) Does the latest ARC toolchain use some new ABI for binaries that
> > makes them incompatible with 2.6.35.12 kernel?
> 
> Indeed even if you were to build it successfully - you will run into ABI issues -
> 2.6.35 is ABI v1 and we are currently at v3 (which is going to change soon even
> further to v4 - for ARC HS processors)
> More details at:
> https://github.com/foss-for-synopsys-dwc-arc-processors/linux/wiki/ARC-Linux-Syscall-ABI-Compatibility
> 
> > 2) Is uclibc-ng 1.0.17 supposed to be compatible with 2.6.x kernel headers?
> 
> No - modern/upstream uClibc-ng is not compatible with 2.6.35
> You need to use the uClibc of the time - with pairing gcc/binutils - although that
> will be a can of worms

This is only the case for ARC, right?
Other architectures should work fine, like MIPS or ARM.

best regards
 Waldemar
 
