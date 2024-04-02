Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0051FC6FD1F
	for <linux-snps-arc@archiver.kernel.org>; Tue,  2 Apr 2024 20:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vPHxYCB5SDG3HwiHdTBTkgWQvY6GlXPFx36InhUw0ZY=; b=2xR4KFGvxmHTXo
	fUv10tjpnZHWzUxdq5BxI7qhsEEq0KlxgYvxM4nUcZPtJ/rR9YMh8vRFrNSzFsF027rnWp1Lcvj9s
	6mjo1+E+7v+zSQKeTbSeKASk/DI1Eh9Ao+IT8WVOL4CooHywD6h0haA8MzQCgxEnCK+XxIM0pZQD8
	Jj2RHfv/2gT+IRruCU6ciIqrvCgsbaaJpj3fNVEqqu9fGZWdP4Bm3+/EA9pyvczw5O4EmbrImbcqU
	1lW1uu4xrjzDv2VGDfule0DFzHmJbWnQqMCgh070MJawiZYsQkLXouI6p0LLt8KD3LLQAMBytB0zS
	+FuU/r1ongRV21/vMniQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrl7B-0000000ClC0-2eo3;
	Tue, 02 Apr 2024 20:52:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrl79-0000000ClAd-1dQH
	for linux-snps-arc@lists.infradead.org;
	Tue, 02 Apr 2024 20:52:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4B0F6CE1E48;
	Tue,  2 Apr 2024 20:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84274C433F1;
	Tue,  2 Apr 2024 20:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712091132;
	bh=R3Vv/DIHvrty2Q1jbRGDUHTqjO0wMc/8gqvhtFZSArw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=WVZcjuEZ43WvEIfkaiwrdoMx0BOJsj+4l1u0IMMqul4n5rMgxWUUQl0Sy3ObQmMg2
	 Gu5ByVQvRCjwYaokcOhGlFTiQ2LxjWqe/b3+iD1b4B+RI+pI+Tfo5TT4s3IljE0tGw
	 eagYeop4H0txl4QzDYxv0F1cRhK0sQ8+LhEBEe/zqMginFsRmW4fGtO3MQd0D98GPK
	 IUPpzmEAkQ4u2ZIe4A8qLcqnEOllBaOOH4M8VUSMgTYEWAKy+Zr48LsNiCmRB/l4Wt
	 XJGMUNaWztZ9C0x650VLDFXs5bZjhICMpqnGdVH8MGNQjD660bhZmGxHY0Sgqo2J9F
	 agr8e4KeuOM4w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 1B64ACE0FF2; Tue,  2 Apr 2024 13:52:12 -0700 (PDT)
Date: Tue, 2 Apr 2024 13:52:12 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com,
	Vineet Gupta <vgupta@kernel.org>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH RFC cmpxchg 3/8] ARC: Emulate one-byte and two-byte
 cmpxchg
Message-ID: <8d92aab3-a3d0-4625-8b97-e336c0c7a2e8@paulmck-laptop>
References: <31c82dcc-e203-48a9-aadd-f2fcd57d94c1@paulmck-laptop>
 <20240401213950.3910531-3-paulmck@kernel.org>
 <836df0c7-51a7-4786-8a65-a70efe9b6eec@app.fastmail.com>
 <32936b57-f451-460b-a2df-e74293e44f5c@paulmck-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <32936b57-f451-460b-a2df-e74293e44f5c@paulmck-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_135215_802754_D6EDA3A2 
X-CRM114-Status: GOOD (  34.95  )
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

On Tue, Apr 02, 2024 at 10:06:14AM -0700, Paul E. McKenney wrote:
> On Tue, Apr 02, 2024 at 10:14:08AM +0200, Arnd Bergmann wrote:
> > On Mon, Apr 1, 2024, at 23:39, Paul E. McKenney wrote:
> > > Use the new cmpxchg_emu_u8() and cmpxchg_emu_u16() to emulate one-byte
> > > and two-byte cmpxchg() on arc.
> > >
> > > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > 
> > I'm missing the context here, is it now mandatory to have 16-bit
> > cmpxchg() everywhere? I think we've historically tried hard to
> > keep this out of common code since it's expensive on architectures
> > that don't have native 16-bit load/store instructions (alpha, armv3)
> > and or sub-word atomics (armv5, riscv, mips).
> 
> I need 8-bit, and just added 16-bit because it was easy to do so.
> I would be OK dropping the 16-bit portions of this series, assuming
> that no-one needs it.  And assuming that it is easier to drop it than
> to explain why it is not available.  ;-)
> 
> > Does the code that uses this rely on working concurrently with
> > non-atomic stores to part of the 32-bit word? If we want to
> > allow that, we need to merge my alpha ev4/45/5 removal series
> > first.
> 
> For 8-but cmpxchg(), yes.  There are potentially concurrent
> smp_load_acquire() and smp_store_release() operations to this same byte.
> 
> Or is your question specific to the 16-bit primitives?  (Full disclosure:
> I have no objection to removing Alpha ev4/45/5, having several times
> suggested removing Alpha entirely.  And having the scars to prove it.)
> 
> > For the cmpxchg() interface, I would prefer to handle the
> > 8-bit and 16-bit versions the same way as cmpxchg64() and
> > provide separate cmpxchg8()/cmpxchg16()/cmpxchg32() functions
> > by architectures that operate on fixed-size integer values
> > but not compounds or pointers, and a generic cmpxchg() wrapper
> > in common code that can handle the abtraction for pointers,
> > long and (if absolutely necessary) compounds by multiplexing
> > between cmpxchg32() and cmpxchg64() where needed.
> 
> So as to support _acquire(), _relaxed(), and _release()?
> 
> If so, I don't have any use cases for other than full ordering.

Nor any use cases other than integers.  (In case another thing you are
after here is good type-checking for non-integers combined with allowing
C-language implicit conversions for integers.)

						Thanx, Paul

> > I did a prototype a few years ago and found that there is
> > probably under a dozen users of the sub-word atomics in
> > the tree, so this mostly requires changes to architecture
> > code and less to drivers and core code.
> 
> Given this approach, the predominance of changes to architecture code
> seems quite likely to me.
> 
> But do we really wish to invest that much work into architectures that
> might not be all that long for the world?  (Quickly donning my old
> asbestos suit, the one with the tungsten pinstripes...)
> 
> 							Thanx, Paul

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
