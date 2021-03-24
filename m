Return-Path: <SRS0=H19V=IW=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A12EC433C1
	for <linux-snps-arc@archiver.kernel.org>; Wed, 24 Mar 2021 05:50:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB479619EB
	for <linux-snps-arc@archiver.kernel.org>; Wed, 24 Mar 2021 05:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB479619EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mV8xRybVZC4zHMt/egTpkdJPb/QMRIT8EDHmU5eMWhs=; b=D1H07/ReizLX7GkUPeq8Gsld7z
	g2YN75yFIJMqWKsMQ5E7I6ngme9oK/5eGc3LKANfKG2C2U32Z7O+X8rNM39rpSDg23L581ZTbN8VH
	gM3FSSJ7C4AN/FjLs10grb0q6twbX2QIBgKZ6m3iJQlgOy7IlLZ7myu1PZPOhXINVcMmK5D2U/nuW
	L2vnBIwC6pBBg+0pt+xorbEPO49xiD7WhZl2BOgPof7aZg4xce8x+yp0W0oVCKGR6/MHbkAPz8zFd
	Zxr+YI2lowGmr0Y2kTccwhO01wUseJyUdQ24rOIdGhCldzOtYmQC5d0s2j2v3rxUScQnY/qyk44XY
	Pykvs4jg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOwPe-00GMEM-Af; Wed, 24 Mar 2021 05:50:38 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOwPa-00GMCl-R9
 for linux-snps-arc@lists.infradead.org; Wed, 24 Mar 2021 05:50:36 +0000
Received: by mail-qk1-x729.google.com with SMTP id g20so16955579qkk.1
 for <linux-snps-arc@lists.infradead.org>; Tue, 23 Mar 2021 22:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BDOEV3CitODtZE7WDhEdTJHsluYHKAtRONfq9xlx6BQ=;
 b=s74wFrrEGz/q6vkAjL8f7SdfQIBhW5AhGz8c2LZf3KQI7qfZkHH0+LW0tR/7pC9o6J
 qGZT0KdV0CcRVzTqwUQyYh6+DweyIGeq7UP/1JRqcbqnwCDzJPwhW/sz+kMlUHpT/duh
 Q56PKx8SpHON51LEbVBCywy0Z4btXJv30rpvfyNtPXzDJsrd3APq/9EB+NxsfhKpost1
 ylJWwtRaO9AJo7wm3AqYICMbRAP705X0Nn4gNdfYW4Z4a1AFWKsN6zpfOPToDkFf8gW+
 EjOiRoJcVzo4v2yc314qajXtQxXB+qYLx0mezfbNnceGv9kWyghOjVoc1aPvbIFJ7e77
 uFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BDOEV3CitODtZE7WDhEdTJHsluYHKAtRONfq9xlx6BQ=;
 b=Az+qcEGgHaJRRI3kbPMsczQpRcmtxmMwwRkxDOfJGhI1kHqT+lF22DxIprjydogh1A
 4jYOQHbRy98sO0EEJSSwvRvO0+2Iu3XBpfVaByD4bqhL9q7blu6Vv26uI97r3q93IMKb
 9EmIGQ3m5CmcYcBFs55Rc9/vInwlJ9yZD6zxi7/rwnn+oPOy9jyNYVv56NEjC7Yp63Z+
 vSscr2qoTGHnqLZcw8KP9Z/4pw/fYQ/K7Y1bX/mhMmnUbhjnazAGA5iQGhbnfE/de9H1
 4CRdhYsDBu8RmZ7ZWyBkS9c1iYY+SvNG1XWafmz/AR3rMXKcvmXzzq3ec61pj9/MHOQ/
 SUiw==
X-Gm-Message-State: AOAM532bSsuJhvWt7U/ly24RUO+UcbR0DJ6+vAGqG5sY5cbaulDfhjmU
 sev/hZbTSJBm0LJwwy/pocA=
X-Google-Smtp-Source: ABdhPJz6BqyCSyPEz0sCmomXzRl2cUSO2ljw6xdMw1m9ARzA+ptI1XOskiBfVr7171eUNxO1Gt23zg==
X-Received: by 2002:a37:c92:: with SMTP id 140mr1551385qkm.177.1616565032253; 
 Tue, 23 Mar 2021 22:50:32 -0700 (PDT)
Received: from Slackware.localdomain ([156.146.37.194])
 by smtp.gmail.com with ESMTPSA id z8sm830676qtn.12.2021.03.23.22.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 22:50:31 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: vgupta@synopsys.com, axboe@kernel.dk, gustavoars@kernel.org,
 unixbhaskar@gmail.com, tglx@linutronix.de,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: rdunlap@infradead.org
Subject: [PATCH] arc/kernel/signal.c: Fix couple of typos
Date: Wed, 24 Mar 2021 11:22:13 +0530
Message-Id: <20210324055213.26775-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_055035_035537_D0CE8FAE 
X-CRM114-Status: GOOD (  10.82  )
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


s/unconditonally/unconditionally/
s/gaurantees/guarantees/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 arch/arc/kernel/signal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/kernel/signal.c b/arch/arc/kernel/signal.c
index a78d8f745a67..cf1788fd3812 100644
--- a/arch/arc/kernel/signal.c
+++ b/arch/arc/kernel/signal.c
@@ -259,7 +259,7 @@ setup_rt_frame(struct ksignal *ksig, sigset_t *set, struct pt_regs *regs)
 		regs->r2 = (unsigned long)&sf->uc;

 		/*
-		 * small optim to avoid unconditonally calling do_sigaltstack
+		 * small optim to avoid unconditionally calling do_sigaltstack
 		 * in sigreturn path, now that we only have rt_sigreturn
 		 */
 		magic = MAGIC_SIGALTSTK;
@@ -391,7 +391,7 @@ void do_signal(struct pt_regs *regs)
 void do_notify_resume(struct pt_regs *regs)
 {
 	/*
-	 * ASM glue gaurantees that this is only called when returning to
+	 * ASM glue guarantees that this is only called when returning to
 	 * user mode
 	 */
 	if (test_thread_flag(TIF_NOTIFY_RESUME))
--
2.30.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
