Return-Path: <SRS0=1R09=LD=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1F99C48BCD
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Jun 2021 10:59:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66186613AE
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Jun 2021 10:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66186613AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOEKUFiKoc6vOpuBdbUEpjLtQkjw/zcqW9+Nm8O0IfQ=; b=FggoYtGZ4rj8vlt8lb/q9HE07o
	qSbcVpglhkBYnek3oh11gBfts79KbfbOzPmEbEdviX7eGZ9TKLxe73GfYLDRa2ryOp14W6FOMxhOI
	HLrYCZWTX8L5Lc3u0ZAShbuCEx9wMRqLQ+QekrQ6OQQDP54jPq6r/Eocx/th9CI1t2mJ+mMatKRyF
	7Wktit6cjsfZjakqmp1N8Tx835vdasaNkFkhrEPmaf7Rvv26M6L1dz6qr5q5oWs9CFXYM1TBUSdEN
	0fytTfxc2bAD1PvFnLnupcx4tegxNtDy1tmeaYqRjWlTf1X4OXG6btKjIUE83TVPd48cdyYj3u/Gm
	qK1JHg9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqvvK-00DCVV-SW; Wed, 09 Jun 2021 10:59:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqvsV-00DAze-PL
 for linux-snps-arc@lists.infradead.org; Wed, 09 Jun 2021 10:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623236166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1eqcq/7KVFIFfww4JdqqnK/TUbif/qCxlnaAkIZ26tg=;
 b=Mw4L8U6cKO3oPADt1gjcP/fKLG9DS+e42PkowABxYW5FB3DVAuc8kXK3mDDS3gLeJbTA2e
 iX/h2FKikmSzv/aN2D68I6UP2kY9OiCEN4F4Q42yty5I5gb83uqdp0fTn4inW+aLSuTzfs
 9i3jtXam20PHAoGw95oXGb23945UYwM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-VnIFMOrDMTa3YD4l6vgSGA-1; Wed, 09 Jun 2021 06:56:03 -0400
X-MC-Unique: VnIFMOrDMTa3YD4l6vgSGA-1
Received: by mail-wr1-f69.google.com with SMTP id
 m27-20020a056000025bb0290114d19822edso10602425wrz.21
 for <linux-snps-arc@lists.infradead.org>; Wed, 09 Jun 2021 03:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=1eqcq/7KVFIFfww4JdqqnK/TUbif/qCxlnaAkIZ26tg=;
 b=sb7fsFQCkV9VnoIEDVm9Cmr++l21OV/77vBnoSRrqA0YZYvuEZYASZRIHhU0yDz5Jl
 FtDzPOF+NdK0KGSHFQozjistXY8c/Xo/I0qLb2xbuxVikLzjh/30BEXSCiV/LYT1g1zf
 eLLBgIe2+PdrAEXCPY7cBcpusBeje9FRFgZjXehS3zn3R/bsuHItgSVyLm5xiJ/dN+yD
 1+Hg43eAKZZE1MTyqQFc87KAGBQhXszmZjD5oTcqPGpAmhkbzuVx3yNdw8AAQUZXZsKq
 tFD+7o36/xzvSXxaGIFBuRzihvJW3VdeMomkyz1zv8qacVwdgPRwr9sZZXL9OhixSbhz
 phzQ==
X-Gm-Message-State: AOAM5305XxIHRV25b7RCMxdENS6egh3c5yrVOYOxxdesXf2kp+yOicQU
 u6KcH0hJbkOLJiwn5W1VRhK+4dVUmeYObt2BKVnKZBCrhxNSgbgQXyzexevAPJywzNZscouk5tT
 G6nL/QlTaVvpFr2PDZyC/bniPuFZTHcdK
X-Received: by 2002:adf:ee46:: with SMTP id w6mr28365915wro.345.1623236162307; 
 Wed, 09 Jun 2021 03:56:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQ49r+tRbGd1wOHU0mXbY7urMjvAihHVmP4oVaZtHRm+k2OFRov+Lj+Vo8CLpAoo+a81y7uQ==
X-Received: by 2002:adf:ee46:: with SMTP id w6mr28365871wro.345.1623236162032; 
 Wed, 09 Jun 2021 03:56:02 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c611d.dip0.t-ipconnect.de. [91.12.97.29])
 by smtp.gmail.com with ESMTPSA id
 a4sm21295711wme.45.2021.06.09.03.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 03:56:01 -0700 (PDT)
Subject: Re: [PATCH 7/9] docs: remove description of DISCONTIGMEM
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jonathan Corbet
 <corbet@lwn.net>, Matt Turner <mattst88@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Richard Henderson <rth@twiddle.net>,
 Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
References: <20210602105348.13387-1-rppt@kernel.org>
 <20210602105348.13387-8-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <6b92d273-dd0b-d67f-c2f6-cce13a33afd1@redhat.com>
Date: Wed, 9 Jun 2021 12:56:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602105348.13387-8-rppt@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_035607_947094_6D771BAA 
X-CRM114-Status: GOOD (  33.50  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 02.06.21 12:53, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Remove description of DISCONTIGMEM from the "Memory Models" document and
> update VM sysctl description so that it won't mention DISCONIGMEM.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>   Documentation/admin-guide/sysctl/vm.rst | 12 +++----
>   Documentation/vm/memory-model.rst       | 45 ++-----------------------
>   2 files changed, 8 insertions(+), 49 deletions(-)
> 
> diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
> index 586cd4b86428..ddbd71d592e0 100644
> --- a/Documentation/admin-guide/sysctl/vm.rst
> +++ b/Documentation/admin-guide/sysctl/vm.rst
> @@ -936,12 +936,12 @@ allocations, THP and hugetlbfs pages.
>   
>   To make it sensible with respect to the watermark_scale_factor
>   parameter, the unit is in fractions of 10,000. The default value of
> -15,000 on !DISCONTIGMEM configurations means that up to 150% of the high
> -watermark will be reclaimed in the event of a pageblock being mixed due
> -to fragmentation. The level of reclaim is determined by the number of
> -fragmentation events that occurred in the recent past. If this value is
> -smaller than a pageblock then a pageblocks worth of pages will be reclaimed
> -(e.g.  2MB on 64-bit x86). A boost factor of 0 will disable the feature.
> +15,000 means that up to 150% of the high watermark will be reclaimed in the
> +event of a pageblock being mixed due to fragmentation. The level of reclaim
> +is determined by the number of fragmentation events that occurred in the
> +recent past. If this value is smaller than a pageblock then a pageblocks
> +worth of pages will be reclaimed (e.g.  2MB on 64-bit x86). A boost factor
> +of 0 will disable the feature.
>   
>   
>   watermark_scale_factor
> diff --git a/Documentation/vm/memory-model.rst b/Documentation/vm/memory-model.rst
> index ce398a7dc6cd..30e8fbed6914 100644
> --- a/Documentation/vm/memory-model.rst
> +++ b/Documentation/vm/memory-model.rst
> @@ -14,15 +14,11 @@ for the CPU. Then there could be several contiguous ranges at
>   completely distinct addresses. And, don't forget about NUMA, where
>   different memory banks are attached to different CPUs.
>   
> -Linux abstracts this diversity using one of the three memory models:
> -FLATMEM, DISCONTIGMEM and SPARSEMEM. Each architecture defines what
> +Linux abstracts this diversity using one of the two memory models:
> +FLATMEM and SPARSEMEM. Each architecture defines what
>   memory models it supports, what the default memory model is and
>   whether it is possible to manually override that default.
>   
> -.. note::
> -   At time of this writing, DISCONTIGMEM is considered deprecated,
> -   although it is still in use by several architectures.
> -
>   All the memory models track the status of physical page frames using
>   struct page arranged in one or more arrays.
>   
> @@ -63,43 +59,6 @@ straightforward: `PFN - ARCH_PFN_OFFSET` is an index to the
>   The `ARCH_PFN_OFFSET` defines the first page frame number for
>   systems with physical memory starting at address different from 0.
>   
> -DISCONTIGMEM
> -============
> -
> -The DISCONTIGMEM model treats the physical memory as a collection of
> -`nodes` similarly to how Linux NUMA support does. For each node Linux
> -constructs an independent memory management subsystem represented by
> -`struct pglist_data` (or `pg_data_t` for short). Among other
> -things, `pg_data_t` holds the `node_mem_map` array that maps
> -physical pages belonging to that node. The `node_start_pfn` field of
> -`pg_data_t` is the number of the first page frame belonging to that
> -node.
> -
> -The architecture setup code should call :c:func:`free_area_init_node` for
> -each node in the system to initialize the `pg_data_t` object and its
> -`node_mem_map`.
> -
> -Every `node_mem_map` behaves exactly as FLATMEM's `mem_map` -
> -every physical page frame in a node has a `struct page` entry in the
> -`node_mem_map` array. When DISCONTIGMEM is enabled, a portion of the
> -`flags` field of the `struct page` encodes the node number of the
> -node hosting that page.
> -
> -The conversion between a PFN and the `struct page` in the
> -DISCONTIGMEM model became slightly more complex as it has to determine
> -which node hosts the physical page and which `pg_data_t` object
> -holds the `struct page`.
> -
> -Architectures that support DISCONTIGMEM provide :c:func:`pfn_to_nid`
> -to convert PFN to the node number. The opposite conversion helper
> -:c:func:`page_to_nid` is generic as it uses the node number encoded in
> -page->flags.
> -
> -Once the node number is known, the PFN can be used to index
> -appropriate `node_mem_map` array to access the `struct page` and
> -the offset of the `struct page` from the `node_mem_map` plus
> -`node_start_pfn` is the PFN of that page.
> -
>   SPARSEMEM
>   =========
>   
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
