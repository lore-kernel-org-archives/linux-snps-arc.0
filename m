Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBE6C88E72
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Sep 2026 16:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=523AO+JD7RSOYQSo8n61+thJCK9niUXC6TRwnDFJEyo=; b=LFKSzkEQc93KRM
	pNJwPLLT3Rvr94Oh7GejEwoiiMi5LCQM0OB9n4U8Yus6takH9YjlqaBiMbMBi7YGifNR7xgABWPsW
	EjxIOohIJKzqmKm5Ld4wZiqwkt3N4MgACxkmIyvpqdhefzyJ2IaKsFIeAfJqblsf3583TkVu866y6
	2/LY7nRdFLYBBMP1fbgrZelSVkbyJLEisxsEOuaYyZt22F3t2qKZ5OQ0fUi7fWaiLKcGo7q4NjeTe
	oJ5H1xBCitq3R7v22IlDZZun2dqyz9d3WdMjEOTc385Rq01wvee1H4p8N98RjTzT4qNugMTki73ae
	MtuEtdteTI8D0zOyXnwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FAO-0000000BxRU-3Ha7;
	Thu, 17 Sep 2026 16:40:56 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7FAI-0000000BxLj-2af0
	for linux-snps-arc@lists.infradead.org;
	Thu, 17 Sep 2026 16:40:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1789663110; bh=aoBMHO5+/N93x6VJ0ikS7kV
	mlAkKZm9tlGAN4/+qBSY=; b=rJO3Ncd/TnwsSG6RKws52boGwVzJTIPvSJEp4C7cL4OTLvpZqN
	IeFlOtZKzBFgxVuy03X79ASjrTRcxSsaBaD9ZdJTxYTO0Sierje8pTwulB9tiUTFE2kuMV4XHQk
	XE82T6ODkRn5X2pqSoOl3W5l5cOQQn5TOT48lwwWroD3Vt/yLF2+Wf7O+/ohZ8pz6AXLBx9CoF2
	FnR/Eylo5MjcHXjnT3NVHCcFMC7Z6gpgTF+4Lgu/K3KhQynA7F1Ttxb7PQmRf0TucjKBUzr7wvb
	H9lCObzaTfulg5yPgAF4gXSyoJ4OLQDlj4KxJmDr/tWhzqb+K/p4xnksRCWK8fPJ4Pw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1789663110; bh=aoBMHO5+/N93x6VJ0ikS7kV
	mlAkKZm9tlGAN4/+qBSY=; b=1W+mBsO/mmKw5OVcobpC6PP5Ha7M073LKARMu5sMFMTpULj9s4
	M4vkGskgCo9QyIECUmxAYNPQ1IJNLExTN4BQ==;
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
Subject: [PATCH v3 2/5] ARC: Emulate two-byte cmpxchg
Date: Thu, 17 Sep 2026 16:38:27 +0000
Message-ID: <20260917163830.3748-3-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917163830.3748-1-brads@mainlining.org>
References: <20260917163830.3748-1-brads@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_094050_825752_A59E3D7E 
X-CRM114-Status: UNSURE (   9.28  )
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

ARC has no two-byte atomic compare and swap, so the __cmpxchg() macro
switch lets case 2 fall through to BUILD_BUG() via default. Route case
2 through the new cmpxchg_emu_u16(), which takes the old and new
values as unsigned long and narrows them itself, so the (uintptr_t)
casts on _o_ and _n_ are no longer needed and the case 2 call passes
them straight.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 arch/arc/include/asm/cmpxchg.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index 76f43db0890f..9b48b8fe0db2 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -50,6 +50,9 @@
 	case 1:								\
 		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
 		break;							\
+	case 2:								\
+		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
+		break;							\
 	case 4:								\
 		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
 		break;							\
-- 
2.47.3

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
