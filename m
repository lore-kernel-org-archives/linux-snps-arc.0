From: anshuman.khandual@arm.com (Anshuman Khandual)
Date: Mon, 26 Aug 2019 07:59:36 +0530
Subject: [RFC V2 0/1] mm/debug: Add tests for architecture exported page
 table helpers
In-Reply-To: <20190809114450.GF48423@lakrids.cambridge.arm.com>
References: <1565335998-22553-1-git-send-email-anshuman.khandual@arm.com>
 <20190809101632.GM5482@bombadil.infradead.org>
 <20190809114450.GF48423@lakrids.cambridge.arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <652ae041-2033-1cf8-e559-6dcf85dd2fdd@arm.com>
To: linux-snps-arc@lists.infradead.org



On 08/09/2019 05:14 PM, Mark Rutland wrote:
> On Fri, Aug 09, 2019@03:16:33AM -0700, Matthew Wilcox wrote:
>> On Fri, Aug 09, 2019@01:03:17PM +0530, Anshuman Khandual wrote:
>>> Should alloc_gigantic_page() be made available as an interface for general
>>> use in the kernel. The test module here uses very similar implementation from
>>> HugeTLB to allocate a PUD aligned memory block. Similar for mm_alloc() which
>>> needs to be exported through a header.
>>
>> Why are you allocating memory at all instead of just using some
>> known-to-exist PFNs like I suggested?
> 
> IIUC the issue is that there aren't necessarily known-to-exist PFNs that
> are sufficiently aligned -- they may not even exist.
> 
> For example, with 64K pages, a PMD covers 512M. The kernel image is
> (generally) smaller than 512M, and will be mapped at page granularity.
> In that case, any PMD entry for a kernel symbol address will point to
> the PTE level table, and that will only necessarily be page-aligned, as
> any P?D level table is only necessarily page-aligned.

Right.

> 
> In the same configuration, you could have less than 512M of total
> memory, and none of this memory is necessarily aligned to 512M. So
> beyond the PTE level, I don't think you can guarantee a known-to-exist
> valid PFN.
Right a PMD aligned valid PFN might not even exist. This proposed patch
which attempts to allocate memory chunk with required alignment will just
fail indicating that such a valid PFN does not exist and hence will skip
any relevant tests. At present this is done for PUD aligned allocation
failure but we can similarly skip PMD relevant tests as well if PMD
aligned memory chunk is not allocated.

> 
> I also believe that synthetic PFNs could fail pfn_valid(), so that might
> cause us pain too...

Agreed. So do we have an agreement that it is better to use allocated
memory with required alignment for the tests than known-to-exist PFNs ?

- Anshuman
