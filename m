From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 5 Dec 2017 09:32:23 +0000
Subject: etnaviv: PHYS_OFFSET usage
In-Reply-To: <1510768580.2835.15.camel@pengutronix.de>
References: <1510763053.29843.64.camel@synopsys.com>
 <1510764243.2835.13.camel@pengutronix.de>
 <1510767395.29843.83.camel@synopsys.com>
 <1510768580.2835.15.camel@pengutronix.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1512466342.4977.77.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Lucas,

On Wed, 2017-11-15@18:56 +0100, Lucas Stach wrote:
> Am Mittwoch, den 15.11.2017, 17:36 +0000 schrieb Alexey Brodkin:

[snip]

> I'm not keen on having a private memory region for the GPU. Normally we
> just use the shared system CMA memory region (and we will point the
> linear memory window there on MC2.0 GPUs), which has the added benefit
> that we can map the contiguous framebuffers allocated by another device
> through the linear window, which is a crucial performance optimization
> for the MMUv1 GPUs.
> 
> The only time where we really need to know the start of RAM is on MC1.0
> GPUs which have a hardware bug in the TS unit, so we try to avoid
> moving the linear window at all to work around that. In that case the
> PHYS_OFFSET check is really there to avoid the situation where the
> linear window would not allow any RAM to be reached at all. Then we
> need to move the window, but disable any TS functionality, impacting
> performance a lot.

Thanks a lot fro explanation!

> As MC1.0 GPUs are hopefully on the way out with new designs using MC2.0
> this shouldn't be much of a problem going forward. Maybe we can even
> simply solve this issue by just dropping the check if PHYS_OFFSET isn't
> defined.

I guess something like that should work then:
-------------------------------->8--------------------------------
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index fc9a6a83dfc7..5ad191a605e2 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -678,6 +678,7 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
????????????????goto fail;
????????}
?
+#ifdef PHYS_OFFSET
????????/*
?????????* Set the GPU linear window to be at the end of the DMA window, where
?????????* the CMA area is likely to reside. This ensures that we are able to
@@ -699,6 +700,7 @@ int etnaviv_gpu_init(struct etnaviv_gpu *gpu)
????????????????gpu->memory_base = PHYS_OFFSET;
????????????????gpu->identity.features &= ~chipFeatures_FAST_CLEAR;
????????}
+#endif
?
????????ret = etnaviv_hw_reset(gpu);
????????if (ret) {
-------------------------------->8--------------------------------

> At least I hope VeriSilicon didn't sell you a MC1.0 part at
> this time...

Given "chipMinorFeatures0_MC20" bit is set for us I would think that we
indeed have MC2.0 in our chip.

-Alexey
