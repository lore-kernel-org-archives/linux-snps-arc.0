From: Luis.Oliveira@synopsys.com (Luis Oliveira)
Date: Tue, 8 Nov 2016 10:51:01 +0000
Subject: Errors building kernel 4.9-rc4
In-Reply-To: <1fb6ab4d-0942-714e-06d7-e663bc20aa49@synopsys.com>
References: <1fb6ab4d-0942-714e-06d7-e663bc20aa49@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <695506bc-3546-8469-0f3b-b47f013156b7@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi all,

Below is a list of errors while compiling a clean image of kernel 4.9-rc4.

Regards,
Luis
---------

./arch/arc/include/asm/bitops.h: Assembler messages:
./arch/arc/include/asm/bitops.h:233: Error: bad instruction `llock r2,[r3]'
./arch/arc/include/asm/bitops.h:235: Error: bad instruction `scond r4,[r3]'
make[4]: *** [arch/arc/mm/tlb.o] Error 1
make[4]: *** Waiting for unfinished jobs....
 
/home/lolivei/Desktop/SW/i2c/buildroot/buildroot-arc-2016.02-rc2/output/host/usr/bin/arc-buildroot-linux-uclibc-gcc
-Wp,-MD,arch/arc/kernel/.process.o.d  -nostdinc -isystem
/home/lolivei/Desktop/SW/i2c/buildroot/buildroot-arc-2016.02-rc2/output/host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.5/include
-I./arch/arc/include -I./arch/arc/include/generated/uapi
-I./arch/arc/include/generated  -I./include -I./arch/arc/include/uapi
-I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h
-include ./arch/arc/include/asm/current.h -D__KERNEL__ -Wall -Wundef
-Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common
-Werror-implicit-function-declaration -Wno-format-security -std=gnu89
-fno-common -pipe -fno-builtin -D__linux__ -mA7 -fsection-anchors
-fasynchronous-unwind-tables -mno-sdata -fcall-used-gp
-fno-delete-null-pointer-checks -Wno-maybe-uninitialized -O2
--param=allow-store-data-races=0 -Wframe-larger-than=1024 -fno-stack-protector
-Wno-unused-but-set-variable -fomit-frame-pointer -fno-var-tracking-assignments
-Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow
-fconserve-stack -Werror=implicit-int -Werror=strict-prototypes
-DCC_HAVE_ASM_GOTO -O3    -DKBUILD_BASENAME='"process"' 
-DKBUILD_MODNAME='"process"' -c -o arch/arc/kernel/process.o
arch/arc/kernel/process.c
 
/home/lolivei/Desktop/SW/i2c/buildroot/buildroot-arc-2016.02-rc2/output/host/usr/bin/arc-buildroot-linux-uclibc-gcc
-Wp,-MD,arch/arc/kernel/.devtree.o.d  -nostdinc -isystem
/home/lolivei/Desktop/SW/i2c/buildroot/buildroot-arc-2016.02-rc2/output/host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.5/include
-I./arch/arc/include -I./arch/arc/include/generated/uapi
-I./arch/arc/include/generated  -I./include -I./arch/arc/include/uapi
-I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h
-include ./arch/arc/include/asm/current.h -D__KERNEL__ -Wall -Wundef
-Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common
-Werror-implicit-function-declaration -Wno-format-security -std=gnu89
-fno-common -pipe -fno-builtin -D__linux__ -mA7 -fsection-anchors
-fasynchronous-unwind-tables -mno-sdata -fcall-used-gp
-fno-delete-null-pointer-checks -Wno-maybe-uninitialized -O2
--param=allow-store-data-races=0 -Wframe-larger-than=1024 -fno-stack-protector
-Wno-unused-but-set-variable -fomit-frame-pointer -fno-var-tracking-assignments
-Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow
-fconserve-stack -Werror=implicit-int -Werror=strict-prototypes
-DCC_HAVE_ASM_GOTO -O3    -DKBUILD_BASENAME='"devtree"' 
-DKBUILD_MODNAME='"devtree"' -c -o arch/arc/kernel/devtree.o
arch/arc/kernel/devtree.c
./arch/arc/include/asm/bitops.h: Assembler messages:
./arch/arc/include/asm/bitops.h:234: Error: bad instruction `llock r2,[r0]'
./arch/arc/include/asm/bitops.h:236: Error: bad instruction `scond r2,[r0]'
./arch/arc/include/asm/bitops.h:234: Error: bad instruction `llock r2,[r15]'
./arch/arc/include/asm/bitops.h:236: Error: bad instruction `scond r2,[r15]'
./arch/arc/include/asm/bitops.h:234: Error: bad instruction `llock r2,[r14]'
./arch/arc/include/asm/bitops.h:236: Error: bad instruction `scond r2,[r14]'
./arch/arc/include/asm/bitops.h:234: Error: bad instruction `llock r2,[r13]'
./arch/arc/include/asm/bitops.h:236: Error: bad instruction `scond r2,[r13]'
make[4]: *** [arch/arc/mm/cache.o] Error 1
make[3]: *** [arch/arc/mm] Error 2
make[3]: *** Waiting for unfinished jobs....
 
/home/lolivei/Desktop/SW/i2c/buildroot/buildroot-arc-2016.02-rc2/output/host/usr/bin/arc-buildroot-linux-uclibc-gcc
-Wp,-MD,arch/arc/kernel/.signal.o.d  -nostdinc -isystem
/home/lolivei/Desktop/SW/i2c/buildroot/buildroot-arc-2016.02-rc2/output/host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.5/include
-I./arch/arc/include -I./arch/arc/include/generated/uapi
-I./arch/arc/include/generated  -I./include -I./arch/arc/include/uapi
-I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h
-include ./arch/arc/include/asm/current.h -D__KERNEL__ -Wall -Wundef
-Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common
-Werror-implicit-function-declaration -Wno-format-security -std=gnu89
-fno-common -pipe -fno-builtin -D__linux__ -mA7 -fsection-anchors
-fasynchronous-unwind-tables -mno-sdata -fcall-used-gp
-fno-delete-null-pointer-checks -Wno-maybe-uninitialized -O2
--param=allow-store-data-races=0 -Wframe-larger-than=1024 -fno-stack-protector
-Wno-unused-but-set-variable -fomit-frame-pointer -fno-var-tracking-assignments
-Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow
-fconserve-stack -Werror=implicit-int -Werror=strict-prototypes
-DCC_HAVE_ASM_GOTO -O3    -DKBUILD_BASENAME='"signal"' 
-DKBUILD_MODNAME='"signal"' -c -o arch/arc/kernel/signal.o arch/arc/kernel/signal.c
 
/home/lolivei/Desktop/SW/i2c/buildroot/buildroot-arc-2016.02-rc2/output/host/usr/bin/arc-buildroot-linux-uclibc-gcc
-Wp,-MD,arch/arc/kernel/.traps.o.d  -nostdinc -isystem
/home/lolivei/Desktop/SW/i2c/buildroot/buildroot-arc-2016.02-rc2/output/host/usr/lib/gcc/arc-buildroot-linux-uclibc/4.8.5/include
-I./arch/arc/include -I./arch/arc/include/generated/uapi
-I./arch/arc/include/generated  -I./include -I./arch/arc/include/uapi
-I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h
-include ./arch/arc/include/asm/current.h -D__KERNEL__ -Wall -Wundef
-Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common
-Werror-implicit-function-declaration -Wno-format-security -std=gnu89
-fno-common -pipe -fno-builtin -D__linux__ -mA7 -fsection-anchors
-fasynchronous-unwind-tables -mno-sdata -fcall-used-gp
-fno-delete-null-pointer-checks -Wno-maybe-uninitialized -O2
--param=allow-store-data-races=0 -Wframe-larger-than=1024 -fno-stack-protector
-Wno-unused-but-set-variable -fomit-frame-pointer -fno-var-tracking-assignments
-Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow
-fconserve-stack -Werror=implicit-int -Werror=strict-prototypes
-DCC_HAVE_ASM_GOTO -O3    -DKBUILD_BASENAME='"traps"' 
-DKBUILD_MODNAME='"traps"' -c -o arch/arc/kernel/traps.o arch/arc/kernel/traps.c
./arch/arc/include/asm/bitops.h: Assembler messages:
./arch/arc/include/asm/bitops.h:234: Error: bad instruction `llock r3,[r2]'
./arch/arc/include/asm/bitops.h:236: Error: bad instruction `scond r4,[r2]'
./arch/arc/include/asm/bitops.h:234: Error: bad instruction `llock r3,[r2]'
./arch/arc/include/asm/bitops.h:236: Error: bad instruction `scond r4,[r2]'
make[4]: *** [arch/arc/kernel/signal.o] Error 1
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [arch/arc/kernel] Error 2
make[2]: *** [arch/arc] Error 2
make[1]: ***
[/home/lolivei/Desktop/SW/i2c/buildroot/buildroot-arc-2016.02-rc2/output/build/linux-custom/.stamp_built]
Error 2
make: *** [_all] Error 2
