From: geert@linux-m68k.org (Geert Uytterhoeven)
Date: Mon, 17 Oct 2016 09:34:53 +0200
Subject: Build regressions/improvements in v4.9-rc1
In-Reply-To: <1476688913-15648-1-git-send-email-geert@linux-m68k.org>
References: <1476688913-15648-1-git-send-email-geert@linux-m68k.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAMuHMdVety8LeBgM1ZHfqw=NMjH5_=sQR=LLypQ1-YjxnuvaiQ@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Oct 17, 2016 at 9:21 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Below is the list of build error/warning regressions/improvements in
> v4.9-rc1[1] compared to v4.8[2].

> [1] http://kisskb.ellerman.id.au/kisskb/head/11053/ (all 262 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/head/10989/ (all 262 configs)

> 48 error regressions:
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `llockd r2,[r0]':  => 476
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `llockd r2,[r13]':  => 475
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `llockd r2,[r4]':  => 475
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `llockd r2,[r5]':  => 475
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `llockd r2,[r6]':  => 475, 476
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `llockd r2,[r8]':  => 476, 475, 515
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `llockd r4,[r11]':  => 476
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `llockd r4,[r13]':  => 493, 475
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `llockd r4,[r14]':  => 475
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `llockd r4,[r18]':  => 493
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `llockd r4,[r21]':  => 493
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `llockd r4,[r6]':  => 476, 475, 515
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `llockd r4,[r7]':  => 475
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `llockd r6,[r12]':  => 493
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `llockd r6,[r3]':  => 475
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `llockd r6,[r8]':  => 493
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `llockd r6,[r9]':  => 493
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r0,[r6]':  => 516
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r10,[r12]':  => 496
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r14,[r9]':  => 496
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r16,[r8]':  => 496
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r2,[r0]':  => 479
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r2,[r13]':  => 496, 478
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r2,[r18]':  => 496
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r2,[r21]':  => 496
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r2,[r4]':  => 478
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r2,[r5]':  => 478
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r2,[r6]':  => 478, 516, 479
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r2,[r8]':  => 479, 478
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r4,[r11]':  => 479
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r4,[r13]':  => 478
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r4,[r14]':  => 478
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r4,[r6]':  => 479, 478
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r4,[r7]':  => 478
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r4,[r8]':  => 516
>   + /home/kisskb/slave/src/arch/arc/include/asm/atomic.h: Error: bad instruction `scondd r6,[r3]':  => 478

arcv2/axs103_smp_defconfig

>   + /home/kisskb/slave/src/arch/powerpc/kvm/book3s_hv_rm_xics.c: error: implicit declaration of function 'get_hard_smp_processor_id' [-Werror=implicit-function-declaration]:  => 758:2

powerpc/ppc64_defconfig+UP

>   + /home/kisskb/slave/src/drivers/dma/omap-dma.c: error: unrecognizable insn::  => 350:1

cris-allyesconfig
cris-allmodconfig

>   + error: ".irq_set_parent" [drivers/mfd/tps65217.ko] undefined!:  => N/A
>   + error: "irq_set_parent" [drivers/mfd/tps65217.ko] undefined!:  => N/A

ppc64le/allmodconfig+ppc64le
powerpc/powerpc-allmodconfig

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert at linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
