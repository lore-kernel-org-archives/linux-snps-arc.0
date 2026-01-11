Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F37D2502F
	for <linux-snps-arc@archiver.kernel.org>; Sun, 11 Jan 2026 08:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qjm8/BGPq4v6EAhr57J8sQ2MMmxz0zQLvsXwkaFih8s=; b=JJk3TeUzQXfs3e
	UN8NjAIF9ZvYLZYOwHaUAzH3vNxuTNjpJXAiEIptMuhvuPvASrKY6DE0a6IjLbHO7tOke7Hqm4o9k
	bfuh2YG6KUyg2YqlWnKXZGBhufNW5QPyxC3gu+dC63C7yn22wPuK+IJnsjKnFL6z4I7JbJE4WwDSq
	dXrijy6VFHDjc52KZSSu9t7ZN8lzl6Nj2VPZM5HG+fb1LHA31Zc/ktTtkftNoDjDvCGQSNC7CrM5z
	XppoWEeaKlQKqApatYbEKyyOLAsYyn1XjdYZajg2pPn7wKC9DGr32ftd0RGY9xs2kV9hqPQATZaht
	3EeQEerPp1GW29pUTrgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veqjA-00000003yjj-2owG;
	Sun, 11 Jan 2026 08:23:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veqj8-00000003yiG-2WOe;
	Sun, 11 Jan 2026 08:23:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E27A660121;
	Sun, 11 Jan 2026 08:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05345C16AAE;
	Sun, 11 Jan 2026 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768119789;
	bh=eqWldmxLZQ+MuA70zzUt7CpIfBT1PwNgoY4RoneYtY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C7Y72wXMIxHy6XkJmztuJdQ7nrb/H8/0yqr2w4/E8QJWA6Rh7TQ+ZTA2XKzQ3ppiQ
	 X/qwP1y/mqTOg6PM+vVJgydtDmryLcrPh0+4sdC39sKAoOqs5zk81ppMMhRkZyoBoG
	 R8KzISUkYPxY9N6ycbarzaLaShlZRJE9S/Kua930Tcb7BlLeq3d9B+2H8aFuuDHi2p
	 JSEOXk2pHvwES0AP3AccrgQTHtv78VrdBJKTJthZCDN/GF9sDqikJWjBhjbAKeJAd8
	 G6mQ4D9TgsrMjQP9ao2FZLbEMY9cJGp4mDJvhQueucoRZ6oanJGeKA8L1K/1hlAkwv
	 jSDEOdDUId0nQ==
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
	Klara Modin <klarasmodin@gmail.com>,
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
	Ritesh Harjani <ritesh.list@gmail.com>,
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
Subject: [PATCH v3 07/29] hexagon: introduce arch_zone_limits_init()
Date: Sun, 11 Jan 2026 10:20:41 +0200
Message-ID: <20260111082105.290734-8-rppt@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260111082105.290734-1-rppt@kernel.org>
References: <20260111082105.290734-1-rppt@kernel.org>
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
 arch/hexagon/mm/init.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/hexagon/mm/init.c b/arch/hexagon/mm/init.c
index 34eb9d424b96..e2c9487d8d34 100644
--- a/arch/hexagon/mm/init.c
+++ b/arch/hexagon/mm/init.c
@@ -54,6 +54,18 @@ void sync_icache_dcache(pte_t pte)
 	__vmcache_idsync(addr, PAGE_SIZE);
 }
 
+void __init arch_zone_limits_init(unsigned long *max_zone_pfns)
+{
+	/*
+	 *  This is not particularly well documented anywhere, but
+	 *  give ZONE_NORMAL all the memory, including the big holes
+	 *  left by the kernel+bootmem_map which are already left as reserved
+	 *  in the bootmem_map; free_area_init should see those bits and
+	 *  adjust accordingly.
+	 */
+	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
+}
+
 /*
  * In order to set up page allocator "nodes",
  * somebody has to call free_area_init() for UMA.
@@ -65,16 +77,7 @@ static void __init paging_init(void)
 {
 	unsigned long max_zone_pfn[MAX_NR_ZONES] = {0, };
 
-	/*
-	 *  This is not particularly well documented anywhere, but
-	 *  give ZONE_NORMAL all the memory, including the big holes
-	 *  left by the kernel+bootmem_map which are already left as reserved
-	 *  in the bootmem_map; free_area_init should see those bits and
-	 *  adjust accordingly.
-	 */
-
-	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
-
+	arch_zone_limits_init(max_zone_pfn);
 	free_area_init(max_zone_pfn);  /*  sets up the zonelists and mem_map  */
 
 	/*
-- 
2.51.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
