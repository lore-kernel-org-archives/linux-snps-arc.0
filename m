Return-Path: <SRS0=5kko=AK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E9C1C433DF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 29 Jun 2020 15:42:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59820253E9
	for <linux-snps-arc@archiver.kernel.org>; Mon, 29 Jun 2020 15:42:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HsraU74j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59820253E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=paIS95jIUlkTVH6tTdvil1ZgRPDuiH+yHqH+218QAgQ=; b=HsraU74joW7V3L63vTBorOxhS
	txsrWh32zd9Ndf1aVVObH5B1uIIofm45os0Q3SItev2dZVYHJmcYBH+KwtEQGIgS+O4AQU7EhFbQ/
	2edeVT2yjNgyDk8br7XlmYxyF2+w0ZAchKcYE3PFrM14mOkSxOGm7qjaynthxpKl21FGwSJ6xrx08
	MZ13rKthBuS8g8zVeNDARqyHtqL10yVaAHmxCwHazESmnqymHOsdB7SnnmVBJopdJ+FrZ0QYM+qp+
	uISPsT0yo1XdRUd0KfUH4+5DeG+aoUrkhd2XeaYO27rMXz1ngIdB04tgUSFzkdsX7xVmFdGqQKs2f
	LGKp0cFLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpvv9-0000u3-Rb; Mon, 29 Jun 2020 15:42:11 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpvuv-0000of-E4; Mon, 29 Jun 2020 15:41:59 +0000
Received: by mail-ot1-f66.google.com with SMTP id k15so15893628otp.8;
 Mon, 29 Jun 2020 08:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=18DuSBZeLijFT5byeb07kqFnxpD8Og5k3o71uVKMsdg=;
 b=eIyMLpLI2oJIz4mk39KglnldskW3kX1msGSBZvDEuyG5Cf3BrLtcVOUxvzdvzxkWJ4
 IoSznHzkvrAs0G2QLZDPC925iJUcx1cBforU9tr6XOtDoNshYA8QA8Z809qpFr7wHKSS
 la33vFXoTdqXVHfWJOFnA1zD1J8pJp/XuCP8JopKSi+Aomznr5jnXZbn4Pnq6C15VdD3
 5m3BHCK02xC/pU790ImM35vk+hoH9UnkJh+irg2jypzs9E2JK6PcHqkNMXV3fO3nEbtj
 20UJzcdH2u9Mo/Y5w74pDPtMLNA+GFkB/eOwDtYeJSIZRRThPXmpWfhkMU7qbgIrx1ev
 7s8g==
X-Gm-Message-State: AOAM530+S6wZaj/mrJQo3MMHgd7srVIIuUHsES3Cu9QrDkWeQw1IrXq2
 f+VRVucqzsNcZIjEbwG3kXwZLcmftubHbH1H1HZMnQ==
X-Google-Smtp-Source: ABdhPJyfGDnofAtWY6Vq9zQSiEjHHywgsNVHJzUbnOYeAK8rSOSVeLQNZQAOcMed2+/KO3c+bzP8Q5CiqDzs7aUNX9g=
X-Received: by 2002:a05:6830:1451:: with SMTP id
 w17mr1238896otp.250.1593445314725; 
 Mon, 29 Jun 2020 08:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200627143453.31835-1-rppt@kernel.org>
 <20200627143453.31835-2-rppt@kernel.org>
In-Reply-To: <20200627143453.31835-2-rppt@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2020 17:41:43 +0200
Message-ID: <CAMuHMdUOrrrtKuhtWJvzKNNLXY1fx+Ym1oXGN2J_CZ7RqByGHQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] mm: remove unneeded includes of <asm/pgalloc.h>
To: Mike Rapoport <rppt@kernel.org>
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-s390 <linux-s390@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Andy Lutomirski <luto@kernel.org>,
 Stafford Horne <shorne@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Parisc List <linux-parisc@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sat, Jun 27, 2020 at 4:35 PM Mike Rapoport <rppt@kernel.org> wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> In the most cases <asm/pgalloc.h> header is required only for allocations
> of page table memory. Most of the .c files that include that header do not
> use symbols declared in <asm/pgalloc.h> and do not require that header.
>
> As for the other header files that used to include <asm/pgalloc.h>, it is
> possible to move that include into the .c file that actually uses symbols
> from <asm/pgalloc.h> and drop the include from the header file.
>
> The process was somewhat automated using
>
>         sed -i -E '/[<"]asm\/pgalloc\.h/d' \
>                 $(grep -L -w -f /tmp/xx \
>                         $(git grep -E -l '[<"]asm/pgalloc\.h'))
>
> where /tmp/xx contains all the symbols defined in
> arch/*/include/asm/pgalloc.h.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

For the m68k part:
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
