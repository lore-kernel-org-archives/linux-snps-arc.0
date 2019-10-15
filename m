Return-Path: <SRS0=vguH=YI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A1CC10F14
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2019 11:07:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E13521848
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2019 11:07:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZxVUr4qY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E13521848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9wDKA+TjWxOnu8oL3dQVx5F+KHbPP47/o0sT9f4VQ8k=; b=ZxVUr4qYvFk/cO
	npqL8FdBZ0P1wa/cHL/Gpwy45U/d7hWztKkfzH4VbmQZ3hr8QIvHh57tJLAc0uK85FI7gta1JTx0s
	tHW0xXnuurdAORijcYdr0lVKvH2lv7HoUMJOJJu1Y0FcWXFZ+m11px3OGgKwmVBD4PsPpASMyO9Ne
	YuyLmfv7DpX2bIR83GeaTLVPh7//cXCSpgDDvgH0wVWP5VaGmPLyvE5WmSf43H1UD8l5yG3qw73uZ
	GeZEM/S+LM+H73jNv3URCX6NKhEW5s2DsW0+8TquOmJsUSnqDzdvaH+HZFs1x5WkGQxKeuKEgJnOf
	AatS0Gaq5yAguj39rOKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKKfl-0004wO-G2; Tue, 15 Oct 2019 11:07:25 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKKfb-0004mm-2t; Tue, 15 Oct 2019 11:07:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FCDE28;
 Tue, 15 Oct 2019 04:07:14 -0700 (PDT)
Received: from [10.162.42.142] (p8cg001049571a15.blr.arm.com [10.162.42.142])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 D3D3B3F68E; Tue, 15 Oct 2019 04:07:00 -0700 (PDT)
Subject: Re: [PATCH V6 1/2] mm/page_alloc: Make alloc_gigantic_page()
 available for general use
To: Michal Hocko <mhocko@kernel.org>
References: <1571131302-32290-1-git-send-email-anshuman.khandual@arm.com>
 <1571131302-32290-2-git-send-email-anshuman.khandual@arm.com>
 <20191015104521.GY317@dhcp22.suse.cz>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <2d4e7b28-67bf-baf3-b8a0-a5b3a58e3b31@arm.com>
Date: Tue, 15 Oct 2019 16:37:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191015104521.GY317@dhcp22.suse.cz>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_040715_212938_3B1891AC 
X-CRM114-Status: GOOD (  15.53  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 David Rientjes <rientjes@google.com>, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>,
 "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 10/15/2019 04:15 PM, Michal Hocko wrote:
> On Tue 15-10-19 14:51:41, Anshuman Khandual wrote:
> [...]
>> +/**
>> + * alloc_gigantic_page_order() -- tries to allocate given order of pages
>> + * @order:	allocation order (greater than MAX_ORDER)
>> + * @gfp_mask:	GFP mask to use during compaction
>> + * @nid:	allocation node
>> + * @nodemask:	allocation nodemask
>> + *
>> + * This routine is an wrapper around alloc_contig_range() which scans over
>> + * all zones on an applicable zonelist to find a contiguous pfn range which
>> + * can the be allocated with alloc_contig_range(). This routine is intended
>> + * to be used for allocations greater than MAX_ORDER.
>> + *
>> + * Return: page on success or NULL on failure. On success a memory block
>> + * of 'order' starting with 'page' has been allocated successfully. Memory
>> + * allocated here needs to be freed with free_contig_range().
>> + */
>> +struct page *alloc_gigantic_page_order(unsigned int order, gfp_t gfp_mask,
>> +				       int nid, nodemask_t *nodemask)
> 
> One of the objections when Mike has proposed a similar thing last year
> was that the interface shouldn't be order bases
> http://lkml.kernel.org/r/20180423000943.GO17484@dhcp22.suse.cz
> 
> Order based API makes sense for the buddy allocator but why should we
> restrict sizes like that for an allocator that is capable to allocate
> arbitrary page sized requests?

Fair enough, will change it. Anyways we calculate nr_pages from the order 
argument at the very beginning.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
