Return-Path: <SRS0=oLQF=EC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBABBC388F9
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Oct 2020 11:32:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6243E22263
	for <linux-snps-arc@archiver.kernel.org>; Tue, 27 Oct 2020 11:32:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jh3NihOw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9RaU3X/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6243E22263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bATuQWzZvNk2cocqmD6J5wdylvhcBSvOWSKaZBHO9Xo=; b=jh3NihOw94Ar5mTPKwqB72Tsdu
	7R8sswanuw+ovK+97rD7SF+RNaR+4ph+XRhHSRWkcY9S93mvpE385/d75ISEky4fBMRkwrw4rXSDz
	L/zTDqbXlUme5yeb+I+RMqkuOy0pRgsPtyZ/F1iG/3njpQm+Y9WyIf0dc3EV6RCCKG3yBRdewo5hf
	4qPGGFMG/uiJRosbi6YnMgFNfemX4nLcDAds7mxg+rbQmXM8YIwyQ3h55+9ucCWkjGF5ax3qrppTC
	gLQZDJNB5CzFlv+WqnWkCrzcgFu87n3zC7MmayWhS4/g9Vc+TTMn1nd9jurRxMlUVmmT2UZmpCcQh
	eAZQmRug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXNCr-0003E7-1T; Tue, 27 Oct 2020 11:32:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXNB1-0002Pl-2N; Tue, 27 Oct 2020 11:30:11 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFD8B2072D;
 Tue, 27 Oct 2020 11:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603798206;
 bh=D+57eBxZmqbGtpUmyagmHDBw1nHF2DKjanAqVX/AUkU=;
 h=From:To:Cc:Subject:Date:From;
 b=Q9RaU3X/IJD/4dR3n3h9Ry46q2+Cd8ehNOxEB9JeoN0lGPicebs+j0qlAtlVAlW8F
 F0vBvYTqv4GdHlkIa6G/HY/NJCiv0uBzWYkm4yxUz82hTQedsGnDaIAnFDeQrWUA7f
 J4FEjdA0fGYuRF4Pc52GN10CIYKMe57/A5m9zfC0=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 00/13] arch, mm: deprecate DISCONTIGMEM
Date: Tue, 27 Oct 2020 13:29:42 +0200
Message-Id: <20201027112955.14157-1-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_073007_391290_3D099B86 
X-CRM114-Status: GOOD (  18.53  )
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

Hi,

It's been a while since DISCONTIGMEM is generally considered deprecated,
but it is still used by four architectures. This set replaces DISCONTIGMEM
with a different way to handle holes in the memory map and marks
DISCONTIGMEM configuration as BROKEN in Kconfigs of these architectures with
the intention to completely remove it in several releases.

While for 64-bit alpha and ia64 the switch to SPARSEMEM is quite obvious
and was a matter of moving some bits around, for smaller 32-bit arc and
m68k SPARSEMEM is not necessarily the best thing to do.

On 32-bit machines SPARSEMEM would require large sections to make section
index fit in the page flags, but larger sections mean that more memory is
wasted for unused memory map.

Besides, pfn_to_page() and page_to_pfn() become less efficient, at least on
arc.

So I've decided to generalize arm's approach for freeing of unused parts of
the memory map with FLATMEM and enable it for both arc and m68k. The
details are in the description of patches 10 (arc) and 13 (m68k).

Mike Rapoport (13):
  alpha: switch from DISCONTIGMEM to SPARSEMEM
  ia64: remove custom __early_pfn_to_nid()
  ia64: remove 'ifdef CONFIG_ZONE_DMA32' statements
  ia64: discontig: paging_init(): remove local max_pfn calculation
  ia64: split virtual map initialization out of paging_init()
  ia64: forbid using VIRTUAL_MEM_MAP with FLATMEM
  ia64: make SPARSEMEM default and disable DISCONTIGMEM
  arm: remove CONFIG_ARCH_HAS_HOLES_MEMORYMODEL
  arm, arm64: move free_unused_memmap() to generic mm
  arc: use FLATMEM with freeing of unused memory map instead of DISCONTIGMEM
  m68k/mm: make node data and node setup depend on CONFIG_DISCONTIGMEM
  m68k/mm: enable use of generic memory_model.h for !DISCONTIGMEM
  m68k: deprecate DISCONTIGMEM

 Documentation/vm/memory-model.rst   |  3 +-
 arch/Kconfig                        |  3 ++
 arch/alpha/Kconfig                  |  8 +++
 arch/alpha/include/asm/mmzone.h     | 14 +----
 arch/alpha/include/asm/page.h       |  7 +--
 arch/alpha/include/asm/pgtable.h    | 12 ++---
 arch/alpha/include/asm/sparsemem.h  | 18 +++++++
 arch/alpha/kernel/setup.c           |  1 +
 arch/arc/Kconfig                    |  3 +-
 arch/arc/include/asm/page.h         | 20 ++++++--
 arch/arc/mm/init.c                  | 29 ++++++++---
 arch/arm/Kconfig                    | 10 +---
 arch/arm/mach-bcm/Kconfig           |  1 -
 arch/arm/mach-davinci/Kconfig       |  1 -
 arch/arm/mach-exynos/Kconfig        |  1 -
 arch/arm/mach-highbank/Kconfig      |  1 -
 arch/arm/mach-omap2/Kconfig         |  1 -
 arch/arm/mach-s5pv210/Kconfig       |  1 -
 arch/arm/mach-tango/Kconfig         |  1 -
 arch/arm/mm/init.c                  | 78 ----------------------------
 arch/arm64/Kconfig                  |  4 +-
 arch/arm64/mm/init.c                | 68 ------------------------
 arch/ia64/Kconfig                   | 11 ++--
 arch/ia64/include/asm/meminit.h     |  2 -
 arch/ia64/mm/contig.c               | 58 ++++++++++-----------
 arch/ia64/mm/discontig.c            | 44 ++++++++--------
 arch/ia64/mm/init.c                 | 14 -----
 arch/ia64/mm/numa.c                 | 30 -----------
 arch/m68k/Kconfig.cpu               | 32 ++++++++++--
 arch/m68k/include/asm/page.h        |  2 +
 arch/m68k/include/asm/page_mm.h     |  7 ++-
 arch/m68k/include/asm/virtconvert.h |  2 +-
 arch/m68k/mm/init.c                 |  8 +--
 fs/proc/kcore.c                     |  2 -
 include/linux/mm.h                  |  3 --
 include/linux/mmzone.h              | 42 ---------------
 mm/memblock.c                       | 80 +++++++++++++++++++++++++++++
 mm/mmzone.c                         | 14 -----
 mm/page_alloc.c                     | 16 ++++--
 mm/vmstat.c                         |  4 --
 40 files changed, 272 insertions(+), 384 deletions(-)
 create mode 100644 arch/alpha/include/asm/sparsemem.h


base-commit: 3650b228f83adda7e5ee532e2b90429c03f7b9ec
-- 
2.28.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
