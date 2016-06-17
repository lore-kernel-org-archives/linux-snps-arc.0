From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Fri, 17 Jun 2016 05:58:40 -0000
Subject: kisskb: FAILED linux-next/axs101_defconfig/arcompact Fri Jun 17, 15:58
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160617055840.1.11495@7e2e7264739d>
To: linux-snps-arc@lists.infradead.org

FAILED linux-next/axs101_defconfig/arcompact Fri Jun 17, 15:58

http://kisskb.ellerman.id.au/kisskb/buildresult/12719853/

Commit:   Add linux-next specific files for 20160617
          ce24ed9ec7532bc79485f23dff59923c0271f6d3
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

arch/arc/include/asm/atomic.h:74:2: error: 'SCOND_FAIL_RETRY_VAR_DEF' undeclared (first use in this function)
include/linux/compiler-gcc.h:15:19: error: expected ';' before '__asm__'
arch/arc/include/asm/atomic.h:87:2: error: expected ':' or ')' before 'SCOND_FAIL_RETRY_ASM'
arch/arc/include/asm/atomic.h:74:2: error: 'SCOND_FAIL_RETRY_VAR_DEF' undeclared (first use in this function)
include/linux/compiler-gcc.h:15:19: error: expected ';' before '__asm__'
arch/arc/include/asm/atomic.h:87:2: error: expected ':' or ')' before 'SCOND_FAIL_RETRY_ASM'
arch/arc/include/asm/atomic.h:74:2: error: 'SCOND_FAIL_RETRY_VAR_DEF' undeclared (first use in this function)
include/linux/compiler-gcc.h:15:19: error: expected ';' before '__asm__'
arch/arc/include/asm/atomic.h:87:2: error: expected ':' or ')' before 'SCOND_FAIL_RETRY_ASM'
arch/arc/include/asm/atomic.h:74:2: error: 'SCOND_FAIL_RETRY_VAR_DEF' undeclared (first use in this function)
include/linux/compiler-gcc.h:15:19: error: expected ';' before '__asm__'
arch/arc/include/asm/atomic.h:87:2: error: expected ':' or ')' before 'SCOND_FAIL_RETRY_ASM'
arch/arc/include/asm/atomic.h:74:2: error: 'SCOND_FAIL_RETRY_VAR_DEF' undeclared (first use in this function)
include/linux/compiler-gcc.h:15:19: error: expected ';' before '__asm__'
arch/arc/include/asm/atomic.h:87:2: error: expected ':' or ')' before 'SCOND_FAIL_RETRY_ASM'
arch/arc/include/asm/atomic.h:74:2: error: 'SCOND_FAIL_RETRY_VAR_DEF' undeclared (first use in this function)
include/linux/compiler-gcc.h:15:19: error: expected ';' before '__asm__'
arch/arc/include/asm/atomic.h:87:2: error: expected ':' or ')' before 'SCOND_FAIL_RETRY_ASM'
make[2]: *** [arch/arc/kernel/asm-offsets.s] Error 1
make[1]: *** [prepare0] Error 2
make: *** [sub-make] Error 2

Possible warnings (6)
----------------------

arch/arc/include/asm/atomic.h:73:15: warning: unused variable 'val' [-Wunused-variable]
arch/arc/include/asm/atomic.h:73:15: warning: unused variable 'val' [-Wunused-variable]
arch/arc/include/asm/atomic.h:73:15: warning: unused variable 'val' [-Wunused-variable]
arch/arc/include/asm/atomic.h:73:15: warning: unused variable 'val' [-Wunused-variable]
arch/arc/include/asm/atomic.h:73:15: warning: unused variable 'val' [-Wunused-variable]
arch/arc/include/asm/atomic.h:73:15: warning: unused variable 'val' [-Wunused-variable]
