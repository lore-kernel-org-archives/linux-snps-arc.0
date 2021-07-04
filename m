Return-Path: <SRS0=w0ag=L4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76895C07E95
	for <linux-snps-arc@archiver.kernel.org>; Sun,  4 Jul 2021 09:28:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EED3613DD
	for <linux-snps-arc@archiver.kernel.org>; Sun,  4 Jul 2021 09:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EED3613DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OvoFuF5mgwrbI9PQVZJyzpe8HzVCif2JuqqGNLitwWo=; b=O+FeO9U1ymL8zX
	SfJm91esJSpltVacXbRoYQH6FNKpaRWQ/6biZkvMwjWZ9FJ0U72CMjE3LsukUrjQQ1qnAvP4Tfovj
	9FHRvth9vDGRa9439hGmVK/a5wmE3xdIyfxi5eofptJ7ckv5+xABjXlxMhqcocz1MAJ4FFuC2HET7
	/1jKsFuy9eO8FQLweUhNJhW6EDgNJtMSJt+Nz0A+2mKF19UKmTQAqX6f4KO8OY7t3hw3Md8LDJH0E
	Acfi0+lJKYkyXeOTHKuW7ypZYMweUbNgUberz8A6uDs/VKWY/X+vrDVNjX6Q/bP2QMYOvwyITvrBb
	QmpMp+/jAcdp0CvG7wug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzyQU-0067yC-Lv; Sun, 04 Jul 2021 09:28:34 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzyQP-0067ws-3K
 for linux-snps-arc@lists.infradead.org; Sun, 04 Jul 2021 09:28:34 +0000
Received: from cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net
 ([80.193.200.194] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <colin.king@canonical.com>)
 id 1lzyQK-00068Y-RY; Sun, 04 Jul 2021 09:28:24 +0000
From: Colin King <colin.king@canonical.com>
To: Vineet Gupta <vgupta@synopsys.com>,
	linux-snps-arc@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arc: Fix spelling mistake and grammar in Kconfig
Date: Sun,  4 Jul 2021 10:28:24 +0100
Message-Id: <20210704092824.34886-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_022829_188747_BDBAF494 
X-CRM114-Status: UNSURE (   9.14  )
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

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake and incorrect grammar in the Kconfig
text. Fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/arc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index d8f51eb8963b..b5bf68e74732 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -409,7 +409,7 @@ choice
 	help
 	  Depending on the configuration, CPU can contain DSP registers
 	  (ACC0_GLO, ACC0_GHI, DSP_BFLY0, DSP_CTRL, DSP_FFT_CTRL).
-	  Bellow is options describing how to handle these registers in
+	  Below are options describing how to handle these registers in
 	  interrupt entry / exit and in context switch.
 
 config ARC_DSP_NONE
-- 
2.31.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
