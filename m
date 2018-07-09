From: geert@linux-m68k.org (Geert Uytterhoeven)
Date: Mon, 9 Jul 2018 15:49:14 +0200
Subject: [PATCH] atomic{64}_t: Explicitly specify data storage length and
 alignment
In-Reply-To: <3d3ec70d99524a6fa7a38e7d2e0fdf98@AcuMS.aculab.com>
References: <20180709124741.21037-1-abrodkin@synopsys.com>
 <3d3ec70d99524a6fa7a38e7d2e0fdf98@AcuMS.aculab.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAMuHMdWQNZ-Dpakqk7mTJ-O_H0QnCd-KUWpWNJC_d6Yw8GH0Kg@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Mon, Jul 9, 2018@3:29 PM David Laight <David.Laight@aculab.com> wrote:
> From: Alexey Brodkin
> > Sent: 09 July 2018 13:48
> > Atomic instructions require data they operate on to be aligned
> > according to data size. I.e. 32-bit atomic values must be 32-bit
> > aligned while 64-bit values must be 64-bit aligned.
> >
> > Otherwise even if CPU may handle not-aligend normal data access,
> > still atomic instructions fail and typically raise an exception
> > leaving us dead in the water.
> ...
> > diff --git a/include/asm-generic/atomic64.h b/include/asm-generic/atomic64.h
> > index 8d28eb010d0d..b94b749b5952 100644
> > --- a/include/asm-generic/atomic64.h
> > +++ b/include/asm-generic/atomic64.h
> > @@ -13,7 +13,7 @@
> >  #define _ASM_GENERIC_ATOMIC64_H
> >
> >  typedef struct {
> > -     long long counter;
> > +     u64 __aligned(8) counter;
> >  } atomic64_t;
>
> Apart from the fact that this changes the value from signed to unsigned
> should most of the architectures be using this generic definition?

64-bit architectures use the one from include/linux/types.h instead.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert at linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
