Return-Path: <SRS0=IDKR=KB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 210B5C433B4
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 May 2021 00:40:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3827613EB
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 May 2021 00:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3827613EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f/3U7XoOqDGYgYq+gnnhtBPkWKGcKt7VHp4Z+31y8xY=; b=PGQ0O4DJyFFKmwZGNRN3BybPE
	NgJbsVqsZMOETS45gCA7x6EUcCry+x5XAcPn+Wt2dF2Kr2JbWGhQmQTvQHA6xZTNCz1evd5i1lcHo
	0zm8ZaD4YG5uWfHiecJBUToNP7W/EOGmbY7dm/hxxN/Db7W60tSJklfumSbxHf03ojuJMZ4rq+PQ/
	+f5UnolDIeSDDlDae/X8boPaJ/CgGKJsR54yBuvF4sF7eHd4UT8jqx8dZ+Da4FNv5q7HafKkdPh7Y
	IPVL0UPePdEx0dL60MkpE4s+LkWZXR/tK+BjoLbgakVLSWrsKrb+Bs8x2KDlhQ2o3VOThPip/htq1
	BeKpsdkWQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leS3t-002jl0-1I; Thu, 06 May 2021 00:40:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leS3h-002jiC-E6
 for linux-snps-arc@desiato.infradead.org; Thu, 06 May 2021 00:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=YPLQrNy8CyhNLoqzp7rktymXW/B+RAEcpufCRpxihN8=; b=UAT0b619WZO/ZFHmiOg89Hmrje
 Kl4GjhH+CbAZ2pnSi7aBOKkByAQy1HSw7l5N8vO6+J0KAf3BXoaSDqlxz5b0eKD1YhDQEz0aGBUvG
 uXjXn9hSjeP+egR8FDmSuIpTl4TfEzCJRCf7RLd273QsTzoQ2K3cHqaO0v0RLXfVXvrUHx0BAGIDh
 RMWPsU029kXXv3Vk+lSbUUdptQ+WA8WR+lT0L2dpxXheozadNDfDxvryQgIg61AKmSngRTapmVWQG
 7SJCJ0+QuXklcLYMq/lGYWqSLuzdmilUySri2tEI1jG7pzsLpeYKTIZNTMf7ZhrNVM3sUATBCTETy
 tTcSHcNg==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leS3e-005Rg2-DA
 for linux-snps-arc@lists.infradead.org; Thu, 06 May 2021 00:40:04 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6F528402B9;
 Thu,  6 May 2021 00:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1620261601; bh=Ir0FdWMXEia84Joc3fcz9s9LsqIQboDkbTSnYy0oFQA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SjsPxQn/AQMqbODLoRhZdPTLZfMcNIcCf5BniRuPd/VxgJpfRIXH7r2CHQZNMcMBO
 hcqzIf0Sq/HcnDTiYTAm65Q24OXS9ym9FwObmfOMGinHnaX6dXI6+trB/gIBauSXz5
 Y+vvlbN7u2qGM9jQfrAgo3VLe5prCbSZocGiO/mFr045A2l/xbDaIcwwfoDwWsrDdc
 Q46hgUQYmhph1B+lhOEeA73dAeEiRkFcbe/coYiSu0vdcRh6EnmQ6zoKh9orCo2jlw
 9iWr82SuxSM5ygzNmWOT0vuAHk9WcCtGaPbFK0lONqfXpCVlywcwWtAbFGzHwA5a0x
 SINSPDqCQ/h9Q==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.202.19.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 1B916A025A;
 Thu,  6 May 2021 00:40:00 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Cc: Alexey.Brodkin@synopsys.com, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 3/3] lmbench: emulate --prefix to avoid scattering binaries
 all over
Date: Wed,  5 May 2021 17:39:57 -0700
Message-Id: <20210506003957.2994235-4-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506003957.2994235-1-vgupta@synopsys.com>
References: <20210506003957.2994235-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_174002_463224_40E5966B 
X-CRM114-Status: UNSURE (   8.41  )
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

 - moves all lmbench binaries to <target>/lmbench/bin/<ARCH>
 - scripts copied to <target>/lmbench/scripts
 - scripts/os overwritten to setup "OS" as expected by LMBench runtime scripts

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 package/lmbench/lmbench.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 2f3b19b5f820..be6b3170099a 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -36,7 +36,14 @@ define LMBENCH_BUILD_CMDS
 endef
 
 define LMBENCH_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) CFLAGS="$(TARGET_CFLAGS)" OS=$(ARCH) CC="$(TARGET_CC)" BASE=$(TARGET_DIR)/usr -C $(@D)/src install
+	mkdir -p $(TARGET_DIR)/lmbench/tmp
+	mkdir -p $(TARGET_DIR)/lmbench/scripts
+	$(TARGET_MAKE_ENV) $(MAKE) CFLAGS="$(TARGET_CFLAGS)" OS=$(ARCH) CC="$(TARGET_CC)" BASE=$(TARGET_DIR)/lmbench/tmp -C $(@D)/src install
+	mkdir -p $(TARGET_DIR)/lmbench/bin/$(ARCH)
+	mv $(TARGET_DIR)/lmbench/tmp/bin/* $(TARGET_DIR)/lmbench/bin/$(ARCH)
+	rm -rf $(TARGET_DIR)/lmbench/tmp/
+	cp -rfd $(@D)/scripts/ $(TARGET_DIR)/lmbench/.
+	echo "export OS=${ARCH}" >  $(TARGET_DIR)/lmbench/scripts/os
 endef
 
 $(eval $(generic-package))
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
