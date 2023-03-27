Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D303AC6FD1D
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Mar 2023 22:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qVOCb6+f9Rrq/j2QlZ6usUdtMk5HvVBoPWL5xemgYTw=; b=mve8tRZ1FJcAr/
	ttk7WfD6WWpNVXRVJClFhcDI+G8RoxKRnqqmUJlazVXg+HJ9OHpsITkn2YBS1YCqkmzOM7mRhfDVb
	6w5WPN6n7QZvmID5Z5EMMcmG7hWV9rdMCRf5ltq+/dff/7oLmj90mubkZZKaOyJSzP43Lls6xtENN
	L5T/Ynt8dGEp5Zrdgdk7xBchw6A7amMlHEdhg/nvE5WQzoqjBGctME29wH6uODgH/ARxlzXB3rNTw
	ynnMTbYiUr5ZHOPQTFnwVZ34ZhuWJGpHJRoYpugzSWdFboUMZgiXVEZUVZjHv+qDzjDhBDG3luO+C
	lCxmJxQnzszbDNGFwxEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgvHQ-00CXpx-2h;
	Mon, 27 Mar 2023 22:25:32 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgvHM-00CXnY-1W;
	Mon, 27 Mar 2023 22:25:30 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 31BF267373; Tue, 28 Mar 2023 00:25:15 +0200 (CEST)
Date: Tue, 28 Mar 2023 00:25:15 +0200
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
Subject: Re: [PATCH 21/21] dma-mapping: replace custom code with generic
 implementation
Message-ID: <20230327222514.GA17904@lst.de>
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-22-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230327121317.4081816-22-arnd@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_152528_678256_D4D1CFA1 
X-CRM114-Status: GOOD (  18.20  )
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

> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> +	dma_cache_wback(paddr, size);
> +}
>  
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
> +{
> +	dma_cache_inv(paddr, size);
>  }

> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
>  {
> +	dma_cache_wback_inv(paddr, size);
> +}

There are the only calls for the three functions for each of the
involved functions.  So I'd rather rename the low-level symbols
(and drop the pointless exports for two of them) rather than adding
these wrapppers.

The same is probably true for many other architectures.

> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +	return false;
> +}
>  
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +	return true;
>  }

Is there a way to cut down on this boilerplate code by just having
sane default, and Kconfig options to override them if they are not
runtime decisions?

> +#include <linux/dma-sync.h>

I can't really say I like the #include version here despite your
rationale in the commit log.  I can probably live with it if you
think it is absolutely worth it, but I'm really not in favor of it.

> +config ARCH_DMA_MARK_DCACHE_CLEAN
> +	def_bool y

What do we need this symbol for?  Unless I'm missing something it is
always enable for arm32, and only used in arm32 code.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
