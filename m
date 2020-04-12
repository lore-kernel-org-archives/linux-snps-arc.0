Return-Path: <SRS0=m+rD=54=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4B8C2D0EC
	for <linux-snps-arc@archiver.kernel.org>; Sun, 12 Apr 2020 19:51:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB65B20739
	for <linux-snps-arc@archiver.kernel.org>; Sun, 12 Apr 2020 19:51:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jdZ1zrVC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmX/znam"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB65B20739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BjcVvOfK752CPT1NIB9UCdFKE1rh7y7gUqQLARHvhy8=; b=jdZ1zrVCnW99qT
	Ru+Di/xgl2VqJFfJzqZTUWczylTueFpRYJaebk8xAiiGULVzZalm96Flhqpc+rDRAagFOsLtXLfLW
	AYgIvURN2rHm0es08cKFVtbvNGp3v/pE1rv8jf53hwFh+hmwio5TtUFU67XQxgRNXqMqTf3zMvYgb
	8JO7MUpFdJ891uJScBu8/0xszxcd1Rk/RhrSdhpZD3m6IzQ86RTlSke+wGUuetKwxC4De9+8BTrZz
	fcTTLqTq509nzbg9i0E7ygtZPSXnxHs+LhIxuEUAKHY34PHR29+N2H3ls0RP3vUmOakrOSMg57Wju
	k1gi18ZQ33ZdV1cSslLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jNidm-0003qb-TV; Sun, 12 Apr 2020 19:51:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNidi-0003ng-1E; Sun, 12 Apr 2020 19:51:35 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED38620786;
 Sun, 12 Apr 2020 19:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586721093;
 bh=RaEFwf1Dg8QS0ghxN0g50OrmoshwC3iLBCxx8YoomVg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FmX/znamSc454dWsyiLNk6Nt4/3TmmYpzqGPNGEc9H7l+3+elou5W4MmBeEQVFCud
 wbM5Us9982kbmPez3EXPaiN7w4Y229amf/aGmX5uSmTU+olJBZeJ4C2uq1Zw92CCKy
 Omy+L7MXc1pYWz5icjWJ28HY2fh0ToFjClAmRjdg=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 09/21] csky: simplify detection of memory zone boundaries
Date: Sun, 12 Apr 2020 22:48:47 +0300
Message-Id: <20200412194859.12663-10-rppt@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200412194859.12663-1-rppt@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200412_125134_113937_6177B0DA 
X-CRM114-Status: GOOD (  13.01  )
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
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

The free_area_init() function only requires the definition of maximal PFN
for each of the supported zone rater than calculation of actual zone sizes
and the sizes of the holes between the zones.

After removal of CONFIG_HAVE_MEMBLOCK_NODE_MAP the free_area_init() is
available to all architectures.

Using this function instead of free_area_init_node() simplifies the zone
detection.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/csky/kernel/setup.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/arch/csky/kernel/setup.c b/arch/csky/kernel/setup.c
index 819a9a7bf786..0481f4e34538 100644
--- a/arch/csky/kernel/setup.c
+++ b/arch/csky/kernel/setup.c
@@ -26,7 +26,9 @@ struct screen_info screen_info = {
 
 static void __init csky_memblock_init(void)
 {
-	unsigned long zone_size[MAX_NR_ZONES];
+	unsigned long lowmem_size = PFN_DOWN(LOWMEM_LIMIT - PHYS_OFFSET_OFFSET);
+	unsigned long sseg_size = PFN_DOWN(SSEG_SIZE - PHYS_OFFSET_OFFSET);
+	unsigned long max_zone_pfn[MAX_NR_ZONES] = { 0 };
 	signed long size;
 
 	memblock_reserve(__pa(_stext), _end - _stext);
@@ -36,28 +38,22 @@ static void __init csky_memblock_init(void)
 
 	memblock_dump_all();
 
-	memset(zone_size, 0, sizeof(zone_size));
-
 	min_low_pfn = PFN_UP(memblock_start_of_DRAM());
 	max_low_pfn = max_pfn = PFN_DOWN(memblock_end_of_DRAM());
 
 	size = max_pfn - min_low_pfn;
 
-	if (size <= PFN_DOWN(SSEG_SIZE - PHYS_OFFSET_OFFSET))
-		zone_size[ZONE_NORMAL] = size;
-	else if (size < PFN_DOWN(LOWMEM_LIMIT - PHYS_OFFSET_OFFSET)) {
-		zone_size[ZONE_NORMAL] =
-				PFN_DOWN(SSEG_SIZE - PHYS_OFFSET_OFFSET);
-		max_low_pfn = min_low_pfn + zone_size[ZONE_NORMAL];
-	} else {
-		zone_size[ZONE_NORMAL] =
-				PFN_DOWN(LOWMEM_LIMIT - PHYS_OFFSET_OFFSET);
-		max_low_pfn = min_low_pfn + zone_size[ZONE_NORMAL];
+	if (size >= lowmem_size) {
+		max_low_pfn = min_low_pfn + lowmem_size;
 		write_mmu_msa1(read_mmu_msa0() + SSEG_SIZE);
+	} else if (size > sseg_size) {
+		max_low_pfn = min_low_pfn + sseg_size;
 	}
 
+	max_zone_pfn[ZONE_NORMAL] = max_low_pfn;
+
 #ifdef CONFIG_HIGHMEM
-	zone_size[ZONE_HIGHMEM] = max_pfn - max_low_pfn;
+	max_zone_pfn[ZONE_HIGHMEM] = max_pfn;
 
 	highstart_pfn = max_low_pfn;
 	highend_pfn   = max_pfn;
@@ -66,7 +62,7 @@ static void __init csky_memblock_init(void)
 
 	dma_contiguous_reserve(0);
 
-	free_area_init_node(0, zone_size, min_low_pfn, NULL);
+	free_area_init(max_zone_pfn);
 }
 
 void __init setup_arch(char **cmdline_p)
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
