From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 22 Jul 2019 18:42:38 +0000
Subject: [PATCH v2] ARC: [plat-hsdk]: allow to switch between AXI DMAC
 port configurations
In-Reply-To: <20190722093145.4626-1-Eugeniy.Paltsev@synopsys.com>
References: <20190722093145.4626-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CY4PR1201MB012020E6C3416DC9F4A5AF19A1C40@CY4PR1201MB0120.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Eugeniy,

> -----Original Message-----
> From: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> Sent: Monday, July 22, 2019 12:32 PM
> To: linux-snps-arc at lists.infradead.org; Vineet Gupta <vgupta at synopsys.com>
> Cc: linux-kernel at vger.kernel.org; Alexey Brodkin <abrodkin at synopsys.com>; Eugeniy Paltsev
> <Eugeniy.Paltsev at synopsys.com>
> Subject: [PATCH v2] ARC: [plat-hsdk]: allow to switch between AXI DMAC port configurations
> 
> We want to use DW AXI DMAC on HSDK board in our automated verification
> to test cache & dma kernel code changes. This is perfect candidate
> as we don't depend on any external peripherals like MMC card / USB
> storage / etc.
> To increase test coverage we want to test both options:
>  * DW AXI DMAC is connected through IOC port & dma direct ops used
>  * DW AXI DMAC is connected to DDR port & dma noncoherent ops used
> 
> Introduce 'arc_hsdk_axi_dmac_coherent' global variable which can be
> modified by debugger (same way as we patch 'ioc_enable') to switch
> between these options without recompiling the kernel.
> Depend on this value we tweak memory bridge configuration and
> "dma-coherent" DTS property of DW AXI DMAC.

Looks good to me.

Acked-by: Alexey Brodkin <abrodkin at synopsys.com>

-Thanks
