From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 10 Feb 2017 08:23:15 +0000
Subject: [PATCH 2/2] dmaengine: Add DW AXI DMAC driver
In-Reply-To: <20170210060606.GO19244@localhost>
References: <1485358457-22957-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1485358457-22957-3-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <20170210060606.GO19244@localhost>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1486714994.7530.11.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vinod,

On Fri, 2017-02-10@11:36 +0530, Vinod Koul wrote:
> On Wed, Jan 25, 2017@06:34:17PM +0300, Eugeniy Paltsev wrote:
> > 
> > This patch adds support for the DW AXI DMAC controller.
> > 
> > DW AXI DMAC is a part of upcoming development board from Synopsys.
> 
> How different is AXI from DW Synopsys?

These are 2 completely unrelated products from Synopsys, see:
?a)?https://www.synopsys.com/dw/ipdir.php?ds=amba_ahb_dma
?b)?https://www.synopsys.com/dw/ipdir.php?ds=amba_axi_dma

> Is the spec publicly available?

I'm afraid not. Synopsys customers may get DW AXI DMAC databook here:
https://www.synopsys.com/dw/doc.php/iip/DW_axi_dmac/latest/doc/DW_axi_dmac_databook.pdf

Just a side note "DW" prefix stands for DesignWare and applicable
to most if not all IP libs from Synopsys so here we're talking about
AHB DMAC vs AXI DMAC. Still my understanding is different bus type is
not the one and only difference but just the one which might simplify
selection of one or another IP block.

-Alexey
