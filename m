Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386EF606A339
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Nov 2026 04:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FFhIkOd3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gZNeny0A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=23HIXxalMNfj9tf+m6GYCg+z/HMYOXmn5mgHOnrLFgg=; b=FFhIkOd3mR/FNvpIbV+nICnTZW
	a3S42aMlgD/I0wq8WIwdgfiXlgOvrUGDXPXIppVfIQDaad15KXlZANGAJRbjtxybtQpUHp4KIvskD
	DN6rBJy2yYPU/v8GUWLZjfZ7lQ/Fh6rSbmprBGc/t2ML3y47QBUNorbYdjdlSVfXD+M8iFIqyFAr8
	RMGMbkB1Ma3DxziLgpOLAI7zWd8qN/w7NuJKBXP1zg8l4oqEvMKUKAEc+qvRsajMZRTkJl07tvr1n
	2CNfOCGPXiuWfWFXiCIDpRP/tI0pRUfaO4KHznDMbYYmaLJOpEeuDG1xi+hPtyIk57sH+Q3mJ+qyE
	7OLetazw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOSiq-00000004JV2-2jes;
	Wed, 04 Nov 2026 04:35:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOSip-00000004JUl-1yGS
	for linux-snps-arc@lists.infradead.org;
	Wed, 04 Nov 2026 04:35:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D4A1C415BD;
	Wed,  4 Nov 2026 04:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9F31F0093A;
	Wed,  4 Nov 2026 04:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793766938;
	bh=AMKGIe8BSbyYaDU1MMtpU1Bo9w4z1tdfz9JE1gZvoo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gZNeny0AqlMk+AXEw8+Jj1xLNEloVUyeNBpl/c1IVQedYcOoZyBiDvBheYZ0OyX9O
	 wac8+AsyvSHZjRJpNIQxswnsRg3HH4YjznFgbLmnYMV0+B4WRxH8hiWxJr1jG9b3bh
	 dZS/rolfgZ5bSVNqA/SvLx9uvH2Iz23asfsf74xi3bE1izezxB2MoLaSnidY/IFk5O
	 acn2luoay4tMwXfyX8fJArWynnu6rz73yDefZm95wAe2aKiLYjeS3/haa604Ic98jY
	 eCV7TDPcFsj/6U05X1c3REfjFl7YH11PUESM9vAeR+XUgejBrQwoV/CZUK+IE+Fy+f
	 j1zhyCMnu//Pw==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Vineet Gupta <vgupta@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] ARC: io: work around GCC PR127718 in __raw_write{w,l}()
Date: Tue,  3 Nov 2026 20:35:34 -0800
Message-ID: <20261104043535.2039948-2-vgupta@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104043535.2039948-1-vgupta@kernel.org>
References: <20261104043535.2039948-1-vgupta@kernel.org>
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

The __raw_write{w,l}() accessors use inline asm with an "m" operand for
the store destination. GCC's ARC backend lets "m" match any legitimate
address, including the register-indexed [b,c] forms that only loads
support: stores only have [reg], [reg,s9] and [limm] addressing. With
newer GCC (late-combine in GCC 15, combine in GCC 16), a writew() with a
scaled, non-constant offset gets

	stw.as r2,[r0,r1]

which the assembler rejects:

  Error: inappropriate arguments for opcode 'stw'

With GCC 16 this breaks even hsdk_defconfig (drivers/net/pcs/
pcs-xpcs-plat.c) and axs101_defconfig. allyesconfig additionally trips
in drivers/pinctrl/renesas/pinctrl-rza2.c and drivers/video/fbdev/
s3c-fb.c.

Work around it by passing the address in a register and using a fixed
[%1] address in the asm template, so the compiler can't pick an
addressing mode that stores don't support. This is the minimal fix.
The next patch drops the inline asm altogether.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=127718
Cc: stable@vger.kernel.org
Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/io.h | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arc/include/asm/io.h b/arch/arc/include/asm/io.h
index 00171a212b3c..b4a3393d1bdc 100644
--- a/arch/arc/include/asm/io.h
+++ b/arch/arc/include/asm/io.h
@@ -133,10 +133,14 @@ static inline void __raw_writeb(u8 b, volatile void __iomem *addr)
 #define __raw_writew __raw_writew
 static inline void __raw_writew(u16 s, volatile void __iomem *addr)
 {
+	/*
+	 * Not an "m" operand: GCC can pick a register-indexed address for it,
+	 * which ST doesn't support (GCC PR target/127718).
+	 */
 	__asm__ __volatile__(
-	"	stw%U1 %0, %1	\n"
+	"	stw %0, [%1]	\n"
 	:
-	: "r" (s), "m" (*(volatile u16 __force *)addr)
+	: "r" (s), "r" (addr)
 	: "memory");
 
 }
@@ -144,10 +148,11 @@ static inline void __raw_writew(u16 s, volatile void __iomem *addr)
 #define __raw_writel __raw_writel
 static inline void __raw_writel(u32 w, volatile void __iomem *addr)
 {
+	/* See __raw_writew() above for why this doesn't use an "m" operand. */
 	__asm__ __volatile__(
-	"	st%U1 %0, %1	\n"
+	"	st %0, [%1]	\n"
 	:
-	: "r" (w), "m" (*(volatile u32 __force *)addr)
+	: "r" (w), "r" (addr)
 	: "memory");
 
 }
-- 
2.53.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
