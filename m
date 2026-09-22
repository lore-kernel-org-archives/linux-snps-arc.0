Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522AEC982FA
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Sep 2026 18:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VsowKgZoYb/HxhkOPQWCqyQsOjWXMC8FIjpDMhd9RbM=; b=LSBzEYisuOq9tM
	wIJvQ3IGnSmfYBlqzR9GxDp7iElydjwv6QlJfVIxqBqb+U5SG2tlY2glRnarxCyzcHRIx+BMaD0dr
	bA9K32R0Zci8vHtk7fNR3sozhg3hdFjbZagtN6I7J91JxPaDII5KpBEvXpNDO5xImb1ST1+gNIAD1
	1qAVEowRytU54clbmflNOAtL1ivggMYv8H1qJY7uzmetbqSIZhVRJ4IH1OmjI6z57z9c7fllG++W4
	A6nv+UgpjSGTk31+PC1Rsk7bZSa4/O02CDFR7uAZiRgJGaT/TXaF7cL89L0QL/XdVmg1b488w1bic
	F4cJYyDqlgOolcKAEB4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95Pd-00000006KJJ-3EP3;
	Tue, 22 Sep 2026 18:40:17 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x95Pb-00000006KIg-2wkw
	for linux-snps-arc@lists.infradead.org;
	Tue, 22 Sep 2026 18:40:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790102273; bh=GhL/OKSrQi7a2VgZmyNvxdS
	rDOhPoV7pImkjsaA2JhI=; b=QskZmMwdBGolMfxnZdaE963fhpAOlEkoqyHwSTJVngPOon5/D9
	h9WarS9jWq1oz3Fr0iFnGGxNi/hlWfs4mlhH3S68fi0Q/7eArzrF+iNNdveZfNB1x0yKd14vuu4
	dtdRZZcYbYmhcRFEms6X+FOjowsIUBiJz2Oa54fKQhR73e55cdYUJqiN++9xYBegvjigKAoL3C0
	tXxxi2mc1Wh6F+fFPnD25Td6ljiwJxXMH8+aYH/Gj6e4hSvreHLfnFv7Cw0eCPLi2BVQyuHH0hr
	WRFRGu/C03xDWq+X4Xae/C8gj+zStWRDAYh5c6zjrrSVpxBi5LXm89+yYQAhbR1ZNWw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790102273; bh=GhL/OKSrQi7a2VgZmyNvxdS
	rDOhPoV7pImkjsaA2JhI=; b=suaoituAEGJ9M5GSztQR2oQx0LBSBx/lwHTkfsLum+7Bb4sZMj
	yWqpW4ku2S5RUnqVWZnRTY07z/Chof4pp1CA==;
Date: Tue, 22 Sep 2026 19:37:54 +0100
From: Bradley Morgan <brads@mainlining.org>
To: paulmck@kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, Vineet Gupta <vgupta@kernel.org>,
 Guo Ren <guoren@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 David Laight <david.laight.linux@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_0/5=5D_Add_two-byte_cmpxchg_em?=
 =?US-ASCII?Q?ulation_and_wire_it_into_the_architectures?=
In-Reply-To: <78f7ab38-46c8-4968-a2ae-4c3c98e32f4d@paulmck-laptop>
References: <20260922173354.14404-1-brads@mainlining.org> <78f7ab38-46c8-4968-a2ae-4c3c98e32f4d@paulmck-laptop>
Message-ID: <7BE5B8EA-FAFB-4CBB-8FF1-ECDEEB1618B0@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_114015_897499_DD195B75 
X-CRM114-Status: GOOD (  19.22  )
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

On 22 September 2026 19:29:32 BST, "Paul E. McKenney" <paulmck@kernel.org>
wrote:
>On Tue, Sep 22, 2026 at 05:33:49PM +0000, Bradley Morgan wrote:
>> This is v4 of the two byte cmpxchg emulation series, wiring
>> cmpxchg_emu_u16() into arc, csky, sh and xtensa.
>> 
>> v3 had changed cmpxchg_emu_u8()'s success return to (u16)old, which was
>> a 16-bit mask in the 8-bit function, and a dead one at that, since the
>> compare guarantees the low 8 bits of old are the byte being returned.
>> David Laight asked where that cast came from. v4 returns old unmasked,
>> the exact behaviour the one-byte emulator always had, so nothing that
>> uses cmpxchg_emu_u8() through the widened prototypes sees a change.
>> 
>> David also noted v3 extended the (unsigned long)(0 ? *ptr : (old)) type
>> check to csky and sh but not arc and xtensa. v4 adds it there too, so a
>> cmpxchg(&p, 4, 5) fails to compile on every architecture in the series,
>> verified with each architecture's macro instantiated standalone.
>> 
>> While adding the type check to arc, the switch subject turned out to be
>> sizeof((_p_)), the pointer, not sizeof(*(_p_)), the pointee. On 32-bit
>> arc the switch was always 4, so the size 1 and size 2 cases were dead
>> code and every sub-word cmpxchg() went through the 32-bit llock/scond
>> pair, comparing whole words against sub-word values, so the compare
>> almost never succeeded. The switch now tests the pointee, and the u8
>> path it was always meant to dispatch actually runs, so the one-byte
>> emulation works on arc for the first time since the sizeof bug landed
>> with the original cmpxchg_emu_u8() wiring.
>> 
>> The host test of 972 cases across both halfword offsets against a byte
>> level reference model still passes, and a 20000 case randomized run
>> checking the masked compare and return against a hardware cmpxchg r16
>> model passes with zero mismatches.
>> 
>> David pointed out on v1 that a u16 prototype does not compile warning
>> free when exchanging a pointer type, because the switch statements in
>> the architecture macros instantiate every size case, so a pointer
>> cmpxchg() type checks the two byte case, and the (u16) casts there
>> warn. v4 keeps taking the old and new values as unsigned long and
>> casting to u16 inside the function, so the call sites need no narrowing
>> casts and pointer exchanges compile clean. The function still compares
>> and returns exactly the 16 bits the caller asked for, which matches
>> hardware cmpxchg r16 behaviour.
>> 
>> The ARMv6 wiring stays dropped from v1, per Arnd Bergmann's offer to
>> take the INTEGRATOR_CM1136JFS cleanup in his platform removal series.
>
>I have pulled these in, but only to expose them to things like the kernel
>test robot.  My guess is that they will go in by some other path.
>
>And to that end:
>
>Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
>
>But I could of course easily be missing subtle arch-specific bugs.

There are, according to sashiko, but I can't seem to make that thing happy
no matter what I do

>
>							Thanx, Paul
>
>> Bradley Morgan (5):
>>   lib: Add two-byte cmpxchg emulation function
>>   ARC: Emulate two-byte cmpxchg
>>   sh: Emulate two-byte cmpxchg
>>   csky: Emulate two-byte cmpxchg
>>   xtensa: Emulate two-byte cmpxchg

--- Thanks!
"I'm not a very positive person" - Linus torvalds

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
