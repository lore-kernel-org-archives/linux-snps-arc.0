Return-Path: <SRS0=efrZ=DA=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61173C4363D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2020 14:33:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBF4121D43
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2020 14:33:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K+qdCZNX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="pA5Hd7/w";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qGRiwr69"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBF4121D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yN1nV4Lu0VaZYvC17GB5ghVaCPPRW+gD77HBqOxPJ18=; b=K+qdCZNXOgXPIj73ifOByplPV
	PR3jX77dGCtcov679agXaJLXJ+ycRjYMxHXaj5lZMpCi30DKV4UI0sFC3wplxEdcEpR/yyiuxJjw/
	K+xjnWBJ3OaWT37ZvfUn1GxpevwlmFQ2H23JQznr1OpWOYfRFx3f90TZyNGt27DtvBFdkNKHnRUvY
	ZaYAwVAfRUydukGoDDOWZj/BDHviRgabROgGWOLwGHnnFTIteQBTFyDnki7rvp02sLieEDlXAk3zQ
	p6mD1IvSEX3qQo8AGjLp6tZ2WgjBR/FqgQ21I2aJAh44qVEgCUaeRXCFB7CGWckWEvjVcVnkMjmlw
	Uh3e2SKjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kL5pp-0001Fg-OJ; Wed, 23 Sep 2020 14:33:29 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kL5ph-00019N-5Y; Wed, 23 Sep 2020 14:33:24 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600871599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=htFCLJWsNhxoKbCNWhQS/6Kyz86LUNNWBiBq6qkBFyQ=;
 b=pA5Hd7/wYPJW36CTtNNTbOYCzRvXBsTbhCHBjjmQZ01hpagIyv/VcnxLW17kJqMxHoJumz
 z5+hv3BrOqb8U7x+bnWe3Vg7hjpdsIzhk0Jj3S1z+5+winumEs8KsUyf1K1TnGwBajSWcB
 LPdDuPzlUY6BQkUL/KCzLAeEkhIHNDaswPGDWAOJny+dzcHlZahNl7c2FSd1xp6gP0rEgj
 KzUlj0Dxhw0txRUSLaqWlErEiWSU9Sozf2/yRD5Qwp08ro8Q2KjAE/20gQBa42apztEBT8
 SUzGb5WlY8s1AJc0khV/84NW02EhLXtT8nMIfQBdpZd1EmcFI7Hj8Ky6D6u98A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600871599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=htFCLJWsNhxoKbCNWhQS/6Kyz86LUNNWBiBq6qkBFyQ=;
 b=qGRiwr69/8k8ntlbQpv0icecJVUI4PbZN1b5MTw/xOk+gHpAMJmHhEqUxn40L21XWDImxq
 PUiJwewr0xn47MAg==
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
In-Reply-To: <87sgbbaq0y.fsf@nanos.tec.linutronix.de>
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
Date: Wed, 23 Sep 2020 16:33:19 +0200
Message-ID: <877dska7gw.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200923_103321_342483_4BCA1BB1 
X-CRM114-Status: GOOD (  14.21  )
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

On Mon, Sep 21 2020 at 21:27, Thomas Gleixner wrote:
> On Mon, Sep 21 2020 at 09:24, Linus Torvalds wrote:
>> On Mon, Sep 21, 2020 at 12:39 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>> Maybe we really *could* call this new kmap functionality something
>> like "kmap_percpu()" (or maybe "local" is good enough), and make it
>> act like your RT code does for spinlocks - not disable preemption, but
>> only disabling CPU migration.
>
> I"m all for it, but the scheduler people have opinions :)

I just took the latest version of migrate disable patches

  https://lore.kernel.org/r/20200921163557.234036895@infradead.org

removed the RT dependency on top of them and adopted the kmap stuff
(addressing the various comments while at it and unbreaking ARM).

I'm not going to post that until there is consensus about the general
availability of migrate disable, but for those who want to play with it
I've pushed the resulting combo out to:

   git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git highmem 

For testing I've tweaked a few places to use the new _local() variants
and it survived testing so far and I've verified that there is actual
preemption which means zap/restore of the thread local kmaps.

Thanks,

        tglx

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
