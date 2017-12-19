From: geert@linux-m68k.org (Geert Uytterhoeven)
Date: Tue, 19 Dec 2017 12:49:24 +0100
Subject: [PATCH] bug.h: Work around GCC PR82365 in BUG()
In-Reply-To: <20171219114112.939391-1-arnd@arndb.de>
References: <20171219114112.939391-1-arnd@arndb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAMuHMdV3x6jqWj3S=U-rK4HB9oYSEO1fES0bKWjouu7QqapF3w@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

Hi Arnd,

On Tue, Dec 19, 2017@12:39 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> The name barrier_before_unreachable() is a bit suboptimal here,
> as it fails to describe the fact that it is needed for both
> __builtin_unreachable() and for calling noreturn functions.  Any other
> suggestions would be welcome here.

/me joins bikeshedding...

barrier_before_noreturn()?
barrier_before_dead_end()?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert at linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
