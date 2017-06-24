From: geert@linux-m68k.org (Geert Uytterhoeven)
Date: Sat, 24 Jun 2017 11:34:06 +0200
Subject: [PATCH 1/3] pci: Add a generic, weakly-linked pcibios_fixup_bus
In-Reply-To: <20170624015044.16746-2-palmer@dabbelt.com>
References: <20170624015044.16746-1-palmer@dabbelt.com>
 <20170624015044.16746-2-palmer@dabbelt.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAMuHMdWd_4GzySTWsb5PupBw3UkLUKAwE-OvAgHScZutT-wiNQ@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

Hi Palmer,

On Sat, Jun 24, 2017@3:50 AM, Palmer Dabbelt <palmer@dabbelt.com> wrote:
> Multiple architectures define this as an empty function, and I'm adding
> another one as part of the RISC-V port.  This adds a __weak version of
> pci_fixup_bios and deletes the now obselete ones in a handful of ports.
>
> The only functional change should be that microblaze used to export
> pcibios_fixup_bus.  None of the other architectures export this, so I
> just dropped it.
>
> Signed-off-by: Palmer Dabbelt <palmer at dabbelt.com>

Given this is an empty function, wouldn't it make more sense to have
a static inline in asm-generic, protected by #ifndef pcibios_fixup_bus?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert at linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
