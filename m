From: thomas.petazzoni@free-electrons.com (Thomas Petazzoni)
Date: Thu, 27 Oct 2016 12:04:17 +0200
Subject: Build regressions/improvements in v4.9-rc1
In-Reply-To: <3060589.4sao41u0pp@wuerfel>
References: <1476688913-15648-1-git-send-email-geert@linux-m68k.org>
 <1477559240.2561.8.camel@synopsys.com>
 <20161027111118.5c585d51@free-electrons.com>
 <3060589.4sao41u0pp@wuerfel>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161027120417.3a249aa2@free-electrons.com>
To: linux-snps-arc@lists.infradead.org

Hello,

On Thu, 27 Oct 2016 11:32:11 +0200, Arnd Bergmann wrote:

> A couple of other architectures do this as well:
> 
> $ git grep -w LIBGCC arch/*/Makefile
> arch/arc/Makefile:LIBGCC        := $(shell $(CC) $(cflags-y) --print-libgcc-file-name)
> arch/arc/Makefile:libs-y                += arch/arc/lib/ $(LIBGCC)
> arch/cris/Makefile:LIBGCC = $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libgcc.a)
> arch/cris/Makefile:libs-y               += arch/cris/$(SARCH)/lib/ $(LIBGCC)
> arch/hexagon/Makefile:LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
> arch/hexagon/Makefile:libs-y += $(LIBGCC)
> arch/m32r/Makefile:LIBGCC       := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
> arch/m32r/Makefile:libs-y       += arch/m32r/lib/ $(LIBGCC)
> arch/nios2/Makefile:LIBGCC         := $(shell $(CC) $(KBUILD_CFLAGS) $(KCFLAGS) -print-libgcc-file-name)
> arch/nios2/Makefile:libs-y              += arch/nios2/lib/ $(LIBGCC)
> arch/openrisc/Makefile:LIBGCC           := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
> arch/openrisc/Makefile:libs-y           += $(LIBGCC)
> arch/parisc/Makefile:LIBGCC             = $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
> arch/parisc/Makefile:libs-y     += arch/parisc/lib/ $(LIBGCC)
> arch/xtensa/Makefile:LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
> arch/xtensa/Makefile:libs-y             += arch/xtensa/lib/ $(LIBGCC)
> 
> It's also not always freestanding on the architectures that don't
> include libgcc:
> 
> $ git grep ffreestanding arch/
> arch/mips/Makefile:cflags-y += -ffreestanding
> arch/s390/boot/compressed/Makefile:KBUILD_CFLAGS += $(call cc-option,-ffreestanding)
> arch/score/Makefile:    -D__linux__ -ffunction-sections -ffreestanding
> arch/sh/Makefile:cflags-y       += $(isaflags-y) -ffreestanding
> arch/x86/Makefile:        KBUILD_CFLAGS += -ffreestanding # temporary until string.h is fixed
> arch/xtensa/Makefile:KBUILD_CFLAGS += -ffreestanding -D__linux__
> 
> (xtensa being the only one that apparently uses libgcc *and* passes
>  -ffreestanding, for whatever reasons).
> 
> The other architectures tend to implement the parts of libgcc that they
> need in the kernel.

Thanks for the details, good to know!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
