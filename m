From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 17 Aug 2017 13:17:43 +0000
Subject: [PATCH v3 2/2] ARC: DTS: Add device-tree for Anarion-based
 development board
In-Reply-To: <20170816221516.13609-3-alex.g@adaptrum.com>
References: <20170816221516.13609-1-alex.g@adaptrum.com>
 <20170816221516.13609-3-alex.g@adaptrum.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1502975863.3268.25.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Alexandru,

On Wed, 2017-08-16@15:15 -0700, Alexandru Gagniuc wrote:
> +#include "skeleton.dtsi"

Eugeniy already commented on that - most probably you'll end up
overriding most if not all entries from "skeleton.dtsi" so why
bother with it at all?

And I don't see any mention of your own memory node so I assume you rely on
the one from our skeleton.dtsi? The first question is if it really matches your setup?
I.e. 256 Mb mapped to 0x8000_0000. And even if that's the case what if we change
this to something else later?

IMHO having your own "memory" node makes some sens :)

> +
> +		gmac0: ethernet at f2010000 {
> +			compatible = "adaptrum,anarion-gmac", "snps,dwmac";
> +			reg = <0xf2010000 0x4000>;
> +
> +			interrupt-parent = <&core_intc>;

You already specified default INTC above, so you may just drop "interrupt-parent"
property from this node.

> +
> +		gmac1: ethernet at f2014000 {
> +			compatible = "adaptrum,anarion-gmac", "snps,dwmac";
> +			reg = <0xf2014000 0x4000>, <0xf2018100 8>;
> +
> +			interrupt-parent = <&core_intc>;

Ditto.

-Alexey
