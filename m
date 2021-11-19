Return-Path: <SRS0=g0v4=QG=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB42BC433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 19 Nov 2021 10:30:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1D5E610A1
	for <linux-snps-arc@archiver.kernel.org>; Fri, 19 Nov 2021 10:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1D5E610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BsvgTyAbIcJ9fI81thKnOtflZE4Gfso1q/4IqGr1w8o=; b=27A+NS7ThMe1iO
	hVeEbVanAIzUDVag++y9iKX9UkbnApidw/r4K8GTGJ0IB5qzKuOaX2cTojYZvu3GHwq19Pyha7qAw
	7wCxxYkbHaRJyZ85EoXf0z223JHytUi2LKe8UW/9/E33Na72ezsMSp05k2D4hPi8yJFMvp+36Z4v5
	iXZV1+cOm0u3w2/T4Nv2Y08lR5NkG1nhMJ1xnaJzuNqajtp3BVsBSY3oVEOtSCSyJlGFMjDV1nsqU
	L041Zt7dk8zdWBIIweHGjRRYrRt4mtTn3MquRCfWlZYTn83CUrckDsiucn9OlUNxsXOeYTQkBXnjd
	Ab1OVe1gI/U9DD3M0PRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo19v-00A7bB-Gu; Fri, 19 Nov 2021 10:30:19 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo19r-00A7Zb-FH; Fri, 19 Nov 2021 10:30:18 +0000
Received: by mail-pl1-x633.google.com with SMTP id u17so7796623plg.9;
 Fri, 19 Nov 2021 02:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mI6KtEpWF619oecwW9ziIW9hw+HsMKzn28OULpWVurc=;
 b=KPFYp17Oy/uF3pbSIvlZbA7tgtmLiBC3HIruVIaKeBTx1ALHk1wBHI9RWH4Y/TRiM2
 hAq35CyJOhqjAvnIz+XnfBNiKxqvsUzF8MUMqrbb+qoLapa3GCOHgXxaI6x9Km0AlL0K
 2wG7B8CCYpBSr+ZNFswMkvUZagoAlzcdTSS//NHNiGf8CdixgEqb6uKPGS2QpTEgcUAp
 yArb+GP+Q+XhbKyaqKWupK7SJqNy6AAI7qZH/W5TKcSo7ZV4POw8PNPyAsvkQzKhD740
 EiMIWTjA0fXMyULJynwnTQN6Kgk/iWbRQ1iPpWyGjz39JFmP0lOhp61wqe2NJVi1cPEy
 0utQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mI6KtEpWF619oecwW9ziIW9hw+HsMKzn28OULpWVurc=;
 b=VgiYUepknX64A7hrwPKi+76RfciKvetKOYzYPkX4EP2bEBnBnlMSL4IE79/1dulnah
 tkJjnigtIIn3dLGDe+EgnENfZoXqiS7QTJ7TBVhK59SEmdOCwQOhniHQgLdkTw/A0WiE
 LFH7EJyarJNT3WjQW3hDjWtSM0B1GzXHjcX9Gg7Hh7hBRTq7ov7O/OaeEQBBAyrABosu
 OF0dzR7+q5XB+sgvBoftqRVnHEr4cOrl4WChcNTT0foOYz2GnrW8fiL2fOqgOvT2FRGJ
 QWhrqPXd25lkv8yUW5K0pVWIJmFXV02Ps6hQIdBmUjXG8CYpVzbSzBVG6FyolEqc2Mp4
 AV0A==
X-Gm-Message-State: AOAM530PTKkHiiOAUDwTW3KBZlfyQTVGCvGsIt2vPTIE96oPn1u3v9Ko
 rFG9fSjeltcmgDuovjH5Kt0=
X-Google-Smtp-Source: ABdhPJwCL45zphX6sAUQpCTH2XR0MI6TO3LxQucz8xUZnsL94laUGiXdLG1KlgE2xhwPB5DYkk54PQ==
X-Received: by 2002:a17:902:bc85:b0:143:954e:8548 with SMTP id
 bb5-20020a170902bc8500b00143954e8548mr73204786plb.82.1637317814262; 
 Fri, 19 Nov 2021 02:30:14 -0800 (PST)
Received: from localhost ([103.99.179.247])
 by smtp.gmail.com with ESMTPSA id u22sm2537834pfk.148.2021.11.19.02.30.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 02:30:14 -0800 (PST)
Date: Fri, 19 Nov 2021 18:30:09 +0800
From: Calvin Zhang <calvinzhang.cool@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Calvin Zhang <calvinzhang.cool@gmail.com>,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
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
Message-ID: <YZd8sc6E0bgNA9ag@debian>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
 <20211119075844.2902592-3-calvinzhang.cool@gmail.com>
 <YZd0uEWNH6Def3+8@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YZd0uEWNH6Def3+8@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_023015_530090_D1B4B650 
X-CRM114-Status: GOOD (  14.91  )
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

On Fri, Nov 19, 2021 at 11:56:08AM +0200, Andy Shevchenko wrote:
>On Fri, Nov 19, 2021 at 03:58:19PM +0800, Calvin Zhang wrote:
>> Change to allocate reserved_mems dynamically. Static reserved regions
>> must be reserved before any memblock allocations. The reserved_mems
>> array couldn't be allocated until memblock and linear mapping are ready.
>> 
>> So move the allocation and initialization of records and reserved memory
>> from early_init_fdt_scan_reserved_mem() to of_reserved_mem_init().
>
>>  arch/arc/mm/init.c                 |  3 ++
>>  arch/arm/kernel/setup.c            |  2 +
>>  arch/arm64/kernel/setup.c          |  3 ++
>>  arch/csky/kernel/setup.c           |  3 ++
>>  arch/h8300/kernel/setup.c          |  2 +
>>  arch/mips/kernel/setup.c           |  3 ++
>>  arch/nds32/kernel/setup.c          |  3 ++
>>  arch/nios2/kernel/setup.c          |  2 +
>>  arch/openrisc/kernel/setup.c       |  3 ++
>>  arch/powerpc/kernel/setup-common.c |  3 ++
>>  arch/riscv/kernel/setup.c          |  2 +
>>  arch/sh/kernel/setup.c             |  3 ++
>>  arch/xtensa/kernel/setup.c         |  2 +
>
>Isn't x86 missed? Is it on purpose?
>Would be nice to have this in the commit message or fixed accordingly.
AFAIK, x86 doesn't reserve memory through "/reserved-memory" node until now.
Actually, I got the arch list from callers of
early_init_fdt_scan_reserved_mem().
>
>-- 
>With Best Regards,
>Andy Shevchenko
>
>
>
Thanks,
Calvin

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
