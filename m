Return-Path: <SRS0=/NyP=C6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B7A6C43465
	for <linux-snps-arc@archiver.kernel.org>; Mon, 21 Sep 2020 16:31:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B46E923976
	for <linux-snps-arc@archiver.kernel.org>; Mon, 21 Sep 2020 16:31:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k4AHlZK+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="a2Cw4ka1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B46E923976
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rj6673m+nScCNUucH9Jkfa2ytsGhaQP5nvIl4XPe+8A=; b=k4AHlZK+i1542obRxi4/3Mzpf
	M+d6qb2pHl0X1U3MeiPiJyxwlqJNpilNVye8VbE6auVmGhaU4uKxnw0Os91evZD6cuqKsZchvd2sL
	jVbsG+MHCsUtmMSC7i7ABzbHKU7tqc3nQna39rzmM/rkYQzldjL2hsYTaY3hRjCdWdGE/dU5oROSH
	bwJy29W09D4EAc3YPdSlsPttg5BJKc1WqYB7dXU3b9LIgeIYD+WkB9+N6Wq0kbhqO+E4aj+ETpXNG
	G/JNWXtQJw41VKGFXwaQfmWOr22vcnlij7vRQ0ZxNbU1PfHe6ak++ok2q+kK9CkQL/TBRAJZkvYHB
	qb4kjp60w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKOjJ-0008Jj-Rs; Mon, 21 Sep 2020 16:31:53 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKOjE-0008Hu-Q2
 for linux-snps-arc@lists.infradead.org; Mon, 21 Sep 2020 16:31:50 +0000
Received: by mail-ed1-x543.google.com with SMTP id c8so13449338edv.5
 for <linux-snps-arc@lists.infradead.org>; Mon, 21 Sep 2020 09:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LbpMl5lO0+qWgp9uAKdYj5ux1bx38Si35gqGXl7ChFs=;
 b=a2Cw4ka1cjcNejUhLUZAAjSLNoYelCoyZSpmQCatftbiLw5qTc+pZIam7CQ+bzySoC
 gGOBNlZFILF1rbb13VR5vHbBB6o7IPhfhEtjuIQ55GiefDbPErJYqMNF7ag3KHBM9T1M
 Z1SXFFsw84dXXtq0Bg7SO0KF3jcdxFjvGihOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LbpMl5lO0+qWgp9uAKdYj5ux1bx38Si35gqGXl7ChFs=;
 b=DJV/Ty4p9++gZeqjUxOGHpoMkam6s1ePV/WmY0AeurKEaP3hbL7sUyo6/DAjpTMhgO
 DHd6pPmdGSgaChDG9nJDjtMi2ixvTnMwBtUY2YRGCs9hT8vMtU8ugD8uGZj/ntcWnW3K
 a0+z2AQ8LQEs//cizDdjS4a1/QGWM7HBc7tPJFzp3ZHwl+r6x63xnD1YCheYsuqZ6eD1
 LtJv6AI3auS0Ghd8dEfQPeuSxRpOpbcMv29goob0Y0eJn+A+KBjwkxbUrIL4SDmKEn59
 AM68SFMXgPv8JwifpcOzFuHi2thq1eR+VpINyisd7GRlwKjsVZfViDh8NkXxFC5paKgA
 RYBQ==
X-Gm-Message-State: AOAM531btP0WaEObM6QuuBK7KT0OWbUWpJlmY5YETecY0JrqAL95a1MH
 LpTUmdcRvKv4Og309XCWo/jUFfb5hBs/3g==
X-Google-Smtp-Source: ABdhPJyu5PncbX6mkh6bt7G++nyj54RMWDG4TvCWRd9Tuq+fxE6kj8NPxfEJfBRki1serRqF9tidUA==
X-Received: by 2002:a50:fc87:: with SMTP id f7mr510715edq.162.1600705907312;
 Mon, 21 Sep 2020 09:31:47 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44])
 by smtp.gmail.com with ESMTPSA id i15sm9104592edf.82.2020.09.21.09.31.46
 for <linux-snps-arc@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 09:31:47 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id e16so13497617wrm.2
 for <linux-snps-arc@lists.infradead.org>; Mon, 21 Sep 2020 09:31:46 -0700 (PDT)
X-Received: by 2002:a2e:994a:: with SMTP id r10mr154392ljj.102.1600705501870; 
 Mon, 21 Sep 2020 09:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200919091751.011116649@linutronix.de>
 <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
 <87mu1lc5mp.fsf@nanos.tec.linutronix.de>
 <87k0wode9a.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgbmwsTOKs23Z=71EBTrULoeaH2U3TNqT2atHEWvkBKdw@mail.gmail.com>
 <87eemwcpnq.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgF-upZVpqJWK=TK7MS9H-Rp1ZxGfOG+dDW=JThtxAzVQ@mail.gmail.com>
 <87a6xjd1dw.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87a6xjd1dw.fsf@nanos.tec.linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 21 Sep 2020 09:24:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjhxzx3KHHOMvdDj3Aw-_Mk5eRiNTUBB=tFf=vTkw1FeA@mail.gmail.com>
Message-ID: <CAHk-=wjhxzx3KHHOMvdDj3Aw-_Mk5eRiNTUBB=tFf=vTkw1FeA@mail.gmail.com>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_123148_867826_47DF8D5A 
X-CRM114-Status: GOOD (  14.12  )
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

On Mon, Sep 21, 2020 at 12:39 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> If a task is migrated to a different CPU then the mapping address will
> change which will explode in colourful ways.

Heh.

Right you are.

Maybe we really *could* call this new kmap functionality something
like "kmap_percpu()" (or maybe "local" is good enough), and make it
act like your RT code does for spinlocks - not disable preemption, but
only disabling CPU migration.

That would probably be good enough for a lot of users that don't want
to expose excessive latencies, but where it's really not a huge deal
to say "stick to this CPU for a short while".

The crypto code certainly sounds like one such case.

             Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
