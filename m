Return-Path: <SRS0=g0v4=QG=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C87E2C433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 19 Nov 2021 08:00:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CD2261A55
	for <linux-snps-arc@archiver.kernel.org>; Fri, 19 Nov 2021 08:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CD2261A55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q1WMOvHQYaDUYxPDxmzNgOHx604qdLhOyU/BraNuNWI=; b=wD2iUVwDt6vB0o
	SKTPN5bjGFubAGIoscmn9VYJMHYmouAlwCgTW0h05i4Lfdo8Dlp7y82EefXLWjit0wUtDjYra3nY3
	bTT2azIok6Rf3IFf6uZROFXEr6nz9YQJAX1jrbsduyqAJTKWaEJlOfy+XNyBo/vChjvJbkm57uw68
	ApDYKZfIWK60NKSb1WJyT8Nfjfyny+tnLo3kC1QUZTRFwINUx4IjGn3KbKhFXD1bycAq9yFQHLhbj
	blgWrpvHLlvEy/HvPsmwhIkDaoClStOv33GuPObmPvdeJc6dzsg+Q5XAF4BYJEF+LeYKfI4Vi3Icg
	irjTkpn/Mv71/3fGRyaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnyoj-009gUI-B6; Fri, 19 Nov 2021 08:00:17 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnyog-009gST-Qr; Fri, 19 Nov 2021 08:00:16 +0000
Received: by mail-pl1-x62d.google.com with SMTP id q17so7506339plr.11;
 Fri, 19 Nov 2021 00:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ylfEgGFi9fXXyFv3lgk0Ku/SSf+pSdJSd2RLuFwQy1I=;
 b=Piq1nJJ8yUxBmd7q2OqqhZ04o/Z/X8wPRFgtRzc8HIEZny/6x/zgzkJJLIzrhAa0e4
 +m/UkOZhCq/qceHyHLy6mrK1/J5X45CiYNHNz4LLNboBkuPFruTDbeHDANZN9gaBX4zE
 BOB6y13oTjWi0vF7xJd+4tsqCwxEUlAfE+LU/vlE+4bU80+Ekh940qsjxgz9xnCUr3Qi
 VmT32x+yuH4lxl7Rhd+Oz9STONwHrFxbc04IdCvrFJWCSYvRIOjZFaZysr2qzarcVla2
 /GqHkfvvxM0BK3O8jT5cWAzBmRaFUrfRWcGlu9hx9ier0QPDw7te7Gc5F9LDdGi5XMS6
 NbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ylfEgGFi9fXXyFv3lgk0Ku/SSf+pSdJSd2RLuFwQy1I=;
 b=gkm7RAn4SVTYvYQ2EVxAKqWJUbza77Zzfm3D90V43lj93Tzgh/kCbe/P8x6vQYUeYe
 Vb4frUckv1QBtfzzifVbGu/knGG+MjlKMHObt41mkmPp8UfgZxgKCIbK7KvUd22ea0ED
 ZIm+XWMJfWVxYHxinENoWrycbhrt1OntOWgiFC+rg36FSGWmgQni4aDHdd6bDXy0qGJ8
 7bJi7ZHiIdxMLE6fXGPpbrqTMkEpvsDqpCwmy1yjyHBNgnbTBRKDyFOOA+knekIq3dEr
 K/grGXNqkL2igAgRRh7nz1BOZ2OxtehkrmkkeWcPdMLYcWGpdkIWKoRLgcYRmzN9fL3b
 obMQ==
X-Gm-Message-State: AOAM530iTtsv0frAO2ErnMRGVZczSxd27FcSJvtjvZcpdZURESI6Bmki
 pEzSkjiMZF9XMl0Q5rH7WRw=
X-Google-Smtp-Source: ABdhPJyEWl+rgTyJQilluTm65FmkmgWn+LtcD21UQsyfWBcLVUYOXziJspjYdNkg7WaRzd0koE7wlA==
X-Received: by 2002:a17:90a:8815:: with SMTP id
 s21mr2424180pjn.82.1637308812121; 
 Fri, 19 Nov 2021 00:00:12 -0800 (PST)
Received: from localhost.localdomain ([103.99.179.247])
 by smtp.gmail.com with ESMTPSA id o6sm1791259pfh.70.2021.11.18.23.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 00:00:11 -0800 (PST)
From: Calvin Zhang <calvinzhang.cool@gmail.com>
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rich Felker <dalias@libc.org>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Vladimir Isaev <isaev@synopsys.com>,
 Calvin Zhang <calvinzhang.cool@gmail.com>,
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
 Vitaly Wool <vitaly.wool@konsulko.com>
Cc: Thierry Reding <treding@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
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
Subject: [PATCH 0/2] of: remove reserved regions count restriction
Date: Fri, 19 Nov 2021 15:58:17 +0800
Message-Id: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_000014_889422_713D9939 
X-CRM114-Status: GOOD (  12.18  )
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

The count of reserved regions in /reserved-memory was limited because
the struct reserved_mem array was defined statically. This series sorts
out reserved memory code and allocates that array from early allocator.

Note: reserved region with fixed location must be reserved before any
memory allocation. While struct reserved_mem array should be allocated
after allocator is activated. We make early_init_fdt_scan_reserved_mem()
do reservation only and add another call to initialize reserved memory.
So arch code have to change for it.

I'm only familiar with arm and arm64 architectures. Approvals from arch
maintainers are required. Thank you all.

Calvin Zhang (2):
  of: Sort reserved_mem related code
  of: reserved_mem: Remove reserved regions count restriction

 arch/arc/mm/init.c                 |   3 +
 arch/arm/kernel/setup.c            |   2 +
 arch/arm64/kernel/setup.c          |   3 +
 arch/csky/kernel/setup.c           |   3 +
 arch/h8300/kernel/setup.c          |   2 +
 arch/mips/kernel/setup.c           |   3 +
 arch/nds32/kernel/setup.c          |   3 +
 arch/nios2/kernel/setup.c          |   2 +
 arch/openrisc/kernel/setup.c       |   3 +
 arch/powerpc/kernel/setup-common.c |   3 +
 arch/riscv/kernel/setup.c          |   2 +
 arch/sh/kernel/setup.c             |   3 +
 arch/xtensa/kernel/setup.c         |   2 +
 drivers/of/fdt.c                   | 107 +---------------
 drivers/of/of_private.h            |  12 +-
 drivers/of/of_reserved_mem.c       | 189 ++++++++++++++++++++++++-----
 include/linux/of_reserved_mem.h    |   4 +
 17 files changed, 207 insertions(+), 139 deletions(-)

-- 
2.30.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
