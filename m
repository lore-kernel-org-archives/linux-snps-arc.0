Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24589C6FD1F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 22 Mar 2023 17:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CC94v5XHikgfF807UhAFqGFm8tXr23kvZsQzUFrWDpA=; b=iIg+pPQcklO62N
	kzSVB1ywLE0brhuHYNOwIw/QBqmj7wjZ9mk8NTsAzNHWCYX0UfJOP0PQKiMeIlugLnXPgEPPtFESa
	Y4AIA29BVy4zrut9lPQ5QLA7QdHMIGE+5+w2vbchWOzZHjnoJ6KTXK+LhhdXrAyYRePU26Hy77grc
	TcdwvBrVwOhG0A+uihOzZfOryIdF7XWgThaK+S5o7i4DPp/RY0hQWMKFtV1dMzNOBxCSZ21ujW1aR
	rRoxLQ1GpWy8T3eaBvbEFsY54zc6BwhOSMX7C8dRyUoOP8O5HyvAbJQZJ0bHdeUEimX8iOC1C9hqr
	cPN/RA43V2FF0gfpVpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf2At-00GpPH-1b;
	Wed, 22 Mar 2023 17:22:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf2Ap-00GpOP-1t;
	Wed, 22 Mar 2023 17:22:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HnYLxxQqsoSk7nx4q+NwD1PkqBw2pnBv/8dY5LfvgsA=; b=vKlpYO9J+SAy1WEvcIK14Yjf/L
	ynXvDY79SlwKJanrwgzYEOXnnioQBgLUy3CrFk50zk6gexGOR1WBu1U+8z0ez8ooEunmN+/ckV8u/
	fy6I/cTWTP+4yMLeJuJFSHIWQ42bpQDS+bJQxNOOStKEvKo3a2qnMtBXerFw3bacxs/V9jZatrsWt
	uJV0KmhWKaEXSUc4+JDi8NPaOVbgXp0+gUnCEyoIpshljJbDcPWNCZ4z8pkm1g7PNfXMezXN9THbL
	CZ6PxxMDhbKXM9wqJQTkrqybw+bklZDk0F+1b+Uh49FUnabKcm7orMqSW89DJ5taY4bb5wRmuPYfj
	wjzBDEmQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pf2Ag-003CAY-SR; Wed, 22 Mar 2023 17:22:47 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 333E830030F;
	Wed, 22 Mar 2023 18:22:42 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1C3D4205D08C3; Wed, 22 Mar 2023 18:22:42 +0100 (CET)
Date: Wed, 22 Mar 2023 18:22:42 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	x86@kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Juri Lelli <juri.lelli@redhat.com>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicholas Piggin <npiggin@gmail.com>, Guo Ren <guoren@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v5 7/7] sched, smp: Trace smp callback causing an IPI
Message-ID: <20230322172242.GH2357380@hirez.programming.kicks-ass.net>
References: <20230307143558.294354-1-vschneid@redhat.com>
 <20230307143558.294354-8-vschneid@redhat.com>
 <20230322095329.GS2017917@hirez.programming.kicks-ass.net>
 <xhsmhmt45c703.mognet@vschneid.remote.csb>
 <20230322140434.GC2357380@hirez.programming.kicks-ass.net>
 <xhsmhjzz8d8km.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <xhsmhjzz8d8km.mognet@vschneid.remote.csb>
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Mar 22, 2023 at 05:01:13PM +0000, Valentin Schneider wrote:

> > So I was thinking something like this:

> Hm, this does get rid of the func being passed down the helpers, but this
> means the trace events are now stateful, i.e. I need the first and last
> events in a CSD stack to figure out which one actually caused the IPI.

Isn't much of tracing stateful? I mean, why am I always writing awk
programs to parse trace output?

The one that is directly followed by
generic_smp_call_function_single_interrupt() (horrible name that), is
the one that tripped the IPI.

> It also requires whoever is looking at the trace to be aware of which IPIs
> are attached to a CSD, and which ones aren't. ATM that's only the resched
> IPI, but per the cover letter there's more to come (e.g. tick_broadcast()
> for arm64/riscv and a few others). For instance:
> 
>        hackbench-157   [001]    10.894320: ipi_send_cpu:         cpu=3 callsite=check_preempt_curr+0x37 callback=0x0

Arguably we should be setting callback to scheduler_ipi(), except
ofcourse, that's not an actual function...

Maybe we can do "extern inline" for the actual users and provide a dummy
function for the symbol when tracing.

>        hackbench-157   [001]    10.895068: ipi_send_cpu:         cpu=3 callsite=try_to_wake_up+0x29e callback=sched_ttwu_pending+0x0
>        hackbench-157   [001]    10.895068: ipi_send_cpu:         cpu=3 callsite=try_to_wake_up+0x29e callback=generic_smp_call_function_single_interrupt+0x0
> 
> That first one sent a RESCHEDULE IPI, the second one a CALL_FUNCTION one,
> but you really have to know what you're looking at...

But you have to know that anyway, you can't do tracing and not know wtf
you're doing. Or rather, if you do, I don't give a crap and you can keep
the pieces :-)

Grepping the callback should be pretty quick resolution at to what trips
it, no?

(also, if you *realllllly* can't manage, we can always add yet another
argument that gives a type thingy)

> Are you worried about the @func being pushed down?

Not really, I was finding it odd that only the first csd was being
logged. Either you should log them all (after all, the target CPU will
run them all and you might still wonder where the heck they came from)
or it should log none and always report that hideous long function name
I can't be arsed to type again :-)

> Staring at x86 asm is not good for the soul,

Scarred for life :-) What's worse, due to being exposed to Intel syntax
at a young age, I'm now permantently confused as to the argument order
of x86 asm.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
