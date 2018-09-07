From: yamada.masahiro@socionext.com (Masahiro Yamada)
Date: Fri, 7 Sep 2018 19:32:06 +0900
Subject: [PATCH v2 6/9] kbuild: consolidate Devicetree dtb build rules
In-Reply-To: <20180905235327.5996-7-robh@kernel.org>
References: <20180905235327.5996-1-robh@kernel.org>
 <20180905235327.5996-7-robh@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAK7LNARD+_kV=XtJ66mZBU-CPMQgWF+oQtv4bGKaGGARNwzXiQ@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

2018-09-06 8:53 GMT+09:00 Rob Herring <robh at kernel.org>:
> There is nothing arch specific about building dtb files other than their
> location under /arch/*/boot/dts/. Keeping each arch aligned is a pain.
> The dependencies and supported targets are all slightly different.
> Also, a cross-compiler for each arch is needed, but really the host
> compiler preprocessor is perfectly fine for building dtbs. Move the
> build rules to a common location and remove the arch specific ones. This
> is done in a single step to avoid warnings about overriding rules.
>
> The build dependencies had been a mixture of 'scripts' and/or 'prepare'.
> These pull in several dependencies some of which need a target compiler
> (specifically devicetable-offsets.h) and aren't needed to build dtbs.
> All that is really needed is dtc, so adjust the dependencies to only be
> dtc.
>
> This change enables support 'dtbs_install' on some arches which were
> missing the target.
>
> Cc: Masahiro Yamada <yamada.masahiro at socionext.com>
> Cc: Michal Marek <michal.lkml at markovi.net>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: Russell King <linux at armlinux.org.uk>
> Cc: Catalin Marinas <catalin.marinas at arm.com>
> Cc: Will Deacon <will.deacon at arm.com>
> Cc: Yoshinori Sato <ysato at users.sourceforge.jp>
> Cc: Michal Simek <monstr at monstr.eu>
> Cc: Ralf Baechle <ralf at linux-mips.org>
> Cc: Paul Burton <paul.burton at mips.com>
> Cc: James Hogan <jhogan at kernel.org>
> Cc: Ley Foon Tan <lftan at altera.com>
> Cc: Benjamin Herrenschmidt <benh at kernel.crashing.org>
> Cc: Paul Mackerras <paulus at samba.org>
> Cc: Michael Ellerman <mpe at ellerman.id.au>
> Cc: Chris Zankel <chris at zankel.net>
> Cc: Max Filippov <jcmvbkbc at gmail.com>
> Cc: linux-kbuild at vger.kernel.org
> Cc: linux-snps-arc at lists.infradead.org
> Cc: linux-arm-kernel at lists.infradead.org
> Cc: uclinux-h8-devel at lists.sourceforge.jp
> Cc: linux-mips at linux-mips.org
> Cc: nios2-dev at lists.rocketboards.org
> Cc: linuxppc-dev at lists.ozlabs.org
> Cc: linux-xtensa at linux-xtensa.org
> Signed-off-by: Rob Herring <robh at kernel.org>
> ---
> Please ack so I can take the whole series via the DT tree.
>
> v2:
>  - Fix $arch/boot/dts path check for out of tree builds
>  - Fix dtc dependency for building built-in dtbs
>  - Fix microblaze built-in dtb building


This breaks parallel building
because two threads could descend into scripts/dtc
at the same time.

'all' depends on both 'scripts' and 'dtc'.

* 'scripts' target -- descends into scripts/, then scripts/dtc
* 'dtc' target     -- descents into scripts/dtc directly





-- 
Best Regards
Masahiro Yamada
