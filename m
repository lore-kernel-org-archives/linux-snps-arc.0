From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 4 Apr 2016 15:41:50 +0530
Subject: weird build issue
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <57023DE6.6040806@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

I'm running into a really weird build issue when building 4.6-rc1 for ARC
(although this doesn't seem to be version related)

I have 2 source trees and I see a build error in only one with exact same everything.

~/arc/k.org>make mrproper
~/arc/k.org>make ARCH=arc axs103_smp_defconfig O=tmp
~/arc/k.org>cd tmp
~/arc/k.org>make ARCH=arc

The issue is rules for asm-generic headers from Kbuild not triggering.

------------>8----------------
  GEN     ./Makefile
scripts/kconfig/conf  --silentoldconfig Kconfig
drivers/pci/pcie/Kconfig:62:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:68:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:75:warning: choice value used outside its choice group
  CHK     include/config/kernel.release
  UPD     include/config/kernel.release
  Using .. as source for kernel
  GEN     ./Makefile
  CHK     include/generated/uapi/linux/version.h
  UPD     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  UPD     include/generated/utsrelease.h
  HOSTCC  scripts/basic/bin2c
  CC      kernel/bounds.s
In file included from ../include/linux/types.h:5:0,
                 from ../include/linux/page-flags.h:8,
                 from ../kernel/bounds.c:9:
../include/uapi/linux/types.h:4:23: fatal error: asm/types.h: No such file or
directory
 #include <asm/types.h>
                       ^
compilation terminated.
.././Kbuild:44: recipe for target 'kernel/bounds.s' failed
------------>8-------------------


On a different source folder, with exact same kernel version checked out, and a
pristine build folder, same instructions as above and I see the headers generated
ahead of bound.s compilation, eliding the error. I'm sure it is something stupid
at my end....


------------>8-------------------
  GEN     ./Makefile
scripts/kconfig/conf  --silentoldconfig Kconfig
drivers/pci/pcie/Kconfig:62:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:68:warning: choice value used outside its choice group
drivers/pci/pcie/Kconfig:75:warning: choice value used outside its choice group
  CHK     include/config/kernel.release
  UPD     include/config/kernel.release
  Using .. as source for kernel
  GEN     ./Makefile
  WRAP    arch/arc/include/generated/asm/auxvec.h
...
  HOSTCC  scripts/basic/bin2c
  CC      kernel/bounds.s
------------>8-------------------


TIA for any pointers,
-Vineet
