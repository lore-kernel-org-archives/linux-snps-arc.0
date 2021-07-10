Return-Path: <SRS0=A5Dw=MC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5101C07E95
	for <linux-snps-arc@archiver.kernel.org>; Sat, 10 Jul 2021 14:50:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2606F61353
	for <linux-snps-arc@archiver.kernel.org>; Sat, 10 Jul 2021 14:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2606F61353
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=96bl8HCuTh39RrR9TWGhtLE3Gqyg1IhCLJ5wvvV1s20=; b=WKyzPhKU/jMJYZ
	9thxY4rJIgTujr7WU+hTyC+vhACDg6qMIeOX6RqWVZFx69QeUhS77gr1Qq+vI2oqwG8DtmvT9KgN2
	8ldjEH3Tl7dFcOkdOtoDTK1GJb1BPHzo7jZD6Gt9UQ9sPIrJdWTCP+dm91J3qIiW92yvha1KMRf6Y
	pIQKOuc31X/osVuXgEGYSL1zrbs+2N8dlKBGrJLOHbzO3P6xmOXAxyjH0pvEE+WR0SXzHbg5wmCDh
	pkSqg/OHi5M51JTtbFBrIwzPFPaWRAZIa5DJjyAnzHybqezSRjr8C4D59ACoDXZQJ+fHT9FxIpoWX
	4QLU6m4zjUZ9b1XUZrHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2EJX-003lFg-Ez; Sat, 10 Jul 2021 14:50:43 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2EJS-003lFF-T5
 for linux-snps-arc@lists.infradead.org; Sat, 10 Jul 2021 14:50:42 +0000
Received: by mail-ot1-x32d.google.com with SMTP id
 j10-20020a05683015cab02904b568e08dccso6643882otr.4
 for <linux-snps-arc@lists.infradead.org>; Sat, 10 Jul 2021 07:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lbla4VodnreXg6/dXZ6FxtjQ2ib4Axn3SfhOGkpK3dE=;
 b=TbL8L6jCrFrzJuliPGfBgIP2hh0f6nZkAkrCveeK/sgO2Qh50bFG93sKXuKMASFV2r
 DtjcTKnL96GegkQmDWbihMJevUthNsPsKf9dpDD1lAWyc520VDg+i2J0/4gfYtCMSsWR
 Hs2QejuaLZYZS3gxTwAAN4NsCi2YklPvyK2GAl+ie+i5p2fgBHeANxrZ4/y4olmCYbHH
 3cofa13uS54DWpA1i2rAA1eqiZuaNmN+3xhJ9LQAskhsBqOlhABamBEPrb2GJdSP6OKT
 23tVzD4Fgvl0vbzXFi0FNDzE5OuEnAMOd8NqwBVtbL59bcpeyRARg2VKtCtvIo8mzFTq
 +mRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Lbla4VodnreXg6/dXZ6FxtjQ2ib4Axn3SfhOGkpK3dE=;
 b=AVOJc/kdWZiydshDIPGnKh+y29xqNCQu8+6+kVD3uxT1NR63AYxVS6g4jq835D9+zt
 IxxbSY+Xo8HGKoY+Ffo9yncsSV53003DEWbPuIHeyZ+jUV32DBbLXya1n6xm8iGpKW4h
 4xhO0ZN7EtuvgpZFS9p2eohZeIcZ/FRlMZhLbTf6IarRouWh6Vo52HHu2WPqAEAG/GSy
 Kx3/sqgp+zXqrG4R9yxYuC7WyNnFRJFygNhzOJbvzqXcDHcg4i7fSg5i/mnjVowbMSu2
 iJ+Yrx280NjKyraDFrkgo8sFXO1XJOwCdcH6HqAi94xUGyYtitj80lrEYKfAD7mbvKDr
 CC4g==
X-Gm-Message-State: AOAM530ec/E7nKffzuoO8SCcnOPC6HSETTzYi299Eku3MT5KfSY5/fpX
 fRrII6+TYD/W3mqDUMYmIxk=
X-Google-Smtp-Source: ABdhPJyQCFtZ3Zsfh/AJ4TSgYomNTaXy4VMlBBqR8/YMOE68IgvjN1NAGWWbA4MV/JRD/igjn07NBQ==
X-Received: by 2002:a9d:2f0:: with SMTP id 103mr32533721otl.174.1625928637724; 
 Sat, 10 Jul 2021 07:50:37 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id n20sm1822663otj.11.2021.07.10.07.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 07:50:37 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Vineet Gupta <vgupta@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] ARC: Fix CONFIG_STACKDEPOT
Date: Sat, 10 Jul 2021 07:50:33 -0700
Message-Id: <20210710145033.2804047-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_075038_983131_2C575719 
X-CRM114-Status: UNSURE (   8.73  )
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

Enabling CONFIG_STACKDEPOT results in the following build error.

arc-elf-ld: lib/stackdepot.o: in function `filter_irq_stacks':
stackdepot.c:(.text+0x456): undefined reference to `__irqentry_text_start'
arc-elf-ld: stackdepot.c:(.text+0x456): undefined reference to `__irqentry_text_start'
arc-elf-ld: stackdepot.c:(.text+0x476): undefined reference to `__irqentry_text_end'
arc-elf-ld: stackdepot.c:(.text+0x476): undefined reference to `__irqentry_text_end'
arc-elf-ld: stackdepot.c:(.text+0x484): undefined reference to `__softirqentry_text_start'
arc-elf-ld: stackdepot.c:(.text+0x484): undefined reference to `__softirqentry_text_start'
arc-elf-ld: stackdepot.c:(.text+0x48c): undefined reference to `__softirqentry_text_end'
arc-elf-ld: stackdepot.c:(.text+0x48c): undefined reference to `__softirqentry_text_end'

Other architectures address this problem by adding IRQENTRY_TEXT and
SOFTIRQENTRY_TEXT to the text segment, so do the same here.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/arc/kernel/vmlinux.lds.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arc/kernel/vmlinux.lds.S b/arch/arc/kernel/vmlinux.lds.S
index e2146a8da195..529ae50f9fe2 100644
--- a/arch/arc/kernel/vmlinux.lds.S
+++ b/arch/arc/kernel/vmlinux.lds.S
@@ -88,6 +88,8 @@ SECTIONS
 		CPUIDLE_TEXT
 		LOCK_TEXT
 		KPROBES_TEXT
+		IRQENTRY_TEXT
+		SOFTIRQENTRY_TEXT
 		*(.fixup)
 		*(.gnu.warning)
 	}
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
