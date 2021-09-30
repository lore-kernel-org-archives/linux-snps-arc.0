Return-Path: <SRS0=Bf7c=OU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F8EC433FE
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Sep 2021 21:22:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93C2E61A6E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 30 Sep 2021 21:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 93C2E61A6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dioNe1J0gBaTlwMJU3oWfS5CbciF81ZRKqVynevkNUw=; b=wdmHjch2z6mR4v
	aIY3X6OMbHypodNFMbbEa28TJu16oH71gLVgK7/8ZjE+/yaV7e9MXjyDSsLLoLn4aBmno8CCQNpoo
	2nbpU/1ghJ5CDo+DutoWUXWURWFz1x0S74QyDobchipUZIxKJ5F5W9NVJYNRhegqd2G3yqAjJ+zyN
	BedIfcytfhykLKj3//aeQmnBAQSqvSJIO6qxjGnvzUTDqNkeuiXZuHTljqN3Xk5mSmgnBbWKh1rlv
	s3aSzCjjehFKhVUbxYZElCcX5e/4x18ILa0q1O97q0GNPopAYd84AfC/CwXCqql2nw9IimwNEXNoT
	qIUAK5i7XPBe5qDe2jvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mW3VC-00G1xm-3r; Thu, 30 Sep 2021 21:22:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mW3V7-00G1wH-TK; Thu, 30 Sep 2021 21:21:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5030061A38;
 Thu, 30 Sep 2021 21:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633036917;
 bh=5ZljzaXbR3xYsQvJRNVhxdM1OvKapm+v1Ojej4R63xE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GqbQwG1DyM3InnuIHi9HKra4huPMkQuVPLqsznYbmXGWNX1Sdw8gTbP6jGRu67Wul
 eoDKkWvnRYBvinlJhcLuN3McvlBEGXoLDVJOCyt14fdqSjivb5EKQxejPVLL8eXafC
 MY/HA2LZsZgy3JkzEsFlK1JVlqHt1tX09qhJ/n9N7x/mlOc4rZ7oOxwoL19LYdu/Kw
 2xkVxOLhAK/gzBynTVb8ZNDYyL0LZ9PqvNK9J20Bh6TKV7Y7STMqJkhXwhhX+SBY4x
 GpSiJ68+2RhjkQqGWoWssyxzMBDlC17Nfmg7tpWOtxUQH1r6sgJQACVFGLWnj1quYn
 KaUBJs+ZAnYMA==
Date: Thu, 30 Sep 2021 14:21:56 -0700
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
Message-ID: <YVYqdN7MFdzBlCVm@kernel.org>
References: <20210927150518.8607-1-david@redhat.com>
 <20210927150518.8607-4-david@redhat.com>
 <YVSW3uuu7mIcJMm3@kernel.org>
 <830c1670-378b-0fb6-bd5e-208e545fa126@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <830c1670-378b-0fb6-bd5e-208e545fa126@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_142158_006363_AC4E49D3 
X-CRM114-Status: GOOD (  31.30  )
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

On Wed, Sep 29, 2021 at 06:54:01PM +0200, David Hildenbrand wrote:
> On 29.09.21 18:39, Mike Rapoport wrote:
> > Hi,
> > 
> > On Mon, Sep 27, 2021 at 05:05:17PM +0200, David Hildenbrand wrote:
> > > Let's add a flag that corresponds to IORESOURCE_SYSRAM_DRIVER_MANAGED.
> > > Similar to MEMBLOCK_HOTPLUG, most infrastructure has to treat such memory
> > > like ordinary MEMBLOCK_NONE memory -- for example, when selecting memory
> > > regions to add to the vmcore for dumping in the crashkernel via
> > > for_each_mem_range().
> > Can you please elaborate on the difference in semantics of MEMBLOCK_HOTPLUG
> > and MEMBLOCK_DRIVER_MANAGED?
> > Unless I'm missing something they both mark memory that can be unplugged
> > anytime and so it should not be used in certain cases. Why is there a need
> > for a new flag?
> 
> In the cover letter I have "Alternative B: Reuse MEMBLOCK_HOTPLUG.
> MEMBLOCK_HOTPLUG serves a different purpose, though.", but looking into the
> details it won't work as is.
> 
> MEMBLOCK_HOTPLUG is used to mark memory early during boot that can later get
> hotunplugged again and should be placed into ZONE_MOVABLE if the
> "movable_node" kernel parameter is set.
> 
> The confusing part is that we talk about "hotpluggable" but really mean
> "hotunpluggable": the reason is that HW flags DIMM slots that can later be
> hotplugged as "hotpluggable" even though there is already something
> hotplugged.

MEMBLOCK_HOTPLUG name is indeed somewhat confusing, but still it's core
meaning "this memory may be removed" which does not differ from what
IORESOURCE_SYSRAM_DRIVER_MANAGED means.

MEMBLOCK_HOTPLUG regions are indeed placed into ZONE_MOVABLE, but more
importantly, they are avoided when we allocate memory from memblock.

So, in my view, both flags mean that the memory may be removed and it
should not be used for certain types of allocations.
 
> For example, ranges in the ACPI SRAT that are marked as
> ACPI_SRAT_MEM_HOT_PLUGGABLE will be marked MEMBLOCK_HOTPLUG early during
> boot (drivers/acpi/numa/srat.c:acpi_numa_memory_affinity_init()). Later, we
> use that information to size ZONE_MOVABLE
> (mm/page_alloc.c:find_zone_movable_pfns_for_nodes()). This will make sure
> that these "hotpluggable" DIMMs can later get hotunplugged.
> 
> Also, see should_skip_region() how this relates to the "movable_node" kernel
> parameter:
> 
> 	/* skip hotpluggable memory regions if needed */
> 	if (movable_node_is_enabled() && memblock_is_hotpluggable(m) &&
> 	    (flags & MEMBLOCK_HOTPLUG))
> 		return true;

Hmm, I think that the movable_node_is_enabled() check here is excessive,
but I suspect we cannot simply remove it without breaking anything.

I'll take a deeper look on the potential consequences.

BTW, is there anything that prevents putting kexec to hot-unplugable memory
that was cold-plugged on boot?

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
