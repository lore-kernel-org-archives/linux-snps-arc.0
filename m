From: noreply@ellerman.id.au (noreply@ellerman.id.au)
Date: Mon, 17 Oct 2016 02:29:36 -0000
Subject: kisskb: FAILED linux-next/axs103_smp_defconfig/arcv2 Mon Oct 17, 13:29
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161017022936.1.93604@8e2d6d7be827>
To: linux-snps-arc@lists.infradead.org

FAILED linux-next/axs103_smp_defconfig/arcv2 Mon Oct 17, 13:29

http://kisskb.ellerman.id.au/kisskb/buildresult/12833193/

Commit:   Add linux-next specific files for 20161016
          caa9243fcc00956ed9783b6f32ca69bfb75e4177
Compiler: arc-buildroot-linux-uclibc-gcc (Buildroot 2015.08.1) 4.8.4

Possible errors
---------------

arch/arc/include/asm/atomic.h:475: Error: bad instruction `llockd r2,[r6]'
arch/arc/include/asm/atomic.h:478: Error: bad instruction `scondd r2,[r6]'
arch/arc/include/asm/atomic.h:476: Error: bad instruction `llockd r2,[r0]'
arch/arc/include/asm/atomic.h:479: Error: bad instruction `scondd r2,[r0]'
arch/arc/include/asm/atomic.h:475: Error: bad instruction `llockd r2,[r8]'
arch/arc/include/asm/atomic.h:478: Error: bad instruction `scondd r2,[r8]'
arch/arc/include/asm/atomic.h:476: Error: bad instruction `llockd r2,[r8]'
arch/arc/include/asm/atomic.h:479: Error: bad instruction `scondd r2,[r8]'
arch/arc/include/asm/atomic.h:475: Error: bad instruction `llockd r2,[r6]'
arch/arc/include/asm/atomic.h:478: Error: bad instruction `scondd r2,[r6]'
arch/arc/include/asm/atomic.h:476: Error: bad instruction `llockd r2,[r6]'
arch/arc/include/asm/atomic.h:479: Error: bad instruction `scondd r2,[r6]'
arch/arc/include/asm/atomic.h:475: Error: bad instruction `llockd r4,[r6]'
arch/arc/include/asm/atomic.h:478: Error: bad instruction `scondd r4,[r6]'
arch/arc/include/asm/atomic.h:476: Error: bad instruction `llockd r4,[r11]'
arch/arc/include/asm/atomic.h:479: Error: bad instruction `scondd r4,[r11]'
make[3]: *** [arch/arc/kernel/perf_event.o] Error 1
make[2]: *** [arch/arc/kernel] Error 2
make[1]: *** [arch/arc] Error 2
arch/arc/include/asm/atomic.h:475: Error: bad instruction `llockd r2,[r4]'
arch/arc/include/asm/atomic.h:478: Error: bad instruction `scondd r2,[r4]'
arch/arc/include/asm/atomic.h:475: Error: bad instruction `llockd r2,[r4]'
arch/arc/include/asm/atomic.h:478: Error: bad instruction `scondd r2,[r4]'
make[2]: *** [fs/namespace.o] Error 1
make[1]: *** [fs] Error 2
arch/arc/include/asm/atomic.h:475: Error: bad instruction `llockd r4,[r6]'
arch/arc/include/asm/atomic.h:478: Error: bad instruction `scondd r4,[r6]'
make[3]: *** [kernel/bpf/core.o] Error 1
make[2]: *** [kernel/bpf] Error 2
arch/arc/include/asm/atomic.h:515: Error: bad instruction `llockd r4,[r6]'
arch/arc/include/asm/atomic.h:516: Error: bad instruction `scondd r0,[r6]'
arch/arc/include/asm/atomic.h:475: Error: bad instruction `llockd r4,[r13]'
arch/arc/include/asm/atomic.h:478: Error: bad instruction `scondd r4,[r13]'
arch/arc/include/asm/atomic.h:515: Error: bad instruction `llockd r4,[r6]'
arch/arc/include/asm/atomic.h:516: Error: bad instruction `scondd r2,[r6]'
arch/arc/include/asm/atomic.h:475: Error: bad instruction `llockd r4,[r13]'
arch/arc/include/asm/atomic.h:478: Error: bad instruction `scondd r4,[r13]'
arch/arc/include/asm/atomic.h:515: Error: bad instruction `llockd r4,[r6]'
arch/arc/include/asm/atomic.h:516: Error: bad instruction `scondd r0,[r6]'
arch/arc/include/asm/atomic.h:475: Error: bad instruction `llockd r4,[r13]'
arch/arc/include/asm/atomic.h:478: Error: bad instruction `scondd r4,[r13]'
arch/arc/include/asm/atomic.h:515: Error: bad instruction `llockd r4,[r6]'
arch/arc/include/asm/atomic.h:516: Error: bad instruction `scondd r2,[r6]'
arch/arc/include/asm/atomic.h:475: Error: bad instruction `llockd r4,[r13]'
arch/arc/include/asm/atomic.h:478: Error: bad instruction `scondd r4,[r13]'
arch/arc/include/asm/atomic.h:515: Error: bad instruction `llockd r4,[r6]'
arch/arc/include/asm/atomic.h:516: Error: bad instruction `scondd r0,[r6]'
arch/arc/include/asm/atomic.h:475: Error: bad instruction `llockd r4,[r13]'
arch/arc/include/asm/atomic.h:478: Error: bad instruction `scondd r4,[r13]'
arch/arc/include/asm/atomic.h:515: Error: bad instruction `llockd r4,[r6]'
arch/arc/include/asm/atomic.h:516: Error: bad instruction `scondd r0,[r6]'
arch/arc/include/asm/atomic.h:475: Error: bad instruction `llockd r4,[r13]'
arch/arc/include/asm/atomic.h:478: Error: bad instruction `scondd r4,[r13]'
arch/arc/include/asm/atomic.h:475: Error: bad instruction `llockd r2,[r13]'
arch/arc/include/asm/atomic.h:478: Error: bad instruction `scondd r2,[r13]'
arch/arc/include/asm/atomic.h:515: Error: bad instruction `llockd r2,[r8]'
arch/arc/include/asm/atomic.h:516: Error: bad instruction `scondd r4,[r8]'
{standard input}:6809: Error: Instruction with long immediate data in delay slot
arch/arc/include/asm/atomic.h:493: Error: bad instruction `llockd r4,[r21]'
arch/arc/include/asm/atomic.h:496: Error: bad instruction `scondd r2,[r21]'
make[2]: *** [block/cfq-iosched.o] Error 1
make[1]: *** [block] Error 2
arch/arc/include/asm/atomic.h:493: Error: bad instruction `llockd r4,[r18]'
arch/arc/include/asm/atomic.h:496: Error: bad instruction `scondd r2,[r18]'
arch/arc/include/asm/atomic.h:475: Error: bad instruction `llockd r4,[r7]'
arch/arc/include/asm/atomic.h:478: Error: bad instruction `scondd r4,[r7]'
arch/arc/include/asm/atomic.h:475: Error: bad instruction `llockd r4,[r13]'
arch/arc/include/asm/atomic.h:478: Error: bad instruction `scondd r4,[r13]'
arch/arc/include/asm/atomic.h:493: Error: bad instruction `llockd r4,[r13]'
arch/arc/include/asm/atomic.h:496: Error: bad instruction `scondd r2,[r13]'
arch/arc/include/asm/atomic.h:475: Error: bad instruction `llockd r2,[r4]'
arch/arc/include/asm/atomic.h:478: Error: bad instruction `scondd r2,[r4]'
arch/arc/include/asm/atomic.h:475: Error: bad instruction `llockd r4,[r6]'
arch/arc/include/asm/atomic.h:478: Error: bad instruction `scondd r4,[r6]'
arch/arc/include/asm/atomic.h:475: Error: bad instruction `llockd r4,[r14]'
arch/arc/include/asm/atomic.h:478: Error: bad instruction `scondd r4,[r14]'
make[3]: *** [kernel/events/core.o] Error 1
make[2]: *** [kernel/events] Error 2
make[1]: *** [kernel] Error 2
make: *** [sub-make] Error 2

Possible warnings (2)
----------------------

block/cfq-iosched.c:3826:1: warning: control reaches end of non-void function [-Wreturn-type]
include/linux/kernel.h:739:16: warning: comparison of distinct pointer types lacks a cast [enabled by default]
