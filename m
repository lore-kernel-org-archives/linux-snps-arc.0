Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0057C433FE
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Feb 2022 14:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EWTkBBbVaof3Cj8O92oA8DgWil2Jf1K9k8ooiNplSJM=; b=uvtAtxls4jSm9b
	q/Y3tuIuLtKkDWoKQejoPC2AMnp4axeewYyU6/6ZGsfogFWZ8vR19xgj2/bXQD8aX92lehn6A3uaR
	RRsvRW3MRLFDP/sgFlj3swFZhV9PmbTs8zccKHxf8NqjewUOvfhLU84rdYYLddRJu64/wcZpdmd05
	DC2mHy4r6O/4G2JGuP7VEovMJfiddJtkH0cWrGOHIGW4u/0/1C0Rk4Hqr0FWQhWDcO2l5ahtxEuVs
	pKrH0vyUT6YRILE6gHXHeBcdr6zVZZcn7gf30octxz7D1Sw2aT+3EuAOO7ilSvEXtEnsNARY+rvkE
	+O7eO47DrAIxtDv48qvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMVwn-009qQ0-4i; Tue, 22 Feb 2022 14:15:21 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMVwk-009qNL-RW
 for linux-snps-arc@lists.infradead.org; Tue, 22 Feb 2022 14:15:20 +0000
Received: by mail-lj1-x230.google.com with SMTP id e8so11832589ljj.2
 for <linux-snps-arc@lists.infradead.org>; Tue, 22 Feb 2022 06:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nNDBdisa/TLOGSosCELu4ZRjB7zLuJIQ9whsDdCu9ng=;
 b=jL3CgO3wnlm3K0u/XxQiUczmpsa8YIHQIw15DfXo2kIQ6jp7g3FiCCaSL94nAHsvQM
 CHI7ONFOJ/lCaceU3wxQlF7D28zgtlmB/r++Pga46aOPqBC3OYUCtmtNG8YfHq3Wn6mq
 d9lZgOwayBp4E/ea3E+cwidLYgKKMnI444tOsAadHOUxXoNemeUvX4qngziuXhUfE7Lp
 YHyvtMgsJzhBfEITIoe7Xj7SQpz1ip3r4u/SPQkCbj5DkhErbJY8+26fmm3sHCo4Ujdz
 sSYm670pUa1sz6IoFUN4HniUmeeh0D2ntJduNuDNkB12Kcl/eajLd1M66vN4+Q19QS43
 xTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nNDBdisa/TLOGSosCELu4ZRjB7zLuJIQ9whsDdCu9ng=;
 b=mS/gtu9ehFLauPjPS3BXl2DICJMxvppXXOmWWdHkms8nuN+OvKDSMa25gwJThe613F
 z03ewyWP9RZ/VCFt0zlJ6PnQ548KuzjGjLLaJWMkyMqK4q2WbKIR9eLkH5nHmRrK2VSV
 wYFZzN4I6DHdKLNbrEOUMq1vKiO+caddfCFkIzLzZV/yKxcF7KqauFffKYA3seXzllyI
 0vaGlEPBsJMG5joqivaK5CNgJoy2eeg1c/lew6qRFinjyGeMov0ZLp/0Ov1anviyk0NB
 Aq6coIP+qfzkg4fu706r2zCypNHTHbXpWL+v8aqlSisQJl54ltODe8YqlguH0TE+S6JA
 f+Tw==
X-Gm-Message-State: AOAM530iDvjr3qwCT3iZqHRVN+lMZZgvBmpFCq+hdjTITyHSlg3sMCNB
 KBWaPoUcxElO9TMN1f8mL/nNn9qqZrI=
X-Google-Smtp-Source: ABdhPJznEGsWAxcHrH6ZnQ4JpR8Gq57w2A/iAST8T5dNefuJtJjcPLs5njNNyj+C3YIuUe1vt//n/g==
X-Received: by 2002:a2e:87d0:0:b0:244:c691:854c with SMTP id
 v16-20020a2e87d0000000b00244c691854cmr17582179ljj.62.1645539316518; 
 Tue, 22 Feb 2022 06:15:16 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id m8sm1707047ljb.131.2022.02.22.06.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 06:15:16 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Vladimir Isaev <isaev@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>
Subject: [RFC PATCH 01/13] ARC: uaccess: elide unaligned handling if hardware
 supports
Date: Tue, 22 Feb 2022 17:14:54 +0300
Message-Id: <20220222141506.4003433-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222141506.4003433-1-geomatsi@gmail.com>
References: <20220222141506.4003433-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_061518_914794_448BAFAD 
X-CRM114-Status: GOOD (  12.60  )
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

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/include/asm/uaccess.h | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arc/include/asm/uaccess.h b/arch/arc/include/asm/uaccess.h
index 783bfdb3bfa3..d78aae76831f 100644
--- a/arch/arc/include/asm/uaccess.h
+++ b/arch/arc/include/asm/uaccess.h
@@ -175,8 +175,9 @@ raw_copy_from_user(void *to, const void __user *from, unsigned long n)
 	if (n == 0)
 		return 0;
 
-	/* unaligned */
-	if (((unsigned long)to & 0x3) || ((unsigned long)from & 0x3)) {
+	/* fallback for unaligned access when hardware doesn't support */
+	if (!IS_ENABLED(CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS) &&
+	     (((unsigned long)to & 0x3) || ((unsigned long)from & 0x3))) {
 
 		unsigned char tmp;
 
@@ -402,8 +403,9 @@ raw_copy_to_user(void __user *to, const void *from, unsigned long n)
 	if (n == 0)
 		return 0;
 
-	/* unaligned */
-	if (((unsigned long)to & 0x3) || ((unsigned long)from & 0x3)) {
+	/* fallback for unaligned access when hardware doesn't support */
+	if (!IS_ENABLED(CONFIG_ARC_USE_UNALIGNED_MEM_ACCESS) &&
+	     (((unsigned long)to & 0x3) || ((unsigned long)from & 0x3))) {
 
 		unsigned char tmp;
 
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
