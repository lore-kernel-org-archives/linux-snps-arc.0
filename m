Return-Path: <SRS0=g0v4=QG=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1DC6C433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 19 Nov 2021 10:00:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 708956138D
	for <linux-snps-arc@archiver.kernel.org>; Fri, 19 Nov 2021 10:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 708956138D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EnCEWJTBMUdWEdhGeUsj7m5xsFPEn3ZKMztAoXxUTaE=; b=dkqt5+fGWhgDDH
	7udbomdJjgnW7rlVazRmg/INGBZf94+Nw3jxfO3BIXuHAujHWYSBRy7SakUicYY5xxOK7ysWhSMqG
	zYvCEMBE941k4eEM0vbZJ+yxNx77RTxnpgk/vnHXGAh9E41IFzBtWStYNbewhhO3naaeZVquVtTK/
	xJyXFKjWp3yaMNJHvndRoEv9daThDVblY6KFX9J2aZO4ToRwTYb20NfTLJtz8ZAM0ZojAY6c1h10k
	5xrFBfzUN2TV1MLyQOi0XWG6wnu9Wydmzr2cF2QUiEngcyfblhRRC7k4/H1NVC5Rf2WtA52Chmy4R
	5U84SPKPTt6N5fcQ6N7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo0hQ-00A43E-9S; Fri, 19 Nov 2021 10:00:52 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo0hO-00A3r2-Ck; Fri, 19 Nov 2021 10:00:51 +0000
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="221607473"
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="221607473"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 01:58:47 -0800
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="568845492"
Received: from smile.fi.intel.com ([10.237.72.184])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 01:58:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mo0cr-008Uqj-60; Fri, 19 Nov 2021 11:56:09 +0200
Date: Fri, 19 Nov 2021 11:56:08 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
 Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Vladimir Isaev <isaev@synopsys.com>, Arnd Bergmann <arnd@arndb.de>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Guenter Roeck <linux@roeck-us.net>, Marc Zyngier <maz@kernel.org>,
 David Brazdil <dbrazdil@google.com>, Mark Rutland <mark.rutland@arm.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Jinyang He <hejinyang@loongson.cn>,
 Mauri Sandberg <sandberg@mailfence.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Andreas Oetken <andreas.oetken@siemens.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Markus Elfring <elfring@users.sourceforge.net>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Alexandre Ghiti <alex@ghiti.fr>,
 Vitaly Wool <vitaly.wool@konsulko.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Lee Jones <lee.jones@linaro.org>,
 Guo Ren <guoren@linux.alibaba.com>, Rob Herring <robh@kernel.org>,
 Zhang Yunkai <zhang.yunkai@zte.com.cn>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] of: reserved_mem: Remove reserved regions count
 restriction
Message-ID: <YZd0uEWNH6Def3+8@smile.fi.intel.com>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
 <20211119075844.2902592-3-calvinzhang.cool@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211119075844.2902592-3-calvinzhang.cool@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_020050_511576_964B43E4 
X-CRM114-Status: GOOD (  14.76  )
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

On Fri, Nov 19, 2021 at 03:58:19PM +0800, Calvin Zhang wrote:
> Change to allocate reserved_mems dynamically. Static reserved regions
> must be reserved before any memblock allocations. The reserved_mems
> array couldn't be allocated until memblock and linear mapping are ready.
> 
> So move the allocation and initialization of records and reserved memory
> from early_init_fdt_scan_reserved_mem() to of_reserved_mem_init().

>  arch/arc/mm/init.c                 |  3 ++
>  arch/arm/kernel/setup.c            |  2 +
>  arch/arm64/kernel/setup.c          |  3 ++
>  arch/csky/kernel/setup.c           |  3 ++
>  arch/h8300/kernel/setup.c          |  2 +
>  arch/mips/kernel/setup.c           |  3 ++
>  arch/nds32/kernel/setup.c          |  3 ++
>  arch/nios2/kernel/setup.c          |  2 +
>  arch/openrisc/kernel/setup.c       |  3 ++
>  arch/powerpc/kernel/setup-common.c |  3 ++
>  arch/riscv/kernel/setup.c          |  2 +
>  arch/sh/kernel/setup.c             |  3 ++
>  arch/xtensa/kernel/setup.c         |  2 +

Isn't x86 missed? Is it on purpose?
Would be nice to have this in the commit message or fixed accordingly.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
