Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257CFC43219
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Feb 2022 14:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AG1xizrQNcm4tKgaN7JCdPqX30nR2vXQyCa6tihRYrM=; b=FDuZpmI0nopBrH
	jeiilG3tentZySwgZ18joh++YuuRdmqzNY0KCiWpX2kk7xx8/dwPE1DZvw/V0eyTzrR0SR48aTjbN
	THoMMtxa5PwsM4MUxfzu+QIacWf9imNEz328B0ZoQnX+o54Po0eEPMzCnJOefxho0Nt5gH10l/WWe
	aODPKUhXtVMxjo7+xNjclmz+Rf8LJNznzzKZSKdq9dy48k+THsUFrj69yxu9fQIM6x24prhvoBblQ
	zYJmeU8s0KJQLRWf/xOUUlziRSCQ71YSpeGIAmOgG9r3WQGwpse6kEMwW6YlE5y1sEDqJOfFWu50L
	KMLAiUd3SOVO4QxTlXMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMVwo-009qRc-Au; Tue, 22 Feb 2022 14:15:22 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMVwl-009qO7-Ky
 for linux-snps-arc@lists.infradead.org; Tue, 22 Feb 2022 14:15:21 +0000
Received: by mail-lf1-x133.google.com with SMTP id w27so7332548lfa.5
 for <linux-snps-arc@lists.infradead.org>; Tue, 22 Feb 2022 06:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=x8t2JIdOCUZY3+MmNpF/hNG9rC3kyMMgOKXOEnBcjRQ=;
 b=YDXf1CrJpYqOC8SjnOz98rPDlUkj/zCOyjFP1b4EsBTNSt5Ie3iPORIZPs6FbYKAdN
 mY6BvWxhUy2Y37skqEQQPTiIcseyK8yW5Ru9LUGR2h2qsEa0CG9UH9igWY6YhIzBfBl3
 S0p8n4dMWNgmU7cwV7yk/d83v0cuSQWcYHi9+1AA4Klar18RWR5aaXN3I1VJ2ZOQKInV
 INyOP6/cfFhwTPhtH8xykk/hIxW324svB2w19grYkSGQzUeWv+e1mprWMjcEFkumPx+N
 sTc3XHdNkQ1RzuifeykIA706wakmoIbZ/P5fFzwlWfKw2yVWo0DcYHpQGDGefQSmar0D
 04Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x8t2JIdOCUZY3+MmNpF/hNG9rC3kyMMgOKXOEnBcjRQ=;
 b=11uPMxbg2uGzNIOZuysssU6D9oJxeqOolGjU2yqFF1xUyLoXTRzzIuXX+OsRmc3ZlW
 z27BOFL9bH56fK/Q607q9T8V+FRZfM0VAhQQ/L+y5yx8ntuq/JVeW0Rb/CIYUDRkADw0
 nQahmGuuSUVMqG+wLzFs+0lVYCROL7dFKLS6fNfAjLA7YRDCM+BlJDnNLILh+OZUU11k
 +InjOmaE8V9e7f/KDS7JcJcEoDvqpyqKENeYSh1feOO+3QLa8WP/R71i5IlmaB4fuofV
 LAsoKtlwYyfWSWc9/BkpGvZgKtdlKtSVU0EaddbrKEEBl1P7haLvpiFRqe1k0GsWDIYD
 MG7w==
X-Gm-Message-State: AOAM532h/jjrrzJDDCiBoUiXJDdQYUCmQiA6B/q8WTEj9TZ1FGNCQ7MT
 jlnYvUBQrH969ubfKeS1V8nmoFEo9FA=
X-Google-Smtp-Source: ABdhPJy1a/JIkrI6Jt8O0D5rrBu07e0WC/IwKu7LTu+k56IKUSQ1vfXk13ZcmJLGDqBn4CuM/89CYA==
X-Received: by 2002:ac2:52aa:0:b0:443:d6f:31cb with SMTP id
 r10-20020ac252aa000000b004430d6f31cbmr16935810lfm.186.1645539317483; 
 Tue, 22 Feb 2022 06:15:17 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id m8sm1707047ljb.131.2022.02.22.06.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:15:16 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [RFC PATCH 02/13] ARC: Kconfig: introduce option to disable ZOL
Date: Tue, 22 Feb 2022 17:14:55 +0300
Message-Id: <20220222141506.4003433-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222141506.4003433-1-geomatsi@gmail.com>
References: <20220222141506.4003433-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_061519_721811_14D001A9 
X-CRM114-Status: GOOD (  16.72  )
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

From: Vineet Gupta <vgupta@kernel.org>

Upcoming ARCv3 lacks ZOL support, so provide alternatives
based on DBNZ instruction inrtroduced in ARCv2.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/Kconfig                           | 10 ++++++++
 arch/arc/Makefile                          |  1 +
 arch/arc/include/asm/asm-macro-dbnz-emul.h | 12 +++++++++
 arch/arc/include/asm/asm-macro-dbnz.h      |  8 ++++++
 arch/arc/include/asm/assembler.h           | 29 ++++++++++++++++++++++
 5 files changed, 60 insertions(+)
 create mode 100644 arch/arc/include/asm/asm-macro-dbnz-emul.h
 create mode 100644 arch/arc/include/asm/asm-macro-dbnz.h
 create mode 100644 arch/arc/include/asm/assembler.h

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 3c2a4753d09b..9daef7c763ce 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -341,6 +341,16 @@ config ARC_HAS_SWAPE
 
 if ISA_ARCV2
 
+config ARC_LACKS_ZOL
+	bool "Disable Zero Delay hardware loops"
+	help
+	  ARC CPU historically have had ZOL hardware loop mechanism which
+	  the ARCv3 ISA drops. Architecturally ZOL provides
+	    - LPcc instruction
+	    - LP_COUNT core reg
+	    - LP_START, LP_END aux regs
+	  This optional removes any use of ZOL instructions/regs from code
+
 config ARC_USE_UNALIGNED_MEM_ACCESS
 	bool "Enable unaligned access in HW"
 	default y
diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index efc54f3e35e0..ec0f672bcee6 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -39,6 +39,7 @@ LINUXINCLUDE	+=  -include $(srctree)/arch/arc/include/asm/current.h
 endif
 
 cflags-y				+= -fsection-anchors
+cflags-y				+= -Wa,-I$(srctree)/arch/arc/include
 
 cflags-$(CONFIG_ARC_HAS_LLSC)		+= -mlock
 cflags-$(CONFIG_ARC_HAS_SWAPE)		+= -mswape
diff --git a/arch/arc/include/asm/asm-macro-dbnz-emul.h b/arch/arc/include/asm/asm-macro-dbnz-emul.h
new file mode 100644
index 000000000000..8c89f4234408
--- /dev/null
+++ b/arch/arc/include/asm/asm-macro-dbnz-emul.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ * DBNZ emulation for ARCompact or earlier ARCv2 cores
+ * 2 byte short instructions used to keep code size same as 4 byte DBNZ.
+ * This warrants usage of r0-r3, r12-r15, gas barfs otherwise catching
+ * offenders immediately
+ */
+.macro DBNZR r, lbl
+	sub_s  \r, \r, 1
+	brne_s \r, 0, \lbl
+.endm
diff --git a/arch/arc/include/asm/asm-macro-dbnz.h b/arch/arc/include/asm/asm-macro-dbnz.h
new file mode 100644
index 000000000000..fe658d2eab51
--- /dev/null
+++ b/arch/arc/include/asm/asm-macro-dbnz.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ * DBNZ instruction introduced in ARCv2
+ */
+.macro DBNZR r, lbl
+	dbnz  \r, \lbl
+.endm
diff --git a/arch/arc/include/asm/assembler.h b/arch/arc/include/asm/assembler.h
new file mode 100644
index 000000000000..426488ef27d4
--- /dev/null
+++ b/arch/arc/include/asm/assembler.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_ARC_ASM_H
+#define __ASM_ARC_ASM_H 1
+
+#ifdef __ASSEMBLY__
+
+#ifdef CONFIG_ARC_LACKS_ZOL
+#include <asm/asm-macro-dbnz.h>
+#else
+#include <asm/asm-macro-dbnz-emul.h>
+#endif
+
+#else	/* !__ASSEMBLY__ */
+
+/*
+ * ARCv2 cores have both LPcc and DBNZ instructions (starting 3.5a release).
+ * But in this context, LP present implies DBNZ not available (ARCompact ISA)
+ * or just not desirable, so emulate DBNZ with base instructions.
+ */
+#ifdef CONFIG_ARC_LACKS_ZOL
+asm(".include \"asm/asm-macro-dbnz.h\"\n");
+#else
+asm(".include \"asm/asm-macro-dbnz-emul.h\"\n");
+#endif
+
+#endif	/* __ASSEMBLY__ */
+
+#endif
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
