Return-Path: <SRS0=eli2=EF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26EB0C00A89
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 22:53:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BBAB20825
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 22:53:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wV+pfHcX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NSjEistX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BBAB20825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EIY3H0SrMauR4RvDwl+dcRu95d5TcV/NPIELLsMIY2Q=; b=wV+pfHcXIIrJ8A2eMSduZwuMM
	Qd5JEA7WUCnIep5KZUwcLQ7oeo7lKS3qSvdPnGmv8ko5wAA2KzBBp85WOzwk/E1BxCYN2wNctS3EJ
	pVnuLFtq2ob7zEDg/C0+uqv+DlK3/IWoDE/QgZafQHLsN5BCWhSwcBJ1T7hnF1uoTis+xBakzpZmt
	VmMDNaZ+qbAKUitA2Msv1xJNPk5t1KmhnlAstiAbFQpMY/57BW97a+/gBUrNzZHoMtiClQIPl9xOm
	2+hkOutGVtnn7hdrY3K9OpF41u3E8HKcOwx12EktNLzfXE2iCp7GaVqB64rGCUUdZD0QUdKYyfVoU
	AkAlwXzNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYdGt-0007qp-R3; Fri, 30 Oct 2020 22:53:23 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYdGr-0007qS-BY
 for linux-snps-arc@lists.infradead.org; Fri, 30 Oct 2020 22:53:22 +0000
Received: by mail-ed1-x543.google.com with SMTP id t11so8225269edj.13
 for <linux-snps-arc@lists.infradead.org>; Fri, 30 Oct 2020 15:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FrhxrWCIONXWoPxsDWMRBR+W10EJDGZ7OkgmkAXhFNU=;
 b=NSjEistXDK7QrUisKBKyvvsUCTs8KpdALOTDGFQa3ZlxOrfYPgQ15P5Hp32THt3kZR
 cN7sjbd0KoMQ3npg9DHgup7Q9J8GXdmUQ8lIGjC/f9HFg6XaYw9GqJyObayLgtYOnfyC
 +DPogaxfsLaFCM9OrmD2eUZrIvZD8sMP/wXjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FrhxrWCIONXWoPxsDWMRBR+W10EJDGZ7OkgmkAXhFNU=;
 b=VK/n6a2hHwy7S2EpFslW/07anEj6g09rI4l5eMkJ4N4JB0FvgmHYG8VvfRPSBhaqE8
 r2kMHvQM/LbxPUiNaAe/SLZhsttAug0svdbHTYXZKztHBcERvL/8rERE6bD9QQEo+Ter
 VXAc+V1ztyhtTKr2aNFQviN4dGclnZROmY4E/DZPmk9Pd96T0A2+OrP/h8qvNmWeWOAH
 BI1r6FeyRDkovRUEqmv1ExPx2faaMOXmjI58nPjHFtQBY7OaYLWR1USg9w3/PDvmIPDZ
 zgvJd/FVSjLVh0K5BpjpAive1zdJym2sP73X5ikTFMIs5t0bVMm4eVGiLu1t9C8hmObu
 bCZQ==
X-Gm-Message-State: AOAM530qc8ON2b37KbyN1o/541y9Z34RTTFm6f1AXlNOgEx60L6o6dht
 uNKhs+RjHDLThX99mNFqn+m+KktHttxSLg==
X-Google-Smtp-Source: ABdhPJxnT/JumrKCfxArvP4kG0zZWhUVm4CfJtw4hJ+vt2ZgIYoqSM52eNkhNVaiQLy/MRpIvWv1Jw==
X-Received: by 2002:aa7:c2d7:: with SMTP id m23mr4946445edp.230.1604098399863; 
 Fri, 30 Oct 2020 15:53:19 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50])
 by smtp.gmail.com with ESMTPSA id g1sm2485537ejz.52.2020.10.30.15.53.19
 for <linux-snps-arc@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 15:53:19 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id p93so8284006edd.7
 for <linux-snps-arc@lists.infradead.org>; Fri, 30 Oct 2020 15:53:19 -0700 (PDT)
X-Received: by 2002:a19:4815:: with SMTP id v21mr1949766lfa.603.1604098002560; 
 Fri, 30 Oct 2020 15:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20201029221806.189523375@linutronix.de>
 <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
 <87pn50ob0s.fsf@nanos.tec.linutronix.de>
 <87blgknjcw.fsf@nanos.tec.linutronix.de>
 <CAHk-=whsJv0bwWRVZHsLoSe48ykAea6T7Oi=G+r8ckLrZ0YUpg@mail.gmail.com>
 <87sg9vl59i.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87sg9vl59i.fsf@nanos.tec.linutronix.de>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 Oct 2020 15:46:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjjO9BtTUAsLraqZqdzaPGJ-qvubZfwUsmRUX896eHcGw@mail.gmail.com>
Message-ID: <CAHk-=wjjO9BtTUAsLraqZqdzaPGJ-qvubZfwUsmRUX896eHcGw@mail.gmail.com>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic &
 friends
To: Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_185321_397794_042D965C 
X-CRM114-Status: GOOD (  18.23  )
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
 Guo Ren <guoren@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 linux-sparc <sparclinux@vger.kernel.org>, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
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

On Fri, Oct 30, 2020 at 3:26 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> While at it I might have a look at that debug request from Willy in the
> other end of this thread. Any comment on that?
>
>  https://lore.kernel.org/r/87k0v7mrrd.fsf@nanos.tec.linutronix.de

I do think that it would be nice to have a debug mode, particularly
since over the last few years we've really lost a lot of HIGHMEM
coverage (to the point that I've wondered how worthwhile it really is
to support at all any more - I think it's Arnd who argued that it's
mainly some embedded ARM variants that will want it for the forseeable
future).

So I'm honestly somewhat torn. I think HIGHMEM is dying, and yes that
argues for "non-HIGHMEM had better have some debug coverage", but at
the same time I think it doesn't even really matter any more. At some
point those embedded ARM platforms just aren't even interesting - they
might as well use older kernels if they are the only thing really
arguing for HIGHMEM at all.

This is one reason why I'd like the new kmap_local() to be a no-op,
and I'd prefer for it to have no other side effects - because I want
to be ready to remove it entirely some day. And if we end up having
some transition where people start rewriting "kmap_atomic()" to be
"kmap_local() + explicit preemption disable", then I think that would
be a good step on that whole "kmap will eventually go away" path.

But I do *not* believe that we need to add _so_ much debug support
that we'd catch Willy's "more than one page" case. And I absolutely do
not believe for a second that we should start caring about compound
pages. NO. kmap() is almost dead already, we're not making it worse.

To me, your patch series has two big advantages:

 - more common code

 - kmap_local() becomes more of a no-op

and the last thing we want is to expand on kmap.

           Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
