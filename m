Return-Path: <SRS0=xF7R=6N=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC70BC83004
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Apr 2020 12:12:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AADD208FE
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Apr 2020 12:12:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kf8x2aTU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xyr7ydjz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AADD208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9QdFLnB/xT31aulSaQNoDJpM3lJ8RqoeEKtCYxFVXOI=; b=kf8x2aTUFwfPtu
	Ix2poW5JVRTS2xoKNoCbGxKRoiuYdBf5AvEQy68LJYmwNx+npGAv7GL5N3iac6+trZXl+DshnlgHL
	iYgvb2tRlyDc4TaPjr8+vcWSXpDkIXwAq/+cWBk8nfpPSUtGAXt9mf//u/qjJb5BQPRu/oPSZ8jbv
	UA9yHle8Klp3y1wb+Ur9GM5KV1UaaklQWP+oj1WAN6P9Y6lkWlvLB1dHHHG7lBtuY7wVaDJAnqOQT
	Y6BH8jeCJHA5DxMjHOIcib6MVo5oOmpYmTjSUsiAZQxQXjx/0BUDTWeMU4Bc1KEUpXAlJHjOyyrVd
	Uhgemwi5gxeVak6RVyDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTlZh-0007sW-V6; Wed, 29 Apr 2020 12:12:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTlZc-0007pP-Gm; Wed, 29 Apr 2020 12:12:21 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D7E0F21775;
 Wed, 29 Apr 2020 12:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588162340;
 bh=TCd+5edlAp9i6e5wITXxxtnVrf6WWkTQlgVmr7051p8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xyr7ydjznaJGZfBd4hSErKFX3YfrId7NY3jgXZs16QqYN26miM3kx5vOodcdnWDiB
 IhJvjl71BnFJuB+xIgCuDSUHfyMPL3yEtNKYboZziA7+1w8XSNw2pRS5Fet+bv4XVu
 itlqIVaOwJpQ6PGqTie+mcWR0d/pEVBqUl7EGnbk=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/20] mm: memblock: replace dereferences of
 memblock_region.nid with API calls
Date: Wed, 29 Apr 2020 15:11:07 +0300
Message-Id: <20200429121126.17989-2-rppt@kernel.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200429121126.17989-1-rppt@kernel.org>
References: <20200429121126.17989-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_051220_596451_8399B44F 
X-CRM114-Status: GOOD (  16.18  )
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Mike Rapoport <rppt@linux.ibm.com>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Qian Cai <cai@lca.pw>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, Hoan Tran <Hoan@os.amperecomputing.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

There are several places in the code that directly dereference
memblock_region.nid despite this field being defined only when
CONFIG_HAVE_MEMBLOCK_NODE_MAP=y.

Replace these with calls to memblock_get_region_nid() to improve code
robustness and to avoid possible breakage when
CONFIG_HAVE_MEMBLOCK_NODE_MAP will be removed.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/arm64/mm/numa.c | 9 ++++++---
 arch/x86/mm/numa.c   | 6 ++++--
 mm/memblock.c        | 8 +++++---
 mm/page_alloc.c      | 4 ++--
 4 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
index 4decf1659700..aafcee3e3f7e 100644
--- a/arch/arm64/mm/numa.c
+++ b/arch/arm64/mm/numa.c
@@ -350,13 +350,16 @@ static int __init numa_register_nodes(void)
 	struct memblock_region *mblk;
 
 	/* Check that valid nid is set to memblks */
-	for_each_memblock(memory, mblk)
-		if (mblk->nid == NUMA_NO_NODE || mblk->nid >= MAX_NUMNODES) {
+	for_each_memblock(memory, mblk) {
+		int mblk_nid = memblock_get_region_node(mblk);
+
+		if (mblk_nid == NUMA_NO_NODE || mblk_nid >= MAX_NUMNODES) {
 			pr_warn("Warning: invalid memblk node %d [mem %#010Lx-%#010Lx]\n",
-				mblk->nid, mblk->base,
+				mblk_nid, mblk->base,
 				mblk->base + mblk->size - 1);
 			return -EINVAL;
 		}
+	}
 
 	/* Finally register nodes. */
 	for_each_node_mask(nid, numa_nodes_parsed) {
diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
index 59ba008504dc..fe024b2ac796 100644
--- a/arch/x86/mm/numa.c
+++ b/arch/x86/mm/numa.c
@@ -517,8 +517,10 @@ static void __init numa_clear_kernel_node_hotplug(void)
 	 *   reserve specific pages for Sandy Bridge graphics. ]
 	 */
 	for_each_memblock(reserved, mb_region) {
-		if (mb_region->nid != MAX_NUMNODES)
-			node_set(mb_region->nid, reserved_nodemask);
+		int nid = memblock_get_region_node(mb_region);
+
+		if (nid != MAX_NUMNODES)
+			node_set(nid, reserved_nodemask);
 	}
 
 	/*
diff --git a/mm/memblock.c b/mm/memblock.c
index c79ba6f9920c..43e2fd3006c1 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1207,13 +1207,15 @@ void __init_memblock __next_mem_pfn_range(int *idx, int nid,
 {
 	struct memblock_type *type = &memblock.memory;
 	struct memblock_region *r;
+	int r_nid;
 
 	while (++*idx < type->cnt) {
 		r = &type->regions[*idx];
+		r_nid = memblock_get_region_node(r);
 
 		if (PFN_UP(r->base) >= PFN_DOWN(r->base + r->size))
 			continue;
-		if (nid == MAX_NUMNODES || nid == r->nid)
+		if (nid == MAX_NUMNODES || nid == r_nid)
 			break;
 	}
 	if (*idx >= type->cnt) {
@@ -1226,7 +1228,7 @@ void __init_memblock __next_mem_pfn_range(int *idx, int nid,
 	if (out_end_pfn)
 		*out_end_pfn = PFN_DOWN(r->base + r->size);
 	if (out_nid)
-		*out_nid = r->nid;
+		*out_nid = r_nid;
 }
 
 /**
@@ -1810,7 +1812,7 @@ int __init_memblock memblock_search_pfn_nid(unsigned long pfn,
 	*start_pfn = PFN_DOWN(type->regions[mid].base);
 	*end_pfn = PFN_DOWN(type->regions[mid].base + type->regions[mid].size);
 
-	return type->regions[mid].nid;
+	return memblock_get_region_node(&type->regions[mid]);
 }
 #endif
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 69827d4fa052..0d012eda1694 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7208,7 +7208,7 @@ static void __init find_zone_movable_pfns_for_nodes(void)
 			if (!memblock_is_hotpluggable(r))
 				continue;
 
-			nid = r->nid;
+			nid = memblock_get_region_node(r);
 
 			usable_startpfn = PFN_DOWN(r->base);
 			zone_movable_pfn[nid] = zone_movable_pfn[nid] ?
@@ -7229,7 +7229,7 @@ static void __init find_zone_movable_pfns_for_nodes(void)
 			if (memblock_is_mirror(r))
 				continue;
 
-			nid = r->nid;
+			nid = memblock_get_region_node(r);
 
 			usable_startpfn = memblock_region_memory_base_pfn(r);
 
-- 
2.26.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
