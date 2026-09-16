Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007FFC982C1
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Sep 2026 20:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=89wqpAzAsvfUynjeKvhU/6axLwNRaErtKwsQmJAm0no=; b=MJ5I4A2enErFNp
	B2F8g2dAO+FSjbegexAbHvr2M3xNt9+H5weNis+NIHZ+SqiSbomx54SbbFA06DQt+7RXX1Xc/OoqG
	kR6zok600m54sVixJl1yd99uCXPEWCrxBsFOvWVl7tASHb3VWA9ee15xr8jY4eZEEu2FWzCc98wIU
	gzD2zCLYP1INSzN2p3IaNoDM8eAlm/7ZNPVUPDfMhmI5itYRmJM0Srog5gcCOD+N8JMUAfi41FrI+
	oKmiVdSoyvyvDiCdo1jkmwCeteh5ZffSiHjDlDaVugo9p8yMmYsfTx+vydyiOLZxxi4vrsgJjB39Y
	5VvHMVfP6kBcIDLm99RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vpu-0000000A4Am-0oG0;
	Wed, 16 Sep 2026 20:02:30 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vpr-0000000A4A4-2yuH
	for linux-snps-arc@lists.infradead.org;
	Wed, 16 Sep 2026 20:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1789588936; bh=RgSuWwdEtSR5tNlSbUFwtN1
	6+B/ED9O57B5SFsv+Sao=; b=l73A9EjSO6yR6WdliduzVn1CIfORqheLdIQdtdeLPAZWyxa11E
	0EpQWuNSbKcVrw6PeoDKKdoWN+1GVE9Y3rUy61FOsYrMa6HlNwD5eFBP/TP3STbRo5rOM15u0fY
	eidU56394BfiA2yBlM5yUYZEVUwCri+GzP55lMhuMNqYZF23VD1XlvH+ZNUXSp/NAme1jN8dn/d
	WQ2vxtBU2pLRQkqx12FsrNhBILKg59O6X61+8Xr1psbu/fpKurkzCb+rJn0m03Gkgwvq+cPHdpZ
	sYpRIl7fzRzn6hw/P8r+DoiAg72kDqixBXDxYCFvYlf6IvbNFBDlunD7/F4ulbwfOWA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1789588936; bh=RgSuWwdEtSR5tNlSbUFwtN1
	6+B/ED9O57B5SFsv+Sao=; b=c/LfVz7tNPTCmaPlbh3i+J7cFoigXYI7S5Rs8blqt5qqX61PKQ
	yrpQBKSCbiZBXokixP1nlTHs/FbUvzFV2UDQ==;
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
Subject: [PATCH v2 4/5] sh: Emulate two-byte cmpxchg
Date: Wed, 16 Sep 2026 20:02:14 +0000
Message-ID: <20260916200215.21774-5-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916200215.21774-1-brads@mainlining.org>
References: <20260916200215.21774-1-brads@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_130227_911374_C555DFFF 
X-CRM114-Status: GOOD (  10.35  )
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

SH has no byte or halfword atomic memory operations, so the __cmpxchg()
switch routes case 1 through cmpxchg_emu_u8() and lets case 2 fall
through to __cmpxchg_called_with_bad_pointer(), which is declared but
never defined, so a two-byte cmpxchg() fails at link time. Route case
2 through the new cmpxchg_emu_u16(), which takes natural u16
arguments, so the unsigned long old and new narrow at the function
boundary.

Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 arch/sh/include/asm/cmpxchg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/sh/include/asm/cmpxchg.h b/arch/sh/include/asm/cmpxchg.h
index 1e5dc5ccf7bf..477d3025a441 100644
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
2.47.3

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
