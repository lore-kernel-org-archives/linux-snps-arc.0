Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF8FC433EF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Feb 2022 09:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=blC1J6ZHWiFVyrCdNJoW+7Oe/tSx5O4FFrSUfyjOnbU=; b=K9FZGS9PuDdME0
	NK8dHC0ubIHBuSZrd/vn2HK11iNL5VWuzinqtgSI6kqMmhAH1SQEVNKgs7LbDdTZ/2k/UppV0M7DR
	4ogz1qfErHIzkOVrIkcJIEziEQsrfizXjWUp2GjVJ/7AfhtlrAlwxpH6R4bJI1GDn1LIcyjQZ2/EQ
	P/UqWme3jTMHGR8c9oSfwXcFWvW+Y7GNVbo+3RnRDa6c7JPUweeVXvoCtpREMOrLN8Mc74CUkQEXL
	6s03ujN4msSXlHzimnWDHe5WLX9YeK5HgzBSb+o31/tjMGNeOq3im9arVYGDkXn6ETgzcBXk6M8Gs
	SsPVd0FBD8csKMs9x1HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKd2L-009iWY-Ks; Thu, 17 Feb 2022 09:25:17 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKd2I-009iVI-B1
 for linux-snps-arc@lists.infradead.org; Thu, 17 Feb 2022 09:25:16 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MF3U0-1nVeZy3IjY-00FWS3 for <linux-snps-arc@lists.infradead.org>; Thu, 17
 Feb 2022 10:25:10 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so3561904wmb.0; 
 Thu, 17 Feb 2022 01:25:10 -0800 (PST)
X-Gm-Message-State: AOAM531qnvqncSeSrM0zmX8VeKljxcq+4xSB89B218eJKT1aayAGhHvC
 kwuCBde5dtV2Ce0Mm81S7UhElQc7strnpDnzcW4=
X-Google-Smtp-Source: ABdhPJwu2NVHGHLxx29UDj0eC2QtTDz9ABoGgqvKd5FtPXFo3D/c1j3IHxwDsslquGRbQQhg+y3kZFZQ6qJy+rJ75Go=
X-Received: by 2002:a05:600c:1d27:b0:37c:74bb:2b4d with SMTP id
 l39-20020a05600c1d2700b0037c74bb2b4dmr4990966wms.82.1645085639420; Thu, 17
 Feb 2022 00:13:59 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-1-arnd@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 17 Feb 2022 09:13:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3QBWDYjr6VpPdjTBGFg88DdH3SHVgxEowgScgJOkNguQ@mail.gmail.com>
Message-ID: <CAK8P3a3QBWDYjr6VpPdjTBGFg88DdH3SHVgxEowgScgJOkNguQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/18] clean up asm/uaccess.h, kill set_fs for good
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Brian Cain <bcain@codeaurora.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
 Dinh Nguyen <dinguyen@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Helge Deller <deller@gmx.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Rich Felker <dalias@libc.org>,
 David Miller <davem@davemloft.net>, Richard Weinberger <richard@nod.at>,
 "the arch/x86 maintainers" <x86@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Ard Biesheuvel <ardb@kernel.org>, alpha <linux-alpha@vger.kernel.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-csky@vger.kernel.org, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-ia64@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>, 
 Parisc List <linux-parisc@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linux-um <linux-um@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>
X-Provags-ID: V03:K1:ZqER6QCS7WC7uID6oEtAyZitltO0ST1Kh2U5/VFyflV0gN/YByJ
 QKizKxBxrpJEDa9cClDtQplBjV6y/dL0uREgYB0B7jmlXnr2OzzZBocF+twGAtOh9ZaYy4L
 pd2fhNSWQWoR0FuCz3cUTw/RpJZ6pgEgM2MzXub5nDBcsa77kRoE3+msqjPVEJcyEPDXio8
 8zoZJiB0bWb1yftsB7x/g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oKhhGvYNmeU=:WFS9zRfs4QuDIhmd8WQz8i
 GiPWVpDRDW1rLL67tDlyoXk/5g2mupeF9JCLpYkFGch+0JzqYoctgalOsM6DvmzFm2Kg3xXvU
 B0r0lr8BrA8rm5JwrxP4UKJQgdick2xQnD+Ggtkz7a6nwl99Uon3AuuSfbv39SUICF00Rxppf
 RY33YR5lncfnONH3ibHI2VNNvd8w/0djIgQRGtvKcSmfO7IgJTCv8c/R//nNFf9M/Bb7weDdu
 /JOY9HOBB35fno3MomcPb4K9NG0UjnooCKVCMfG5LgPM8Bgd3wQJJyKO9xdQ+cKbwchKuFrfN
 ZTtuDyVz0s8GWKWLlUoQYJPNgXfMiWyf3hgB1XdU6gr8Z59Gt+4TdWT/1/Ti5GvnPa52HxYWg
 sZEieTgfWGfbzCzCggo694+7oAs3Iol6ttxeUz1BY4YfG+GjflngKv0vxP444e0zYPz96ugE4
 87arpdQ7BX4YlXX1GKjV5GbqzDB+ub0dnKzZNUPd7gnoyKP0hJXsgCgnJeG2WSqShLhJkO8Bk
 kX/cnRngiQdvfdCWTGKVYygAxrO9CWQ5eBilPFl0oI6ABsQl/5KvBqMrdbWANmZ+oGFtEAAdL
 z+fjE5YD6PfwwN3vmGQx/8aXPtU4XsGPcNOqWzjHKV2hdS9iLk2Gi1MYZ7yHFqXHMArA1WyNb
 +3WihK0LhhevCUQLTBjOlkOJOUPNxnxUR/t4JMHCw0yUBkB3nAQnqmnFdCtPXH7bTZQXvUFqx
 bGbcA2sh3Uky+KGecrGBu1EIuPYcGGym15IbiAZrJNnsEaqMacSUpFWQj9plX47Mu++SVebGW
 7OwCCAQcfWc4EoIa9HmYgsEe6XUiTR6oiVMommBQ8cRZCdEc98=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_012514_683151_3451351B 
X-CRM114-Status: GOOD (  21.11  )
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

On Wed, Feb 16, 2022 at 2:13 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Christoph Hellwig and a few others spent a huge effort on removing
> set_fs() from most of the important architectures, but about half the
> other architectures were never completed even though most of them don't
> actually use set_fs() at all.
>
> I did a patch for microblaze at some point, which turned out to be fairly
> generic, and now ported it to most other architectures, using new generic
> implementations of access_ok() and __{get,put}_kernel_nocheck().
>
> Three architectures (sparc64, ia64, and sh) needed some extra work,
> which I also completed.
>
> The final series contains extra cleanup changes that touch all
> architectures. Please review and test these, so we can merge them
> for v5.18.
>
> The series is available at
> https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=set_fs-2
> for testing.

I've added the updated contents to my asm-generic tree now to put them
into linux-next.

         Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
