Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D8DCA5FCE
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Oct 2026 12:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CHKVN5Bd3RWtgn4N6gKPKgIapAJ40TpmotVJI3VfT28=; b=wAbZr1xPBMgwll
	WqGEk9irgnOnexOCTJnnHKiSVqlrIKC+wkP5tFjYLGrwX46f/ykbQuLVpLIDqgs8SkSDKa4e/6t2M
	Sm+lkp9wRSbBAZDQkOb7g2nnFYQUTtM0tyM5xdCTk2SIvUS/ZHIK5rUv2VYc4ekwSs0aANG+fH/1r
	SU2MH4Pl+3W55nf2TvadjMqvp86k/9mlw4W4C4hCHguhYEQPq2V8TIPRfKQo2AgLJ5Jx92akBzUB7
	mLh5aV5siIqUrx5lkvTb3vtVcR4lPKhUO30KHrcFD4uMtzh65qVeRgBxExvYKBzNUYrwFave9bZdo
	04/jx74CqOMZ/ugo0Izg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDhey-0000000GOLS-1k2l;
	Mon, 05 Oct 2026 12:19:12 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDhev-0000000GOKm-3bno
	for linux-snps-arc@lists.infradead.org;
	Mon, 05 Oct 2026 12:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791202747; bh=gjBaaZLSSG7xkXSEyV4DZHC
	mPVituVtcP387dc9XRps=; b=MqavCb9c+9xQwvCc1C3z4RiEAH/FsQkjjN9sRvzy7ticlZZCr7
	zXEfJSN6i802CylmCxVw8UaByF3pquu4N7juuhXk/+HEOGrERDltxvXAeibfOqn7wk6DNHwEEOj
	5vfkdSP16ZRfe824de5lFqVfWuZI2KgVWF1MffUj2L1jSUgFHKneuEaBW4yt80YxWY2MVCD/cv/
	7gSS+rnn0LR1V8T5Uku+ATJwZyhD6rQ2ZmyZ/cB1CkN5y9NHypI78xneVhhuOsVZ9wgs8p/hOSi
	bdhzTj4QXYe8WyBzJh81Z/42fc5KGrZm7BDnSR4p5RDJJOZ2kFU7lo0YtPggrSJOW+A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791202747; bh=gjBaaZLSSG7xkXSEyV4DZHC
	mPVituVtcP387dc9XRps=; b=OHqw8qAJ55BGP9vJEcsuFYWZJYPm2LAxtDjEhqYAeKUmwaXuZK
	LQYOpJt5BNxVH3RiRD3a9rh2FM9y7ICdO7Cw==;
Date: Mon, 05 Oct 2026 13:19:08 +0100
From: Bradley Morgan <brads@mainlining.org>
To: akpm@linux-foundation.org, vgupta@kernel.org, guoren@kernel.org,
 chris@zankel.net, jcmvbkbc@gmail.com
CC: arnd@arndb.de, paulmck@kernel.org, david.laight.linux@gmail.com,
 glaubitz@physik.fu-berlin.de, ysato@users.sourceforge.jp, dalias@libc.org,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_0/3=5D_Add_two-byte_cmpxchg_em?=
 =?US-ASCII?Q?ulation_and_wire_it_into_the_architectures?=
In-Reply-To: <20261005120700.383058-1-brads@mainlining.org>
References: <20261005120700.383058-1-brads@mainlining.org>
Message-ID: <CE38C7E3-371B-4E73-A0B5-81C009E4FF8C@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_051910_051958_76AE41A6 
X-CRM114-Status: GOOD (  13.43  )
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

On 5 October 2026 13:06:57 BST, Bradley Morgan <brads@mainlining.org>
wrote:
>This is v5 of the two-byte cmpxchg emulation series, reduced to the
>three architectures still missing after Paul McKenney queued the lib
>and sh patches, ARC, csky and xtensa.
>
>The v4 attempt at these folded in a type checking idiom,
>(unsigned long)(0 ? *ptr : old), meant to make cmpxchg(&p, 4, 5) fail
>to compile. The kernel test robot and Vineet Gupta showed that idiom
>breaks real callers, fs/crypto/hooks.c passes a char * and an
>unsigned char * to cmpxchg_release(), and the conditional expression
>then has incompatible pointer types, which is a hard error on gcc 14
>and newer. So this version only adds the case 2 dispatch, the
>declarations the architectures already have are kept as is.
>
>The ARC sizeof bug that v4 fixed along the way is in mainline
>separately through Vineet's f050c3e61d2a ("ARC: arch_cmpxchg_relaxed
>to use size of pointed type not pointer"), so the ARC patch here is
>only the case 2 wiring on top of that.

Sashiko took a hitch at it, all the "bugs" are bogus, most are just cuz
"u16 is undefined oh no error", but they didn't see Paul's tree, where it
is defined.

whatever

>
>On the why, RCU previously used single-byte cmpxchg(), which is what
>motivated cmpxchg_emu_u8() in the first place, and Paul has now
>queued cmpxchg_emu_u16(). Unused new code is frowned upon, so wiring
>it into the architectures that need it is the missing half, and
>there are existing workarounds for the missing two-byte cmpxchg() in
>the tree, _Q_PENDING_BITS for one, that can make use of it.
>
>Per Paul's suggestion each patch is standalone and can go in
>independently, they only depend on the lib patch already queued.
>Each one was build tested with the real cross toolchain, ARC with
>arc-linux-gnu-gcc and csky and xtensa with the gcc 16.2 crosstool
>builds Vineet pointed at, W=1, with the macro instantiated on
>u8, u16, u32 and pointer types, confirming the new dispatch is
>reached and no new warnings appear. The pointer instantiation
>covers the fs/crypto/hooks.c case that broke v4.
>
>Bradley Morgan (3):
>  ARC: Emulate two-byte cmpxchg
>  csky: Emulate two-byte cmpxchg
>  xtensa: Emulate two-byte cmpxchg
>
> arch/arc/include/asm/cmpxchg.h    | 3 +++
> arch/csky/include/asm/cmpxchg.h   | 9 +++++++++
> arch/xtensa/include/asm/cmpxchg.h | 1 +
> 3 files changed, 13 insertions(+)
>
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
