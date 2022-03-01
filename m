Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03B6C433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Mar 2022 14:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aOg7AVSrqgEv+GjNkosOfAdRqZ1gcnYhpDIAHoMYDVI=; b=gOPHb1JDjDYD7k
	OubSUY67ql+KYulpFcinN+IO2hH273kAsNaP8HUj05ysNDYlUKRpcpZpY6Tp0UkS8Fg6XVtIEQyCE
	1fD2tY64VTsXsIXGx/g78YU7Mc8Bq4RDk2h3NZ6X3OFbY6u1l4+CkkoKmewoPsDySgLHuNP30tKMT
	Dy8xHMjBP+Q2uSLGR+cs1bwOS67EY6Z4lH1xttp/tSeHpGzY03ZMVo6ZqZK28U7SWfekDToxsWMa4
	d/TYmWgPgF6yyrN5EZCrfNdh9ifQPvYT/xRPQuDRzqh4zMEXjEHmf4L5dbj+JpFr4UlJ1amp7jOcd
	lk+fCdP6rT7ZUlYa+uEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP33j-00GyIo-Nd; Tue, 01 Mar 2022 14:00:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP33V-00GyEi-0B; Tue, 01 Mar 2022 14:00:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E46D461532;
 Tue,  1 Mar 2022 14:00:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC80C340F6;
 Tue,  1 Mar 2022 14:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646143242;
 bh=OCDdNe18bifA05pJN6Z3cL5GH76Vx+vSN/tAl+9N2NY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BXoUaM8AeIN8f71PC8fIcrdCRd3XA5bTRsNaI55YrB3n8AdYcHHNQ5PfFONmNJdx9
 3/CPcWQI6xI4q3njZfKJ//7qUb0OLv2P2whtuS8vVnMjqGPoCVcBgHyuiPi2wNTcJ+
 KSByydI8JzRxlo4gWWoVzIU41cydpMN+5Nu46TbYtJPRxdtzH4yMR64LlBcFEmPqIp
 3wzu1lY8fiIAXNFPydAfWfshcQxjaRgRJyXZ322mrYl9USFIgjN6ICC0+WR+CyrjeE
 Jxihmtaod4/dKtcpNMu61/NIh4k/DY+2ax2xbrEVmUuihjdGPL4LSD/jeHzVTjPcDD
 a2kZEW+hgrGpQ==
Received: by mail-vk1-f179.google.com with SMTP id n10so6877513vkm.10;
 Tue, 01 Mar 2022 06:00:42 -0800 (PST)
X-Gm-Message-State: AOAM532oCJsMQovnCe8slajNMoRbQGB4Z9P18bHw2x7WqXLtW7h5N5bn
 Q0/CacUg/ixfb7aIdvzizQye6O03zrmLH0MdFcM=
X-Google-Smtp-Source: ABdhPJwoZPlQG03sWsMv2LaiAVeC86gQ0+wyv+RzPw7RH1ttQNeeKqagstcZB00XUabb5ygCz6Zjo4KWbVCaIqQUo1I=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr10404475vkf.35.1646143241667; Tue, 01 Mar
 2022 06:00:41 -0800 (PST)
MIME-Version: 1.0
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-20-git-send-email-anshuman.khandual@arm.com>
In-Reply-To: <1646045273-9343-20-git-send-email-anshuman.khandual@arm.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 1 Mar 2022 22:00:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRSE-=-rDkMTD8D-bNw5inb4Yb_8S-AzXAuAthn9PCJmA@mail.gmail.com>
Message-ID: <CAJF2gTRSE-=-rDkMTD8D-bNw5inb4Yb_8S-AzXAuAthn9PCJmA@mail.gmail.com>
Subject: Re: [PATCH V3 19/30] csky/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Linux-MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Christoph Hellwig <hch@infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 sparclinux <sparclinux@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-m68k@lists.linux-m68k.org, linux-s390 <linux-s390@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-alpha@vger.kernel.org, linux-sh@vger.kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org, 
 linux-xtensa@linux-xtensa.org, Parisc List <linux-parisc@vger.kernel.org>, 
 openrisc@lists.librecores.org, linux-um@lists.infradead.org, 
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_060045_167590_9736E997 
X-CRM114-Status: GOOD (  19.86  )
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

Acked-by: Guo Ren <guoren@kernel.org>

On Mon, Feb 28, 2022 at 7:10 PM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> This defines and exports a platform specific custom vm_get_page_prot() via
> subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
> macros can be dropped which are no longer needed.
>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-csky@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/csky/Kconfig               |  1 +
>  arch/csky/include/asm/pgtable.h | 18 ------------------
>  arch/csky/mm/init.c             | 32 ++++++++++++++++++++++++++++++++
>  3 files changed, 33 insertions(+), 18 deletions(-)
>
> diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
> index 132f43f12dd8..209dac5686dd 100644
> --- a/arch/csky/Kconfig
> +++ b/arch/csky/Kconfig
> @@ -6,6 +6,7 @@ config CSKY
>         select ARCH_HAS_GCOV_PROFILE_ALL
>         select ARCH_HAS_SYNC_DMA_FOR_CPU
>         select ARCH_HAS_SYNC_DMA_FOR_DEVICE
> +       select ARCH_HAS_VM_GET_PAGE_PROT
>         select ARCH_USE_BUILTIN_BSWAP
>         select ARCH_USE_QUEUED_RWLOCKS
>         select ARCH_WANT_FRAME_POINTERS if !CPU_CK610 && $(cc-option,-mbacktrace)
> diff --git a/arch/csky/include/asm/pgtable.h b/arch/csky/include/asm/pgtable.h
> index 151607ed5158..2c6b1cfb1cce 100644
> --- a/arch/csky/include/asm/pgtable.h
> +++ b/arch/csky/include/asm/pgtable.h
> @@ -76,24 +76,6 @@
>  #define MAX_SWAPFILES_CHECK() \
>                 BUILD_BUG_ON(MAX_SWAPFILES_SHIFT != 5)
>
> -#define __P000 PAGE_NONE
> -#define __P001 PAGE_READ
> -#define __P010 PAGE_READ
> -#define __P011 PAGE_READ
> -#define __P100 PAGE_READ
> -#define __P101 PAGE_READ
> -#define __P110 PAGE_READ
> -#define __P111 PAGE_READ
> -
> -#define __S000 PAGE_NONE
> -#define __S001 PAGE_READ
> -#define __S010 PAGE_WRITE
> -#define __S011 PAGE_WRITE
> -#define __S100 PAGE_READ
> -#define __S101 PAGE_READ
> -#define __S110 PAGE_WRITE
> -#define __S111 PAGE_WRITE
> -
>  extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
>  #define ZERO_PAGE(vaddr)       (virt_to_page(empty_zero_page))
>
> diff --git a/arch/csky/mm/init.c b/arch/csky/mm/init.c
> index bf2004aa811a..f9babbed17d4 100644
> --- a/arch/csky/mm/init.c
> +++ b/arch/csky/mm/init.c
> @@ -197,3 +197,35 @@ void __init fixaddr_init(void)
>         vaddr = __fix_to_virt(__end_of_fixed_addresses - 1) & PMD_MASK;
>         fixrange_init(vaddr, vaddr + PMD_SIZE, swapper_pg_dir);
>  }
> +
> +pgprot_t vm_get_page_prot(unsigned long vm_flags)
> +{
> +       switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
> +       case VM_NONE:
> +               return PAGE_NONE;
> +       case VM_READ:
> +       case VM_WRITE:
> +       case VM_WRITE | VM_READ:
> +       case VM_EXEC:
> +       case VM_EXEC | VM_READ:
> +       case VM_EXEC | VM_WRITE:
> +       case VM_EXEC | VM_WRITE | VM_READ:
> +               return PAGE_READ;
> +       case VM_SHARED:
> +               return PAGE_NONE;
> +       case VM_SHARED | VM_READ:
> +               return PAGE_READ;
> +       case VM_SHARED | VM_WRITE:
> +       case VM_SHARED | VM_WRITE | VM_READ:
> +               return PAGE_WRITE;
> +       case VM_SHARED | VM_EXEC:
> +       case VM_SHARED | VM_EXEC | VM_READ:
> +               return PAGE_READ;
> +       case VM_SHARED | VM_EXEC | VM_WRITE:
> +       case VM_SHARED | VM_EXEC | VM_WRITE | VM_READ:
> +               return PAGE_WRITE;
> +       default:
> +               BUILD_BUG();
> +       }
> +}
> +EXPORT_SYMBOL(vm_get_page_prot);
> --
> 2.25.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
