From: robh@kernel.org (Rob Herring)
Date: Fri, 16 Aug 2019 16:05:38 -0500
Subject: [PATCH v2 3/3] dt-bindings: IDU-intc: Add support for
 edge-triggered interrupts
In-Reply-To: <20190724120436.8537-3-mischa.jonker@synopsys.com>
References: <CY4PR1201MB0120EDD4173511912A9FC99EA1C60@CYPR1201MB0120.namprd12.prod.outlook.com>
 <20190724120436.8537-1-mischa.jonker@synopsys.com>
 <20190724120436.8537-3-mischa.jonker@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190816210538.GA30424@bogus>
To: linux-snps-arc@lists.infradead.org

On Wed, 24 Jul 2019 14:04:36 +0200, Mischa Jonker wrote:
> This updates the documentation for supporting an optional extra interrupt
> cell to specify edge vs level triggered.
> 
> Signed-off-by: Mischa Jonker <mischa.jonker at synopsys.com>
> ---
>  .../interrupt-controller/snps,archs-idu-intc.txt      | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh at kernel.org>
