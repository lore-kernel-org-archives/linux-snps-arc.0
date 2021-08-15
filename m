Return-Path: <SRS0=vffI=NG=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B5C8C4338F
	for <linux-snps-arc@archiver.kernel.org>; Sun, 15 Aug 2021 09:27:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66C2161055
	for <linux-snps-arc@archiver.kernel.org>; Sun, 15 Aug 2021 09:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66C2161055
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0+9P1QeeWxGwp4aw2MOyRUkRh11qPTdphKbWPWkZwhM=; b=jsLJq6RcTk+uu0
	pczoMeEIIzeZf9ckOwSYWxrM2JEpHMde/5GDuZkEvO9OVPvxjj4FqHq/i68j15O/f8UPE9+PLbzgb
	k5MKPSk3/AFSH+O9OyjLMtpAJKI4oIFTVoNIHLjpelh87S93MuIQn99bS2OjYkFiwFPhp5ehZku7H
	FntIA8wdNrW52PDcUNo2rGvw8H5F0QvENXhKXhNL3S7wUxcorfyor+nCSa59ccDwcx70AQFJSkarU
	r3OtTsn58Ehn/mLL87DoNFdTygGQ2XJlH56qK02pDvbMuSgcvxF+yYiS4ISn6mpDlOY5RvA07PR0m
	Y0frU/yL7sWBOCgMDSZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFCQQ-00F5Fl-VA; Sun, 15 Aug 2021 09:27:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFCQM-00F5Ew-Iq
 for linux-snps-arc@lists.infradead.org; Sun, 15 Aug 2021 09:27:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54BF46103A;
 Sun, 15 Aug 2021 09:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629019642;
 bh=kG7sdjv8Xebyv1dx5maeuD75cSbcDGYH+hqi9y6/364=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YFvSpmxSebMX1t4jZN1hEjPJ2aQbX7E2ETFJk0tgXJYpFklEh4+DleDUaMeYJt4DG
 TJ/5NFVFjGBF+OXCrt/ZpTxAGrqeOuH4Fu0KVgF6IdgpncNm9Tg1aZ3bSVBylng0mj
 tyMCvojzneVU3rl3//tdXao3SlqBNNnhZJ91YghWquO42CNxemDptiwJ6w3wZQ6h0u
 y+sJ3/nddhXJPe9UVFv+hsh6NHEaPuDxy2ea6eBYAU2vV+Zw5yMHeABBE5OjF/nont
 zI0qJ3HrVAq3JRqwvsSa38Jli4RLjghk6PWMLk/Cj3o01vzJcWwzYN78Acb45v2j0s
 OqZYJl/3m55vg==
Date: Sun, 15 Aug 2021 12:27:16 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v2 03/19] ARC: mm: move mmu/cache externs out to setup.h
Message-ID: <YRjd9FO37fVZyV5V@kernel.org>
References: <20210812233753.104217-1-vgupta@kernel.org>
 <20210812233753.104217-4-vgupta@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210812233753.104217-4-vgupta@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_022722_681058_38DAC13B 
X-CRM114-Status: GOOD (  14.49  )
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

Heh, 

"Don't pollute mmu.h and cache.h with some of ARC internal bootlog/setup
related functions.
move them aside to setup.h"

is still not there :)

On Thu, Aug 12, 2021 at 04:37:37PM -0700, Vineet Gupta wrote:
> Signed-off-by: Vineet Gupta <vgupta@kernel.org>
> ---
>  arch/arc/include/asm/cache.h |  4 ----
>  arch/arc/include/asm/mmu.h   |  4 ----
>  arch/arc/include/asm/setup.h | 12 ++++++++++--
>  3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arc/include/asm/cache.h b/arch/arc/include/asm/cache.h
> index d8ece4292388..f0f1fc5d62b6 100644
> --- a/arch/arc/include/asm/cache.h
> +++ b/arch/arc/include/asm/cache.h
> @@ -62,10 +62,6 @@
>  #define ARCH_SLAB_MINALIGN	8
>  #endif
>  
> -extern void arc_cache_init(void);
> -extern char *arc_cache_mumbojumbo(int cpu_id, char *buf, int len);
> -extern void read_decode_cache_bcr(void);
> -
>  extern int ioc_enable;
>  extern unsigned long perip_base, perip_end;
>  
> diff --git a/arch/arc/include/asm/mmu.h b/arch/arc/include/asm/mmu.h
> index 38a036508699..762cfe66e16b 100644
> --- a/arch/arc/include/asm/mmu.h
> +++ b/arch/arc/include/asm/mmu.h
> @@ -64,10 +64,6 @@ typedef struct {
>  	unsigned long asid[NR_CPUS];	/* 8 bit MMU PID + Generation cycle */
>  } mm_context_t;
>  
> -void arc_mmu_init(void);
> -extern char *arc_mmu_mumbojumbo(int cpu_id, char *buf, int len);
> -void read_decode_mmu_bcr(void);
> -
>  static inline int is_pae40_enabled(void)
>  {
>  	return IS_ENABLED(CONFIG_ARC_HAS_PAE40);
> diff --git a/arch/arc/include/asm/setup.h b/arch/arc/include/asm/setup.h
> index 01f85478170d..028a8cf76206 100644
> --- a/arch/arc/include/asm/setup.h
> +++ b/arch/arc/include/asm/setup.h
> @@ -2,8 +2,8 @@
>  /*
>   * Copyright (C) 2004, 2007-2010, 2011-2012 Synopsys, Inc. (www.synopsys.com)
>   */
> -#ifndef __ASMARC_SETUP_H
> -#define __ASMARC_SETUP_H
> +#ifndef __ASM_ARC_SETUP_H
> +#define __ASM_ARC_SETUP_H
>  
>  
>  #include <linux/types.h>
> @@ -34,4 +34,12 @@ long __init arc_get_mem_sz(void);
>  #define IS_AVAIL2(v, s, cfg)	IS_AVAIL1(v, s), IS_AVAIL1(v, IS_USED_CFG(cfg))
>  #define IS_AVAIL3(v, v2, s)	IS_AVAIL1(v, s), IS_AVAIL1(v, IS_DISABLED_RUN(v2))
>  
> +extern void arc_mmu_init(void);
> +extern char *arc_mmu_mumbojumbo(int cpu_id, char *buf, int len);
> +extern void read_decode_mmu_bcr(void);
> +
> +extern void arc_cache_init(void);
> +extern char *arc_cache_mumbojumbo(int cpu_id, char *buf, int len);
> +extern void read_decode_cache_bcr(void);
> +
>  #endif /* __ASMARC_SETUP_H */
> -- 
> 2.25.1
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
