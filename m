Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A256C04A6A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Aug 2023 00:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ASCvE3BnkFMwYSPzgywixziIICba563So5Uz+BvOW7U=; b=LZw5mGv9op20/I
	e0bBp11emLaGOTskUxVxUFVZfe58t3wBzEjS+NARRPoWpcTothcPg5VnTiYxcaEQZWx1+Wfwetp1z
	P4c4Hf03cQpHADewIAbk/hpdwwoKiQHZiOQk95zWcEhyTyZWKiydhJfDcKDwjIdfE/DaL66Vbnb9Z
	WZU7bvu2KE3TuSBGDAvcTNOsVAkw2y/R4qKFMa4gBbG7bIBWqeZwOUT4PjP05QRHmZADKlxjpo2mh
	DkvNsOaSQ6g2RLM0I0ysY+AIHlb3PMnHRWXUuVCXX6/b+xvSaqOx3yWGESzrz8L9XVFIsY5Btj6tl
	ns1zYhmJ5OZB6gXZtV5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qViER-000cW8-0T;
	Tue, 15 Aug 2023 00:48:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qViEN-000cTW-2u
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Aug 2023 00:48:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5571E63EF6;
	Tue, 15 Aug 2023 00:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C703C433C9;
	Tue, 15 Aug 2023 00:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692060498;
	bh=pgFliqh5FCiPwev8SHNbWyt1mtItXDmKgFcmPAR7eAI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ArMfxvd8GgUdg9gKY7FVVUcLWCSiKmKUDUbi+UAGlo4ygnK0IxpvcOECu7gxym9b+
	 6XhETF2Rtb8o+c8/Q2S8XTUUNI15wG2klfjCtsR1Mmkm1Xi+DQ2gNYcN2N/T31Xtm1
	 AgsBEAX8lxJjcmzsVneffl3TGWlOQNimVicJzFsZGRBr/DF9TI8fVZiMjUGwjVwa9C
	 nxeQ4P+tA0myGZBOwFI4D0Huaykq4WTzQ+sx7hA1RiUtasRRDseNyqZJsmIWvBbyc+
	 LPQ0fazBO9uHvG6/n+RxG+QZwGI8wcx520FlACcltd/KNaplqsj0yMkyMCKzbKksVk
	 KhCJY1XMVb6KA==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 01/20] ARC: uaccess: remove arc specific out-of-line handles for -Os
Date: Mon, 14 Aug 2023 17:47:54 -0700
Message-Id: <20230815004813.555115-2-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815004813.555115-1-vgupta@kernel.org>
References: <20230815004813.555115-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_174819_976743_0D3FF9E9 
X-CRM114-Status: UNSURE (   8.97  )
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

Everything is now out-of-line in lib/usercopy.c

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/uaccess.h | 11 ++---------
 arch/arc/mm/extable.c          | 11 -----------
 2 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/arch/arc/include/asm/uaccess.h b/arch/arc/include/asm/uaccess.h
index 99712471c96a..d2da159bb80a 100644
--- a/arch/arc/include/asm/uaccess.h
+++ b/arch/arc/include/asm/uaccess.h
@@ -584,7 +584,7 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 	return res;
 }
 
-static inline unsigned long __arc_clear_user(void __user *to, unsigned long n)
+static inline unsigned long __clear_user(void __user *to, unsigned long n)
 {
 	long res = n;
 	unsigned char *d_char = to;
@@ -626,17 +626,10 @@ static inline unsigned long __arc_clear_user(void __user *to, unsigned long n)
 	return res;
 }
 
-#ifndef CONFIG_CC_OPTIMIZE_FOR_SIZE
-
 #define INLINE_COPY_TO_USER
 #define INLINE_COPY_FROM_USER
 
-#define __clear_user(d, n)		__arc_clear_user(d, n)
-#else
-extern unsigned long arc_clear_user_noinline(void __user *to,
-		unsigned long n);
-#define __clear_user(d, n)		arc_clear_user_noinline(d, n)
-#endif
+#define __clear_user			__clear_user
 
 #include <asm-generic/uaccess.h>
 
diff --git a/arch/arc/mm/extable.c b/arch/arc/mm/extable.c
index 4e14c4244ea2..88fa3a4d4906 100644
--- a/arch/arc/mm/extable.c
+++ b/arch/arc/mm/extable.c
@@ -22,14 +22,3 @@ int fixup_exception(struct pt_regs *regs)
 
 	return 0;
 }
-
-#ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
-
-unsigned long arc_clear_user_noinline(void __user *to,
-		unsigned long n)
-{
-	return __arc_clear_user(to, n);
-}
-EXPORT_SYMBOL(arc_clear_user_noinline);
-
-#endif
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
