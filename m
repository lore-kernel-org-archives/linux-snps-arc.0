From: khilman@baylibre.com (Kevin Hilman)
Date: Fri, 30 Nov 2018 13:30:59 -0800
Subject: [PATCH v2] ARC: change defconfig defaults to ARCv2
In-Reply-To: <20181130125156.34460-1-abrodkin@synopsys.com>
References: <20181130125156.34460-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <7hva4e45ik.fsf@baylibre.com>
To: linux-snps-arc@lists.infradead.org

Alexey Brodkin <alexey.brodkin at synopsys.com> writes:

> From: Kevin Hilman <khilman at baylibre.com>
>
> Change the default defconfig (used with 'make defconfig') to the ARCv2
> nsim_hs_defconfig, and also switch the default Kconfig ISA selection to
> ARCv2.
>
> This allows several default defconfigs (e.g. make defconfig, make
> allnoconfig, make tinyconfig) to all work with ARCv2 by default.
>
> Note since we change default architecture from ARCompact to ARCv2
> it's required to explicitly mention architecture type in ARCompact
> defconfigs otherwise ARCv2 will be implied and binaries will be
> generated for ARCv2.
>
> Signed-off-by: Kevin Hilman <khilman at baylibre.com>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: <stable at vger.kernel.org> # 4.4.x

Tested-by: Kevin Hilman <khilman at baylibre.com>

Nice, thanks for cleaning this up.  I tested it again for the kernelCI
use cases, and it's still working.

Thanks,

Kevin
