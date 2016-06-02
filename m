From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Thu, 02 Jun 2016 17:39:39 +0200
Subject: [RFC v3 37/45] misc: mic: dma-mapping: Use unsigned long for dma_attrs
In-Reply-To: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464881987-13203-38-git-send-email-k.kozlowski@samsung.com>
To: linux-snps-arc@lists.infradead.org

Split out subsystem specific changes for easier reviews. This will be
squashed with main commit.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
---
 drivers/misc/mic/host/mic_boot.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/misc/mic/host/mic_boot.c b/drivers/misc/mic/host/mic_boot.c
index e047efd83f57..9599d732aff3 100644
--- a/drivers/misc/mic/host/mic_boot.c
+++ b/drivers/misc/mic/host/mic_boot.c
@@ -38,7 +38,7 @@ static inline struct mic_device *vpdev_to_mdev(struct device *dev)
 static dma_addr_t
 _mic_dma_map_page(struct device *dev, struct page *page,
 		  unsigned long offset, size_t size,
-		  enum dma_data_direction dir, struct dma_attrs *attrs)
+		  enum dma_data_direction dir, unsigned long attrs)
 {
 	void *va = phys_to_virt(page_to_phys(page)) + offset;
 	struct mic_device *mdev = vpdev_to_mdev(dev);
@@ -48,7 +48,7 @@ _mic_dma_map_page(struct device *dev, struct page *page,
 
 static void _mic_dma_unmap_page(struct device *dev, dma_addr_t dma_addr,
 				size_t size, enum dma_data_direction dir,
-				struct dma_attrs *attrs)
+				unsigned long attrs)
 {
 	struct mic_device *mdev = vpdev_to_mdev(dev);
 
@@ -144,7 +144,7 @@ static inline struct mic_device *scdev_to_mdev(struct scif_hw_dev *scdev)
 
 static void *__mic_dma_alloc(struct device *dev, size_t size,
 			     dma_addr_t *dma_handle, gfp_t gfp,
-			     struct dma_attrs *attrs)
+			     unsigned long attrs)
 {
 	struct scif_hw_dev *scdev = dev_get_drvdata(dev);
 	struct mic_device *mdev = scdev_to_mdev(scdev);
@@ -164,7 +164,7 @@ static void *__mic_dma_alloc(struct device *dev, size_t size,
 }
 
 static void __mic_dma_free(struct device *dev, size_t size, void *vaddr,
-			   dma_addr_t dma_handle, struct dma_attrs *attrs)
+			   dma_addr_t dma_handle, unsigned long attrs)
 {
 	struct scif_hw_dev *scdev = dev_get_drvdata(dev);
 	struct mic_device *mdev = scdev_to_mdev(scdev);
@@ -176,7 +176,7 @@ static void __mic_dma_free(struct device *dev, size_t size, void *vaddr,
 static dma_addr_t
 __mic_dma_map_page(struct device *dev, struct page *page, unsigned long offset,
 		   size_t size, enum dma_data_direction dir,
-		   struct dma_attrs *attrs)
+		   unsigned long attrs)
 {
 	void *va = phys_to_virt(page_to_phys(page)) + offset;
 	struct scif_hw_dev *scdev = dev_get_drvdata(dev);
@@ -188,7 +188,7 @@ __mic_dma_map_page(struct device *dev, struct page *page, unsigned long offset,
 static void
 __mic_dma_unmap_page(struct device *dev, dma_addr_t dma_addr,
 		     size_t size, enum dma_data_direction dir,
-		     struct dma_attrs *attrs)
+		     unsigned long attrs)
 {
 	struct scif_hw_dev *scdev = dev_get_drvdata(dev);
 	struct mic_device *mdev = scdev_to_mdev(scdev);
@@ -198,7 +198,7 @@ __mic_dma_unmap_page(struct device *dev, dma_addr_t dma_addr,
 
 static int __mic_dma_map_sg(struct device *dev, struct scatterlist *sg,
 			    int nents, enum dma_data_direction dir,
-			    struct dma_attrs *attrs)
+			    unsigned long attrs)
 {
 	struct scif_hw_dev *scdev = dev_get_drvdata(dev);
 	struct mic_device *mdev = scdev_to_mdev(scdev);
@@ -229,7 +229,7 @@ err:
 static void __mic_dma_unmap_sg(struct device *dev,
 			       struct scatterlist *sg, int nents,
 			       enum dma_data_direction dir,
-			       struct dma_attrs *attrs)
+			       unsigned long attrs)
 {
 	struct scif_hw_dev *scdev = dev_get_drvdata(dev);
 	struct mic_device *mdev = scdev_to_mdev(scdev);
@@ -327,7 +327,7 @@ static inline struct mic_device *mbdev_to_mdev(struct mbus_device *mbdev)
 static dma_addr_t
 mic_dma_map_page(struct device *dev, struct page *page,
 		 unsigned long offset, size_t size, enum dma_data_direction dir,
-		 struct dma_attrs *attrs)
+		 unsigned long attrs)
 {
 	void *va = phys_to_virt(page_to_phys(page)) + offset;
 	struct mic_device *mdev = dev_get_drvdata(dev->parent);
@@ -338,7 +338,7 @@ mic_dma_map_page(struct device *dev, struct page *page,
 static void
 mic_dma_unmap_page(struct device *dev, dma_addr_t dma_addr,
 		   size_t size, enum dma_data_direction dir,
-		   struct dma_attrs *attrs)
+		   unsigned long attrs)
 {
 	struct mic_device *mdev = dev_get_drvdata(dev->parent);
 	mic_unmap_single(mdev, dma_addr, size);
-- 
1.9.1
