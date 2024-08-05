Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA6AC3DA4A
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Aug 2024 20:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7B4QLDLJgtvp6MkvsAqa3Jg/PRITCuyrCXds/fD+kA=; b=sZES66TiTWTP4B
	5XKU+cJqtYkUeXtsUhCYMlb/MIVUuGfXmiXg3O+lWWOo1vvThSCMG0x1Mw6DgEOnQvUiqTncizq0X
	+wuZPEghQ1AW2ezv45g1fB4lyFWv26nFMnn0iUaprM7JzRws4RFHaW6R/ohnlcCSnaUnc39oanOwf
	k4bMsAHofYB0mDaAzVq8bPXo6UGa0Ri904TL4b5AjJbqFTM8s5/dh4pOCJRkFa4hmQAL5NRvidlao
	6dP6HjAI5WjIk+HM448vcA+EqRDcgpFjaOU+KbGS79AHtskhi01ueFK5oua3TKKGqY//78TID6KSH
	WsEq0KGgPkjCOvEZCsMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb4OX-0000000HD9z-18ob;
	Mon, 05 Aug 2024 20:33:29 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb4OT-0000000HD92-2dDR
	for linux-snps-arc@lists.infradead.org;
	Mon, 05 Aug 2024 20:33:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 11754CE0B32;
	Mon,  5 Aug 2024 20:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E7F0C32782;
	Mon,  5 Aug 2024 20:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722890003;
	bh=WsM7t+wQZsJ9S/+ASKwjmeDyYoTIHz5SBNGINBoSOuQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=bd1QNmGhqizx1N751/MDe3BwJ5eBe0NEkA1Rr9ZhC+eoKCB7ItNpl8AQ+V3nx8Zo0
	 R4FzjtwIhnEONdOTdxHMHvBlRal9Gl9d6xbPnf9m+/xNSnrXPCOtS+ISQwpdE+oqvT
	 EQLI2vbby9JFVlMiTINdm1eyjvxtjK+Qqi19H1bumnvKGUMN3mjuLjghctOfYyxKZ7
	 peqQ7EpcMm/mJ3OMspP/e+6opST+C2D1kvgCgPGinENVrRGBCwV8RpJwib72ZpAFJt
	 HoWEvX5GLpcA9P3DXldxQanhVroc/OQw43vqdDX3e4x/cRX4L5chUx3Fsgr3ddvO07
	 QLQ2+2IOOyrRA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D4443CE0A34; Mon,  5 Aug 2024 13:33:22 -0700 (PDT)
Date: Mon, 5 Aug 2024 13:33:22 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	elver@google.com, akpm@linux-foundation.org, tglx@linutronix.de,
	peterz@infradead.org, torvalds@linux-foundation.org, arnd@arndb.de,
	geert@linux-m68k.org, palmer@rivosinc.com, mhiramat@kernel.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH cmpxchg 3/3] sh: Emulate one-byte cmpxchg
Message-ID: <3f62ef41-aa71-4483-b0bd-cdd5e1caab38@paulmck-laptop>
References: <c1b7f3a2-da50-4dfb-af6f-a1898eaf2b79@paulmck-laptop>
 <20240805192119.56816-3-paulmck@kernel.org>
 <d36d1c197bed83f91299e5cf211ecc4169d3b7a1.camel@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d36d1c197bed83f91299e5cf211ecc4169d3b7a1.camel@physik.fu-berlin.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_133326_223189_0BB11377 
X-CRM114-Status: GOOD (  19.45  )
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

On Mon, Aug 05, 2024 at 10:13:38PM +0200, John Paul Adrian Glaubitz wrote:
> On Mon, 2024-08-05 at 12:21 -0700, Paul E. McKenney wrote:
> > Use the new cmpxchg_emu_u8() to emulate one-byte cmpxchg() on sh.
> > 
> > [ paulmck: Drop two-byte support per Arnd Bergmann feedback. ]
> > [ paulmck: Apply feedback from Naresh Kamboju. ]
> > [ Apply Geert Uytterhoeven feedback. ]
> > 
> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > Cc: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: Palmer Dabbelt <palmer@rivosinc.com>
> > Cc: Masami Hiramatsu <mhiramat@kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: <linux-sh@vger.kernel.org>
> > ---
> >  arch/sh/Kconfig               | 1 +
> >  arch/sh/include/asm/cmpxchg.h | 3 +++
> >  2 files changed, 4 insertions(+)
> > 
> > diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> > index 1aa3c4a0c5b27..e9103998cca91 100644
> > --- a/arch/sh/Kconfig
> > +++ b/arch/sh/Kconfig
> > @@ -14,6 +14,7 @@ config SUPERH
> >  	select ARCH_HIBERNATION_POSSIBLE if MMU
> >  	select ARCH_MIGHT_HAVE_PC_PARPORT
> >  	select ARCH_WANT_IPC_PARSE_VERSION
> > +	select ARCH_NEED_CMPXCHG_1_EMU
> >  	select CPU_NO_EFFICIENT_FFS
> >  	select DMA_DECLARE_COHERENT
> >  	select GENERIC_ATOMIC64
> > diff --git a/arch/sh/include/asm/cmpxchg.h b/arch/sh/include/asm/cmpxchg.h
> > index 5d617b3ef78f7..1e5dc5ccf7bf5 100644
> > --- a/arch/sh/include/asm/cmpxchg.h
> > +++ b/arch/sh/include/asm/cmpxchg.h
> > @@ -9,6 +9,7 @@
> >  
> >  #include <linux/compiler.h>
> >  #include <linux/types.h>
> > +#include <linux/cmpxchg-emu.h>
> >  
> >  #if defined(CONFIG_GUSA_RB)
> >  #include <asm/cmpxchg-grb.h>
> > @@ -56,6 +57,8 @@ static inline unsigned long __cmpxchg(volatile void * ptr, unsigned long old,
> >  		unsigned long new, int size)
> >  {
> >  	switch (size) {
> > +	case 1:
> > +		return cmpxchg_emu_u8(ptr, old, new);
> >  	case 4:
> >  		return __cmpxchg_u32(ptr, old, new);
> >  	}
> 
> Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Thank you very much!  I will apply this on my next rebase.

							Thanx, Paul

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
