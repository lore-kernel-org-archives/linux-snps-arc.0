Return-Path: <SRS0=C+4U=KF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CECBC433ED
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 18:06:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 040EC611C2
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 18:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 040EC611C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q+NVlqZ+YoxSDvZj10CiLFU7hbw/uri2UQDCq771vRM=; b=UbhRUrivyxtOOUuYsG+CRlxpB
	0uEVY4OxJZHF5LkZAYMxT8n1qFVcPjtUA5aL/cY8IKG7xH+iQM4hciFUTX1PLke3OCyiz/iJNP9fa
	TrCzFs3jlDHhOFWqx10ByJ7NSa1Bkk19AjWn/ISOmA5IoV0Teg4FLl/9fkoTiWyi0+5VtlC9JcTzc
	y5QTvVbDjYXBO6LJJfZ2HhKVadE1S7htXUIPOOYLISUYgGLTD+CytqarMHh8uvvsfUJShsc8DZlA9
	NXTkgrl0akhdEygavnCUbClj27rOcRFV7t2ym4+nILEc2Ii6dAvMjHeiyrdr7uDq3iXpqsoDcrqyk
	5q7lC0yeQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgAIc-00FMlr-UM; Mon, 10 May 2021 18:06:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgADJ-00FKoy-Vg
 for linux-snps-arc@desiato.infradead.org; Mon, 10 May 2021 18:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=hkoNcjqNwmvKWKkd2meUUnsd706LTEeSVsKtb7cbrc8=; b=mdwIdwtfrK3UMmh7d+RQtCExBr
 /iwskiwJNWFXg8jQDeaZHaMNMIoHlO18dfsYIsB9+mX9IzNGFPaWB/rSXja2YDEbkR+T18sCXMP6Z
 Ccea0mhLfoosruT5iQoOIO28QVRS4Jvh8MqNOXjVNMCA9l6WF+cS537i39OqY6pot4MIAqo3+9CcF
 cnWeU3aju83V/YxdheCucjpsC6cRCE1wrYS//2j/jDU4fs1QWGiIWeODUcqZbyzsWP9C60y+bSeKA
 XqycowREqJShRll2MxjJdGVrGnOBZrQpqEtdeFbMYlw6X0FAoyvVtqifZ3K0XkcyAyU+PIOytNGKp
 r3uLqKEg==;
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgADF-0090zC-Mi
 for linux-snps-arc@lists.infradead.org; Mon, 10 May 2021 18:01:04 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7F2EBC0080;
 Mon, 10 May 2021 18:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1620669656; bh=h8RZwhGA97sOkuZjkJQVk8XVzCDV2S3w7+ZgvV8Is64=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GmGWGfwkLcq7GJI1AB2anNgLbIVbaww2YZtsLukuBtu308I/C2cyd8ano8LYKd093
 ar2IfjJSHu7OhoqckRwnpz/MoeLT2nGyvGXAEhVTHo2RCGLSCLX2Y6w0/gT8sNnpz7
 5byJFFpeOIoF0Jg1Ir4Wcs/DACVxLsrl3Sp4la5jcrnk6hKDL7Y8O5b+iRhCji1nFH
 URl+Bs+JDmxodMkLl4QQlRQ87CvYsiL4nmTnwVcQgCQflXFehFSsO+Y35+8MxU2lDm
 QALGJpEGRTmxs+OtTscUqGamC9kOQ3a5C5L+24vQt8ERttClQaSsgU8r827Zs4wJK5
 ryiclewb/WxAQ==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.202.19.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 0370BA0067;
 Mon, 10 May 2021 18:00:55 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Cc: Alexey.Brodkin@synopsys.com, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH v3 3/4] lmbench: emulate --prefix to avoid scattering binaries
 all over
Date: Mon, 10 May 2021 11:00:48 -0700
Message-Id: <20210510180049.61421-5-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510180049.61421-1-vgupta@synopsys.com>
References: <20210510180049.61421-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_110101_805072_9EE8C183 
X-CRM114-Status: UNSURE (   8.64  )
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
