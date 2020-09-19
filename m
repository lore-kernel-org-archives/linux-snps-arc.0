Return-Path: <SRS0=Kv/D=C4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3220FC43464
	for <linux-snps-arc@archiver.kernel.org>; Sat, 19 Sep 2020 17:27:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7DAA20878
	for <linux-snps-arc@archiver.kernel.org>; Sat, 19 Sep 2020 17:27:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wEgdCTQe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PDwKTi4l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7DAA20878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hgPbeThXGg32XJHHreCeEwgtVzETFmIUcrS7UWaiV9o=; b=wEgdCTQeSP8mUlDIbObGNtJSw
	8qHr0tSc1tEYbkLrTPSqSgySdW6vUNFQucC9ZZTyaxWwPU+qqe9hTFp39zz/7sKgJRGTg3wNGAmK9
	aEivjkcjXW26G2avfZPxnY8e7OAEVEISIpmdMBAwG53KJBzLwZjBq3yNe94BOX/99p1+qux2Z4ZOy
	j9Kkd9sRtMoQ175o7dNeMnwIca7o5+3ietprPT2Nztcfp4azNTgemi3GfZ0LWXIhw5c8/aWWdUNQH
	jYS2Ht9nOGL3uLPdc86FcZBRKx1uIFukVD0ia8R4p+r4Klq31l/KLlB4yPsAnOuOOdP+/LjStTRYd
	50cDAUlQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJgdx-0006PK-9G; Sat, 19 Sep 2020 17:27:25 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJgdv-0006OV-1O
 for linux-snps-arc@lists.infradead.org; Sat, 19 Sep 2020 17:27:23 +0000
Received: by mail-ed1-x541.google.com with SMTP id a12so8942856eds.13
 for <linux-snps-arc@lists.infradead.org>; Sat, 19 Sep 2020 10:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=waM6UyKAxKjxaPuk1aOj7tJ5Pe/ksOuiXEzSSo1PI/U=;
 b=PDwKTi4lX9j7zg3G7WzPyBOHBiLdhmAgWRxWPWvYR/nEys9FVfUL6zNUVgG09pDixg
 o+e2DCxbAvOZN3jBhyrOMZPfygh9RU8mogp2HXrCoLkUWHRL8e1VK4NRvgzXaMsluBfo
 GR1BPuNqLZOfJqo2g/IqA9gl4eqzfpV+zOYak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=waM6UyKAxKjxaPuk1aOj7tJ5Pe/ksOuiXEzSSo1PI/U=;
 b=sPHZF6yAdBDG8CCfbNmEXroqo/7blffm0k/0K4q1l6SPJw83IDNkpMT1kjMFyx7a2L
 Fz25rMHjRrpxXBlGEWzFWuVvd8hD0OYj/aozuD4GFEnSJzIBKswT6pQQLf3jKYiZXOy8
 V56bLLCUOkehDd+wvhKT07sfzcOgIZYYmuw2HBdo9EE/HdgeB4uXIbDUBhFRArUXH2iA
 ICagm9Oz1pOAkYa1MRquTaFxb+PxVgZIRqkFsw8la2NBtt/Z3yPtzURyEgpltGBFrHFR
 E15paK+Gp5l/jkyaNBCQKELiooMBqSUScsDJ/DMiLbIIREWioNsKTlmG46/gaE1kOE4q
 ytbA==
X-Gm-Message-State: AOAM531L8Qd4Pjva9tI6c6GSm48Q0PfRC9qj6/ZanB2Sl6yh8PfHwSS8
 8K3bijqob1cBDSzmVKb6XCwhkAEqUcTN6g==
X-Google-Smtp-Source: ABdhPJxwKEddx0vRvXu/QPOTupwEKDlrpHxtKYKHlbeJj+RFoQ9LOGEEJgNB3dek2hny8MjCJQQAPw==
X-Received: by 2002:a05:6402:1851:: with SMTP id
 v17mr43742072edy.46.1600536441483; 
 Sat, 19 Sep 2020 10:27:21 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42])
 by smtp.gmail.com with ESMTPSA id g25sm4681735edu.53.2020.09.19.10.27.21
 for <linux-snps-arc@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Sep 2020 10:27:21 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id t16so9019555edw.7
 for <linux-snps-arc@lists.infradead.org>; Sat, 19 Sep 2020 10:27:21 -0700 (PDT)
X-Received: by 2002:a19:521a:: with SMTP id m26mr14134256lfb.133.1600535951025; 
 Sat, 19 Sep 2020 10:19:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200919091751.011116649@linutronix.de>
In-Reply-To: <20200919091751.011116649@linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 19 Sep 2020 10:18:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
Message-ID: <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_132723_109137_2842F0E1 
X-CRM114-Status: GOOD (  23.98  )
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

On Sat, Sep 19, 2020 at 2:50 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> this provides a preemptible variant of kmap_atomic & related
> interfaces. This is achieved by:

Ack. This looks really nice, even apart from the new capability.

The only thing I really reacted to is that the name doesn't make sense
to me: "kmap_temporary()" seems a bit odd.

Particularly for an interface that really is basically meant as a
better replacement of "kmap_atomic()" (but is perhaps also a better
replacement for "kmap()").

I think I understand how the name came about: I think the "temporary"
is there as a distinction from the "longterm" regular kmap(). So I
think it makes some sense from an internal implementation angle, but I
don't think it makes a lot of sense from an interface name.

I don't know what might be a better name, but if we want to emphasize
that it's thread-private and a one-off, maybe "local" would be a
better naming, and make it distinct from the "global" nature of the
old kmap() interface?

However, another solution might be to just use this new preemptible
"local" kmap(), and remove the old global one entirely. Yes, the old
global one caches the page table mapping and that sounds really
efficient and nice. But it's actually horribly horribly bad, because
it means that we need to use locking for them. Your new "temporary"
implementation seems to be fundamentally better locking-wise, and only
need preemption disabling as locking (and is equally fast for the
non-highmem case).

So I wonder if the single-page TLB flush isn't a better model, and
whether it wouldn't be a lot simpler to just get rid of the old
complex kmap() entirely, and replace it with this?

I agree we can't replace the kmap_atomic() version, because maybe
people depend on the preemption disabling it also implied. But what
about replacing the non-atomic kmap()?

Maybe I've missed something.  Is it because the new interface still
does "pagefault_disable()" perhaps?

But does it even need the pagefault_disable() at all? Yes, the
*atomic* one obviously needed it. But why does this new one need to
disable page faults?

[ I'm just reading the patches, I didn't try to apply them and look at
the end result, so I might have missed something ]

The only other worry I would have is just test coverage of this
change. I suspect very few developers use HIGHMEM. And I know the
various test robots don't tend to test 32-bit either.

But apart from that question about naming (and perhaps replacing
kmap() entirely), I very much like it.

                        Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
