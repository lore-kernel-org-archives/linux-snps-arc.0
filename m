Return-Path: <SRS0=iBOu=C5=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A751C43465
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Sep 2020 17:40:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC6CE20829
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Sep 2020 17:40:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UcIV7+X5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QNCArf/v";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pomJJyR0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC6CE20829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sEJ52QI4bcD44qhH8JyywdxxtHQEaevhf6h+zsCqa38=; b=UcIV7+X5OAHDorIa3Kx625uw2
	uNnmKr0khCRF0V8WebMw72tQCgp6BySl7Bxnywmc91uEJGvjA4VTK9GKgut+yOJ1YyBeM5MCbERu2
	iMTzM++oh3Bapovxu5ytXYFjLSqUzmTwfHaU0UTcC7IjCJYteNGSHwP6LQo4mBuFbnOV7+pmFKSi4
	TaOvSdnjh/2QTsvcl3PgtTGH9iwY5HPn2MHykvmQiwtavxeu4MwaE1NjYuQ6fZayQdeEeYl74Hj88
	0TrzB8a52NKBMc3O4h2hBCTg8dBGgasmifuTT2pZU8HkovfEm1K1gL3rOp63p0gCZrNkiOSV+6XQv
	vQO8ezXyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kK3KR-0007Uh-RE; Sun, 20 Sep 2020 17:40:47 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kK3KN-0007TL-Rp; Sun, 20 Sep 2020 17:40:45 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600623642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9ka0n+28OJXKPQLIVVR5Idhk3egkf6ni8LHSNLSNto8=;
 b=QNCArf/vGifXO0hggd/oZT3co789XMX68FBpCZc9ELpUzjSb976p4qnrJXsUs4Wtn54Oe5
 cREp7rnAnzQ2lkpB3S51Szog5eqcRviWtdYmN6anOoL9fmTtcQqDtDSWpVqORSo+xe9eNI
 ov8P0XhtU/ulbV28ywMlU0xr6kjRfIcVtmCVZ2FKw+DGK6aL/ezJuFiklF8NhXvAMiIh49
 yrsZFHHw6uzr03zNYpu3ftPmTuZ7RyM2m1FWCRDFflQbJ/wuC7iq3YbPgWy/7QFdvivYSQ
 /Lqxr0wjpHyMFoiBEk4JJ16r2HL2cAu9GKsxBmw9WWw39VkpbDCGdel1jZCIGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600623642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9ka0n+28OJXKPQLIVVR5Idhk3egkf6ni8LHSNLSNto8=;
 b=pomJJyR0iiUjZA6jjfbK7rYJBQcHpFL04sHLhdkrrobwFUG9h3ONNeKC4FHSzSIeasL6F6
 5LIRCzwKaerEOICg==
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
In-Reply-To: <CAHk-=wgbmwsTOKs23Z=71EBTrULoeaH2U3TNqT2atHEWvkBKdw@mail.gmail.com>
References: <20200919091751.011116649@linutronix.de>
 <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
 <87mu1lc5mp.fsf@nanos.tec.linutronix.de>
 <87k0wode9a.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgbmwsTOKs23Z=71EBTrULoeaH2U3TNqT2atHEWvkBKdw@mail.gmail.com>
Date: Sun, 20 Sep 2020 19:40:41 +0200
Message-ID: <87eemwcpnq.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200920_134044_132938_8710F304 
X-CRM114-Status: GOOD (  24.60  )
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
 Guo Ren <guoren@kernel.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-xtensa@linux-xtensa.org, Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>,
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

On Sun, Sep 20 2020 at 09:57, Linus Torvalds wrote:
> On Sun, Sep 20, 2020 at 1:49 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> Btw, looking at the stack code, Ithink your new implementation of it
> is a bit scary:
>
>    static inline int kmap_atomic_idx_push(void)
>    {
>   -       int idx = __this_cpu_inc_return(__kmap_atomic_idx) - 1;
>   +       int idx = current->kmap_ctrl.idx++;
>
> and now that 'current->kmap_ctrl.idx' is not atomic wrt
>
>  (a) NMI's (this may be ok, maybe we never do kmaps in NMIs, and with
> nesting I think it's fine anyway - the NMI will undo whatever it did)

Right. Nesting should be a non issue, but I don't think we have
kmap_atomic() in NMI context.

>  (b) the prev/next switch
>
> And that (b) part worries me. You do the kmap_switch_temporary() to
> switch the entries, but you do that *separately* from actually
> switching 'current' to the new value.
>
> So kmap_switch_temporary() looks safe, but I don't think it actually
> is. Because while it first unmaps the old entries and then remaps the
> new ones, an interrupt can come in, and at that point it matters what
> is *CURRENT*.
>
> And regardless of whether 'current' is 'prev' or 'next', that
> kmap_switch_temporary() loop may be doing the wrong thing, depending
> on which one had the deeper stack. The interrupt will be using
> whatever "current->kmap_ctrl.idx" is, but that might overwrite entries
> that are in the process of being restored (if current is still 'prev',
> but kmap_switch_temporary() is in the "restore @next's kmaps" pgase),
> or it might stomp on entries that have been pte_clear()'ed by the
> 'prev' thing.

Duh yes. Never thought about that.

> Alternatively, that process counter would need about a hundred lines
> of commentary about exactly why it's safe. Because I don't think it
> is.

I think the more obvious solution is to split the whole exercise:


  schedule()
     prepare_switch()
        unmap()

    switch_to()

    finish_switch()
        map()

That's safe because neither the unmap() nor the map() code changes
kmap_ctrl.idx. So if there is an interrupt coming in between unmap() and
switch_to() then a kmap_local() there will use the next entry. So we
could even do the unmap() with interrupts enabled (preemption disabled).
Same for the map() part.

To explain that we need only a few lines of commentry methinks.

Thanks,

        tglx


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
