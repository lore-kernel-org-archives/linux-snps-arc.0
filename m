Return-Path: <SRS0=pJgN=B7=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLACK,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1702C433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 21 Aug 2020 08:52:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACB1F208DB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 21 Aug 2020 08:52:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D30KxU6o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACB1F208DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uxmBqEIgPl13wzNV50CjWK8BgcdNOT/OlY/HJb6lhxM=; b=D30KxU6o1sSxzazm/eCfeDajJ
	5IRTPsELZLhDAjs2SOYReyeMWMCXQWIZRSTvPhyg+CE646KheWOCvH2nSQDElWND6Wk/6HDBB0HDm
	8ghg42tWywWLMRsgUIRtx2mZLjUJEpybpMYbUTrKzfZTbfMTCFiBO2VwP6+uWspce0gHEpP0OPmgn
	rt57q8nZHzs7N9uOb5o/6ZNpuj9l2DlYQqC6rSO+TbG/EMB4rg9+hJYY3ADZlxL534oCn0VHYXv5t
	IY27vKvYrKZHj5fjm3LsGYh8aFmovxnsVWm0aeCrICB+uDFBIvAl5wxcR5zDBgfTX8huZQPdCjkqF
	8iiJeXOCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k92mT-0008AI-1p; Fri, 21 Aug 2020 08:52:13 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k92mN-00088P-Ok; Fri, 21 Aug 2020 08:52:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDEF030E;
 Fri, 21 Aug 2020 01:52:03 -0700 (PDT)
Received: from [10.163.67.49] (unknown [10.163.67.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFDDB3F66B;
 Fri, 21 Aug 2020 01:51:58 -0700 (PDT)
Subject: Re: [PATCH v2 00/13] mm/debug_vm_pgtable fixes
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <52e9743e-fa2f-3fd2-f50e-2c6c38464b96@arm.com>
Date: Fri, 21 Aug 2020 14:21:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_045207_922102_1A9B1CDD 
X-CRM114-Status: GOOD (  20.42  )
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>, mpe@ellerman.id.au,
 "x86@kernel.org" <x86@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Rapoport <rppt@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 linuxppc-dev@lists.ozlabs.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


On 08/19/2020 06:30 PM, Aneesh Kumar K.V wrote:
> This patch series includes fixes for debug_vm_pgtable test code so that
> they follow page table updates rules correctly. The first two patches introduce
> changes w.r.t ppc64. The patches are included in this series for completeness. We can
> merge them via ppc64 tree if required.
> 
> Hugetlb test is disabled on ppc64 because that needs larger change to satisfy
> page table update rules.
> 
> Changes from V1:
> * Address review feedback
> * drop test specific pfn_pte and pfn_pmd.
> * Update ppc64 page table helper to add _PAGE_PTE 
> 
> Aneesh Kumar K.V (13):
>   powerpc/mm: Add DEBUG_VM WARN for pmd_clear
>   powerpc/mm: Move setting pte specific flags to pfn_pte
>   mm/debug_vm_pgtable/ppc64: Avoid setting top bits in radom value
>   mm/debug_vm_pgtables/hugevmap: Use the arch helper to identify huge
>     vmap support.
>   mm/debug_vm_pgtable/savedwrite: Enable savedwrite test with
>     CONFIG_NUMA_BALANCING
>   mm/debug_vm_pgtable/THP: Mark the pte entry huge before using
>     set_pmd/pud_at
>   mm/debug_vm_pgtable/set_pte/pmd/pud: Don't use set_*_at to update an
>     existing pte entry
>   mm/debug_vm_pgtable/thp: Use page table depost/withdraw with THP
>   mm/debug_vm_pgtable/locks: Move non page table modifying test together
>   mm/debug_vm_pgtable/locks: Take correct page table lock
>   mm/debug_vm_pgtable/pmd_clear: Don't use pmd/pud_clear on pte entries
>   mm/debug_vm_pgtable/hugetlb: Disable hugetlb test on ppc64
>   mm/debug_vm_pgtable: populate a pte entry before fetching it
> 
>  arch/powerpc/include/asm/book3s/64/pgtable.h |  29 +++-
>  arch/powerpc/include/asm/nohash/pgtable.h    |   5 -
>  arch/powerpc/mm/book3s64/pgtable.c           |   2 +-
>  arch/powerpc/mm/pgtable.c                    |   5 -
>  include/linux/io.h                           |  12 ++
>  mm/debug_vm_pgtable.c                        | 151 +++++++++++--------
>  6 files changed, 127 insertions(+), 77 deletions(-)
> 

Changes proposed here will impact other enabled platforms as well.
Adding the following folks and mailing lists, and hoping to get a
broader review and test coverage. Please do include them in the
next iteration as well.

+ linux-arm-kernel@lists.infradead.org
+ linux-s390@vger.kernel.org
+ linux-snps-arc@lists.infradead.org
+ x86@kernel.org
+ linux-arch@vger.kernel.org

+ Gerald Schaefer <gerald.schaefer@de.ibm.com>
+ Christophe Leroy <christophe.leroy@c-s.fr>
+ Christophe Leroy <christophe.leroy@csgroup.eu>
+ Vineet Gupta <vgupta@synopsys.com>
+ Mike Rapoport <rppt@linux.ibm.com>
+ Qian Cai <cai@lca.pw>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
