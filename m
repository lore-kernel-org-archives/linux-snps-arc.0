Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13999C88E72
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Sep 2026 16:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZzBV4fv8q/R7VJ1KY4qigJ1PXUVrZOH4Ihs+Ea6K1Bo=; b=ohkMzDPxyNhzxg
	mFjmRGxIW7u4mKi/G0hd5EiLd4seHaLd9oNNizg9m+u1WCjd6fHpzpCwaYb1/sbv86BMos044dfIh
	3j3naWnPLDDOpBoQxETOv60wgMrhCrXnPZ3xTBL0TNwlef1adqKIKBJbDrPleoswr3bhMp64FMF/F
	EVpbAojj7bWV1lGYOJSny/LWp8/ZlPHWk2szV9cZn+C874vR6bozrSetxWVBbQCYb7iRRMpODECUa
	Xd/sJaxcqS4Sl3BwNR3iqGOj9ENo/P2+PMMsI7ggyqgwY9fD+tfv6y8nJkOFyr179+3r6krK367oM
	8dDgYXJIeeGEklZ2aPgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7F8F-0000000Bwsi-36Yh;
	Thu, 17 Sep 2026 16:38:43 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7F8B-0000000Bwno-3psD
	for linux-snps-arc@lists.infradead.org;
	Thu, 17 Sep 2026 16:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1789663110; bh=UzuuztJ96GodZiYpCdr9PXx
	KbUbb9g6GDMlOpp8jCz0=; b=Uey6ojlBricx6j3eF+zvmZVsAm3pr7poFIvNCspe5oYMpEOujq
	8k9LgLJQ9U+Lj+i519fVPnOGYoy1NAEv4cCcmxBAuwCeEOe+TMECGOodA4gRNB7zYxN9tPstrKn
	r756ENzcqc4qcBPAdjnGfFotcpPyxeemJKBB21Q54VDhotiIWots39X7XD+lduqUQ/dCPkNZO16
	C5vpqWiERKYPZqdSFsHBx49rjm6qMxDUsnBnD9xw+n6d/NTENC/qTVN7Yrulxhl5L9MmCTzKBFD
	7eaqZZiY0dXEnN1sk4iBpnOokSX1bLUBb9R6S+auGhuMe4cl/cX9BfU9jMHwMvqjwzQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1789663110; bh=UzuuztJ96GodZiYpCdr9PXx
	KbUbb9g6GDMlOpp8jCz0=; b=GJFMSOJ/EFRHywZQSyCl/9IdHYQgafn6hclK0Aj0bToaciOukv
	QY8DN1ApE4yNlmhRfc4Vsd89PmOMG64jVeDA==;
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
Subject: [PATCH v3 0/5] Add two-byte cmpxchg emulation and wire it into the architectures
Date: Thu, 17 Sep 2026 16:38:25 +0000
Message-ID: <20260917163830.3748-1-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_093840_116221_FDCA8BBB 
X-CRM114-Status: UNSURE (   8.45  )
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

This is v3 of the two byte cmpxchg emulation series, wiring
cmpxchg_emu_u16() into arc, csky, sh and xtensa.

v2 tried u16 as the parameter type. David Laight pointed out that
this does not compile warning free when exchanging a pointer type,
because the switch statements in the architecture macros instantiate
every size case, so a pointer cmpxchg() type checks the two byte
case, and the (u16) casts there warn. v3 takes the old and new
values as unsigned long and casts to u16 inside the function, so the
call sites need no narrowing casts and pointer exchanges compile
clean. The function still compares and returns exactly the 16 bits
of the emulated halfword, which matches hardware cmpxchg r16
behaviour, and a host test of 972 cases across both halfword offsets
against a byte level reference model still passes.

David also noted the missing pointer to integer type check in some
of the macros, so cmpxchg(&p, 4, 5) compiled silently. The csky
macros typed __old and __new through __typeof__(old), which skips
the check, and sh had none either. Both now type check through
(unsigned long)(0 ? *(ptr) : (old)), the idiom David suggested,
which keeps the pointer to integer conversion explicit while making
the compiler reject mismatched types. Both of his test cases now
fail to compile on every macro shape.

The ARMv6 wiring stays dropped from v1, per Arnd Bergmann's offer to
take the INTEGRATOR_CM1136JFS cleanup in his platform removal series.

Thank you, Paul McKenney for suggesting this, and David Laight and
Arnd Bergmann for the review that shaped all three revisions.

Bradley Morgan (5):
  lib: Add two-byte cmpxchg emulation function
  ARC: Emulate two-byte cmpxchg
  csky: Emulate two-byte cmpxchg
  sh: Emulate two-byte cmpxchg
  xtensa: Emulate two-byte cmpxchg
-- 
2.47.3

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
