Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA15CA5FC4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 30 Sep 2026 17:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwu0zymkfvppqMPDBBB8rqLTROzqIOhu89ba4ruk+aM=; b=q52OoVpozBZJ62
	NzsoFP3DIev8KN6GUw3e1EHGwz8hx47Rdf8GiVmwkxJNH1qKNDaqVJ+jo2uTD4zcksojnsyghGi+p
	heg/lSzAdzdzK9Bk4HKu0zfAWfvZ93yOJfJK/2B28/H2Mq8grNYkCl2FlMKTMRSqJsqFkBZ45xn5m
	mRygRBJlBD9niROynj3FPhjExAZEu/3xJJxB17Z6RSCFVnGV+W3eZj9rr/Dg7VwTlFT3U7kfAG93X
	MamBGArEnAjgsLJEcY/dUlOu077uH2YmtMozGO4A9005J7t3+1EbRmcWTKdyBBdT46U/DbGXHOcvi
	PVi/uaOpcpV3EyR7xmnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByZ7-00000006vL3-1vXZ;
	Wed, 30 Sep 2026 17:58:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByZ6-00000006vKq-2eRf
	for linux-snps-arc@lists.infradead.org;
	Wed, 30 Sep 2026 17:58:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6243243577;
	Wed, 30 Sep 2026 17:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D8A1F00898;
	Wed, 30 Sep 2026 17:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790791080;
	bh=6xHOixSBpY81EsKz1lQzfs9prSAmhNhJS3j4UUtU+VU=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=L0IJEQGjhr/ZGFDrYFw1PiEIA2FzChTtWBG/c5ZWDW1rFCvALFXVJIoEcAapuDEnq
	 MfsyPT82O6PcmSvvRPik1pk00dVFRqEwNs5+rVZ6RKJTRidLvQlsGnKwsWCs9Js4is
	 3oUt5J/Jo6A5T10S9XNVLyz7d7hTwdo+gPRuUPrpQ0BIXtye1AG6yTGowhLKZ6rnWv
	 e0Va2CGqK2SoGEOUyYvKLjOEV81EEESch6qVu6NnLjh/AZCD/5dmtA12LY/mVMr9Vv
	 My3oOA15wAog5iY4o5uYpt8YAd5/TiY9yyLJguCVtQus3bnXyFKqGErtWkkmBna6Z3
	 8c+B2BICgQLpg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 8690FCE097C; Wed, 30 Sep 2026 10:57:59 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:57:59 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: Vineet Gupta <vgupta@kernel.org>, kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev, linux-snps-arc@lists.infradead.org
Subject: Re: [paulmckrcu:cmpxchg2.2026.09.22a 25/28]
 arch/arc/include/asm/cmpxchg.h:46:58: error: pointer type mismatch in
 conditional expression
Message-ID: <a6c58582-2807-4d3c-80f7-29032c84ad01@paulmck-laptop>
References: <202609241517.SSV1Goz3-lkp@intel.com>
 <3cbe5de8-d04b-4afe-b19f-ad755d4ea320@kernel.org>
 <7CB37192-1AE6-4392-8D7B-89F401214C02@mainlining.org>
 <d7a78ebb-8b5e-42e9-9560-bd731724c9f8@linux.dev>
 <5c72050d-95c8-4ba1-ab15-22f774ea9319@paulmck-laptop>
 <05f1310a-684f-493a-ad4f-4f313f344c81@kernel.org>
 <F788AD1C-9D20-4D74-8B85-BA7DA4E82132@mainlining.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F788AD1C-9D20-4D74-8B85-BA7DA4E82132@mainlining.org>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Sep 30, 2026 at 07:39:02AM +0100, Bradley Morgan wrote:
> On 29 September 2026 23:10:01 BST, Vineet Gupta <vgupta@kernel.org> wrote:
> >
> >
> >On 9/29/26 13:47, Paul E. McKenney wrote:
> >> On Thu, Sep 24, 2026 at 02:27:11PM -0700, Vineet Gupta wrote:
> >>> On 9/24/26 13:58, Bradley Morgan wrote:
> >>>> On 24 September 2026 21:52:55 BST, Vineet Gupta <vgupta@kernel.org>
> >wrote:
> >>>>> On 9/24/26 00:51, kernel test robot wrote:
> >>>>>> tree:   https://github.com/paulmckrcu/linux cmpxchg2.2026.09.22a
> >>>>>> head:   54c282c15475ebfae4712fe3ab637c9d19c723d6
> >>>>>> commit: b6d4f6af38f85e7948fd64f9bf09cbb858b4dade [25/28] ARC:
> >Emulate
> >>>>> two-byte cmpxchg
> >>>>>> config: arc-allyesconfig
> >>>>>
> >(https://download.01.org/0day-ci/archive/20260924/202609241517.SSV1Goz3-=
lkp@intel.com/config)
> >>>>>> compiler: arc-linux-gcc (GCC) 16.1.0
> >>>>>> reproduce (this is a W=3D1 build):
> >>>>>
> >(https://download.01.org/0day-ci/archive/20260924/202609241517.SSV1Goz3-=
lkp@intel.com/reproduce)
> >>>>>> If you fix the issue in a separate patch/commit (i.e. not just a n=
ew
> >>>>> version of
> >>>>>> the same patch/commit), kindly add following tags
> >>>>>> | Reported-by: kernel test robot <lkp@intel.com>
> >>>>>> | Closes:
> >>>>>
> >https://lore.kernel.org/oe-kbuild-all/202609241517.SSV1Goz3-lkp@intel.co=
m/
> >>>>>> All errors (new ones prefixed by >>):
> >>>>>> =

> >>>>>>       In file included from arch/arc/include/asm/atomic.h:13,
> >>>>>>                        from include/linux/atomic.h:7,
> >>>>>>                        from include/asm-generic/bitops/lock.h:5,
> >>>>>>                        from arch/arc/include/asm/bitops.h:190,
> >>>>>>                        from include/linux/bitops.h:67,
> >>>>>>                        from include/linux/log2.h:12,
> >>>>>>                        from include/asm-generic/div64.h:55,
> >>>>>>                        from
> >./arch/arc/include/generated/asm/div64.h:1,
> >>>>>>                        from include/linux/math.h:6,
> >>>>>>                        from include/linux/math64.h:6,
> >>>>>>                        from include/linux/time.h:6,
> >>>>>>                        from include/linux/stat.h:19,
> >>>>>>                        from include/linux/fs_dirent.h:5,
> >>>>>>                        from include/linux/fs/super_types.h:5,
> >>>>>>                        from include/linux/fs/super.h:5,
> >>>>>>                        from include/linux/fs.h:5,
> >>>>>>                        from include/linux/fscrypt.h:16,
> >>>>>>                        from fs/crypto/fscrypt_private.h:15,
> >>>>>>                        from fs/crypto/hooks.c:10:
> >>>>>>       fs/crypto/hooks.c: In function 'fscrypt_get_symlink':
> >>>>>>>> arch/arc/include/asm/cmpxchg.h:46:58: error: pointer type mismat=
ch
> >in
> >>>>> conditional expression [-Wincompatible-pointer-types]
> >>>>>>          46 |         unsigned long _new_ =3D (unsigned long)(0 ?
> >*(_p_) :
> >>>>> (new));              \
> >>>>> =

> >>>>> Issue is in=A0 fs/crypto/hooks.c doing cmpxchg_release(&inode->i_li=
nk,
> >NULL,
> >>>>> pstr.name)
> >>>>> where i_link is char * and pstr.name is unsigned char *),
> >>>>> =

> >>>>> The problem is when pointer types are incompatible and that's exact=
ly
> >the
> >>>>> W toggle above.
> >>>>> =

> >>>>> So Bradley's patch needs this fixup
> >>>>> =

> >>>>> diff --git a/arch/arc/include/asm/cmpxchg.h
> >b/arch/arc/include/asm/cmpxchg.h
> >>>>> index 4596edfefa95..9053098bb152 100644
> >>>>> --- a/arch/arc/include/asm/cmpxchg.h
> >>>>> +++ b/arch/arc/include/asm/cmpxchg.h
> >>>>> @@ -42,8 +42,10 @@
> >>>>>   =A0#define arch_cmpxchg_relaxed(ptr, old, new) =A0 =A0 \
> >>>>>   =A0({ =A0 =A0\
> >>>>>   =A0 =A0 =A0 =A0 __typeof__(ptr) _p_ =3D (ptr); =A0 =A0 \
> >>>>> -=A0 =A0 =A0 =A0unsigned long _old_ =3D (unsigned long)(0 ? *(_p_) =
: (old)); =A0
> >=A0 =A0 =A0 =A0 =A0 \
> >>>>> -=A0 =A0 =A0 =A0unsigned long _new_ =3D (unsigned long)(0 ? *(_p_) =
: (new)); =A0
> >=A0 =A0 =A0 =A0 =A0 \
> >>>>> +=A0 =A0 =A0 =A0__typeof__(*(ptr)) _o_ =3D (old); =A0 =A0\
> >>>>> +=A0 =A0 =A0 =A0__typeof__(*(ptr)) _n_ =3D (new); =A0 =A0\
> >>>>> +=A0 =A0 =A0 =A0unsigned long _old_ =3D (unsigned long)_o_; =A0 =A0=
 =A0 =A0 =A0 =A0\
> >>>>> +=A0 =A0 =A0 =A0unsigned long _new_ =3D (unsigned long)_n_; =A0 =A0=
 =A0 =A0 =A0 =A0\
> >>>>> =

> >>>>> P.S: For arch changes shouldn't the submitter be required to at lea=
st
> >test
> >>>>> the building, specially when this involves the macro maze. Its real=
ly
> >easy
> >>>>> with crosstool hosting all the cross-compilers [1] - just download
> >and
> >>>>> untar.
> >>>>> =

> >>>>> [1]
> >>>>>
> >https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/16.=
2.0/
> >>>> Well thanks but I didn't have a proper server till yesterday.
> >>> A relatively decent laptop works for me.
> >> And you will get *way* faster response time than waiting on kernel
> >> test robot.  ;-)
> >> =

> >>>> I'll post all arch patches when Paul tells me how he wants it
> >>> Please do a minimal compile build - it will save you the re-spins.
> >>> =

> >>>> Like if he wants u16 in first then arch changes sent.
> >> First, I queued Vineet's cmpxchg patch from his pull request to Linus.
> >> I have marked it "EXP" so that I don't accidentally ship it off
> >somewhere
> >> myself.
> >> =

> >> Given the surprises from the u8/u16 changes, I suggest the following:
> >> =

> >> 1.	One patch to add cmpxchg_emu_u16(), but without the u8/u16
> >> 	changes.  And without the CONFIG_ARCH_NEED_CMPXCHG_1_2_EMU
> >> 	change.
> >> =

> >> 	At Bradley's option, cmpxchg_emu_u8() could remain as is, with
> >> 	cmpxchg_emu_u16() being born as u16.  The upside is less churn
> >> 	later.	The downside is that more up-front testing is needed,
> >> 	and thus greater interaction with busy architecture maintainers.
> >> 	If it was me, I would start with cmpxchg_emu_u16() being as
> >> 	close to cmpxchg_emu_u8() as possible in order to "get the
> >> 	camel's nose into the tent" as quickly and easily as possible.
> >> 	But this is Bradley's patch series, so his choice.
> >> =

> >> 2.	One patch each to add use of cmpxchg_emu_u16() to each
> >> 	affected architecture.
> >> =

> >> 3.	Given #1, each patch for #2 can go in independently.  The patches
> >> 	for #2 of course need acks from their respective maintainers.
> >> =

> >> 4.	A patch to rename CONFIG_ARCH_NEED_CMPXCHG_1_EMU to
> >> 	CONFIG_ARCH_NEED_CMPXCHG_1_2_EMU.  This will cross lib and
> >> 	architectures, which should be OK because it is just a name
> >> 	change.  We collect acks as before.
> >> =

> >> 5.	Convert cmpxchg_emu_u8() away from uintptr_t, and, if needed,
> >> 	cmpxchg_emu_u16() as well.
> >> =

> >> This could take a merge window or three to get in, but that is not all
> >> that bad for cross-architecture patch serieses such as this one.
> >> =

> >> Bradley, Vineet, thoughts?
> >
> >Sound like a plan, buy hey its Bradley doing all the work here ;-)
> =

> Hmm, I'd prefer to leave u16 as is, I'll send the rename patch in the
> coming hours/days, I have school =


Fair enough, your choice!

> >I would only add something I mentioned before: download the cross
> >toolchains and do some build testing locally before posting. This is not
> >because arch maintainers are busy or lazy (although they can be both) -
> >that saves potential respins induced by new code or even broken existing
> >code exposed.

Of course, this choice increases the urgency of Vineet's cross-toolchain
suggestion due to the larger difference in code from cmpxchg_emu_u8().
The more the differences, the greater the chance of something going
wrong and the greater the value of timely cross-toolchain build checks.

							Thanx, Paul

> >And on that topic I just found a gcc 16 ICE when building an allyesconfig
> >for ARC. I will only be able to post the gcc fix after LPC, but just FYI
> >in case someone runs into it.
> >
> >Thx,
> >-Vineet
> >
> =

> --- Thanks!
> "I'm not a very positive person" - Linus torvalds

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
