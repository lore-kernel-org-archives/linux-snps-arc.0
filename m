Return-Path: <SRS0=FD3D=6L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F92C55194
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Apr 2020 01:16:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7611206A5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Apr 2020 01:16:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="evBFms6C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7611206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3CeKDhEDHOyB5BA7oa5aHfSB+y8gWm7sh4fH5dm8xDE=; b=evBFms6CUr5RZV
	rEuplglFdixF7j4YbZ6b7uszpfKH+AApAf7p/AVaWXUhwfdv0RKq/rLvptkbeQvVVGMMuy0fdpHCA
	CIbnZ/iTw55nsEpbndc1zNiVlWOM7Dw4pNua5/vHhWebO8jt7bXSB4El09dBnVnqZVu6zcvJIAAcv
	jcz+MpIfxUr8nUD54khZU/Ig43EN7lTgfZitltAWcVnSC1P06ctvK1mMP8Q+ySBim30SHy8hfXLnD
	DrZgphHqYYxGM+/M4rg4ApDeXyrLe/EGzwuv+AF0ZPorUn7/82mvUcLZiEfl5+Uj6P/a5KA2F8vqZ
	ZoJOXo58YyjC0gVPPFhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSsO4-0002Ae-NN; Mon, 27 Apr 2020 01:16:44 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSsNt-00021H-M7; Mon, 27 Apr 2020 01:16:34 +0000
IronPort-SDR: GtZnPIvnslehHayv/h2HVm0AS9fLTLiuRFwUwpifzSPmRD3onFg3I4Xeh8wVCfIBwwuWkebA4S
 x89JadaHrGbQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2020 18:16:31 -0700
IronPort-SDR: ZrrKsQ6Zur3/bE2CO6sc6Wdv34dqrhqrjSlpkUGUwoboNwAHWFqd68hpZ33zjqX/g7EQHldNW4
 L627f0bj0fUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,321,1583222400"; d="scan'208";a="336090274"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by orsmga001.jf.intel.com with ESMTP; 26 Apr 2020 18:16:31 -0700
Date: Sun, 26 Apr 2020 18:16:30 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 4/5] arch/kmap_atomic: Consolidate duplicate code
Message-ID: <20200427011630.GC135929@iweiny-DESK2.sc.intel.com>
References: <20200426055406.134198-1-ira.weiny@intel.com>
 <20200426055406.134198-5-ira.weiny@intel.com>
 <20200426072642.GB22024@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200426072642.GB22024@infradead.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200426_181633_785144_5623C97F 
X-CRM114-Status: GOOD (  15.86  )
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

On Sun, Apr 26, 2020 at 12:26:42AM -0700, Christoph Hellwig wrote:
> > diff --git a/arch/arc/mm/highmem.c b/arch/arc/mm/highmem.c
> > index 4db13a6b9f3b..1cae4b911a33 100644
> > --- a/arch/arc/mm/highmem.c
> > +++ b/arch/arc/mm/highmem.c
> > @@ -53,11 +53,10 @@ void *kmap_atomic(struct page *page)
> >  {
> >  	int idx, cpu_idx;
> >  	unsigned long vaddr;
> > +	void *addr = kmap_atomic_fast(page);
> >  
> > -	preempt_disable();
> > -	pagefault_disable();
> > -	if (!PageHighMem(page))
> > -		return page_address(page);
> > +	if (addr)
> > +		return addr;
> 
> Wouldn't it make sense to just move kmap_atomic itelf to common code,
> and call out to a kmap_atomic_high for the highmem case, following the
> scheme in kmap?
>

Sure I do like that symmetry between the calls.

>
> Same for the unmap side.

FWIW that would simply be renaming  __kunmap_atomic() to kunmap_atomic_high()

>
> That might require to support
> kmap_atomic_prot everywhere first, which sounds like a really good
> idea anyway, and would avoid the need for strange workaround in drm.

Having a kmap_atomic_prot() seems like a good idea.  But I'm not exactly sure
why CONFIG_x86 is being called out specifically in the DRM code?

Ira


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
