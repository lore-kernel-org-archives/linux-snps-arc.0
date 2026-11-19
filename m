Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8672760A263E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Nov 2026 06:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=THX9qBl6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fIbbVPwV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1bHt5tHc8YySLlUj8FsSEn8rT2jtGF4AO0DtEZQYmzQ=; b=THX9qBl68LtuV0m2acRBFiS4A8
	BkCtM4Dp6pSOAJMZBEVmG1+7a12nOV0w/J9IoqSyBbRdgzPfL9LYSSPaCkHuvpKcbyhK9mCnbpUih
	akYgM9ESYVCZrepuCctvNuP25nAglZh+WsBg5FdhiSjGmbFlkRKjuhElbl5fihdPB0oC0bbhcMvRJ
	VA7WGAzr0ueWJarwGY65wFBf0U25b3JQpgFDts5V/2CVALy1vOXNWX6pH7voQCp/5w13Ng6mqg/Jh
	OStkXGUG5SKO1xh4Bx+9OIfuTxxHcWr98X7+qUatFa32APeTT7odZcr1KX6RuzkWlD56NjD7CSQMu
	CQQVEuEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTvBn-0000000AxLW-116k;
	Thu, 19 Nov 2026 06:00:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTvBl-0000000AxK6-0xfL
	for linux-snps-arc@lists.infradead.org;
	Thu, 19 Nov 2026 06:00:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 48A9C61B44;
	Thu, 19 Nov 2026 06:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FCE1F000C4;
	Thu, 19 Nov 2026 06:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795068004;
	bh=CZb+ApQ62+vTZSHJN9i70rwloY1LJP4NE3C1eXAaHCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fIbbVPwV0QEhjE8X2vs2dupy5ICmQQOT+FMTaXY3bQbbNbPsylACUaJ5VPjxOS/Vi
	 L6vNooxc4uwG/FkYNBIbT+ieGTJOSXuQHLRzX9OCx3813D/xGkI5KCmyh3y3IgUCKr
	 1KwGbf+0vlZsZeb3wEZptKTw3ammDROXrepPwjXwMeYFWaDe5MFrkG98mu4Y/eH8l3
	 cj7u/t9a3fJ2g+j+HvtjWkCefnMKER8s5+pTEjVlsuTOnP5UkpxFWEb5nj1eDVSt7d
	 aMRj9LNkxYRlr5THz7I5W7/QHW1Zpc0Zq8iMDB7dMDyZO6umE4DKvowLI7Zv2w16fF
	 nBIg3wADBtvTg==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Simon Schuster <schuster.simon@siemens-energy.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 2/4] ARC: math emul: use existing lib versions of libgcc routines
Date: Wed, 18 Nov 2026 21:59:56 -0800
Message-ID: <20261119055958.1621709-3-vgupta@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119055958.1621709-1-vgupta@kernel.org>
References: <20261119055958.1621709-1-vgupta@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use the existing lib/ emulation.

Divide/modulo need some mention: technically emulation is only needed
for hardware lacking the insns (ARCompact ISA or ARCv2 ISA based cores
configured w/o divider and/or those insns disabled in the
build (-mno-div-rem). But to be future-proof (thinking modules)
just add them unconditionally.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/Kconfig           | 10 ++++++++++
 arch/arc/kernel/arcksyms.c | 23 -----------------------
 2 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 80e61175bf52..9bf747882f2a 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -25,6 +25,16 @@ config ARC
 	select GENERIC_ATOMIC64 if !ISA_ARCV2 || !(ARC_HAS_LL64 && ARC_HAS_LLSC)
 	# for now, we don't need GENERIC_IRQ_PROBE, CONFIG_GENERIC_IRQ_CHIP
 	select GENERIC_IRQ_SHOW
+	select GENERIC_LIB_ASHLDI3
+	select GENERIC_LIB_ASHRDI3
+	select GENERIC_LIB_LSHRDI3
+	select GENERIC_LIB_MULDI3
+	select GENERIC_LIB_CMPDI2
+	select GENERIC_LIB_UCMPDI2
+	select GENERIC_LIB_MODSI3
+	select GENERIC_LIB_UMODSI3
+	select GENERIC_LIB_DIVSI3
+	select GENERIC_LIB_UDIVSI3
 	select GENERIC_PCI_IOMAP
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
diff --git a/arch/arc/kernel/arcksyms.c b/arch/arc/kernel/arcksyms.c
index c22055e66cfe..bba133fdd1b6 100644
--- a/arch/arc/kernel/arcksyms.c
+++ b/arch/arc/kernel/arcksyms.c
@@ -7,29 +7,6 @@
 
 #include <linux/module.h>
 
-/* libgcc functions, not part of kernel sources */
-extern void __ashldi3(void);
-extern void __ashrdi3(void);
-extern void __divsi3(void);
-extern void __lshrdi3(void);
-extern void __modsi3(void);
-extern void __muldi3(void);
-extern void __ucmpdi2(void);
-extern void __udivsi3(void);
-extern void __umodsi3(void);
-extern void __cmpdi2(void);
-
-EXPORT_SYMBOL(__ashldi3);
-EXPORT_SYMBOL(__ashrdi3);
-EXPORT_SYMBOL(__divsi3);
-EXPORT_SYMBOL(__lshrdi3);
-EXPORT_SYMBOL(__modsi3);
-EXPORT_SYMBOL(__muldi3);
-EXPORT_SYMBOL(__ucmpdi2);
-EXPORT_SYMBOL(__udivsi3);
-EXPORT_SYMBOL(__umodsi3);
-EXPORT_SYMBOL(__cmpdi2);
-
 /* ARC optimised assembler routines */
 EXPORT_SYMBOL(memset);
 EXPORT_SYMBOL(memcpy);
-- 
2.53.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
