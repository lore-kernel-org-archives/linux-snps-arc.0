Return-Path: <SRS0=iBOu=C5=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A70BC4346A
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Sep 2020 08:24:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BFA520897
	for <linux-snps-arc@archiver.kernel.org>; Sun, 20 Sep 2020 08:24:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="raTNdm5a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="KpEMjAVs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BFA520897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kwQC8mrozSAjo569PJzX2nm09hoG7uCNkpdKLvorro8=; b=raTNdm5axEIHYPrfl2G/VACwC
	x7yEuXJ8XuUmqmt6FHAiytUm9dKQSIYDq+OgPBq0DkoeXzkFKOA1mYhaWOwZVz7Da+4EZP6A/P34N
	aNJ6w0SD5Oz7CMAcIY49KuvMoQNLZlkYGSWOXhy1L2gnzrQKZwMJpEFLoyvi3studBX/ND2ND3Z0W
	jSVN9WoQmWAeo6QaQmziKiaiCl/uLc0I+qjaXrMRh+SoSK1lLD6RslVlXk8T5lsTYlM6rY1p2eBKX
	MLR1RSYWYR71VRzi0VJmA+6SEI75rhwrhTCyiInuHnoVQqCr8Xc74pcJMiUP7UaPjdg1bMG4BofwZ
	l8j++dFyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJudh-0001zR-Fl; Sun, 20 Sep 2020 08:24:05 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJudd-0001xs-U3
 for linux-snps-arc@lists.infradead.org; Sun, 20 Sep 2020 08:24:03 +0000
Received: by mail-wr1-x442.google.com with SMTP id g4so9636419wrs.5
 for <linux-snps-arc@lists.infradead.org>; Sun, 20 Sep 2020 01:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=QW/8f02YUz9CyJxz2jJDAPCwQUNyEsIs6ErdQRH78bk=;
 b=KpEMjAVsWIsf6j85U5lGiCQk94IKAbNlzJpqqh7UlpZP+uHxVyI9xbDPp+PEj35Klr
 Fp0pmrJPV4QcEqfbWznBKmcAQ+Q7J+2NCTy4gUD/Rd5fRLvQ3GCVnl4V8YU78MIWGtmi
 zOs5T/os04dSRrngCDI5iUuJvEbe2rp33EGPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=QW/8f02YUz9CyJxz2jJDAPCwQUNyEsIs6ErdQRH78bk=;
 b=T3k5jISw/yKtUkWEHNBcJU4RhDv+M9lNJKnF393+OeXTQlbE+DmquQKc+htAjeRBlw
 6iXexXxk49wfu+tEP1dEz6WSeSMviZmMaX8vRdzPvwLPjz/dt3K9rZx4uR84aHRY/3Pp
 fRryTR52BA/8E+Qd7uiiwA5L79SPN++fX9Sx5w4C1pToxPVI92NWZZZcEVna+e9ZXRyv
 JOC4qzCamWtZOTGPnWx02t45uy3z7B3UkyS0i9uXrCSlYBiCIMvwNBjpCTWXvQ2XNrWJ
 +GTRaSJQ0j7seBlzoZEjIJPu2YwEpy2dHFYLTKzE3/jY0O8q+s2aslQ4NyLon1AulZGt
 Kh3w==
X-Gm-Message-State: AOAM533JILLSUzrf7drj8oesw6DJFRVCacHaY8WT21lpSI4Cby+vN23Z
 cleu606fc6r6ZI2OwGlRGyl0Bw==
X-Google-Smtp-Source: ABdhPJxNYcqTcvbH9VqF1Sc6UfalSbf2k2pQjIV2s6WyfB9ecjNuyH5YNGsmVXrxzF1y/be4tY28HQ==
X-Received: by 2002:a5d:6886:: with SMTP id h6mr48291568wru.374.1600590237536; 
 Sun, 20 Sep 2020 01:23:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i16sm13867150wrq.73.2020.09.20.01.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 01:23:56 -0700 (PDT)
Date: Sun, 20 Sep 2020 10:23:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
Message-ID: <20200920082353.GG438822@phenom.ffwll.local>
Mail-Followup-To: Thomas Gleixner <tglx@linutronix.de>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:GENERIC INCLUDE/A..." <linux-arch@vger.kernel.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Paul McKenney <paulmck@kernel.org>, X86 ML <x86@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux-MM <linux-mm@kvack.org>, Russell King <linux@armlinux.org.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-xtensa@linux-xtensa.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Vineet Gupta <vgupta@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
References: <20200919091751.011116649@linutronix.de>
 <CAKMK7uHTVJL2jGtCg61zG=myiF1BSk+yDdRYikcm-Mq_1TQWMQ@mail.gmail.com>
 <CAKMK7uENFDANQKebS_H0bhHeQRijrp1aVHQqyZPute3KBZ+fVQ@mail.gmail.com>
 <87pn6hc6g1.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87pn6hc6g1.fsf@nanos.tec.linutronix.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200920_042401_992567_C418857D 
X-CRM114-Status: GOOD (  23.40  )
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
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 "open list:GENERIC INCLUDE/A..." <linux-arch@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, X86 ML <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Mel Gorman <mgorman@suse.de>,
 arcml <linux-snps-arc@lists.infradead.org>, linux-xtensa@linux-xtensa.org,
 Paul McKenney <paulmck@kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
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

On Sun, Sep 20, 2020 at 08:23:26AM +0200, Thomas Gleixner wrote:
> On Sat, Sep 19 2020 at 12:37, Daniel Vetter wrote:
> > On Sat, Sep 19, 2020 at 12:35 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >> I think it should be the case, but I want to double check: Will
> >> copy_*_user be allowed within a kmap_temporary section? This would
> >> allow us to ditch an absolute pile of slowpaths.
> >
> > (coffee just kicked in) copy_*_user is ofc allowed, but if you hit a
> > page fault you get a short read/write. This looks like it would remove
> > the need to handle these in a slowpath, since page faults can now be
> > served in this new kmap_temporary sections. But this sounds too good
> > to be true, so I'm wondering what I'm missing.
> 
> In principle we could allow pagefaults, but not with the currently
> proposed interface which can be called from any context. Obviously if
> called from atomic context it can't handle user page faults.
 
Yeah that's clear, but does the implemention need to disable pagefaults
unconditionally?

> In theory we could make a variant which does not disable pagefaults, but
> that's what kmap() already provides.

Currently we have a bunch of code which roughly does

	kmap_atomic();
	copy_*_user();
	kunmap_atomic();

	if (short_copy_user) {
		kmap();
		copy_*_user(remaining_stuff);
		kunmap();
	}

And the only reason is that kmap is a notch slower, hence the fastpath. If
we get a kmap which is fast and allows pagefaults (only in contexts that
allow pagefaults already ofc) then we can ditch a pile of kmap users.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
