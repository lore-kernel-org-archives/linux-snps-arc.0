Return-Path: <SRS0=IHtY=CG=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04ECDC433E2
	for <linux-snps-arc@archiver.kernel.org>; Fri, 28 Aug 2020 16:39:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C80DB2098B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 28 Aug 2020 16:39:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wwQdneJW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAnMIBUg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C80DB2098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6sJDB3aVPNTW8ykSQApLM03gS4MLjyFhwcrJl8yw200=; b=wwQdneJWgysNMlXV3uO3B/Fvgg
	BcHLjhgx/H7SAwBx56Uevwau811qZS4kfsLqk8AHZyyfeGwu4njQzykThz5IBM5mKOmF4WLZzbmFH
	amwsmcSo7Jm8FSPy5/+t960F9P5GF30nVqrsb++PJ5cE8s1t+5zrvZ3gpIjc90jwCEYpRLup7VHP3
	Iq4F+i3z9zA0ezu5KclrVmUGOzP9r9Datk6pXu/aI97UCQds+u6O5RoNLUBLUU5qvvdJRIT7jQAXH
	5LxikT4+zLN3JRd+/ieZ1bZZoQtobVtsoTpDpjNvXswpa2HPOmNE38DEJEu0JAKnKa0CTOj0N/MKP
	entlvqyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBhPE-0003YR-5h; Fri, 28 Aug 2020 16:39:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBhPB-0003Xf-90
 for linux-snps-arc@lists.infradead.org; Fri, 28 Aug 2020 16:39:10 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 57F7520872;
 Fri, 28 Aug 2020 16:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598632748;
 bh=YVCQjg73RxPTvlTXDUxrWS87exJNOw0r+AtJ4Kjw2bM=;
 h=From:To:Cc:Subject:Date:From;
 b=OAnMIBUg/35kIR+XHFI3uW81Vhsq5RuiNO8PZO0o+7cScYYcfQFJ/tKoqYInqbOSi
 dQWnnF3AWY7qf+6NtTYAPh1hjs5+LeMHiPoLIzkFYN69Mx3EDHR9KMKJKlYqzI8jS1
 aTQbasoMLnPibL/SFcRCQ2iAC1tMlDy4bHOcscvs=
From: Mike Rapoport <rppt@kernel.org>
To: Vineet Gupta <vgupta@synopsys.com>
Subject: [PATCH] arc: fix memory initialization for systems with two memory
 banks
Date: Fri, 28 Aug 2020 19:39:02 +0300
Message-Id: <20200828163902.4548-1-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_123909_440923_DBA0A3B5 
X-CRM114-Status: GOOD (  12.28  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

Rework if memory map initialization broke initialization of ARC systems
with two memory banks. Before these changes, memblock was not aware of
nodes configuration and the memory map was always allocated from the
"lowmem" bank. After the addition of node information to memblock, the core
mm attempts to allocate the memory map for the "highmem" bank from its
node. The access to this memory using __va() fails because it can be only
accessed using kmap.

Anther problem that was uncovered is that {min,max}_high_pfn are calculated
from u64 high_mem_start variable which prevents truncation to 32-bit
physical address and the PFN values are above the node and zone boundaries.

Use phys_addr_t type for high_mem_start and high_mem_size to ensure
correspondence between PFNs and highmem zone boundaries and reserve the
entire highmem bank until mem_init() to avoid accesses to it before highmem
is enabled.

Fixes: 51930df5801e ("mm: free_area_init: allow defining max_zone_pfn in descend ing order")
Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/arc/mm/init.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index f886ac69d8ad..3a35b82a718e 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -26,8 +26,8 @@ static unsigned long low_mem_sz;
 
 #ifdef CONFIG_HIGHMEM
 static unsigned long min_high_pfn, max_high_pfn;
-static u64 high_mem_start;
-static u64 high_mem_sz;
+static phys_addr_t high_mem_start;
+static phys_addr_t high_mem_sz;
 #endif
 
 #ifdef CONFIG_DISCONTIGMEM
@@ -69,6 +69,7 @@ void __init early_init_dt_add_memory_arch(u64 base, u64 size)
 		high_mem_sz = size;
 		in_use = 1;
 		memblock_add_node(base, size, 1);
+		memblock_reserve(base, size);
 #endif
 	}
 
@@ -157,7 +158,7 @@ void __init setup_arch_memory(void)
 	min_high_pfn = PFN_DOWN(high_mem_start);
 	max_high_pfn = PFN_DOWN(high_mem_start + high_mem_sz);
 
-	max_zone_pfn[ZONE_HIGHMEM] = max_high_pfn;
+	max_zone_pfn[ZONE_HIGHMEM] = min_low_pfn;
 
 	high_memory = (void *)(min_high_pfn << PAGE_SHIFT);
 	kmap_init();
@@ -166,22 +167,26 @@ void __init setup_arch_memory(void)
 	free_area_init(max_zone_pfn);
 }
 
-/*
- * mem_init - initializes memory
- *
- * Frees up bootmem
- * Calculates and displays memory available/used
- */
-void __init mem_init(void)
+static void __init highmem_init(void)
 {
 #ifdef CONFIG_HIGHMEM
 	unsigned long tmp;
 
-	reset_all_zones_managed_pages();
+	memblock_free(high_mem_start, high_mem_sz);
 	for (tmp = min_high_pfn; tmp < max_high_pfn; tmp++)
 		free_highmem_page(pfn_to_page(tmp));
 #endif
+}
 
+/*
+ * mem_init - initializes memory
+ *
+ * Frees up bootmem
+ * Calculates and displays memory available/used
+ */
+void __init mem_init(void)
+{
 	memblock_free_all();
+	highmem_init();
 	mem_init_print_info(NULL);
 }
-- 
2.26.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
