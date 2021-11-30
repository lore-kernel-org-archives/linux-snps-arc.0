Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007E8C433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Nov 2021 00:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FF+WD4RomcOhkA/sDc0GFA2CszbRI96kTrI6dTS0+iY=; b=LDuXIagEqw+NOj
	wq7svkTO3IHYttOdLgj/CI+8slGAmXMGjS9vZxt+kaxDaSzMPuWtXbKEyCIAjo6rjksZhk2MH9oyq
	Z4oAKSofuGylGiMldZl2ANRADO5aGV9XjwnIGJr8o+0wUoGxC3e+cK+RbQdVeaYAy+ys7zKs6bZ5+
	Ze472MfHFyDj16NsBnJuh/Oto7K59LBvuVpMFqzXJFDIxl7yjk2M6/4c1SA20zpBEysf8d35sYkoz
	Bppws+ycBO865tFEHNYBdBAC96vdq44te6fFLPvOAB4nd8ZSGCrebztB1d84zikJ513jAD8DeEvLa
	hUtvIoMnDR+kgjWg7wNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrqh0-003BBB-73; Tue, 30 Nov 2021 00:08:18 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrqgx-003B9z-JN; Tue, 30 Nov 2021 00:08:16 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 47-20020a9d0332000000b005798ac20d72so27809602otv.9; 
 Mon, 29 Nov 2021 16:08:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=D8pPDA8BhqYxJlGll70Jfs/EV2c/vlH3kHLgmxR36Bk=;
 b=UQdPs1pgJqfxfzc24jLfakVqCQKdhUU4wqTgGy2ngwWMAiPwyZO5muZ5HIA8wt/5tN
 DnlrIpMTvKp0KGRqIIHRg8rRRI4K5tNhd3qhKWxtHKqeeWOAVOrjhsVEUUYj9Ihb6YEF
 YIovEv2ORzQW0VwHEwFitqX/LIusmzNvPmoXIu0nouO6gnQ2m3sBg9ddV94iRa/0qce5
 Igxz1qLJB/sW6QDeLr6NrX0ermwBOy5/HUS3C1Ott9Qatkx3NAZR/0Ul6pSYCbu7DWFf
 CeH8QEe/hWXfOeVGQe8Y28KsKgxMhYGhMLKzl533PvnRK9BvUSBrlfo6ykIOn0Fc7vN1
 Qoxg==
X-Gm-Message-State: AOAM533r805ZX7iI6ed7rLEmg5xnq+f1olsa6qRZvETN19YazXdg38Fu
 3x9J4tci20YeMHtf+QkJPw==
X-Google-Smtp-Source: ABdhPJwHdVFEp5hd/T8aXyXLlCP6k0CfP+fpF2T3r+PJoHiG4EwmK+ob5JSJ6nKmQgmurmZ684PLSA==
X-Received: by 2002:a9d:4702:: with SMTP id a2mr47864106otf.262.1638230893962; 
 Mon, 29 Nov 2021 16:08:13 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bi20sm3422829oib.29.2021.11.29.16.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 16:08:13 -0800 (PST)
Received: (nullmailer pid 864351 invoked by uid 1000);
 Tue, 30 Nov 2021 00:08:10 -0000
Date: Mon, 29 Nov 2021 18:08:10 -0600
From: Rob Herring <robh@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Calvin Zhang <calvinzhang.cool@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Rich Felker <dalias@libc.org>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
 Kefeng Wang <wangkefeng.wang@huawei.com>, Vladimir Isaev <isaev@synopsys.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 "Kirill A. Shutemov" <kirill.shtuemov@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, 
 Marc Zyngier <maz@kernel.org>, David Brazdil <dbrazdil@google.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Mark Rutland <mark.rutland@arm.com>, Souptick Joarder <jrdr.linux@gmail.com>, 
 Jinyang He <hejinyang@loongson.cn>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Randy Dunlap <rdunlap@infradead.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Andreas Oetken <andreas.oetken@siemens.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Christophe Leroy <christophe.leroy@c-s.fr>, 
 Zhang Yunkai <zhang.yunkai@zte.com.cn>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Markus Elfring <elfring@users.sourceforge.net>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Atish Patra <atish.patra@wdc.com>, 
 Anup Patel <anup.patel@wdc.com>, Nick Kossifidis <mick@ics.forth.gr>,
 Alexandre Ghiti <alex@ghiti.fr>, 
 Vitaly Wool <vitaly.wool@konsulko.com>, Thierry Reding <treding@nvidia.com>, 
 Lee Jones <lee.jones@linaro.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Alexander Sverdlin <alexander.sverdlin@nokia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauri Sandberg <sandberg@mailfence.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-snps-arc@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-csky@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp, 
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org, 
 devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] of: remove reserved regions count restriction
Message-ID: <YaVrahm+ysoQRGKe@robh.at.kernel.org>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
 <YZnqo3oA7srQik4N@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YZnqo3oA7srQik4N@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_160815_654594_C2A4A3B0 
X-CRM114-Status: GOOD (  24.52  )
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

On Sun, Nov 21, 2021 at 08:43:47AM +0200, Mike Rapoport wrote:
> On Fri, Nov 19, 2021 at 03:58:17PM +0800, Calvin Zhang wrote:
> > The count of reserved regions in /reserved-memory was limited because
> > the struct reserved_mem array was defined statically. This series sorts
> > out reserved memory code and allocates that array from early allocator.
> > 
> > Note: reserved region with fixed location must be reserved before any
> > memory allocation. While struct reserved_mem array should be allocated
> > after allocator is activated. We make early_init_fdt_scan_reserved_mem()
> > do reservation only and add another call to initialize reserved memory.
> > So arch code have to change for it.
> 
> I think much simpler would be to use the same constant for sizing
> memblock.reserved and reserved_mem arrays.

Do those arrays get shrunk? Or do we waste the memory forever?

Maybe we can copy and shrink the initial array? Though I suspect struct 
reserved_mem pointers have already been given out.

> 
> If there is too much reserved regions in the device tree, reserving them in
> memblock will fail anyway because memblock also starts with static array
> for memblock.reserved, so doing one pass with memblock_reserve() and
> another to set up reserved_mem wouldn't help anyway.
> 
> > I'm only familiar with arm and arm64 architectures. Approvals from arch
> > maintainers are required. Thank you all.
> > 
> > Calvin Zhang (2):
> >   of: Sort reserved_mem related code
> >   of: reserved_mem: Remove reserved regions count restriction
> > 
> >  arch/arc/mm/init.c                 |   3 +
> >  arch/arm/kernel/setup.c            |   2 +
> >  arch/arm64/kernel/setup.c          |   3 +
> >  arch/csky/kernel/setup.c           |   3 +
> >  arch/h8300/kernel/setup.c          |   2 +
> >  arch/mips/kernel/setup.c           |   3 +
> >  arch/nds32/kernel/setup.c          |   3 +
> >  arch/nios2/kernel/setup.c          |   2 +
> >  arch/openrisc/kernel/setup.c       |   3 +
> >  arch/powerpc/kernel/setup-common.c |   3 +
> >  arch/riscv/kernel/setup.c          |   2 +
> >  arch/sh/kernel/setup.c             |   3 +
> >  arch/xtensa/kernel/setup.c         |   2 +
> >  drivers/of/fdt.c                   | 107 +---------------
> >  drivers/of/of_private.h            |  12 +-
> >  drivers/of/of_reserved_mem.c       | 189 ++++++++++++++++++++++++-----
> >  include/linux/of_reserved_mem.h    |   4 +
> >  17 files changed, 207 insertions(+), 139 deletions(-)
> > 
> > -- 
> > 2.30.2
> > 
> 
> -- 
> Sincerely yours,
> Mike.
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
