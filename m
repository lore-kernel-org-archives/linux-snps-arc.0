From: otavio.salvador@ossystems.com.br (Otavio Salvador)
Date: Thu, 22 Nov 2018 07:30:00 -0200
Subject: [OE-core] [PATCH v6] u-boot: Add mkenvimage tool
In-Reply-To: <20181122082807.39508-1-abrodkin@synopsys.com>
References: <20181122082807.39508-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAP9ODKo46bnbLLBrhUJHPa1QYKSc0c_TtFVd2Q-Tv7j193K+ug@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

Hello Alexey,

On Thu, Nov 22, 2018 at 6:28 AM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> This utility is used for creation of images containing
> usable in run-time U-Boot environment.
>
> As of today this utility is added per-board like here [1]
> for Intel Edison board.
>
> [1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
>
> Given there're quite some U-Boot tools that we may want to add later
> this recipe name switch from "u-boot-mkimage" to generic "u-boot-tools"
> still for compatibility we provide "u-boot-mkimage" with help
> of PROVIDES as well as proposed "u-boot-mkenvimage".
>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Richard Purdie <richard.purdie at linuxfoundation.org>
> Cc: Otavio Salvador <otavio at ossystems.com.br>
> Cc: Martin Jansa <martin.jansa at gmail.com>
> Cc: Ross Burton <ross.burton at intel.com>
> Cc: Marek Vasut <marex at denx.de>

Acked-by: Otavio Salvador <otavio at ossystems.com.br>

I'd like to thank you to keep the pace until it was ready. I know it
may be challenging to contribute to new projects and OpenEmbedded is
no different.

You were very welcoming to comments and change requests and I believe
it was a great thread of changes which lead to a good patch. I look
forward to the new patches you'll start submitting from now on :-)

Keep the good work.

Best Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
