Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B673C3DA64
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Aug 2024 13:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9tBfvHoa2Xl7fognNDQqIWo7fpQwH0HpW86CI6oClso=; b=OeR7kA0F+zBAvA
	sREFeuS8wSPFTvk9WM0MMofZxmj85lGsAvCebcW+QaooHFG6Uq81NM6lr+GZED98P/WC3xL3HkFVU
	Bd4Nyil1Qfbi6wW4EHIJL1kpLR0RcJ1cFVJfeqqf9tG3+A19IiLjhr3jTl2CVdmh+Ii9ZJVSdmJnR
	fEJKl4P4MpBuV0vE51HeP9Q76ku3x9RPJF09Es0JUddRHpxRmCBkFYNOzjVhPkLHqiMZnM4MpVlOB
	B4a8Av+8KkYzbYItDl1103AwycDwEpj4660sTG8lR4wtyCtnENiXiJs9eg6t3oA2u4Fw5V7g2S/C5
	fQVLb+NX3ksx0DVM/Ryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbKh0-00000001spb-3low;
	Tue, 06 Aug 2024 13:57:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbKgy-00000001sos-044P
	for linux-snps-arc@lists.infradead.org;
	Tue, 06 Aug 2024 13:57:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9A9A0CE0B8F;
	Tue,  6 Aug 2024 13:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF0BC32786;
	Tue,  6 Aug 2024 13:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722952652;
	bh=/hCT7gobvH0UbYHRedogV0jhFfNJDsfDZ2AZNymDZ1U=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=st72H8UFtXzgaDhOyIcf+/7egvd0K3JLC3ShlEKxlKqJRDtm5T1MxHuProrKpvaRx
	 6/fBqMPsIvElKpeOSJBjfyvIsoHfP07dNComsTo+IWtKJUWPG7Q8XKFvSWCTSd+2a0
	 7iOjcDMwSxCKRcZpGtG1FwhWKGgAgLNikUeKjUtVnS/HTzgxvKcULXCK3bsi4GhYA5
	 yc1rKmDgHDJ7trJrReVwgt+RlH3EhKUc0LnUQ9Fq0YIylD8i72UTXTDBT+Fc2jzfHL
	 SpT83a+O7JD0UB60mZ2XZ/wYOTK224PiNaOZljk05hzJs0PpH48GjeNjRIgqaTqw0a
	 loJq2bC+rG7vw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 6865FCE088B; Tue,  6 Aug 2024 06:57:32 -0700 (PDT)
Date: Tue, 6 Aug 2024 06:57:32 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	elver@google.com, akpm@linux-foundation.org, tglx@linutronix.de,
	peterz@infradead.org, torvalds@linux-foundation.org, arnd@arndb.de,
	geert@linux-m68k.org, palmer@rivosinc.com, mhiramat@kernel.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH cmpxchg 2/3] ARC: Emulate one-byte cmpxchg
Message-ID: <11c53e21-f17a-4e9b-bcea-b0a0c03bf46e@paulmck-laptop>
References: <c1b7f3a2-da50-4dfb-af6f-a1898eaf2b79@paulmck-laptop>
 <20240805192119.56816-2-paulmck@kernel.org>
 <eacb9a3c-0d76-47d2-8b80-59d6a58fe4b4@kernel.org>
 <3353ac4f-97ed-471b-bd19-96e0dbc41612@paulmck-laptop>
 <c9952ed7-9e8a-4142-b70c-8ddb14bf90de@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c9952ed7-9e8a-4142-b70c-8ddb14bf90de@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_065736_419219_EAD1AAB9 
X-CRM114-Status: GOOD (  23.84  )
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, Aug 05, 2024 at 09:44:39PM -0700, Vineet Gupta wrote:
> 
> 
> On 8/5/24 21:28, Paul E. McKenney wrote:
> > On Mon, Aug 05, 2024 at 06:27:57PM -0700, Vineet Gupta wrote:
> >> Hi Paul,
> >>
> >> On 8/5/24 12:21, Paul E. McKenney wrote:
> >>> Use the new cmpxchg_emu_u8() to emulate one-byte cmpxchg() on arc.
> >>>
> >>> [ paulmck: Drop two-byte support per Arnd Bergmann feedback. ]
> >>> [ paulmck: Apply feedback from Naresh Kamboju. ]
> >>> [ paulmck: Apply kernel test robot feedback. ]
> >>>
> >>> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> >>> Cc: Vineet Gupta <vgupta@kernel.org>
> >>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> >>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> >>> Cc: Arnd Bergmann <arnd@arndb.de>
> >>> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> >>> Cc: <linux-snps-arc@lists.infradead.org>
> >>> ---
> >>>  arch/arc/Kconfig               |  1 +
> >>>  arch/arc/include/asm/cmpxchg.h | 33 ++++++++++++++++++++++++---------
> >>>  2 files changed, 25 insertions(+), 9 deletions(-)
> >>>
> >>> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> >>> index fd0b0a0d4686a..163608fd49d18 100644
> >>> --- a/arch/arc/Kconfig
> >>> +++ b/arch/arc/Kconfig
> >>> @@ -13,6 +13,7 @@ config ARC
> >>>  	select ARCH_HAS_SETUP_DMA_OPS
> >>>  	select ARCH_HAS_SYNC_DMA_FOR_CPU
> >>>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
> >>> +	select ARCH_NEED_CMPXCHG_1_EMU
> >>>  	select ARCH_SUPPORTS_ATOMIC_RMW if ARC_HAS_LLSC
> >>>  	select ARCH_32BIT_OFF_T
> >>>  	select BUILDTIME_TABLE_SORT
> >>> diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
> >>> index e138fde067dea..2102ce076f28b 100644
> >>> --- a/arch/arc/include/asm/cmpxchg.h
> >>> +++ b/arch/arc/include/asm/cmpxchg.h
> >>> @@ -8,6 +8,7 @@
> >>>  
> >>>  #include <linux/build_bug.h>
> >>>  #include <linux/types.h>
> >>> +#include <linux/cmpxchg-emu.h>
> >>>  
> >>>  #include <asm/barrier.h>
> >>>  #include <asm/smp.h>
> >>> @@ -46,6 +47,9 @@
> >>>  	__typeof__(*(ptr)) _prev_;					\
> >>>  									\
> >>>  	switch(sizeof((_p_))) {						\
> >>> +	case 1:								\
> >>> +		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
> >>> +		break;							\
> >>>  	case 4:								\
> >>>  		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
> >>>  		break;							\
> >>> @@ -65,16 +69,27 @@
> >>>  	__typeof__(*(ptr)) _prev_;					\
> >>>  	unsigned long __flags;						\
> >>>  									\
> >>> -	BUILD_BUG_ON(sizeof(_p_) != 4);					\
> >> Is this alone not sufficient: i.e. for !LLSC let the atomic op happen
> >> under a spin-lock for non 4 byte quantities as well.
> > Now that you mention it, that would be a lot simpler.
> >
> >>> +	switch(sizeof((_p_))) {						\
> >>> +	case 1:								\
> >>> +		__flags = cmpxchg_emu_u8((volatile u8 *)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
> >>> +		_prev_ = (__typeof__(*(ptr)))__flags;			\
> >>> +		break;							\
> >>> +		break;							\
> >> FWIW, the 2nd break seems extraneous.
> > And to your earlier point, the first break as well.  ;-)
> >
> > How does the updated patch below look?  Or did I miss your point?
> >
> > 							Thanx, Paul
> >
> > ------------------------------------------------------------------------
> >
> > commit 96c1107797ca329fe203818cdfda2fe5f5a9a82e
> > Author: Paul E. McKenney <paulmck@kernel.org>
> > Date:   Mon Mar 18 01:27:35 2024 -0700
> >
> >     ARC: Emulate one-byte cmpxchg
> >     
> >     Use the new cmpxchg_emu_u8() to emulate one-byte cmpxchg() on arc.
> >     
> >     [ paulmck: Drop two-byte support per Arnd Bergmann feedback. ]
> >     [ paulmck: Apply feedback from Naresh Kamboju. ]
> >     [ paulmck: Apply kernel test robot feedback. ]
> >     [ paulmck: Apply feedback from Vineet Gupta. ]
> >     
> >     Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> >     Cc: Vineet Gupta <vgupta@kernel.org>
> >     Cc: Andi Shyti <andi.shyti@linux.intel.com>
> >     Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> >     Cc: Arnd Bergmann <arnd@arndb.de>
> >     Cc: Palmer Dabbelt <palmer@rivosinc.com>
> >     Cc: <linux-snps-arc@lists.infradead.org>
> 
> Acked-by: Vineet Gupta <vgupta@kernel.org>

Thank you, and I will apply this on my next rebase.

							Thanx, Paul

> Thx,
> -Vineet
> 
> >
> > diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
> > index fd0b0a0d4686a..163608fd49d18 100644
> > --- a/arch/arc/Kconfig
> > +++ b/arch/arc/Kconfig
> > @@ -13,6 +13,7 @@ config ARC
> >  	select ARCH_HAS_SETUP_DMA_OPS
> >  	select ARCH_HAS_SYNC_DMA_FOR_CPU
> >  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
> > +	select ARCH_NEED_CMPXCHG_1_EMU
> >  	select ARCH_SUPPORTS_ATOMIC_RMW if ARC_HAS_LLSC
> >  	select ARCH_32BIT_OFF_T
> >  	select BUILDTIME_TABLE_SORT
> > diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
> > index e138fde067dea..58045c8983404 100644
> > --- a/arch/arc/include/asm/cmpxchg.h
> > +++ b/arch/arc/include/asm/cmpxchg.h
> > @@ -8,6 +8,7 @@
> >  
> >  #include <linux/build_bug.h>
> >  #include <linux/types.h>
> > +#include <linux/cmpxchg-emu.h>
> >  
> >  #include <asm/barrier.h>
> >  #include <asm/smp.h>
> > @@ -46,6 +47,9 @@
> >  	__typeof__(*(ptr)) _prev_;					\
> >  									\
> >  	switch(sizeof((_p_))) {						\
> > +	case 1:								\
> > +		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
> > +		break;							\
> >  	case 4:								\
> >  		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
> >  		break;							\
> > @@ -65,8 +69,6 @@
> >  	__typeof__(*(ptr)) _prev_;					\
> >  	unsigned long __flags;						\
> >  									\
> > -	BUILD_BUG_ON(sizeof(_p_) != 4);					\
> > -									\
> >  	/*								\
> >  	 * spin lock/unlock provide the needed smp_mb() before/after	\
> >  	 */								\
> 
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
