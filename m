Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D64EC43217
	for <linux-snps-arc@archiver.kernel.org>; Sun, 21 Nov 2021 09:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSD/6sw8wSYeVIF6hsaPjSLZpviR73FjXD3S2Tvaqb8=; b=R4QXFuiu4TZkbL
	FV6mH3Sg2kgrezbcAa/uR5aGNmv40j1axTvB3x6L2fy2e1KUdzqOLmSYekxgBUF9lQklWcRy0XQJb
	JfBQMygY9ypdpK59ipEzFmtL9AfyHJZIz+3rM761ISj7ilaOrIiManqplkMuNrWDZhaKQgtmT7XCy
	mcEdKzrpU1DXTox3AhE7kmkC+OtIn13OWQUA52zkPVW1V2cbw17sLNMNXlsa97D0Pz8ReB80g8e1+
	Z/I2duuWAfr5DDzkZPMkVA+zaNK1Dp9b46wprN27gJP0kYsUa1rXlv/uGCu4qcJex6uT4bVZUJ8dn
	ZPbCILygjHYlGOZb5ycA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moij7-00DOiU-Uz; Sun, 21 Nov 2021 09:01:33 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moij6-00DOhQ-9g; Sun, 21 Nov 2021 09:01:33 +0000
Received: by mail-pl1-x634.google.com with SMTP id p18so11493941plf.13;
 Sun, 21 Nov 2021 01:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uQeJj6IFfvjTH7tZDTd0bi24dF8RigJdyTH2xVfGgTs=;
 b=Tgb5Ic+uwSSoM4JZA36HMAnlatkdP+klPPLN5bBR4mKKK7eTLYbvh8o7E0EcmDPq2Q
 qLbdPM+Vl8mxGeh64K6wzQ+bz31be5sOsZRi7/BFqa+3UZR2mkUMH1od5ApykCQ4oge7
 PWRsbIqGPWCVfPaQ/9SinTdE1/ZkUXrgz0XtKq4W6GhO2Tqz3W9WDL2YZ864OPwKasYW
 XOd5tML9uld3R9EbWMfJk2iapJud7W6QS3RAsn8xBt2Px10d2Ru8NLyAcujfPW2JGJIW
 WoJyuNX3QATWQwrzDElQcMEP/yNoxhjpnku/gWQVFiahs4VyOBv8MikwZLaNOsRVBr4h
 1RLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uQeJj6IFfvjTH7tZDTd0bi24dF8RigJdyTH2xVfGgTs=;
 b=CZ5HeWO5aDT70rMF5iZnS5CXbWOKSJEZa+AYK+uyuKVVas1N36yYea/Os0eK/+BL88
 6rI+0O2a5oT1A2PnvXlhI1u8va/WIncbO6wtuH3fVGSS4k0p+v+xsF5e0T+ubs+E7rxe
 1N+duLf47GD83D4brBHRTaNCGOmh6ZfkCYQzBbptdGaKZzEZfXnl430jfqLPR8Hv7w2v
 RAV5+N470WS61/6kW0HBQDcRYpcXpWimI3jEiFaEGBlaQJrqFNriF/hmOyNoATRBmkfD
 htK4CdTss3zkDmblmk9CkhP5cikcu+I32zMP5AvNC5YrKetWCMvu2gF5S5YqChV+UKYQ
 BBwA==
X-Gm-Message-State: AOAM5329077ubtWx1DvnfSgmGy0VzGyYsslIvXD6FDFN8WwQwEq8/RxU
 xG/m2P9x+B0kTOjJNps4cfU=
X-Google-Smtp-Source: ABdhPJzLtHKp3ARITLkl6IEvP9ASH3fdvPyqX2o54+OrpL9oFv6P8ZWeoiFpXMGZlDp44TWDeD62sQ==
X-Received: by 2002:a17:903:1d2:b0:142:24f1:1213 with SMTP id
 e18-20020a17090301d200b0014224f11213mr96857331plh.81.1637485290032; 
 Sun, 21 Nov 2021 01:01:30 -0800 (PST)
Received: from localhost ([103.99.179.247])
 by smtp.gmail.com with ESMTPSA id lp12sm4320990pjb.24.2021.11.21.01.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 01:01:29 -0800 (PST)
Date: Sun, 21 Nov 2021 17:01:20 +0800
From: Calvin Zhang <calvinzhang.cool@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
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
Message-ID: <YZoK4IiBOTPduEyN@debian>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
 <YZnqo3oA7srQik4N@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YZnqo3oA7srQik4N@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_010132_357500_12AFB899 
X-CRM114-Status: GOOD (  14.85  )
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
>On Fri, Nov 19, 2021 at 03:58:17PM +0800, Calvin Zhang wrote:
>> The count of reserved regions in /reserved-memory was limited because
>> the struct reserved_mem array was defined statically. This series sorts
>> out reserved memory code and allocates that array from early allocator.
>> 
>> Note: reserved region with fixed location must be reserved before any
>> memory allocation. While struct reserved_mem array should be allocated
>> after allocator is activated. We make early_init_fdt_scan_reserved_mem()
>> do reservation only and add another call to initialize reserved memory.
>> So arch code have to change for it.
>
>I think much simpler would be to use the same constant for sizing
>memblock.reserved and reserved_mem arrays.
>
>If there is too much reserved regions in the device tree, reserving them in
>memblock will fail anyway because memblock also starts with static array
>for memblock.reserved, so doing one pass with memblock_reserve() and
>another to set up reserved_mem wouldn't help anyway.

Yes. This happens only if there are two many fixed reserved regions.
memblock.reserved can be resized after paging.

I also find another problem. Initializing dynamic reservation after
paging would fail to mark it no-map because no-map flag works when doing
direct mapping. This seems to be a circular dependency.

Thank You,
Calvin

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
