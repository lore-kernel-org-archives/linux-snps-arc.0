Return-Path: <SRS0=cQ7c=OT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03867C433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Sep 2021 16:40:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBD3D61406
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Sep 2021 16:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBD3D61406
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yHNUA48zT97x1WlPCpvOLTj/d5mFJHqHZqHb/BfpUvA=; b=Ia++T7Ktsqai98
	efOGAmQsTMCMmsHp51WnU36ulJ+Ya4OiQqGC9RqgEpo81IXI8gi6UC83EvWst5PDHrgEL9TqfteV8
	xO/g86UumE4Fy2kPtIGHse+ko+/eAvkJbq6M7gvlSm06fYKpnmhoX/+q+QQhPGntGSaoUEq+Sybc/
	T6aDRqNvPivzNR0eb1wua4BGewN47nxw7Oci7IBSSy6yUn6Vm75+rKR83nuTx6AcXspcJrFkchmBL
	X5MuPpIWVXIae3iSfLzMGNBS+GyxOB7SjbGxc5iScTnMq069HN+B3dbt0f0T6sIdxOyxrCCkdP2Xp
	QIabT0Nihgv1MVAOOplg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVccm-00Bqpq-9Y; Wed, 29 Sep 2021 16:40:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVcci-00Bqo9-2R; Wed, 29 Sep 2021 16:40:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8683761411;
 Wed, 29 Sep 2021 16:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632933599;
 bh=t8dn/WnbBBYbLwRPmrH71m1uQ/o93fnaL1REzEP+yOs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SuGn5wf4j66NI18xGqtKOMcbTU3KcbpcZgDCLxzsuVnUtCLZTFT19+lBcWHpX8l5Y
 4HJt3SEXjTF8YFlmYhiRqC3Q7e2EIIhbZHzkA4PWpwavCaveL76xurOeZQChTMoP9G
 rSRG1qLj38huXnzTeWAzkYTYXFbJIAMb5egCuWxdDLUhGyl1zH02ClSM0KB9MmcD49
 nLWVlcXk/IDGZs0YiU+Hh7V4VGJe5X3YINZpqugr6yEpnMKAIHPeLZUU7CqOhCT879
 znp+/oqCsnMuduLTlsGm00As2ESqshUFy23cAs69hXOWfZANijgY7kzxg3rq/btf3P
 sqf5f4Xu/Jqag==
Date: Wed, 29 Sep 2021 09:39:58 -0700
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
Subject: Re: [PATCH v1 3/4] memblock: add MEMBLOCK_DRIVER_MANAGED to mimic
 IORESOURCE_SYSRAM_DRIVER_MANAGED
Message-ID: <YVSW3uuu7mIcJMm3@kernel.org>
References: <20210927150518.8607-1-david@redhat.com>
 <20210927150518.8607-4-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210927150518.8607-4-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_094000_177204_860263C9 
X-CRM114-Status: GOOD (  30.95  )
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

Hi,

On Mon, Sep 27, 2021 at 05:05:17PM +0200, David Hildenbrand wrote:
> Let's add a flag that corresponds to IORESOURCE_SYSRAM_DRIVER_MANAGED.
> Similar to MEMBLOCK_HOTPLUG, most infrastructure has to treat such memory
> like ordinary MEMBLOCK_NONE memory -- for example, when selecting memory
> regions to add to the vmcore for dumping in the crashkernel via
> for_each_mem_range().
 
Can you please elaborate on the difference in semantics of MEMBLOCK_HOTPLUG
and MEMBLOCK_DRIVER_MANAGED?
Unless I'm missing something they both mark memory that can be unplugged
anytime and so it should not be used in certain cases. Why is there a need
for a new flag?

> However, especially kexec_file is not supposed to select such memblocks via
> for_each_free_mem_range() / for_each_free_mem_range_reverse() to place
> kexec images, similar to how we handle IORESOURCE_SYSRAM_DRIVER_MANAGED
> without CONFIG_ARCH_KEEP_MEMBLOCK.
> 
> Let's document why kexec_walk_memblock() won't try placing images on
> areas marked MEMBLOCK_DRIVER_MANAGED -- similar to
> IORESOURCE_SYSRAM_DRIVER_MANAGED handling in locate_mem_hole_callback()
> via kexec_walk_resources().
> 
> We'll make sure that memory hotplug code sets the flag where applicable
> (IORESOURCE_SYSRAM_DRIVER_MANAGED) next. This prepares architectures
> that need CONFIG_ARCH_KEEP_MEMBLOCK, such as arm64, for virtio-mem
> support.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/linux/memblock.h | 16 ++++++++++++++--
>  kernel/kexec_file.c      |  5 +++++
>  mm/memblock.c            |  4 ++++
>  3 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index b49a58f621bc..7d8d656d5082 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -33,12 +33,17 @@ extern unsigned long long max_possible_pfn;
>   * @MEMBLOCK_NOMAP: don't add to kernel direct mapping and treat as
>   * reserved in the memory map; refer to memblock_mark_nomap() description
>   * for further details
> + * @MEMBLOCK_DRIVER_MANAGED: memory region that is always detected via a driver,
> + * corresponding to IORESOURCE_SYSRAM_DRIVER_MANAGED in the kernel resource
> + * tree. Especially kexec should never use this memory for placing images and
> + * shouldn't expose this memory to the second kernel.
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
> @@ -209,7 +214,8 @@ static inline void __next_physmem_range(u64 *idx, struct memblock_type *type,
>   */
>  #define for_each_mem_range(i, p_start, p_end) \
>  	__for_each_mem_range(i, &memblock.memory, NULL, NUMA_NO_NODE,	\
> -			     MEMBLOCK_HOTPLUG, p_start, p_end, NULL)
> +			     MEMBLOCK_HOTPLUG | MEMBLOCK_DRIVER_MANAGED, \
> +			     p_start, p_end, NULL)
>  
>  /**
>   * for_each_mem_range_rev - reverse iterate through memblock areas from
> @@ -220,7 +226,8 @@ static inline void __next_physmem_range(u64 *idx, struct memblock_type *type,
>   */
>  #define for_each_mem_range_rev(i, p_start, p_end)			\
>  	__for_each_mem_range_rev(i, &memblock.memory, NULL, NUMA_NO_NODE, \
> -				 MEMBLOCK_HOTPLUG, p_start, p_end, NULL)
> +				 MEMBLOCK_HOTPLUG | MEMBLOCK_DRIVER_MANAGED,\
> +				 p_start, p_end, NULL)
>  
>  /**
>   * for_each_reserved_mem_range - iterate over all reserved memblock areas
> @@ -250,6 +257,11 @@ static inline bool memblock_is_nomap(struct memblock_region *m)
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
