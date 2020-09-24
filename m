Return-Path: <SRS0=2kue=DB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6956BC4346E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Sep 2020 06:58:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E990120758
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Sep 2020 06:58:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C+OCHrT5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ToSaPZLx";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EvF/Nhfc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E990120758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Uq7z9tN7Y9leQ6eHqudzPYnmliEed9ftib1ZRr3OtcI=; b=C+OCHrT5Zg16lh7FimDdrAmco
	IrSYaTMuHxnIsr0aKnyev/hxTdv6lr26DzkMTW0usxNScRGwwhn/NcDgrsNYP9JOInBO2leKxCd1M
	PbdGC5JZrqBbrOqZfn3sncZrFqBMd3VPFF+o+zSSU8cShCYKp02SPlDQvkKS9h+kWtyMY3INYkuq2
	PdejU8+vn/kLr4O0IG2HlDqivCONUteOo+xfTS7wK3AHoenzbDEmvRQx+B9H36V6KAgnfeczssDkI
	QMmoNv9Z3+oLTq436Oi+kesIDMrbe7aeb9iDWPO0JFSvUDQcQpijO5o+/q1AuIPkkOHX0+k4WC9DK
	OeuYoEJ2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLLCv-0007rk-6C; Thu, 24 Sep 2020 06:58:21 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLLCU-0007eW-Cb; Thu, 24 Sep 2020 06:57:55 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600930672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5rTYnFSI7MvYdctqS1tc/c91OuHk2uQv9NNDSCQ04XQ=;
 b=ToSaPZLxQ2AH6wpji2/x8TcisM3A51I/7u6foK9kSTrf7OV6+B/sYvPqQhMtEJrg0N9zIx
 Cxs2etUyPDaehZQCOzhxH7PpvSyJSfy+zT5nw6FTVB78t6JNp7mDPmryw8BrJtWSznRbjf
 8WXrnLC1goQovtz1OVkxeDIie+039a2C5Ao2dLue3fpVFSN5R/cBi6m5tXzS9aMxE6UJwX
 Uwp2HtahcdV3lHGQhtB2rKe1baF/Au/D2y5x0sKC4vrpIL/XuoPxLZOPdKWgIlvAl5aFPa
 sm2IQ31/n393ddHyPDhkeJ4Ev5cXAXShQDmJK93cRSzGvYG6PFna1CfbOLLbSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600930672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5rTYnFSI7MvYdctqS1tc/c91OuHk2uQv9NNDSCQ04XQ=;
 b=EvF/NhfcVha3UwOSEREyL46c1SondfygAd7QtbHcK6NXwedthX3cPGyjT7D4JChbCJd2jo
 pNgVY6bwfByW4sDA==
To: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
In-Reply-To: <20200923171234.0001402d@oasis.local.home>
References: <20200919091751.011116649@linutronix.de>
 <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
 <87mu1lc5mp.fsf@nanos.tec.linutronix.de>
 <87k0wode9a.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgbmwsTOKs23Z=71EBTrULoeaH2U3TNqT2atHEWvkBKdw@mail.gmail.com>
 <87eemwcpnq.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgF-upZVpqJWK=TK7MS9H-Rp1ZxGfOG+dDW=JThtxAzVQ@mail.gmail.com>
 <87a6xjd1dw.fsf@nanos.tec.linutronix.de>
 <CAHk-=wjhxzx3KHHOMvdDj3Aw-_Mk5eRiNTUBB=tFf=vTkw1FeA@mail.gmail.com>
 <87sgbbaq0y.fsf@nanos.tec.linutronix.de>
 <20200923084032.GU1362448@hirez.programming.kicks-ass.net>
 <20200923115251.7cc63a7e@oasis.local.home>
 <874kno9pr9.fsf@nanos.tec.linutronix.de>
 <20200923171234.0001402d@oasis.local.home>
Date: Thu, 24 Sep 2020 08:57:52 +0200
Message-ID: <871riracgf.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_025754_646396_7978B89A 
X-CRM114-Status: GOOD (  17.21  )
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
Cc: Juri Lelli <juri.lelli@redhat.com>, peterz@infradead.org,
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
 Jani Nikula <jani.nikula@linux.intel.com>, Greentime Hu <green.hu@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Linux-MM <linux-mm@kvack.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel@ffwll.ch>, Vineet Gupta <vgupta@synopsys.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Sep 23 2020 at 17:12, Steven Rostedt wrote:
> On Wed, 23 Sep 2020 22:55:54 +0200
> Then scratch the idea of having anonymous local_lock() and just bring
> local_lock in directly? Then have a kmap local lock, which would only
> block those that need to do a kmap.

That's still going to end up in lock ordering nightmares and you lose
the ability to use kmap_local from arbitrary contexts which was again
one of the goals of this exercise.

Aside of that you're imposing reentrancy protections on something which
does not need it in the first place.

> Now as for migration disabled nesting, at least now we would have
> groupings of this, and perhaps the theorists can handle that. I mean,
> how is this much different that having a bunch of tasks blocked on a
> mutex with the owner is pinned on a CPU?
>
> migrate_disable() is a BKL of pinning affinity.

No. That's just wrong. preempt disable is a concurrency control,
i.e. protecting against reentrancy on a given CPU. But it's a cpu global
protection which means that it's not protecting a specific code path.

Contrary to preempt disable, migrate disable is not protecting against
reentrancy on a given CPU. It's a temporary restriction to the scheduler
on placement.

The fact that disabling preemption implicitely disables migration does
not make them semantically equivalent.

> If we only have local_lock() available (even on !RT), then it makes
> the blocking in groups. At least this way you could grep for all the
> different local_locks in the system and plug that into the algorithm
> for WCS, just like one would with a bunch of mutexes.

You cannot do that on RT at all where migrate disable is substituting
preempt disable in spin and rw locks. The result would be the same as
with a !RT kernel just with horribly bad performance.

That means the stacking problem has to be solved anyway.

So why on earth do you want to create yet another special duct tape case
for kamp_local() which proliferates inconsistency instead of aiming for
consistency accross all preemption models?

Thanks,

        tglx

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
