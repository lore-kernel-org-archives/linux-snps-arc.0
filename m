From: arnd@arndb.de (Arnd Bergmann)
Date: Thu, 27 Oct 2016 11:32:11 +0200
Subject: Build regressions/improvements in v4.9-rc1
In-Reply-To: <20161027111118.5c585d51@free-electrons.com>
References: <1476688913-15648-1-git-send-email-geert@linux-m68k.org>
 <1477559240.2561.8.camel@synopsys.com>
 <20161027111118.5c585d51@free-electrons.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3060589.4sao41u0pp@wuerfel>
To: linux-snps-arc@lists.infradead.org

On Thursday, October 27, 2016 11:11:18 AM CEST Thomas Petazzoni wrote:
> On Thu, 27 Oct 2016 09:07:55 +0000, Alexey Brodkin wrote:
> 
> > > axs101 is using a 770 core, while the toolchain is built for the HS38
> > > core. I'm somewhat surprised that a single ARC toolchain cannot produce
> > > code for both 770 and HS38, but it seems to be the case.
> > > 
> > > So you need a separate toolchain for ARC770.  
> > 
> > Indeed axs101 uses ARC770 core which is ARCv1 AKA ARCompact ISA while
> > axs103 sports the same base-board but CPU daughter-card contains ARC HS38 core
> > which has ARCv2 ISA (binary incompatible with ARCompact).
> > 
> > Essentially both gcc and binutils will happily build for both architectures given
> > proper options were passed on the command line. But Linux kernel gets linked with
> > pre-built libgcc (it is a part of toolchain). And so it all boils down to a requirement
> > to have multilibbed uClibc toolchain. Which we don't have.
> 
> Interesting. Why is libgcc linked with the kernel on ARC? I don't think
> that's the case on other architectures: the kernel is freestanding and
> provides everything that it needs without relying on the compiler
> runtime.

A couple of other architectures do this as well:

$ git grep -w LIBGCC arch/*/Makefile
arch/arc/Makefile:LIBGCC        := $(shell $(CC) $(cflags-y) --print-libgcc-file-name)
arch/arc/Makefile:libs-y                += arch/arc/lib/ $(LIBGCC)
arch/cris/Makefile:LIBGCC = $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libgcc.a)
arch/cris/Makefile:libs-y               += arch/cris/$(SARCH)/lib/ $(LIBGCC)
arch/hexagon/Makefile:LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
arch/hexagon/Makefile:libs-y += $(LIBGCC)
arch/m32r/Makefile:LIBGCC       := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
arch/m32r/Makefile:libs-y       += arch/m32r/lib/ $(LIBGCC)
arch/nios2/Makefile:LIBGCC         := $(shell $(CC) $(KBUILD_CFLAGS) $(KCFLAGS) -print-libgcc-file-name)
arch/nios2/Makefile:libs-y              += arch/nios2/lib/ $(LIBGCC)
arch/openrisc/Makefile:LIBGCC           := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
arch/openrisc/Makefile:libs-y           += $(LIBGCC)
arch/parisc/Makefile:LIBGCC             = $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
arch/parisc/Makefile:libs-y     += arch/parisc/lib/ $(LIBGCC)
arch/xtensa/Makefile:LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
arch/xtensa/Makefile:libs-y             += arch/xtensa/lib/ $(LIBGCC)

It's also not always freestanding on the architectures that don't
include libgcc:

$ git grep ffreestanding arch/
arch/mips/Makefile:cflags-y += -ffreestanding
arch/s390/boot/compressed/Makefile:KBUILD_CFLAGS += $(call cc-option,-ffreestanding)
arch/score/Makefile:    -D__linux__ -ffunction-sections -ffreestanding
arch/sh/Makefile:cflags-y       += $(isaflags-y) -ffreestanding
arch/x86/Makefile:        KBUILD_CFLAGS += -ffreestanding # temporary until string.h is fixed
arch/xtensa/Makefile:KBUILD_CFLAGS += -ffreestanding -D__linux__

(xtensa being the only one that apparently uses libgcc *and* passes
 -ffreestanding, for whatever reasons).

The other architectures tend to implement the parts of libgcc that they
need in the kernel.

	Arnd
