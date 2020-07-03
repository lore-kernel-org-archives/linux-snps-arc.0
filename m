Return-Path: <SRS0=Y0WM=AO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60935C433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Jul 2020 03:59:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F624206DF
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Jul 2020 03:59:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zE6S+mGy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F624206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MVsUV6jFFY37SpD9UHEoa5uNZIMjfVzEiIgtryzyxOM=; b=zE6S+mGyD8g7KbDirFgP0nnJZ
	AmSzNeBlPc2g+c88kfgWWjoDChdG3NgJcp4SwAot6FNgAeI9xFBDGh3iilxDKBJ6nF/c0hqzA40KI
	M05j4dTjXbLKk3AXVgXGDUYMoTLRDmsSVjMU947lyFoiMWt8DJsaQkTK4oyUkpEcCpnj0SVcs8aC8
	0EWINRDAb2kBGsC0/Tz7bYdyFhPPcVirOsGx42yem9wgsmFfstDJvr1VSpk6EeBv+IXe9kL6ipPAv
	WMbsOEvHaHz3Vnz0yiGvZ71jhCYbAZDHOHih6ZoV14uH5VzeD+OGkxfenvz2UoWgHX8LSmjBKCUGG
	LjPIJEdyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrCrM-0008Uy-Ic; Fri, 03 Jul 2020 03:59:32 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrCrJ-0008UF-Cj
 for linux-snps-arc@lists.infradead.org; Fri, 03 Jul 2020 03:59:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A84CD31B;
 Thu,  2 Jul 2020 20:59:27 -0700 (PDT)
Received: from [10.163.85.168] (unknown [10.163.85.168])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 651603F71E;
 Thu,  2 Jul 2020 20:59:21 -0700 (PDT)
Subject: Re: [PATCH V3 0/4] mm/debug_vm_pgtable: Add some more tests
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <1592192277-8421-1-git-send-email-anshuman.khandual@arm.com>
 <70ddc7dd-b688-b73e-642a-6363178c8cdd@arm.com>
 <1ed72a76-9f20-0169-4c16-c1d8808690eb@arm.com>
 <9009877d-6f59-a4d5-1c7c-29719dc50e5c@synopsys.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <fd18f4d3-4eba-6306-f42f-dad2bb72746d@arm.com>
Date: Fri, 3 Jul 2020 09:29:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <9009877d-6f59-a4d5-1c7c-29719dc50e5c@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_235929_538631_BA7B5E63 
X-CRM114-Status: GOOD (  22.32  )
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
Cc: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>,
 arcml <linux-snps-arc@lists.infradead.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>, "H. Peter Anvin" <hpa@zytor.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 "ziy@nvidia.com" <ziy@nvidia.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>,
 Paul Walmsley <paul.walmsley@synopsys.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "gerald.schaefer@de.ibm.com" <gerald.schaefer@de.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 07/01/2020 03:02 AM, Vineet Gupta wrote:
> On 6/29/20 8:53 PM, Anshuman Khandual wrote:
>>
>>
>> On 06/24/2020 08:43 AM, Anshuman Khandual wrote:
>>>
>>>
>>> On 06/15/2020 09:07 AM, Anshuman Khandual wrote:
>>>> This series adds some more arch page table helper validation tests which
>>>> are related to core and advanced memory functions. This also creates a
>>>> documentation, enlisting expected semantics for all page table helpers as
>>>> suggested by Mike Rapoport previously (https://lkml.org/lkml/2020/1/30/40).
>>>>
>>>> There are many TRANSPARENT_HUGEPAGE and ARCH_HAS_TRANSPARENT_HUGEPAGE_PUD
>>>> ifdefs scattered across the test. But consolidating all the fallback stubs
>>>> is not very straight forward because ARCH_HAS_TRANSPARENT_HUGEPAGE_PUD is
>>>> not explicitly dependent on ARCH_HAS_TRANSPARENT_HUGEPAGE.
>>>>
>>>> Tested on arm64, x86 platforms but only build tested on all other enabled
>>>> platforms through ARCH_HAS_DEBUG_VM_PGTABLE i.e powerpc, arc, s390. The
>>>> following failure on arm64 still exists which was mentioned previously. It
>>>> will be fixed with the upcoming THP migration on arm64 enablement series.
>>>>
>>>> WARNING .... mm/debug_vm_pgtable.c:860 debug_vm_pgtable+0x940/0xa54
>>>> WARN_ON(!pmd_present(pmd_mkinvalid(pmd_mkhuge(pmd))))
>>>>
>>>> This series is based on v5.8-rc1.
>>>>
>>>> Changes in V3:
>>>>
>>>> - Replaced HAVE_ARCH_SOFT_DIRTY with MEM_SOFT_DIRTY
>>>> - Added HAVE_ARCH_HUGE_VMAP checks in pxx_huge_tests() per Gerald
>>>> - Updated documentation for pmd_thp_tests() per Zi Yan
>>>> - Replaced READ_ONCE() with huge_ptep_get() per Gerald
>>>> - Added pte_mkhuge() and masking with PMD_MASK per Gerald
>>>> - Replaced pte_same() with holding pfn check in pxx_swap_tests()
>>>> - Added documentation for all (#ifdef #else #endif) per Gerald
>>>> - Updated pmd_protnone_tests() per Gerald
>>>> - Updated HugeTLB PTE creation in hugetlb_advanced_tests() per Gerald
>>>> - Replaced [pmd|pud]_mknotpresent() with [pmd|pud]_mkinvalid()
>>>> - Added has_transparent_hugepage() check for PMD and PUD tests
>>>> - Added a patch which debug prints all individual tests being executed
>>>> - Updated documentation for renamed [pmd|pud]_mkinvalid() helpers
>>>
>>> Hello Gerald/Christophe/Vineet,
>>>
>>> It would be really great if you could give this series a quick test
>>> on s390/ppc/arc platforms respectively. Thank you.
>>
>> Thanks Alexander, Gerald and Christophe for testing this out on s390
>> and ppc32 platforms. Probably Vineet and Qian (any other volunteers)
>> could help us with arc and ppc64 platforms, which I would appreciate.
> 
> Tested-by: Vineet Gupta <vgupta@synopsys.com>
> 
> Apologies for the delay in getting to this. Works fine on ARC
> 
> I have following enabled:
> 
> # CONFIG_DEBUG_VM_RB is not set
> # CONFIG_DEBUG_VM_PGFLAGS is not set
> CONFIG_DEBUG_VM_PGTABLE=y
> 
> And this boots fine
> 
> NET: Registered protocol family 17
> NET: Registered protocol family 15
> debug_vm_pgtable: [debug_vm_pgtable         ]: Validating architecture page table
> helpers
> Warning: unable to open an initial console.
> Freeing unused kernel memory: 18840K
> This architecture does not have kernel memory protection.
> Run /init as init process
>   with arguments:
>     /init
>   with environment:
>     HOME=/
>     TERM=linux
> ...
> ***********************************************************************
> 			Welcome to ARCLinux
> ***********************************************************************
> [ARCLinux]#
> 

Thanks for testing this Vineet, really appreciate it.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
