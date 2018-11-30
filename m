From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 30 Nov 2018 18:55:05 +0000
Subject: [PATCH v2] ARC: change defconfig defaults to ARCv2
References: <20181130125156.34460-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014641A3F9@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/30/18 4:52 AM, Alexey Brodkin wrote:
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

Applied.

Thx,
-Vineet
