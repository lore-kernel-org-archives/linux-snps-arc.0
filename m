Return-Path: <SRS0=2kue=DB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3891FC4363D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Sep 2020 18:58:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D191238A1
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Sep 2020 18:58:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H9cMGOHX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D191238A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bG34YFQjnc4LM0nHIC7rsx+XLExGOmjUn8Ak+f8rayE=; b=H9cMGOHXMwVB6mvfKLA897TeB
	a3BXFapdSQZO3WFitSE/dJjUdv4fu7FuUbJ7J8JPpq1YrFPtrVnyKYQLfQ/lLzg3zPrd3xfbzcJTU
	C8ERkZc+tWAYiZ8d7wffmEo29ewiOSBhLUZyDhKp38j6qg0nwEZfstGrXEosWlrusgT91Qr4EkKOa
	porqbeUkCR+oOxaNDZk5SvfFaNY0xkNiTDgkn1lyk+UT5acdHBbxqhnqgmro7lOKQjK1brWmFucZN
	IyXu3hbMsOLh3JyuUNUFZOvb4SHt8J+XWQC0Tdjfuy4M5HArsNGj42Y8nhRSMtLRv585pYxZ100kk
	ubvFz10kw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLWRk-0007Yj-Qt; Thu, 24 Sep 2020 18:58:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLWRe-0007V9-OG; Thu, 24 Sep 2020 18:58:19 +0000
Received: from rorschach.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D88323600;
 Thu, 24 Sep 2020 18:58:12 +0000 (UTC)
Date: Thu, 24 Sep 2020 14:58:10 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
Message-ID: <20200924145810.2f0b806f@rorschach.local.home>
In-Reply-To: <875z8383gh.fsf@nanos.tec.linutronix.de>
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
 <871riracgf.fsf@nanos.tec.linutronix.de>
 <20200924083241.314f2102@gandalf.local.home>
 <875z8383gh.fsf@nanos.tec.linutronix.de>
X-Mailer: Claws Mail 3.17.4git76 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_145818_964937_0124CE26 
X-CRM114-Status: GOOD (  39.57  )
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

On Thu, 24 Sep 2020 19:55:10 +0200
Thomas Gleixner <tglx@linutronix.de> wrote:

> On Thu, Sep 24 2020 at 08:32, Steven Rostedt wrote:
> > On Thu, 24 Sep 2020 08:57:52 +0200
> > Thomas Gleixner <tglx@linutronix.de> wrote:
> >  
> >> > Now as for migration disabled nesting, at least now we would have
> >> > groupings of this, and perhaps the theorists can handle that. I mean,
> >> > how is this much different that having a bunch of tasks blocked on a
> >> > mutex with the owner is pinned on a CPU?
> >> >
> >> > migrate_disable() is a BKL of pinning affinity.    
> >> 
> >> No. That's just wrong. preempt disable is a concurrency control,  
> >
> > I think you totally misunderstood what I was saying. The above wasn't about
> > comparing preempt_disable to migrate_disable. It was comparing
> > migrate_disable to a chain of tasks blocked on mutexes where the top owner
> > has preempt_disable set. You still have a bunch of tasks that can't move to
> > other CPUs.  
> 
> What? The top owner does not prevent any task from moving. The tasks
> cannot move because they are blocked on the mutex, which means they are
> not runnable and non runnable tasks are not migrated at all.

And neither are migrated disabled tasks preempted by a high priority
task.

> 
> I really don't understand what you are trying to say.

Don't worry about it. I was just making a high level comparison of how
migrate disabled tasks blocked on a higher priority task is similar to
that of tasks blocked on a mutex held by a pinned task that is
preempted by a high priority task. But we can forget this analogy as
it's not appropriate for the current conversation.

> 
> >> > If we only have local_lock() available (even on !RT), then it makes
> >> > the blocking in groups. At least this way you could grep for all the
> >> > different local_locks in the system and plug that into the algorithm
> >> > for WCS, just like one would with a bunch of mutexes.    
> >> 
> >> You cannot do that on RT at all where migrate disable is substituting
> >> preempt disable in spin and rw locks. The result would be the same as
> >> with a !RT kernel just with horribly bad performance.  
> >
> > Note, the spin and rwlocks already have a lock associated with them. Why
> > would it be any different on RT? I wasn't suggesting adding another lock
> > inside a spinlock. Why would I recommend THAT? I wasn't recommending
> > blindly replacing migrate_disable() with local_lock(). I just meant expose
> > local_lock() but not migrate_disable().  
> 
> We already exposed local_lock() to non RT and it's for places which do
> preempt_disable() or local_irq_disable() without having a lock
> associated. But both primitives are scope less and therefore behave like
> CPU local BKLs. What local_lock() provides in these cases is:
> 
>   - Making the protection scope clear by associating a named local
>     lock which is coverred by lockdep.
> 
>   - It still maps to preempt_disable() or local_irq_disable() in !RT
>     kernels
> 
>   - The scope and the named lock allows RT kernels to substitute with
>     real (recursion aware) locking primitives which keep preemption and
>     interupts enabled, but provide the fine grained protection for the
>     scoped critical section.

I'm very much aware of the above.

>   
> So how would you substitute migrate_disable() with a local_lock()? You
> can't. Again migrate_disable() is NOT a concurrency control and
> therefore it cannot be substituted by any concurrency control primitive.

When I was first writing my email, I was writing about a way to replace
migrate_disable with a construct similar to local locks without
actually mentioning local locks, but then rewrote it to state local
locks, trying to simplify what I was writing. I shouldn't have done
that, because it portrayed that I wanted to use local_lock()
unmodified. I was actually thinking of a new construct that was similar
but not exactly the same as local lock.

But this will just make things more complex and we can forget about it.

I'll wait to see what Peter produces.

-- Steve

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
