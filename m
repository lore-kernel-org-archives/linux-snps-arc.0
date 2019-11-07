Return-Path: <SRS0=Bmjj=Y7=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED8EC43331
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Nov 2019 15:30:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E4DA214D8
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Nov 2019 15:30:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GKykcVon";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="noW+GrgC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E4DA214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=yaSUPrH2GVbNk4K9Be9WJaJB+ioObyx068JrsWWZJhs=; b=GKykcVonTZ/ZpxIDTQgr8OS8I
	iWi7MZYmTES+cbIEjAtrEdh732CKFyc6UeVsd2C+QlArqWyT7ruyUgaP2AWytnpOw8wVHy4ysKtv4
	2oeywC9ovtXDBTfy7eIRCwsVsTEhphZHB8sFoLfOHitacVkB9V1113X9eLK9l7JqLtAJfMhkMYFW+
	RubvFkdIJnrSMg/WFIkb/2u4I86BA/Su8tc3p7mP0jSJqHTWvE64yicuClcEd/xrtrN75PJRuazLW
	VDL/o1OnnfotzeioclAVPfnbccxdMvT59wx3Jwu0r7OvMVZv9XTnG1l/TNf3hTMO2fW4N90lcJqFo
	B1w0V0NhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSjjw-0000NH-9u; Thu, 07 Nov 2019 15:30:28 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSjih-0006W6-Ni
 for linux-snps-arc@lists.infradead.org; Thu, 07 Nov 2019 15:29:17 +0000
Received: by mail-pl1-x644.google.com with SMTP id d29so1691806plj.8
 for <linux-snps-arc@lists.infradead.org>; Thu, 07 Nov 2019 07:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=celw7kLC34qqwTTfh++uCkQEjOgc/6nwF8dFF2fJRcA=;
 b=noW+GrgCtBbtWmvRliYdOAuMA0YUG7D+eX91HjAU5IDNU+EBOcrbt42dkubqBTxW4S
 WQ8n2ZfnbmfCL4+eE6s1MnG4kJG52VZJ91QbzuQNFIi/COPg+DrUHbZ8+Jcgjj/Q48Re
 QNX4NY1E7vtLM68r6rfozcc3RNzkIItLOE7o9jhPPrBLVYCbQcAaXYdiCcQx1PUOZm7u
 oSAbYZ4+XOAXy2q29Df881Gyse5LGoGTyAaPv6aJ5raeRYhtrrpUAm1qesZ/YD4XWer0
 OQ5NPy7zRFp9dt0jb2kjIPuYcQwfIBFil4fTrnHBnYJ1ukrYml+utoouUC2biDI7it8K
 q8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=celw7kLC34qqwTTfh++uCkQEjOgc/6nwF8dFF2fJRcA=;
 b=odKuFkZZpBBZsDKf26M5jJc5HbOi1hopu+NqhzM+BvOt3BOXw85+oF9Hfk5M+HROo0
 494qkvk8NExN/7s7f9cl8Ax98ZinWF03+j6b2Vex+f2lYuzAOV0g1AYo1pt4PIXTjLj4
 /BnCqfTxgwF397jdYQzVKvytMQ3wVqll2N1GnhV75GNAmYhPzTKnjC34uw7GYLrfpGRv
 60mY8iV/YFB0/7CXtHDE0QILMnKK2xjbPobdkxWi2wGM3gnfTOYzRMkTJadlISO3hqen
 4qnZzmLDQh3I/ZPJMZvy6O3iqmVNu0ruipGhJLdGDSL+ACwqhCAusKwbGqdUQ1NrDXYv
 5MOA==
X-Gm-Message-State: APjAAAVoEGRdaDKeash7PtiKYomQ6zEiliVKx7RfKmrFwSDqW6uJPJiB
 +u75QWHVLm5qS7fGK4hp9N4+Zg==
X-Google-Smtp-Source: APXvYqxwW3UXdXBa6cGLkWhsyLfBz9Kw3ES1wGdovuqY/c7cBz2zbKIbrHc7CxUnNtedCkwAnHzZJw==
X-Received: by 2002:a17:90a:174a:: with SMTP id
 10mr5875131pjm.104.1573140550559; 
 Thu, 07 Nov 2019 07:29:10 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id r10sm2405827pgn.68.2019.11.07.07.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 07:29:10 -0800 (PST)
Date: Thu, 07 Nov 2019 07:29:10 -0800 (PST)
X-Google-Original-Date: Wed, 06 Nov 2019 10:45:31 PST (-0800)
Subject: Re: [PATCH 17/21] lib: provide a simple generic ioremap implementation
In-Reply-To: <20191029064834.23438-18-hch@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-e96b8613-e384-4e94-90f8-d1cf78c5627a@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_072911_775028_0693CD00 
X-CRM114-Status: GOOD (  23.64  )
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
 linux-kernel@vger.kernel.org, guoren@kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, deanbo422@gmail.com,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, green.hu@gmail.com,
 linux-mtd@lists.infradead.org, gxt@pku.edu.cn,
 linux-arm-kernel@lists.infradead.org, monstr@monstr.eu,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, 28 Oct 2019 23:48:30 PDT (-0700), Christoph Hellwig wrote:
> A lot of architectures reuse the same simple ioremap implementation, so
> start lifting the most simple variant to lib/ioremap.c.  It provides
> ioremap_prot and iounmap, plus a default ioremap that uses prot_noncached,
> although that can be overridden by asm/io.h.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/asm-generic/io.h | 20 ++++++++++++++++----
>  lib/Kconfig              |  3 +++
>  lib/ioremap.c            | 39 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 58 insertions(+), 4 deletions(-)
>
> diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
> index 4e45e1cb6560..4a661fdd1937 100644
> --- a/include/asm-generic/io.h
> +++ b/include/asm-generic/io.h
> @@ -923,9 +923,10 @@ static inline void *phys_to_virt(unsigned long address)
>   * DOC: ioremap() and ioremap_*() variants
>   *
>   * Architectures with an MMU are expected to provide ioremap() and iounmap()
> - * themselves.  For NOMMU architectures we provide a default nop-op
> - * implementation that expect that the physical address used for MMIO are
> - * already marked as uncached, and can be used as kernel virtual addresses.
> + * themselves or rely on GENERIC_IOREMAP.  For NOMMU architectures we provide
> + * a default nop-op implementation that expect that the physical address used
> + * for MMIO are already marked as uncached, and can be used as kernel virtual
> + * addresses.
>   *
>   * ioremap_wc() and ioremap_wt() can provide more relaxed caching attributes
>   * for specific drivers if the architecture choses to implement them.  If they
> @@ -946,7 +947,18 @@ static inline void iounmap(void __iomem *addr)
>  {
>  }
>  #endif
> -#endif /* CONFIG_MMU */
> +#elif defined(CONFIG_GENERIC_IOREMAP)
> +#include <asm/pgtable.h>
> +
> +void __iomem *ioremap_prot(phys_addr_t addr, size_t size, unsigned long prot);
> +void iounmap(volatile void __iomem *addr);
> +
> +static inline void __iomem *ioremap(phys_addr_t addr, size_t size)
> +{
> +	/* _PAGE_IOREMAP needs to be supplied by the architecture */
> +	return ioremap_prot(addr, size, _PAGE_IOREMAP);
> +}
> +#endif /* !CONFIG_MMU || CONFIG_GENERIC_IOREMAP */
>
>  #ifndef ioremap_nocache
>  #define ioremap_nocache ioremap
> diff --git a/lib/Kconfig b/lib/Kconfig
> index 183f92a297ca..afc78aaf2b25 100644
> --- a/lib/Kconfig
> +++ b/lib/Kconfig
> @@ -638,6 +638,9 @@ config STRING_SELFTEST
>
>  endmenu
>
> +config GENERIC_IOREMAP
> +	bool
> +
>  config GENERIC_LIB_ASHLDI3
>  	bool
>
> diff --git a/lib/ioremap.c b/lib/ioremap.c
> index 0a2ffadc6d71..3f0e18543de8 100644
> --- a/lib/ioremap.c
> +++ b/lib/ioremap.c
> @@ -231,3 +231,42 @@ int ioremap_page_range(unsigned long addr,
>
>  	return err;
>  }
> +
> +#ifdef CONFIG_GENERIC_IOREMAP
> +void __iomem *ioremap_prot(phys_addr_t addr, size_t size, unsigned long prot)
> +{
> +	unsigned long offset, vaddr;
> +	phys_addr_t last_addr;
> +	struct vm_struct *area;
> +
> +	/* Disallow wrap-around or zero size */
> +	last_addr = addr + size - 1;
> +	if (!size || last_addr < addr)
> +		return NULL;
> +
> +	/* Page-align mappings */
> +	offset = addr & (~PAGE_MASK);
> +	addr -= offset;
> +	size = PAGE_ALIGN(size + offset);
> +
> +	area = get_vm_area_caller(size, VM_IOREMAP,
> +			__builtin_return_address(0));
> +	if (!area)
> +		return NULL;
> +	vaddr = (unsigned long)area->addr;
> +
> +	if (ioremap_page_range(vaddr, vaddr + size, addr, __pgprot(prot))) {
> +		free_vm_area(area);
> +		return NULL;
> +	}
> +
> +	return (void __iomem *)(vaddr + offset);
> +}
> +EXPORT_SYMBOL(ioremap_prot);
> +
> +void iounmap(volatile void __iomem *addr)
> +{
> +	vunmap((void *)((unsigned long)addr & PAGE_MASK));
> +}
> +EXPORT_SYMBOL(iounmap);
> +#endif /* CONFIG_GENERIC_IOREMAP */

Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>

Thanks!  This should let us get rid of arch/riscv/mm/ioremap.c.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
