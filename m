From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Thu, 02 Jun 2016 17:39:17 +0200
Subject: [RFC v3 15/45] drm/nouveau: dma-mapping: Use unsigned long for
 dma_attrs
In-Reply-To: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464881987-13203-16-git-send-email-k.kozlowski@samsung.com>
To: linux-snps-arc@lists.infradead.org

Split out subsystem specific changes for easier reviews. This will be
squashed with main commit.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
index 6b8f2a19b2d9..a6a7fa0d7679 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/gk20a.c
@@ -109,7 +109,7 @@ struct gk20a_instmem {
 	u16 iommu_bit;
 
 	/* Only used by DMA API */
-	struct dma_attrs attrs;
+	unsigned long attrs;
 };
 #define gk20a_instmem(p) container_of((p), struct gk20a_instmem, base)
 
@@ -293,7 +293,7 @@ gk20a_instobj_dtor_dma(struct nvkm_memory *memory)
 		goto out;
 
 	dma_free_attrs(dev, node->base.mem.size << PAGE_SHIFT, node->base.vaddr,
-		       node->handle, &imem->attrs);
+		       node->handle, imem->attrs);
 
 out:
 	return node;
@@ -386,7 +386,7 @@ gk20a_instobj_ctor_dma(struct gk20a_instmem *imem, u32 npages, u32 align,
 
 	node->base.vaddr = dma_alloc_attrs(dev, npages << PAGE_SHIFT,
 					   &node->handle, GFP_KERNEL,
-					   &imem->attrs);
+					   imem->attrs);
 	if (!node->base.vaddr) {
 		nvkm_error(subdev, "cannot allocate DMA memory\n");
 		return -ENOMEM;
@@ -597,10 +597,9 @@ gk20a_instmem_new(struct nvkm_device *device, int index,
 
 		nvkm_info(&imem->base.subdev, "using IOMMU\n");
 	} else {
-		init_dma_attrs(&imem->attrs);
-		dma_set_attr(DMA_ATTR_NON_CONSISTENT, &imem->attrs);
-		dma_set_attr(DMA_ATTR_WEAK_ORDERING, &imem->attrs);
-		dma_set_attr(DMA_ATTR_WRITE_COMBINE, &imem->attrs);
+		imem->attrs = DMA_ATTR_NON_CONSISTENT |
+			      DMA_ATTR_WEAK_ORDERING |
+			      DMA_ATTR_WRITE_COMBINE;
 
 		nvkm_info(&imem->base.subdev, "using DMA API\n");
 	}
-- 
1.9.1
