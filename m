Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6131FC433FE
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Feb 2022 14:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MgPE8W3McjMcvAR0xWtULOOBtXy4mKJJ4TbHxgd7HUM=; b=KEOvLQXmaiD+PY
	Ejm4R2iTIUnRtwB66AbTcnHJjaSxEsFbo/jUQRVeu/p5zcrTPYkjjUvIqpaFDqLcflTUDBOUbYSzS
	pSS7aZt8w8am3FN38z/Mwperf3r1p0zBhcMHZ9mJVwx3JZwqli+5KFUV9KNspVSshXG1csABAB4l+
	IqvzFKIlNKzLPXEfeoA2rSGzH36rXIfDu++sfuP91LtPd78WQQ2Ph0iw+9mSQ2vMIkdj3z0mP6i1e
	stAeXBrGW7n/DLaiSqJIXzaMOGlgDzSCOUZJRc1Q/6RLpEHcOxKPmVqOhe2/aj3kZPcG5DzofjACM
	NelRXKgvxzlXoMSEIezA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMVwq-009qU2-PI; Tue, 22 Feb 2022 14:15:24 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMVwm-009qOX-Ma
 for linux-snps-arc@lists.infradead.org; Tue, 22 Feb 2022 14:15:22 +0000
Received: by mail-lj1-x234.google.com with SMTP id 29so10055085ljv.10
 for <linux-snps-arc@lists.infradead.org>; Tue, 22 Feb 2022 06:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DhKcmFlLBs3GUKBJiCy8mo8MJVs1mw/WvkUvZ7xfLnY=;
 b=K3ChC0VeViygBvP+fFxDit5E5puNGgXUgv/Lakr3ZKh8Sp/+mJY9NSGWZ/ZfMQcoRo
 l9JPeLCnYr+tGqBOyuEzDE2DlQlUplrIoRK7IMF0yySk/kgA06wiYrcaP4HgNH6u1UA6
 iZ5FTfBBGCj7FJVVNyGtYTVHRFaZyL0hXGviTacPR7DA9+TzJKox/+dKe9iw1zioGSLS
 Lnd4YUUWPDV9AdhQg5bse8RwPEEzj4KHjNO82eqwwBhvOvxEol5eduq1m2N0vYiQOWbW
 Z3PrcQU+ehRo0cY/C3uBWs3SfJFkZ3CcLwBhNOrd10VisPCHZFl6DEj5LZCD450omOkX
 /MAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DhKcmFlLBs3GUKBJiCy8mo8MJVs1mw/WvkUvZ7xfLnY=;
 b=OXUDYP2V0DjkaYPvf0paWHLxzxtrH+bLUrkb5jFlaju2LRFx678uHz7/I/A8YcjECj
 GGiSBIqqKAIIv0upZ1UnHFJmGCtG0zRJw/42e1TJPms1FyXRVfAvDtPh281I+N4JvIcq
 zNhKbPp2cXE07/M6KIiEaaHZ2sHv27vtnBNfQSGCGoWKuV4uwtPWs4W7CwDsHKEEY83p
 d9GKGJYc4KV+Ua5tD4wr247nF/u9ZS4SxHyRxfHsP7qQRuR+nX/KRv+weJ7BbZYYGhY6
 VqiyrImiPCjNyBVLpL7e2AxbSVXfBC77At71d6GIDaXhpKt4Y+V+rg05kuxAwarn5JLL
 aH1g==
X-Gm-Message-State: AOAM530kKlTV9pCAJ8ZeuyHxCVOv9pHjcNCZSORThp9ULWdUaVVMsQdI
 lBjWt1XWM1rRsJ6l7AySIfzkskGGIc8=
X-Google-Smtp-Source: ABdhPJyO2Q50O7gG2y8Ocv9hdoDtt1y46m97W7a4pjgz97nGpupVBcKuewDqhtUMtDxXaQQatlFq0A==
X-Received: by 2002:a2e:8744:0:b0:23b:9301:cbda with SMTP id
 q4-20020a2e8744000000b0023b9301cbdamr17096137ljj.385.1645539318590; 
 Tue, 22 Feb 2022 06:15:18 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id m8sm1707047ljb.131.2022.02.22.06.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:15:18 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [RFC PATCH 03/13] ARC: uaccess: drop CC_OPTIMIZE_FOR_SIZE
Date: Tue, 22 Feb 2022 17:14:56 +0300
Message-Id: <20220222141506.4003433-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222141506.4003433-1-geomatsi@gmail.com>
References: <20220222141506.4003433-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_061520_766989_15F5D8EA 
X-CRM114-Status: GOOD (  10.24  )
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

Currently ARC uses CC_OPTIMIZE_FOR_PERFORMANCE_O3, which excludes
CC_OPTIMIZE_FOR_SIZE. So drop unused define branch.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/uaccess.h | 11 ++---------
 arch/arc/mm/extable.c          | 11 -----------
 2 files changed, 2 insertions(+), 20 deletions(-)

diff --git a/arch/arc/include/asm/uaccess.h b/arch/arc/include/asm/uaccess.h
index d78aae76831f..9b009e64e79c 100644
--- a/arch/arc/include/asm/uaccess.h
+++ b/arch/arc/include/asm/uaccess.h
@@ -615,7 +615,7 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 	return res;
 }
 
-static inline unsigned long __arc_clear_user(void __user *to, unsigned long n)
+static inline unsigned long __clear_user(void __user *to, unsigned long n)
 {
 	long res = n;
 	unsigned char *d_char = to;
@@ -657,17 +657,10 @@ static inline unsigned long __arc_clear_user(void __user *to, unsigned long n)
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
+#define __clear_user		__clear_user
 
 #include <asm/segment.h>
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
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
