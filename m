From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Wed, 2 Nov 2016 11:55:08 +0000
Subject: [PATCH v3 0/3] dmaengine: DW DMAC: split pdata to hardware
 properties
In-Reply-To: <1477670402-23943-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1477670402-23943-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1478087707.2603.7.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Andy,
Could you possibly tell me your ideas about these changes?
Thanks.

On Fri, 2016-10-28@18:59 +0300, Eugeniy Paltsev wrote:
> This series is to address a proposal by Andy in these threads:
> http://www.spinics.net/lists/dmaengine/msg11506.html
> http://www.spinics.net/lists/dmaengine/msg11541.html
> Split platform data to actual hardware properties, and platform
> quirks.
> Now we able to use quirks and hardware properties separately from
> different sources (pdata, device tree or autoconfig registers)
> 
> Changes for v3:
> ?-???Split changes to separate patches.
> ?-???Add "DW_DMA_IS_LLP_SUPPORTED" flag and get rid of "dwc->nollp"
> ?????as separate variable.
> ?-???Make "dw_dma_slave" documentation comments more clear about
> quirks.
> ?????"is_memcpy" and "is_private" are quirks, "is_nollp" is regular?
> ?????pdata property.
> 
> Eugeniy Paltsev (3):
> ? dmaengine: DW DMAC: split pdata to hardware properties and platform
> ????quirks
> ? dmaengine: DW DMAC: convert to unified device property API
> ? dmaengine: DW DMAC: move "nollp" to "dwc->flags"
> 
> ?drivers/dma/dw/core.c????????????????| 34 +++++++++++++----------
> ?drivers/dma/dw/platform.c????????????| 53 +++++++++++++++++++-------
> ----------
> ?drivers/dma/dw/regs.h????????????????|??2 +-
> ?include/linux/platform_data/dma-dw.h |??5 ++++
> ?4 files changed, 54 insertions(+), 40 deletions(-)
> 
-- 
?Paltsev Eugeniy
