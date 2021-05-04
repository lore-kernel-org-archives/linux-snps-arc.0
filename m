Return-Path: <SRS0=zACa=J7=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B5DC433ED
	for <linux-snps-arc@archiver.kernel.org>; Tue,  4 May 2021 07:43:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87DF46103E
	for <linux-snps-arc@archiver.kernel.org>; Tue,  4 May 2021 07:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87DF46103E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bZbpSlUed2W1p7pqUAgf9fp5rDlsS9nsbvjiwVzOpDg=; b=E1rI1ZKeKLIS1ns5C20CCUJFW
	33KslH6LOg28KXhG5GwmDVn27gwAZFH8ithsdf38gCogZxyvWd+qPuxdoHyR0/pEvxLjsq2/s231k
	NgnfvNCqclCdWHKheKCeqK0fMOZqU+WfrGU6C75Iiao8Gw7g6zDuB9i+lesXcUI8dw8t08Tl3j1lk
	LxnLSgtsCqvGjakFbH8LI4E2qRJaJw6lH9QfPcj45OvoyQcB7FmLpxPKry4x2I5lLaM+tdA4AduUS
	KWT2yeUhdBx97lIzuFT7ClnWjSF7m080MomzW6FWwrcJjzC5NGyCI7uCY2rBZWsbZXblVNB+p7btt
	vmKzD04HQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldpiO-00FdWB-10; Tue, 04 May 2021 07:43:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldpiL-00FdVd-50
 for linux-snps-arc@desiato.infradead.org; Tue, 04 May 2021 07:43:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RsxmJ3CkjmkMpHegsJNlfhO/q/121mECPPSz+mdU8Vk=; b=OVp0lp7jP0UhpP+A6XgmN2Kb7V
 99Z2J6IR/2S0GR7IkcELayO3XnO5UmIvh/wu236vxvj2shgASQZbnXFG4x/kJmbKlwrUVYUVdorMN
 K9XgeMNldqxGOTm+4KhRH54/B+5E1jR1lbxmbkFgjiG6OKEzDNsVZR1HMH9ditJzMOsRAG1w9Xflb
 kYIjZytf8JELNR4UXFfFNRnCtknUo8j1YTCa2/wTgfxRN6Cpl8TOixfjytdA4DK+Cj/HLZQ2cVLuy
 7QWnwsX8lGc+7THoZBlhBO+Rk1Bw1CfxvL8uC9pRS2epjmdWp9MoBP9MN59lJ13Fh6XTjkCLORy0o
 P8khucYw==;
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldpiI-003m6h-D6
 for linux-snps-arc@lists.infradead.org; Tue, 04 May 2021 07:43:27 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N6Kl7-1lSqH53hxR-016eRR for <linux-snps-arc@lists.infradead.org>; Tue, 04
 May 2021 09:43:22 +0200
Received: by mail-wr1-f49.google.com with SMTP id l14so8230311wrx.5
 for <linux-snps-arc@lists.infradead.org>; Tue, 04 May 2021 00:43:22 -0700 (PDT)
X-Gm-Message-State: AOAM5317Tvq/paSagBGi3oTJBVL7Fl5zLsb/+5DyKKyxnwKZuGwr72PL
 hxg42IwzozCTuNJEvqKShnaN9wfWTYjmLwEI7a4=
X-Google-Smtp-Source: ABdhPJwmQ0TWMpLbjB8m36FPm0+mFnFt1RjNALmJYjdOwkjE12j3BzFHniwAOiE13u6QZ6b9BCL1HxKmH7RGeYuBGWg=
X-Received: by 2002:a5d:6a52:: with SMTP id t18mr12372887wrw.361.1620114202631; 
 Tue, 04 May 2021 00:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210430111641.1911207-1-schnelle@linux.ibm.com>
 <CAK8P3a3mCujxC0=_cL6Z88Xh2cb=OY_Ct7DVpJNvRn1v9=FhkQ@mail.gmail.com>
 <9e52895227515143bf3cd9197876ff1ed596682b.camel@linux.ibm.com>
In-Reply-To: <9e52895227515143bf3cd9197876ff1ed596682b.camel@linux.ibm.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 4 May 2021 09:42:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1F1X2SUZLLxK8_QriRZjYyV2AYJFNQt=sGZcWP8yovaw@mail.gmail.com>
Message-ID: <CAK8P3a1F1X2SUZLLxK8_QriRZjYyV2AYJFNQt=sGZcWP8yovaw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] asm-generic/io.h: Silence -Wnull-pointer-arithmetic
 warning on PCI_IOBASE
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Vineet Gupta <vgupta@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, 
 clang-built-linux <clang-built-linux@googlegroups.com>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
 sparclinux <sparclinux@vger.kernel.org>
X-Provags-ID: V03:K1:o6lwlBWnALmIJLZZtYV6fFL9YAuR7UcBYc96hx8y1XwiiH08wLn
 d8jRtg+PRj+3Uig1iVmnrgXzcbUwSpmokDxQJpETz2VdRq//b0Ij7kX9jZavUpFdGkukTZr
 cZNAwvq1RilXCt1yq3dO7/wZnBQn6PgLJxZCWUOWpJbO/KYy/ORJ+LVt1NkwN12CRL1xCcq
 grNxI2yHFhJJbgNfoaPlQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xNQ+AoiHPOk=:exxbD6Z0thT1qN3fwNd0Y4
 rMIFgHoY1T8d6gmOIw2sA6ifnpUQcJi0/uy1h0Uw3xcb3nC8xrTW7+IjD70xIdgjSE6cBmX4/
 l8tjHD3ogPR5NouvsPS09njyBt7oYeSl2RLPK01FikEQAuItjcGzOu+p5PxljNI0iggrX3Pok
 xl1Rf7ZUUwvVX2z+z1Bpy5hKshhL/MMPeL37NiLk6srpdpseCaQxf3TBN5EpSWjEPM79PYxOs
 gF5dH6DOsrR3C0eUOHqorXO94hYG9RCKyJbrmPd5H+LMZYcmyS0LuikzSZbDPB1x0jMez1grf
 nwGMvworab7rvDVjRbgrZFWKPRidXRID3a+zzgSffCw7FrArnTPWcCcNQ+kddPKGh8aKt+7jS
 9vFLlQ8M7Y1Hef3dMuK5rDQGqnAqSvbSpxPJzzz8FAcOmr8qyVpTZVXExLt+Orz3hWOhncSVG
 6FLkQTwO2m8RxALLUKwso6ks4xVZVYBiNXk8ynrPv8bpdQyL42oHUd6uP8NST26Ad/FDXwOLK
 mUukPlKwj3KVMhRRiTAmC3Kcadk2+kDrVel98UqM6JSy8B0Zd+aUk+1aF/ggGWNmqQV3YYBqr
 SyT65t5D53aWg+Zw1+S9CNN0UpeCFlhA/rKOGOYBwmnxVpvHJEA45toiC9m5lhy0yO1BQdOGf
 9rQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_004326_753468_2785F660 
X-CRM114-Status: GOOD (  18.69  )
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

On Tue, May 4, 2021 at 9:40 AM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> On Mon, 2021-05-03 at 18:07 +0200, Arnd Bergmann wrote:
> > - for the risc-v patch, I would suggest explaining that this fixes
> >   an existing runtime bug, not just a compiler error:
> >   | This is already broken, as accessing a fixed I/O port number of
> >   | an ISA device on NOMMU RISC-V would turn into a NULL pointer
> >   | dereference.
> >   Feel free to either copy this, or use your own explanation.
>
> I mixed the above in with the current commit message:
>
>     Without MMU support PCI_IOBASE is left undefined because PCI_IO_END is
>     VMEMMAP_START. Nevertheless the in*()/out*() helper macros are left
>     defined with uses of PCI_IOBASE. At the moment this only compiles
>     because asm-generic/io.h defines PCI_IOBASE as 0 if it is undefined and
>     so at macro expansion PCI_IOBASE is defined. This leads to compilation
>     errors when asm-generic/io.h is changed to leave PCI_IOBASE undefined.
>     More importantly it is currently broken at runtime, as accessing a fixed
>     I/O port number of an ISA device on NOMMU RISC-V would turn into a NULL
>     pointer dereference. Instead only define the in*()/out*() helper macros
>     with MMU support and fall back to the asm-generic/io.h helper stubs
>     otherwise.

Looks good, thanks. Maybe split into two or three paragraphs for readability.

     Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
