Return-Path: <SRS0=90H6=6V=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04472C35280
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 May 2020 22:50:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CADB9208CA
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 May 2020 22:50:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E0up7TcM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CADB9208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OzkP+/vH8KW8JY8Z0IuvSYK5D644n/S59vUktDiEjLI=; b=E0up7TcMgqtjjR
	r9D0U9wSOGX6rWfd210xWbmKrgerNIVJx2FSFBHRpjcXLYIQa4MdbUyRvT2Ff8K2doRMPh+5bb0zX
	A1760WQx7cenG+QswdXEOrC4PB6n364BZVx/DmG194MTz8mmL+GmoOeCISRHCHuyWQY14nXTbGVOQ
	S1th7IbB9mu+eoOcT+PPAFZ6CsDERrvGDkP8HQicnh6ukBbvVmQak6E2CLHsVMv05FSUVGi29I5EU
	y1xiSVYzHsYCz/VwRxkEsU0tXugpYIVQB+S+DcEMRZ+e4QBFm4JTlJ1z3rYvmzka4UG9Zbq9aoOUC
	RXEwuOLHvvzQlrvfTsWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWpLy-0006bg-V6; Thu, 07 May 2020 22:50:54 +0000
Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWpLq-0006Td-Iv; Thu, 07 May 2020 22:50:47 +0000
IronPort-SDR: i9H0+9svt0VH/bF4iwLqq5qgM+Y+JqQw0VhMmzu6o4KmboXGySKCbIojqJMpzUfRojSUcFItFC
 9d+zsiuSQSUA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 15:50:41 -0700
IronPort-SDR: A94YOimG+GBTCtRnotihIHXo/4uYOm9rsXy8xtuLX5Aw2+CVkRWX3diLimU1sfCOXtFd1OcX1r
 bTWfMT7evkVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,365,1583222400"; d="scan'208";a="278753786"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by orsmga002.jf.intel.com with ESMTP; 07 May 2020 15:50:40 -0700
Date: Thu, 7 May 2020 15:50:40 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH V3 13/15] parisc/kmap: Remove duplicate kmap code
Message-ID: <20200507225039.GA1428632@iweiny-DESK2.sc.intel.com>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
 <20200507150004.1423069-14-ira.weiny@intel.com>
 <20200507135258.f430182578c0d63b7488916e@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507135258.f430182578c0d63b7488916e@linux-foundation.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_155046_633903_1EDA0A2B 
X-CRM114-Status: GOOD (  15.28  )
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
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, May 07, 2020 at 01:52:58PM -0700, Andrew Morton wrote:
> On Thu,  7 May 2020 08:00:01 -0700 ira.weiny@intel.com wrote:
> 
> > parisc reimplements the kmap calls except to flush it's dcache.  This is
> > arguably an abuse of kmap but regardless it is messy and confusing.
> > 
> > Remove the duplicate code and have parisc define
> > ARCH_HAS_FLUSH_ON_KUNMAP for a kunmap_flush_on_unmap() architecture
> > specific call to flush the cache.
> 
> checkpatch says:
> 
> ERROR: #define of 'ARCH_HAS_FLUSH_ON_KUNMAP' is wrong - use Kconfig variables or standard guards instead
> #69: FILE: arch/parisc/include/asm/cacheflush.h:103:
> +#define ARCH_HAS_FLUSH_ON_KUNMAP
> 
> which is fair enough, I guess.  More conventional would be
> 
> arch/parisc/include/asm/cacheflush.h:
> 
> static inline void kunmap_flush_on_unmap(void *addr)
> {
> 	...
> }
> #define kunmap_flush_on_unmap kunmap_flush_on_unmap
> 
> 
> include/linux/highmem.h:
> 
> #ifndef kunmap_flush_on_unmap
> static inline void kunmap_flush_on_unmap(void *addr)
> {
> }
> #define kunmap_flush_on_unmap kunmap_flush_on_unmap
> #endif
> 
> 
> static inline void kunmap_atomic_high(void *addr)
> {
> 	/* Mostly nothing to do in the CONFIG_HIGHMEM=n case as kunmap_atomic()
> 	 * handles re-enabling faults + preemption */
> 	kunmap_flush_on_unmap(addr);
> }
> 
> 
> but I don't really think it's worth bothering changing it.	
> 
> (Ditto patch 3/15)

Yes I was following the pattern already there.

I'll fix up the last patch now.
Ira


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
