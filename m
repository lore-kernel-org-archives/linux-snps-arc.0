Return-Path: <SRS0=MahF=FR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93ADDC4361B
	for <linux-snps-arc@archiver.kernel.org>; Sun, 13 Dec 2020 08:36:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37C492063A
	for <linux-snps-arc@archiver.kernel.org>; Sun, 13 Dec 2020 08:36:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37C492063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YJF7nDxDCEsNFacefkU+o9SyTrzjFBPa067GD8ra3u0=; b=FJNfQQVT2UW5BAEV9gRdHVWPm
	0CjeVYlmqdJTEAnGaJfxD0s/C0E6+fk2hlO6Yhur9YwRy3WcDlRWo5Oe/XLxX+LAfWvUHmVHR0F1y
	8oTlFg7xzdXaHq1efUH/qLulvavykfvcUu5TK99zwtsDT/ifiFHfrNaO/u6J17mlyTu8SWdulKmEy
	Uc2iWruy+DlXeV8Tp1YB/tz9mJ2qEX1I/z10xN2rJ3i0eexm+VTKnjBH5Aro51d+vrzipFZ3kr9n2
	bv1YiRkzcIV5FXjtGZJnL0RMzdXzHnozWxCgRyVWU3jjQTiEjIQG3PSHhzdXPMH6CkRH1OjVVOoKg
	BT5wrmwpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koMs4-0004YE-6y; Sun, 13 Dec 2020 08:36:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koMrt-0004XG-7y; Sun, 13 Dec 2020 08:36:38 +0000
Date: Sun, 13 Dec 2020 10:36:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607848595;
 bh=Oe5JGmuoMJ7Fs86WbZB5DZ1VQL2J/VAWBl+yhiWVzvc=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=giEpchRcy5TjV9ZPzj0N2Wlz7xFPJvYE3eB6uLRF2S+KF2bzg5LCT6jd1ZWDSoGpo
 IDu1rDd1+q8X76G5XPDmzweszjCemSA+1Y3Xm7O6/ikSbuLm+0W6A03T+FDqjCREjR
 A2bH0triUWEEOsEsJD1E6iOmbfGUf8t6lTz6+0BU8O24Yt+WaVjupEsTb4ik4kweIO
 KUmQ7pq2euLIkksCLx1dbpbat2gG4ZarsEmZIRHK1iIbo1tfiGBcyRtFBoc5oiqE60
 SvASYLoEtg1dHP0ygnpg2NlWoCAEAmL9bR3Xsmh8b2AVNXcs+p9DtN7w7jWs7mq2QS
 JE8iYzcEHWvpg==
From: Mike Rapoport <rppt@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 07/13] ia64: make SPARSEMEM default and disable
 DISCONTIGMEM
Message-ID: <20201213083623.GA198219@kernel.org>
References: <20201027112955.14157-1-rppt@kernel.org>
 <20201027112955.14157-8-rppt@kernel.org>
 <20201212160144.GA174701@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201212160144.GA174701@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_033637_571570_0EBCCCC1 
X-CRM114-Status: GOOD (  20.41  )
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
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sat, Dec 12, 2020 at 08:01:44AM -0800, Guenter Roeck wrote:
> On Tue, Oct 27, 2020 at 01:29:49PM +0200, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > SPARSEMEM memory model suitable for systems with large holes in their
> > phyiscal memory layout. With SPARSEMEM_VMEMMAP enabled it provides
> > pfn_to_page() and page_to_pfn() as fast as FLATMEM.
> > 
> > Make it the default memory model for IA-64 and disable DISCONTIGMEM which
> > is considered obsolete for quite some time.
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> 
> This patch results in 
> 
> include/linux/mmzone.h:1156:2: error: #error Allocator MAX_ORDER exceeds SECTION_SIZE
>  1156 | #error Allocator MAX_ORDER exceeds SECTION_SIZE
> 
> when building ia64:defconfig.
> 
> Also, PAGE_SHIFT is not defined, though I don't know if that is related.

This is realated as sparesemem.h on ia64 needs PAGE_SHIFT for
SECTION_SIZE and it is not there.
This fixes the build for me (the patch is vs
v5.10-rc7-mmots-2020-12-11-14-43)

diff --git a/arch/ia64/include/asm/sparsemem.h b/arch/ia64/include/asm/sparsemem.h
index dd8c166ffd7b..84652c26f3d9 100644
--- a/arch/ia64/include/asm/sparsemem.h
+++ b/arch/ia64/include/asm/sparsemem.h
@@ -3,6 +3,8 @@
 #define _ASM_IA64_SPARSEMEM_H
 
 #ifdef CONFIG_SPARSEMEM
+#include <asm/page.h>
+
 /*
  * SECTION_SIZE_BITS            2^N: how big each section will be
  * MAX_PHYSMEM_BITS             2^N: how much memory we can have in that space

> Reverting the patch fixes the problem for me.
> 
> Guenter
> 
> ---
> bisect log:
> 
> # bad: [3cc2bd440f2171f093b3a8480a4b54d8c270ed38] Add linux-next specific files for 20201211
> # good: [0477e92881850d44910a7e94fc2c46f96faa131f] Linux 5.10-rc7
> git bisect start 'HEAD' 'v5.10-rc7'
> # good: [0a701401d4e29d9e73f0f3cc02179fc6c9191646] Merge remote-tracking branch 'crypto/master'
> git bisect good 0a701401d4e29d9e73f0f3cc02179fc6c9191646
> # good: [6fd39ad603b113e9c68180b9138084710c036e34] Merge remote-tracking branch 'spi/for-next'
> git bisect good 6fd39ad603b113e9c68180b9138084710c036e34
> # good: [c96b2eec436e87b8c673213b203559bed9e551b9] Merge remote-tracking branch 'vfio/next'
> git bisect good c96b2eec436e87b8c673213b203559bed9e551b9
> # good: [4f2e7f6a2ce4e621b77e59c8763549fa8bee7b4b] Merge remote-tracking branch 'gpio/for-next'
> git bisect good 4f2e7f6a2ce4e621b77e59c8763549fa8bee7b4b
> # good: [5ee06b21caaeb37a1ff5143e8ce91b376fe73dc2] swiotlb.h: add "inline" to swiotlb_adjust_size
> git bisect good 5ee06b21caaeb37a1ff5143e8ce91b376fe73dc2
> # bad: [46aa09d885ce303efd6444def783ec575a5b57ee] mm, page_poison: remove CONFIG_PAGE_POISONING_ZERO
> git bisect bad 46aa09d885ce303efd6444def783ec575a5b57ee
> # good: [3b77356d530bfd93e2450c063718292aa435eede] mm: mmap_lock: add tracepoints around lock acquisition
> git bisect good 3b77356d530bfd93e2450c063718292aa435eede
> # bad: [e0287fb91c006d12bed9e6fbfc7fe661ad7f9647] mm,hwpoison: disable pcplists before grabbing a refcount
> git bisect bad e0287fb91c006d12bed9e6fbfc7fe661ad7f9647
> # bad: [94d171d065be406a2407f0d723afe14c05526283] ia64: make SPARSEMEM default and disable DISCONTIGMEM
> git bisect bad 94d171d065be406a2407f0d723afe14c05526283
> # good: [7499e1e91e18a285274e9b761ba2abf21e4343fa] mm/vmalloc: use free_vm_area() if an allocation fails
> git bisect good 7499e1e91e18a285274e9b761ba2abf21e4343fa
> # good: [eba50fff503fa6d6e20679509a1a960c3e003d22] lib/test_kasan.c: add workqueue test case
> git bisect good eba50fff503fa6d6e20679509a1a960c3e003d22
> # good: [e343d6ff702aaae6181448a38ff85cf201b011ba] ia64: remove 'ifdef CONFIG_ZONE_DMA32' statements
> git bisect good e343d6ff702aaae6181448a38ff85cf201b011ba
> # good: [a0bfb938ae29239a3f13f6a6a4ef41c3c7f0c84c] ia64: split virtual map initialization out of paging_init()
> git bisect good a0bfb938ae29239a3f13f6a6a4ef41c3c7f0c84c
> # good: [0e791e5138cde9b96d34ba68136fd26bb97f81e5] ia64: forbid using VIRTUAL_MEM_MAP with FLATMEM
> git bisect good 0e791e5138cde9b96d34ba68136fd26bb97f81e5
> # first bad commit: [94d171d065be406a2407f0d723afe14c05526283] ia64: make SPARSEMEM default and disable DISCONTIGMEM
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
