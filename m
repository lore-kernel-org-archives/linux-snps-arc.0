Return-Path: <SRS0=vbRU=2H=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791B5C43603
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Dec 2019 21:33:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 491ED21582
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Dec 2019 21:33:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sL8TSRMH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="P5gbq236"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 491ED21582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1sOvG2FCJcxhaKwULr4VzkVDW6uIx/8UL6Xj5ZXMxfw=; b=sL8TSRMHQHSejF
	E0bdqQ+kaLT+5ZNtWLF/cH2oMiOSJFUfjjwJL6CcCpcq5KOX2hMeYX5+LarY7WuHIxowb7E9QyTdd
	r0lGP+vR8Lgr31LjA8dTaPPIl2lra4z4dAezCN7ahfbwT2aYYYGUSWVsPqgE6lMKj2s9c5AV2x3U9
	i7vzIdMhADyUIiuV7QdUpY0+tCnWtUA9jj6Uv45MHKk4fEI63ynvKQS8cmfcWVh+Nw6HJuKfxnuji
	MXGKtEZJRE98NPXi5UmMoR1f6R5HGm+dRpVzHO2qhb5Ytc/kSTFylaPW04QPYHAYmf6Xn//asBUmu
	ZunrUopYgpLiNMjt0e7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihKSv-0001pq-BW; Tue, 17 Dec 2019 21:33:13 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihKSs-0001oV-4t
 for linux-snps-arc@lists.infradead.org; Tue, 17 Dec 2019 21:33:11 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6D7D7C0D56;
 Tue, 17 Dec 2019 21:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1576618386; bh=sl/yvkUlFLOYC8x8h8mPUlePWN1Jg0rhMmftLgn9W6Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P5gbq236RCA+IXtt1+MBkE+5DIjxgr3OSZ9AxOnDpCGFFp+Wo6cgvuc5ZIEhX4MBP
 nI+S9gtoBCRvQvTfcAwd+QenKF+5VQsCWyf7ebVkb/yQr5iKv33zCIgwZLP7LV1jEz
 npZRTQOXp1jJeqoz7YDFu899x12L8dyOwNEiGMIj7FhLWT9GaaexVtGzkjYmifaf5W
 heq0B3fpw5PYbs0NHiC4MoccdWMGIlUfq2rR3TgfG7+RkGTXbU/ZX5eK4W9C7N1dx9
 Zocfy8XZKp5mUtjxaEGuZoOc9QHpeU+DP9G4blMfoeODRWY/0lDf0mxWfSCHlA1V7Y
 4HRuOVLqT1+Kg==
Received: from vineetg-Latitude-E7450.internal.synopsys.com (unknown
 [10.13.182.230])
 by mailhost.synopsys.com (Postfix) with ESMTP id 1D58DA0083;
 Tue, 17 Dec 2019 21:32:59 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Subject: [PATCH v2] binutils/ARC: cleanup
Date: Tue, 17 Dec 2019 13:32:53 -0800
Message-Id: <20191217213253.12446-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191206221918.1c05e316@windsurf.home>
References: <20191206221918.1c05e316@windsurf.home>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191217_133310_225093_B26D29DD 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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
Cc: Evgeniy.Didin@synopsys.com, linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, Alexey.Brodkin@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Remove special handling for ARC - as it is not needed for cksy etc.

A nice side benefit is that the ARC specific version now only needs to
be specified in single place (vs 3 currently) in binutils/Config.in.host

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 package/binutils/binutils.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index a19d6940f7c1..3ae5561d67d3 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -8,14 +8,10 @@
 # If not, we do like other packages
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
-ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2019.09-rc1
-else
 BINUTILS_VERSION = 2.32
 endif
-endif # BINUTILS_VERSION
 
-ifeq ($(BINUTILS_VERSION),arc-2019.09-rc1)
+ifeq ($(BR2_BINUTILS_VERSION_ARC),y)
 BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
 BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
