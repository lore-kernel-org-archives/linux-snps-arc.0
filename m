From: robh@kernel.org (Rob Herring)
Date: Wed, 26 Sep 2018 15:26:52 -0500
Subject: [PATCH v3 2/2] dt-bindings: Document the Synopsys GPIO via CREG
 bindings
In-Reply-To: <20180911150925.19460-3-Eugeniy.Paltsev@synopsys.com>
References: <20180911150925.19460-1-Eugeniy.Paltsev@synopsys.com>
 <20180911150925.19460-3-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180926202652.GA19379@bogus>
To: linux-snps-arc@lists.infradead.org

On Tue, 11 Sep 2018 18:09:25 +0300, Eugeniy Paltsev wrote:
> This patch adds documentation of device tree bindings for the Synopsys
> GPIO via CREG driver.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
>  .../devicetree/bindings/gpio/snps,creg-gpio.txt        | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
> 

Reviewed-by: Rob Herring <robh at kernel.org>
