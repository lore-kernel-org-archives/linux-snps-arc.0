Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2A0C982FA
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Sep 2026 17:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RljkZfUE6Jo/e6TbknbX7QMkE8xrWwm0LdBDqFSabPE=; b=CAb5/l5H0dvBGK
	mzQaZdJ0TyqjWE/wpi6z1WehuihuhaOtqTVdpbjPz2+f2s/iDQKeyaPlTIwhML/Lr5s+2FtRRFGCm
	FpL6ynZzNHFPilKwRFf5gbGZ3KrDe5eE1SB3ffzI9Ugpv4GUPAYrbd70u8t7McvKkAeII5CbXXHYB
	2uBHmoUvKpNuc1H6n0XHu08bpG0WT4pA723RJtKGxMGqcNRb/79H1SCt5pIWHaiREuQ9aOMo6iaDu
	pYubzqwBJxhEufLtMiXp9/Ycc8v6KFGFRKUq02HKNR3mNgmJQjVNR+oxUr/lnfqWteh+uw5um0G35
	Q53g3gByOzfPyd8aqe9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94NV-00000006Dch-40xR;
	Tue, 22 Sep 2026 17:34:01 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94NT-00000006DZP-0yEM
	for linux-snps-arc@lists.infradead.org;
	Tue, 22 Sep 2026 17:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790098433; bh=p7eL7CEIsluHKDjAYrzTOKe
	1um/hH8UVgVqh8wu1Mrs=; b=reY1I7bKx8E1NX5G7MHIHjJw5IDTmfzKhS1aJ3QFxkzjO7p/15
	EVi/yiR56Xb+TJtQq/3JAHmuoES6j7Dr9psJoCQ5Fhv7FtDy5a/O9CRDbsIRKsJbgBgZxw71QWm
	M1lk8neNwuQ6vk58PS4BCxHsshhR8ZwwJehGqtclvIhgczTIijjEz7zHA7nlDc54JMQ17bNphXo
	io91Yf3QB8Ovj/umVLgrn4CFA37++tuZg4EHeNScSMYJotqbaJceekbpJ8DSoFQijqgH7kY9uhn
	oSIknC3KdA3mcLjNlqAHWHH18yEIgyuI4u8GAhKNik6LGZThBfiDhaL88xYcw3fwEEQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1790098433; bh=p7eL7CEIsluHKDjAYrzTOKe
	1um/hH8UVgVqh8wu1Mrs=; b=0LZJeU2UH4F42xHxTDjd5Jdv6lSrF838OnZFhE5Bj/h6DwFdjm
	qnsVv4Evk9XOS0XFcLbg4zjI3n1ITBysM3CA==;
From: Bradley Morgan <brads@mainlining.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-snps-arc@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bradley Morgan <brads@mainlining.org>
Subject: [PATCH v4 0/5] Add two-byte cmpxchg emulation and wire it into the architectures
Date: Tue, 22 Sep 2026 17:33:49 +0000
Message-ID: <20260922173354.14404-1-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_103359_446007_1CAB1C0A 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

This is v4 of the two byte cmpxchg emulation series, wiring
cmpxchg_emu_u16() into arc, csky, sh and xtensa.

v3 had changed cmpxchg_emu_u8()'s success return to (u16)old, which was
a 16-bit mask in the 8-bit function, and a dead one at that, since the
compare guarantees the low 8 bits of old are the byte being returned.
David Laight asked where that cast came from. v4 returns old unmasked,
the exact behaviour the one-byte emulator always had, so nothing that
uses cmpxchg_emu_u8() through the widened prototypes sees a change.

David also noted v3 extended the (unsigned long)(0 ? *ptr : (old)) type
check to csky and sh but not arc and xtensa. v4 adds it there too, so a
cmpxchg(&p, 4, 5) fails to compile on every architecture in the series,
verified with each architecture's macro instantiated standalone.

While adding the type check to arc, the switch subject turned out to be
sizeof((_p_)), the pointer, not sizeof(*(_p_)), the pointee. On 32-bit
arc the switch was always 4, so the size 1 and size 2 cases were dead
code and every sub-word cmpxchg() went through the 32-bit llock/scond
pair, comparing whole words against sub-word values, so the compare
almost never succeeded. The switch now tests the pointee, and the u8
path it was always meant to dispatch actually runs, so the one-byte
emulation works on arc for the first time since the sizeof bug landed
with the original cmpxchg_emu_u8() wiring.

The host test of 972 cases across both halfword offsets against a byte
level reference model still passes, and a 20000 case randomized run
checking the masked compare and return against a hardware cmpxchg r16
model passes with zero mismatches.

David pointed out on v1 that a u16 prototype does not compile warning
free when exchanging a pointer type, because the switch statements in
the architecture macros instantiate every size case, so a pointer
cmpxchg() type checks the two byte case, and the (u16) casts there
warn. v4 keeps taking the old and new values as unsigned long and
casting to u16 inside the function, so the call sites need no narrowing
casts and pointer exchanges compile clean. The function still compares
and returns exactly the 16 bits the caller asked for, which matches
hardware cmpxchg r16 behaviour.

The ARMv6 wiring stays dropped from v1, per Arnd Bergmann's offer to
take the INTEGRATOR_CM1136JFS cleanup in his platform removal series.

Bradley Morgan (5):
  lib: Add two-byte cmpxchg emulation function
  ARC: Emulate two-byte cmpxchg
  sh: Emulate two-byte cmpxchg
  csky: Emulate two-byte cmpxchg
  xtensa: Emulate two-byte cmpxchg

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
