Return-Path: <SRS0=fDo5=CX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9AEC43461
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Sep 2020 11:48:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D53321741
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Sep 2020 11:48:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L5BsO2JA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uQ1qKJad"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D53321741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BXDzHnuJDi5BR/J7e9W6nKPpXKk99KF9ry+5Dd8caQg=; b=L5BsO2JA/z4BtHnHUvk8/S54nL
	DQaq5g5knb1zXd2zx7msY3cvHs5O89rPuaaVfAPlQP/JE+36HiXTfaRWhly5wByHjECpwHSBHezr/
	FGYVCMEdljKQzuL1d8LeunUsRXll7BYJeb4ORw1rmIrenSeZnZCtK69zZvrD++6ppo5L2JIdc42k2
	as2YuC7o4qjZOrL4ajoRwkoAZQ3owKbbg5eogqjq0Z4bWIJS0z7Lzreu1EB9hw+53e3uOmuL40QIP
	9uwt3icDUEFF/Yi9T+E22zB71Kpvve/K//EYT+jpxNbUNhFrCtII1AkqHFuvnfK0qQr3xMzoVUUQH
	QtPvgpIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHmyH-0007IE-Mv; Mon, 14 Sep 2020 11:48:33 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHmyF-0007HU-JR
 for linux-snps-arc@lists.infradead.org; Mon, 14 Sep 2020 11:48:32 +0000
Received: by mail-wm1-x342.google.com with SMTP id w2so10325125wmi.1
 for <linux-snps-arc@lists.infradead.org>; Mon, 14 Sep 2020 04:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/AhZpyl4i8SQbKTfnwUmt0Ow0fuH1tW4/N+hsM5LmxE=;
 b=uQ1qKJad6ONK2I9zSeCcW3EcuegrfA6TyzXNGCTxig1ojMO7caJmoTtZX9hKjIIvTq
 zaDXW+gCx02cq8ouVNbnIdSuT0ggNDM4WOv3HbxnWj5O/dhOuD7xFLDeLSwPOBUFTaHG
 CIviKGRX+tMLG+918/sRR/NB7g9KcUz/A/0zr89RABUZgQZbRxewuBdqGPoMBqNqPndY
 8pllDuTyin0iDBXfW73KJB+5ycfqri0Pt4x07/+sntU2E4FbdtZkHodWtGP9v7WHm9DV
 B9sD1RJPz07Hhr4dEWF0lJICUGCWaDoitOokaNC2Mj2Jje/vlJ4p/mqrptwoS/x9J7Ad
 WzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/AhZpyl4i8SQbKTfnwUmt0Ow0fuH1tW4/N+hsM5LmxE=;
 b=HETCDvI2qjn1sD7zdVdrWmHSkdDDZIw5kLVgBBaRFgOHJVHnjQgKbsYlsW9jsh2Mu9
 XdxG1HF+f+h9JivL782Zw13npX9hoC03Fg759QfgT4LULZbirtpi4Iwbl2iC1yQoauGw
 szJwD2iaLMKiU5JaFFVD1yr+MzpIyHMBylRzIukkiEyg1Y0sGc23LMGoa93u5paKkj87
 hc+9aTt2BQjmbZrkppBZOhu4l9rq1IZRAYsjaCwmQ0DiSmicnsty0kJK9hEp2IsVXl+3
 +p3Q+GufqvwocIx9dtNqq8rH9sSeSyFMTKwFgTJHRsh/JMtSIvyNPYXx0Wlhg4JWclCH
 Q7sQ==
X-Gm-Message-State: AOAM531nX3OkvIp4hRTciIqGT5U2BIjQAsvJd2S2JNaQVmoTgaSoaaW7
 fa6L6Dtyndab1Vd2Sc+d6LY=
X-Google-Smtp-Source: ABdhPJz+eFLzDlLT9CFvpFwHsIvzE/DQK8WtHAzFn7XOfw8a0cH14LOzIF3aFVv99HP4D4XNOv9zPw==
X-Received: by 2002:a1c:96:: with SMTP id 144mr14662074wma.84.1600084109563;
 Mon, 14 Sep 2020 04:48:29 -0700 (PDT)
Received: from localhost.localdomain ([85.153.229.188])
 by smtp.gmail.com with ESMTPSA id 9sm18535063wmf.7.2020.09.14.04.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 04:48:28 -0700 (PDT)
From: Necip Fazil Yildiran <fazilyildiran@gmail.com>
To: vgupta@synopsys.com
Subject: [PATCH] arc: plat-hsdk: fix kconfig dependency warning when
 !RESET_CONTROLLER
Date: Mon, 14 Sep 2020 14:46:52 +0300
Message-Id: <20200914114651.105219-1-fazilyildiran@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_074831_671488_AA075A61 
X-CRM114-Status: GOOD (  10.55  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: paul@pgazz.com, Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 linux-snps-arc@lists.infradead.org, jeho@cs.utexas.edu,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

When ARC_SOC_HSDK is enabled and RESET_CONTROLLER is disabled, it results
in the following Kbuild warning:

WARNING: unmet direct dependencies detected for RESET_HSDK
  Depends on [n]: RESET_CONTROLLER [=n] && HAS_IOMEM [=y] && (ARC_SOC_HSDK [=y] || COMPILE_TEST [=n])
  Selected by [y]:
  - ARC_SOC_HSDK [=y] && ISA_ARCV2 [=y]

The reason is that ARC_SOC_HSDK selects RESET_HSDK without depending on or
selecting RESET_CONTROLLER while RESET_HSDK is subordinate to
RESET_CONTROLLER.

Honor the kconfig menu hierarchy to remove kconfig dependency warnings.

Fixes: a528629dfd3b ("ARC: [plat-hsdk] select CONFIG_RESET_HSDK from Kconfig")
Signed-off-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>
---
 arch/arc/plat-hsdk/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/plat-hsdk/Kconfig b/arch/arc/plat-hsdk/Kconfig
index ce8101834518..6b5c54576f54 100644
--- a/arch/arc/plat-hsdk/Kconfig
+++ b/arch/arc/plat-hsdk/Kconfig
@@ -8,5 +8,6 @@ menuconfig ARC_SOC_HSDK
 	select ARC_HAS_ACCL_REGS
 	select ARC_IRQ_NO_AUTOSAVE
 	select CLK_HSDK
+	select RESET_CONTROLLER
 	select RESET_HSDK
 	select HAVE_PCI
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
