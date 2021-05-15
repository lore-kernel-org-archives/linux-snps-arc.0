Return-Path: <SRS0=I9+C=KK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA99C433B4
	for <linux-snps-arc@archiver.kernel.org>; Sat, 15 May 2021 10:19:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C39B613F0
	for <linux-snps-arc@archiver.kernel.org>; Sat, 15 May 2021 10:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C39B613F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wOBfRCYXbI6xUvntNuXm98sU+mvnwC9AGnMph8QMhcQ=; b=Si7kXINFjTwLAR8JGsrODef6t
	juTnV/3xDhsrxzJoh/UoSlYiBlny/tW7V9mpdePiSS1tI52ypdSO4/71ei4oxnVMIlJWxE9Q4rtV8
	lBdEIJTPEFV55l1m0uQdzcBglE5U0dfEyOiU3UWeIvr2ZRiQeXbzMji9VFtmTgfLUKig09bzIzVYA
	eoBOXb7N8Va85eRWTigO8w09KwgoKQY8q+V8w65GeKnN/x7Bx07cT/vye6/7NEwI3rzzNEIogD4Gm
	MTrDDAOkeZK6yZ+UK+NW5mAiUL1VLsI3ZwMGzYSfAFGW05wv+mDOxpyD3u6bkDlHfrUZ3tF71aLm0
	MN/YRvjAQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhrOF-00A8da-Ue; Sat, 15 May 2021 10:19:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhrO3-00A8ZY-Vt; Sat, 15 May 2021 10:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=iRPS09GKtyHN36s6c6tnCvwonnTmhlRhulJXnYJYC2s=; b=h7OckPo5keHsV6lpPqqWgLBrkK
 MkdV+2dlTkoB9GOCW+BCZGi4PaXYxZVT58Ea/OzRUfZdkj9XMxv7xmgY4HuMl5JHPBqgzMAp3Gp+V
 ZWNsNAsZ6jZgo81I4TQGo4tIRMpjx7HmTW16fh8xv4epFYJ8ANRz3/672NPj5qN8qv/5aMVvo3huI
 q5RGb+AN5rGEWQjJ/E0CBOAiLl8alIJMX721HrBi0jjO/klERbG6ihUXwnNmLyn5Wg1nIbwwIYEUV
 Gq+DwSh3cerLxnp7r4jrXpAROK1YESg0mOqE4NzTQYl3w07QHbxITAJW5LGIlwxhLmqpDhEGqb5wj
 Ob1WW1vg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhrO1-00CU4c-G2; Sat, 15 May 2021 10:19:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 222DB613F2;
 Sat, 15 May 2021 10:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621073949;
 bh=ZuoXd0B2SrZ7Z7bKOj6098xfQUeD3LlhjJk6ioEZ4Xs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OaXxzQOLVw4qXYynCG0CbJTLPAAS4Cb6ml36FdzlD2oZFwMEoeLCGboIwHsdJ5exf
 Ga2adeohFo6jmgrDUQjP94/gg0dswfFTbe+zdsfcWzgNBT43wk4Rxgkfpfu1PQ0+Z7
 ZxuSwUyFzpHZs+JqnThCfpAyalEYKBpG0bbzQmP4PXw6PFNb5+nQV6gUU6v/7++9gN
 Hzg5TNwsEo/ElbE+CUdy7zXGXcUoVWfppN9fShcogVKUpONLfuipIrULhaQbwVAGSP
 c+UkqkoXdQGbJ9zE+9HHem2AcbupgnH8nxd1PtiVRb0sqYrQm9KC8BHrRsfyNFx2uH
 C6SoseNotBhMg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Vineet Gupta <vgupta@synopsys.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@codeaurora.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Sid Manning <sidneym@codeaurora.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-hexagon@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org,
 linux-um@lists.infradead.org
Subject: [PATCH 2/6] [v2] h8300: remove stale strncpy_from_user
Date: Sat, 15 May 2021 12:17:59 +0200
Message-Id: <20210515101803.924427-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210515101803.924427-1-arnd@kernel.org>
References: <20210515101803.924427-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210515_031909_593674_35CCB514 
X-CRM114-Status: GOOD (  11.36  )
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
