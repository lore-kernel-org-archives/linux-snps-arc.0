Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B72C77B7A
	for <linux-snps-arc@archiver.kernel.org>; Thu, 25 May 2023 16:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z9mjMD48SEwABhvqSrLIr6kDZ9y6+tUvXhJQLPKdEDU=; b=T9jjSFQTsW/c9C
	LS4ivyXeG4u1W6tvhxgAQMVhCeQGdr3f0RBpt0qsFidQNlSdOiExR8BOBxWiw/lV7Qjo7C6lyyijZ
	ipdOQ8DzSwaLfXINm+98rCsmcK2cwZMM5I+XzQhSU7MOv2TgD6Bykj+5T+7eiVzSa3blB/myW0uEm
	0gRyXCvbzBtjYC9ktJOoGlVXAZFXxkfTzVrXXhu4H4uah9W2uvu9bM9mYbwghm01IPvRzh1W58/9y
	Kv6gkBsRDnbZ2xLt/Fqffhz3Cv1VIvH2g2kG7meRWISeDEFx6eqrWQkXoH7ACxosw/AasvtoAYaTG
	36ULweLwBFPF5pu1Bsgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2DVv-00H3Rw-0j;
	Thu, 25 May 2023 16:08:31 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2DVs-00H3Pp-07
	for linux-snps-arc@lists.infradead.org;
	Thu, 25 May 2023 16:08:29 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-51b33c72686so1237981a12.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 25 May 2023 09:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685030904; x=1687622904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f10B5ZIa9ITmPIMb+u+qs6/5+yRXx2vTTGWyb6FapHI=;
        b=j4k12bcqw1DZL7kzBgVq5yAW/945ZHX3GZezjaJBksDYmnZ+djZe6tAJRtfc2rCNd4
         LA2FPd9+VYvLe1kuYuZ2tCKzBtVSI8a/OfcOQ4S5Yt7+urECSd06+8xHd9WCUyScw392
         JafNrWXyz4HToplkXg+A475yLr5ytuiAkqpf7zo4dJwWY43Mdvl29PRtiKnTyYDnPP6r
         tW0xlmG/yK1qquV0+z/YJTP65mIMMrHrdbkY3+Jmu3Zdx5TbFXGTraCWAOESfPciF5KH
         MXAzmp7+eGuqZ9YKr4gOjDMF8iVCJOo2upNhlFxxFrlDFjVzjEO9CUU1/MO89ICsJQho
         tqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685030904; x=1687622904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f10B5ZIa9ITmPIMb+u+qs6/5+yRXx2vTTGWyb6FapHI=;
        b=GtfV7SSuknKwELbn3aOREyrpusLKY9r19CP6rHsb95RpoT+gC5/rlgexRiwvnQX4T6
         8I7/G9b3yGyxhKCuIAIs9efK3Pu1C876u6e0lhmIEf5uNso8TsHAI+tvqQyhPGkc1j3d
         IchZ2GfnVf1SOhuUNFYLzDvYPd+QgfT0LlTtSHu3MxBTtgzPVf/ljtrV30AdDvsazQ3j
         1YsX5Y4z5LOi4kwlcSF3YbNj1y4/hg61N0juwTqabeKkmFmeAkA6TZ3RlXmHcr5bGMw6
         f8VSt+KepUTfhrblGMcGx17X14Qndb4bTZExZladlt1ZDOybZSVsu9A8fsioxHr8kAIY
         7c4Q==
X-Gm-Message-State: AC+VfDx/ImiXLqbGkrUXRnZYmiQfjSa0VNDBNlVInBrpMFBYQ7DkxAY9
	HTm1Ya1tnPRiB8rodQvln5DEbypqBqg=
X-Google-Smtp-Source: ACHHUZ7BKJzUagaWoCZc5fUsRZnu5bnzIJTF9ZG7dnZ12jM5KiLtEtnsQDi59PS0Evp48sZLFX8c3A==
X-Received: by 2002:a17:903:430f:b0:1ac:874d:f55e with SMTP id jz15-20020a170903430f00b001ac874df55emr2063949plb.22.1685030904226;
        Thu, 25 May 2023 09:08:24 -0700 (PDT)
Received: from ubuntu777.domain.name (36-228-81-153.dynamic-ip.hinet.net. [36.228.81.153])
        by smtp.gmail.com with ESMTPSA id s3-20020a170902a50300b001ab12ccc2a7sm1611450plq.98.2023.05.25.09.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 09:08:23 -0700 (PDT)
From: Min-Hua Chen <minhuadotchen@gmail.com>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Min-Hua Chen <minhuadotchen@gmail.com>
Subject: [RESEND PATCH 2/2] ARC: rename 16KSTACKS to DEBUG_STACKS
Date: Fri, 26 May 2023 00:08:12 +0800
Message-Id: <20230525160813.39408-3-minhuadotchen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230525160813.39408-1-minhuadotchen@gmail.com>
References: <20230525160813.39408-1-minhuadotchen@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_090828_071357_5E91CEE9 
X-CRM114-Status: GOOD (  13.72  )
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
When CONFIG_16KSTACKS=y:

PAGE_SHIFT==12 => THREAD_SIZE == (1 << (12 + 1)) = 8KB
PAGE_SHIFT==13 => THREAD_SIZE == (1 << (13 + 1)) = 16KB
PAGE_SHIFT==14 => THREAD_SIZE == (1 << (14 + 1)) = 32KB

We get correct 16KB stack only when PAGE_SHIFT is 13.

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
