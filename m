Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A24DCA6004
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Oct 2026 20:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4g843OT3huapsY78yLjDAjgKNhNqtnuXzN8NGSOKWA=; b=b3z23jmLIkGoPi
	Kds35Pnl6lIF4+23qFWW5AKLbFk5x1XAsrO0JsHfpkLp0lhh7Mp9sImxRONtD4X0L4rJ2TsCZIpHN
	1UQTe3JpHid9BFvRkwYNA4h489x5qsOSQnF7irnxMb1IHsCOshPKr90z9l53rRlFPZg+NpdTA+QXI
	vo/xbSK4p3aXSlLcde4DSv0S+EzWp/x2dwRuoJJVL+UqrOxg+HozJkwD5r6P8D4kUbBZj9JwZsHA6
	q9XC/3pBSa4sVCjdYK8MERBNudQ98+l+k1y+cd/UMTYIpW5D1y9Os2jBRLzHPzXJVAzICpQHN/TSZ
	u0Z/QavuU/MNDy+SzUpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYiD-00000003AHF-2Rqn;
	Wed, 07 Oct 2026 20:58:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYiB-00000003AH7-317Q
	for linux-snps-arc@lists.infradead.org;
	Wed, 07 Oct 2026 20:58:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DC82F60A53;
	Wed,  7 Oct 2026 20:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88DDA1F000FF;
	Wed,  7 Oct 2026 20:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791406682;
	bh=6WxyqvyYSdNPTbBnLGG14anOKtdEuM+bt5bLe2BRv/U=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=HByuxuIYdD0nrKhEN3T8KubjGIVh+9+9FPiSbMap0x9GIioYdwZzlOSOlKodojh1b
	 ZjMQzfKu0aVfglRPfdyAYYlX8Cggi73TTJKthD4i2A2jBgKGpGfO8NAGbieAZc6/XC
	 g80+Hi6+kzIBF50YjuMA4URcS/qormUTw+Mz3gJxVsdWLaSne3yO0AiQ4VKx0ABJhl
	 KjvRhIU3M1JNIh9hXGOVb8sw1qXKDlwuaDzRl8cD3dK837P4z8nVsTyUO10uc5sEQ3
	 EPyx1+5Nwnm73vwASMCobzSx6cmC6EvDVo1wbCQG2kJDt5Z+XpIh206TmeLOVOeHyU
	 jQZCoJ/mWhL9A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 36375CE0D79; Wed,  7 Oct 2026 13:58:02 -0700 (PDT)
Date: Wed, 7 Oct 2026 13:58:02 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-kernel@vger.kernel.org, Bradley Morgan <brads@mainlining.org>,
	Guo Ren <guoren@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-sh@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 3/5] ARC: Emulate two-byte cmpxchg
Message-ID: <708d744f-08a5-46b7-8c37-c227a0f3be73@paulmck-laptop>
References: <7f398d4a-7fae-4382-9cc4-8627e8aa912b@paulmck-laptop>
 <20261007203636.1982188-3-paulmck@kernel.org>
 <40f3c095-4202-4d2b-93e3-376a231d4fe8@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40f3c095-4202-4d2b-93e3-376a231d4fe8@kernel.org>
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

On Wed, Oct 07, 2026 at 10:48:39PM +0200, Vineet Gupta wrote:
> On 10/7/26 22:36, Paul E. McKenney wrote:
> > From: Bradley Morgan <brads@mainlining.org>
> > 
> > ARC has no two-byte atomic compare and swap, so the
> > arch_cmpxchg_relaxed() macro switch lets case 2 fall through to
> > BUILD_BUG() via default, and a two-byte cmpxchg() fails the build.
> > 
> > Route case 2 through the new cmpxchg_emu_u16(), which narrows the
> > old and new values itself, so the dispatch keeps the (uintptr_t)
> > casts the case 1 path already uses.
> > 
> > The sizeof(*(_p_)) fix that v4 folded in here landed separately
> > through Vineet's f050c3e61d2a, so this patch is now only the
> > case 2 wiring.
> > 
> > Signed-off-by: Bradley Morgan <brads@mainlining.org>
> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> 
> Acked-by: Vineet Gupta <vgupta@kernel.org>

Thank you!  I will apply this on my next rebase.  Unless something breaks,
I will include this in my pull request for the upcoming merge window.

							Thanx, Paul

> Thx,
> -Vineet
> 
> > ---
> >   arch/arc/include/asm/cmpxchg.h | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
> > index 76f43db0890fc..7157718f147c1 100644
> > --- a/arch/arc/include/asm/cmpxchg.h
> > +++ b/arch/arc/include/asm/cmpxchg.h
> > @@ -50,6 +50,9 @@
> >   	case 1:								\
> >   		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
> >   		break;							\
> > +	case 2:								\
> > +		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *__force)_p_, (unsigned long)_o_, (unsigned long)_n_);	\
> > +		break;							\
> >   	case 4:								\
> >   		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
> >   		break;							\
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
