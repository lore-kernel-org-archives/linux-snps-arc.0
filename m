Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4CBCA5FF0
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Oct 2026 12:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rd9U/e1VADkMCa4i1E1VJw+NvyQdxAnDpL5q29aqKfI=; b=G0GvFPNEfUx3Xg
	mj+x4GdgGhcEnSZu8zNNhd6mYZqV5schFs7Bf3O754rbDvEOraw/OBu2ckWAyN78B8p/r44A2HuqI
	5XMaBJ8sIvp1cKmRTP88x/oVOwIk8nKkymrqt/iaqSZSICzWvVDr4dM/sTZPAi5kKZ87huymqwsmD
	ZvNkx3x1WJFPAVAdrBQPngN4nZuRuwDgA02lB3wcJ0ZHkv82+87+5+8fLKX3+cgTxer8lPLWMNo0n
	c/6bgM1pJbz6Me8XYyC/JjxcmFMjIHxa/lGrQyJAKeastbpRZoXM2fGiGBSbSlWXrPWp8Iyuk6odM
	5QOIIAsaQ7dT+U9UcXHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDhVg-0000000GNdt-2i9U;
	Mon, 05 Oct 2026 12:09:36 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDhVd-0000000GNd7-3wi3
	for linux-snps-arc@lists.infradead.org;
	Mon, 05 Oct 2026 12:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791202026; bh=UyE2WbqxID6O1bGrrpnC3dh
	LKyhQZ5MZNS++hKSonwE=; b=rTl8ubsK68VnzzAoJ06grCjpnVljgY6irkKS6xzwA0e50XxCG4
	fgWicCYVH9aWJ/d05yzlcXXtrFO2gCD+00zalNkNsm9r257kgHQeFDCDdjTuLd4sTTbuWf6qvtX
	HSDPbyCRAY8Vo6iEBkojAhtchIg1abBuONGQ+v1JSA49311frmMZawdNf1bHNufNpTRPjbRQX8m
	HNLNrz/tO5DQjPSA8pKE0WeWGlpXxC8I7IOnDTNrQEnRrN/pwRtITI4GZig4oUfVzn13/HenHnO
	a5eVal9ioHRZtXC1R/Ur48ME4K48i8HryQXwRjuLavGOn25MvoTLJPWsnjhh2E22l4A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791202026; bh=UyE2WbqxID6O1bGrrpnC3dh
	LKyhQZ5MZNS++hKSonwE=; b=Q6M3tnXKegcyxQ/ar5xcHyJbNFw2/dvgiQW7xxhcf4bOGNNGju
	rF5I1b7DMHBwWdSDN8zHGSPcu2ZbFw9EosDg==;
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
Subject: [PATCH v5 2/3] csky: Emulate two-byte cmpxchg
Date: Mon,  5 Oct 2026 12:06:59 +0000
Message-ID: <20261005120700.383058-3-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005120700.383058-1-brads@mainlining.org>
References: <20261005120700.383058-1-brads@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_050934_124183_C0D44E35 
X-CRM114-Status: UNSURE (   7.33  )
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

C-SKY has no two-byte atomic compare and swap, so the __cmpxchg()
macros let case 2 fall through to BUILD_BUG() via default, and a
two-byte cmpxchg() fails the build.

Route case 2 through the new cmpxchg_emu_u16(), which narrows the
old and new values itself, so all three orderings, relaxed, acquire
and full, keep the (uintptr_t) casts the case 1 path already uses.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 arch/csky/include/asm/cmpxchg.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/csky/include/asm/cmpxchg.h b/arch/csky/include/asm/cmpxchg.h
index db6dda47184e..6f3ca79e54ac 100644
--- a/arch/csky/include/asm/cmpxchg.h
+++ b/arch/csky/include/asm/cmpxchg.h
@@ -64,6 +64,9 @@
 	switch (size) {						\
 	case 1:							\
 		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
+		break;							\
+	case 2:							\
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (unsigned long)__old, (unsigned long)__new); \
 		break;						\
 	case 4:							\
 		asm volatile (					\
@@ -97,6 +100,9 @@
 	switch (size) {						\
 	case 1:							\
 		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
+		break;							\
+	case 2:							\
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (unsigned long)__old, (unsigned long)__new); \
 		break;						\
 	case 4:							\
 		asm volatile (					\
@@ -131,6 +137,9 @@
 	switch (size) {						\
 	case 1:							\
 		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, (uintptr_t)__old, (uintptr_t)__new); \
+		break;							\
+	case 2:							\
+		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, (unsigned long)__old, (unsigned long)__new); \
 		break;						\
 	case 4:							\
 		asm volatile (					\
-- 
2.53.0

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
