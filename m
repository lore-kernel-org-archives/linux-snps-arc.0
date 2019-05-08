From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 8 May 2019 10:46:36 +0000
Subject: [PATCH] ARC: [plat-hsdk]: Add missing multicast filter bins
 number to GMAC node
In-Reply-To: <78EB27739596EE489E55E81C33FEC33A0B478870@DE02WEMBXB.internal.synopsys.com>
References: <7f36bbadc0df4c93c396690dab59f34775de3874.1556788240.git.joabreu@synopsys.com>
 <56933076-879c-78a0-4bae-2613203b93b1@synopsys.com>
 <1557166759.17021.9.camel@synopsys.com>
 <78EB27739596EE489E55E81C33FEC33A0B478870@DE02WEMBXB.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CY4PR1201MB01206801C1C2B8272ABE9B17A1320@CY4PR1201MB0120.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Jose,

> -----Original Message-----
> From: Jose Abreu <joabreu at synopsys.com>
> Sent: Wednesday, May 8, 2019 10:29 AM
> To: Eugeniy Paltsev <paltsev at synopsys.com>; Jose.Abreu at synopsys.com; linux-kernel at vger.kernel.org;
> Vineet Gupta <vgupta at synopsys.com>; devicetree at vger.kernel.org; linux-snps-arc at lists.infradead.org
> Cc: Joao.Pinto at synopsys.com; Vineet.Gupta1 at synopsys.com; Eugeniy.Paltsev at synopsys.com; Alexey Brodkin
> <abrodkin at synopsys.com>
> Subject: RE: [PATCH] ARC: [plat-hsdk]: Add missing multicast filter bins number to GMAC node
> 
> From: Eugeniy Paltsev <paltsev at synopsys.com>
> Date: Mon, May 06, 2019 at 19:19:20
> 
> > Hi,
> >
> > I'll check this in the next few days.
> >
> 
> I also noticed that FIFO size entry is missing. DWMAC1000 does not
> support automatic FIFO size detection so this entry needs to be added.

Could you please propose a patch?

-Alexey
