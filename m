Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4543E92724
	for <linux-snps-arc@archiver.kernel.org>; Sun, 28 Dec 2025 12:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kc64TJNPBfqcQON439c6PSXiUuFhdROHG7rFxiQ6jNI=; b=S6Sol6bAKsIjZp
	qZqHnU70peEmbGrvI6m+vDUKJ3nQ90wEGmNNURIhdOm5vnKCFiFxFs2358V5CHRW9IOh9owAZZWzd
	2iEpS14PUnZ0CDYp6XbczkFEZCy6xncoYRg3x9e0Q/QNtATdJzAPRu405BVgw5mJ9+gG5o91Y3e6y
	KYkL0hT5hxk3kcZGVNygQI8ueaBGx//dP/dCH8xsJUiMr3s34hNn3dauAW0iCFc113B5gtxzKTy33
	0VbIq7xSJqe5FG/z2sFd2VhupZ2gop83yFBJ9RKI1bQqKQ4b1mPMOKfDoGmUU6R25Jkh1N5eibqgu
	mS0YqechH0Z12E2g5gwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZq4g-00000002hFI-4BGv;
	Sun, 28 Dec 2025 12:40:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZq4e-00000002hDg-3Xmx;
	Sun, 28 Dec 2025 12:40:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A04C560055;
	Sun, 28 Dec 2025 12:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A2FC19421;
	Sun, 28 Dec 2025 12:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766925637;
	bh=pGrH7LSUy/RWWaEZflrH8bSRmOyGysCgjYGTdbg1VRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ny5n8bhx4lGhdGkVESizKnB9s5NjTXyCzl/BNa3Ba9ZKpEvM/CZIdOIL7SOU9jff2
	 f9d7/RukDwQyZrvibX87GAMUHRnuu/jtE9lSsKII3JWBEOTYX6j4sd74c2ECetV/1v
	 efQADf10esO0n890dt3sP+OjZZ5uE3wI6PVBS5SExv55d39h4H7myjY/QFX0EizXtg
	 HUNJvz/qP4wR81roHy4qlL+10S1f9sDiJSTgMup03fwig5pGyQw/EYhxfP+eCAenCJ
	 7aBgLKnMx0G4Zdx1Cpyfjl9xvXr5bgSz5ylt3rHblj4ACGNjYm3Y/wasBOIdAic2Wg
	 pDiCOhnxJVisQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Michal Simek <monstr@monstr.eu>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org
Subject: [PATCH 01/28] alpha: introduce arch_zone_limits_init()
Date: Sun, 28 Dec 2025 14:39:31 +0200
Message-ID: <20251228124001.3624742-2-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251228124001.3624742-1-rppt@kernel.org>
References: <20251228124001.3624742-1-rppt@kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Move calculations of zone limits to a dedicated arch_zone_limits_init()
function.

Later MM core will use this function as an architecture specific callback
during nodes and zones initialization and thus there won't be a need to
call free_area_init() from every architecture.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/alpha/mm/init.c | 15 ++++++++++-----
 include/linux/mm.h   |  1 +
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/mm/init.c b/arch/alpha/mm/init.c
index 4c5ab9cd8a0a..cd0cb1abde5f 100644
--- a/arch/alpha/mm/init.c
+++ b/arch/alpha/mm/init.c
@@ -208,12 +208,8 @@ callback_init(void * kernel_end)
 	return kernel_end;
 }
 
-/*
- * paging_init() sets up the memory map.
- */
-void __init paging_init(void)
+void __init arch_zone_limits_init(unsigned long *max_zone_pfn)
 {
-	unsigned long max_zone_pfn[MAX_NR_ZONES] = {0, };
 	unsigned long dma_pfn;
 
 	dma_pfn = virt_to_phys((char *)MAX_DMA_ADDRESS) >> PAGE_SHIFT;
@@ -221,8 +217,17 @@ void __init paging_init(void)
 
 	max_zone_pfn[ZONE_DMA] = dma_pfn;
 	max_zone_pfn[ZONE_NORMAL] = max_pfn;
+}
+
+/*
+ * paging_init() sets up the memory map.
+ */
+void __init paging_init(void)
+{
+	unsigned long max_zone_pfn[MAX_NR_ZONES] = {0, };
 
 	/* Initialize mem_map[].  */
+	arch_zone_limits_init(max_zone_pfn);
 	free_area_init(max_zone_pfn);
 
 	/* Initialize the kernel's ZERO_PGE. */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 15076261d0c2..628c0e0ac313 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3552,6 +3552,7 @@ static inline unsigned long get_num_physpages(void)
  * free_area_init(max_zone_pfns);
  */
 void free_area_init(unsigned long *max_zone_pfn);
+void arch_zone_limits_init(unsigned long *max_zone_pfn);
 unsigned long node_map_pfn_alignment(void);
 extern unsigned long absent_pages_in_range(unsigned long start_pfn,
 						unsigned long end_pfn);
-- 
2.51.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
