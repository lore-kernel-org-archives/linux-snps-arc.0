From: geert@linux-m68k.org (Geert Uytterhoeven)
Date: Mon, 29 Aug 2016 18:18:15 +0200
Subject: Build regressions/improvements in v4.8-rc1
In-Reply-To: <89010fe1-8f08-0cd9-a23e-455e5288f136@synopsys.com>
References: <alpine.DEB.2.10.1608081032130.9359@ayla.of.borg>
 <CAMuHMdW_fPP5dyOtRC98gh1kG-zuW_KxV7vAME_7b8Z-U10N_g@mail.gmail.com>
 <89010fe1-8f08-0cd9-a23e-455e5288f136@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAMuHMdXJpH06VCP8wtidXoCgcQ+0PO_x-=+uc0wCubb3OFcq5w@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Mon, Aug 8, 2016@6:28 PM, Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
> On 08/08/2016 01:38 AM, Geert Uytterhoeven wrote:
>>>   + {standard input}: Error: Instruction with long immediate data in delay slot:  => 18728
>> arcv2/axs103_smp_defconfig
>
> What build service/farm does this use. Recently Guenter ran into this too and
> updated his toolchain to work around the gcc bug.

http://kisskb.ellerman.id.au/kisskb/ from the linux-next team.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert at linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
