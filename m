Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC808C761A6
	for <linux-snps-arc@archiver.kernel.org>; Fri, 31 Mar 2023 15:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3udgr6ea/3uldVHUrVVhdU2eblu1pgKjIwOfMvslJ4=; b=nKBLCOAB44+j0H
	pmgcgUVxZ9PNgjjId8DjYB9Oiu+fhEoSEjA3A53sW0Fy09nvlqi+d0gXqtiV554Is/JXughS+/pmN
	w+26uxcqTMncsUE84aORrUW0dN+B9tZcICJs0SE+6jfkY5OUTOhCctJNgDexATPul5ba4VPeMemmk
	V9Ck3Sf8QcF6hWHimtRC5xZZDeve+qNRNYP9GyvWQHbb523o4w+mvLezw6knsxlRQARVECTBqf84K
	hxyPj52eYE565hl8e/DLNJfhhab42T85qQeOyFwsFOgQE+GpciW+Jemyplltjvu+yAVln2U8ZiAZV
	Fz/NhD4+0ohbRcQQx+Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piH63-007zAF-2k;
	Fri, 31 Mar 2023 15:55:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piH60-007z8w-16;
	Fri, 31 Mar 2023 15:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gUELt2K1QKph0U/mDlh4dwcj3jRy49Fgp81dawItijs=; b=F86J/lODgmEA0uwbHcY3bvQDIg
	TgPZqAN80ItsKKu+iPQcuv/pts9DIvFXJeSEZcyq0SOfARV88djehGMYXJuDHo94xmNoUdc8so8TQ
	lO3DlUKNl0JE1n5lC4OQRNQJ3a+9RGNNtr5VJSUX9rNMXskzfjoEtNIzNUj9gswxqSmuoQ2K/eCd1
	sHbsLGLpmn7B5oFOttF1NlFGM73bvkK8EdPHfxwwzdfF3QwqoSTJnWaOA3vfMNEshnYYvIU/akmQr
	wtBcESnlgj18abmkEesn3hmvJxyBrWubIThmP6qLXHE/lCCqgaePhuHTPqwc712P40mYINjGZoZVl
	F0iXSnJA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60182)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1piH5K-0005f8-U5; Fri, 31 Mar 2023 16:54:38 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1piH5B-0001I3-3X; Fri, 31 Mar 2023 16:54:29 +0100
Date: Fri, 31 Mar 2023 16:54:29 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, guoren <guoren@kernel.org>,
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
	"David S . Miller" <davem@davemloft.net>,
	Max Filippov <jcmvbkbc@gmail.com>, Christoph Hellwig <hch@lst.de>,
	Robin Murphy <robin.murphy@arm.com>,
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"Conor.Dooley" <conor.dooley@microchip.com>,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-oxnas@groups.io" <linux-oxnas@groups.io>,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 20/21] ARM: dma-mapping: split out arch_dma_mark_clean()
 helper
Message-ID: <ZCcCNXyb9TZvA8wD@shell.armlinux.org.uk>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-21-arnd@kernel.org>
 <ZCGv18wnEtoFvtfM@shell.armlinux.org.uk>
 <1be05746-9deb-49cb-b106-71b2db8318cd@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1be05746-9deb-49cb-b106-71b2db8318cd@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_085520_384406_49B6CEC6 
X-CRM114-Status: GOOD (  28.69  )
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

On Fri, Mar 31, 2023 at 04:06:37PM +0200, Arnd Bergmann wrote:
> On Mon, Mar 27, 2023, at 17:01, Russell King (Oracle) wrote:
> > On Mon, Mar 27, 2023 at 02:13:16PM +0200, Arnd Bergmann wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >> 
> >> The arm version of the arch_sync_dma_for_cpu() function annotates pages as
> >> PG_dcache_clean after a DMA, but no other architecture does this here.
> >
> > ... because this is an arm32 specific feature. Generically, it's
> > PG_arch_1, which is a page flag free for architecture use. On arm32
> > we decided to use this to mark whether we can skip dcache writebacks
> > when establishing a PTE - and thus it was decided to call it
> > PG_dcache_clean to reflect how arm32 decided to use that bit.
> >
> > This isn't just a DMA thing, there are other places that we update
> > the bit, such as flush_dcache_page() and copy_user_highpage().
> >
> > So thinking that the arm32 PG_dcache_clean is something for DMA is
> > actually wrong.
> >
> > Other architectures are free to do their own other optimisations
> > using that bit, and their implementations may be DMA-centric.
> 
> The flag is used the same way on most architectures, though some
> use the opposite polarity and call it PG_dcache_dirty. The only
> other architecture that uses it for DMA is ia64, with the difference
> being that this also marks the page as clean even for coherent
> DMA, not just when doing a flush as part of noncoherent DMA.
> 
> Based on Robin's reply it sounds that this is not a valid assumption
> on Arm, if a coherent DMA can target a dirty dcache line without
> cleaning it.

The other thing to note here is that PG_dcache_clean doesn't have
much meaning on modern CPUs with PIPT caches. For these,
cache_is_vipt_nonaliasing() will be true, and
cache_ops_need_broadcast() will be false.

Firstly, if we're using coherent DMA, then PG_dcache_clean is
intentionally not touched, because the data cache isn't cleaned
in any way by DMA operations.

flush_dcache_page() turns into a no-op apart from clearing
PG_dcache_clean if it was set.

__sync_icache_dcache() will do nothing for non-executable pages,
but will write-back a page that isn't marked PG_dcache_clean to
ensure that it is visible to the instruction stream. This is only
used to ensure that a the instructions are visible to a newly
established executable mapping when e.g. the page has been DMA'd
in. The default state of PG_dcache_clean is zero on any new
allocation, so this has the effect of causing any executable page
to be flushed such that the instruction stream can see the
instructions, but only for the first establishment of the mapping.
That means that e.g. libc text pages don't keep getting flushed on
the start of every program.

update_mmu_cache() isn't compiled, so it's use of PG_dcache_clean
is irrelevant.

v6_copy_user_highpage_aliasing() won't be called because we're not
using an aliasing cache.

So, for modern ARM systems with DMA-coherent PG_dcache_clean only
serves for the __sync_icache_dcache() optimisation.

ARMs use of this remains valid in this circumstance.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
