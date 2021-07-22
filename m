Return-Path: <SRS0=s8S7=MO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3776C63793
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 13:29:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A569961353
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Jul 2021 13:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A569961353
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wOBfRCYXbI6xUvntNuXm98sU+mvnwC9AGnMph8QMhcQ=; b=YRA/M+rkPXfEZA
	E9oV/PuLyjo9j6CL7gNXQ/kJj9ynoGLP2vqcXLFpV3NzVpC8XfSkck+unMUO3otagaVEMn3iqYWT4
	WukTwmnio8wb+zdx38bKkhGBYuhokJHtinsjepjXTjWEepbvyO40ODcK5RxhFUI9thTUOroHKT7yD
	APeFRXzYpEL1CLFr/LQFrwpg4MVGlgGJPj/g876vnx1khCOJJqKFRuZSgKai/exAOU66y3ePC0j/L
	Qytvp7TMZPFV8gZo27LqRgaAPIG7lLHc9VfEAHO2QzO3H9eFj6VfKUOR8751JqDsflFBJTNzg04h2
	ybmDrfPyIP0oXrIgC8HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Ylb-001fOy-R9; Thu, 22 Jul 2021 13:29:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Y8O-001XOs-LC; Thu, 22 Jul 2021 12:49:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E28E361362;
 Thu, 22 Jul 2021 12:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626958144;
 bh=ZuoXd0B2SrZ7Z7bKOj6098xfQUeD3LlhjJk6ioEZ4Xs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hA3Nlg7PrCYGjNZbyik3EyJnOGH4Rc+WYZ/44n/S8bm1S6Z4X1gjmih8rHBlXKQot
 GSuLfvUhJGYRCeAt3OD4idwM47GXeI38tK4ueK9rSkMpw76wM3DftVyTOVJbuJgErI
 3G1dOi6f0yBrlYqEGllSDwn4BaHHw1e//0+kj36Ov6BumSLnC5e8cjFwoyBjuvxdZK
 56PzMD+dBAZmyaIHbyo6gB8KRotIXWFo2JwMKdGjo+8D0Jxqcypq81UfnfAUnUmNog
 3yVbGFOs8zQc9PujNSM217ldBRIWNluLGRQnAXjeifG5jNaaN2DZzzboy4rk8bo2pm
 c+NrsffAWKYYA==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Brian Cain <bcain@codeaurora.org>, Chris Zankel <chris@zankel.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Christoph Hellwig <hch@lst.de>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Jeff Dike <jdike@addtoit.com>, Linus Walleij <linus.walleij@linaro.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Michal Simek <monstr@monstr.eu>,
 Richard Weinberger <richard@nod.at>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@synopsys.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, uclinux-h8-devel@lists.sourceforge.jp
Subject: [PATCH v3 2/9] h8300: remove stale strncpy_from_user
Date: Thu, 22 Jul 2021 14:48:07 +0200
Message-Id: <20210722124814.778059-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210722124814.778059-1-arnd@kernel.org>
References: <20210722124814.778059-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_054904_777614_8089ECC3 
X-CRM114-Status: GOOD (  11.62  )
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

From: Arnd Bergmann <arnd@arndb.de>

This function is never called because h8300 uses the asm-generic
inline function version.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/h8300/kernel/h8300_ksyms.c |  2 --
 arch/h8300/lib/Makefile         |  2 +-
 arch/h8300/lib/strncpy.S        | 35 ---------------------------------
 3 files changed, 1 insertion(+), 38 deletions(-)
 delete mode 100644 arch/h8300/lib/strncpy.S

diff --git a/arch/h8300/kernel/h8300_ksyms.c b/arch/h8300/kernel/h8300_ksyms.c
index 1c6f902e82a5..853d6e886477 100644
--- a/arch/h8300/kernel/h8300_ksyms.c
+++ b/arch/h8300/kernel/h8300_ksyms.c
@@ -19,7 +19,6 @@ asmlinkage long __mulsi3(long, long);
 asmlinkage long __udivsi3(long, long);
 asmlinkage void *memcpy(void *, const void *, size_t);
 asmlinkage void *memset(void *, int, size_t);
-asmlinkage long strncpy_from_user(void *to, void *from, size_t n);
 
 	/* gcc lib functions */
 EXPORT_SYMBOL(__ucmpdi2);
@@ -34,4 +33,3 @@ EXPORT_SYMBOL(__mulsi3);
 EXPORT_SYMBOL(__udivsi3);
 EXPORT_SYMBOL(memcpy);
 EXPORT_SYMBOL(memset);
-EXPORT_SYMBOL(strncpy_from_user);
diff --git a/arch/h8300/lib/Makefile b/arch/h8300/lib/Makefile
index 685fa837c1f7..5911c1fa856d 100644
--- a/arch/h8300/lib/Makefile
+++ b/arch/h8300/lib/Makefile
@@ -3,7 +3,7 @@
 # Makefile for H8/300-specific library files..
 #
 
-lib-y  = memcpy.o memset.o abs.o strncpy.o \
+lib-y  = memcpy.o memset.o abs.o \
 	 mulsi3.o udivsi3.o muldi3.o moddivsi3.o \
 	 ashldi3.o lshrdi3.o ashrdi3.o ucmpdi2.o \
 	 delay.o
diff --git a/arch/h8300/lib/strncpy.S b/arch/h8300/lib/strncpy.S
deleted file mode 100644
index 8b65d7c4727b..000000000000
--- a/arch/h8300/lib/strncpy.S
+++ /dev/null
@@ -1,35 +0,0 @@
-;;; SPDX-License-Identifier: GPL-2.0
-;;; strncpy.S
-
-#include <asm/linkage.h>
-
-	.text
-.global strncpy_from_user
-
-;;; long strncpy_from_user(void *to, void *from, size_t n)
-strncpy_from_user:
-	mov.l	er2,er2
-	bne	1f
-	sub.l	er0,er0
-	rts
-1:
-	mov.l	er4,@-sp
-	sub.l	er3,er3
-2:
-	mov.b	@er1+,r4l
-	mov.b	r4l,@er0
-	adds	#1,er0
-	beq	3f
-	inc.l	#1,er3
-	dec.l	#1,er2
-	bne	2b
-3:
-	dec.l	#1,er2
-4:
-	mov.b	r4l,@er0
-	adds	#1,er0
-	dec.l	#1,er2
-	bne	4b
-	mov.l	er3,er0
-	mov.l	@sp+,er4
-	rts
-- 
2.29.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
