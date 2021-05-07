Return-Path: <SRS0=Ca3q=KC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5140DC43461
	for <linux-snps-arc@archiver.kernel.org>; Fri,  7 May 2021 00:44:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9F28613B9
	for <linux-snps-arc@archiver.kernel.org>; Fri,  7 May 2021 00:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9F28613B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q+NVlqZ+YoxSDvZj10CiLFU7hbw/uri2UQDCq771vRM=; b=IsNzdY2TP0fdRPOYERpyrsTA4
	v7uqDLSgykGXtchO1SE1E1WXvSOMthM/hivH8ewlJiBNoJ2I7TZYFaO2SVE2gkeTGOHCv4KeoPlfb
	P3kGcEQ65sCgtiKlcabKLRpOedwLlSFp8DY3uJOzEYOzdNhDgKa46rlVKF6xsojtsPAPkNDDOtIYk
	gk0u3C5QnhkxIRjlRi+BS2XgTdfD+92IBcgCbMlJXjU57tKCdoxa8g7NRMrYNumBiJQ5YiiBV7era
	eAfxNBwncwoufqJJrYWJp+6bcTXAGEO/JUpKPf2QsqiF5Yp4hyUlH71mnmvQLJifao60DFH0jYzc8
	LZufCihOA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leob3-005gAL-RH; Fri, 07 May 2021 00:44:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leoaz-005g9f-Vx
 for linux-snps-arc@desiato.infradead.org; Fri, 07 May 2021 00:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=hkoNcjqNwmvKWKkd2meUUnsd706LTEeSVsKtb7cbrc8=; b=CFuamvB2Q75pcD3KgeU97+wXTW
 UokRu6gI64zV/2WAjv9DDoDu/EskNflORVY1s/ukaSAS+6QFkaUALxoVXM+QCmyWdX4ktKfGgSZHq
 1pDSqJYjE2nMCkthCDp8gM0hzUBMRmJtgatZJKDMFG6Dbj6kN9gb7KMRL9+aN70k5xQFa/Aotm4Us
 rG41kiWGpT438czXupGj0ZnqTRiB1QTT4TYEhmaF1b296d+I2JC1K7UqlBWyQ65eeywpnmEOT+ZO8
 IMRwutRrKgxTw+C99PoQlB5QWEmV4wN8Op2b/r12v0SXGCA3yz1n5lVqOI4hNKTTvsr/wOseXDqNG
 bsBEzfLw==;
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leoaw-006Tn6-Db
 for linux-snps-arc@lists.infradead.org; Fri, 07 May 2021 00:43:55 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 402D54061D;
 Fri,  7 May 2021 00:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1620348228; bh=h8RZwhGA97sOkuZjkJQVk8XVzCDV2S3w7+ZgvV8Is64=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZSadKf9phXJE3Uql0af8RMX3YClM6rnz49Bpb6IBUSS5DUPftKXBOIV6za2SUvRuc
 IALd6Uez4bQu9jAMuvjXyWbNTlr7GdrTc7cUyDusv7hegpmVO0yNkFw6m9P75yJKkE
 mnV3MXX1Viex7+XTZ7wYC5TFEgY4g1YWgNwA70tYiPhPEr7yE+nLVbSpN4iY10tQLE
 GxbDOBMkD1qmVF5B4fjRoBoyw5mkM6BJYSKCUJ4XO6CKRETlNwWRF9NqNlvtyTTH0o
 ugGUWDEpZ0bfSn2C8P5QmnoCrGTf0IXI9bDI6pSYDEuUXGUu2iStkiujL4d4/6SFWl
 P8tXrQnUopBIg==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.202.19.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 04F00A0066;
 Fri,  7 May 2021 00:43:47 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Cc: Alexey.Brodkin@synopsys.com, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH v2 3/3] lmbench: emulate --prefix to avoid scattering binaries
 all over
Date: Thu,  6 May 2021 17:43:44 -0700
Message-Id: <20210507004344.3166099-4-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210507004344.3166099-1-vgupta@synopsys.com>
References: <20210507004344.3166099-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_174354_508089_C3189B75 
X-CRM114-Status: UNSURE (   8.21  )
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
index 2f3b19b5f820..ed075d20dafe 100644
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
+	echo "echo ${ARCH}" >  $(TARGET_DIR)/lmbench/scripts/os
 endef
 
 $(eval $(generic-package))
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
