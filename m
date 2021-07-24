Return-Path: <SRS0=MVRP=MQ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE21C43216
	for <linux-snps-arc@archiver.kernel.org>; Sat, 24 Jul 2021 09:45:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0189A60E9C
	for <linux-snps-arc@archiver.kernel.org>; Sat, 24 Jul 2021 09:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0189A60E9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8mT5krhcJJmtEzKy6zjoAnVPHnT5icp1hMT0BlprMU=; b=bw8SbcLtwdr+MU
	pomAzoiq8b1rnKlp2HYR/sI32Yc5uqMpTXyl6mUsbJ5pUWZVamWmTTz2iKvuOcSl+XnTHW9xP/Luu
	xN2PEPolXPitb5VNAy1sqweRA16NXIcslk6zUBmbxuvFLmEEpA9mddbq1DGtoPthtTNPXF4Uo2Gtr
	jra1MZjD7EDfmMNAgj8+w1QKQ6sf2+9MKVEDcYLSiFBPfTVsxDJEyzBmTUMUoy5IKwJjR1ttEWK5p
	ZfnsopiJiX+xt957kQXdQYcG54NKAXICBU/GpACXqjsReCsld5zNkHEf+6NTEnb7LipxdYWp0690Y
	+jrFn3EMpQ7/r2i8QD0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7EDT-0070qv-HZ; Sat, 24 Jul 2021 09:45:07 +0000
Received: from mail-vs1-f47.google.com ([209.85.217.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7EDR-0070q3-0f; Sat, 24 Jul 2021 09:45:06 +0000
Received: by mail-vs1-f47.google.com with SMTP id y18so2463736vsc.1;
 Sat, 24 Jul 2021 02:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=keAmZ2CPCYhvSQ4mOFSu6xYJjSpZyH/RHb87AkV/yrs=;
 b=qyEYpldAx7qXMx723HPb8ATIx8vNZ6Rf4Pa2z520+d/uQjJlN86LinrQiU4UT+vgmg
 KoKBEZouMrxqAHBwGQ9y2xu/ThD1/w2T8w9u9FIGWmvAiwXuVJk7IEXBHzfWFX2eZT9f
 R4a6xvGR+ftCFWy2FrtpNJmYYT98wNOY2/sKpfgdoGvTrSr4Fg5L+r6wkWa/HdNu9/l0
 SrShTS/E2l20qtwAvPQCQVDiTfAhAgHQ9B0lQcQ7QVIdODmWT200Y2I93y3ag1fbPV2j
 r7dUsBq4MfymY1g+UdLHpsHzS8aCseMzThe2YRTtkphqdFdX/CX7jfYjUEHnhkeG8D3Z
 yDjQ==
X-Gm-Message-State: AOAM532pSNEtV+6Y5PGABSXVxYc+KdtPpdXlypcnWZW+yRwEEKPKYnxz
 cWl1ZtJOWCV0tCFhZLdqmveR1djqWAFFWUV6b5I=
X-Google-Smtp-Source: ABdhPJx/VMaxoCtidt2JUmSZoVwy1uJ8nMQedSbWMl9RC/U3GJflf2tGEudtsRyYEnzq9MLjJYaEo+n0/LkpOXoH+rA=
X-Received: by 2002:a05:6102:2828:: with SMTP id
 ba8mr7652479vsb.18.1627119902711; 
 Sat, 24 Jul 2021 02:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210722124814.778059-1-arnd@kernel.org>
 <20210722124814.778059-10-arnd@kernel.org>
In-Reply-To: <20210722124814.778059-10-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 24 Jul 2021 11:44:51 +0200
Message-ID: <CAMuHMdWjZWMtXqyLWPsCvNphoc2ZHut+UiwLuqDtG7Vir0OR2A@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] asm-generic: reverse GENERIC_{STRNCPY_FROM,
 STRNLEN}_USER symbols
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linux-Arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Al Viro <viro@zeniv.linux.org.uk>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Brian Cain <bcain@codeaurora.org>, 
 Chris Zankel <chris@zankel.net>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Christoph Hellwig <hch@lst.de>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, 
 Helge Deller <deller@gmx.de>, Jeff Dike <jdike@addtoit.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>, 
 Michal Simek <monstr@monstr.eu>, Richard Weinberger <richard@nod.at>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vasily Gorbik <gor@linux.ibm.com>, 
 Vineet Gupta <vgupta@synopsys.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-csky@vger.kernel.org, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, 
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 linux-s390 <linux-s390@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>, 
 linux-um <linux-um@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, 
 "moderated list:H8/300 ARCHITECTURE" <uclinux-h8-devel@lists.sourceforge.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210724_024505_101408_414F7E46 
X-CRM114-Status: GOOD (  21.74  )
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

On Thu, Jul 22, 2021 at 2:50 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Most architectures do not need a custom implementation, and in most
> cases the generic implementation is preferred, so change the polariy
> on these Kconfig symbols to require architectures to select them when
> they provide their own version.
>
> The new name is CONFIG_ARCH_HAS_{STRNCPY_FROM,STRNLEN}_USER.
>
> The remaining architectures at the moment are: ia64, mips, parisc,
> s390, um and xtensa. We should probably convert these as well, but
> I was not sure how far to take this series.
>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Jeff Dike <jdike@addtoit.com>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: linux-ia64@vger.kernel.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> Cc: linux-xtensa@linux-xtensa.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

>  arch/m68k/Kconfig                 |  2 --

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
