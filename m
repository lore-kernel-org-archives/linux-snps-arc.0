Return-Path: <SRS0=I7CJ=6U=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B266BC4725B
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 May 2020 06:11:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89A5F206E6
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 May 2020 06:11:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N3HqaE+v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89A5F206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTISyzvWeT7pDdOWPs4QTmXe0d0Mt+P+jnqHJJb0KNM=; b=N3HqaE+v1FQlin
	NRq+d5iqjrauYCtjYXpUWcFuIktIf52CGguki000jNQEtbzn6JOMsiBlIIqbfVEk3i+TA/bj+qvQe
	mYiDkxfsBUC2WQlIdUSTeXBSJLjyWuivZZ+ZTxDYiZ1yg/MMN1pIdH/g9WYHLFqTvFntoCWtvYOKM
	4P6HTmmD5Onl5ZP2wAlcXHx4oj4v7GqfN/eKALB96r0rslcYTGIitU2hlpjv/+F4h4qQvNAzhLrKN
	ePy6FAsj2OI0L+p5Iz/C7qt6JxgUKRCylzn/x+G4kbVfB9Rt6nrpB81dWerS+GNhutr9tl6/6NeNN
	Cw7iVqBBtPrxpfcjGzHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWDH7-0003zk-9S; Wed, 06 May 2020 06:11:21 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jWDGz-0003zA-SZ; Wed, 06 May 2020 06:11:13 +0000
Date: Tue, 5 May 2020 23:11:13 -0700
From: Christoph Hellwig <hch@infradead.org>
To: ira.weiny@intel.com
Subject: Re: [PATCH V2 05/11] {x86,powerpc,microblaze}/kmap: Move preempt
 disable
Message-ID: <20200506061113.GA5192@infradead.org>
References: <20200504010912.982044-1-ira.weiny@intel.com>
 <20200504010912.982044-6-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504010912.982044-6-ira.weiny@intel.com>
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
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Huang Rui <ray.huang@amd.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sun, May 03, 2020 at 06:09:06PM -0700, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> During this kmap() conversion series we must maintain bisect-ability.
> To do this, kmap_atomic_prot() in x86, powerpc, and microblaze need to
> remain functional.
> 
> Create a temporary inline version of kmap_atomic_prot within these
> architectures so we can rework their kmap_atomic() calls and then lift
> kmap_atomic_prot() to the core.
> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> 
> ---
> Changes from V1:
> 	New patch
> ---
>  arch/microblaze/include/asm/highmem.h | 11 ++++++++++-
>  arch/microblaze/mm/highmem.c          | 10 ++--------
>  arch/powerpc/include/asm/highmem.h    | 11 ++++++++++-
>  arch/powerpc/mm/highmem.c             |  9 ++-------
>  arch/x86/include/asm/highmem.h        | 11 ++++++++++-
>  arch/x86/mm/highmem_32.c              | 10 ++--------
>  6 files changed, 36 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/microblaze/include/asm/highmem.h b/arch/microblaze/include/asm/highmem.h
> index 0c94046f2d58..ec9954b091e1 100644
> --- a/arch/microblaze/include/asm/highmem.h
> +++ b/arch/microblaze/include/asm/highmem.h
> @@ -51,7 +51,16 @@ extern pte_t *pkmap_page_table;
>  #define PKMAP_NR(virt)  ((virt - PKMAP_BASE) >> PAGE_SHIFT)
>  #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
>  
> -extern void *kmap_atomic_prot(struct page *page, pgprot_t prot);
> +extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
> +void *kmap_atomic_prot(struct page *page, pgprot_t prot)

Shouldn't this be marked inline?

The rest looks fine:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
