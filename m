Return-Path: <SRS0=jMKj=P5=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED1AC433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 10 Nov 2021 05:56:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A15760240
	for <linux-snps-arc@archiver.kernel.org>; Wed, 10 Nov 2021 05:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A15760240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PdEYf0HX7WFpzNfGAWVbG7CytJro/csoQuwos6GXLxc=; b=hSmPdmhj7EgWf5
	AN8m98TEMREhvSUi+VweIPdQTzcTbXADul2oTDm8wexKTQoZ1Z6AyfVF5qEgAqs/38D0xgNaIN40y
	rtKfbcoaZRaWGHhWkOnIpXFlP7nHfYUx4jLEEkecdDcGkn3TEu+W2Cih7kambAxgfR23DtqbQGsgX
	wBLqMPh7FU5uGtnVY5xustwnkc0XzEnQXCBMHlII220Lt84s6YiGmc+S3mlIFzSBaa4rZKAKbJhVq
	lCgdQfDFdZ3H9uAVo/XykoWIYvlgACU4dOCEf5Ur3yawAz72+2oOPq/R8buBm1A4OgjpoUcFQe4Y+
	af/p/kFpM1jZGq2xz3Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkgah-004WYE-36; Wed, 10 Nov 2021 05:56:11 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkgac-004WWb-T6
 for linux-snps-arc@lists.infradead.org; Wed, 10 Nov 2021 05:56:09 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 o6-20020a17090a0a0600b001a64b9a11aeso706776pjo.3
 for <linux-snps-arc@lists.infradead.org>; Tue, 09 Nov 2021 21:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c9xw6yStoEfjNF/k/c5MSuaBqDAKe3MzsJwqL/ZdYgc=;
 b=XlQVpXP5KFDNPVOZeglwkgCyknPZBl3oT7RZ1fVhOkxWg5a3gb+QtthfUsGOrkkxVj
 zRlNlZd7mCGzlmrZT+TulVMkBx/3iuHdvvWvfBHnlLk4EbZmgPH+oFgtBivGlpO981x2
 ytw7RyD8PAuzcfuKkG6t9zobJgBGh4e4PQVyE4pmAU+heGqcZhlDEr+gNPXssCEsbUow
 eZV8NzHXGrHpXruAS48J8qQRfhgISkQvZtR89q3cUrAjv3+xiQmkOYvtSqfEPAzMrLWn
 g9VTlS8d0u1NwobesDguiBSCrO9a66syJypi+UYDZQjgQ8sCVAu6lSIOSxjPQzSVb98B
 UUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c9xw6yStoEfjNF/k/c5MSuaBqDAKe3MzsJwqL/ZdYgc=;
 b=I43S71zYgUL4MgrRzBdmawxNozocf+XowV/RW1QVokzGvTRHaVVUSqOyIrJnvPrtZ6
 FXXeP7Ak4G+D38Yw5iwCpeKslYAMEWFVXxAefg0K7+RWMNxhIIEgHcA6iQgfTu8XFKZj
 pWq4OeeMqzn4sn0iUkAzblpJOokJgqy0tjSHn/GQNoJl/AnSfqJj4X7Ox8r5xurrLbsB
 PWctPbOtvXmsai/cdnChjmKx0FLLmItxhFhXNSUtc2vmMaEgA0SOu2pou5q8lU2RrZs6
 QkHRmyod8B9aIUiaWc/Z4n1XoRv/CeMMbaL/4iamVFeYoATpFGTqLja3xDElVegZv6hn
 uHQQ==
X-Gm-Message-State: AOAM531DjSlvAWFKkLAJMQikdsapLNnkXcaimYK4httkVAVkaUuUdcp1
 yCpW+on8D1bOQ5SIGDNmsX4=
X-Google-Smtp-Source: ABdhPJz0c2CtPUQNTmZOFwIt15jaN5bVclSWRFjEanbxNjbhmANpafrdj1T9Z4DwTQZv0PvVl5TCQA==
X-Received: by 2002:a17:90b:4a83:: with SMTP id
 lp3mr14134601pjb.242.1636523766394; 
 Tue, 09 Nov 2021 21:56:06 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id b1sm17504691pff.89.2021.11.09.21.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 21:56:06 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.guojin@zte.com.cn
To: vgupta@kernel.org
Cc: ye.guojin@zte.com.cn, yangdianqing@yulong.com, wjc@cdjrlc.com,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] ARC: dw2 unwind: use swap() to make code cleaner
Date: Wed, 10 Nov 2021 05:56:02 +0000
Message-Id: <20211110055602.136926-1-ye.guojin@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_215606_993397_57406C66 
X-CRM114-Status: GOOD (  10.36  )
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

From: Ye Guojin <ye.guojin@zte.com.cn>

This was found by coccicheck:
./arch/arc/kernel/unwind.c, 251, 22-23, WARNING opportunity for swap()
./arch/arc/kernel/unwind.c, 254, 18-19, WARNING opportunity for swap()

Addtionally, adjust the sequence of header files to be arranged in
alphabetical order.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Ye Guojin <ye.guojin@zte.com.cn>
---
 arch/arc/kernel/unwind.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 9e28058cdba8..ea795304982a 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -10,17 +10,18 @@
  * is not much point in implementing the full Dwarf2 unwind API.
  */
 
-#include <linux/sched.h>
-#include <linux/module.h>
+#include <asm/sections.h>
+#include <asm/unaligned.h>
+#include <asm/unwind.h>
 #include <linux/memblock.h>
-#include <linux/sort.h>
+#include <linux/minmax.h>
+#include <linux/module.h>
+#include <linux/ptrace.h>
+#include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/sort.h>
 #include <linux/stop_machine.h>
 #include <linux/uaccess.h>
-#include <linux/ptrace.h>
-#include <asm/sections.h>
-#include <asm/unaligned.h>
-#include <asm/unwind.h>
 
 extern char __start_unwind[], __end_unwind[];
 /* extern const u8 __start_unwind_hdr[], __end_unwind_hdr[];*/
@@ -245,14 +246,9 @@ static void swap_eh_frame_hdr_table_entries(void *p1, void *p2, int size)
 {
 	struct eh_frame_hdr_table_entry *e1 = p1;
 	struct eh_frame_hdr_table_entry *e2 = p2;
-	unsigned long v;
-
-	v = e1->start;
-	e1->start = e2->start;
-	e2->start = v;
-	v = e1->fde;
-	e1->fde = e2->fde;
-	e2->fde = v;
+
+	swap(e1->start, e2->start);
+	swap(e1->fde, e2->fde);
 }
 
 static void init_unwind_hdr(struct unwind_table *table,
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
