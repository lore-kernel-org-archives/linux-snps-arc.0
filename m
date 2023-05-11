Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AAFC7EE26
	for <linux-snps-arc@archiver.kernel.org>; Thu, 11 May 2023 17:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SA353663+zXNso9p/gor0is7etl7YWuO7AqXZxhT5b8=; b=wbuSm57E5Qxz5t
	QdpOs0ztXwE1JX9ba4MbQS1jLaCfqL8Ey3ydLEL28/l9hdSxNCnEM1I1JnlXLwvxtohpo/gailVK+
	QJ/PljH055o4ZZ/WzVgsSaPdNN7+hcIGfG4hAEc/WmKQESLcbJiJ9f62Kxe+JXsvyC4PERPhiBryZ
	/ctZ2sb5xKL9FkdrwuYl6LY2nSlpzfBD1dIE9vDfLKOo2lNddEJ2VNs4WOjaskXb6E2ii2EqKmQum
	1Eig/n/t6HFeHhxcAt7VcOjR7xTBIRSCDhUtd6ukOyaIP1trDqZPU3YFiBFCKAq3suUCiYo2UEmkX
	K5iY069BMMmX56fWyuiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px9ft-009Sch-0x;
	Thu, 11 May 2023 17:01:53 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px9fr-009Saa-0E
	for linux-snps-arc@lists.infradead.org;
	Thu, 11 May 2023 17:01:52 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1ab14cb3aaeso63265845ad.2
        for <linux-snps-arc@lists.infradead.org>; Thu, 11 May 2023 10:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683824508; x=1686416508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKRsLL7kNvDroaLyrSRYU4DWIMyOnhELN3sSuXXaYCw=;
        b=Ty701zaQ1O4E399AdK72ImGSMYCz9q+3WiRXQgKA+1W0+3aTflaknqlI3jM94oQXlS
         iA5WQsfGiwkRe0UagRwLLK4DAZII5krsUpBO4oFq6AE+gBwGHdhyLSyQ8dKUa9hh/43i
         nJJebk+wL2VCpf9fE2t8sQUBlcDpiYdQoVdR0BV5l1OI4zcHq2vQfrbgJhiPtD+Y0aXK
         v9TfsA1ZCmllXyroxNH6ilkRU66/sMBwB3BLmVEVaIb15Jgl9soi/dEaBJf5ANePbnpD
         HAihUbzICcvKkz9NDD6eZhAat9VkI4Kp8GbSrmmjI8JjiyPZRj48IAlZRHDE6XCG8r2g
         QbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683824508; x=1686416508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKRsLL7kNvDroaLyrSRYU4DWIMyOnhELN3sSuXXaYCw=;
        b=AmUGYcN6VKI6NzViHsl/Ri8MNkKe1jgC6pQNHR3tQEXFy1QnaFqCdQDjGliN8RKiwv
         i1PnZfn87baYrG9hcXKUbRbQadzS4b+S0ikVjCA0GZ2+BcztbZ1Z6PMFiAcPCGk4UKO5
         VujljaR2oLnlr1fF1wvNTa7RHO4auGPYff83EQwhXiAYaME976+tD4y3abb2JThWCznO
         pFMSKobP+TR+fCIvOdoF4KenNReo07Kz+UqfqD1e+QgSPyJgcIUw+G9kInc+BYAWcJIC
         ZTaizca6TBiHwdO9Hlfe91pStAJ6iwTBr1WoyBBYwc2Jj+12ZpdwCESQzvCU5CtukH95
         iZMQ==
X-Gm-Message-State: AC+VfDykTViBUDIa+tCGSCraYPk1ry4OjgisxkFgzf5kPhvTA5QN5M7T
	xKvlPMil2/6EjLI3MSPpfIY=
X-Google-Smtp-Source: ACHHUZ4HQ8nm3POZqJ0DmhNQPity9dUWPiwy5DrVMia0WSQEfmrcqGF0baIfP6K8PEO1PMzoifNcOw==
X-Received: by 2002:a17:902:7e84:b0:1a6:f755:a4a0 with SMTP id z4-20020a1709027e8400b001a6f755a4a0mr19604683pla.58.1683824508009;
        Thu, 11 May 2023 10:01:48 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-94-72.dynamic-ip.hinet.net. [36.228.94.72])
        by smtp.gmail.com with ESMTPSA id r7-20020a170902be0700b001ab0083c6c9sm6156240pls.261.2023.05.11.10.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 10:01:47 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: Min-Hua Chen <minhuadotchen@gmail.com>,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARC: rename 16KSTACKS to DEBUG_STACKS
Date: Fri, 12 May 2023 01:01:39 +0800
Message-Id: <20230511170139.343434-3-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230511170139.343434-1-minhuadotchen@gmail.com>
References: <20230511170139.343434-1-minhuadotchen@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_100151_109913_9E06A7EA 
X-CRM114-Status: GOOD (  13.30  )
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

Rename 16KSTACKS to DEBUG_STACKS.

arch/arc/Kconfig.debug says that the default stack size is 8KB
and it will become 16KB stack if 16KSTACKS is set.

However, the stack size is based on PAGE_SIZE, and it is
configurable by CONFIG_ARC_PAGE_SIZE_16K or CONFIG_ARC_PAGE_SIZE_4K.

See arch/arc/include/uapi/asm/page.h:
/* PAGE_SHIFT determines the page size */
\#if defined(CONFIG_ARC_PAGE_SIZE_16K)
\#define PAGE_SHIFT 14
\#elif defined(CONFIG_ARC_PAGE_SIZE_4K)
\#define PAGE_SHIFT 12
\#else
\#define PAGE_SHIFT 13
\#endif

See arch/arc/include/asm/thread_info.h:
\#ifdef CONFIG_DEBUG_STACKS
\#define THREAD_SIZE_ORDER 1
\#else
\#define THREAD_SIZE_ORDER 0
\#endif

\#define THREAD_SIZE     (PAGE_SIZE << THREAD_SIZE_ORDER)
\#define THREAD_SHIFT	(PAGE_SHIFT + THREAD_SIZE_ORDER)

To make CONFIG_16KSTACKS less confusing, rename it to DEBUG_STACKS
(as it is defined in Kconfig.debug) and modify the Kconfig
description. No functional changes intended.

Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>
---
 arch/arc/Kconfig.debug             | 7 ++++---
 arch/arc/include/asm/thread_info.h | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arc/Kconfig.debug b/arch/arc/Kconfig.debug
index 45add86decd5..9a1e140605c4 100644
--- a/arch/arc/Kconfig.debug
+++ b/arch/arc/Kconfig.debug
@@ -1,10 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0
 
-config 16KSTACKS
-	bool "Use 16Kb for kernel stacks instead of 8Kb"
+config DEBUG_STACKS
+	bool "Use double sized kernel stacks"
 	help
-	  If you say Y here the kernel will use a  16Kb stacksize for the
+	  If you say Y here the kernel will use a double sized stack for the
 	  kernel stack attached to each process/thread. The default is 8K.
+	  (depends on CONFIG_ARC_PAGE_SIZE_16K or CONFIG_ARC_PAGE_SIZE_4K)
 	  This increases the resident kernel footprint and will cause less
 	  threads to run on the system and also increase the pressure
 	  on the VM subsystem for higher order allocations.
diff --git a/arch/arc/include/asm/thread_info.h b/arch/arc/include/asm/thread_info.h
index 9f9dd021501c..a7358d1225a6 100644
--- a/arch/arc/include/asm/thread_info.h
+++ b/arch/arc/include/asm/thread_info.h
@@ -15,7 +15,7 @@
 
 #include <asm/page.h>
 
-#ifdef CONFIG_16KSTACKS
+#ifdef CONFIG_DEBUG_STACKS
 #define THREAD_SIZE_ORDER 1
 #else
 #define THREAD_SIZE_ORDER 0
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
