Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADA0C7EE24
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 May 2023 06:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/sJHzNnSaeU9/zA4cFmIyToieVAyzKJM5rCXxuw6cI=; b=uYJyGjlG9hK/gj
	g0t52d8dIirHOLta4OUpwd/gDl2CDJhycWA3bVi6LDPtZU77Be/psLquUIFjITNO48k0b66UQFH2u
	6g8qPMm9zVlyLabRw+GQt9rtPuWT49flVK/SddXc8pIMkHL4BdsfNt/h48mUluz5iAtIyshoMnmQj
	ZveaGz92JvFnjRrSlPdInAeuAZVBY3d6iVz3w4OWvtbTMyGO05RMyZF5+GgpquP1xHkPvRswQZPhN
	N9ya+d8vwRu8dhlRVncILlRbPuxbmFyFwgL7WyTtxL7IdG61+RhLUHiEc1KMhSt5OSnWr16ftfxWM
	GnigeLjW97W6DkUE3JBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyoV0-004YtK-08;
	Tue, 16 May 2023 06:49:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyoUw-004YqZ-2R
	for linux-snps-arc@lists.infradead.org;
	Tue, 16 May 2023 06:49:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1ACC063498;
	Tue, 16 May 2023 06:49:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC85C433EF;
	Tue, 16 May 2023 06:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684219765;
	bh=7v5ge8KRvf/1Bpm8sGEAQfoJXbPpCNh7fVbx82qCVFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F5juZCTrIEZknbXJgybsDRYtUNZWvK3sGzxA1kxRz0EBsyaeepD9XlWQcf8p/o+Ad
	 a2w0/PpkvDv90Kyh4h/3G4kuricu39bl1+ELp924Q2HMQ3YTLC2a63VqbQpMXNH/JY
	 vJctOq4zU+ZikrArw8CfYTBHz2E3sShpVjFlHAh91L/8sQEcf0QIkcDOqNqQTq0QYL
	 eTrdzrZyRAnEemF23NOHAAW9RJRTr5Mgp/spT43FbCoStbIGb0vllf7T2/VtVsyqNX
	 75TwbTx1ksQI0ke0XdwcjWsJCkU2GJ8K4zPEZPwfqb9/ZPOyLEI5VQKxJ7IEI/7we1
	 /ZWBGnvFFhDgg==
Date: Tue, 16 May 2023 09:49:17 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, arnd@arndb.de, christophe.leroy@csgroup.eu,
	hch@infradead.org, agordeev@linux.ibm.com,
	wangkefeng.wang@huawei.com, schnelle@linux.ibm.com,
	David.Laight@aculab.com, shorne@gmail.com, willy@infradead.org,
	deller@gmx.de, Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v5 RESEND 07/17] arc: mm: Convert to GENERIC_IOREMAP
Message-ID: <ZGMnbeQzIv+6HYGe@kernel.org>
References: <20230515090848.833045-1-bhe@redhat.com>
 <20230515090848.833045-8-bhe@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230515090848.833045-8-bhe@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_234926_905025_D78F5640 
X-CRM114-Status: GOOD (  27.09  )
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

On Mon, May 15, 2023 at 05:08:38PM +0800, Baoquan He wrote:
> By taking GENERIC_IOREMAP method, the generic generic_ioremap_prot(),
> generic_iounmap(), and their generic wrapper ioremap_prot(), ioremap()
> and iounmap() are all visible and available to arch. Arch needs to
> provide wrapper functions to override the generic versions if there's
> arch specific handling in its ioremap_prot(), ioremap() or iounmap().
> This change will simplify implementation by removing duplicated codes
> with generic_ioremap_prot() and generic_iounmap(), and has the equivalent
> functioality as before.
> 
> Here, add wrapper functions ioremap_prot() and iounmap() for arc's
> special operation when ioremap_prot() and iounmap().
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> Cc: Vineet Gupta <vgupta@kernel.org>
> Cc: linux-snps-arc@lists.infradead.org

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/arc/Kconfig          |  1 +
>  arch/arc/include/asm/io.h |  7 +++---
>  arch/arc/mm/ioremap.c     | 49 ++++-----------------------------------
>  3 files changed, 8 insertions(+), 49 deletions(-)
> 
> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> index ab6d701365bb..3a666ee0c0bc 100644
> --- a/arch/arc/Kconfig
> +++ b/arch/arc/Kconfig
> @@ -26,6 +26,7 @@ config ARC
>  	select GENERIC_PENDING_IRQ if SMP
>  	select GENERIC_SCHED_CLOCK
>  	select GENERIC_SMP_IDLE_THREAD
> +	select GENERIC_IOREMAP
>  	select HAVE_ARCH_KGDB
>  	select HAVE_ARCH_TRACEHOOK
>  	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if ARC_MMU_V4
> diff --git a/arch/arc/include/asm/io.h b/arch/arc/include/asm/io.h
> index 80347382a380..4fdb7350636c 100644
> --- a/arch/arc/include/asm/io.h
> +++ b/arch/arc/include/asm/io.h
> @@ -21,8 +21,9 @@
>  #endif
>  
>  extern void __iomem *ioremap(phys_addr_t paddr, unsigned long size);
> -extern void __iomem *ioremap_prot(phys_addr_t paddr, unsigned long size,
> -				  unsigned long flags);
> +#define ioremap ioremap
> +#define ioremap_prot ioremap_prot
> +#define iounmap iounmap
>  static inline void __iomem *ioport_map(unsigned long port, unsigned int nr)
>  {
>  	return (void __iomem *)port;
> @@ -32,8 +33,6 @@ static inline void ioport_unmap(void __iomem *addr)
>  {
>  }
>  
> -extern void iounmap(const volatile void __iomem *addr);
> -
>  /*
>   * io{read,write}{16,32}be() macros
>   */
> diff --git a/arch/arc/mm/ioremap.c b/arch/arc/mm/ioremap.c
> index 712c2311daef..b07004d53267 100644
> --- a/arch/arc/mm/ioremap.c
> +++ b/arch/arc/mm/ioremap.c
> @@ -8,7 +8,6 @@
>  #include <linux/module.h>
>  #include <linux/io.h>
>  #include <linux/mm.h>
> -#include <linux/slab.h>
>  #include <linux/cache.h>
>  
>  static inline bool arc_uncached_addr_space(phys_addr_t paddr)
> @@ -25,13 +24,6 @@ static inline bool arc_uncached_addr_space(phys_addr_t paddr)
>  
>  void __iomem *ioremap(phys_addr_t paddr, unsigned long size)
>  {
> -	phys_addr_t end;
> -
> -	/* Don't allow wraparound or zero size */
> -	end = paddr + size - 1;
> -	if (!size || (end < paddr))
> -		return NULL;
> -
>  	/*
>  	 * If the region is h/w uncached, MMU mapping can be elided as optim
>  	 * The cast to u32 is fine as this region can only be inside 4GB
> @@ -51,55 +43,22 @@ EXPORT_SYMBOL(ioremap);
>   * ARC hardware uncached region, this one still goes thru the MMU as caller
>   * might need finer access control (R/W/X)
>   */
> -void __iomem *ioremap_prot(phys_addr_t paddr, unsigned long size,
> +void __iomem *ioremap_prot(phys_addr_t paddr, size_t size,
>  			   unsigned long flags)
>  {
> -	unsigned int off;
> -	unsigned long vaddr;
> -	struct vm_struct *area;
> -	phys_addr_t end;
>  	pgprot_t prot = __pgprot(flags);
>  
> -	/* Don't allow wraparound, zero size */
> -	end = paddr + size - 1;
> -	if ((!size) || (end < paddr))
> -		return NULL;
> -
> -	/* An early platform driver might end up here */
> -	if (!slab_is_available())
> -		return NULL;
> -
>  	/* force uncached */
> -	prot = pgprot_noncached(prot);
> -
> -	/* Mappings have to be page-aligned */
> -	off = paddr & ~PAGE_MASK;
> -	paddr &= PAGE_MASK_PHYS;
> -	size = PAGE_ALIGN(end + 1) - paddr;
> -
> -	/*
> -	 * Ok, go for it..
> -	 */
> -	area = get_vm_area(size, VM_IOREMAP);
> -	if (!area)
> -		return NULL;
> -	area->phys_addr = paddr;
> -	vaddr = (unsigned long)area->addr;
> -	if (ioremap_page_range(vaddr, vaddr + size, paddr, prot)) {
> -		vunmap((void __force *)vaddr);
> -		return NULL;
> -	}
> -	return (void __iomem *)(off + (char __iomem *)vaddr);
> +	return generic_ioremap_prot(paddr, size, pgprot_noncached(prot));
>  }
>  EXPORT_SYMBOL(ioremap_prot);
>  
> -
> -void iounmap(const volatile void __iomem *addr)
> +void iounmap(volatile void __iomem *addr)
>  {
>  	/* weird double cast to handle phys_addr_t > 32 bits */
>  	if (arc_uncached_addr_space((phys_addr_t)(u32)addr))
>  		return;
>  
> -	vfree((void *)(PAGE_MASK & (unsigned long __force)addr));
> +	generic_iounmap(addr);
>  }
>  EXPORT_SYMBOL(iounmap);
> -- 
> 2.34.1
> 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
