From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 11 Oct 2017 17:07:58 +0000
Subject: [PATCH] ARC: [plat-hsdk]: Increase SDIO CIU frequency to
 50000000Hz
In-Reply-To: <20171011170142.27232-1-Eugeniy.Paltsev@synopsys.com>
References: <20171011170142.27232-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1507741678.3839.5.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Eugeniy,

On Wed, 2017-10-11@20:01 +0300, Eugeniy Paltsev wrote:
> With current SDIO CIU clock frequency (12500000Hz) DW MMC
> controller fails to initialize some SD cards (which don't
> support slow mode).
> 
> So increase SDIO CIU frequency from 12500000Hz to 50000000Hz by
> switching from the default divisor value (div-by-8) to the
> minimum possible value of the divisor (div-by-2) in HSDK platform
> code.
> 
> Reported-by: Vineet Gupta <vgupta at synopsys.com>
> Tested-by: Vineet Gupta <vgupta at synopsys.com>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>

Given this change doesn't introduce any regressions
or at least so far we only saw 1 card started to work
(confirmed by Vineet) while cards we tried locally continue to work...

Acked-by: Alexey Brodkin <abrodkin at synopsys.com>
