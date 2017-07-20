From: p.zabel@pengutronix.de (Philipp Zabel)
Date: Thu, 20 Jul 2017 15:58:33 +0200
Subject: [PATCH v2] ARC: reset: introduce HSDKv1 reset driver
In-Reply-To: <20170719184511.18497-1-Eugeniy.Paltsev@synopsys.com>
References: <20170719184511.18497-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1500559113.2354.77.camel@pengutronix.de>
To: linux-snps-arc@lists.infradead.org

On Wed, 2017-07-19@21:45 +0300, Eugeniy Paltsev wrote:
> The HSDK v1 periphery IPs can be reset by accessing some registers
> from the CGU block.
> 
> The list of available reset lines is documented in the DT bindings.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
> Changes v1 -> v2:
>  - Remove defines of the unused registers.
>  - Map io memory only for single CGU_SYS_RST_CTRL register instead
>    of CGU_SYS_*_CTRL, as we use only CGU_SYS_RST_CTRL.

Thank you, I have applied this patch to the reset/next branch.

regards
Philipp
