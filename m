Return-Path: <SRS0=+sMG=YP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FADCA9EB9
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Oct 2019 15:24:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDEDC2086D
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Oct 2019 15:24:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L8PM1Ns9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDEDC2086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:MIME-Version:
	References:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HbT0Vo/fLLiQ6Re7BZjG82Z1xaL1h5Nt0tjEP7OP7oY=; b=L8PM1Ns9dhrqMU
	QhbZPIiDR2hohnXGhNEtvczPG4uiUp4TlsndPyBNZplk4kT52q8rXOfxd1M6hvjVFF+GPPcmgORz9
	nUlo8NjqHWhQ1ArT5cyHNa33/JpDnqN06npQgILX7JnM4PUx4J556nUO6j4yzY5dV6XhXdP3z3h9N
	PTjFWorOOrD5LYBn2F0VO8SExy9bIG/ZFyrIyAWpgdEU22euaG81F+dWPGdbgNcGUDlXctyZagohl
	7BEVGluANm5p3rovA8V76UAje1z/L7TvIv0AyLEpA73y51z/Vuw+N/49zEYkpbh47rlxuP9QXwoPG
	YKr9w/nfuG+gx5JsngCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMw11-0002cr-06; Tue, 22 Oct 2019 15:24:07 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMw0y-0002cW-AQ
 for linux-snps-arc@lists.infradead.org; Tue, 22 Oct 2019 15:24:05 +0000
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9MFN8LQ134398
 for <linux-snps-arc@lists.infradead.org>; Tue, 22 Oct 2019 11:24:02 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2vt43g8vt4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-snps-arc@lists.infradead.org>; Tue, 22 Oct 2019 11:24:01 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-snps-arc@lists.infradead.org> from <rppt@linux.ibm.com>;
 Tue, 22 Oct 2019 16:24:00 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 22 Oct 2019 16:23:58 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9MFNvFd7798892
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 22 Oct 2019 15:23:57 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F38DC52069;
 Tue, 22 Oct 2019 15:23:56 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.148.8.185])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 88AFF52057;
 Tue, 22 Oct 2019 15:23:56 +0000 (GMT)
Date: Tue, 22 Oct 2019 18:23:54 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v3] ARC: mm: remove __ARCH_USE_5LEVEL_HACK
References: <20191009184350.18323-1-vgupta@synopsys.com>
 <20191009185731.25814-1-vgupta@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009185731.25814-1-vgupta@synopsys.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TM-AS-GCONF: 00
x-cbid: 19102215-0028-0000-0000-000003AD901C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19102215-0029-0000-0000-0000246FBB73
Message-Id: <20191022152354.GC14440@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-22_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910220135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191022_082404_484675_69981D47 
X-CRM114-Status: GOOD (  25.32  )
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
Cc: linux-mm@kvack.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Oct 09, 2019 at 11:57:31AM -0700, Vineet Gupta wrote:
> Add the intermediate p4d accessors to make it 5 level compliant.
> 
> This is a non-functional change anyways since ARC has software page walker
> with 2 lookup levels (pgd -> pte)
> 
> There is slight code bloat due to pulling in needless p*d_free_tlb()
> macros which needs to be addressed seperately.
> 
> | bloat-o-meter2 vmlinux-with-5LEVEL_HACK vmlinux-patched
> | add/remove: 0/0 grow/shrink: 2/0 up/down: 128/0 (128)
> | function                                     old     new   delta
> | free_pgd_range                               546     656    +110
> | p4d_clear_bad                                  2      20     +18
> | Total: Before=4137148, After=4137276, chg 0.000000%
> 
> Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

Acked-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
> v3 <- v2
>   - fix highmem build error
> 
> v2 <- v1
>  - fix highmem code
> ---
>  arch/arc/include/asm/pgtable.h |  1 -
>  arch/arc/mm/fault.c            | 10 ++++++++--
>  arch/arc/mm/highmem.c          |  4 +++-
>  3 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
> index 976b5931372e..902d45428cea 100644
> --- a/arch/arc/include/asm/pgtable.h
> +++ b/arch/arc/include/asm/pgtable.h
> @@ -33,7 +33,6 @@
>  #define _ASM_ARC_PGTABLE_H
>  
>  #include <linux/bits.h>
> -#define __ARCH_USE_5LEVEL_HACK
>  #include <asm-generic/pgtable-nopmd.h>
>  #include <asm/page.h>
>  #include <asm/mmu.h>	/* to propagate CONFIG_ARC_MMU_VER <n> */
> diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
> index 3861543b66a0..fb86bc3e9b35 100644
> --- a/arch/arc/mm/fault.c
> +++ b/arch/arc/mm/fault.c
> @@ -30,6 +30,7 @@ noinline static int handle_kernel_vaddr_fault(unsigned long address)
>  	 * with the 'reference' page table.
>  	 */
>  	pgd_t *pgd, *pgd_k;
> +	p4d_t *p4d, *p4d_k;
>  	pud_t *pud, *pud_k;
>  	pmd_t *pmd, *pmd_k;
>  
> @@ -39,8 +40,13 @@ noinline static int handle_kernel_vaddr_fault(unsigned long address)
>  	if (!pgd_present(*pgd_k))
>  		goto bad_area;
>  
> -	pud = pud_offset(pgd, address);
> -	pud_k = pud_offset(pgd_k, address);
> +	p4d = p4d_offset(pgd, address);
> +	p4d_k = p4d_offset(pgd_k, address);
> +	if (!p4d_present(*p4d_k))
> +		goto bad_area;
> +
> +	pud = pud_offset(p4d, address);
> +	pud_k = pud_offset(p4d_k, address);
>  	if (!pud_present(*pud_k))
>  		goto bad_area;
>  
> diff --git a/arch/arc/mm/highmem.c b/arch/arc/mm/highmem.c
> index a4856bfaedf3..fc8849e4f72e 100644
> --- a/arch/arc/mm/highmem.c
> +++ b/arch/arc/mm/highmem.c
> @@ -111,12 +111,14 @@ EXPORT_SYMBOL(__kunmap_atomic);
>  static noinline pte_t * __init alloc_kmap_pgtable(unsigned long kvaddr)
>  {
>  	pgd_t *pgd_k;
> +	p4d_t *p4d_k;
>  	pud_t *pud_k;
>  	pmd_t *pmd_k;
>  	pte_t *pte_k;
>  
>  	pgd_k = pgd_offset_k(kvaddr);
> -	pud_k = pud_offset(pgd_k, kvaddr);
> +	p4d_k = p4d_offset(pgd_k, kvaddr);
> +	pud_k = pud_offset(p4d_k, kvaddr);
>  	pmd_k = pmd_offset(pud_k, kvaddr);
>  
>  	pte_k = (pte_t *)memblock_alloc_low(PAGE_SIZE, PAGE_SIZE);
> -- 
> 2.20.1
> 
> 

-- 
Sincerely yours,
Mike.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
