Return-Path: <SRS0=2K9J=JS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA01C433B4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Apr 2021 08:58:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F151D61437
	for <linux-snps-arc@archiver.kernel.org>; Wed, 21 Apr 2021 08:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F151D61437
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6n8T7m83W40CakYbRu0BxhNSAugWxjWk68dlPMAfATs=; b=Ge5G3ehZOlszFjw0Aw9LCuYoN
	FL0fHNKyWvR4jdcwTcA/KlQnoZSoTQTGr70hWCdfDUaOF9c6DkR9aCPPll1N6vcvIvyhyVTeYhUdJ
	siJh2sXGjN0Vy79/HCbB/RL0B6KZc3Sp73yN+42tJcpARlAUTQ5a7MNEI/0sCAI0j56sRGb4CzYwX
	g3vS5Orv9YxjSPp0viGwxQTm7UoBajHu8Fe0vOcATKXIzk+FbD9RgmXSftB6v/fMjnUybe5habT3n
	rmN4Sceq070YTymRDqOyUar49PgkN1yAd2ozk45re27J+H+ufVC13lcUn3zwRYGZ9rRFW0hYimlWl
	2PvX1zRtg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ8hC-00E2GM-6R; Wed, 21 Apr 2021 08:58:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8h0-00E2Fj-HR; Wed, 21 Apr 2021 08:58:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vXB9BltYL4qczMrmq6PUXNpGa27a++HVt7BjrbXMCdI=; b=1lfxet2G26+tketvKi1zXFRQ20
 M/AXny1u/1JZh9j/+bZrqYro0rthpkA708rM288KGbPP3K8Te5Zobv71jVIhMkngWonFy2Gky6jcv
 WY0wJyo3+bIqYXlrDNqmh/zQHB3ZgdIrGLLv4mcaS+cqX8aedy2p7jaYW7iROupB5zciBOOgSY+HH
 XU792ZZuAOezu3oJhV0AkmOS7UCcv7gNKKjR9ebWbM2ll1mTyTEmM0l1BaVQ+udCNoYtssIfeOGI4
 wa0Sz+QJjtyXa9BtyjeL8LMhK+3Vk5uzuTI6Z4yZfyCWJzjtaZy8EYUp+gWTvOzEhaPWTWXDQbTe8
 TKGxUJbA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8gx-00CjFc-Uq; Wed, 21 Apr 2021 08:58:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E91886144B;
 Wed, 21 Apr 2021 08:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618995518;
 bh=64KJf6xIhQSnl3PhQoQ0a9YdaBe+gMwA8Np6LwW1+/4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KspKrNpocGC+THW2FQf8l/RTxYj9VsuAMN9o6fRqaCIHROlddiUnVoGVbSJevcK8P
 t9Ih4ay4gNZRHVDqglHOGunFJvorx346JxWj8TRSdxkGT0Mx+bIg6kSOy9/tw6wrli
 AyoCGd/Aj4lwDeEU4D5FwKzcgcMb/8X46RKGEXUG2g1sE3gyPvvaBF9LVNzp8ElJtH
 nxpWNiCTcCzxZsHmOA3b5MzE1AlJaFRQLBbGl79XxBJRzbOZ0HNJnsSBV2Azw6FIoW
 hMQ03qhaDP19GOcFUHxal2wg+Dsk2MwLLe7C5x4sfsipcA0LcpO/cD4GZh1Ilzc8Wj
 Fofb7CfADu1kg==
Received: by mail-wm1-f43.google.com with SMTP id
 n4-20020a05600c4f84b029013151278decso790556wmq.4; 
 Wed, 21 Apr 2021 01:58:38 -0700 (PDT)
X-Gm-Message-State: AOAM5318QSC4DcvF13tGgO/PZUEjLI5cqFRf36kC6REBrOZr+NFyZdaO
 S2qNNn2AVQJgpng/RBefAczVz1ojgtCVMVGNaDM=
X-Google-Smtp-Source: ABdhPJzfODrhPhGfivkqeugtVvYFeuZiRdEx50xM7G3CMPJPgDkMCFmpfx3SbcIBA3tmKParqz5KGFeTEwP9bSV2emc=
X-Received: by 2002:a05:600c:2282:: with SMTP id
 2mr8921317wmf.84.1618995517297; 
 Wed, 21 Apr 2021 01:58:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
 <9f99b0a0-f1c1-f3b0-5f84-3a4bfc711725@synopsys.com>
 <20210420031029.GI2531743@casper.infradead.org>
 <CAK8P3a0KUwf1Z0bHiUaHC2nHztevkxg5_FBSzHddNeSsBayWUA@mail.gmail.com>
 <8d0fce1c-be7c-1c9b-bf5c-0c531db496ac@synopsys.com>
 <CAK8P3a3rzz1gfNLoGC8aZJiAC-tgZYD6P8pQsoEfgCAmQK=FAw@mail.gmail.com>
 <5c41d562589b497ca3c1047e0e18b3a1@AcuMS.aculab.com>
In-Reply-To: <5c41d562589b497ca3c1047e0e18b3a1@AcuMS.aculab.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 21 Apr 2021 10:58:18 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2GN9HVwSjfsXaYVO29zeUNB1hQENRw1K0DXCLdt-M-qA@mail.gmail.com>
Message-ID: <CAK8P3a2GN9HVwSjfsXaYVO29zeUNB1hQENRw1K0DXCLdt-M-qA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
To: David Laight <David.Laight@aculab.com>
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Matthew Wilcox <willy@infradead.org>, 
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>, 
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
 "ilias.apalodimas@linaro.org" <ilias.apalodimas@linaro.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "mhocko@kernel.org" <mhocko@kernel.org>, 
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "mgorman@suse.de" <mgorman@suse.de>,
 "brouer@redhat.com" <brouer@redhat.com>, 
 "mcroce@linux.microsoft.com" <mcroce@linux.microsoft.com>, 
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "hch@lst.de" <hch@lst.de>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_015840_098856_E64E12BA 
X-CRM114-Status: GOOD (  16.83  )
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

On Wed, Apr 21, 2021 at 10:43 AM David Laight <David.Laight@aculab.com> wrote:
> From: Arnd Bergmann Sent: 20 April 2021 22:20
> > On Tue, Apr 20, 2021 at 11:14 PM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
> > > On 4/20/21 12:07 AM, Arnd Bergmann wrote:
> >
> > > >
> > > > which means that half the 32-bit architectures do this. This may
> > > > cause more problems when arc and/or microblaze want to support
> > > > 64-bit kernels and compat mode in the future on their latest hardware,
> > > > as that means duplicating the x86 specific hacks we have for compat.
> > > >
> > > > What is alignof(u64) on 64-bit arc?
> > >
> > > $ echo 'int a = __alignof__(long long);' | arc64-linux-gnu-gcc -xc -
> > > -Wall -S -o - | grep -A1 a: | tail -n 1 | cut -f 3
> > > 8
> >
> > Ok, good.
>
> That test doesn't prove anything.
> Try running on x86:
> $ echo 'int a = __alignof__(long long);' | gcc -xc - -Wall -S -o - -m32
> a:
>         .long   8

Right, I had wondered about that one after I sent the email.

> Using '__alignof__(struct {long long x;})' does give the expected 4.
>
> __alignof__() returns the preferred alignment, not the enforced
> alignmnet - go figure.

I checked the others as well now, and i386 is the only one that
changed here: m68k still has '2', while arc/csky/h8300/microblaze/
nios2/or1k/sh/i386 all have '4' and the rest have '8'.

     Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
