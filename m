Return-Path: <SRS0=DJL/=AJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0597C433E0
	for <linux-snps-arc@archiver.kernel.org>; Sun, 28 Jun 2020 07:00:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACD3E212CC
	for <linux-snps-arc@archiver.kernel.org>; Sun, 28 Jun 2020 07:00:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pOJI2x6W";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qm3qqF3d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACD3E212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZvOYNGAld7r20Dkbah6SnOpqA12+rvIoBiZ+nYmGb88=; b=pOJI2x6WzMd+0J11DGCV/21No
	5WfTydmS/ikutbyaaotp+9lDrtEekKhShAGYNCpnZOQyekrgOWmO3JQwta1c2h4Y2zwjcuSevLIr9
	Ur/hLjDXnK+ipMpu2kTtlw312logbWWM1IdUc3zyMfTkNVDLns/WWW70h9RqJEvyo7uJLU/erEuL5
	4aMdJj05YpckF60+u8C1RWEbD/FDWk3t2tvo8UhidfWsf7ngFB+q6ce12ZsAYSQ4CuQle5cSYfUjg
	78Z3Wo4dr54bYcW2me7/8U2JTcCQHasLD2rM5dtqpv5lSVLgB95lOLONKtcWjTsVvRJQBPw+acYMH
	+NNIEyO3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpRIQ-0000kU-MG; Sun, 28 Jun 2020 07:00:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpRIM-0000jV-5l; Sun, 28 Jun 2020 07:00:06 +0000
Received: from kernel.org (unknown [87.71.40.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D042720702;
 Sun, 28 Jun 2020 06:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593327604;
 bh=hu/tW2f/lIs0zzXJSvCrgwdLd0PRG2JIRHvUCcaAjqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qm3qqF3d78J/gFOwv6YVJb71itb3mymeRhGcaLrkXQY5dETAmGwNnfv+uXEMscIi2
 mPZsATFBdJNygr2fnTWo/ejLleXfIjFaiD5KXp/1ygh8w33HlLwG0oN/C/qRCb8sbq
 bU6JOX1KtJfeNxxfnsJIYZnBX1A1gh84k+HeVxCY=
Date: Sun, 28 Jun 2020 09:59:51 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 9/8] mm: Account PMD tables like PTE tables
Message-ID: <20200628065951.GB576120@kernel.org>
References: <20200627143453.31835-1-rppt@kernel.org>
 <20200627184642.GF25039@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200627184642.GF25039@casper.infradead.org>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-hexagon@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andy Lutomirski <luto@kernel.org>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sat, Jun 27, 2020 at 07:46:42PM +0100, Matthew Wilcox wrote:
> We account the PTE level of the page tables to the process in order to
> make smarter OOM decisions and help diagnose why memory is fragmented.
> For these same reasons, we should account pages allocated for PMDs.
> With larger process address spaces and ASLR, the number of PMDs in use
> is higher than it used to be so the inaccuracy is starting to matter.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
>  include/linux/mm.h | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index dc7b87310c10..b283e25fcffa 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2271,7 +2271,7 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  	return ptlock_ptr(pmd_to_page(pmd));
>  }
>  
> -static inline bool pgtable_pmd_page_ctor(struct page *page)
> +static inline bool pmd_ptlock_init(struct page *page)
>  {
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  	page->pmd_huge_pte = NULL;
> @@ -2279,7 +2279,7 @@ static inline bool pgtable_pmd_page_ctor(struct page *page)
>  	return ptlock_init(page);
>  }
>  
> -static inline void pgtable_pmd_page_dtor(struct page *page)
> +static inline void pmd_ptlock_free(struct page *page)
>  {
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>  	VM_BUG_ON_PAGE(page->pmd_huge_pte, page);
> @@ -2296,8 +2296,8 @@ static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
>  	return &mm->page_table_lock;
>  }
>  
> -static inline bool pgtable_pmd_page_ctor(struct page *page) { return true; }
> -static inline void pgtable_pmd_page_dtor(struct page *page) {}
> +static inline bool pmd_ptlock_init(struct page *page) { return true; }
> +static inline void pmd_ptlock_free(struct page *page) {}
>  
>  #define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
>  
> @@ -2310,6 +2310,22 @@ static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
>  	return ptl;
>  }
>  
> +static inline bool pgtable_pmd_page_ctor(struct page *page)
> +{
> +	if (!pmd_ptlock_init(page))
> +		return false;
> +	__SetPageTable(page);
> +	inc_zone_page_state(page, NR_PAGETABLE);
> +	return true;
> +}
> +
> +static inline void pgtable_pmd_page_dtor(struct page *page)
> +{
> +	pmd_ptlock_free(page);
> +	__ClearPageTable(page);
> +	dec_zone_page_state(page, NR_PAGETABLE);
> +}
> +
>  /*
>   * No scalability reason to split PUD locks yet, but follow the same pattern
>   * as the PMD locks to make it easier if we decide to.  The VM should not be
> -- 
> 2.27.0
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
