From: davem@davemloft.net (David Miller)
Date: Wed, 19 Jul 2017 13:52:35 -0700 (PDT)
Subject: [PATCH] NET: dwmac: Make dwmac reset unconditional
In-Reply-To: <20170718140715.25798-1-Eugeniy.Paltsev@synopsys.com>
References: <20170718140715.25798-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170719.135235.1392422982553298240.davem@davemloft.net>
To: linux-snps-arc@lists.infradead.org

From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Date: Tue, 18 Jul 2017 17:07:15 +0300

> Unconditional reset dwmac before HW init if reset controller is present.
> 
> In existing implementation we reset dwmac only after second module
> probing:
> (module load -> unload -> load again [reset happens])
> 
> Now we reset dwmac at every module load:
> (module load [reset happens] -> unload -> load again [reset happens])
> 
> Also some reset controllers have only reset callback instead of
> assert + deassert callbacks pair, so handle this case.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>

Applied.
