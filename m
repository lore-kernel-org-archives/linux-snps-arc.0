Return-Path: <SRS0=/NyP=C6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1E6C43464
	for <linux-snps-arc@archiver.kernel.org>; Mon, 21 Sep 2020 06:28:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F58F20739
	for <linux-snps-arc@archiver.kernel.org>; Mon, 21 Sep 2020 06:28:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F45dAzpU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eHeD509S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F58F20739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HNlRSYAJzhGMDf459ohpzpFqHnARirP1rcg/yAIEBjA=; b=F45dAzpUnjmpbQLcOuHAT+vDb
	m9oM/vCGi0qAFaBt7fFD69ai1ZEa9jvaOvfeKdLAHmJqApM8UN3hFm7qPYK5kZ3lydQN6MPLR9vN2
	wW1XKsfsBkEAvzar8k8IHHY8u/d3Td4ydK9oZUif5Bxti3xtYDRptP+NAi0scLoxVGxGYcnqYG2+5
	XiB1HleJzrHN/wmReb6qZ38BQvAt0HsYUcctUknbYCuce2ekQu/RACni6fyIsDhFp4hUVrF+0B12B
	z/AKENs4zPQlWq5Q6o0KbekUgb/hhV1MKzBxfB0y7bYR+Ym4CgdPUt1ZuOhWclmWzvqMaACVNfV/X
	ZpeMIHL4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKFJR-0007MZ-IG; Mon, 21 Sep 2020 06:28:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKFJG-0007Gg-4o; Mon, 21 Sep 2020 06:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Tci2tqg3leIbmrKKmdytiLIb3svt+yq3AUhipK0JnoY=; b=eHeD509SDxyAiHGiTwo9U9RK6O
 BdV0ol0+bUl0JcuR4cH5K4iJppCvrjMC+FXmd1lF9otzHdHbgaqWCPBbYEVccspM4hNb0ELFrDX41
 s330N9PwkKFmY1+L4xtZqC6TuuZXPpHTsXwNy2mxRh6hHZxeOvX7QA3hIrIh11xqjXXtgY0KOrH1g
 TAa/FH4UUQzLwOqDXwmFk20iXdkTE1C5bNJ47X+kA8GBuFsMKdIwnr8VE2F05aYZUn3BWrCVUA/8S
 mbIk+BpzsIVAf7vJcwgjD0vdvWTXz3H9YwI8DG/vud/142FwM17JAPgxfqgTAucNSaDR8ooXWbNYe
 L6UrCpkA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kKFJD-0000eG-TH; Mon, 21 Sep 2020 06:28:19 +0000
Date: Mon, 21 Sep 2020 07:28:19 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch RFC 02/15] highmem: Provide generic variant of kmap_atomic*
Message-ID: <20200921062819.GB32081@infradead.org>
References: <20200919091751.011116649@linutronix.de>
 <20200919092615.990731525@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200919092615.990731525@linutronix.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch@vger.kernel.org,
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
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

> +# ifndef ARCH_NEEDS_KMAP_HIGH_GET
> +static inline void *arch_kmap_temporary_high_get(struct page *page)
> +{
> +	return NULL;
> +}
> +# endif

Turn this into a macro and use #ifndef on the symbol name?

> +static inline void __kunmap_atomic(void *addr)
> +{
> +	kumap_atomic_indexed(addr);
> +}
> +
> +
> +#endif /* CONFIG_KMAP_ATOMIC_GENERIC */

Stange double empty line above the endif.

> -#define kunmap_atomic(addr)                                     \
> -do {                                                            \
> -	BUILD_BUG_ON(__same_type((addr), struct page *));       \
> -	kunmap_atomic_high(addr);                                  \
> -	pagefault_enable();                                     \
> -	preempt_enable();                                       \
> -} while (0)
> -
> +#define kunmap_atomic(addr)						\
> +	do {								\
> +		BUILD_BUG_ON(__same_type((addr), struct page *));	\
> +		__kunmap_atomic(addr);					\
> +		preempt_enable();					\
> +	} while (0)

Why the strange re-indent to a form that is much less common and less
readable?

> +void *kmap_atomic_pfn_prot(unsigned long pfn, pgprot_t prot)
> +{
> +	pagefault_disable();
> +	return __kmap_atomic_pfn_prot(pfn, prot);
> +}
> +EXPORT_SYMBOL(kmap_atomic_pfn_prot);

The existing kmap_atomic_pfn & co implementation is EXPORT_SYMBOL_GPL,
and this stuff should preferably stay that way.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
