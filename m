Return-Path: <SRS0=eli2=EF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 757B7C4363A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 13:06:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61FEA206FA
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 13:06:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oq+g/KTk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JKDGOHNW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61FEA206FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WjI+tWzKJi20/av94j5E61R8QjhM1SMb1QfxPMoajuE=; b=Oq+g/KTkWrSffUrkH4JmGxmBe
	F2SF3inXe5crTpBMwebekivjFAAni80pGK1u81Kf/GcNQjF0aTQ4I1A9J+JQCpXTCm2ePKgLUftJH
	GxTxfry9HdicshhHFtcgSaS+YS8yWQK3wnNApBxS5BF3t76dnLhj4mUDgoGByKTqifEB4jdx9L8I2
	2Fmd12eZr5Xv3meW759MY9VGtgIAQQ0RHmUI3UINbyyu1iCZuTRv/gnz92uq1QjQrnmMG/9SgKhJ9
	rdXPXNF8s5WSKSD3MD5hYcVq+T5QZWJwo+kbGpAMRYOp54vYTfTZNYHnXmNQWErGRGyzNDfnap/je
	Hhv579Egg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYU77-0006u3-Cp; Fri, 30 Oct 2020 13:06:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYU75-0006tE-Ir; Fri, 30 Oct 2020 13:06:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=rfcpHo3sYbHG9663+/oEKU5+yDacWVNSfCtmxqY30IA=; b=JKDGOHNWU/V8Y+2rs/k7xDcd+D
 ywFaOKdh66CG7CRxohaMqHaFLXYS9D8UEmY4cTPadxISCv3CHKX+79wCldI0LV8nLjJimNpRjUFot
 BbcFgkfMoOoVVqbSn6at/tUwkE3W4TeiBSkn85uGjZxEhlxcEUEn86bKSTG6W3x+/e6w76iTiIDMo
 +S7YG45wv9UKO0gFrKbYfO0n5SfTbF1pG2kSlc2FKZXNaKU1XoICbQHjohPVjgTGHFNPIe1Xmtc6u
 jm1U+Hxe5+XhivRe6Qrj/AgJuMiGDjrS/uMW8LgIirsxF3LkwsBxbZgQIkCutkdRTk0XP+Op+X95w
 kA9B9H+g==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kYU6t-0002Yw-HM; Fri, 30 Oct 2020 13:06:27 +0000
Date: Fri, 30 Oct 2020 13:06:27 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic
 & friends
Message-ID: <20201030130627.GI27442@casper.infradead.org>
References: <20201029221806.189523375@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201029221806.189523375@linutronix.de>
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

On Thu, Oct 29, 2020 at 11:18:06PM +0100, Thomas Gleixner wrote:
> This series provides kmap_local.* iomap_local variants which only disable
> migration to keep the virtual mapping address stable accross preemption,
> but do neither disable pagefaults nor preemption. The new functions can be
> used in any context, but if used in atomic context the caller has to take
> care of eventually disabling pagefaults.

Could I ask for a CONFIG_KMAP_DEBUG which aliases all the kmap variants
to vmap()?  I think we currently have a problem in iov_iter on HIGHMEM
configs:

copy_page_to_iter() calls page_copy_sane() which checks:

        head = compound_head(page);
        if (likely(n <= v && v <= page_size(head)))
                return true;

but then:

                void *kaddr = kmap_atomic(page);
                size_t wanted = copy_to_iter(kaddr + offset, bytes, i);
                kunmap_atomic(kaddr);

so if offset to offset+bytes is larger than PAGE_SIZE, this is going to
work for lowmem pages and fail miserably for highmem pages.  I suggest
vmap() because vmap has a PAGE_SIZE gap between each allocation.

Alternatively if we could have a kmap_atomic_compound(), that would
be awesome, but probably not realistic to implement.  I've more
or less resigned myself to having to map things one page at a time.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
