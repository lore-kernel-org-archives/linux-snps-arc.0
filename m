Return-Path: <SRS0=iBOu=C5=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBCCC43466
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Sep 2020 08:49:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3504C20897
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Sep 2020 08:49:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0GN+3j7f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="h8jv+ylt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZMmhQ6D7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3504C20897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AaTt3mw3W8kuVyCvjrHZUOAufROf4KA6IFTF3wL9WRU=; b=0GN+3j7f6NKpRrkIEeBFci41C
	JngRXQd2rR8kbxLVUAYahyQb52LkHef+ZHAWMWmaZ62BU/iV1vDTw9eJCMqjsCFYpkroAop17AVXb
	eGpO9mp34ZODdq2FhdftyKtNN+1UCa2+Q7A/9l6hA0pJzPCSPiDMygn5Na828KN0gSXYGxEd0QZe1
	di4QtfBT2xiIgpNbPUaXqX72EqfEs4VxyeM5KPqLsVMcx+IYe6hs4WNfTfeBG2A0IL5kN32CFccOO
	hpRbj+Sy++50bCiL+D8Wie8SGGPHeJ8TR3aj66gNOQl8eB/4r+ciH6Vfg6Cf7qI7P43Zn1LD8mRhf
	45Ka545jQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJv2I-0003Jp-8p; Sun, 20 Sep 2020 08:49:30 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJv2D-0003HS-2B; Sun, 20 Sep 2020 08:49:25 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1600591762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yl4SJva1ZaL/QSosb5XX7oiMR9yOUZ2hryRMeN6gUOs=;
 b=h8jv+yltDHIngnBBGJjPbxbwRp4WWvfUYCE010JZcD8mxV4UaeO8dLdDu13Q2cG+LY8JOQ
 h6npHbPhilGj3v1VUqWxvnxWjS/ksALdSUA+5C9fXgz9TR+62SaZPqFm9CDQlxwGmO5sxH
 Og/nMSeW9my8zlDQTOZZtLu/e9zkMmPgdx5NK5E8Rcfn4iS1ni7EpBlci97FKZLWMkER3O
 +JFJopKrMaT622cTfw+fq7PTs6AJTMpiNhuh5DlxWwRcA1+vumWCIqGRFavPq8Rwh2wOji
 LMGpm7pbhOs/2HMUMaIGkJEZas3RBbG5QRgXaIHLQPqkcnXaia1X2M3U1G452Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1600591762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yl4SJva1ZaL/QSosb5XX7oiMR9yOUZ2hryRMeN6gUOs=;
 b=ZMmhQ6D75ka6LNiomg7OC2DwIv8yEqOFqmHU4LlJlX/duWyJlSPDqvfBsTbUq7MYp5KhFm
 dW4ZRnByLA6ZBcCQ==
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
In-Reply-To: <87mu1lc5mp.fsf@nanos.tec.linutronix.de>
References: <20200919091751.011116649@linutronix.de>
 <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
 <87mu1lc5mp.fsf@nanos.tec.linutronix.de>
Date: Sun, 20 Sep 2020 10:49:21 +0200
Message-ID: <87k0wode9a.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200920_044925_215643_EF3905FF 
X-CRM114-Status: GOOD (  17.17  )
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

On Sun, Sep 20 2020 at 08:41, Thomas Gleixner wrote:
> On Sat, Sep 19 2020 at 10:18, Linus Torvalds wrote:
>> Maybe I've missed something.  Is it because the new interface still
>> does "pagefault_disable()" perhaps?
>>
>> But does it even need the pagefault_disable() at all? Yes, the
>> *atomic* one obviously needed it. But why does this new one need to
>> disable page faults?
>
> It disables pagefaults because it can be called from atomic and
> non-atomic context. That was the point to get rid of
>
>          if (preeemptible())
>          	kmap();
>          else
>                 kmap_atomic();
>
> If it does not disable pagefaults, then it's just a lightweight variant
> of kmap() for short lived mappings.

Actually most usage sites of kmap atomic do not need page faults to be
disabled at all. As Daniel pointed out the implicit pagefault disable
enforces copy_from_user_inatomic() even in places which are clearly
preemptible task context.

As we need to look at each instance anyway we can add the PF disable
explicitely to the very few places which actually need it.

Thanks,

        tglx


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
