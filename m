Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CFCC4338F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 05:10:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08BBD60EB2
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 05:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08BBD60EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dDry3V8enYFmavCDfXQT6NFwgkmhF26rX3Fhv/UuXI4=; b=16SCxCiWc+Xi+o
	nSfc9SWPTUFh7eEfaFu8EYZYOfpNT2Q/ttnedQrvTzN86oSXGwGyjcpg9BRe+2kss1kzFQJelSYOS
	JOCvk762wTv90vsTtDFDy/D1CFmR8DiMT25YOSpBt+Hgz6ludtPDVdkSDq3TML20WOTlYWTEUUQXr
	C15DRWrpv7nTE/645TmGuCMzADaVDu3ikisClBshPn9YaxkPRpMgwYWmsXLQnX2OjeOJjFFhfhYAS
	I5ckmjUxynEc7y83DcNk1vy1/gDa/toymm7R/yfBBJI6E5IjQfpYeOscTJBju84LP0Rwmr51g5c7/
	hb9XQx8orsOI39dtWKcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDgVv-005bQ4-E7; Wed, 11 Aug 2021 05:10:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDgVq-005bNx-IF
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 05:10:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5407C60F13;
 Wed, 11 Aug 2021 05:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628658645;
 bh=vtfachGX2HaQKQQ+eKZlQAp5s4358iBlM/gx9iFw89w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OJERWMdNw8yHZE+h1TaCX40nXl9dQZAyGGZpl5gu96UEoAWKVdjgejNhWEzy5gLzH
 15qohJQHhwiN54wKVsqipLECWOfF0q6NzoZMx/ZRKUL0vDlq8x6zzwDcxW/p2lwh7L
 WfKEE4ssTF3pnksDYpqK9IVpImgGvI5y7Tt/qbrCZ/U11aQGJm/JsUDYRE2ES2E8M/
 Y69c++lNaezHlR28vjS4gJHLB+NVjIOntCRaWKZm0Am6lXfaGk3Rnuaeprgv2/AoTO
 RGQTO4Sf2jkKietY/D0QLOoynON/zwNW0VFjYIwNp/TIFWslQmgRJLbe8oHRWbAhFi
 jwwC+hTx+1FQw==
Date: Wed, 11 Aug 2021 08:10:40 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Vineet Gupta <vgupta@kernel.com>
Subject: Re: [PATCH 03/18] ARC: mm: move mmu/cache externs out to setup.h
Message-ID: <YRNb0EbPzejXJdax@kernel.org>
References: <20210811004258.138075-1-vgupta@kernel.org>
 <20210811004258.138075-4-vgupta@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210811004258.138075-4-vgupta@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_221046_670093_EA488649 
X-CRM114-Status: GOOD (  13.64  )
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

Hi Vineet,

On Tue, Aug 10, 2021 at 05:42:43PM -0700, Vineet Gupta wrote:
> Signed-off-by: Vineet Gupta <vgupta@kernel.com>

Hmm, this one seems odd. Try https://www.kernel.com/ ;-)

> Signed-off-by: Vineet Gupta <vgupta@kernel.org>
> ---
>  arch/arc/include/asm/cache.h |  4 ----
>  arch/arc/include/asm/mmu.h   |  4 ----
>  arch/arc/include/asm/setup.h | 12 ++++++++++--

A sentence about why these move would have been nice.

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
