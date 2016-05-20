From: geert@linux-m68k.org (Geert Uytterhoeven)
Date: Fri, 20 May 2016 09:34:06 +0200
Subject: [PATCH] irqchip: nps: add 64BIT dependency
In-Reply-To: <1463087038-2522527-1-git-send-email-arnd@arndb.de>
References: <1463087038-2522527-1-git-send-email-arnd@arndb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAMuHMdUGsgix3-r60rhv8ds+1n6mMbNGxsLR1h5PP3oHVsuBSw@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

Hi Arnd,

On Thu, May 12, 2016@11:03 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> The newly added nps irqchip driver causes build warnings on ARM64.
>
> include/soc/nps/common.h: In function 'nps_host_reg_non_cl':
> include/soc/nps/common.h:148:9: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>
> As the driver is only used on ARC, we don't need to see it without
> COMPILE_TEST elsewhere, and we can avoid the warnings by only
> building on 32-bit architectures even with CONFIG_COMPILE_TEST.
>
> Signed-off-by: Arnd Bergmann <arnd at arndb.de>
> ---
>  drivers/irqchip/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 83775f148158..37289cf6b449 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -253,6 +253,7 @@ config MVEBU_ODMI
>
>  config EZNPS_GIC
>         bool "NPS400 Global Interrupt Manager (GIM)"
> +       depends on ARC || (COMPILE_TEST && !64BIT)
>         select IRQ_DOMAIN
>         help
>           Support the EZchip NPS400 global interrupt controller

As ARC_PLAT_EZNPS already selects EZNPS_GIC, I'd like to suggest
the slight simpler (whitespace-damaged):

--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -255,7 +255,8 @@ config PARTITION_PERCPU
        bool

 config EZNPS_GIC
-       bool "NPS400 Global Interrupt Manager (GIM)"
+       bool "NPS400 Global Interrupt Manager (GIM)" if COMPILE_TEST
+       depends on !64BIT
        select IRQ_DOMAIN
        help
          Support the EZchip NPS400 global interrupt controller

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert at linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
