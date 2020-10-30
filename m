Return-Path: <SRS0=eli2=EF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF662C4741F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 09:39:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7273820724
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 09:39:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i75Y9u8q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ijhg5aiO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="irizuuQY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7273820724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5hcYgGQZwp3GLSteMVa2qxyYveprRBhNPf5UGqpLDV0=; b=i75Y9u8qfC8xkaM/2Ml+utRgt
	9Ov839NIsuLI3w4uTJT4frv2FSzRtMBmrOzOHCSS2eRmSd2aO0TjHwj+eH2OGfWCJYWr0qgVa9SYK
	WV3Tz6Oc1gROwsApOXmpRf5bXEb/0kChahybZ3W3P5Rf6SgeDHo5KmjH2p1Kvl2i8o0DPxiS3+jQL
	ZX5Ahz2ABv9JLwB1/oH9trNRsOHk17g27jzoU2KjP0AvFLM8y+QgmSzAFuzkly8kAoiD29xH8ZBl1
	JjBERGw2Dp+eDAW/J0DgIniiNTqsCJTyNRtxGAgU9TN1RP0CabV2nqpwQXq2WyyPO9JBI/mLMKxWZ
	iok75dPyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYQsS-0003Ha-GW; Fri, 30 Oct 2020 09:39:20 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYQsL-0003En-Ey; Fri, 30 Oct 2020 09:39:14 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604050752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EWXvaZJ4n33nUPpVqCcdjcDSYO5R/m7YAVCZo4qnz/w=;
 b=Ijhg5aiOMjBRx5rip6SYYGDFE2m3YLjbUBNKk+3NGBAB4R2XV1b2EqqlklIKhs9UUNQWQk
 z/BOQowWvycG+wd7WP6RDL8dKFwe1UJ0MqD2fe1iCRjFdXzP4PF0WPpHnySjM4mSn8TEDZ
 +rgRtwXuNFbgN3K9VuqJ5Qlvu3gg80bUbRb6nNMR+/JhtI3yWewHHZND9q4GfI+B5nak5E
 Txo5XRuNfIVvWuFUn8S5xduuQjkyrzj/pylK3pN+rsWG4as9auyvNfq1rB+V6+q9oD9RYg
 uWDVVgapgL3toLNiaXgwAR/Xo8x02IWniqNGp0tW1Ptti3gNq/7xKk1DGerynA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604050752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EWXvaZJ4n33nUPpVqCcdjcDSYO5R/m7YAVCZo4qnz/w=;
 b=irizuuQYfZdKA41k2RTCVBIm8nOzrSmQrzmbTW+9NWSzofxsL3XYrjHU85eqQdOWzHFOzN
 nZb9SEwnLnGs5ZBQ==
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic &
 friends
In-Reply-To: <87pn50ob0s.fsf@nanos.tec.linutronix.de>
References: <20201029221806.189523375@linutronix.de>
 <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
 <87pn50ob0s.fsf@nanos.tec.linutronix.de>
Date: Fri, 30 Oct 2020 10:39:11 +0100
Message-ID: <87blgknjcw.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_053913_649590_8E29C525 
X-CRM114-Status: GOOD (  15.43  )
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
 Ben Segall <bsegall@google.com>, Linux-MM <linux-mm@kvack.org>,
 Guo Ren <guoren@kernel.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Vincent Chen <deanbo422@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, David Airlie <airlied@linux.ie>,
 Mel Gorman <mgorman@suse.de>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Ard Biesheuvel <ardb@kernel.org>, Paul McKenney <paulmck@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>, Greentime Hu <green.hu@gmail.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, "David
 S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, Oct 30 2020 at 00:41, Thomas Gleixner wrote:
> On Thu, Oct 29 2020 at 16:11, Linus Torvalds wrote:
> No, you're not misreading it, but doing it conditionally would be a
> complete semantical disaster. kmap_atomic*() also disables preemption
> and pagefaults unconditionaly.  If that wouldn't be the case then every
> caller would have to have conditionals like 'if (CONFIG_HIGHMEM)' or
> worse 'if (PageHighMem(page)'.
>
> Let's not go there.
>
> Migrate disable is a less horrible plague than preempt and pagefault
> disable even if the scheduler people disagree due to the lack of theory
> backing that up :)
>
> The charm of the new interface is that users still can rely on per
> cpuness independent of being on a highmem plagued system. For non
> highmem systems the extra migrate disable/enable is really a minor
> nuissance.

thinking about it some more after having sleep and coffee, we actually
could hide the migrate disable in the actual highmem part.

But then we really should not name it kmap_local. 'local' suggests
locality, think local_irq*, local_bh* ... kmap_task would be more
accurate then.

Toughts?

        tglx

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
