Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7216CA5FCE
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Oct 2026 12:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rUiHfH8r2iXKxW4Oo0vKm2HgUicLL7tAoQzQy4u5Hvw=; b=DeS2RoMlojhs7K
	goRVlKP0Zvw7a92XQClgF5SL8AbtLsxVh5WRG8a0ar41NMW0OqFGN9zDns6FH0IN37MrHxa02H8Lp
	bSTuSyVtj/iEkeOyJJuh+iAhqQ9FG2oYGYU+ZpNwI5Beca9aM2Svuw5lmwDcXhSWl62rYarmRGnOA
	Utg4ijuJjr4dDM9/uPR82NHTIhFdsgQQQE1NFOUu/1I0c5U1fFHI9BB44+BOQgkBFrbThiwAiJpHT
	ebeWi495T9kN2GuD6N2Ne5oM7yRBcQXKTOYeBFTcBhFGRElZd4+JOtaX8yixJpgmyamJE5cUUzUj8
	uPYVfBRtnadTkZlKqdeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDhUa-0000000GNXV-1adH;
	Mon, 05 Oct 2026 12:08:28 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDhUX-0000000GNWx-3WSx
	for linux-snps-arc@lists.infradead.org;
	Mon, 05 Oct 2026 12:08:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791201958; bh=WB1+6laz/zdftbWnRBwqUx9
	lfSRFeEn9fmHSdN3sNQY=; b=NSQSOFdmgIQYISoNJ6JTI7VfZmiTCyZiZY2p/KhjpsjJ3znTvB
	tZ3JUfRwcvf9pI7m4v/BEK42NsvEKwF917sRsXW6MW1hCbtr9id3jnamCbe1ixws982zHawhBm7
	d0rXU+T5BQOQIEDfceQcX5yViFJch7XIT2xWq1VJ955RFZJGm8ron7cWjWJJ1f/Gb/vMF7ljIi6
	0/y42eO55jvbvOuEvA2hokGsi67BvnLsNRfKbv8tepK+xLVGRU93ON9a6j4flFUr2MWR9GqLDBb
	7kjU2zH0aHhC6VDRwhIanIBuuvxeAytTrSJUQbqF+BeNmlY85BjposM7TSnB/EDAgdQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791201958; bh=WB1+6laz/zdftbWnRBwqUx9
	lfSRFeEn9fmHSdN3sNQY=; b=yVF2XUVBjbV1NnIZ6aFdyuM9m6WI856DI3+QmSyEZQ2dckN7D5
	Evmbjxdpj0TEcQ/hVsrIF02k3DEBfUk2aaAA==;
From: Bradley Morgan <brads@mainlining.org>
To: akpm@linux-foundation.org,
	vgupta@kernel.org,
	guoren@kernel.org,
	chris@zankel.net,
	jcmvbkbc@gmail.com
Cc: arnd@arndb.de,
	paulmck@kernel.org,
	david.laight.linux@gmail.com,
	glaubitz@physik.fu-berlin.de,
	ysato@users.sourceforge.jp,
	dalias@libc.org,
	linux-snps-arc@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	brads@mainlining.org
Subject: [PATCH v5 0/3] Add two-byte cmpxchg emulation and wire it into the architectures
Date: Mon,  5 Oct 2026 12:05:53 +0000
Message-ID: <20261005120556.383004-1-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_050826_283524_86DDACD4 
X-CRM114-Status: GOOD (  12.12  )
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

This is v5 of the two-byte cmpxchg emulation series, reduced to the
three architectures still missing after Paul McKenney queued the lib
and sh patches, ARC, csky and xtensa.

The v4 attempt at these folded in a type checking idiom,
(unsigned long)(0 ? *ptr : old), meant to make cmpxchg(&p, 4, 5) fail
to compile. The kernel test robot and Vineet Gupta showed that idiom
breaks real callers, fs/crypto/hooks.c passes a char * and an
unsigned char * to cmpxchg_release(), and the conditional expression
then has incompatible pointer types, which is a hard error on gcc 14
and newer. So this version only adds the case 2 dispatch, the
declarations the architectures already have are kept as is.

The ARC sizeof bug that v4 fixed along the way is in mainline
separately through Vineet's f050c3e61d2a ("ARC: arch_cmpxchg_relaxed
to use size of pointed type not pointer"), so the ARC patch here is
only the case 2 wiring on top of that.

On the why, RCU previously used single-byte cmpxchg(), which is what
motivated cmpxchg_emu_u8() in the first place, and Paul has now
queued cmpxchg_emu_u16(). Unused new code is frowned upon, so wiring
it into the architectures that need it is the missing half, and
there are existing workarounds for the missing two-byte cmpxchg() in
the tree, _Q_PENDING_BITS for one, that can make use of it.

Per Paul's suggestion each patch is standalone and can go in
independently, they only depend on the lib patch already queued.
Each one was build tested with the real cross toolchain, ARC with
arc-linux-gnu-gcc and csky and xtensa with the gcc 16.2 crosstool
builds Vineet pointed at, W=1, with the macro instantiated on
u8, u16, u32 and pointer types, confirming the new dispatch is
reached and no new warnings appear. The pointer instantiation
covers the fs/crypto/hooks.c case that broke v4.

Bradley Morgan (3):
  ARC: Emulate two-byte cmpxchg
  csky: Emulate two-byte cmpxchg
  xtensa: Emulate two-byte cmpxchg

 arch/arc/include/asm/cmpxchg.h    | 3 +++
 arch/csky/include/asm/cmpxchg.h   | 9 +++++++++
 arch/xtensa/include/asm/cmpxchg.h | 1 +
 3 files changed, 13 insertions(+)

-- 
2.53.0

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
