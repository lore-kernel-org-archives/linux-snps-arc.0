Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F756D1AD59
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Oct 2024 13:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWaL737qVG8soJoq9xMMSkVU7xkzBYvEttegIOyGa5o=; b=eYa6MRZTD/zBbJ
	2p6SSmkFve+Dv5J2Tgus/qsMCAmuM/KnaZAgGysWdrTN6NF0t+XMLIfTrc+puKziGObQTjbfag6oW
	cOfpSItOHFkqcjILQkZY7Pwlgay4iwxTW+ISvHeH3UFQ9Haf3XTkfQ2Vtwpu8dzysjEufHTRWYeAO
	DHeSg7vvOw7MGLoVfeGLLO8FDRWXSjeSr1P0rgq7Pd7LDdjVCmiHR/Nq3OGXA1fpQoZfLCb3UQaO1
	QKoEJiUXV0Ydlm6gGD3w0mW9355pZqdREdpf/P9gxYsZDPva2tPXjpDE1aaiFfYM6Z+mA+KagLkd0
	eiw9SrDW2nArZP80o48A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1455-0000000BvUl-3CQI;
	Wed, 16 Oct 2024 13:28:51 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1453-0000000BvTx-0ESy
	for linux-snps-arc@lists.infradead.org;
	Wed, 16 Oct 2024 13:28:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A6F06A43D60
	for <linux-snps-arc@lists.infradead.org>; Wed, 16 Oct 2024 13:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F83C4CEC7;
	Wed, 16 Oct 2024 13:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729085327;
	bh=cBK9VJXhGNio9KGkEyEbMzsbPi7Rjfyb8HCMVbU4ft0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Iu85BA5R8f8kpBrTPP9K+xwtzv9Av9nr6TK28OSF748Y2v9fUpD8tPY/obNM3W8Hm
	 7ZCuQptoUCKoKmhbHzwrLuGBnVU74AilRs+yrP1KL237KofGCKrp+AZIdX87qIh3GM
	 +0Y1iQLyETo7XNcT9929aEGNv8fiiqHXSYxTCoqlgBT0MVdsz0Arl8bpGt2ZVendTC
	 1O2VDEJtjtznpWjdugSNAmhp+XQC49TLU5s0iOh2KoByVSbsv9ZvfInWtNKbUbjh+Z
	 QDB3MAhcQJ+gSJMc4/um7ZBQyxrEqzp42rpi9cjxSmCGY/0rSBMwwWhMDgaewurNLZ
	 S6zTrt0Sg22Sg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D8D6BCE0DCA; Wed, 16 Oct 2024 06:28:46 -0700 (PDT)
Date: Wed, 16 Oct 2024 06:28:46 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org
Subject: Re: ARC: Use __force to suppress per-CPU cmpxchg complaints
Message-ID: <d3779f58-7c8f-4a93-a9f0-c6dc39efa847@paulmck-laptop>
References: <c88fafb4-47d9-49b6-aeb6-5a83c9778791@paulmck-laptop>
 <c1afa8ac-5c6a-4966-975d-915887c8106d@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c1afa8ac-5c6a-4966-975d-915887c8106d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_062849_187095_4C4756A2 
X-CRM114-Status: GOOD (  15.68  )
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

On Tue, Oct 15, 2024 at 10:33:14PM -0700, Vineet Gupta wrote:
> On 10/9/24 10:55, Paul E. McKenney wrote:
> > Currently, the cast of the first argument to cmpxchg_emu_u8() drops the
> > __percpu address-space designator, which results in sparse complaints
> > when applying cmpxchg() to per-CPU variables in ARC.  Therefore, use
> > __force to suppress these complaints, given that this does not pertain
> > to cmpxchg() semantics, which are plently well-defined on variables in
> > general, whether per-CPU or otherwise.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202409251336.ToC0TvWB-lkp@intel.com/
> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > Cc: Vineet Gupta <vgupta@kernel.org>
> > Cc: <linux-snps-arc@lists.infradead.org>
> >
> > diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
> > index 58045c8983404..76f43db0890fc 100644
> > --- a/arch/arc/include/asm/cmpxchg.h
> > +++ b/arch/arc/include/asm/cmpxchg.h
> > @@ -48,7 +48,7 @@
> >  									\
> >  	switch(sizeof((_p_))) {						\
> >  	case 1:								\
> > -		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
> > +		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
> >  		break;							\
> >  	case 4:								\
> >  		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
> 
> 
> Added to for-curr.

Thank you!  As soon as it shows up in -next, I will drop it from my tree.

							Thanx, Paul

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
