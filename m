Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9591CC98302
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Sep 2026 19:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ynroGL7WMayfrGJPE8TCYGmAajaHGURJjDWPKWcVOW4=; b=M208enOwcebjOK
	oqu20JRpra0/ja06qIAxul1wFByse7z8JKwkyBw9nEB842NeiqIfhe7ChUGMJWTYP0eMnTfP2LzBz
	RvKiiE+WNhHZOJ7SffZLVCAyTO0bq9+aIAz1FX2JC/JVYuJMMp5NC5wqawSl/1rMvkG20j8zBjwqS
	WETfr+mBCCIwSbwS2BJ5GIZQDjYZoRVoz7xWuXfaXOK9++ER1BQL4Q5jqTRnaLkEuxWl4Ik1yB0fn
	ckKrqRJKKi/yJudFzGJ4HxpNv7vZrP2EnVDXyyW5Fb3csEH6j0JpR+wPmzjh0pXqVBWjRe6muaT/Y
	PEHWsqekpUshEPyZ6ulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96I4-00000006QWy-4293;
	Tue, 22 Sep 2026 19:36:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x96I4-00000006QWq-16qe
	for linux-snps-arc@lists.infradead.org;
	Tue, 22 Sep 2026 19:36:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 554DF6022B;
	Tue, 22 Sep 2026 19:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0714E1F000FF;
	Tue, 22 Sep 2026 19:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790105791;
	bh=oX/GBfm128lghM6TeDZc4jeWPRFNdIhMy4EtsnUfXbQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=WZM/wxix+IApXVCHLDa2PwnKXYYUuz/0/V3zbE4t1k/EGqTwzioRF8SRZ1jIEp1rk
	 iGkyZg8Y3IW12KE/5nb/u8JUG2lVFKo1Lmnpyput9TwZP7Za/3KUNU9KU/ov1qUIpO
	 UBnCrHqAVH3Ztiuq2YB0kIPZvnKraEu1JtqYRDJ9I3y1AU1eQsnXdHoqgIkMYwSsJw
	 J3PslNi41+B9p+CNBpIUVWACvkz3scKYLnIFhgODWvdYnOE9WULO+SfrAnN4Yv+9Ea
	 teI7kpiKzveZHPgxfsB8Z50TbH+2xfLgweQ3YT1Ei+DQzSVURkWZcWrATkVblLR2+6
	 xgRS6p4Qb6RSw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id B9DFBCE0836; Tue, 22 Sep 2026 12:36:30 -0700 (PDT)
Date: Tue, 22 Sep 2026 12:36:30 -0700
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
Message-ID: <693619b9-c2f8-4ecd-a83a-cd608148854a@paulmck-laptop>
References: <20260922173354.14404-1-brads@mainlining.org>
 <78f7ab38-46c8-4968-a2ae-4c3c98e32f4d@paulmck-laptop>
 <7BE5B8EA-FAFB-4CBB-8FF1-ECDEEB1618B0@mainlining.org>
 <9a7883a3-a1b1-4d37-8234-f4c62b2e6e27@paulmck-laptop>
 <FDE80F3F-6F96-4A6A-8536-0B2A4ED793A6@mainlining.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <FDE80F3F-6F96-4A6A-8536-0B2A4ED793A6@mainlining.org>
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

On Tue, Sep 22, 2026 at 08:03:51PM +0100, Bradley Morgan wrote:
> On 22 September 2026 19:59:39 BST, "Paul E. McKenney" <paulmck@kernel.org>
> wrote:
> >On Tue, Sep 22, 2026 at 07:37:54PM +0100, Bradley Morgan wrote:
> >> On 22 September 2026 19:29:32 BST, "Paul E. McKenney"
> ><paulmck@kernel.org>
> >> wrote:
> >> >On Tue, Sep 22, 2026 at 05:33:49PM +0000, Bradley Morgan wrote:
> >> >> This is v4 of the two byte cmpxchg emulation series, wiring
> >> >> cmpxchg_emu_u16() into arc, csky, sh and xtensa.
> >> >> 
> >> >> v3 had changed cmpxchg_emu_u8()'s success return to (u16)old, which
> >was
> >> >> a 16-bit mask in the 8-bit function, and a dead one at that, since
> >the
> >> >> compare guarantees the low 8 bits of old are the byte being returned.
> >> >> David Laight asked where that cast came from. v4 returns old
> >unmasked,
> >> >> the exact behaviour the one-byte emulator always had, so nothing that
> >> >> uses cmpxchg_emu_u8() through the widened prototypes sees a change.
> >> >> 
> >> >> David also noted v3 extended the (unsigned long)(0 ? *ptr : (old))
> >type
> >> >> check to csky and sh but not arc and xtensa. v4 adds it there too, so
> >a
> >> >> cmpxchg(&p, 4, 5) fails to compile on every architecture in the
> >series,
> >> >> verified with each architecture's macro instantiated standalone.
> >> >> 
> >> >> While adding the type check to arc, the switch subject turned out to
> >be
> >> >> sizeof((_p_)), the pointer, not sizeof(*(_p_)), the pointee. On
> >32-bit
> >> >> arc the switch was always 4, so the size 1 and size 2 cases were dead
> >> >> code and every sub-word cmpxchg() went through the 32-bit llock/scond
> >> >> pair, comparing whole words against sub-word values, so the compare
> >> >> almost never succeeded. The switch now tests the pointee, and the u8
> >> >> path it was always meant to dispatch actually runs, so the one-byte
> >> >> emulation works on arc for the first time since the sizeof bug landed
> >> >> with the original cmpxchg_emu_u8() wiring.
> >> >> 
> >> >> The host test of 972 cases across both halfword offsets against a
> >byte
> >> >> level reference model still passes, and a 20000 case randomized run
> >> >> checking the masked compare and return against a hardware cmpxchg r16
> >> >> model passes with zero mismatches.
> >> >> 
> >> >> David pointed out on v1 that a u16 prototype does not compile warning
> >> >> free when exchanging a pointer type, because the switch statements in
> >> >> the architecture macros instantiate every size case, so a pointer
> >> >> cmpxchg() type checks the two byte case, and the (u16) casts there
> >> >> warn. v4 keeps taking the old and new values as unsigned long and
> >> >> casting to u16 inside the function, so the call sites need no
> >narrowing
> >> >> casts and pointer exchanges compile clean. The function still
> >compares
> >> >> and returns exactly the 16 bits the caller asked for, which matches
> >> >> hardware cmpxchg r16 behaviour.
> >> >> 
> >> >> The ARMv6 wiring stays dropped from v1, per Arnd Bergmann's offer to
> >> >> take the INTEGRATOR_CM1136JFS cleanup in his platform removal series.
> >> >
> >> >I have pulled these in, but only to expose them to things like the
> >kernel
> >> >test robot.  My guess is that they will go in by some other path.
> >> >
> >> >And to that end:
> >> >
> >> >Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
> >> >
> >> >But I could of course easily be missing subtle arch-specific bugs.
> >> 
> >> There are, according to sashiko, but I can't seem to make that thing
> >happy
> >> no matter what I do
> >
> >Hahahahaha!!!
> >
> >We forgot to CC the architecture maintainers.
> >
> >For the changes to lib/cmpxchg-emu.c:
> >
> >	Cc: Andrew Morton <akpm@linux-foundation.org>
> >	Cc: Arnd Bergmann <arnd@kernel.org>
> >
> >For ARC:
> >
> >	Cc: Vineet Gupta <vgupta@kernel.org>
> >	linux-snps-arc@lists.infradead.org
> >
> >For sh:
> >
> >	Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
> >	Cc: Rich Felker <dalias@libc.org>
> >	Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> >	Cc: <linux-sh@vger.kernel.org>
> >
> >For csky:
> >
> >	Cc: Guo Ren <guoren@kernel.org>
> >	Cc: <linux-csky@vger.kernel.org>
> >	Cc: <linux-kernel@vger.kernel.org>
> >
> >For xtensa:
> >
> >	Cc: Chris Zankel <chris@zankel.net>
> >	Cc: Max Filippov <jcmvbkbc@gmail.com>
> >
> >They might be willing to help.  ;-)
> >
> >							Thanx, Paul
> >
> >> >> Bradley Morgan (5):
> >> >>   lib: Add two-byte cmpxchg emulation function
> >> >>   ARC: Emulate two-byte cmpxchg
> >> >>   sh: Emulate two-byte cmpxchg
> >> >>   csky: Emulate two-byte cmpxchg
> >> >>   xtensa: Emulate two-byte cmpxchg
> >> 
> >> --- Thanks!
> >> "I'm not a very positive person" - Linus torvalds
> If I have to do another 100 revisions I'll die, I'm suggesting getting the
> new function in first, then converting arches later? Or does this break
> arches.

Well, you are only on v4.  ;-)

Adding a new function without uses is frowned upon.  After all, if it
wasn't frowned upon, there would be tons of unused code in the kernel.

But you are in luck.  John Paul Adrian Glaubitz noticed the sh patch
despite not being CCed and acked it.  And I happen to be the one who
committed the original lib/cmpxchg-emu.c commit.  Plus at least one of
the architecture-specific patches.  (Ah, yes, the problem was that RCU
had been using single-byte cmpxchg(), thus breaking the architectures
not supporting this, so I provided cmpxchg_emu_u8() as the fix.)

So what I have done is to queue the lib patch, but without the
arch/*/Kconfig pieces, and adding the CCs shown above.  I have also
queued the sh patch, with added CCs and with arch/sh/Kconfig.  The point
of moving the arch/*/Kconfig changes each to its respective patch is to
put all the arch-specific changes into the corresponding patch.

I will of course check with John Paul Adrian Glaubitz to make sure that
he is OK with relocating the arch/sh/Kconfig change to the patch that
he already acked, and I will of course adjust as needed if he isn't.

That means you only need to re-send the ARC, csky, and xtensa patches,
with CCs added as shown above.  No guarantees, but hopefully quite a
bit fewer than 100 times.  ;-)

							Thanx, Paul

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
