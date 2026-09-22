Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C027BC98302
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Sep 2026 18:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TykR9B4cMKpvGY1wle8lU9BVq4TyUst9QEn6FmG0/bU=; b=b1Hyr4lBj/HgWl
	ATkfqehWU+FO8gjXdiHgYrYSzxR6BkKWsK/EJ/0bG+hJ1yjkUpL+YoL98QDaPokuh/YSv9hy2OC42
	+5DYcUN1SVmJJE5f/txu+EhM7bikWLdFXJzz/hq5T53vsI2KChCs6asjseSlVbeJTjNpi12fAAW7/
	zrfenFPFzyTf8+RaN7Y2FTZwyPC9qyf6l+JQBdN8fmUtb0zTx4JS0+7Haq8TDjzak4fgoxh61ZCzy
	11NO8I7iNv43hSsNDvlPKXp6VuDiR40rttP+KU5eGcD0el2FwjYjzM/QqqwLxSGpuw6myO7CDs108
	GwqFECniFHqa6AQ+ejEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95FH-00000006Ih6-1Tso;
	Tue, 22 Sep 2026 18:29:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95FF-00000006Igw-3bFt
	for linux-snps-arc@lists.infradead.org;
	Tue, 22 Sep 2026 18:29:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F237760142;
	Tue, 22 Sep 2026 18:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48141F0089C;
	Tue, 22 Sep 2026 18:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790101772;
	bh=Xv5xLK8KOo7dSSMzLTTX5jv3aEEFwtmmbrVvdDw+CEo=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=j1crwmL8NxK06lnevOQ7tdcqPik5Zf5n6nAszWGxR/vEls7Sapq7BJzsNjICE/oCQ
	 dyG3Zt1RcpmTiX7U1vC7SsRDJu790V1YxxKr50YYL8pCGhf3/7FLK0KPBDh1b1z4ZP
	 QRntkGXQFbrHlmxtIS6HjTfMMM6NCVYj12n6kcihmpF0QH+93QpSEMLhXUYiqumMln
	 lWyZGrUFJIBspHXf4lULPKxikVQGj6oBfgv6n8DvLWSb2H49MdszqOpMXTTPzljFI8
	 y7abFBjUd7XhqUk46eUGvIMbgnMUPSpN7XLNxtwPTLS5hJbQN5YduRKcD9oRgWEnaM
	 ckkzKobWuWYrQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 66197CE0836; Tue, 22 Sep 2026 11:29:32 -0700 (PDT)
Date: Tue, 22 Sep 2026 11:29:32 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vineet Gupta <vgupta@kernel.org>, Guo Ren <guoren@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>, Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
	David Laight <david.laight.linux@gmail.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Add two-byte cmpxchg emulation and wire it into
 the architectures
Message-ID: <78f7ab38-46c8-4968-a2ae-4c3c98e32f4d@paulmck-laptop>
References: <20260922173354.14404-1-brads@mainlining.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260922173354.14404-1-brads@mainlining.org>
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

On Tue, Sep 22, 2026 at 05:33:49PM +0000, Bradley Morgan wrote:
> This is v4 of the two byte cmpxchg emulation series, wiring
> cmpxchg_emu_u16() into arc, csky, sh and xtensa.
> 
> v3 had changed cmpxchg_emu_u8()'s success return to (u16)old, which was
> a 16-bit mask in the 8-bit function, and a dead one at that, since the
> compare guarantees the low 8 bits of old are the byte being returned.
> David Laight asked where that cast came from. v4 returns old unmasked,
> the exact behaviour the one-byte emulator always had, so nothing that
> uses cmpxchg_emu_u8() through the widened prototypes sees a change.
> 
> David also noted v3 extended the (unsigned long)(0 ? *ptr : (old)) type
> check to csky and sh but not arc and xtensa. v4 adds it there too, so a
> cmpxchg(&p, 4, 5) fails to compile on every architecture in the series,
> verified with each architecture's macro instantiated standalone.
> 
> While adding the type check to arc, the switch subject turned out to be
> sizeof((_p_)), the pointer, not sizeof(*(_p_)), the pointee. On 32-bit
> arc the switch was always 4, so the size 1 and size 2 cases were dead
> code and every sub-word cmpxchg() went through the 32-bit llock/scond
> pair, comparing whole words against sub-word values, so the compare
> almost never succeeded. The switch now tests the pointee, and the u8
> path it was always meant to dispatch actually runs, so the one-byte
> emulation works on arc for the first time since the sizeof bug landed
> with the original cmpxchg_emu_u8() wiring.
> 
> The host test of 972 cases across both halfword offsets against a byte
> level reference model still passes, and a 20000 case randomized run
> checking the masked compare and return against a hardware cmpxchg r16
> model passes with zero mismatches.
> 
> David pointed out on v1 that a u16 prototype does not compile warning
> free when exchanging a pointer type, because the switch statements in
> the architecture macros instantiate every size case, so a pointer
> cmpxchg() type checks the two byte case, and the (u16) casts there
> warn. v4 keeps taking the old and new values as unsigned long and
> casting to u16 inside the function, so the call sites need no narrowing
> casts and pointer exchanges compile clean. The function still compares
> and returns exactly the 16 bits the caller asked for, which matches
> hardware cmpxchg r16 behaviour.
> 
> The ARMv6 wiring stays dropped from v1, per Arnd Bergmann's offer to
> take the INTEGRATOR_CM1136JFS cleanup in his platform removal series.

I have pulled these in, but only to expose them to things like the kernel
test robot.  My guess is that they will go in by some other path.

And to that end:

Reviewed-by: Paul E. McKenney <paulmck@kernel.org>

But I could of course easily be missing subtle arch-specific bugs.

							Thanx, Paul

> Bradley Morgan (5):
>   lib: Add two-byte cmpxchg emulation function
>   ARC: Emulate two-byte cmpxchg
>   sh: Emulate two-byte cmpxchg
>   csky: Emulate two-byte cmpxchg
>   xtensa: Emulate two-byte cmpxchg

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
