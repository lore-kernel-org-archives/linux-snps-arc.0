Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44265C433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 30 Nov 2021 21:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vbx5Lt2I/BHPTH4+83veuEnWfbYPwEuH3e0j+EdCZ4Q=; b=GsFjwjP9SzUzu6
	SIRhiB++snTkUEu5Xi8s5iRbvXzzIpPCfxvnvgIxNxUiYQ8WaEykBauYPDf66Vd9xm6YJp27UmcBt
	AcbIh/dxliREgx+zRi9l5kaqI2MKNsCoIWQT8Zq+gn/m6ZhVM5fx5gew5tT/z2Cy0sOHRNsK2ctz3
	qxjUy0SmfzndrQU4K/u8qcaL28tfjG44/w7OgJN3MZl3THaYAlwfFIaNYns/Ri8ApBQ9JzGjT96iT
	9eBDE45paifPeYGd/YRHSDahp19NWOTdiIRIiyNSq52ihMrGE2MHYxgHLTfT8lkVuT3pstv3oZjue
	pyeyZtSMhMDxbz7jIwaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msAMQ-006ii8-1S; Tue, 30 Nov 2021 21:08:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msAMJ-006ifq-OH; Tue, 30 Nov 2021 21:08:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2D78AB81C4F;
 Tue, 30 Nov 2021 21:08:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78438C53FC7;
 Tue, 30 Nov 2021 21:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638306491;
 bh=CGQDQlRxlHpJq0xzSuKQi7AU9OYm37j7CJ7xfuMMlQY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MQT0554slXBNgzV6dz6ATkc3EGBq02EcnyIjFHm4NC/TQW+Ti/5+ZwpYdUyXTQSX0
 FP/Mg9FHX1WkJdgEmvH+Sjh6chDp0qa4rdvwceLtLU4mrx9YqTjWtdVLiOuUAqqTr9
 JxBBF8wiCf2msoHxAESTMHrwoozuA53LUQYu0nChlx4mPkmdPvsjcuZz6ld/73Q1EP
 49cP1v8fZ5yU4pp+jiMhNoi6TZsD6QEaZ+s7211uBewrAF+q/t4jJF4C5l0VvizKZK
 UqaJcABTKX49+eBLI8ebfD/p5ZMIh9Z6ly7YavV63rHaytjZkBuc5OrtUPGVxLkKwd
 8IDw15RIkFr7Q==
Date: Tue, 30 Nov 2021 23:07:40 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Rob Herring <robh@kernel.org>
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
 Frank Rowand <frowand.list@gmail.com>,
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
Message-ID: <YaaSnJ2Meo5mEKDN@kernel.org>
References: <20211119075844.2902592-1-calvinzhang.cool@gmail.com>
 <YZnqo3oA7srQik4N@kernel.org> <YaVrahm+ysoQRGKe@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YaVrahm+ysoQRGKe@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_130816_094044_758C83C6 
X-CRM114-Status: GOOD (  27.72  )
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

On Mon, Nov 29, 2021 at 06:08:10PM -0600, Rob Herring wrote:
> On Sun, Nov 21, 2021 at 08:43:47AM +0200, Mike Rapoport wrote:
> > On Fri, Nov 19, 2021 at 03:58:17PM +0800, Calvin Zhang wrote:
> > > The count of reserved regions in /reserved-memory was limited because
> > > the struct reserved_mem array was defined statically. This series sorts
> > > out reserved memory code and allocates that array from early allocator.
> > > 
> > > Note: reserved region with fixed location must be reserved before any
> > > memory allocation. While struct reserved_mem array should be allocated
> > > after allocator is activated. We make early_init_fdt_scan_reserved_mem()
> > > do reservation only and add another call to initialize reserved memory.
> > > So arch code have to change for it.
> > 
> > I think much simpler would be to use the same constant for sizing
> > memblock.reserved and reserved_mem arrays.
> 
> Do those arrays get shrunk? Or do we waste the memory forever?

Memblock arrays don't get shrunk, but they are __init unless an architecture
chose to keep them after boot, but most architectures that use device tree
actually keep memblock structures.
 
> Maybe we can copy and shrink the initial array? Though I suspect struct 
> reserved_mem pointers have already been given out.

I'm not sure. It seems that reserved_mem pointers are given out at initcall
time and AFAIU the reserved_mem array is created somewhere around
setup_arch(). So maybe it's possible to copy and shrink the initial array.
 
> > 
> > If there is too much reserved regions in the device tree, reserving them in
> > memblock will fail anyway because memblock also starts with static array
> > for memblock.reserved, so doing one pass with memblock_reserve() and
> > another to set up reserved_mem wouldn't help anyway.
> > 
> > > I'm only familiar with arm and arm64 architectures. Approvals from arch
> > > maintainers are required. Thank you all.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
