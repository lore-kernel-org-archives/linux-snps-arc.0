Return-Path: <SRS0=h8bZ=6K=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F201EC55191
	for <linux-snps-arc@archiver.kernel.org>; Sun, 26 Apr 2020 07:26:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C15302084D
	for <linux-snps-arc@archiver.kernel.org>; Sun, 26 Apr 2020 07:26:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E6UTxZ8E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C15302084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OENs1M/tg4vHJBZS1yEvCCt4ahpwb3vA/XGM2WMOEE8=; b=E6UTxZ8EAW9Reu
	cc96RjJu1fFUIWYTTUIQXfj10zffSgfobIup/pG9y+q8V7JI+fm/vzqpXEZTysIGl+7FYSiueHKPG
	z42TLAR+tCdiU8v7zF3zhP9RD1Zshc+0I1QsQlCzrDA7yAct0spQI9Cm6VEheQS4IyfBbsfW7in86
	1f2tfnnUZi2NmHgkwyDWWkU8m53HlpqS8nPE3RefojGfZvDsk9aMiGd0eXZgznBIj2BsWm5yn4B8M
	IIX4j0NfIjovKwkose8XiL7WxJRGJjCHt07Qzoq48kmHidFjtE8wqsqPlyhNweRt4MBY/wDbJtg84
	o3CnJINY0K5NiL3aTY2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSbga-00048e-CD; Sun, 26 Apr 2020 07:26:44 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jSbgY-00048J-Cx; Sun, 26 Apr 2020 07:26:42 +0000
Date: Sun, 26 Apr 2020 00:26:42 -0700
From: Christoph Hellwig <hch@infradead.org>
To: ira.weiny@intel.com
Subject: Re: [PATCH 4/5] arch/kmap_atomic: Consolidate duplicate code
Message-ID: <20200426072642.GB22024@infradead.org>
References: <20200426055406.134198-1-ira.weiny@intel.com>
 <20200426055406.134198-5-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200426055406.134198-5-ira.weiny@intel.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

> diff --git a/arch/arc/mm/highmem.c b/arch/arc/mm/highmem.c
> index 4db13a6b9f3b..1cae4b911a33 100644
> --- a/arch/arc/mm/highmem.c
> +++ b/arch/arc/mm/highmem.c
> @@ -53,11 +53,10 @@ void *kmap_atomic(struct page *page)
>  {
>  	int idx, cpu_idx;
>  	unsigned long vaddr;
> +	void *addr = kmap_atomic_fast(page);
>  
> -	preempt_disable();
> -	pagefault_disable();
> -	if (!PageHighMem(page))
> -		return page_address(page);
> +	if (addr)
> +		return addr;

Wouldn't it make sense to just move kmap_atomic itelf to common code,
and call out to a kmap_atomic_high for the highmem case, following the
scheme in kmap?  Same for the unmap side.  That might require to support
kmap_atomic_prot everywhere first, which sounds like a really good
idea anyway, and would avoid the need for strange workaround in drm.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
