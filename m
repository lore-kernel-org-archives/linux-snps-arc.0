Return-Path: <SRS0=oLQF=EC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F37C388F9
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Oct 2020 11:32:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 520E52074B
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Oct 2020 11:32:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pwzAS0/p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZ3uGKlw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 520E52074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KXFHd4sbsLPaDD3CSB73oZ+HbnH9Mg9bz38DQjwhCA8=; b=pwzAS0/pn4K7ozSqQ5Ex6Vha7
	JWYtGH4OBzwZkSaYHVkUmFW0TkjdFxCv0vVrcxaIVNUOvyUGrKAN/XZW+4iStB0bdbtCNU0jUEF7k
	0TeGuf1Q0XJLWcMUB2lL7AGaP050SfFhxJFhKEmkWIzjMjlQ67f7xQKKPisgWAYO+9la84bN/fIHf
	5e7uvevFCCGnmwDkq66jSC5uvk9tVhiZBSIZo/M2eUlNVF2SBbMs8ICX0qGvrv0yQHRaVHhIVxqpn
	9ceq5vG/uMMRnBNBS07nzyIzTN7eMgHIr5lhQNwXaIeoltLwfgBABZgg906Q6HxcCoxK7ivWq+mus
	brdoxOt8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXNDJ-0003TO-6o; Tue, 27 Oct 2020 11:32:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXNBS-0002cj-3U; Tue, 27 Oct 2020 11:30:35 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03F2122283;
 Tue, 27 Oct 2020 11:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603798233;
 bh=UfaD/WmylipAS87Fv242yQHFr5+l5RhyHEWJxMmp2r8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AZ3uGKlwmDzw01MtfzRYyVNFCrBHcj9hNEcpMvUBfVE6GXyYWgRs8+pNMO0tSpZ5n
 oKhgEP2eGtZrAXR4Jr+NuG5k7tt55ZwBXPkLdsRajrq8dYk0EnHYeNA20jabsK6JID
 37xeaYZ4dJneHg8tW/gL3ZpBIbtl8c+S6BeyS9O0=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 04/13] ia64: discontig: paging_init(): remove local max_pfn
 calculation
Date: Tue, 27 Oct 2020 13:29:46 +0200
Message-Id: <20201027112955.14157-5-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201027112955.14157-1-rppt@kernel.org>
References: <20201027112955.14157-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_073034_391650_8A174784 
X-CRM114-Status: GOOD (  14.01  )
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
Cc: linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-m68k@lists.linux-m68k.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-arm-kernel@lists.infradead.org, Michael Schmitz <schmitzmic@gmail.com>,
 Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

The maximal PFN in the system is calculated during find_memory() time and
it is stored at max_low_pfn then.

Use this value in paging_init() and remove the redundant detection of
max_pfn in that function.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/ia64/mm/discontig.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/ia64/mm/discontig.c b/arch/ia64/mm/discontig.c
index d255596f52c6..f41dcf75887b 100644
--- a/arch/ia64/mm/discontig.c
+++ b/arch/ia64/mm/discontig.c
@@ -594,7 +594,6 @@ void __init paging_init(void)
 {
 	unsigned long max_dma;
 	unsigned long pfn_offset = 0;
-	unsigned long max_pfn = 0;
 	int node;
 	unsigned long max_zone_pfns[MAX_NR_ZONES];
 
@@ -616,13 +615,11 @@ void __init paging_init(void)
 #ifdef CONFIG_VIRTUAL_MEM_MAP
 		NODE_DATA(node)->node_mem_map = vmem_map + pfn_offset;
 #endif
-		if (mem_data[node].max_pfn > max_pfn)
-			max_pfn = mem_data[node].max_pfn;
 	}
 
 	memset(max_zone_pfns, 0, sizeof(max_zone_pfns));
 	max_zone_pfns[ZONE_DMA32] = max_dma;
-	max_zone_pfns[ZONE_NORMAL] = max_pfn;
+	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
 	free_area_init(max_zone_pfns);
 
 	zero_page_memmap_ptr = virt_to_page(ia64_imva(empty_zero_page));
-- 
2.28.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
