From: yamada.masahiro@socionext.com (Masahiro Yamada)
Date: Mon, 3 Jun 2019 17:18:10 +0900
Subject: [PATCH] ARC: build: Try to guess CROSS_COMPILE with
 cc-cross-prefix
In-Reply-To: <20190603063119.36544-1-abrodkin@synopsys.com>
References: <20190603063119.36544-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAK7LNASiHzar3JmzGB1fgUYUC91F3FPsALj3iMhANTjGgnux5w@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

Hi Alexey,

On Mon, Jun 3, 2019 at 3:42 PM Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
>
> For a long time we used to hard-code CROSS_COMPILE prefix
> for ARC until it started to cause problems, so we decided to
> solely rely on CROSS_COMPILE externally set by a user:
> commit 40660f1fcee8 ("ARC: build: Don't set CROSS_COMPILE in arch's Makefile").
>
> While it works perfectly fine for build-systems where the prefix
> gets defined anyways for us human beings it's quite an annoying
> requirement especially given most of time the same one prefix
> "arc-linux-" is all what we need.
>
> It looks like finally we're getting the best of both worlds:
>  1. W/o cross-toolchain we still may install headers, build .dtb etc
>  2. W/ cross-toolchain get the kerne built with only ARCH=arc
>
> Inspired by [1] & [2].
>
> [1] http://lists.infradead.org/pipermail/linux-snps-arc/2019-May/005788.html
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fc2b47b55f17
>
> A side note: even though "cc-cross-prefix" does its job it pollutes
> console with output of "which" for all the prefixes it didn't manage to find
> a matching cross-compiler for like that:
> | # ARCH=arc make defconfig
> | which: no arceb-linux-gcc in (~/.local/bin:~/bin:/usr/bin:/usr/sbin)
> | *** Default configuration is based on 'nsim_hs_defconfig'


Oh really?

masahiro at pug:~$ which arc-linux-gcc
/home/masahiro/tools/arc/bin/arc-linux-gcc
masahiro at pug:~$ which dummy-linux-gcc
masahiro at pug:~$ echo $?
1


When 'which' cannot find the given command,
it does not print anything to stderr.

Does it work differently on your machine?




-- 
Best Regards
Masahiro Yamada
