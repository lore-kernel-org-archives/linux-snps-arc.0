Return-Path: <SRS0=efrZ=DA=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D6BDC4727D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2020 00:05:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42AFE2071A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2020 00:05:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rDXeZ127";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4BsQwtr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42AFE2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tPrDwGjxI5iNei2eIzfnWQZN3WKtm3Zs9CMi0R/785k=; b=rDXeZ127R9PBOmsrxlfLyYxfE
	+O3t/clM5B1nKuwkcKIn1+nnKt7Uz+EgCAUEy9R4kZQlU4U6eQnNJGBr7YshqrcOOgrKjmfOnDTV0
	E0sVteHOQ7GBc1vjVon9TaGnQ91CoyigVTIVLG3aT6KjVYz2JZMWPsjviR4Gz9wdSrDAbK85cN0aY
	KmZGd+q46quQ/avqUzU6mLX8L+9MJM5ixaoOClTp++26dlLeVHavG0bj417tYhyHZ8iexm9fwXd4J
	3oQ7CHLgC2+LWqGDm5N/pQRM4tbiO05ETtRgFrmY3BvtMP7Cne9Nqtyp10VulGG8TbSLWD1NgCPVl
	Rh3kLrg1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKsI4-0002IS-IT; Wed, 23 Sep 2020 00:05:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKsHz-0002GG-Kx; Wed, 23 Sep 2020 00:05:40 +0000
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 377DC23787;
 Wed, 23 Sep 2020 00:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600819537;
 bh=BN2JO8cF+jS2JfvaTCuvroT3lVzAjAOUVtydtxaO3O4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=D4BsQwtrE0bRRALj0ZhdHfCLSujXjh6F7meja8WT18qpviXbA+QZpG22D6TStoFzD
 esLcNEEis3q5GD2ngAjDv1JBj3nuV1NJDjbAM1zx1PLnf+GaJE4CWCPciG6IKeEj9P
 2etOQlfFcS6a8cIi5hnan134iSIropl9NNarJz0U=
Received: by mail-lf1-f51.google.com with SMTP id d15so19990655lfq.11;
 Tue, 22 Sep 2020 17:05:37 -0700 (PDT)
X-Gm-Message-State: AOAM533TUM99VXnB25CVTs4NayEq7RXNgqp3/KK8k7hGnq7dI+f7FIRN
 7UQh9Egu+NUYzo2sIKZmyTyQcbUvOiV8t1TA9O4=
X-Google-Smtp-Source: ABdhPJzKHKLgsGXChluCkkkYPY85+IzWQtpjD+xwRPqP5lLV/gun1FBs3gKk0smb1Hrbxlj4VdZ3a5tMZisYukVr51E=
X-Received: by 2002:ac2:51aa:: with SMTP id f10mr2347652lfk.451.1600819535428; 
 Tue, 22 Sep 2020 17:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200919091751.011116649@linutronix.de>
 <20200919092616.432209211@linutronix.de>
In-Reply-To: <20200919092616.432209211@linutronix.de>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 23 Sep 2020 08:05:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTcs2589gj6iYhumuoXPa6ejycedAKv4O8QwXQkKU0_fw@mail.gmail.com>
Message-ID: <CAJF2gTTcs2589gj6iYhumuoXPa6ejycedAKv4O8QwXQkKU0_fw@mail.gmail.com>
Subject: Re: [patch RFC 06/15] csky/mm/highmem: Switch to generic kmap atomic
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_200539_887707_848B6461 
X-CRM114-Status: GOOD (  26.09  )
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Acked-by: Guo Ren <guoren@kernel.org>

On Sat, Sep 19, 2020 at 5:50 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Guo Ren <guoren@kernel.org>
> Cc: linux-csky@vger.kernel.org
> ---
> Note: Completely untested
> ---
>  arch/csky/Kconfig               |    1
>  arch/csky/include/asm/highmem.h |    4 +-
>  arch/csky/mm/highmem.c          |   75 ----------------------------------------
>  3 files changed, 5 insertions(+), 75 deletions(-)
>
> --- a/arch/csky/Kconfig
> +++ b/arch/csky/Kconfig
> @@ -285,6 +285,7 @@ config NR_CPUS
>  config HIGHMEM
>         bool "High Memory Support"
>         depends on !CPU_CK610
> +       select KMAP_ATOMIC_GENERIC
>         default y
>
>  config FORCE_MAX_ZONEORDER
> --- a/arch/csky/include/asm/highmem.h
> +++ b/arch/csky/include/asm/highmem.h
> @@ -32,10 +32,12 @@ extern pte_t *pkmap_page_table;
>
>  #define ARCH_HAS_KMAP_FLUSH_TLB
>  extern void kmap_flush_tlb(unsigned long addr);
> -extern void *kmap_atomic_pfn(unsigned long pfn);
>
>  #define flush_cache_kmaps() do {} while (0)
>
> +#define arch_kmap_temp_post_map(vaddr, pteval) kmap_flush_tlb(vaddr)
> +#define arch_kmap_temp_post_unmap(vaddr)       kmap_flush_tlb(vaddr)
> +
>  extern void kmap_init(void);
>
>  #endif /* __KERNEL__ */
> --- a/arch/csky/mm/highmem.c
> +++ b/arch/csky/mm/highmem.c
> @@ -9,8 +9,6 @@
>  #include <asm/tlbflush.h>
>  #include <asm/cacheflush.h>
>
> -static pte_t *kmap_pte;
> -
>  unsigned long highstart_pfn, highend_pfn;
>
>  void kmap_flush_tlb(unsigned long addr)
> @@ -19,67 +17,7 @@ void kmap_flush_tlb(unsigned long addr)
>  }
>  EXPORT_SYMBOL(kmap_flush_tlb);
>
> -void *kmap_atomic_high_prot(struct page *page, pgprot_t prot)
> -{
> -       unsigned long vaddr;
> -       int idx, type;
> -
> -       type = kmap_atomic_idx_push();
> -       idx = type + KM_TYPE_NR*smp_processor_id();
> -       vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
> -#ifdef CONFIG_DEBUG_HIGHMEM
> -       BUG_ON(!pte_none(*(kmap_pte - idx)));
> -#endif
> -       set_pte(kmap_pte-idx, mk_pte(page, prot));
> -       flush_tlb_one((unsigned long)vaddr);
> -
> -       return (void *)vaddr;
> -}
> -EXPORT_SYMBOL(kmap_atomic_high_prot);
> -
> -void kunmap_atomic_high(void *kvaddr)
> -{
> -       unsigned long vaddr = (unsigned long) kvaddr & PAGE_MASK;
> -       int idx;
> -
> -       if (vaddr < FIXADDR_START)
> -               return;
> -
> -#ifdef CONFIG_DEBUG_HIGHMEM
> -       idx = KM_TYPE_NR*smp_processor_id() + kmap_atomic_idx();
> -
> -       BUG_ON(vaddr != __fix_to_virt(FIX_KMAP_BEGIN + idx));
> -
> -       pte_clear(&init_mm, vaddr, kmap_pte - idx);
> -       flush_tlb_one(vaddr);
> -#else
> -       (void) idx; /* to kill a warning */
> -#endif
> -       kmap_atomic_idx_pop();
> -}
> -EXPORT_SYMBOL(kunmap_atomic_high);
> -
> -/*
> - * This is the same as kmap_atomic() but can map memory that doesn't
> - * have a struct page associated with it.
> - */
> -void *kmap_atomic_pfn(unsigned long pfn)
> -{
> -       unsigned long vaddr;
> -       int idx, type;
> -
> -       pagefault_disable();
> -
> -       type = kmap_atomic_idx_push();
> -       idx = type + KM_TYPE_NR*smp_processor_id();
> -       vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
> -       set_pte(kmap_pte-idx, pfn_pte(pfn, PAGE_KERNEL));
> -       flush_tlb_one(vaddr);
> -
> -       return (void *) vaddr;
> -}
> -
> -static void __init kmap_pages_init(void)
> +void __init kmap_init(void)
>  {
>         unsigned long vaddr;
>         pgd_t *pgd;
> @@ -96,14 +34,3 @@ static void __init kmap_pages_init(void)
>         pte = pte_offset_kernel(pmd, vaddr);
>         pkmap_page_table = pte;
>  }
> -
> -void __init kmap_init(void)
> -{
> -       unsigned long vaddr;
> -
> -       kmap_pages_init();
> -
> -       vaddr = __fix_to_virt(FIX_KMAP_BEGIN);
> -
> -       kmap_pte = pte_offset_kernel((pmd_t *)pgd_offset_k(vaddr), vaddr);
> -}
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
