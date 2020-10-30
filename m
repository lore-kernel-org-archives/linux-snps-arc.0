Return-Path: <SRS0=eli2=EF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A250BC00A89
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 20:34:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F207520791
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 20:34:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J2WWPff/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="J8d/YD59"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F207520791
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/+EeaHSd1tEKwmQCmh3MHW56Uax0On4UBfXm8VE16kQ=; b=J2WWPff/TvXYzI7Eg6Cq2mQO+
	+CE+8gtnJvTMY13qFDw9t+42YTMdHqox5u+HM1pGZu8U2KS3wzChzDAZodSus4kMv5BijnTQhEYQZ
	Wbvekfw/yRx+fXk6rzm+/PGQ5kdhu0tHJnsmzZUWuwica8CubZ17YaqYotASOvLRat9vozDM6mofE
	6oMMng8FqAsiUweTTWIN/YVTufR4qt11vGp/ZX5+u4A3D3mx4+rh/0qEmjLWU4DfENT3QPCpLC7Nj
	4gklOK7csH5DhOHvTyKnvi/nOKBJ8F+qG+ogVF/thc6xGxSCi7GIdjrTovSapUCmwCWRvxT7WKrjE
	kWoo7MMzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYb6N-0002jl-VN; Fri, 30 Oct 2020 20:34:24 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYb6K-0002j2-2c
 for linux-snps-arc@lists.infradead.org; Fri, 30 Oct 2020 20:34:21 +0000
Received: by mail-lj1-x243.google.com with SMTP id t13so8224008ljk.12
 for <linux-snps-arc@lists.infradead.org>; Fri, 30 Oct 2020 13:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kjos0+S2Gon+fH3b26doFlCP2cxrfT62BjLoezK4rG4=;
 b=J8d/YD59wQ/au5l1BQ7ue2vwfU1yPmEzaWIbs72/a3aDX73KGLSsh/e6e4T2ilr+m6
 v7YctKloyJWKSYk1q7y81pi983c4f8E7/f/kLdP0CFwMkO7uyjtkdfJgwTbIAUd3yTgV
 b5YrSxtLonkg9fnewHN7YslOk1fl6e5oIhge0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kjos0+S2Gon+fH3b26doFlCP2cxrfT62BjLoezK4rG4=;
 b=TfVIe+QkvuRa/OeBBNrfE7wyaA4ha+/Bac5qON20uDK04ZZMPGopXp3VbKzMhTQ7wf
 wYuHk3r0SUdnLsIUewfTJL7GPz3sxBDlKN3mnngdcSEH4yqbM80NHJFbkdP/0RzhmivP
 cLOHs6LWkBEc/B8vcfNo/i+QeJU8YGk9L8VRZckqqzpQjlUNyhthgVr9dB4gS+wpRqM3
 +ZQkvEFGxYz3KSQrQ6QUWAoNRoGEepiksY06v8LWpeV4EhDohyvxoag6fmqVjoTr+Wux
 ZLuTuE3FXibkuHFYJE5doIYuRxqz11tp/Zdmhnc6GZi4fPHpcJ0BASop9Ps6l116xm6V
 zXzw==
X-Gm-Message-State: AOAM532wWS/1rBchShHcGTz/ROg5603slX2796eFvmbK0BXKIDATX3CU
 nSzd+tNsganzWw20nLSlzqHrCUADf4Kvlw==
X-Google-Smtp-Source: ABdhPJwHvdpXaBsfZ1SILX7d8VOXKMvXye6i7V6zdWL6/KKcHBmuw9rEBeJsbPM3u3nR1ozhFhKaCg==
X-Received: by 2002:a2e:9c84:: with SMTP id x4mr1780088lji.326.1604090056803; 
 Fri, 30 Oct 2020 13:34:16 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com.
 [209.85.208.182])
 by smtp.gmail.com with ESMTPSA id e6sm721933lfn.72.2020.10.30.13.34.16
 for <linux-snps-arc@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 13:34:16 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id d24so8234967ljg.10
 for <linux-snps-arc@lists.infradead.org>; Fri, 30 Oct 2020 13:34:16 -0700 (PDT)
X-Received: by 2002:a2e:760a:: with SMTP id r10mr1661953ljc.421.1604089720167; 
 Fri, 30 Oct 2020 13:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201029221806.189523375@linutronix.de>
 <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
 <87pn50ob0s.fsf@nanos.tec.linutronix.de>
 <87blgknjcw.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87blgknjcw.fsf@nanos.tec.linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 Oct 2020 13:28:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=whsJv0bwWRVZHsLoSe48ykAea6T7Oi=G+r8ckLrZ0YUpg@mail.gmail.com>
Message-ID: <CAHk-=whsJv0bwWRVZHsLoSe48ykAea6T7Oi=G+r8ckLrZ0YUpg@mail.gmail.com>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic &
 friends
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_163420_170654_7F79271D 
X-CRM114-Status: GOOD (  17.10  )
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-xtensa@linux-xtensa.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, Linux-MM <linux-mm@kvack.org>,
 Guo Ren <guoren@kernel.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Vincent Chen <deanbo422@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, David Airlie <airlied@linux.ie>,
 Mel Gorman <mgorman@suse.de>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Ard Biesheuvel <ardb@kernel.org>, Paul McKenney <paulmck@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>, Greentime Hu <green.hu@gmail.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, Oct 30, 2020 at 2:39 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> But then we really should not name it kmap_local. 'local' suggests
> locality, think local_irq*, local_bh* ... kmap_task would be more
> accurate then.

So the main reason I'd like to see it is because I think on a
non-highmem machine, the new kmap should be a complete no-op. IOW,
we'd make sure that there are no costs, no need to increment any
"restrict migration" counts etc.

It's been a bit of a pain to have kmap_atomic() have magical side
semantics that people might then depend on.

I think "local" could still work as a name, because it would have to
be thread-local (and maybe we'd want a debug mode where that gets
verified, as actual HIGHMEM machines are getting rare).

I'd avoid "task", because that implies (to me, at least) that it
wouldn't be good for interrupts etc that don't have a task context.

I think the main issue is that it has to be released in the same
context as it was created (ie no passing those things around to other
contexts). I think "local" is fine for that, but I could imagine other
names. The ones that come to mind are somewhat cumbersome, though
("shortterm" or "local_ctx" or something along those lines).

I dunno.

              Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
