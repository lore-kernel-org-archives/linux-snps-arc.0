From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 27 Nov 2018 22:23:30 +0000
Subject: [PATCH] ARC: change defconfig defaults to ARCv2
References: <20181127222045.18491-1-khilman@baylibre.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA230750146419633@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/27/18 2:21 PM, Kevin Hilman wrote:
> Change the default defconfig (used with 'make defconfig') to the ARCv2
> nsim_hs_defconfig, and also switch the default Kconfig ISA selection to
> ARCv2.
>
> This allows several default defconfigs (e.g. make defconfig, make
> allnoconfig, make tinyconfig) to all work with ARCv2 by default.
>
> Signed-off-by: Kevin Hilman <khilman at baylibre.com>

Applied to for-curr

Thx,
-Vineet
