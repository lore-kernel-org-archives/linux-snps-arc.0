Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA429CA6004
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Oct 2026 20:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aISA2kqVPBV487o53o0wiIhIk2FrBMBOOP3/HN0FVHw=; b=Y0ItGQrOzpnlHI
	Bl4Z3ZmbUI8wM5eD7bILQW42+KPj1qs3bXZzhWsM6pOQsfvwaMWcbSMyElJ1xiTd28ae8ASqGTw8F
	z5itSF1CwP/io96p45dX7Wr57sVVE8yuuUKnPDeTsA5VnNdompFx74eKDb1KUu/lAFWpY7GhK8low
	ONi//FSFLQtjEZDNt9ih87JFWw56G6gDQnm2o5jYABRfuBS/wzYKiiJCjw9eEdj+OirEm0NslsnT6
	pKabL24WdIlM6NbRsvuS7tcX4qLpXhIRqO4ts7ClstRon3+0EZQ8nOVuzaktaYFrAuU86Z9/QAEFJ
	oeAXi43QbqEjfXOS8a8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYNT-000000038pt-1YXn;
	Wed, 07 Oct 2026 20:36:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEYNS-000000038pA-0Pyh
	for linux-snps-arc@lists.infradead.org;
	Wed, 07 Oct 2026 20:36:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D295744507;
	Wed,  7 Oct 2026 20:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD7381F00898;
	Wed,  7 Oct 2026 20:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791405397;
	bh=xXt5RIMHvtuAR90/1uXgSDsdIAHt0BZCrd9ZetmMa/g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V1qF0+FbTw17dSzdjqXpqk+IpuwXWL3zFPvymNvK7tn13AnJphrM/hMFUTsQmFFvx
	 M+UQkKTdwxkQkRzSvSKtSzDTMpE4bI4j7FsHB7hFgIINThK9+AZg9oqpPhAftqpq8P
	 w+52S2oJEqDyoW3DFVJTssIWlZ8ryikoKUk5gTCEIMC9qA0daEKoIHDe1HjTludxQv
	 bT9Ic/piTrQz0xpMzQV+hJuzLwwvlrP/lf2VFJxjzThWb/vGNfFmOQKRUzxlyGT0rB
	 8YH53qZ1SljhZNlutOpFQ1IXU9OGpNLt0laeyYVRCDTll8DEhqkWnV3PFdos3EPtWk
	 eA9mg6WCw6JSw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 635D7CE1716; Wed,  7 Oct 2026 13:36:37 -0700 (PDT)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Bradley Morgan <brads@mainlining.org>,
	Vineet Gupta <vgupta@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	linux-snps-arc@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-sh@vger.kernel.org,
	kernel-team@meta.com,
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: [PATCH 2/5] sh: Emulate two-byte cmpxchg
Date: Wed,  7 Oct 2026 13:36:33 -0700
Message-Id: <20261007203636.1982188-2-paulmck@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <7f398d4a-7fae-4382-9cc4-8627e8aa912b@paulmck-laptop>
References: <7f398d4a-7fae-4382-9cc4-8627e8aa912b@paulmck-laptop>
MIME-Version: 1.0
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

From: Bradley Morgan <brads@mainlining.org>

SH has no byte or halfword atomic memory operations, so the __cmpxchg()
switch routes case 1 through cmpxchg_emu_u8() and lets case 2 fall
through to __cmpxchg_called_with_bad_pointer(), which is declared but
never defined, so a two-byte cmpxchg() fails at link time. Route case
2 through the new cmpxchg_emu_u16(), which takes the old and new
values as unsigned long, so the (unsigned long) casts move off the
call and into _old_ and _new_ declarations that type check the old
and new arguments against *ptr through (unsigned long)(0 ? *ptr : _o_),
the idiom David Laight suggested, so cmpxchg(&p, 4, 5) no longer
compiles silently.

[ paulmck: Apply kernel test robot feedback. ]

Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Bradley Morgan <brads@mainlining.org>
Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: <linux-sh@vger.kernel.org>
---
 arch/sh/include/asm/cmpxchg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/sh/include/asm/cmpxchg.h b/arch/sh/include/asm/cmpxchg.h
index 1e5dc5ccf7bf5..477d3025a441c 100644
--- a/arch/sh/include/asm/cmpxchg.h
+++ b/arch/sh/include/asm/cmpxchg.h
@@ -59,6 +59,8 @@ static inline unsigned long __cmpxchg(volatile void * ptr, unsigned long old,
 	switch (size) {
 	case 1:
 		return cmpxchg_emu_u8(ptr, old, new);
+	case 2:
+		return cmpxchg_emu_u16(ptr, old, new);
 	case 4:
 		return __cmpxchg_u32(ptr, old, new);
 	}
-- 
2.40.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
