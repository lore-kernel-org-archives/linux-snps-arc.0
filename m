Return-Path: <SRS0=SVKa=JI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16D3C43461
	for <linux-snps-arc@archiver.kernel.org>; Sun, 11 Apr 2021 13:56:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E266611AD
	for <linux-snps-arc@archiver.kernel.org>; Sun, 11 Apr 2021 13:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E266611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lsafFZHdvqFwOpus9MVzNmVqf16dhh/l6fk8aVsKFHU=; b=og987Vv4FfXoKQcP96eIU5p2Bt
	ZG5bJDVLWmEZu4eikIh+EftqDorCIDrEYbCXaC7ZrdsF5muDg5k9/X4DQdByGpxjveU8VqjsDDY6+
	kjPv6XucI5ewwSV+Kqy2QRgf74UL4uuDpQtQBrIYXrO83B2eC9ajQQIZ2+pnrou6cME6ClSRfD2rS
	2+Q/CV7ZdAoeisKlCWflez4P3iY6iCP1YN9HbRMSPqGyaSz3XZoM+H+SKmAKyuCjfya382Q2lOvFP
	CmAcBMa8vFsjC0Iyw+zH8b7iaQpyq6iA+QwIOTnj4tc1R5LGfWFKkuPWjYnf18jEcNLKc3SCzw1gd
	ESPrxbOg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVaZZ-004YEM-7T; Sun, 11 Apr 2021 13:56:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVaZV-004YED-D5
 for linux-snps-arc@desiato.infradead.org; Sun, 11 Apr 2021 13:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=vS8e0SLZkCBy0RmRBkXW9rD3CCXXaiE+fv8+9wtNFcQ=; b=GBgE1Mho96fMY73axuXzhtfVKT
 NuFAFPM8KtM7nLzs7qmY6P4XRWawk0JO1hOXwjdpPTH1g0HslFMpDVvwLWeIGjXHF4uMbfc7vUOoU
 8j1SzCCtD7m/MJzT9onRjpWMgsjJ+Gqv5bwrMRLT5ZDqrItKJaIrX+uYnlSntuNtVuTcQrPouoBdt
 1kbc4GXakr3H3f0kSzgyQAmQyC4PF0owg0T3pbcDnru65a3wRfjEUvCJzxa5WndbSxOqj5x+k0p4I
 BtrAWFqBtyddSp2x/50caj+vOmD4kR2GIdlCHrsGDvMvDjSeuNMqWS5m+LTjZrWElkM/QOvoSUgZg
 qHoKbQhg==;
Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVaZS-005Y0g-Fy
 for linux-snps-arc@lists.infradead.org; Sun, 11 Apr 2021 13:56:16 +0000
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp
 [133.32.232.101]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id 13BDtZpj024906;
 Sun, 11 Apr 2021 22:55:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 13BDtZpj024906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1618149336;
 bh=vS8e0SLZkCBy0RmRBkXW9rD3CCXXaiE+fv8+9wtNFcQ=;
 h=From:To:Cc:Subject:Date:From;
 b=T4auvfUkLCtH1xfy+3/BrGcOzcfBKdffBrAXk4ktteZcBCINybIlbpHd9u+FXgcif
 RO7XzBcc9p98FwTRNy8JybHK2F1kD5uOTKziM8txSjy2xhfOkbGIf/yytdOE+0jpI8
 KviylrePITI/U3uMXnTZgwZjolQgFonocj7FYZytyy/PjeAFIk4d+ZnlqNcz82TC5w
 YlRMzOSoLaSCC1uOkHx7R065zcm6947UcUG2em5S3RDI+7PnZJcADDKJj5uN27osZQ
 9HFOIw4qnFiaxSzmdf0tITxyKAxAA/2oJKzo5VUOhdMB6iiBQ1EhXsj3PC5YdEkMlh
 RRIP4+C1tEq2Q==
X-Nifty-SrcIP: [133.32.232.101]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Helge Deller <deller@gmx.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Rich Felker <dalias@libc.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vineet Gupta <vgupta@synopsys.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp
Subject: [PATCH] kbuild: use ?= to assign CROSS_COMPILE by arch-Makefile
Date: Sun, 11 Apr 2021 22:55:32 +0900
Message-Id: <20210411135532.219797-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_065614_781139_AA3C1D3F 
X-CRM114-Status: UNSURE (   7.12  )
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

Use ?= operator to let arch/*/Makefile to assign CROSS_COMPILE only
when CROSS_COMPILE is undefined.

This allows arch-Makefiles to drop the ifeq ($(CROSS_COMPILE),)
conditional.

This slightly changes the behavior; the arch-Makefile previously
overrode CROSS_COMPILE when CROSS_COMPILE has already been made empty
via an environment variable as in 'export CROSS_COMPILE='.

With this commit, arch-Makefle will respect the user's environment
set-up, which seems to be a more correct behavior.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arc/Makefile    | 4 +---
 arch/h8300/Makefile  | 4 +---
 arch/m68k/Makefile   | 4 +---
 arch/mips/Makefile   | 4 +---
 arch/parisc/Makefile | 6 ++----
 arch/sh/Makefile     | 4 +---
 6 files changed, 7 insertions(+), 19 deletions(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 4392c9c189c4..bd5a9daa3461 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -5,9 +5,7 @@
 
 KBUILD_DEFCONFIG := haps_hs_smp_defconfig
 
-ifeq ($(CROSS_COMPILE),)
-CROSS_COMPILE := $(call cc-cross-prefix, arc-linux- arceb-linux-)
-endif
+CROSS_COMPILE ?= $(call cc-cross-prefix, arc-linux- arceb-linux-)
 
 cflags-y	+= -fno-common -pipe -fno-builtin -mmedium-calls -D__linux__
 
diff --git a/arch/h8300/Makefile b/arch/h8300/Makefile
index ba0f26cfad61..d6e466dbfc00 100644
--- a/arch/h8300/Makefile
+++ b/arch/h8300/Makefile
@@ -26,9 +26,7 @@ KBUILD_LDFLAGS += $(ldflags-y)
 
 CHECKFLAGS += -msize-long
 
-ifeq ($(CROSS_COMPILE),)
-CROSS_COMPILE := $(call cc-cross-prefix, h8300-unknown-linux- h8300-linux-)
-endif
+CROSS_COMPILE ?= $(call cc-cross-prefix, h8300-unknown-linux- h8300-linux-)
 
 core-y	+= arch/$(ARCH)/kernel/ arch/$(ARCH)/mm/
 core-y	+= arch/$(ARCH)/boot/dts/
diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
index ea14f2046fb4..79208ad7a355 100644
--- a/arch/m68k/Makefile
+++ b/arch/m68k/Makefile
@@ -17,10 +17,8 @@
 KBUILD_DEFCONFIG := multi_defconfig
 
 ifneq ($(SUBARCH),$(ARCH))
-	ifeq ($(CROSS_COMPILE),)
-		CROSS_COMPILE := $(call cc-cross-prefix, \
+	CROSS_COMPILE ?= $(call cc-cross-prefix, \
 			m68k-linux-gnu- m68k-linux- m68k-unknown-linux-gnu-)
-	endif
 endif
 
 #
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index e71d587af49c..75e4e46532a4 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -51,9 +51,7 @@ UTS_MACHINE		:= mips64
 endif
 
 ifneq ($(SUBARCH),$(ARCH))
-  ifeq ($(CROSS_COMPILE),)
-    CROSS_COMPILE := $(call cc-cross-prefix, $(tool-archpref)-linux-  $(tool-archpref)-linux-gnu-  $(tool-archpref)-unknown-linux-gnu-)
-  endif
+  CROSS_COMPILE ?= $(call cc-cross-prefix, $(tool-archpref)-linux-  $(tool-archpref)-linux-gnu-  $(tool-archpref)-unknown-linux-gnu-)
 endif
 
 ifdef CONFIG_FUNCTION_GRAPH_TRACER
diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 7d9f71aa829a..62272cb3513c 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -42,12 +42,10 @@ endif
 export LD_BFD
 
 ifneq ($(SUBARCH),$(UTS_MACHINE))
-	ifeq ($(CROSS_COMPILE),)
-		CC_SUFFIXES = linux linux-gnu unknown-linux-gnu
-		CROSS_COMPILE := $(call cc-cross-prefix, \
+	CC_SUFFIXES = linux linux-gnu unknown-linux-gnu
+	CROSS_COMPILE ?= $(call cc-cross-prefix, \
 			$(foreach a,$(CC_ARCHES), \
 			$(foreach s,$(CC_SUFFIXES),$(a)-$(s)-)))
-	endif
 endif
 
 ifdef CONFIG_DYNAMIC_FTRACE
diff --git a/arch/sh/Makefile b/arch/sh/Makefile
index 3bcbf52fb30e..0e8277be362e 100644
--- a/arch/sh/Makefile
+++ b/arch/sh/Makefile
@@ -10,9 +10,7 @@
 # for more details.
 #
 ifneq ($(SUBARCH),$(ARCH))
-  ifeq ($(CROSS_COMPILE),)
-    CROSS_COMPILE := $(call cc-cross-prefix, sh-linux- sh-linux-gnu- sh-unknown-linux-gnu-)
-  endif
+  CROSS_COMPILE ?= $(call cc-cross-prefix, sh-linux- sh-linux-gnu- sh-unknown-linux-gnu-)
 endif
 
 KBUILD_DEFCONFIG	:= shx3_defconfig
-- 
2.27.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
