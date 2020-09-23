Return-Path: <SRS0=efrZ=DA=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE52C2D0A8
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2020 08:40:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F1AA221F0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2020 08:40:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RIoDFelN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vqx/B66I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F1AA221F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7/B2vXHEK/tNZLl/046Zby14Uh5oLYeXGc1Q/jopSiw=; b=RIoDFelNc/5uyHl1NP6ho1x9f
	jwgpvyHDsora6ZawGS22BFAH2vPQkH9TSAOxYo70D9wkkAJiRa9IlhZhE1h0+bePzOmpBokCQanYd
	n1oouJd7Y+ejPJVEHy6+ZQmWEOqzrFUJFcWLVAd1IQLbD9QHx2Lu15a9kEWwQ+7MVfS8cpFyREs4d
	m22LWe5JHHXFiNfzIvtDZN+wHgu3K7vNW6Ipmis4ECCaebPAn1r+eNKes9BBAPtV61YNfjfCj87Xv
	SUIqLaLFwbVUsla+keafORqYie/IMGoilmMu7qH38vThkqQrkjVz9f9TEzWsfZMWPDbAD0E509xat
	8OE7cVGWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL0Kd-0006wK-K4; Wed, 23 Sep 2020 08:40:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL0KW-0006uH-6m; Wed, 23 Sep 2020 08:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XUajjvVX4H86jnKIk5XMmvtu2ykOTjeXul3/BJu/hwU=; b=vqx/B66IY6FJeZM3oZmg/+Un+I
 juk4SYQ/onu0T+HuU6X7fOPUIa6l9h67CTBxy3SeH234BxCXwizgdRSm3ioDdv8gF+TwH9O22nczg
 iqTkLZMjcnlPg/CQhzPF7llJEWqzYy/Dtj1pYfU2/xkQ01m00/IofSzmAb4/u67Eqx5ofz6yzA4Jr
 k+ENSw1eHzIn/yXomefawgme8b2QPv9bNql8zuIi3CmNCPYqKCAg5yJhl56cZVRivF4fUyQXVfWDV
 f/qwJzeMoNXuRo68QwZoXhQ3RDUab4cXjbENpYgZ4B+vroJlmNEOdrOdKJLG7gc49cxKVxNJisFa1
 TLPApaFA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL0KM-0004t5-Gu; Wed, 23 Sep 2020 08:40:38 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A998D300455;
 Wed, 23 Sep 2020 10:40:32 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 6A1AD213DCC80; Wed, 23 Sep 2020 10:40:32 +0200 (CEST)
Date: Wed, 23 Sep 2020 10:40:32 +0200
From: peterz@infradead.org
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
Message-ID: <20200923084032.GU1362448@hirez.programming.kicks-ass.net>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87sgbbaq0y.fsf@nanos.tec.linutronix.de>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, David Airlie <airlied@linux.ie>,
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
 Mel Gorman <mgorman@suse.de>,
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel@ffwll.ch>, Vineet Gupta <vgupta@synopsys.com>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, Sep 21, 2020 at 09:27:57PM +0200, Thomas Gleixner wrote:
> On Mon, Sep 21 2020 at 09:24, Linus Torvalds wrote:
> > On Mon, Sep 21, 2020 at 12:39 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> >>
> >> If a task is migrated to a different CPU then the mapping address will
> >> change which will explode in colourful ways.
> >
> > Right you are.
> >
> > Maybe we really *could* call this new kmap functionality something
> > like "kmap_percpu()" (or maybe "local" is good enough), and make it
> > act like your RT code does for spinlocks - not disable preemption, but
> > only disabling CPU migration.
> 
> I"m all for it, but the scheduler people have opinions :)

Right, so I'm concerned. migrate_disable() wrecks pretty much all
Real-Time scheduler theory we have, and PREEMPRT_RT bringing it in is
somewhat ironic.

Yes, it allows breaking up non-preemptible regions of non-deterministic
duration, and thereby both reduce and bound the scheduling latency, the
cost for doing that is that the theory on CPU utilization/bandwidth go
out the window.

To easily see this consider an SMP system with a number of tasks equal
to the number of CPUs. On a regular (preempt_disable) kernel we can
always run each task, by virtue of always having an idle CPU to take the
task.

However, with migrate_disable() we can have each task preempted in a
migrate_disable() region, worse we can stack them all on the _same_ CPU
(super ridiculous odds, sure). And then we end up only able to run one
task, with the rest of the CPUs picking their nose.

The end result is that, like with unbounded latency, we will still miss
our deadline, simply because we got starved for CPU.


Now, while we could (with a _lot_ of work) rework the kernel to not rely
on the implicit per-cpu ness of things like spinlock_t, the moment we
bring in basic primitives that rely on migrate_disable() we're stuck
with it.


The problem is; afaict there's been no research into this problem. There
might be scheduling (read: balancing) schemes that can mitigate/solve
this problem, or it might prove to be a 'hard' problem, I just don't
know. But once we start down this road, it's going to be hell to get rid
of it.

That's why I've been arguing (for many years) to strictly limit this to
PREEMPT_RT and only as a gap-stop, not a fundamental primitive to build
on.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
