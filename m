Return-Path: <SRS0=N0Bh=Y6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D21AC5DF63
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Nov 2019 18:11:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3D662166E
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Nov 2019 18:11:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mLeftHZi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="PNo3xZ45"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3D662166E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=6H1BtqoJfCR3Id6BXWw/diK2fX1Joxg/HOy4Q2Wdoxo=; b=mLeftHZi35NLktp5KEK5EDjcr
	EDowpUKriuPEORnXxSyXlPr5Q/7lUwb52f4qwVY/FvUH8ju6jWVCVRg6A4ZjKVeUg6Mxnbt72SwuJ
	xYQ8GJV+ovpqGRWXOPf6BCA0bqw1xwaHd/GfcpoE75poa22g+hMdDDWm5BVndNTM6ccVEvo0f8C7X
	gldgigO7fzsUwxPCP9itQa3NglaIb6B5mmSObR7zVv4Ux6Qg9KZy2uJUI1oU/6DjttAKQV755y8jr
	mPsJsNdNUbP32f10TBLm/JR6a47R6q+yxi6H5yQ2JlfWgEgcH6VSjgo7wykmP79MJlUMjbefToxYR
	a/qTga5Bw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSPmW-0003tF-6Z; Wed, 06 Nov 2019 18:11:48 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSPmO-0003km-Oa
 for linux-snps-arc@lists.infradead.org; Wed, 06 Nov 2019 18:11:42 +0000
Received: by mail-pg1-x541.google.com with SMTP id l24so17677987pgh.10
 for <linux-snps-arc@lists.infradead.org>; Wed, 06 Nov 2019 10:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=j8eNwULKpZxPZC3Ue7l8WChG2Sw1ZeM6zGQJhcLB2q4=;
 b=PNo3xZ45pD8y2N6reebfbfZpOdqqiBr1Lz+k6yQFI0L0/2p4rg9rq6quFNZC0fUzEy
 WlsJw4SBofaliFzu25uc3GL+jfLPaDDaxBBSeFuxKZdU+M46CbuLmJCyYZ3YubRPMmb4
 KJuh7ZayA7bBdQZfTwcK1CQOU3wgdx+7HYStjSw481T2P1SlQpPljbqXrje6nW+uncab
 xnl2WqnQq3h3MzYeukOBvYmW22S70Ab9cogKRn6Y5e/sTOn8Whd6Q8gV3t9/yTSsvIJH
 qW1nfHNHClKIYFKkd63n+sMzCsL83vOlxoTHUSAO8sIcR8NpgIG3bG3BN+f8kRlw/+Kv
 8mzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=j8eNwULKpZxPZC3Ue7l8WChG2Sw1ZeM6zGQJhcLB2q4=;
 b=T2rHZDR94Nz2vIDojw26X8F5m924anqRVIaVfYxiz8nrqUJ/nViPfxB9ckK15M70y3
 mFgJvQ5uUXxWK+FX928bVMSAp3tV+KTpcRJ/8U7YrpaRNthy5ZKW9SxSgq7kqFU/z7MI
 cKP0Tb6hlUWkNHUSQa17WprlRhl64KqkAPoDryP3rxyRl8y7YSglQtfL9dyxshiKJIqi
 ri+dPMnmJEFqCpSQAO6vPr8JkIR5RAR5Kf/0kPYAyBDjAMieBLllN/R3qcLr8H/Q11Wv
 xfXAi8pjqFjW/U1gOE1KiACoB28/a0VvVaoYGG5tonRK4wgaZSJR3rlFdv4OZvlFg5M+
 /VQw==
X-Gm-Message-State: APjAAAW72X/2c2x1EOuPqYIL8T2oPOQUSElgNkepqYwyu1knWcmYBTuo
 BHts4HrG02S/sbN+RckmeeVOTy92gvLzkQ==
X-Google-Smtp-Source: APXvYqyi7QvVvwFbCwtrCcolLw/HV05dOHLVSXF3jAYddzEgRk4byr6sPDxWkoeeO54icKRZXqVAsQ==
X-Received: by 2002:a62:170b:: with SMTP id 11mr4988303pfx.85.1573063899585;
 Wed, 06 Nov 2019 10:11:39 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id i5sm12394738pfo.52.2019.11.06.10.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 10:11:37 -0800 (PST)
Date: Wed, 06 Nov 2019 10:11:37 -0800 (PST)
X-Google-Original-Date: Wed, 06 Nov 2019 10:11:28 PST (-0800)
Subject: Re: [PATCH 11/21] asm-generic: don't provide ioremap for CONFIG_MMU
In-Reply-To: <20191029064834.23438-12-hch@lst.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <mhng-33ea9141-2440-4a2d-8133-62094486fc48@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_101140_807768_13E8B34A 
X-CRM114-Status: GOOD (  24.55  )
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

On Mon, 28 Oct 2019 23:48:24 PDT (-0700), Christoph Hellwig wrote:
> All MMU-enabled ports have a non-trivial ioremap and should thus provide
> the prototype for their implementation instead of providing a generic
> one unless a different symbol is not defined.  Note that this only
> affects sparc32 nds32 as all others do provide their own version.
>
> Also update the kerneldoc comments in asm-generic/io.h to explain the
> situation around the default ioremap* implementations correctly.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/nds32/include/asm/io.h    |  2 ++
>  arch/sparc/include/asm/io_32.h |  1 +
>  include/asm-generic/io.h       | 29 ++++++++---------------------
>  3 files changed, 11 insertions(+), 21 deletions(-)
>
> diff --git a/arch/nds32/include/asm/io.h b/arch/nds32/include/asm/io.h
> index 16f262322b8f..fb0e8a24c7af 100644
> --- a/arch/nds32/include/asm/io.h
> +++ b/arch/nds32/include/asm/io.h
> @@ -6,6 +6,7 @@
>
>  #include <linux/types.h>
>
> +void __iomem *ioremap(phys_addr_t phys_addr, size_t size);
>  extern void iounmap(volatile void __iomem *addr);
>  #define __raw_writeb __raw_writeb
>  static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
> @@ -80,4 +81,5 @@ static inline u32 __raw_readl(const volatile void __iomem *addr)
>  #define writew(v,c)	({ __iowmb(); writew_relaxed((v),(c)); })
>  #define writel(v,c)	({ __iowmb(); writel_relaxed((v),(c)); })
>  #include <asm-generic/io.h>
> +
>  #endif /* __ASM_NDS32_IO_H */
> diff --git a/arch/sparc/include/asm/io_32.h b/arch/sparc/include/asm/io_32.h
> index df2dc1784673..9a52d9506f80 100644
> --- a/arch/sparc/include/asm/io_32.h
> +++ b/arch/sparc/include/asm/io_32.h
> @@ -127,6 +127,7 @@ static inline void sbus_memcpy_toio(volatile void __iomem *dst,
>   * Bus number may be embedded in the higher bits of the physical address.
>   * This is why we have no bus number argument to ioremap().
>   */
> +void __iomem *ioremap(phys_addr_t offset, size_t size);
>  void iounmap(volatile void __iomem *addr);
>  /* Create a virtual mapping cookie for an IO port range */
>  void __iomem *ioport_map(unsigned long port, unsigned int nr);
> diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
> index a98ed6325727..6a5edc23afe2 100644
> --- a/include/asm-generic/io.h
> +++ b/include/asm-generic/io.h
> @@ -922,28 +922,16 @@ static inline void *phys_to_virt(unsigned long address)
>  /**
>   * DOC: ioremap() and ioremap_*() variants
>   *
> - * If you have an IOMMU your architecture is expected to have both ioremap()
> - * and iounmap() implemented otherwise the asm-generic helpers will provide a
> - * direct mapping.
> + * Architectures with an MMU are expected to provide ioremap() and iounmap()
> + * themselves.  For NOMMU architectures we provide a default nop-op
> + * implementation that expect that the physical address used for MMIO are
> + * already marked as uncached, and can be used as kernel virtual addresses.
>   *
> - * There are ioremap_*() call variants, if you have no IOMMU we naturally will
> - * default to direct mapping for all of them, you can override these defaults.
> - * If you have an IOMMU you are highly encouraged to provide your own
> - * ioremap variant implementation as there currently is no safe architecture
> - * agnostic default. To avoid possible improper behaviour default asm-generic
> - * ioremap_*() variants all return NULL when an IOMMU is available. If you've
> - * defined your own ioremap_*() variant you must then declare your own
> - * ioremap_*() variant as defined to itself to avoid the default NULL return.
> + * ioremap_wc() and ioremap_wt() can provide more relaxed caching attributes
> + * for specific drivers if the architecture choses to implement them.  If they
> + * are not implemented we fall back to plain ioremap.
>   */
>  #ifndef CONFIG_MMU
> -
> -/*
> - * Change "struct page" to physical address.
> - *
> - * This implementation is for the no-MMU case only... if you have an MMU
> - * you'll need to provide your own definitions.
> - */
> -
>  #ifndef ioremap
>  #define ioremap ioremap
>  static inline void __iomem *ioremap(phys_addr_t offset, size_t size)
> @@ -954,14 +942,13 @@ static inline void __iomem *ioremap(phys_addr_t offset, size_t size)
>
>  #ifndef iounmap
>  #define iounmap iounmap
> -
>  static inline void iounmap(void __iomem *addr)
>  {
>  }
>  #endif
>  #endif /* CONFIG_MMU */
> +
>  #ifndef ioremap_nocache
> -void __iomem *ioremap(phys_addr_t phys_addr, size_t size);
>  #define ioremap_nocache ioremap_nocache
>  static inline void __iomem *ioremap_nocache(phys_addr_t offset, size_t size)
>  {

It looks like the difference in prototype between the architectures is between

    void __iomem *ioremap(resource_size_t, size_t)
    void __iomem *ioremap(phys_addr_t, size_t)
    void __iomem *ioremap(phys_addr_t, unsigned long)
    void __iomem *ioremap(unsigned long, unsigned long)

shouldn't they all just be that first one?  In other words, wouldn't it be 
better to always provide the generic ioremap prototype and unify the ports 
instead?

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
