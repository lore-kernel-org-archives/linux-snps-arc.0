Return-Path: <SRS0=vffI=NG=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494D2C4338F
	for <linux-snps-arc@archiver.kernel.org>; Sun, 15 Aug 2021 09:26:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 102D961055
	for <linux-snps-arc@archiver.kernel.org>; Sun, 15 Aug 2021 09:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 102D961055
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sSwaIPtVeFVuLeFLVDahi4COo5lEjMZJGnT165gLpNE=; b=s1H1MQANfXQUiu
	ImrqkaIi9Oz/L30glORSm+pJtbyyO1uwyoQaGX6BdFNubM4PY9eRd0GgGWiEjxS6wM+Pu1iqkbHT+
	fyGlpjd0FA7ixtp8bIWTgLF/ElybDPUL8L89D/SwrHzvVBFF0qTg5XyHxWtquxPl1/BPY2JO/yQAo
	G2g7S1gtJXy5f72JsVLNXWknQj6Y3oZJPRD4vYbG1ylad8vUK6sJGQfQbW1lHL/fDXOtUkQB5Dw/x
	/sNHpQGWEnjyBvPxBnIrpG70dGbcrD8GZPeyZnFFDqaUZ1ROeGT8IrtYHPX8YTFq+I5Sx0bO5ybb+
	9v13uw5tS0O16GcphVag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFCPx-00F5Bf-Ka; Sun, 15 Aug 2021 09:26:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFCPs-00F5Ax-8U
 for linux-snps-arc@lists.infradead.org; Sun, 15 Aug 2021 09:26:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D6DDF6103A;
 Sun, 15 Aug 2021 09:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629019610;
 bh=trUOhcObmX84g8zVOeV0ixAL+vgOcmd4ivtys7gco1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=R1/r42SDz5CKltxjesnI9RS2eUH1qqsAtkx86DEdIbS9bfj1OD3ZvNXv9FQb9u3dn
 VaXYQMqY0fDPad+uHr4YCKwE/5e9Rf7+keC1SlSSmF/+g8rfph/tJi9Aj9AjhD7zml
 42xRUl+An9WqFwOhL0rUfyChSCid8cJIDLCV0tr7PZcP0l0mZmFwgEW8p+ICxWPsrQ
 IvE4BqaMsfegoCHNISFqeyYvAe6cV45Lxypb0Hj/161UKMhvl9WbZAVjCHkAlKO/Tf
 6E0tUN+pnzv9jI0jrLQ9/Zkj1fwMoeo1SRTAw6PogAcY6WYxUn0UXECpihvhMKk3h2
 dk12dh2sVhMVQ==
Date: Sun, 15 Aug 2021 12:26:43 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v2 00/19] ARC mm updates: support 3/4 levels and
 asm-generic/pgalloc
Message-ID: <YRjd01Tr3IuEE7wj@kernel.org>
References: <20210812233753.104217-1-vgupta@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210812233753.104217-1-vgupta@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_022652_374364_BA1960FF 
X-CRM114-Status: GOOD (  17.90  )
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

On Thu, Aug 12, 2021 at 04:37:34PM -0700, Vineet Gupta wrote:
> Hi,
> 
> Big pile of ARC mm changes to prepare for 3 or 4 levels of paging (from
> current 2) needed for new hardware page walked MMUv6 (in aRCv3 ISA based
> cores).
> 
> Most of these changes are incremental cleanups to make way for 14/18 and
> 15/18 which actually imeplement the new levels (in existing ARCv2 port)
> and worth a critical eye.
> 
> CC'ing some of you guys dealing with page tables for a while :-)
> to spot any obvious gotchas.

There are a couple of small nits here and there, but overall

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> Thx,
> -Vineet
> 
> Changes since v1 [1]
>  - Switched ARC to asm-generic/pgalloc.h  (so struct page based pgtable_t)      [Mike Rapoport]
>  - Dropped {pud,pmd}_alloc_one/{pud,pmd}_free provided by asm-generic/pgalloc.h [Mike Rapoport]
>  - Negative diffstat now due to above
>  - Added BUILD_BUG_ON() to arch/arc/mm/init.c for sanity of table sizes
>  - Consolidated 2 patches related to ARC_USE_SCRATCH_REG			   [Mike Rapoport]
>  - Reworked how mmu is re-enabled in entry code                                 [Jose Abreu]
> 
> [1] http://lists.infradead.org/pipermail/linux-snps-arc/2021-August/005326.html
> 
> Vineet Gupta (19):
>   ARC: mm: use SCRATCH_DATA0 register for caching pgdir in ARCv2 only
>   ARC: mm: remove tlb paranoid code
>   ARC: mm: move mmu/cache externs out to setup.h
>   ARC: mm: Fixes to allow STRICT_MM_TYPECHECKS
>   ARC: mm: Enable STRICT_MM_TYPECHECKS
>   ARC: ioremap: use more commonly used PAGE_KERNEL based uncached flag
>   ARC: mm: pmd_populate* to use the canonical set_pmd (and drop pmd_set)
>   ARC: mm: switch pgtable_t back to struct page *
>   ARC: mm: switch to asm-generic/pgalloc.h
>   ARC: mm: non-functional code cleanup ahead of 3 levels
>   ARC: mm: move MMU specific bits out of ASID allocator
>   ARC: mm: move MMU specific bits out of entry code ...
>   ARC: mm: disintegrate mmu.h (arcv2 bits out)
>   ARC: mm: disintegrate pgtable.h into levels and flags
>   ARC: mm: hack to allow 2 level build with 4 level code
>   ARC: mm: support 3 levels of page tables
>   ARC: mm: support 4 levels of page tables
>   ARC: mm: vmalloc sync from kernel to user table to update PMD ...
>   ARC: mm: introduce _PAGE_TABLE to explicitly link pgd,pud,pmd entries
> 
>  arch/arc/Kconfig                          |   7 +-
>  arch/arc/include/asm/cache.h              |   4 -
>  arch/arc/include/asm/entry-compact.h      |   8 -
>  arch/arc/include/asm/mmu-arcv2.h          | 103 +++++++
>  arch/arc/include/asm/mmu.h                |  73 +----
>  arch/arc/include/asm/mmu_context.h        |  28 +-
>  arch/arc/include/asm/page.h               |  74 +++--
>  arch/arc/include/asm/pgalloc.h            |  81 ++----
>  arch/arc/include/asm/pgtable-bits-arcv2.h | 151 +++++++++++
>  arch/arc/include/asm/pgtable-levels.h     | 179 ++++++++++++
>  arch/arc/include/asm/pgtable.h            | 315 +---------------------
>  arch/arc/include/asm/processor.h          |   2 +-
>  arch/arc/include/asm/setup.h              |  12 +-
>  arch/arc/kernel/entry-arcv2.S             |   1 +
>  arch/arc/kernel/entry.S                   |   7 +-
>  arch/arc/mm/fault.c                       |  20 +-
>  arch/arc/mm/init.c                        |   5 +
>  arch/arc/mm/ioremap.c                     |   3 +-
>  arch/arc/mm/tlb.c                         |  68 +----
>  arch/arc/mm/tlbex.S                       |  78 ++----
>  20 files changed, 591 insertions(+), 628 deletions(-)
>  create mode 100644 arch/arc/include/asm/mmu-arcv2.h
>  create mode 100644 arch/arc/include/asm/pgtable-bits-arcv2.h
>  create mode 100644 arch/arc/include/asm/pgtable-levels.h
> 
> -- 
> 2.25.1
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
