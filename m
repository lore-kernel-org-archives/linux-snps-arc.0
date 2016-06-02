From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Thu, 02 Jun 2016 17:39:19 +0200
Subject: [RFC v3 17/45] infiniband: dma-mapping: Use unsigned long for
 dma_attrs
In-Reply-To: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464881987-13203-18-git-send-email-k.kozlowski@samsung.com>
To: linux-snps-arc@lists.infradead.org

Split out subsystem specific changes for easier reviews. This will be
squashed with main commit.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
---
 drivers/infiniband/core/umem.c | 7 +++----
 include/rdma/ib_verbs.h        | 8 ++++----
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/infiniband/core/umem.c b/drivers/infiniband/core/umem.c
index fe4d2e1a8b58..75d8a8b178a5 100644
--- a/drivers/infiniband/core/umem.c
+++ b/drivers/infiniband/core/umem.c
@@ -37,7 +37,6 @@
 #include <linux/sched.h>
 #include <linux/export.h>
 #include <linux/hugetlb.h>
-#include <linux/dma-attrs.h>
 #include <linux/slab.h>
 #include <rdma/ib_umem_odp.h>
 
@@ -92,12 +91,12 @@ struct ib_umem *ib_umem_get(struct ib_ucontext *context, unsigned long addr,
 	unsigned long npages;
 	int ret;
 	int i;
-	DEFINE_DMA_ATTRS(attrs);
+	unsigned long attrs = 0;
 	struct scatterlist *sg, *sg_list_start;
 	int need_release = 0;
 
 	if (dmasync)
-		dma_set_attr(DMA_ATTR_WRITE_BARRIER, &attrs);
+		attrs |= DMA_ATTR_WRITE_BARRIER;
 
 	if (!size)
 		return ERR_PTR(-EINVAL);
@@ -215,7 +214,7 @@ struct ib_umem *ib_umem_get(struct ib_ucontext *context, unsigned long addr,
 				  umem->sg_head.sgl,
 				  umem->npages,
 				  DMA_BIDIRECTIONAL,
-				  &attrs);
+				  attrs);
 
 	if (umem->nmap <= 0) {
 		ret = -ENOMEM;
diff --git a/include/rdma/ib_verbs.h b/include/rdma/ib_verbs.h
index 432bed510369..4d73928962c7 100644
--- a/include/rdma/ib_verbs.h
+++ b/include/rdma/ib_verbs.h
@@ -2819,7 +2819,7 @@ static inline void ib_dma_unmap_single(struct ib_device *dev,
 static inline u64 ib_dma_map_single_attrs(struct ib_device *dev,
 					  void *cpu_addr, size_t size,
 					  enum dma_data_direction direction,
-					  struct dma_attrs *attrs)
+					  unsigned long attrs)
 {
 	return dma_map_single_attrs(dev->dma_device, cpu_addr, size,
 				    direction, attrs);
@@ -2828,7 +2828,7 @@ static inline u64 ib_dma_map_single_attrs(struct ib_device *dev,
 static inline void ib_dma_unmap_single_attrs(struct ib_device *dev,
 					     u64 addr, size_t size,
 					     enum dma_data_direction direction,
-					     struct dma_attrs *attrs)
+					     unsigned long attrs)
 {
 	return dma_unmap_single_attrs(dev->dma_device, addr, size,
 				      direction, attrs);
@@ -2906,7 +2906,7 @@ static inline void ib_dma_unmap_sg(struct ib_device *dev,
 static inline int ib_dma_map_sg_attrs(struct ib_device *dev,
 				      struct scatterlist *sg, int nents,
 				      enum dma_data_direction direction,
-				      struct dma_attrs *attrs)
+				      unsigned long attrs)
 {
 	return dma_map_sg_attrs(dev->dma_device, sg, nents, direction, attrs);
 }
@@ -2914,7 +2914,7 @@ static inline int ib_dma_map_sg_attrs(struct ib_device *dev,
 static inline void ib_dma_unmap_sg_attrs(struct ib_device *dev,
 					 struct scatterlist *sg, int nents,
 					 enum dma_data_direction direction,
-					 struct dma_attrs *attrs)
+					 unsigned long attrs)
 {
 	dma_unmap_sg_attrs(dev->dma_device, sg, nents, direction, attrs);
 }
-- 
1.9.1
