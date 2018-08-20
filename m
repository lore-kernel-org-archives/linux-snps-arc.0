From: christian.ruppert@alitech.com (Christian Ruppert)
Date: Mon, 20 Aug 2018 16:51:01 +0200
Subject: [PATCH] gpio: tb10x: Use the right include
In-Reply-To: <20180806142321.32025-1-linus.walleij@linaro.org>
References: <20180806142321.32025-1-linus.walleij@linaro.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <2f031620-471a-aba5-ffaf-26a797e378a6@alitech.com>
To: linux-snps-arc@lists.infradead.org

Acked-by: Christian Ruppert <christian.ruppert at alitech.com>

On 06.08.2018 16:23, Linus Walleij wrote:
> This driver includes the legacy <linux/gpio.h> and
> <linux/of_gpio.h> but all it needs is really <linux/gpio/driver.h>.
> 
> Cc: linux-snps-arc at lists.infradead.org
> Cc: Christian Ruppert <christian.ruppert at alitech.com>
> Signed-off-by: Linus Walleij <linus.walleij at linaro.org>
> ---
>  drivers/gpio/gpio-tb10x.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
> index ac6f2a9841e5..a12cd0b5c972 100644
> --- a/drivers/gpio/gpio-tb10x.c
> +++ b/drivers/gpio/gpio-tb10x.c
> @@ -22,7 +22,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> -#include <linux/gpio.h>
> +#include <linux/gpio/driver.h>
>  #include <linux/slab.h>
>  #include <linux/irq.h>
>  #include <linux/irqdomain.h>
> @@ -30,7 +30,6 @@
>  #include <linux/io.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> -#include <linux/of_gpio.h>
>  #include <linux/spinlock.h>
>  #include <linux/bitops.h>
>  #include <linux/pinctrl/consumer.h>
> 
