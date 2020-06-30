Return-Path: <SRS0=1csx=AL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38940C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Jun 2020 03:54:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 037A0206B6
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Jun 2020 03:54:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B0O77kYd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 037A0206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gew+IUN9+xxVyl3OZunuLiDwbcaahAcumkzEUh38z5s=; b=B0O77kYdroLkjRhcYk+hZhtLr
	J5v3iseXKScbTrC+qMufwwcylNENQIYkVbtD4u56eUHwRapAQPSvfKwhYMNMfg9xA3VLFTWQq50D3
	c/RbnVGNoLHZdsIdXztPSWK25J4K3OGYI3xagy1hggneJpCalHfRDZBoY4nil8XgHa3fsdCYknKse
	/xfy7mA+J9EJuDPmzhBynm7sTa9mFXIrUnOtLCWokea9BBzjJL9UJyNI6v7YKwMfVM02Sia2OL9Bz
	I3aF1SizvfAWijyMZKZ3LVv31AKHfnyyBBNbePiLnrRC4MduZh+77ajlOtM1hYxC6jaDjVbjHDI/0
	Xh23mMV1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq7LU-0008H7-9I; Tue, 30 Jun 2020 03:54:08 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq7LL-0008Fc-K5; Tue, 30 Jun 2020 03:54:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2739030E;
 Mon, 29 Jun 2020 20:53:58 -0700 (PDT)
Received: from [10.163.84.101] (unknown [10.163.84.101])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EE3D3F73C;
 Mon, 29 Jun 2020 20:53:47 -0700 (PDT)
Subject: Re: [PATCH V3 0/4] mm/debug_vm_pgtable: Add some more tests
To: linux-mm@kvack.org
References: <1592192277-8421-1-git-send-email-anshuman.khandual@arm.com>
 <70ddc7dd-b688-b73e-642a-6363178c8cdd@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <1ed72a76-9f20-0169-4c16-c1d8808690eb@arm.com>
Date: Tue, 30 Jun 2020 09:23:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <70ddc7dd-b688-b73e-642a-6363178c8cdd@arm.com>
Content-Language: en-US
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
Cc: linux-doc@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, ziy@nvidia.com,
 Catalin Marinas <catalin.marinas@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, gerald.schaefer@de.ibm.com,
 christophe.leroy@c-s.fr, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Qian Cai <cai@lca.pw>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 06/24/2020 08:43 AM, Anshuman Khandual wrote:
> 
> 
> On 06/15/2020 09:07 AM, Anshuman Khandual wrote:
>> This series adds some more arch page table helper validation tests which
>> are related to core and advanced memory functions. This also creates a
>> documentation, enlisting expected semantics for all page table helpers as
>> suggested by Mike Rapoport previously (https://lkml.org/lkml/2020/1/30/40).
>>
>> There are many TRANSPARENT_HUGEPAGE and ARCH_HAS_TRANSPARENT_HUGEPAGE_PUD
>> ifdefs scattered across the test. But consolidating all the fallback stubs
>> is not very straight forward because ARCH_HAS_TRANSPARENT_HUGEPAGE_PUD is
>> not explicitly dependent on ARCH_HAS_TRANSPARENT_HUGEPAGE.
>>
>> Tested on arm64, x86 platforms but only build tested on all other enabled
>> platforms through ARCH_HAS_DEBUG_VM_PGTABLE i.e powerpc, arc, s390. The
>> following failure on arm64 still exists which was mentioned previously. It
>> will be fixed with the upcoming THP migration on arm64 enablement series.
>>
>> WARNING .... mm/debug_vm_pgtable.c:860 debug_vm_pgtable+0x940/0xa54
>> WARN_ON(!pmd_present(pmd_mkinvalid(pmd_mkhuge(pmd))))
>>
>> This series is based on v5.8-rc1.
>>
>> Changes in V3:
>>
>> - Replaced HAVE_ARCH_SOFT_DIRTY with MEM_SOFT_DIRTY
>> - Added HAVE_ARCH_HUGE_VMAP checks in pxx_huge_tests() per Gerald
>> - Updated documentation for pmd_thp_tests() per Zi Yan
>> - Replaced READ_ONCE() with huge_ptep_get() per Gerald
>> - Added pte_mkhuge() and masking with PMD_MASK per Gerald
>> - Replaced pte_same() with holding pfn check in pxx_swap_tests()
>> - Added documentation for all (#ifdef #else #endif) per Gerald
>> - Updated pmd_protnone_tests() per Gerald
>> - Updated HugeTLB PTE creation in hugetlb_advanced_tests() per Gerald
>> - Replaced [pmd|pud]_mknotpresent() with [pmd|pud]_mkinvalid()
>> - Added has_transparent_hugepage() check for PMD and PUD tests
>> - Added a patch which debug prints all individual tests being executed
>> - Updated documentation for renamed [pmd|pud]_mkinvalid() helpers
> 
> Hello Gerald/Christophe/Vineet,
> 
> It would be really great if you could give this series a quick test
> on s390/ppc/arc platforms respectively. Thank you.

Thanks Alexander, Gerald and Christophe for testing this out on s390
and ppc32 platforms. Probably Vineet and Qian (any other volunteers)
could help us with arc and ppc64 platforms, which I would appreciate.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
