From: anshuman.khandual@arm.com (Anshuman Khandual)
Date: Fri, 11 Oct 2019 11:55:41 +0530
Subject: [PATCH V5 1/2] mm/hugetlb: Make alloc_gigantic_page() available for
 general use
In-Reply-To: <1570775142-31425-1-git-send-email-anshuman.khandual@arm.com>
References: <1570775142-31425-1-git-send-email-anshuman.khandual@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1570775142-31425-2-git-send-email-anshuman.khandual@arm.com>
To: linux-snps-arc@lists.infradead.org

alloc_gigantic_page() implements an allocation method where it scans over
various zones looking for a large contiguous memory block which could not
have been allocated through the buddy allocator. A subsequent patch which
tests arch page table helpers needs such a method to allocate PUD_SIZE
sized memory block. In the future such methods might have other use cases
as well. So alloc_gigantic_page() has been split carving out actual memory
allocation method and made available via new alloc_gigantic_page_order().

Cc: Andrew Morton <akpm at linux-foundation.org>
Cc: Vlastimil Babka <vbabka at suse.cz>
Cc: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
Cc: Thomas Gleixner <tglx at linutronix.de>
Cc: Mike Rapoport <rppt at linux.vnet.ibm.com>
Cc: Mike Kravetz <mike.kravetz at oracle.com>
Cc: Jason Gunthorpe <jgg at ziepe.ca>
Cc: Dan Williams <dan.j.williams at intel.com>
Cc: Peter Zijlstra <peterz at infradead.org>
Cc: Michal Hocko <mhocko at kernel.org>
Cc: Mark Rutland <mark.rutland at arm.com>
Cc: Mark Brown <broonie at kernel.org>
Cc: Steven Price <Steven.Price at arm.com>
Cc: Ard Biesheuvel <ard.biesheuvel at linaro.org>
Cc: Masahiro Yamada <yamada.masahiro at socionext.com>
Cc: Kees Cook <keescook at chromium.org>
Cc: Tetsuo Handa <penguin-kernel at i-love.sakura.ne.jp>
Cc: Matthew Wilcox <willy at infradead.org>
Cc: Sri Krishna chowdary <schowdary at nvidia.com>
Cc: Dave Hansen <dave.hansen at intel.com>
Cc: Russell King - ARM Linux <linux at armlinux.org.uk>
Cc: Michael Ellerman <mpe at ellerman.id.au>
Cc: Paul Mackerras <paulus at samba.org>
Cc: Martin Schwidefsky <schwidefsky at de.ibm.com>
Cc: Heiko Carstens <heiko.carstens at de.ibm.com>
Cc: "David S. Miller" <davem at davemloft.net>
Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: James Hogan <jhogan at kernel.org>
Cc: Paul Burton <paul.burton at mips.com>
Cc: Ralf Baechle <ralf at linux-mips.org>
Cc: Kirill A. Shutemov <kirill at shutemov.name>
Cc: Gerald Schaefer <gerald.schaefer at de.ibm.com>
Cc: Christophe Leroy <christophe.leroy at c-s.fr>
Cc: linux-snps-arc at lists.infradead.org
Cc: linux-mips at vger.kernel.org
Cc: linux-arm-kernel at lists.infradead.org
Cc: linux-ia64 at vger.kernel.org
Cc: linuxppc-dev at lists.ozlabs.org
Cc: linux-s390 at vger.kernel.org
Cc: linux-sh at vger.kernel.org
Cc: sparclinux at vger.kernel.org
Cc: x86 at kernel.org
Cc: linux-kernel at vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual at arm.com>
---
 include/linux/hugetlb.h |  9 +++++++++
 mm/hugetlb.c            | 24 ++++++++++++++++++++++--
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 4c5a16b..7ff1e36 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -298,6 +298,9 @@ static inline bool is_file_hugepages(struct file *file)
 }
 
 
+struct page *
+alloc_gigantic_page_order(unsigned int order, gfp_t gfp_mask,
+			  int nid, nodemask_t *nodemask);
 #else /* !CONFIG_HUGETLBFS */
 
 #define is_file_hugepages(file)			false
@@ -309,6 +312,12 @@ hugetlb_file_setup(const char *name, size_t size, vm_flags_t acctflag,
 	return ERR_PTR(-ENOSYS);
 }
 
+static inline struct page *
+alloc_gigantic_page_order(unsigned int order, gfp_t gfp_mask,
+			  int nid, nodemask_t *nodemask)
+{
+	return NULL;
+}
 #endif /* !CONFIG_HUGETLBFS */
 
 #ifdef HAVE_ARCH_HUGETLB_UNMAPPED_AREA
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 977f9a3..2996e44 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1066,10 +1066,9 @@ static bool zone_spans_last_pfn(const struct zone *zone,
 	return zone_spans_pfn(zone, last_pfn);
 }
 
-static struct page *alloc_gigantic_page(struct hstate *h, gfp_t gfp_mask,
+struct page *alloc_gigantic_page_order(unsigned int order, gfp_t gfp_mask,
 		int nid, nodemask_t *nodemask)
 {
-	unsigned int order = huge_page_order(h);
 	unsigned long nr_pages = 1 << order;
 	unsigned long ret, pfn, flags;
 	struct zonelist *zonelist;
@@ -1105,6 +1104,14 @@ static struct page *alloc_gigantic_page(struct hstate *h, gfp_t gfp_mask,
 	return NULL;
 }
 
+static struct page *alloc_gigantic_page(struct hstate *h, gfp_t gfp_mask,
+					int nid, nodemask_t *nodemask)
+{
+	unsigned int order = huge_page_order(h);
+
+	return alloc_gigantic_page_order(order, gfp_mask, nid, nodemask);
+}
+
 static void prep_new_huge_page(struct hstate *h, struct page *page, int nid);
 static void prep_compound_gigantic_page(struct page *page, unsigned int order);
 #else /* !CONFIG_CONTIG_ALLOC */
@@ -1113,6 +1120,12 @@ static struct page *alloc_gigantic_page(struct hstate *h, gfp_t gfp_mask,
 {
 	return NULL;
 }
+
+struct page *alloc_gigantic_page_order(unsigned int order, gfp_t gfp_mask,
+				       int nid, nodemask_t *nodemask)
+{
+	return NULL;
+}
 #endif /* CONFIG_CONTIG_ALLOC */
 
 #else /* !CONFIG_ARCH_HAS_GIGANTIC_PAGE */
@@ -1121,6 +1134,13 @@ static struct page *alloc_gigantic_page(struct hstate *h, gfp_t gfp_mask,
 {
 	return NULL;
 }
+
+struct page *alloc_gigantic_page_order(unsigned int order, gfp_t gfp_mask,
+				       int nid, nodemask_t *nodemask)
+{
+	return NULL;
+}
+
 static inline void free_gigantic_page(struct page *page, unsigned int order) { }
 static inline void destroy_compound_gigantic_page(struct page *page,
 						unsigned int order) { }
-- 
2.7.4
