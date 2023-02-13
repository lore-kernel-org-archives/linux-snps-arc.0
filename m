Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469D9C636CC
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Feb 2023 07:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fvArTnKBiLpRoRVsam7jB6zTLg4Fby9rsdybqUC2e8=; b=Yl2pW51kkI6HOb
	chgsNbpB2NGSJk5mzqZQWNPSGCRK6Dl4m7Zd8qRtyW/NURNmc80xHgRTTxgf4egv15CXkVxnZjg8t
	xwa9/q/yBrTmqVaX4b6YaxYCCPSvkYZMzpse5uvti91rL3JYM/KYpGeCgoQGHP2vSaJpUqWaVyI7+
	9lA4tkTvHnk58Hhq13kHas59PeeRbt0fCrgByUI29Hh4CxnrRRenNO9CRq9U6Yk/l/CVnDRKSGdiC
	Zeq5pPzwL3NO1mbD1DUflkTAvltvHNM2NZiR0djKadRxivbWkn1aRJ5IPMoVJ6INHeTmZTTl4dmqk
	rOpLoQBb0aM2zMNi+VlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRTft-00DUkJ-Df; Mon, 13 Feb 2023 07:54:57 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRTfg-00DUfw-Pu; Mon, 13 Feb 2023 07:54:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 16B7EB80E01;
	Mon, 13 Feb 2023 07:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3884FC433EF;
	Mon, 13 Feb 2023 07:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676274881;
	bh=6metnuiv9QkmKFu+JTHLVBvZLre3nFtuNi3AR7PlA78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P/NLBLn1QBccO0iLmwEVdjTRTOu/1JTVdr0CvbgYz4ThLcAoENpkQwi1mRk7/P19V
	 Brn+rbVYSD8LBBQWtetps+o6x9tV427CYirqerxd+gmGggehAz5OXTZeiD3MkT7U29
	 s/as2HenQlPGtPPTTf3fp/G4jLA+MmtrrPcey6hAK36CzGgOAg/0LtwnODYIfT0DI9
	 MUeph4dw/P2V8jMyhN9SftHlhcEV/JNhGKIKb6cMv7netYSdbt356AlVVkhPoiPUvd
	 r4aExWVaj3CL3McIngU/VdH3ENcuJwfiC6rBQVcgRCzZo3MtbE8U1j5N/4s5pn2pxp
	 sfCWQJUUPJk8Q==
Date: Mon, 13 Feb 2023 09:54:17 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vineet Gupta <vgupta@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH v2 4/4] mm, arch: add generic implementation of
 pfn_valid() for FLATMEM
Message-ID: <Y+nsqV6u/PqNlwDS@kernel.org>
References: <20230129124235.209895-1-rppt@kernel.org>
 <20230129124235.209895-5-rppt@kernel.org>
 <20230212161320.GA3784076@roeck-us.net>
 <Y+mRz6Wfocopv9jw@kernel.org>
 <15a2c023-fdfa-9543-ac36-a846e5f8a000@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15a2c023-fdfa-9543-ac36-a846e5f8a000@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_235445_150099_44B54399 
X-CRM114-Status: GOOD (  21.65  )
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

Andrew, 

On Sun, Feb 12, 2023 at 10:37:15PM -0800, Guenter Roeck wrote:
> On 2/12/23 17:26, Mike Rapoport wrote:
> > On Sun, Feb 12, 2023 at 08:13:20AM -0800, Guenter Roeck wrote:
> > > On Sun, Jan 29, 2023 at 02:42:35PM +0200, Mike Rapoport wrote:
> > > > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > > > 
> > > > Every architecture that supports FLATMEM memory model defines its own
> > > > version of pfn_valid() that essentially compares a pfn to max_mapnr.
> > > > 
> > > > Use mips/powerpc version implemented as static inline as a generic
> > > > implementation of pfn_valid() and drop its per-architecture definitions.
> > > > 
> > > 
> > > With this patch in the tree, sh4 and sh4eb qemu emulations no longer boot.
> > > Reverting this patch fixes the problem.
> > 
> > This should be a better fix than a revert:
> > 
> > diff --git a/arch/sh/mm/init.c b/arch/sh/mm/init.c
> > index 506784702430..bf1b54055316 100644
> > --- a/arch/sh/mm/init.c
> > +++ b/arch/sh/mm/init.c
> > @@ -301,6 +301,7 @@ void __init paging_init(void)
> >   	 */
> >   	max_low_pfn = max_pfn = memblock_end_of_DRAM() >> PAGE_SHIFT;
> >   	min_low_pfn = __MEMORY_START >> PAGE_SHIFT;
> > +	set_max_mapnr(max_low_pfn - min_low_pfn);
> >   	nodes_clear(node_online_map);
> 
> Confirmed, this fixes the problem for me.
 
What is your preference for this and m68k fix? Fixups on top of mm-stable
or v3 of the entire series? 

> Thanks,
> Guenter

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
