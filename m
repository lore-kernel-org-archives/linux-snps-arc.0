Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A330C433F5
	for <linux-snps-arc@archiver.kernel.org>; Sun, 21 Nov 2021 06:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D5nJ0Gy9pcjAoBkxfiVeq1m5/CxjGmjyjKtVMnVtsoM=; b=Fse95kpG0m9lHK
	RPmn/IMp00Ynrtpew5gsMnPj8lBixgAOUR/ePHm9fFSXF8aqhmIBE24/Hm0ID6Usgwxn+TT73+79/
	3mkGMLxbPQNhvVVewnJjSNRSIdQnyPkcgahYOLIkrxIFwtaIgkFdkTzI+2zpHgB9iczngiPMjmz3Z
	ZvKxdayMXoLEEtx46frNYHDMeNlOWxfN9Ony0lBjRiVoks+QR+sxsCTloYeu1O/tQI8Y4gpy8WvSk
	XicqcJ8Lh17AZnvwlEHbyFpIX1J9Qqi3j6NjhutKGtqxsjjWEvYK6emJ30Q7bkl6nwgZaufTe3LPp
	btgMQiuhIJfBbWtRNteQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mogaL-00DIz3-Iw; Sun, 21 Nov 2021 06:44:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mogaG-00DIxq-VM; Sun, 21 Nov 2021 06:44:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 60B98604AC;
 Sun, 21 Nov 2021 06:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637477055;
 bh=fF0qMHEWbaZWbEit/VvNjQKirKtWS4o0c8b9dFvtOFg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o40YeyKWlss6qPqzIaBC1BRaoNsy8h4lRluMS6PA711BRFcqyhJOnzbksEMtKtJO/
 8jbTZZa3TfDTwFyR4bB+BvkwZH8B4Lq6zUtBDhL0B4WDBH9OrnY/ZIAuUCLySCed3G
 BY0pW/832nzdNqDcLtde/+ux9ozmIiM3YLALWMwekxe0nZCbZ8Eac9fyNJkYF8xblI
 zzUk/gDwJpgD0wAYRzlFYo+zhx5+msTuR9KF/8/1WOgKdEL1RlhcobAeHzb+LuS7g/
 jBCVo5DEsOze9uLZm95vmKlvgKfjbEPyxEhw1wZAFN+rxMTmDM0V/oXbaGrjJoZ0t1
 JqBkAezCYdBnA==
Date: Sun, 21 Nov 2021 08:43:47 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Calvin Zhang <calvinzhang.cool@gmail.com>
Cc: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Rich Felker <dalias@libc.org>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Vladimir Isaev <isaev@synopsys.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 "Kirill A. Shutemov" <kirill.shtuemov@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, Marc Zyngier <maz@kernel.org>,
 David Brazdil <dbrazdil@google.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Jinyang He <hejinyang@loongson.cn>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Tiezhu Yang <yangtiezhu@loongson.cn>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Andreas Oetken <andreas.oetken@siemens.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Zhang Yunkai <zhang.yunkai@zte.com.cn>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Markus Elfring <elfring@users.sourceforge.net>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Alexandre Ghiti <alex@ghiti.fr>,
 Vitaly Wool <vitaly.wool@konsulko.com>,
 Thierry Reding <treding@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauri Sandberg <sandberg@mailfence.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/2] of: remove reserved regions count restriction
Message-ID: <YZnqo3oA7srQik4N@kernel.org>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211120_224417_052867_D30B80FF 
X-CRM114-Status: GOOD (  16.72  )
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

On Fri, Nov 19, 2021 at 03:58:17PM +0800, Calvin Zhang wrote:
> The count of reserved regions in /reserved-memory was limited because
> the struct reserved_mem array was defined statically. This series sorts
> out reserved memory code and allocates that array from early allocator.
> 
> Note: reserved region with fixed location must be reserved before any
> memory allocation. While struct reserved_mem array should be allocated
> after allocator is activated. We make early_init_fdt_scan_reserved_mem()
> do reservation only and add another call to initialize reserved memory.
> So arch code have to change for it.

I think much simpler would be to use the same constant for sizing
memblock.reserved and reserved_mem arrays.

If there is too much reserved regions in the device tree, reserving them in
memblock will fail anyway because memblock also starts with static array
for memblock.reserved, so doing one pass with memblock_reserve() and
another to set up reserved_mem wouldn't help anyway.

> I'm only familiar with arm and arm64 architectures. Approvals from arch
> maintainers are required. Thank you all.
> 
> Calvin Zhang (2):
>   of: Sort reserved_mem related code
>   of: reserved_mem: Remove reserved regions count restriction
> 
>  arch/arc/mm/init.c                 |   3 +
>  arch/arm/kernel/setup.c            |   2 +
>  arch/arm64/kernel/setup.c          |   3 +
>  arch/csky/kernel/setup.c           |   3 +
>  arch/h8300/kernel/setup.c          |   2 +
>  arch/mips/kernel/setup.c           |   3 +
>  arch/nds32/kernel/setup.c          |   3 +
>  arch/nios2/kernel/setup.c          |   2 +
>  arch/openrisc/kernel/setup.c       |   3 +
>  arch/powerpc/kernel/setup-common.c |   3 +
>  arch/riscv/kernel/setup.c          |   2 +
>  arch/sh/kernel/setup.c             |   3 +
>  arch/xtensa/kernel/setup.c         |   2 +
>  drivers/of/fdt.c                   | 107 +---------------
>  drivers/of/of_private.h            |  12 +-
>  drivers/of/of_reserved_mem.c       | 189 ++++++++++++++++++++++++-----
>  include/linux/of_reserved_mem.h    |   4 +
>  17 files changed, 207 insertions(+), 139 deletions(-)
> 
> -- 
> 2.30.2
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
