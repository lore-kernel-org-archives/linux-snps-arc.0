From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Fri, 31 May 2019 16:25:54 +0200
Subject: [PATCH] clocksource: arc_timer: use BIT() instead of _BITUL()
In-Reply-To: <20190524054010.19323-1-yamada.masahiro@socionext.com>
References: <20190524054010.19323-1-yamada.masahiro@socionext.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <464f954c-cdd4-aeba-2071-406aab57830c@linaro.org>
To: linux-snps-arc@lists.infradead.org

On 24/05/2019 07:40, Masahiro Yamada wrote:
> This is in-kernel C code, so there is no reason to use _BITUL().
> Replace it with equivalent BIT().
> 
> I added #include <linux/bits.h> explicitly although it has been included
> by other headers eventually.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro at socionext.com>
> ---

Applied, thanks!


-- 
 <http://www.linaro.org/> Linaro.org ? Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
