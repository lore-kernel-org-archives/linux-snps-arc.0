Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAF94C28B28
	for <linux-snps-arc@archiver.kernel.org>; Wed, 12 Mar 2025 16:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FyS9o5QiY/zdQXnmxp7TdPbCFqhzqo3UDkSj1fmNHtM=; b=BiiFaAHIY8LHsc
	/mzKDcRohCxjGbIYjPw4dqHN/lUOefin3Tt8xtk/sQzUNZZOWlklfaNU5YyEI52cUTr7rlrbImHoT
	EXS4CCtUeq7BdacJwz2xhKHIBtkqtYCi8ZTpZLRs+GO6pjsW6BuEXlu3El7fP84U3raD90gXZFYGL
	zf94LoEIxDGehUiSs8tcOcMEFeWE/WzzG7LppHLQR2mZ92xC8hTdzghYTh8tRCsJllHGtwgakF5ng
	9etooUJv9+XfCndi4sxb+lHSWeHBLW74gGiaGsHgRHqQ+p+Dhd2a+0+mN/wTqfPF6H74al5A1KM5i
	YQOgsz5MhXoiSEkOM8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOhr-0000000904n-1cK0;
	Wed, 12 Mar 2025 16:13:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsOeB-00000008zUv-28Bj;
	Wed, 12 Mar 2025 16:09:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AE4BCA41156;
	Wed, 12 Mar 2025 16:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA43C4CEDD;
	Wed, 12 Mar 2025 16:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741795770;
	bh=U+kn0eqCA1vTkLcceUerHMcbUlG4P1T7ky+SM+cNeZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o1nXbH0lAp/Eqh29Z9apDenWiT7PjuKxKiO2JQvLOJVWK5GP4OmPvFpXi6asrnzZT
	 nu94zZUymz0UiYH5e2oHwUKtTI1fSzIDWOtzi+i34Gkz1xkL6x5U9bzNGRhUtzuTKS
	 DXX5HBMSnM0KQHz9TeDEZUAKZi2/XgNg8n+fKtj+coTJt3gRJNcK3xsnp4c0Rfm92c
	 yO1JQdFiH5w2Gbb11wg1ZkFYIseNAErd8Fb7JJ7KzSSF/QC6tMXJP/39miA0uSvCwy
	 IrlqFK1R0v32Dh9qsAKLmrl9vNb/vAYRou4oKyLZKKWsSVO2mj5QR0FroBYJHAdDo/
	 ffW5IRilofYyA==
Date: Wed, 12 Mar 2025 18:09:07 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH 07/13] s390: make setup_zero_pages() use memblock
Message-ID: <Z9GxozjZTKOGDPv1@kernel.org>
References: <20250306185124.3147510-1-rppt@kernel.org>
 <20250306185124.3147510-8-rppt@kernel.org>
 <20250307152815.9880Gbd-hca@linux.ibm.com>
 <Z8_Qawg0dGtZdys7@kernel.org>
 <CAMj1kXHS1YbnYVqVgsyfFSpg9kJM599Yp9TO8AP6--Nbgk7dHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXHS1YbnYVqVgsyfFSpg9kJM599Yp9TO8AP6--Nbgk7dHQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_090931_678467_168BB852 
X-CRM114-Status: GOOD (  32.59  )
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

On Wed, Mar 12, 2025 at 04:56:59PM +0100, Ard Biesheuvel wrote:
> On Tue, 11 Mar 2025 at 06:56, Mike Rapoport <rppt@kernel.org> wrote:
> >
> > On Fri, Mar 07, 2025 at 04:28:15PM +0100, Heiko Carstens wrote:
> > > On Thu, Mar 06, 2025 at 08:51:17PM +0200, Mike Rapoport wrote:
> > > > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > > >
> > > > Allocating the zero pages from memblock is simpler because the memory is
> > > > already reserved.
> > > >
> > > > This will also help with pulling out memblock_free_all() to the generic
> > > > code and reducing code duplication in arch::mem_init().
> > > >
> > > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > > ---
> > > >  arch/s390/mm/init.c | 14 +++-----------
> > > >  1 file changed, 3 insertions(+), 11 deletions(-)
> > >
> > > Acked-by: Heiko Carstens <hca@linux.ibm.com>
> > >
> > > > -   empty_zero_page = __get_free_pages(GFP_KERNEL | __GFP_ZERO, order);
> > > > +   empty_zero_page = (unsigned long)memblock_alloc(PAGE_SIZE << order, order);
> > > >     if (!empty_zero_page)
> > > >             panic("Out of memory in setup_zero_pages");
> > >
> > > This could have been converted to memblock_alloc_or_panic(), but I
> > > guess this can also be done at a later point in time.
> >
> > Duh, I should have remembered about memblock_alloc_or_panic() :)
> >
> > @Andrew, can you please pick this as a fixup?
> >
> > From 344fec8519e5152c25809c9277b54a68f9cde0e9 Mon Sep 17 00:00:00 2001
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > Date: Tue, 11 Mar 2025 07:51:27 +0200
> > Subject: [PATCH] s390: use memblock_alloc_or_panic() in setup_zero_page()
> >
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  arch/s390/mm/init.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> > index ab8ece3c41f1..c6a97329d7e7 100644
> > --- a/arch/s390/mm/init.c
> > +++ b/arch/s390/mm/init.c
> > @@ -81,9 +81,7 @@ static void __init setup_zero_pages(void)
> >         while (order > 2 && (total_pages >> 10) < (1UL << order))
> >                 order--;
> >
> > -       empty_zero_page = (unsigned long)memblock_alloc(PAGE_SIZE << order, order);
> > -       if (!empty_zero_page)
> > -               panic("Out of memory in setup_zero_pages");
> > +       empty_zero_page = (unsigned long)memblock_alloc_or_panic(PAGE_SIZE << order, order);
> >
> 
> memblock_alloc_or_panic() takes the alignment is in bytes, no? So
> shouldn't the second argument be BIT(order)?

The second argument should be PAGE_SIZE. Thanks for catching that!

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
