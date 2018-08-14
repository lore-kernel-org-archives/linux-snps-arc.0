From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Tue, 14 Aug 2018 18:13:07 -0000
Subject: kisskb: FAILED linus/axs101_defconfig/arcompact Wed Aug 15, 04:12
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180814181307.1.89810@9fb97a98600c>
To: linux-snps-arc@lists.infradead.org

FAILED linus/axs101_defconfig/arcompact Wed Aug 15, 04:12

http://kisskb.ellerman.id.au/kisskb/buildresult/13466202/

Commit:   Merge branch 'l1tf-final' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
          958f338e96f874a0d29442396d6adf9c1e17aa2d
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

kernel/cpu.c:2275:28: error: 'struct cpuhp_cpu_state' has no member named 'booted_once'
kernel/cpu.c:2275:28: error: 'struct cpuhp_cpu_state' has no member named 'booted_once'
kernel/cpu.c:2275:28: error: 'struct cpuhp_cpu_state' has no member named 'booted_once'
kernel/cpu.c:2275:28: error: 'struct cpuhp_cpu_state' has no member named 'booted_once'
kernel/cpu.c:2275:28: error: 'struct cpuhp_cpu_state' has no member named 'booted_once'
kernel/cpu.c:2275:28: error: 'struct cpuhp_cpu_state' has no member named 'booted_once'
kernel/cpu.c:2275:28: error: 'struct cpuhp_cpu_state' has no member named 'booted_once'
kernel/cpu.c:2275:28: error: 'struct cpuhp_cpu_state' has no member named 'booted_once'
kernel/cpu.c:2275:28: error: 'struct cpuhp_cpu_state' has no member named 'booted_once'
kernel/cpu.c:2275:28: error: 'struct cpuhp_cpu_state' has no member named 'booted_once'
kernel/cpu.c:2275:28: error: 'struct cpuhp_cpu_state' has no member named 'booted_once'
kernel/cpu.c:2275:28: error: 'struct cpuhp_cpu_state' has no member named 'booted_once'
kernel/cpu.c:2275:28: error: 'struct cpuhp_cpu_state' has no member named 'booted_once'
kernel/cpu.c:2275:28: error: 'struct cpuhp_cpu_state' has no member named 'booted_once'
make[2]: *** [kernel/cpu.o] Error 1
make[1]: *** [kernel] Error 2
make: *** [sub-make] Error 2

Possible warnings (3)
----------------------

<stdin>:1335:2: warning: #warning syscall rseq not implemented [-Wcpp]
include/linux/kernel.h:812:29: warning: comparison of distinct pointer types lacks a cast [enabled by default]
net/ipv4/tcp_input.c:4313:49: warning: array subscript is above array bounds [-Warray-bounds]
