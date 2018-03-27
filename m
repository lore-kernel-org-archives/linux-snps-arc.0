From: Evgeniy.Didin@synopsys.com (Evgeniy Didin)
Date: Tue, 27 Mar 2018 17:12:54 +0000
Subject: dma-mapping: clearing GFP_ZERO flag caused crashes of Ethernet on
 arc/hsdk board.
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1522170774.2593.9.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hello,

After commit  57bf5a8963f8 ("dma-mapping: clear harmful GFP_* flags in common code")  we noticed problems with Ethernet controller on one of our platforms (namely ARC HSDK).
I
n particular we see that removal of __GFP_ZERO flag in function dma_alloc_attrs() was the culprit because in our implementation of arc_dma_alloc() we only allocate zeroed pages if
that flag is explicitly set by the caller. Now with unconditional removal of that flag in dma_alloc_attrs() we allocate non-zeroed pages and that seem to cause problems.

From
mentioned commit message I may conclude that architectural code is supposed to always allocate zeroed pages but I cannot find any requirement of that in kernel's documentation.
Coul
d you please point me to that requirement if that exists at all, then we'll implement a fix in our arch code like that:
--------------------->8---------------------
diff --git
a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
index 1dcc404b5aec..c92e518413aa 100644
--- a/arch/arc/mm/dma.c
+++ b/arch/arc/mm/dma.c
@@ -30,7 +30,7 @@ static void *arc_dma_alloc(struct
device *dev, size_t size,
      void *kvaddr;
      int need_coh = 1, need_kvaddr = 0;

-       page = alloc_pages(gfp, order);
+       page = alloc_pages(gfp | __GFP_ZERO, order);
     
if (!page)
              return NULL;
--------------------->8---------------------

Best regards,
Evgeniy Didin
