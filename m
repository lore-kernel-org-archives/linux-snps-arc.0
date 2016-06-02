From: k.kozlowski@samsung.com (Krzysztof Kozlowski)
Date: Thu, 02 Jun 2016 17:39:47 +0200
Subject: [RFC v3 45/45] dma-mapping: Document the DMA attributes right in
 declaration
In-Reply-To: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
References: <1464881987-13203-1-git-send-email-k.kozlowski@samsung.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1464881987-13203-46-git-send-email-k.kozlowski@samsung.com>
To: linux-snps-arc@lists.infradead.org

Copy documentation abstract about each DMA attribute from
Documentation/DMA-attributes.txt to the place with declaration.

Suggested-by: Christoph Hellwig <hch at infradead.org>
Signed-off-by: Krzysztof Kozlowski <k.kozlowski at samsung.com>
---
 include/linux/dma-mapping.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 6d013ba94213..f349df4cb009 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -14,14 +14,47 @@
 /**
  * List of possible attributes associated with a DMA mapping. The semantics
  * of each attribute should be defined in Documentation/DMA-attributes.txt.
+ *
+ * DMA_ATTR_WRITE_BARRIER: DMA to a memory region with this attribute
+ * forces all pending DMA writes to complete.
  */
 #define DMA_ATTR_WRITE_BARRIER		(1UL << 1)
+/*
+ * DMA_ATTR_WEAK_ORDERING: Specifies that reads and writes to the mapping
+ * may be weakly ordered, that is that reads and writes may pass each other.
+ */
 #define DMA_ATTR_WEAK_ORDERING		(1UL << 2)
+/*
+ * DMA_ATTR_WRITE_COMBINE: Specifies that writes to the mapping may be
+ * buffered to improve performance.
+ */
 #define DMA_ATTR_WRITE_COMBINE		(1UL << 3)
+/*
+ * DMA_ATTR_NON_CONSISTENT: Lets the platform to choose to return either
+ * consistent or non-consistent memory as it sees fit.
+ */
 #define DMA_ATTR_NON_CONSISTENT		(1UL << 4)
+/*
+ * DMA_ATTR_NO_KERNEL_MAPPING: Lets the platform to avoid creating a kernel
+ * virtual mapping for the allocated buffer.
+ */
 #define DMA_ATTR_NO_KERNEL_MAPPING	(1UL << 5)
+/*
+ * DMA_ATTR_SKIP_CPU_SYNC: Allows platform code to skip synchronization of
+ * the CPU cache for the given buffer assuming that it has been already
+ * transferred to 'device' domain.
+ */
 #define DMA_ATTR_SKIP_CPU_SYNC		(1UL << 6)
+/*
+ * DMA_ATTR_FORCE_CONTIGUOUS: Forces contiguous allocation of the buffer
+ * in physical memory.
+ */
 #define DMA_ATTR_FORCE_CONTIGUOUS	(1UL << 7)
+/*
+ * DMA_ATTR_ALLOC_SINGLE_PAGES: This is a hint to the DMA-mapping subsystem
+ * that it's probably not worth the time to try to allocate memory to in a way
+ * that gives better TLB efficiency.
+ */
 #define DMA_ATTR_ALLOC_SINGLE_PAGES	(1UL << 8)
 
 /*
-- 
1.9.1
