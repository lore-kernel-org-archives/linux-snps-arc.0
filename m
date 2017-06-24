From: geert@linux-m68k.org (Geert Uytterhoeven)
Date: Sat, 24 Jun 2017 11:41:42 +0200
Subject: [PATCH 2/3] pci: Add a generic,
 weakly-linked pcibios_align_resource
In-Reply-To: <20170624015044.16746-3-palmer@dabbelt.com>
References: <20170624015044.16746-1-palmer@dabbelt.com>
 <20170624015044.16746-3-palmer@dabbelt.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAMuHMdWrn4C5nwRSrA8i_8sFtpRbuQH9vtNWjq5rM5_Si15kbw@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

Hi Palmer,

On Sat, Jun 24, 2017@3:50 AM, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> Multiple architectures define this as trivial function, and I'm adding
> another one as part of the RISC-V port.  This adds a __weak version of
> pcibios_align_resource and deletes the now obselete ones in a handful of
> ports.
>
> The only functional change should be that a handful of ports used to
> export pcibios_fixup_bus.  Only some architectures export this, so I
> just dropped it.
>
> Signed-off-by: Palmer Dabbelt <palmer at dabbelt.com>

This function is only ever used as a pointer passed to
pci_bus_alloc_resource()?

What about having

    #ifndef pcibios_fixup_bus
    #define pcibios_fixup_bus NULL
    #endif

in asm-generic/pci.h, letting the architecture with a non-trivial
implementation predefine the preprocessor symbol, and teaching
pci_bus_alloc_resource() to handle NULL?

[...]

Oh, the latter eventually calls into allocate_resource(), which already falls
back to simple_align_resource() if the alignment function is NULL, which
does the same thing.
So NULL should already work.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert at linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
