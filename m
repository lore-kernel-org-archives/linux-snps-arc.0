From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Thu, 17 Aug 2017 11:35:48 +0000
Subject: [PATCH v3 2/2] ARC: DTS: Add device-tree for Anarion-based
 development board
In-Reply-To: <1502968305.2586.39.camel@synopsys.com>
References: <20170816221516.13609-1-alex.g@adaptrum.com>
 <20170816221516.13609-3-alex.g@adaptrum.com>
 <1502968305.2586.39.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1502969747.2586.44.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thu, 2017-08-17@11:11 +0000, Eugeniy Paltsev wrote:
> Hi Alexandru,
> 
> On Wed, 2017-08-16@15:15 -0700, Alexandru Gagniuc wrote:
> > This is split into the SOC bindings, and the board dts. The Endor
> > board is currently an FPGA emulation. Once real, silicon arrives,
> > we
> > plan to remove Endor support.
> > 
> > Signed-off-by: Alexandru Gagniuc <alex.g at adaptrum.com>
> > ---
> > ?arch/arc/boot/dts/adaptrum_anarion.dtsi?????| 110
> > ++++++++++++++++++++++++++++
> > ?arch/arc/boot/dts/adaptrum_anarion_fpga.dts |??51 +++++++++++++
> > ?2 files changed, 161 insertions(+)
> > ?create mode 100644 arch/arc/boot/dts/adaptrum_anarion.dtsi
> > ?create mode 100644 arch/arc/boot/dts/adaptrum_anarion_fpga.dts
> > 
> > diff --git a/arch/arc/boot/dts/adaptrum_anarion.dtsi
> > b/arch/arc/boot/dts/adaptrum_anarion.dtsi
> > new file mode 100644
> > index 0000000..e177a24
> > --- /dev/null
> > +++ b/arch/arc/boot/dts/adaptrum_anarion.dtsi
> > @@ -0,0 +1,110 @@
> > +/*
> > + * Skeleton for Adaptrum Anarion SOC
> > + *
> > + * (C) Copyright 2017 Adaptrum, Inc.
> > + * Written by Alexandru Gagniuc <alex.g at adaptrum.com> for
> > Adaptrum,
> > Inc.
> > + * Licensed under the GPLv2 or (at your option) any later version
> > + */
> > +
> > +/* This skeleton is based on the ARC700 CPU */
> > +#include "skeleton.dtsi"
> 
Perhaps it is better not to use skeleton.dtsi as we are planning to
get rid of it.

---
Little more explanation:

We faced with fact what we had to override almost all nodes defined in
skeleton.dtsi (and other skeletons files like skeleton_hs_idu.dtsi) for
our boards. Only the timers nodes are left not overridden.
So there is no much sense in skeletons files using and that's why we
are planning to get rid of it.

> --?
> ?Eugeniy Paltsev
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc at lists.infradead.org?
-- 
?Eugeniy Paltsev
