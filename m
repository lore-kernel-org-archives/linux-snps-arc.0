Return-Path: <SRS0=98aq=O2=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A589C433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Oct 2021 00:35:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0533861211
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Oct 2021 00:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0533861211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9y8trecwBrbv0Un2wSSKQIwK8qBeF6dKvPEyZLkpSIg=; b=Gdf/DCVK30WVc/
	T92WQs4gpZMBQhOIcOrmN5K9I/b377KN14ml7T8cTBilVHs1kBusR8aqXCpzO76C2wXafGi4xhJo3
	vFwneksq27LYDDIkt/8gsFYFiU+gPSzagK4zpOkBErU7GWI7EkjbAT0Iu9jOynTuuWvwItc10qP2K
	T4gLOIhicgmquJjg1OEh8ZRofT6iIOgqNvYUd2YMXxGXB5jTlvplhs/NE5zgqARfIGg8XtVkOMbo6
	9//z/c5PvYkHM62JD75TMT3Vf5C6M3iJe2ihSlRfdB0DuqIaxQK7AVoPKUvod65ndX/8eYnJ/1G0b
	sfmOGPMxfXovCD9aYc7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXuuJ-00CPHR-JZ; Wed, 06 Oct 2021 00:35:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXuuE-00CPGW-PT; Wed, 06 Oct 2021 00:35:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A47B46120C;
 Wed,  6 Oct 2021 00:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633480532;
 bh=X+zuIEzgi4BJRPliLjv9iRYOHwZRPc7zUl+fNXFGj9o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JHEmt663Hm1u48LCqrFlkrtGcV9ux30e+mppC54cYcoazB1AyaoZk3aLY7CaL1qJ8
 EuyS9FHdM0DRu1QnziIUuHkxiPI8kmwHlYj6d4UUamsulACykZLlSkA4giBe7+kRhV
 z/hyErDGbTP9PgMmjmTUOjJ6f76gaSQDj6/WBbdB5dutm8Vp0moPIgcjOUJ8uDBv9r
 9BVujwaUsW4eZcL/ukhEkPNjd0R8BebmXvX1ED3CoHUGVLid4LEveLLoY2+/HwZ/wR
 MWlzTf6vmlDmJo12AIv8AS9YGYnxlU3dlcY6MMPsV9D+w4zKmHQ/IQAeab0PwF0JxA
 l96fZm3yoDZiQ==
Date: Tue, 5 Oct 2021 17:35:28 -0700
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>,
 Jianyong Wu <Jianyong.Wu@arm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-snps-arc@lists.infradead.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-mm@kvack.org, kexec@lists.infradead.org
Subject: Re: [PATCH v2 4/5] memblock: add MEMBLOCK_DRIVER_MANAGED to mimic
 IORESOURCE_SYSRAM_DRIVER_MANAGED
Message-ID: <YVzvUCOXlHNAjgQk@kernel.org>
References: <20211004093605.5830-1-david@redhat.com>
 <20211004093605.5830-5-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211004093605.5830-5-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_173534_915241_748E3D28 
X-CRM114-Status: GOOD (  34.97  )
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

On Mon, Oct 04, 2021 at 11:36:04AM +0200, David Hildenbrand wrote:
> Let's add a flag that corresponds to IORESOURCE_SYSRAM_DRIVER_MANAGED,
> indicating that we're dealing with a memory region that is never
> indicated in the firmware-provided memory map, but always detected and
> added by a driver.
> 
> Similar to MEMBLOCK_HOTPLUG, most infrastructure has to treat such memory
> regions like ordinary MEMBLOCK_NONE memory regions -- for example, when
> selecting memory regions to add to the vmcore for dumping in the
> crashkernel via for_each_mem_range().
> 
> However, especially kexec_file is not supposed to select such memblocks via
> for_each_free_mem_range() / for_each_free_mem_range_reverse() to place
> kexec images, similar to how we handle IORESOURCE_SYSRAM_DRIVER_MANAGED
> without CONFIG_ARCH_KEEP_MEMBLOCK.
> 
> We'll make sure that memory hotplug code sets the flag where applicable
> (IORESOURCE_SYSRAM_DRIVER_MANAGED) next. This prepares architectures
> that need CONFIG_ARCH_KEEP_MEMBLOCK, such as arm64, for virtio-mem
> support.
> 
> Note that kexec *must not* indicate this memory to the second kernel
> and *must not* place kexec-images on this memory. Let's add a comment to
> kexec_walk_memblock(), documenting how we handle MEMBLOCK_DRIVER_MANAGED
> now just like using IORESOURCE_SYSRAM_DRIVER_MANAGED in
> locate_mem_hole_callback() for kexec_walk_resources().
> 
> Also note that MEMBLOCK_HOTPLUG cannot be reused due to different
> semantics:
> 	MEMBLOCK_HOTPLUG: memory is indicated as "System RAM" in the
> 	firmware-provided memory map and added to the system early during
> 	boot; kexec *has to* indicate this memory to the second kernel and
> 	can place kexec-images on this memory. After memory hotunplug,
> 	kexec has to be re-armed. We mostly ignore this flag when
> 	"movable_node" is not set on the kernel command line, because
> 	then we're told to not care about hotunpluggability of such
> 	memory regions.
> 
> 	MEMBLOCK_DRIVER_MANAGED: memory is not indicated as "System RAM" in
> 	the firmware-provided memory map; this memory is always detected
> 	and added to the system by a driver; memory might not actually be
> 	physically hotunpluggable. kexec *must not* indicate this memory to
> 	the second kernel and *must not* place kexec-images on this memory.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  include/linux/memblock.h | 16 ++++++++++++++--
>  kernel/kexec_file.c      |  5 +++++
>  mm/memblock.c            |  4 ++++
>  3 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index 2bc726e43a1b..b3b29ccf91f3 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -37,12 +37,17 @@ extern unsigned long long max_possible_pfn;
>   * @MEMBLOCK_NOMAP: don't add to kernel direct mapping and treat as
>   * reserved in the memory map; refer to memblock_mark_nomap() description
>   * for further details
> + * @MEMBLOCK_DRIVER_MANAGED: memory region that is always detected and added
> + * via a driver, and never indicated in the firmware-provided memory map as
> + * system RAM. This corresponds to IORESOURCE_SYSRAM_DRIVER_MANAGED in the
> + * kernel resource tree.
>   */
>  enum memblock_flags {
>  	MEMBLOCK_NONE		= 0x0,	/* No special request */
>  	MEMBLOCK_HOTPLUG	= 0x1,	/* hotpluggable region */
>  	MEMBLOCK_MIRROR		= 0x2,	/* mirrored region */
>  	MEMBLOCK_NOMAP		= 0x4,	/* don't add to kernel direct mapping */
> +	MEMBLOCK_DRIVER_MANAGED = 0x8,	/* always detected via a driver */
>  };
>  
>  /**
> @@ -213,7 +218,8 @@ static inline void __next_physmem_range(u64 *idx, struct memblock_type *type,
>   */
>  #define for_each_mem_range(i, p_start, p_end) \
>  	__for_each_mem_range(i, &memblock.memory, NULL, NUMA_NO_NODE,	\
> -			     MEMBLOCK_HOTPLUG, p_start, p_end, NULL)
> +			     MEMBLOCK_HOTPLUG | MEMBLOCK_DRIVER_MANAGED, \
> +			     p_start, p_end, NULL)
>  
>  /**
>   * for_each_mem_range_rev - reverse iterate through memblock areas from
> @@ -224,7 +230,8 @@ static inline void __next_physmem_range(u64 *idx, struct memblock_type *type,
>   */
>  #define for_each_mem_range_rev(i, p_start, p_end)			\
>  	__for_each_mem_range_rev(i, &memblock.memory, NULL, NUMA_NO_NODE, \
> -				 MEMBLOCK_HOTPLUG, p_start, p_end, NULL)
> +				 MEMBLOCK_HOTPLUG | MEMBLOCK_DRIVER_MANAGED,\
> +				 p_start, p_end, NULL)
>  
>  /**
>   * for_each_reserved_mem_range - iterate over all reserved memblock areas
> @@ -254,6 +261,11 @@ static inline bool memblock_is_nomap(struct memblock_region *m)
>  	return m->flags & MEMBLOCK_NOMAP;
>  }
>  
> +static inline bool memblock_is_driver_managed(struct memblock_region *m)
> +{
> +	return m->flags & MEMBLOCK_DRIVER_MANAGED;
> +}
> +
>  int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
>  			    unsigned long  *end_pfn);
>  void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
> diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
> index 33400ff051a8..8347fc158d2b 100644
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@ -556,6 +556,11 @@ static int kexec_walk_memblock(struct kexec_buf *kbuf,
>  	if (kbuf->image->type == KEXEC_TYPE_CRASH)
>  		return func(&crashk_res, kbuf);
>  
> +	/*
> +	 * Using MEMBLOCK_NONE will properly skip MEMBLOCK_DRIVER_MANAGED. See
> +	 * IORESOURCE_SYSRAM_DRIVER_MANAGED handling in
> +	 * locate_mem_hole_callback().
> +	 */
>  	if (kbuf->top_down) {
>  		for_each_free_mem_range_reverse(i, NUMA_NO_NODE, MEMBLOCK_NONE,
>  						&mstart, &mend, NULL) {
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 47a56b223141..540a35317fb0 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -979,6 +979,10 @@ static bool should_skip_region(struct memblock_type *type,
>  	if (!(flags & MEMBLOCK_NOMAP) && memblock_is_nomap(m))
>  		return true;
>  
> +	/* skip driver-managed memory unless we were asked for it explicitly */
> +	if (!(flags & MEMBLOCK_DRIVER_MANAGED) && memblock_is_driver_managed(m))
> +		return true;
> +
>  	return false;
>  }
>  
> -- 
> 2.31.1
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
