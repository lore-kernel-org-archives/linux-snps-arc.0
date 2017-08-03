From: robh@kernel.org (Rob Herring)
Date: Thu, 3 Aug 2017 18:26:43 -0500
Subject: [PATCH 3/5] net: stmmac: Add Adaptrum Anarion GMAC glue layer
In-Reply-To: <20170728220707.13960-4-alex.g@adaptrum.com>
References: <20170728220707.13960-1-alex.g@adaptrum.com>
 <20170728220707.13960-4-alex.g@adaptrum.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170803232643.oqvdgvp6xqwgk6mh@rob-hp-laptop>
To: linux-snps-arc@lists.infradead.org

On Fri, Jul 28, 2017@03:07:03PM -0700, Alexandru Gagniuc wrote:
> Before the GMAC on the Anarion chip can be used, the PHY interface
> selection must be configured with the DWMAC block in reset.
> 
> This layer covers a block containing only two registers. Although it
> is possible to model this as a reset controller and use the "resets"
> property of stmmac, it's much more intuitive to include this in the
> glue layer instead.
> 
> At this time only RGMII is supported, because it is the only mode
> which has been validated hardware-wise.
> 
> Signed-off-by: Alexandru Gagniuc <alex.g at adaptrum.com>
> ---
>  .../devicetree/bindings/net/anarion-gmac.txt       |  25 ++++

The binding looks fine, but please split to separate patch.

>  drivers/net/ethernet/stmicro/stmmac/Kconfig        |   9 ++
>  drivers/net/ethernet/stmicro/stmmac/Makefile       |   1 +
>  .../net/ethernet/stmicro/stmmac/dwmac-anarion.c    | 151 +++++++++++++++++++++
>  4 files changed, 186 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/anarion-gmac.txt
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
