Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FB4C76196
	for <linux-snps-arc@archiver.kernel.org>; Fri, 31 Mar 2023 09:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ubNeUcm21hGDVXNFDgIOgdbF/D02MDxgyL3+SeNenO8=; b=4ihmYh4uj79KfC
	q25cdJIXxq1y8/Ayou/lplDRW5hWPvi10FSfOsB9nnZnKOIgTNIMQk2/BfjDbYPO7QFFqI1Hv6tPL
	z5WuQ77x0o/2yR/ixRlmiqgPx5VrjaCGqCf8CjrsxXEimExycVkJLIG+MPBo2RYPozLAMo0MgiDkL
	+cPFihHdcNfUlFvkENm4A9On7QxiU24D9T7cLyXjqtXNhRJ902dRtA1AjdR2vrBmi8Jw7KIYjIhck
	bkhJoiYnE7eiXXB+Vs4eODV7AU3jU4FjE9Xj+OJ4y+iBVfeaGOiJXYFa7a067ezfyHOVXPJvDEqGM
	YRf0eyIbqFFIKs1jPr1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piAmL-006cAM-1t;
	Fri, 31 Mar 2023 09:10:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piAmI-006bn9-1x;
	Fri, 31 Mar 2023 09:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BFqC7haDTybAEGUq1e2Uhe+LahY2lMZuCKo7e1OI8xQ=; b=ln4+Y+gWAHQSIKd2IosmEm1kwL
	9rQrpQ4E43SCxGnY7oCiHOfu1wEhrtmLCIph2RoTF0Zr9Jl+lwXk0EloYYwZp1vP4G9309e+oavO1
	W4gscCHtGYQQ/lE4PaexTfIzVhVn8ZkbG/CF1gjy/6j2N0CDUb+u8PLNi0SvNP4j7UurXdo8YXnzj
	FgTE97HTmPYCpw04O/SaUQ6wP2EslXB8dKZxMKdUsN6rI1OT+fm2ale4gtGaRCzwcx2OlTpIpkN9b
	CgHQYxdDR/G/k11QZy1D2M1/SQxlzh6J/tvaEB5xTC8HOr4tRJNRZhsIJXbX/XtjKGw1Lgk2JQN4g
	bD8q98ew==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48688)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1piAjS-0004Sf-1D; Fri, 31 Mar 2023 10:07:38 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1piAjI-000119-8l; Fri, 31 Mar 2023 10:07:28 +0100
Date: Fri, 31 Mar 2023 10:07:28 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Vineet Gupta <vgupta@kernel.org>,
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
Subject: Re: [PATCH 15/21] ARM: dma-mapping: always invalidate WT caches
 before DMA
Message-ID: <ZCai0FmZiOqsMkzc@shell.armlinux.org.uk>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-16-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230327121317.4081816-16-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_021034_669289_5A16CFEF 
X-CRM114-Status: GOOD (  14.83  )
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

On Mon, Mar 27, 2023 at 02:13:11PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Most ARM CPUs can have write-back caches and that require
> cache management to be done in the dma_sync_*_for_device()
> operation. This is typically done in both writeback and
> writethrough mode.
> 
> The cache-v4.S (arm720/740/7tdmi/9tdmi) and cache-v4wt.S
> (arm920t, arm940t) implementations are the exception here,
> and only do the cache management after the DMA is complete,
> in the dma_sync_*_for_cpu() operation.
> 
> Change this for consistency with the other platforms. This
> should have no user visible effect.

NAK...

The reason we do cache management _after_ is to ensure that there
is no stale data. The kernel _has_ (at the very least in the past)
performed DMA to data structures that are embedded within other
data structures, resulting in cache lines being shared. If one of
those cache lines is touched while DMA is progressing, then we
must to cache management _after_ the DMA operation has completed.
Doing it before is no good.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
