From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 23 Dec 2015 16:44:46 +0530
Subject: ARC AXS101 problems with linux next-20151221
In-Reply-To: <56784531.1000007@synopsys.com>
References: <56784531.1000007@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <567A8226.80308@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Christoph, Andrew

> On Tuesday 22 December 2015 12:00 AM, Carlos Palminha wrote:
> Hi guys,
> 
> I just compiled the kernel for axs101_defconfig based on linux next tag 'next-20151221'.
> I can't boot it due to the following errors causing strange stack traces after freeing unused kernel memory (check log below).
> 
> Any clue?
> Do you more info to understand the issue?

....[snip]

> dw_mmc e0015000.mmc: IDMAC supports 32-bit address mode.
> dw_mmc e0015000.mmc: Using internal DMA controller.
> dw_mmc e0015000.mmc: Version ID is 270a
> dw_mmc e0015000.mmc: DW MMC controller at irq 34,32 bit host data width,16 deep fifo
> dw_mmc e0015000.mmc: 1 slots initialized
> sdhci-pltfm: SDHCI platform and OF driver helper
> usbcore: registered new interface driver usbhid
> usbhid: USB HID core driver
> NET: Registered protocol family 17
> NET: Registered protocol family 15
> ttyS3 - failed to request DMA
> Freeing unused kernel memory: 928K (80002000 - 800ea000)
> INFO: rcu_preempt self-detected stall on CPU
>         0-...: (2100 ticks this GP) idle=011/140000000000001/0 softirq=92/92 fqs=0
>          (t=2100 jiffies g=-261 c=-262 q=60)
> rcu_preempt kthread starved for 2100 jiffies! g4294967035 c4294967034 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x1
> rcu_preempt     S 8053879e     0     7      2 0x00000000
> 
> Stack Trace:
>   __switch_to+0x0/0x94
>   __schedule+0x1c2/0x724
>   schedule+0x2a/0x74
>   schedule_timeout+0x126/0x198
>   rcu_gp_kthread+0x5fa/0xee8
>   kthread+0xe2/0xf4
>   ret_from_fork+0x18/0x1c
> Task dump for CPU 0:
> kworker/0:1     R running      0    19      2 0x00000008
> Workqueue: events_freezable mmc_rescan

[snip]

It seems the dma ops rework for ARC makes kernel belly up.

Patch below fixes it.

------------->
>From 96b44b39dc39542894a1081e683bd21f56cae1d1 Mon Sep 17 00:00:00 2001
From: Vineet Gupta <vgupta@synopsys.com>
Date: Wed, 23 Dec 2015 15:41:20 +0530
Subject: [PATCH] ARC: dma mapping fixes #2

Carlos Palminha reported linux-next boot broken for ARC.

(1) dma_map_single() would recursively call itself

| #define dma_map_single(d, a, s, r) dma_map_single_attrs(d, a, s, r, NULL)
| dma_map_single_attrs
|   ops->map_page
|     arc_dma_map_page
|        dma_map_single

(2) arc_dma_free() to iounmap if memory is coherent

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/mm/dma.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
index 695029f41a48..01eaf88bf821 100644
--- a/arch/arc/mm/dma.c
+++ b/arch/arc/mm/dma.c
@@ -72,8 +72,8 @@ static void *arc_dma_alloc(struct device *dev, size_t size,
 static void arc_dma_free(struct device *dev, size_t size, void *vaddr,
 		dma_addr_t dma_handle, struct dma_attrs *attrs)
 {
-	if (!(is_isa_arcv2() && ioc_exists) ||
-	    dma_get_attr(DMA_ATTR_NON_CONSISTENT, attrs))
+	if (!dma_get_attr(DMA_ATTR_NON_CONSISTENT, attrs) &&
+	    !(is_isa_arcv2() && ioc_exists))
 		iounmap((void __force __iomem *)vaddr);

 	free_pages_exact((void *)dma_handle, size);
@@ -107,7 +107,8 @@ static dma_addr_t arc_dma_map_page(struct device *dev, struct
page *page,
 		struct dma_attrs *attrs)
 {
 	unsigned long paddr = page_to_phys(page) + offset;
-	return dma_map_single(dev, (void *)paddr, size, dir);
+	_dma_cache_sync(paddr, size, dir);
+	return (dma_addr_t)paddr;
 }

 static int arc_dma_map_sg(struct device *dev, struct scatterlist *sg,
-- 
1.9.1
