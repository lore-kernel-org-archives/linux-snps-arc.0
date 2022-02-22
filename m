Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C6AC4321E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Feb 2022 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/TSuoFxojpoC9URKQuD+ngbISqKKKRIQgeE+AcTrhBE=; b=uT5oKqx6Pj3U0m
	6KcpfjpuT3lAD/8DSKibnssNWowZ7wEIqzL68VVXYxZ7sgCeGBgd27SJlN968q+EUjO+v10AdwZxy
	RV0Dp4Sscfz27mJmjSwj69y9RevLZsTvrr0Vg1jHJvoa+/NOTmCKeB8HSuNgi0pNRM37fItPj3EnW
	tl1Fob9yCVmoNQNFN1x1xAu0LaAKVFj66s3pPBLsipNs1xOK3pLRHhaX8bnnS0SbZjOAWufkPF47H
	na3/FUlpviqTvdlMxZykdq+mv5xfbDDY5IG/aFeHcUf6IDUhFD/SzNMSHS4G7diKB7C3KKkKBcQBG
	gPZuvN/Na2yMGRyCt+cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMVx9-009qiD-R3; Tue, 22 Feb 2022 14:15:43 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMVwr-009qTk-7j
 for linux-snps-arc@lists.infradead.org; Tue, 22 Feb 2022 14:15:30 +0000
Received: by mail-lj1-x234.google.com with SMTP id o6so19769628ljp.3
 for <linux-snps-arc@lists.infradead.org>; Tue, 22 Feb 2022 06:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hUTYKvccuj4IaJsEO4evB8LuXdmLKUIPnuyh4uCrZoA=;
 b=hRMqRnBmTbiJBrlMrDN5MLCvU7Rz4Y6OSeqG0dH67wuKJcXNpefarjFlRHFru8/DNX
 NEd76nzfFR2TbFmo2ZKpy9Bsp/DLCXVnCVdfxTAIwnFp+YefzN3O38ks67KyV2DfT2es
 j5C3XDwXx7sOxr4YwrwkMSNMIXVOWJsYHQwH1qmcS2EhdcY4wHw8J73zMvGIKi4pmyp/
 jslRt/NHc2jnqBRgVXaWswB1ADXd4yRjuRSLY+JeB+R+Ko+gK15t6K8zC/JussEeiRku
 Tn/KqvYXJF4JiSrqXyLxJmIvid41WqH5a0yEHQZ4AyXEVi8wUUbYLm6+sRdkZl9RB0zZ
 0mgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hUTYKvccuj4IaJsEO4evB8LuXdmLKUIPnuyh4uCrZoA=;
 b=JdIXBUhyDlHMwbKOKAmgwtlb1K7vZM+V7YZuAKBimsd9iSw6IQG6OsR3nOnpvbQLXz
 Tzh/MJYtmPjfTy26EaoQsO9FhTTNvkJwh9gjznWDHJFJy76kncZNrw2tDO3N0P5402E8
 UVtgjvjeA6hsV5tJfi97ASUGXXY+d5YBKuNDtsyNz+jpHPVGRfj+NR5YYUe/T3K148su
 GpvMaj1UaIMFS32vXgrNkw293PAHYfpuo31J2OFpOicyIp4I9xdXDKprRYsEUIFLD75P
 mwOENnJ3rXN0O/PgyFDSesHcTdTlbQSoicTryUjbGzG5LPU0h4NLFJbj+vYAcCtbRmcG
 1ifA==
X-Gm-Message-State: AOAM531o4RqXCCqFh4qKh01UlWnDM4Nv+sdCGqd/kbj85QiloHmswgRr
 46Perq3ZpATmtI6RKTLlmFEkSsfpvOo=
X-Google-Smtp-Source: ABdhPJyUt0VoWL+8vNcto2x5HFGOSXGC6bQfMx5wwXXuWf2lD8ejvEEJjJ4UgGCgXs8VuyNeVGaHkQ==
X-Received: by 2002:a05:651c:386:b0:246:c7e:bb1e with SMTP id
 e6-20020a05651c038600b002460c7ebb1emr17871650ljp.161.1645539323491; 
 Tue, 22 Feb 2022 06:15:23 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id m8sm1707047ljb.131.2022.02.22.06.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:15:23 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [RFC PATCH 09/13] ARC: delay: elide ZOL
Date: Tue, 22 Feb 2022 17:15:02 +0300
Message-Id: <20220222141506.4003433-10-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222141506.4003433-1-geomatsi@gmail.com>
References: <20220222141506.4003433-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_061525_359606_7B8293BD 
X-CRM114-Status: GOOD (  10.34  )
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

Add __delay implementation based on DBNZ if ZOL is not supported.

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/delay.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arc/include/asm/delay.h b/arch/arc/include/asm/delay.h
index 54db798f0aa0..e061d1c64f24 100644
--- a/arch/arc/include/asm/delay.h
+++ b/arch/arc/include/asm/delay.h
@@ -16,9 +16,12 @@
 
 #include <asm-generic/types.h>
 #include <asm/param.h>		/* HZ */
+#include <asm/assembler.h>
 
 extern unsigned long loops_per_jiffy;
 
+#ifndef CONFIG_ARC_LACKS_ZOL
+
 static inline void __delay(unsigned long loops)
 {
 	__asm__ __volatile__(
@@ -31,6 +34,19 @@ static inline void __delay(unsigned long loops)
         : "lp_count");
 }
 
+#else
+
+static inline void __delay(unsigned long loops)
+{
+	__asm__ __volatile__(
+	"	add   %0, %0, 1         \n"
+	"1:	nop			\n"
+	"	DBNZR %0, 1b		\n"
+	: "+r"(loops));
+}
+
+#endif
+
 extern void __bad_udelay(void);
 
 /*
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
