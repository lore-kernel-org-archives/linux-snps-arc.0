Return-Path: <SRS0=98aq=O2=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E90EEC4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Oct 2021 00:36:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EA2761211
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Oct 2021 00:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9EA2761211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oXfb3aPvK0jdyAQxZ1av1tyaqGpV6bZJw59JUHGJngs=; b=Pe1umLJ6rLu6zh
	W1UNXrPvs8gvHdCJbw913fPsx44LFDJb17VBi4EpP9Jz+fcg+G2hoXl7PInUYSyqwGYEeFFbUeboi
	0NLxBW2VLD7FYMhx9Qtdjf+c+nKngd5fcgwBnMVw/h9aSc2UUlrk5xgGGxqb9stvFBs0Mu71kmiqT
	VduYvrfN/uqZ2K7OYisfqbu41DAgwsSoDo8LfYBQli3IrrVQN7zi+Jd7RFtEmQVExqlB6wG0coK4/
	ulc5QwU7DmUSl9+65V2nYnjfjA68XeoY3RRisMJ8wEhMImU1vUgNwOB13/nhueZu8MICjHyaiWArd
	soq+X1pZsAkdAOO9ivyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXuuk-00CPNL-5p; Wed, 06 Oct 2021 00:36:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXuuf-00CPMH-Tv; Wed, 06 Oct 2021 00:36:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6F5261207;
 Wed,  6 Oct 2021 00:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633480561;
 bh=8xj9E6op+Rg8PTXffqt5Iu6I5QYdPwtUpE27T1OKFzU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iu6vyfwg4W/tfIH5vF6EJ8rw4IAH6oyZstjQ+k71TftnxAoc/pd8Vg7g809vYXSmw
 HqBqPXNn18TKQQVolBCdPUBQNjbRZENvt/N4z6bD5KXEN7vh2A1ska4yQbc/iG3LBv
 9+PzqFOlfYw7EWsnTtgXQ3BetmXc3txVFFIYY2newPWMttQOXa9Z5OdONOzRjfJewv
 OlVGXBfO8XkC/k/4KN1DjHTDnLNTp55uKMab8YAyYWXAnirslZET9T3W1dieK8A9Lt
 f858nm0SZ+QfOwVHGG2EUsgGuL7mfwROiNowH7gIpRq8xDCM3duxbib9wjTXMRsty9
 9ElPf2xXwHi1w==
Date: Tue, 5 Oct 2021 17:35:57 -0700
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
Subject: Re: [PATCH v2 2/5] memblock: improve MEMBLOCK_HOTPLUG documentation
Message-ID: <YVzvbUr2zO/Nw0Xf@kernel.org>
References: <20211004093605.5830-1-david@redhat.com>
 <20211004093605.5830-3-david@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211004093605.5830-3-david@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_173602_020549_ED6EE917 
X-CRM114-Status: GOOD (  25.09  )
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

On Mon, Oct 04, 2021 at 11:36:02AM +0200, David Hildenbrand wrote:
> The description of MEMBLOCK_HOTPLUG is currently short and consequently
> misleading: we're actually dealing with a memory region that might get
> hotunplugged later (i.e., the platform+firmware supports it), yet it is
> indicated in the firmware-provided memory map as system ram that will just
> get used by the system for any purpose when not taking special care. The
> firmware marked this memory region as a hot(un)plugged (e.g., hotplugged
> before reboot), implying that it might get hotunplugged again later.
> 
> Whether we consider this information depends on the "movable_node" kernel
> commandline parameter: only with "movable_node" set, we'll try keeping
> this memory hotunpluggable, for example, by not serving early allocations
> from this memory region and by letting the buddy manage it using the
> ZONE_MOVABLE.
> 
> Let's make this clearer by extending the documentation.
> 
> Note: kexec *has to* indicate this memory to the second kernel. With
> "movable_node" set, we don't want to place kexec-images on this memory.
> Without "movable_node" set, we don't care and can place kexec-images on
> this memory. In both cases, after successful memory hotunplug, kexec has to
> be re-armed to update the memory map for the second kernel and to place the
> kexec-images somewhere else.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  include/linux/memblock.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index 34de69b3b8ba..4ee8dd2d63a7 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -28,7 +28,11 @@ extern unsigned long long max_possible_pfn;
>  /**
>   * enum memblock_flags - definition of memory region attributes
>   * @MEMBLOCK_NONE: no special request
> - * @MEMBLOCK_HOTPLUG: hotpluggable region
> + * @MEMBLOCK_HOTPLUG: memory region indicated in the firmware-provided memory
> + * map during early boot as hot(un)pluggable system RAM (e.g., memory range
> + * that might get hotunplugged later). With "movable_node" set on the kernel
> + * commandline, try keeping this memory region hotunpluggable. Does not apply
> + * to memblocks added ("hotplugged") after early boot.
>   * @MEMBLOCK_MIRROR: mirrored region
>   * @MEMBLOCK_NOMAP: don't add to kernel direct mapping and treat as
>   * reserved in the memory map; refer to memblock_mark_nomap() description
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
