From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 24 Jul 2019 10:53:30 +0000
Subject: [PATCH 2/2] dt-bindings: IDU-intc: Add support for edge-triggered
 interrupts
In-Reply-To: <20190723102606.309089-2-mischa.jonker@synopsys.com>
References: <20190723102606.309089-1-mischa.jonker@synopsys.com>
 <20190723102606.309089-2-mischa.jonker@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CY4PR1201MB012055687BED617CB2689678A1C60@CY4PR1201MB0120.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Mischa,

> -----Original Message-----
> From: Mischa Jonker <mischa.jonker at synopsys.com>
> Sent: Tuesday, July 23, 2019 1:26 PM
> To: Vineet Gupta <vgupta at synopsys.com>; Alexey Brodkin <abrodkin at synopsys.com>;
> kstewart at linuxfoundation.org; tglx at linutronix.de; robh+dt at kernel.org; linux-snps-
> arc at lists.infradead.org; linux-kernel at vger.kernel.org; devicetree at vger.kernel.org
> Cc: Mischa Jonker <mischa.jonker at synopsys.com>
> Subject: [PATCH 2/2] dt-bindings: IDU-intc: Add support for edge-triggered interrupts
> 
> This updates the documentation for supporting  a optional extra interrupt
> cell to specify edge vs level triggered.

LGTM as well. But maybe split pure clean-up changes from addition of
the new property description so that info about addition of new property is
clearly seen? Otherwise it gets a bit lost among nice and useful generic fixes.

-Alexey
