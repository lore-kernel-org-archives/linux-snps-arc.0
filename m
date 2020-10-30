Return-Path: <SRS0=eli2=EF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A355C00A89
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 19:35:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B045822242
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 19:35:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mAl9XVkY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="db633F26";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="il7YKHja"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B045822242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vvU14yufuEY2SN3tUSha4SjqHUIuPSQAJsYzfjeiTlg=; b=mAl9XVkYnXhHpf5wmZTpvmDaf
	3F3x8aUGD/KCQY9kZg1OwEYEQgkVBCabrapk1FakqLIZ1V7ZL5lSNgZUyVN1UlzjhgEVdsjytQPFV
	PFgXD51lEZulWnGh+TH8vUvSvUNsDJheGeSW0PT6NqbDC0b62OrSAzUJvsECz9xSn1jvFT4HqS+eS
	oGWIzaSUHDhO1us+K2jY6zN4zyW5u72PlE31loohe05ZTR9VnXWc8325/pkpG7ffJGI2fEpKahcYy
	mnJgsKBagwuibo9PPMHIy4HXfrftf7FWMFUtndLh+mWpkASxuAIk4rBJqV032qHJFbul9IvJeDDXk
	osAaFxY9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYaBO-0005SY-Jr; Fri, 30 Oct 2020 19:35:30 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYaBF-0005Oe-8u; Fri, 30 Oct 2020 19:35:22 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604086519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KjnQMCzBdzGXaCOpmbjT8Ur9FZq3y7opRBflIXIldZw=;
 b=db633F26JvpFY6g0OD9+HbOB2bGDkf74GvzdnzaI3Jackio3Pxmuc4jaTjmmTn0rWAIpK+
 FwvojioAnGZiiH15k8FN/MiA2IKJM2U7IeHO0IsBZqBGgEsd8kwilqueFED/GNpoidpnzO
 yy2TxOvoKUkHNkNBXz892WSrXAjSj1bek74dJCnwm2fooU7rVOQjFed7q+Vvsmw9zNfHs4
 G2wInIc2Xh8w8e1+gsfiziPOVyn2tk/4xzLJndeycG1E0X5k3bHmibgmZZcOeJXy9ENlqt
 1WjhiLEbUG/fvEPPOJsLp5CaNR4eEbW+SMl/VHUu0cW+yWNLKzRpz7CwuUxChg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604086519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KjnQMCzBdzGXaCOpmbjT8Ur9FZq3y7opRBflIXIldZw=;
 b=il7YKHjaiUFmDOQKgI3UCsxgkMmYaTjOnYVZzaPy8He727Hr6NRROPSIn6WIMwC/jiW6Jw
 nlMa3TiG03b3UjDQ==
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic &
 friends
In-Reply-To: <20201030130627.GI27442@casper.infradead.org>
References: <20201029221806.189523375@linutronix.de>
 <20201030130627.GI27442@casper.infradead.org>
Date: Fri, 30 Oct 2020 20:35:18 +0100
Message-ID: <87k0v7mrrd.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_153521_480595_4E609D7D 
X-CRM114-Status: GOOD (  20.94  )
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-xtensa@linux-xtensa.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, linux-mm@kvack.org,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 linux-arch@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, David Airlie <airlied@linux.ie>,
 Mel Gorman <mgorman@suse.de>, linux-snps-arc@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>, Paul McKenney <paulmck@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Greentime Hu <green.hu@gmail.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, Oct 30 2020 at 13:06, Matthew Wilcox wrote:
> On Thu, Oct 29, 2020 at 11:18:06PM +0100, Thomas Gleixner wrote:
>> This series provides kmap_local.* iomap_local variants which only disable
>> migration to keep the virtual mapping address stable accross preemption,
>> but do neither disable pagefaults nor preemption. The new functions can be
>> used in any context, but if used in atomic context the caller has to take
>> care of eventually disabling pagefaults.
>
> Could I ask for a CONFIG_KMAP_DEBUG which aliases all the kmap variants
> to vmap()?  I think we currently have a problem in iov_iter on HIGHMEM
> configs:

For kmap() that would work, but for kmap_atomic() not so much when it is
called in non-preemptible context because vmap() might sleep.

> copy_page_to_iter() calls page_copy_sane() which checks:
>
>         head = compound_head(page);
>         if (likely(n <= v && v <= page_size(head)))
>                 return true;
>
> but then:
>
>                 void *kaddr = kmap_atomic(page);
>                 size_t wanted = copy_to_iter(kaddr + offset, bytes, i);
>                 kunmap_atomic(kaddr);
>
> so if offset to offset+bytes is larger than PAGE_SIZE, this is going to
> work for lowmem pages and fail miserably for highmem pages.  I suggest
> vmap() because vmap has a PAGE_SIZE gap between each allocation.

On 32bit highmem the kmap_atomic() case is easy: Double the number of
mapping slots and only use every second one, which gives you a guard
page between the maps.

For 64bit we could do something ugly: Enable the highmem kmap_atomic()
crud and enforce an alias mapping (at least on the architectures where
this is reasonable). Then you get the same as for 32bit.

> Alternatively if we could have a kmap_atomic_compound(), that would
> be awesome, but probably not realistic to implement.  I've more
> or less resigned myself to having to map things one page at a time.

That might be horribly awesome on 32bit :)

Thanks,

        tglx

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
