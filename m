From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Fri, 12 Aug 2016 08:03:14 +0000
Subject: Wrong "nollp" DW DMAC parameter value on ARC SDP.
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1470988994.21247.33.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi,

"nollp" parameter defines if DW DMAC channel supports multi block
transfer or not.

It is calculated in runtime, but differently depending on on
availability of pdata. If pdata is absent "nollp" is calculated using
autoconfig hardware registers. Otherwise "nollp" is calculated using
the next code construction:
channel_writel(dwc, LLP, DWC_LLP_LOC(0xffffffff));
dwc->nollp = DWC_LLP_LOC(channel_readl(dwc, LLP)) == 0;
channel_writel(dwc, LLP, 0);

I realized that these methods give different results.
For example on ARC AXS101 SDP in case of using autoconfig "nollp" was
calculated as "true" (and DMAC works fine),?
otherwise "nollp" was calculated as "false" (and DMAC doesn't work).

So I'm wondering how the code in question really works?
