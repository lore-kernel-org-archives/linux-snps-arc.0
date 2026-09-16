Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E91BC982C9
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Sep 2026 20:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WC8/pTcNazr1K9NDcSgjZkrCAtMPpi9EWs/x4RXqbf8=; b=gfUDW14B3SuTGJ
	0IXLFcXoW+2MMypwIXr4ygHDd5oyretHn9vK1oGtWRN/odOAcimYTTtLEXChZQUiZzpz2knkQUHqf
	2D7tcnNqAF1GzX3DFGsY/zb3RzXdTP6sZc595dHrwZVhwqLWZAdS8G6q49I7dFegG7uc0xH5ov+NW
	GwwfgVZjMD105rgZshnS+Qhv65fNoXckV5oh2DEKjPXim5l6vGUHxmOOu1peuHY44jcd6V0y46BCc
	dlrtyeJemk0PXpM4tRN+6Lm5gUedbd2geI7S4ra9S4dHZurWton4G/3kNyvaDJKaG4l153EJ9p0Xi
	jrsUriDSgvujkmNvHU3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vs3-0000000A4Jp-2NAD;
	Wed, 16 Sep 2026 20:04:43 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6vs2-0000000A4JX-0xvr
	for linux-snps-arc@lists.infradead.org;
	Wed, 16 Sep 2026 20:04:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1789588935; bh=1OXxOnbJI64tKjJBlcCcfNg
	/vmHmtRmMcXj4ssSqyI8=; b=dHD1HWO+3ETnfnxub467tSSinQ6AbN2y51X23r7Bht5gWglVMM
	Nlok2iptk4U04M82fZ8leUzk+ihL0NaLL0vHYPP724yQVZpGa0nhB+gU/iFlpfsKkxixDusu7lr
	jNrcKoYFAtqETzQbBh+8faNx0fAIDAJzXgmjmFL/7O9pwJcm2qkOczsS+Y1C2rAGPhsY749WDAS
	7QD6arsF02kSpsoXWAicZSTfVh/szo1ff2QIaozy+ivpS0WkK+HyoA64/bjnUA+WbHr4pf5zlmV
	ZEWf44Kg6LsJGRcm1aQhpiX9vRdMJUTsYyIhtKwB1iy5zZnB74NPLci+wPUR09zctmA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1789588935; bh=1OXxOnbJI64tKjJBlcCcfNg
	/vmHmtRmMcXj4ssSqyI8=; b=uI3PUxmRuoMkYc14i+UHDku63fW62n8nkas/svUZhCU0d/DWk0
	TsjJew1QWX6XuXf9vkWZTCLMrkejqMK85fDg==;
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
Subject: [PATCH v2 2/5] ARC: Emulate two-byte cmpxchg
Date: Wed, 16 Sep 2026 20:02:12 +0000
Message-ID: <20260916200215.21774-3-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916200215.21774-1-brads@mainlining.org>
References: <20260916200215.21774-1-brads@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_130442_266787_4A6778D4 
X-CRM114-Status: UNSURE (   8.62  )
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
2 through the new cmpxchg_emu_u16(), which now takes natural u16
arguments, so the (uintptr_t) casts on _o_ and _n_ become (u16) casts.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 arch/arc/include/asm/cmpxchg.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index 76f43db0890f..4451c2011ee3 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -50,6 +50,9 @@
 	case 1:								\
 		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
 		break;							\
+	case 2:								\
+		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *__force)_p_, (u16)_o_, (u16)_n_);	\
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
