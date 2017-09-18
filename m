From: p.zabel@pengutronix.de (Philipp Zabel)
Date: Mon, 18 Sep 2017 14:07:21 +0200
Subject: [PATCH v2] ARC: reset: introduce AXS10x reset driver
In-Reply-To: <20170914142842.12225-1-Eugeniy.Paltsev@synopsys.com>
References: <20170914142842.12225-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1505736441.9807.8.camel@pengutronix.de>
To: linux-snps-arc@lists.infradead.org

On Thu, 2017-09-14@17:28 +0300, Eugeniy Paltsev wrote:
> ARC AXS10x boards support custom IP-block which allows to control
> reset signals of selected peripherals. For example DW GMAC, etc...
> This block is controlled via memory-mapped register (AKA CREG) which
> represents up-to 32 reset lines. This regiter is self-clearing so we
> don't need to deassert line after reset.
> 
> As of today only the following lines are used:
> ?- DW GMAC - line 5
> 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
> Changes v1 -> v2:
> ? * The creg reset register is self-clearing so we don't need to clear it
> ????manually. Fixed it.
> ? * Use reset callback instead of assert/deassert pair.
> ? * Rename reset node in documentation to "reset-controller" for consistency
> ????with the other bindings.
> ? * Use devm_reset_controller_register instead of reset_controller_register
> 
> NOTE:
> ????This driver couldn't be replaced by reset-simple driver as we mustn't
> ????read from reset register or clear it.

Thanks, I've applied this patch to the reset/next branch.

regards
Philipp
