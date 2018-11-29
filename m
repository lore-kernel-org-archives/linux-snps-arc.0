From: arnd@arndb.de (Arnd Bergmann)
Date: Thu, 29 Nov 2018 22:20:11 +0100
Subject: [PATCH v2] ARC: io.h: Implement reads{x}()/writes{x}()
In-Reply-To: <d2d133e5-267c-c42a-7329-22892bbbdee4@synopsys.com>
References: <19fb2e394afcb073bbc109e432417fbbc03323f6.1543499759.git.joabreu@synopsys.com>
 <ff1e11923e92405d883474d715008c0a@AcuMS.aculab.com>
 <89122bd8-bca2-2ae1-0dd0-160abbebcace@synopsys.com>
 <d2d133e5-267c-c42a-7329-22892bbbdee4@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAK8P3a2U3ft3crF2SiAuc=PQdDooEUaVAN9gQDyxsxvBn5+xRw@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Thu, Nov 29, 2018@5:14 PM Jose Abreu <jose.abreu@synopsys.com> wrote:

> --->8--
> static noinline void test_readsl(char *buf, int len)
> {
>         readsl(0xdeadbeef, buf, len);
> }
> --->8---
>
> And the disassembly:
> --->8---
> 00000e88 <test_readsl>:
>  e88:    breq.dr1,0,eac <0xeac>        /* if (count) */
>  e8c:    and r2,r0,3
>
>  e90:    mov_s lp_count,r1            /* r1 = count */
>  e92:    brne r2,0,eb0 <0xeb0>        /* if (bptr % ((t) / 8)) */
>
>  e96:    sub r0,r0,4
>  e9a:    nop_s
>
>  e9c:    lp eac <0xeac>                /* first loop */
>  ea0:    ld r2,[0xdeadbeef]
>  ea8:    st.a r2,[r0,4]
>  eac:    j_s [blink]
>  eae:    nop_s
>
>  eb0:    lp ed6 <0xed6>                /* second loop */
>  eb4:    ld r2,[0xdeadbeef]
>  ebc:    lsr r5,r2,8
>  ec0:    lsr r4,r2,16
>  ec4:    lsr r3,r2,24
>  ec8:    stb_s r2,[r0,0]
>  eca:    stb r5,[r0,1]
>  ece:    stb r4,[r0,2]
>  ed2:    stb_s r3,[r0,3]
>  ed4:    add_s r0,r0,4
>  ed6:    j_s [blink]
>
> --->8---
>
> See how the if condition added in this version is checked in
> <test_readsl+0xe92> and then it takes two different loops.

This looks good to me. I wonder what the result is for CPUs
that /do/ support unaligned accesses. Normally put_unaligned()
should fall back to a simple store in that case, but I'm not
sure it can fold the two stores back into one and skip the
alignment check. Probably not worth overoptimizing for that
case (the MMIO access latency should be much higher than
anything you could gain here), but I'm still curious about
how well our get/put_unaligned macros work.

       Arnd
