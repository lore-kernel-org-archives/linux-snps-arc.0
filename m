From: robh@kernel.org (Rob Herring)
Date: Wed, 7 Mar 2018 19:56:36 -0600
Subject: [PATCH v3 2/2] dt-bindings: Document the Synopsys DW AXI DMA
 bindings
In-Reply-To: <20180306114615.8895-3-Eugeniy.Paltsev@synopsys.com>
References: <20180306114615.8895-1-Eugeniy.Paltsev@synopsys.com>
 <20180306114615.8895-3-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180308015636.vqn5t6syuo7kae4r@rob-hp-laptop>
To: linux-snps-arc@lists.infradead.org

On Tue, Mar 06, 2018@02:46:15PM +0300, Eugeniy Paltsev wrote:
> This patch adds documentation of device tree bindings for the Synopsys
> DesignWare AXI DMA controller.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
> Changes v2->v3:
>  * None.
> 
>  .../devicetree/bindings/dma/snps,dw-axi-dmac.txt   | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.txt

Reviewed-by: Rob Herring <robh at kernel.org>
