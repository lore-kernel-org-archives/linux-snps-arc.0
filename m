Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69664C43219
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Feb 2022 14:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fb/WP519o3oHp8vyAZ3u4joXi1XfRLo+/H+tMtXZtfo=; b=VftVaYlen58c8T
	xpFLN4tW7Nlqk0CfZ/uSnoq/tA/WuiXQlHKeZQW7DxASXtvBiqd9jDl8bAP0xOKDW6ylYViUlssNe
	T+wdlih3Ceh6vbaekU7IsSlzRTC2oUBCgckZAPu2T2WFH6E2jZWewMe94krgAgmOGBc+D1PNSDY5f
	InA0i/lDCXShbSwuho/IJlB+7JfdBcvXz560e2lFrAT3tpvtfkVGxKHmKqNh+UdZL+mmiiD3BeuFw
	QVFqiuZthByuEWPg9Lot9fYNIhR1Ixb1BIWFe83zG88vHj7adLh2IG8YBtC+7aWvJistVZp2jx742
	YyZT+2ws5yrKZVAR6QjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMVx9-009qhU-0V; Tue, 22 Feb 2022 14:15:43 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMVwq-009qSa-7m
 for linux-snps-arc@lists.infradead.org; Tue, 22 Feb 2022 14:15:28 +0000
Received: by mail-lj1-x22d.google.com with SMTP id f11so11988162ljq.11
 for <linux-snps-arc@lists.infradead.org>; Tue, 22 Feb 2022 06:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iO/u1sA1ai2IOQrlzego8MLm0SGdTqSl2pvOiVgSmFA=;
 b=ZlibMX1vPauELmIIzHZrkQyo8XRWPGz+nGj9kLYN+uxkf2uo3KKzC7Uhfsp2RGLMJ9
 qavEWSUwFxg6eKt5NDahIkpu6jaGmTEzO3UYKPuPDmz3QNtV2N15KUNomD7MKh+bbDhT
 ViULRH47ed9YiKSKZNqcz+gE2VD7lXEe8lvs93wi4H97Y+jUYcs5eGKO2n89BkJWVtE0
 d+t2LHSp4YDPq23JNw8TvNDDnTWeMOJ7d8Dn5NbQFR1/2mWJzZaTI8gv4XTdqgfcSPUO
 tjWddQrTMNvTzvoPzJ6zp68bDI1stMw4yFw23AD89OVjqraJBb8vMiUtoP81dSUEghjk
 xmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iO/u1sA1ai2IOQrlzego8MLm0SGdTqSl2pvOiVgSmFA=;
 b=VMG4JLmU+skeWufqgJnywHS/WIkmDyd8vtesdZC10UA0uuyduY8HBitSB+y1mSXM8J
 n//JlW4B6jjJowZ9s4AQ/f1bnPXa0AKnQv59J6OOtsfxttAhTRTZVLFAYIrpSIWmSDdZ
 iNxP3DT2kGjRAMlylOSXHU031ciRjI89rzvFMb6DXI9ZbiGc36i9+LT8nswjRkJYeTW/
 0epUyJ3C3KMshoB45D9ByzLt0i4N1YXsbx/kwCpQh3b1x/KwUDq0wk6pzNEMELlIWHzB
 ZB25Utm4ZmB4EDv5UdkVEoywr1r6kKThpnlxGaW0S2dQUqJNU3v1il+Q2sQ3iyfsuBgR
 6Pzg==
X-Gm-Message-State: AOAM533racVVdVNK0kdlMsAQkBBqlSAyi1IG/bsmY5dM0yUwITHQM6Lv
 gUUuMBpkW+wys+19VkY3/s4x1irVt2A=
X-Google-Smtp-Source: ABdhPJz5ogUUrS1G/o0s34Rii/F5BSO0p8POV56RgwJ+ZwGSSv2hWQ6+j4ZUMEcgbW7vzsmCiOPQFg==
X-Received: by 2002:a05:651c:d1:b0:246:3708:6e2 with SMTP id
 17-20020a05651c00d100b00246370806e2mr9586175ljr.109.1645539322528; 
 Tue, 22 Feb 2022 06:15:22 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id m8sm1707047ljb.131.2022.02.22.06.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:15:22 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [RFC PATCH 08/13] ARC: string: use generic C code if no ZOL support
Date: Tue, 22 Feb 2022 17:15:01 +0300
Message-Id: <20220222141506.4003433-9-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222141506.4003433-1-geomatsi@gmail.com>
References: <20220222141506.4003433-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_061524_354704_CDC6B1D9 
X-CRM114-Status: GOOD (  13.27  )
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

Switch to generic C code when ZOL is not supported.
Generic code lacks memzero, so define it.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/string.h | 15 ++++++++++++++-
 arch/arc/kernel/arcksyms.c    |  2 ++
 arch/arc/lib/Makefile         |  4 ++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arc/include/asm/string.h b/arch/arc/include/asm/string.h
index 3182ea9dcdde..5cde5226fada 100644
--- a/arch/arc/include/asm/string.h
+++ b/arch/arc/include/asm/string.h
@@ -14,6 +14,8 @@
 
 #include <linux/types.h>
 
+#ifndef CONFIG_ARC_LACKS_ZOL
+
 #define __HAVE_ARCH_MEMSET
 #define __HAVE_ARCH_MEMCPY
 #define __HAVE_ARCH_MEMCMP
@@ -22,7 +24,7 @@
 #define __HAVE_ARCH_STRCMP
 #define __HAVE_ARCH_STRLEN
 
-extern void *memset(void *ptr, int, __kernel_size_t);
+extern void *memset(void *, int, __kernel_size_t);
 extern void *memcpy(void *, const void *, __kernel_size_t);
 extern void memzero(void *ptr, __kernel_size_t n);
 extern int memcmp(const void *, const void *, __kernel_size_t);
@@ -31,4 +33,15 @@ extern char *strcpy(char *dest, const char *src);
 extern int strcmp(const char *cs, const char *ct);
 extern __kernel_size_t strlen(const char *);
 
+#else
+
+extern void *memset(void *, int, __kernel_size_t);
+
+static inline void memzero(void *s, size_t count)
+{
+	memset(s, 0, count);
+}
+
+#endif
+
 #endif /* _ASM_ARC_STRING_H */
diff --git a/arch/arc/kernel/arcksyms.c b/arch/arc/kernel/arcksyms.c
index 8851c0a19e09..d682cea639a4 100644
--- a/arch/arc/kernel/arcksyms.c
+++ b/arch/arc/kernel/arcksyms.c
@@ -45,6 +45,7 @@ EXPORT_SYMBOL(__floatunsisf);
 EXPORT_SYMBOL(__udivdi3);
 
 /* ARC optimised assembler routines */
+#ifndef CONFIG_ARC_LACKS_ZOL
 EXPORT_SYMBOL(memset);
 EXPORT_SYMBOL(memcpy);
 EXPORT_SYMBOL(memcmp);
@@ -52,3 +53,4 @@ EXPORT_SYMBOL(strchr);
 EXPORT_SYMBOL(strcpy);
 EXPORT_SYMBOL(strcmp);
 EXPORT_SYMBOL(strlen);
+#endif
diff --git a/arch/arc/lib/Makefile b/arch/arc/lib/Makefile
index 87d18f5013dc..28793e1ad1be 100644
--- a/arch/arc/lib/Makefile
+++ b/arch/arc/lib/Makefile
@@ -3,6 +3,8 @@
 # Copyright (C) 2004, 2007-2010, 2011-2012 Synopsys, Inc. (www.synopsys.com)
 #
 
+ifndef CONFIG_ARC_LACKS_ZOL
+
 lib-y	:= strchr-700.o strcpy-700.o strlen.o memcmp.o
 
 lib-$(CONFIG_ISA_ARCOMPACT)	+= memcpy-700.o memset.o strcmp.o
@@ -14,4 +16,6 @@ else
 lib-$(CONFIG_ISA_ARCV2)		+=memcpy-archs.o
 endif
 
+endif
+
 lib-$(CONFIG_ARC_LACKS_ZOL)	+= uaccess.o
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
