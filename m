Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0900C43334
	for <linux-snps-arc@archiver.kernel.org>; Sat, 25 Jun 2022 04:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KodZX1yif2eo11ONfEs5t4L9tFhthcWtBHeZzQnZrlw=; b=aRGPHoSmtyp6CV
	EFeRfgTcgd4dBPjiKzBj0ZI6NL0Oqwm2UD92QKx77W47jcvr6zte3X7oYOBR9UP9tI1JhEjAAlcGZ
	TlGii/zGM70SWWzzdi/opbXGBsLWrD77C6xyjNr3M4myjBHnR/aNRNUR54vnAX5IsdQhKhzfz11pA
	G/kX1fx4GoSOpgY4owdC3AmR0+PHUJ/7LfMNuzXj91KCiCr9o0sAqlNBsW8MfreUaHCWHveE0U80y
	XlqQdzZyVSY+/m7hm9zczqCVI0idlTOeZH/6dM3EtQbB0G9tw35OrC7CekWTPg4/Z3co73DK1rjGE
	G1R/LH4yvTAsQkSfNI8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4x2g-004ZlF-Mt; Sat, 25 Jun 2022 04:05:06 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4x2b-004Zip-DP; Sat, 25 Jun 2022 04:05:03 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 184so4069226pga.12;
        Fri, 24 Jun 2022 21:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WBt/btUb8fidp7Od3hgblEREGwTCWyy1gmQjOCfY3fU=;
        b=U/9jOhfyin/xPm7/lhb3QQD5hUeqWoso3ZUE4nrDpj+uCxrVZoUa6Nd3Ck/My6d0yi
         uppYCT29YGR4+ED265rzl5CvHaPa9jAGrevS8NrjQCL2swa/6jIuJFW7ijxN5Kwk3kBm
         JV3zRaXX17ljjVxLWEmEYneBMjkOzcbgPwAATblJGSLPQW9zrru3NcHlbevjvxhjXf2X
         4fZUXrqKoxs5SGRwhMih22jCYG6mLHxDBQ9QA+V/Ap/ZmZMWhJBLgf3cIDLH/WvFpZqO
         6XUFzNOC5pd+9LH1sxuFUCYfWolIKgEMvYZ3auh92ECWjOyrr+qjV1d2Dawwr5UE8zHy
         fSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WBt/btUb8fidp7Od3hgblEREGwTCWyy1gmQjOCfY3fU=;
        b=51qLrMECtYCaDbOEMn+2LHi252voM63h3X9yajjPQgu466LCdP7Sc18l9egfqIIP0R
         8NcPhlAWTGnMy1wRtmy9Zy/BghxLH1Klgj5L1mX0NwM3z77vJIr7effJi1G54IFEw6+z
         X9/sgH/DZtdxD3alHY27/fX/MlVgZcEIl4jcLquN9oVyl31k+X6aw+XqTjG3HrRwM8vQ
         /hw1IZWtslgV60uITGZme3Th5uiMRgwS1qFebe7USXqL2s4ad1ypLhlPcas1FqAhcA1A
         biDqtvapbX/VC6p/ef+A2CRCmZDCmat9Fnp5Bj9igHaPgyG296XVf8DEkXDleDr0qESO
         8ddA==
X-Gm-Message-State: AJIora9usGLhFr/vQU3x4AKCb3bldSVJPDn20W7ZSMJ83NpuWGVzlXDY
	+Cl+nHwW9ThTZX98DSoQX7s=
X-Google-Smtp-Source: AGRyM1vLmqY6wDucr+TwoJMOmf3PJcPGDXbsAVQaOC2Ok2+1xpNGLbPuxQdolETx+44LH2D87vYqmw==
X-Received: by 2002:a63:44:0:b0:40c:9f98:a172 with SMTP id 65-20020a630044000000b0040c9f98a172mr1947422pga.65.1656129897973;
        Fri, 24 Jun 2022 21:04:57 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902e54100b00168adae4eb2sm2579898plf.262.2022.06.24.21.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 21:04:57 -0700 (PDT)
Date: Sat, 25 Jun 2022 13:04:55 +0900
From: Stafford Horne <shorne@gmail.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, linux-ia64@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>,
	linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
	x86@kernel.org, christophe.leroy@csgroup.eu, hch@infradead.org,
	linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
	linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
	openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
	linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V4 10/26] openrisc/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Message-ID: <YraJZ7OahapN5Y6z@antec>
References: <20220624044339.1533882-1-anshuman.khandual@arm.com>
 <20220624044339.1533882-11-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220624044339.1533882-11-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_210501_515481_879A14E6 
X-CRM114-Status: GOOD (  16.25  )
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

On Fri, Jun 24, 2022 at 10:13:23AM +0530, Anshuman Khandual wrote:
> This enables ARCH_HAS_VM_GET_PAGE_PROT on the platform and exports standard
> vm_get_page_prot() implementation via DECLARE_VM_GET_PAGE_PROT, which looks
> up a private and static protection_map[] array. Subsequently all __SXXX and
> __PXXX macros can be dropped which are no longer needed.
> 
> Cc: Jonas Bonn <jonas@southpole.se>
> Cc: openrisc@lists.librecores.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/openrisc/Kconfig               |  1 +
>  arch/openrisc/include/asm/pgtable.h | 18 ------------------
>  arch/openrisc/mm/init.c             | 20 ++++++++++++++++++++
>  3 files changed, 21 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
> index e814df4c483c..fe0dfb50eb86 100644
> --- a/arch/openrisc/Kconfig
> +++ b/arch/openrisc/Kconfig
> @@ -10,6 +10,7 @@ config OPENRISC
>  	select ARCH_HAS_DMA_SET_UNCACHED
>  	select ARCH_HAS_DMA_CLEAR_UNCACHED
>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
> +	select ARCH_HAS_VM_GET_PAGE_PROT
>  	select COMMON_CLK
>  	select OF
>  	select OF_EARLY_FLATTREE
> diff --git a/arch/openrisc/include/asm/pgtable.h b/arch/openrisc/include/asm/pgtable.h
> index c3abbf71e09f..dcae8aea132f 100644
> --- a/arch/openrisc/include/asm/pgtable.h
> +++ b/arch/openrisc/include/asm/pgtable.h
> @@ -176,24 +176,6 @@ extern void paging_init(void);
>  	__pgprot(_PAGE_ALL | _PAGE_SRE | _PAGE_SWE \
>  		 | _PAGE_SHARED | _PAGE_DIRTY | _PAGE_EXEC | _PAGE_CI)
>  
> -#define __P000	PAGE_NONE
> -#define __P001	PAGE_READONLY_X
> -#define __P010	PAGE_COPY
> -#define __P011	PAGE_COPY_X
> -#define __P100	PAGE_READONLY
> -#define __P101	PAGE_READONLY_X
> -#define __P110	PAGE_COPY
> -#define __P111	PAGE_COPY_X
> -
> -#define __S000	PAGE_NONE
> -#define __S001	PAGE_READONLY_X
> -#define __S010	PAGE_SHARED
> -#define __S011	PAGE_SHARED_X
> -#define __S100	PAGE_READONLY
> -#define __S101	PAGE_READONLY_X
> -#define __S110	PAGE_SHARED
> -#define __S111	PAGE_SHARED_X
> -
>  /* zero page used for uninitialized stuff */
>  extern unsigned long empty_zero_page[2048];
>  #define ZERO_PAGE(vaddr) (virt_to_page(empty_zero_page))
> diff --git a/arch/openrisc/mm/init.c b/arch/openrisc/mm/init.c
> index 3a021ab6f1ae..a654b9dcba91 100644
> --- a/arch/openrisc/mm/init.c
> +++ b/arch/openrisc/mm/init.c
> @@ -208,3 +208,23 @@ void __init mem_init(void)
>  	mem_init_done = 1;
>  	return;
>  }
> +
> +static pgprot_t protection_map[16] __ro_after_init = {
> +	[VM_NONE]					= PAGE_NONE,
> +	[VM_READ]					= PAGE_READONLY_X,
> +	[VM_WRITE]					= PAGE_COPY,
> +	[VM_WRITE | VM_READ]				= PAGE_COPY_X,
> +	[VM_EXEC]					= PAGE_READONLY,
> +	[VM_EXEC | VM_READ]				= PAGE_READONLY_X,
> +	[VM_EXEC | VM_WRITE]				= PAGE_COPY,
> +	[VM_EXEC | VM_WRITE | VM_READ]			= PAGE_COPY_X,
> +	[VM_SHARED]					= PAGE_NONE,
> +	[VM_SHARED | VM_READ]				= PAGE_READONLY_X,
> +	[VM_SHARED | VM_WRITE]				= PAGE_SHARED,
> +	[VM_SHARED | VM_WRITE | VM_READ]		= PAGE_SHARED_X,
> +	[VM_SHARED | VM_EXEC]				= PAGE_READONLY,
> +	[VM_SHARED | VM_EXEC | VM_READ]			= PAGE_READONLY_X,
> +	[VM_SHARED | VM_EXEC | VM_WRITE]		= PAGE_SHARED,
> +	[VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]	= PAGE_SHARED_X
> +};
> +DECLARE_VM_GET_PAGE_PROT

Looks good.

Acked-by: Stafford Horne <shorne@gmail.com>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
