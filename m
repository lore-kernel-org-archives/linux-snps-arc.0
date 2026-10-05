Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A841CA5FCE
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Oct 2026 12:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+DgX4+nC/8JuZNki6tal56fXdahgghL0mzcrThNf/aM=; b=lQ8AdyRVcZntRK
	UPYo76WBiar35gf8rnPiH1XtIiGfE/HinPIojmoleu0U5fYxE+4bsrd0a55vnuI93YDkN5GO0gFrE
	MoB8S61tC0hgcLOHiCLnHSpsBrQBwKitdPoullmCP8s0auqkB0zlFWnkMKiLZW5Be8HCgU8AQjQCa
	jjaO3/pBLK4oPezsVJ0XELb58wIhJWwL1TdbSCEqojlkTa2JZMR4h+EZTUvgIa1YGEvE9II4KmO1O
	kkysPsh2JoCryhin7Lp0lAbkjKCrwI0PLcrc/kNtVH6XdiI8mWz/eEe3Sjguas2nX/nhIWtTVBz65
	llRuJK3OOG/AXnudCWYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDhTT-0000000GNPe-00bz;
	Mon, 05 Oct 2026 12:07:19 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDhTQ-0000000GNOd-1tcU
	for linux-snps-arc@lists.infradead.org;
	Mon, 05 Oct 2026 12:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791202024; bh=HiRgD7EY7NmvfK/82CFeu7w
	UXdgvuZi6ox8j1Ha0It0=; b=BhAyQWJhytTA/d//tVlB/9X2/jX7uSo0JfcDHqNLgFuPTSvQxe
	621TS4ZeK9A65bdrGFtMLrx1S7oMHEZwFcsThBv4hSbaofdJp9yBGAdPfUBbhetlpP5a9K1gAlQ
	WK6uzv/AUQjKiL7xVuK7aASd+lPfcsFlIZkTHWtMh5s+d6joNXzS6T+sItmrw4ukC7BE1Lu7q+y
	iwlvzm9KOpHsGl+jQGax+9WEDGsxTuhWCwqW3Ls+a3T6s8zYw2Gdf8RG5j+8k7u7wA13wKpNtvN
	VzZcXc3Tnese24/JzGyY1zXEAHwzvFqxLtvMG/vwK+jcVKCbCuN96PxL6R/LvrPtWBQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791202024; bh=HiRgD7EY7NmvfK/82CFeu7w
	UXdgvuZi6ox8j1Ha0It0=; b=3tsHAkQ2uIYP1/tET8DZqIZw+x5YnbLN+BtJc7HAW+RDH8uJDM
	ABi/PVDkeDqTqmc0RuY/rFvmA6M5a1EZkdDA==;
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
Subject: [PATCH v5 1/3] ARC: Emulate two-byte cmpxchg
Date: Mon,  5 Oct 2026 12:06:58 +0000
Message-ID: <20261005120700.383058-2-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005120700.383058-1-brads@mainlining.org>
References: <20261005120700.383058-1-brads@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_050716_649267_35B7735E 
X-CRM114-Status: UNSURE (   8.43  )
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

ARC has no two-byte atomic compare and swap, so the
arch_cmpxchg_relaxed() macro switch lets case 2 fall through to
BUILD_BUG() via default, and a two-byte cmpxchg() fails the build.

Route case 2 through the new cmpxchg_emu_u16(), which narrows the
old and new values itself, so the dispatch keeps the (uintptr_t)
casts the case 1 path already uses.

The sizeof(*(_p_)) fix that v4 folded in here landed separately
through Vineet's f050c3e61d2a, so this patch is now only the
case 2 wiring.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 arch/arc/include/asm/cmpxchg.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index 66b3743c9400..b30b20933f32 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -50,6 +50,9 @@
 	case 1:								\
 		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
 		break;							\
+	case 2:								\
+		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *__force)_p_, (unsigned long)_o_, (unsigned long)_n_);	\
+		break;							\
 	case 4:								\
 		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
 		break;							\
-- 
2.53.0

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
