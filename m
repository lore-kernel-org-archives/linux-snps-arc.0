Return-Path: <SRS0=RmAe=IU=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BEB5C433DB
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 Mar 2021 12:28:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 035156198B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 22 Mar 2021 12:28:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 035156198B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TZkrEeyS1RoEMG/Vn3d1SrQMkyBUkokpiE1bcbyRIZs=; b=XU7S0HmbshM1tEgR4x2Fx6lnlS
	HxX9QZ4ESI9+tEO87Se9Itc7gUhLO5IdbhOwk4dgog7k9oVcAnzdbHktvEuSvM7XQTgdzLUdtSTX/
	hOcbF8AIsHpj888nJQcN+uqh43W69bs1IfurBxG66zRSZVRNiNNGNUhv2ZRVW83euQMrGrX6rDotK
	gUROTY8fEVdLWVhWevQAV5C9DEY4V47vEFmexe2qRIX4ZPM9zr8RlEKUkTjFXtCrOVdKHJ9iaAPe4
	XbqCBpiFYKsIwhYxTh5TLEFaXA6fdo9RGLaBG88UkEsRhqlrZ9kHNuU7KTJDkFdkiEBQ6o0EXQx2R
	Ikn+Ir4A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOJfg-00BaG3-5H; Mon, 22 Mar 2021 12:28:36 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOJfc-00BaF5-Hm
 for linux-snps-arc@lists.infradead.org; Mon, 22 Mar 2021 12:28:34 +0000
Received: by mail-qt1-x829.google.com with SMTP id c6so12116191qtc.1
 for <linux-snps-arc@lists.infradead.org>; Mon, 22 Mar 2021 05:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vGeujgLiCOmPS0n6saoq+FGBAGBFECX5N0Yzgj/oqfM=;
 b=fefLSd2hOcSUaWBKCAWohN7ObKf7dc29tcV4nCLi3hov+C+0oFlp88QNPCNPTsTDYC
 D1eKMEmYt+uyQZcePrirOdC86YiwRag1ALR1aaghS6uVlzlBtZsJaU25OwD0HxsvT0VN
 NMGtM/aL8+oTPeoe2D83y8G9j3KkPa0mi/L7lCS8I5ZhTaVaV2PcxClr83oXsi7KcBpo
 WwtEH3F9SFplf9x9ADipCv5vwvJHaCWcG7dp6uufDxlCaaBJUw0Bj23espcEj8ybqYAW
 aG+6xV74VXhNYx14ie861CvkY2rtcIFEytfLJ12Y5xeNIKAS6n13Djy6vpcTYyQECfK3
 OkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vGeujgLiCOmPS0n6saoq+FGBAGBFECX5N0Yzgj/oqfM=;
 b=OOkOWx56s13nMU9fDD5RMUON8j0/KbM/LGJJwVQ87mK1QZZHP5JebD4VZOomQdbafx
 em7NqeP09s/8YUDayfswWTVXVQnkCnr5W/ywwnBX4OY9xEraRqKTkc0kQKL0vTkpLwMF
 zLwzHdz68k+orQJMy4sarpZSdNINKLBA3sKTwFrGGLXfonSOFdnHFNTyEhmrR80rGM81
 QHuQHgt6V5Bq+Fo05UnJJnuL37sduqXrnOWtE9ZBcccekVFazJl2PkLIhcIn8XWHWloh
 T0hQrxr7JCMSqw4KUtlQzb7NrgbkwckckKqEbKUhCty5gFufe+KHRAh1spxPIyu1gKxm
 XMeg==
X-Gm-Message-State: AOAM531xrmk3htaWznb8GY6p5nw3hv0rnM9Cx2Oy9DJFJ6sVByrV08WE
 iOEULI98caxifV4CrvUD5gA=
X-Google-Smtp-Source: ABdhPJz/qxCTRMstWrnwXc8n9foSSLckGAg4dOoqWPFBQOesadn5JMLsR+FIj30Z4nwIlhyk3Qrinw==
X-Received: by 2002:ac8:7352:: with SMTP id q18mr9257500qtp.65.1616416111431; 
 Mon, 22 Mar 2021 05:28:31 -0700 (PDT)
Received: from localhost.localdomain ([143.244.44.200])
 by smtp.gmail.com with ESMTPSA id u11sm8600784qta.91.2021.03.22.05.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 05:28:30 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: vgupta@synopsys.com, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: rdunlap@infradead.org,
	Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] arch: arc: Fix a typo
Date: Mon, 22 Mar 2021 17:58:19 +0530
Message-Id: <20210322122819.2704169-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_122832_959557_B75E5CF5 
X-CRM114-Status: GOOD (  10.38  )
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


s/defintion/definition/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 arch/arc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 4392c9c189c4..e47adc97a89b 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -31,7 +31,7 @@ endif


 ifdef CONFIG_ARC_CURR_IN_REG
-# For a global register defintion, make sure it gets passed to every file
+# For a global register definition, make sure it gets passed to every file
 # We had a customer reported bug where some code built in kernel was NOT using
 # any kernel headers, and missing the r25 global register
 # Can't do unconditionally because of recursive include issues
--
2.31.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
