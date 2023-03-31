Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB0DC761A6
	for <linux-snps-arc@archiver.kernel.org>; Fri, 31 Mar 2023 16:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FKcPE0E+9pprXQotVF1XCkrc/aX661pcHhzBOVpO4t8=; b=V3kKOcdk+/gXvS
	06aeuZzp6b3owH5Lkf/f7ZSrc1XOz16sYRalGhdOfQETcZD3+5AFXAgpVOIRw5I37K031UZyggZCH
	KhTrXbKjAVZS+mXqoD8QxbsHATXiKsV+kQDyDeiF1XLQtcUPUUK4V7VDyRV5tH1YWSzxhS53Y5OMI
	a0+UDfpCsWarYjHgCtiigytEoWe0g3eI2pWL0kPWDoGnOTnXTljiQQkRC/26cco0IAUZ9Cba9pnUD
	ZJaUCtoWzUuRklGY61I8RjuweYuXHm++fPoQ0xiNO+KoTHxxaGaDIFUhc70B++rw3DidzXkjPwduj
	/mYO7ubqLg7WZ9sL7mlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piI0o-008Cdv-22;
	Fri, 31 Mar 2023 16:54:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piI0k-008Cd0-0B;
	Fri, 31 Mar 2023 16:53:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4E972B8310F;
	Fri, 31 Mar 2023 16:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 457CDC433D2;
	Fri, 31 Mar 2023 16:53:48 +0000 (UTC)
Date: Fri, 31 Mar 2023 17:53:45 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Max Filippov <jcmvbkbc@gmail.com>, Christoph Hellwig <hch@lst.de>,
	Robin Murphy <robin.murphy@arm.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 00/21] dma-mapping: unify support for cache flushes
Message-ID: <ZCcQGX/i8xBPiG7T@arm.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230327121317.4081816-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_095358_250840_783CFE26 
X-CRM114-Status: GOOD (  15.30  )
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

On Mon, Mar 27, 2023 at 02:12:56PM +0200, Arnd Bergmann wrote:
> Another difference that I do not address here is what cache invalidation
> does for partical cache lines. On arm32, arm64 and powerpc, a partial
> cache line always gets written back before invalidation in order to
> ensure that data before or after the buffer is not discarded. On all
> other architectures, the assumption is cache lines are never shared
> between DMA buffer and data that is accessed by the CPU.

I don't think sharing the DMA buffer with other data is safe even with
this clean+invalidate on the unaligned cache. Mapping the DMA buffer as
FROM_DEVICE or BIDIRECTIONAL can cause the shared cache line to be
evicted and override the device written data. This sharing only works if
the CPU guarantees not to dirty the corresponding cache line.

I'm fine with removing this partial cache line hack from arm64 as it's
not safe anyway. We'll see if any driver stops working. If there's some
benign sharing (I wouldn't trust it), the cache cleaning prior to
mapping and invalidate on unmap would not lose any data.

-- 
Catalin

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
