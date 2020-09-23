Return-Path: <SRS0=efrZ=DA=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD7EC4741F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2020 12:33:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C02F9206F7
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2020 12:33:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PRgjsMA6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mQ42gd2D";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ohpCeECC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C02F9206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p1Ikg5LPjoHOMoPjwMWKR0brSLp4JDudxAoH2dBmnTY=; b=PRgjsMA66aI3v9075Aqhe3dU1
	T+gTCa3iwUlmXrmNDZn548C27s0nNgro58WuwbFaM9LklhHO1dNpLpgAsY48nRTnGYvf5tjsI8m+V
	mb6deIcjU1MYpTBYEVWXgozYWHfMuDhB2TAzcnEpbyT35Rba9otHkaU/YlcGM+rlOvyyMdw/vWN8Q
	rNJbcClaaFIr3Ny3z4LWwKu3m1fcIULeDvvcAB/J7kYfpdX3ffXokPB6F351cdt3pMZhsF+BwdW0y
	egQrxM0ZlEsgOTKfR7uTIRaa+9IrMgu19rJ+/imiv4jqBN1wvWUU3/Al9PZj5HXshtcnGsc7eyX7+
	HS/4wNqLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL3xd-0003gM-RW; Wed, 23 Sep 2020 12:33:25 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL3xX-0003dx-Tp; Wed, 23 Sep 2020 12:33:21 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600864398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4zUEMW9wU+kwouVfGxKhtf6Di/IFhmYOqDGQKAREV8o=;
 b=mQ42gd2DhQ/RG0jBtJb4meJN+5wV2pj9iVLxHpupYAkadW+bY5A7tLe5ML2OCxkUDyFcOz
 1ID+60xXG2OjXRxOxnGUclm3zYFaTcjPF9ahEeidyum940F7pRvQQ+6fARlpRL8arWBYw5
 sXQ3YFT0QLJJsnhzzhPX5pkUAQdcb0r75msvmD5rVzIQdvYOpaNOYhzVgXEW9+SvrTpZ5S
 VYlZevpT0pbNGk2c2vrUKV2OAsLRNBNh2/g0YkvfbfbDyed7rHhHQWMZYKtR79LU83j38G
 5r/WEDgX3y9hgl7i7P9JlU2XJG/6OaMoTDqwD5QZO9LvlKLV3P7ptN62EV3bIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600864398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4zUEMW9wU+kwouVfGxKhtf6Di/IFhmYOqDGQKAREV8o=;
 b=ohpCeECCtFRlt7dpUmuCjEyhCy6FZxCGdV74xdJ5JgvLxUGaba5R+t2Tfw4DYzdeiW9o4A
 74IrdXtsMBTtycCw==
To: peterz@infradead.org
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
In-Reply-To: <20200923101953.GT2674@hirez.programming.kicks-ass.net>
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
 <20200923101953.GT2674@hirez.programming.kicks-ass.net>
Date: Wed, 23 Sep 2020 14:33:17 +0200
Message-ID: <87sgb8ad0y.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_083320_077427_A143970B 
X-CRM114-Status: GOOD (  17.02  )
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

On Wed, Sep 23 2020 at 12:19, peterz wrote:
> On Mon, Sep 21, 2020 at 09:27:57PM +0200, Thomas Gleixner wrote:
>> Alternatively this could of course be solved with per CPU page tables
>> which will come around some day anyway I fear.
>
> Previously (with PTI) we looked at making the entire kernel map per-CPU,
> and that takes a 2K copy on switch_mm() (or more general, the user part
> of whatever the top level directory is for architectures that have a
> shared kernel/user page-table setup in the first place).
>
> The idea was having a fixed per-cpu kernel page-table, share a bunch of
> (kernel) page-tables between all CPUs and then copy in the user part on
> switch.
>
> I've forgotten what the plan was for ASID/PCID in that scheme.
>
> For x86_64 we've been fearing the performance of that 2k copy, but I
> don't think we've ever actually bit the bullet and implemented it to see
> how bad it really is.

I actually did at some point and depending on the workload the overhead
was clearly measurable. And yes, it fell apart with PCID and I could not
come up with a scheme for it which did not suck horribly. So I burried
the patches in the poison cabinet.

Aside of that, we'd need to implement that for a eight other
architectures as well...

Thanks,

        tglx


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
