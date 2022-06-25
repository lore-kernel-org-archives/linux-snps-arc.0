Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35F8C433EF
	for <linux-snps-arc@archiver.kernel.org>; Sat, 25 Jun 2022 03:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZzAD14qvf8bHUd81Ah5SLlIZO18fpdwOCR3snqeL4WI=; b=NzVUWVoUd3tHa6
	52muTDYWAvna5S9Y6Ga8PXRMQjER2gKTZ8hcUTWdqXs6eBtwKspbgz///YJtb1Sdf85zkRtu9omL5
	6F/wc8unl8SilK4Pi7ZZc7PZmFX5KJsVOQFMeW8i8SkKgaOsyvUMYMbLiY7Td2QuKm/rIpivhqk39
	I4ax9rjpAtkM5WXTDQ9Tg1aajULT3WvRCCe2mmAIz6O9hcHcF4sdAfA6JNUfRUc5MYQ5i4uYFGh/7
	kqmy6Uqqpy9QHAEN0pInkfDaBnPgzDTxHHq4UZd40cHckD8UYpk9BDh5bIiGVuGKn6pf9PH9qhjBV
	yOquWH8KdM/AWAS7zgJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4w9J-004TwG-ET; Sat, 25 Jun 2022 03:07:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4w97-004Tt1-5R; Sat, 25 Jun 2022 03:07:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B1328B82D1C;
	Sat, 25 Jun 2022 03:07:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8313C385A9;
	Sat, 25 Jun 2022 03:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656126456;
	bh=oXHgCaP4HoPf+EWVcl07MPhIxJZH52Q6LkxiX0QDRik=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FU+dZqhPCI7WaKDA+AjLnOS95m8QPJ0z8ReiNhcC2P4NI+ZrmxNZzDJ5YJTkaoQPc
	 SatgzVUTcSgwyHrsucOh+GM4g3/1+h+GgSSKqGqW1IBs4BT6j/vgsdecXBdHRGrd/2
	 AqxR5wuq64YrbhfjN2MwpcKf3vhLfmFGvSGSPpQJKPSvpHYebZMLXmOJS28s2TD7Ve
	 tSI/XbxbVWusqsHNpvvUVuXqKWV5X3nWDwd3AKdS2EZyyoyoyyVia9ScMoTkLyaHef
	 IZZEeQ2fgwO8fwjgwOcJcINmgNazhx1HiRXE5XjDpGoZob6l6d4Fa9hcpl/FGH0gH1
	 y2/GNgWsUtZKQ==
Received: by mail-vs1-f46.google.com with SMTP id j1so3913044vsj.12;
        Fri, 24 Jun 2022 20:07:36 -0700 (PDT)
X-Gm-Message-State: AJIora8GK5xNj3FrsM5Nhn8lNz8d1w6lFg3t4FXt2ar1jCx34LWc9ZAZ
	Trm54mLkmG4BrY23gXbliSff/5RGZHSLLYcru2Y=
X-Google-Smtp-Source: AGRyM1vKaBnKP+OKs0X53+qz3soArX9HkvW+CKQD7jqShPo7H3ehVP4Gjy9lyocTRtcrWI2zFmWCsaDUISHvTXAw0RU=
X-Received: by 2002:a05:6102:3e93:b0:353:a8fb:e922 with SMTP id
 m19-20020a0561023e9300b00353a8fbe922mr711833vsv.51.1656126455677; Fri, 24 Jun
 2022 20:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220624044339.1533882-1-anshuman.khandual@arm.com> <20220624044339.1533882-18-anshuman.khandual@arm.com>
In-Reply-To: <20220624044339.1533882-18-anshuman.khandual@arm.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 25 Jun 2022 11:07:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQXpYggbN8vbv+XVkORDEBbUAJJaJsbN2ZtSbjGfem1Tg@mail.gmail.com>
Message-ID: <CAJF2gTQXpYggbN8vbv+XVkORDEBbUAJJaJsbN2ZtSbjGfem1Tg@mail.gmail.com>
Subject: Re: [PATCH V4 17/26] csky/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Linux-MM <linux-mm@kvack.org>, Christoph Hellwig <hch@infradead.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Andrew Morton <akpm@linux-foundation.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, sparclinux <sparclinux@vger.kernel.org>, 
	"the arch/x86 maintainers" <x86@kernel.org>, Openrisc <openrisc@lists.librecores.org>, 
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, Parisc List <linux-parisc@vger.kernel.org>, 
	linux-alpha@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-s390 <linux-s390@vger.kernel.org>, linux-ia64@vger.kernel.org, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, linux-m68k@lists.linux-m68k.org, 
	linux-snps-arc@lists.infradead.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-um@lists.infradead.org, 
	linux-sh@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_200741_549070_74D18CA0 
X-CRM114-Status: GOOD (  18.68  )
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

For csky part.

Acked-by: Guo Ren <guoren@kernel.org>


On Fri, Jun 24, 2022 at 12:48 PM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> This enables ARCH_HAS_VM_GET_PAGE_PROT on the platform and exports standard
> vm_get_page_prot() implementation via DECLARE_VM_GET_PAGE_PROT, which looks
> up a private and static protection_map[] array. Subsequently all __SXXX and
> __PXXX macros can be dropped which are no longer needed.
>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: linux-csky@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/csky/Kconfig               |  1 +
>  arch/csky/include/asm/pgtable.h | 18 ------------------
>  arch/csky/mm/init.c             | 20 ++++++++++++++++++++
>  3 files changed, 21 insertions(+), 18 deletions(-)
>
> diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
> index 21d72b078eef..588b8a9c68ed 100644
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
> index bbe245117777..229a5f4ad7fc 100644
> --- a/arch/csky/include/asm/pgtable.h
> +++ b/arch/csky/include/asm/pgtable.h
> @@ -77,24 +77,6 @@
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
> index bf2004aa811a..1bf7b2a748fd 100644
> --- a/arch/csky/mm/init.c
> +++ b/arch/csky/mm/init.c
> @@ -197,3 +197,23 @@ void __init fixaddr_init(void)
>         vaddr = __fix_to_virt(__end_of_fixed_addresses - 1) & PMD_MASK;
>         fixrange_init(vaddr, vaddr + PMD_SIZE, swapper_pg_dir);
>  }
> +
> +static pgprot_t protection_map[16] __ro_after_init = {
> +       [VM_NONE]                                       = PAGE_NONE,
> +       [VM_READ]                                       = PAGE_READ,
> +       [VM_WRITE]                                      = PAGE_READ,
> +       [VM_WRITE | VM_READ]                            = PAGE_READ,
> +       [VM_EXEC]                                       = PAGE_READ,
> +       [VM_EXEC | VM_READ]                             = PAGE_READ,
> +       [VM_EXEC | VM_WRITE]                            = PAGE_READ,
> +       [VM_EXEC | VM_WRITE | VM_READ]                  = PAGE_READ,
> +       [VM_SHARED]                                     = PAGE_NONE,
> +       [VM_SHARED | VM_READ]                           = PAGE_READ,
> +       [VM_SHARED | VM_WRITE]                          = PAGE_WRITE,
> +       [VM_SHARED | VM_WRITE | VM_READ]                = PAGE_WRITE,
> +       [VM_SHARED | VM_EXEC]                           = PAGE_READ,
> +       [VM_SHARED | VM_EXEC | VM_READ]                 = PAGE_READ,
> +       [VM_SHARED | VM_EXEC | VM_WRITE]                = PAGE_WRITE,
> +       [VM_SHARED | VM_EXEC | VM_WRITE | VM_READ]      = PAGE_WRITE
> +};
> +DECLARE_VM_GET_PAGE_PROT
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
