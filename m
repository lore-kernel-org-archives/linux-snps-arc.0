From: robh@kernel.org (Rob Herring)
Date: Wed, 13 Apr 2016 15:17:09 -0500
Subject: [PATCH 2/2 v5] ASoC: dwc: Update DOCUMENTATION for I2S Driver
In-Reply-To: <a922e60747eb00182eba573baf9497fff8772337.1460384521.git.joabreu@synopsys.com>
References: <cover.1460384521.git.joabreu@synopsys.com>
 <a922e60747eb00182eba573baf9497fff8772337.1460384521.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160413201708.GA24579@rob-hp-laptop>
To: linux-snps-arc@lists.infradead.org

On Tue, Apr 12, 2016@01:56:28PM +0100, Jose Abreu wrote:
> This patch updates documentation for the Designware I2S
> driver.
> 
> Signed-off-by: Jose Abreu <joabreu at synopsys.com>
> ---
> 
> Changes v4 -> v5:
> * interrupts is now required property
> * Drop 'snps-use-dmaengine' property
> 
> This patch was only introduced in v4.
> 
>  Documentation/devicetree/bindings/sound/designware-i2s.txt | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh at kernel.org>
