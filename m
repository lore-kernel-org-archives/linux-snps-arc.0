Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85392C982C9
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Sep 2026 20:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TJ4ACA/Z2hUVa+iE2WCTM26mcldYsUujG8YU84+GXwc=; b=ckehDi7g4ie7nY
	izhF0EyRGZCH72vUvnAyXSVEHXpO2J0wI4HIH3/yx3S26GMYIn1KfQdYg3P+3W/MOIeEMCVRx9Wme
	EQcFxe+I+qFMioCnLugiEVQ72kM9TNY9sxviB1nq9i0eM6DDDTrHJJOqwGyqth/UJqbqlYbeP8AFj
	tq16yRYdstPXxUsLsm+vM466ec/E5utUthBOPtUjdxRq0ukPw9/QMEwWeKXkakFCtPYsOwTVvwWzT
	kVHe4mbzajECFBi41Sb6CkW4jNj5A2oqiYq8cWB4M2KQyVrwVW+kxjTtYBwGDr4sBRN2gyvIF6HDj
	xXMtrj+62r+fPmO8zebQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vpv-0000000A4B1-12RS;
	Wed, 16 Sep 2026 20:02:31 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vps-0000000A4A5-1A3C
	for linux-snps-arc@lists.infradead.org;
	Wed, 16 Sep 2026 20:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1789588934; bh=R2ofPh15IK7hgrgGQONfmRW
	iJZeWXsO+PWe6T21uQx0=; b=UJOLaJ1eyafCKV7a9AtG/fexlsbAVjlyPySLlnSeJySUvFOZaP
	4ivAjaB+xDcuO0CdoybKoj+vJONuC3Tb+wIIawMuN2W4yTVV7XL/vQS+aGNg8qxBTvx9aQEB8RI
	D88wovBOYCyHHqNMDoMZSoRzCubZKLXUbZFsCXFa7mnhJVr9I03m3tjBj7ra8QUv19EBSRf3YXx
	8f22tl/BbOpqpsKu84+DEF8VuaNyoXthTbr0J72gnJGsPOOqDTkdZA8vrQMkx1nsV5oE9mKjtYf
	FcXtpW0eu26p18O/zFsBnUSPRljeLLZR0HEVQksZHbCd3mhyvRxCPDT1idi8cwTXLzg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1789588934; bh=R2ofPh15IK7hgrgGQONfmRW
	iJZeWXsO+PWe6T21uQx0=; b=RfW+hV8x62kBsD6o0b/ZReKRmxQZWh484SkNrMwIY/kuHPPt2G
	urIZ9Plfi1IN8HPS2awi6YU6YCnDO+a5QZAA==;
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
Subject: [PATCH v2 0/5] Add two-byte cmpxchg emulation and wire it into the architectures
Date: Wed, 16 Sep 2026 20:02:10 +0000
Message-ID: <20260916200215.21774-1-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_130228_461687_646F22BC 
X-CRM114-Status: GOOD (  13.27  )
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

This adds cmpxchg_emu_u16() next to cmpxchg_emu_u8() and wires it into
the architectures that use the one byte emulation, arc, csky, sh and
xtensa.

David Laight noted that uintptr_t was an odd choice for the API and
suggested u16 as the natural type, so v2 takes u16 arguments and the
cast work moves to the architectures. The arc and csky call sites
cast to u16 instead of uintptr_t, and sh and xtensa pass the values
through unchanged, letting the narrowing happen at the function
boundary.

The experiment answers David's question about what the 32 bit word
compare does with an API typed u16. It compares only the 16 bits that
make up the halfword being emulated, because the union splice packs
the caller's old value into the selected halfword of the compare word
before the word wide cmpxchg runs, and the union layout puts every
h[i] at byte offset 2*i on both endian layouts. A value wider than 16
bits can never reach the compare, so the return value is the old
halfword contents, exactly what cmpxchg() returns on architectures
with a native two byte variant.

The ARMv6 wiring is dropped. Arnd Bergmann's platform removal series
makes the ARMv6 path unreachable once it lands, and he offered to take
the INTEGRATOR_CM1136JFS cleanup as part of it, so the wiring here
would be churn against his tree. I will forward port this part once
the mach-versatile removal actually happens, if the path still exists
then.

Patch 1 adds the function, the prototype, and renames the Kconfig
symbol to ARCH_NEED_CMPXCHG_1_2_EMU since it now gates both
emulations. Patches 2 through 5 add case 2 beside each existing case
1, following each file's current style. The function body follows the
two byte implementation in Paul's April 2024 RFC series, of which only
the one byte part landed as commit a88d970c8bb5 ("lib: Add one-byte
emulation function").

Verification. A host test ran 972 cases across both halfword offsets,
matching and mismatching compares, against a byte level reference
model, all passing. The remaining checkpatch warnings are the volatile
and long line ones that the merged cmpxchg_emu_u8() lines already
carry.

Changes since v1:
- u16 arguments instead of uintptr_t, per David Laight
- ARMv6 wiring dropped, per Arnd Bergmann's offer and the discussion
  with Paul McKenney
- copyright lines now carry both authors, Paul's 2024 line and mine

Thank you, Paul McKenney, for suggesting this, and thank you David
Laight and Arnd Bergmann for the review.

Bradley Morgan (5):
  lib: Add two-byte cmpxchg emulation function
  ARC: Emulate two-byte cmpxchg
  csky: Emulate two-byte cmpxchg
  sh: Emulate two-byte cmpxchg
  xtensa: Emulate two-byte cmpxchg

 arch/Kconfig                      |  2 +-
 arch/arc/Kconfig                  |  2 +-
 arch/arc/include/asm/cmpxchg.h    |  3 +++
 arch/csky/Kconfig                 |  2 +-
 arch/csky/include/asm/cmpxchg.h   |  9 +++++++++
 arch/sh/Kconfig                   |  2 +-
 arch/sh/include/asm/cmpxchg.h     |  2 ++
 arch/xtensa/Kconfig               |  2 +-
 arch/xtensa/include/asm/cmpxchg.h |  1 +
 include/linux/cmpxchg-emu.h       |  4 +++-
 lib/Makefile                      |  2 +-
 lib/cmpxchg-emu.c                 | 38 ++++++++++++++++++++++------------
 12 files changed, 58 insertions(+), 11 deletions(-)
-- 
2.47.3

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
