Return-Path: <SRS0=C+4U=KF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE534C433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 18:06:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47027611AB
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 18:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47027611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SHTYZMO7yxWHeW/9rUesTdoHKpMkIYDPSnr9J3pMorc=; b=CamdvySZc9efKeDYWPagbWqvG
	CTjaz6nBF2seW0gnZ4oqg6WCHW24+kZm1t22dHV1is7IFgEl+QpRAtavV95vZU6JhHyKQzuvQ9Yoh
	ab/g+6iNi+MS+RRpuSgNl8oAFFxwnd3WuE6HkNAvmKbpYKfRmsOYZxy2wIIXqJAd7767YYdnRTikp
	doDrC7PE7Uy+pyNNAVz3CX0pj6t9zTh4Zmtqtttmkh8xHEA0ikaqwZqRwmsTYvYQiN6dpGVXyA7hY
	MB8Qfu0TEhYi0lFJh9VjQdYvkUEcNAQIw8dj6xxZjC24CCDDN78/aCJvIOQbqw5t7hRYoxqNaOa1K
	5BD22Zzsw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgAIi-00FMoP-Nt; Mon, 10 May 2021 18:06:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgADL-00FKpa-4e
 for linux-snps-arc@desiato.infradead.org; Mon, 10 May 2021 18:01:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=rNr6W5TsWJjAOJgektoq3pMeUI9XXQMp/DawTawItd8=; b=ubHkxPW84Dpv1SfDcu0aOWjkvW
 arIFzUVuVEKLcg9RuzKhyoCpEc3eifZibC0Fw9A2N09rZlzVHPcm06j+jFuAC31HppWNfb1+sTQz5
 v/yD6lBFVF7q9b4+Ka2PQ5QXpYhFhgO6yuRoDZKdiduGE9dLNKUm7h8mlhLocmXO/FNvNy/xFYxEz
 H8wlntWc+5F/+yn4P1ietrv2haSLDaM+N4HAn3bjF49VN4DbnJB5hQrh4z1mKZPehDMQipor2/w/y
 +lhiJ+qlBcgdOqCHFaPSG5A3wZwzOAJTH9UidwdP+lcSr0JJUyF8oUzO/tiXKkgDSFyG6IwPYEgfs
 LEyeKNbQ==;
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgADG-0090zG-1y
 for linux-snps-arc@lists.infradead.org; Mon, 10 May 2021 18:01:05 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 2C24FC0091;
 Mon, 10 May 2021 18:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1620669657; bh=jir7YrjasNYDZzIrUrY2enWpleBT+NftT9aERptsK0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b5amuuEfanvqc0Flx2v2G3wrqasC33zimXZzoE1ugI1rA3jkmjgtmtSf/MDpTGNJ6
 XSuyopIzt6vZQdVsJ8BdnuZiwspRAcotsf37Y1eAxpL+d+wTWNeIceKJjNt3Hl+PIc
 oXOiGnfOP8VswbICeCPAIQWMTvdnRh83b6mRTcy26qNaF5p7iA5xC1Cp9hzBzEBh2B
 gdbnMGYkYDjG7XWBLoJwPn6wtHYhwzSGtSkCw6Kmw6jPMe62MiOZBK4NgQnGVNpdiS
 uG8gVlL1sDNqa0kuVPKgU35eoOn90lCtEzaFieAEBH11ZBg5PM2lyyme9EyENu3lYi
 5XC9R1R+zJoTw==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.202.19.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id BAC41A0064;
 Mon, 10 May 2021 18:00:55 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Cc: Alexey.Brodkin@synopsys.com, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH v3 2/4] lmbench: memsize: increase delay for slow FPGAs
Date: Mon, 10 May 2021 11:00:47 -0700
Message-Id: <20210510180049.61421-4-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510180049.61421-1-vgupta@synopsys.com>
References: <20210510180049.61421-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_110102_138374_1F0AC51D 
X-CRM114-Status: GOOD (  15.01  )
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

otherwise memsize bails out and erroneously reports 1 MB

NOK
----
| />/lmbench/bin/arc/memsize 16
|
| 1

OK
---
| />/lmbench/bin/arc/memsize 16
| 2MB OK3MB OK4MB OK5MB OK6MB OK7MB OK8MB OK9MB OK10MB OK11MB OK12MB OK13MB OK14MB OK15MB OK16MB OK
| 16

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 ...c-to-prevent-memsize-from-timingout-.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch

diff --git a/package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch b/package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch
new file mode 100644
index 000000000000..6c3e7370e11b
--- /dev/null
+++ b/package/lmbench/0003-TOO_LONG-100-usec-to-prevent-memsize-from-timingout-.patch
@@ -0,0 +1,28 @@
+From d85b61666aa2728f68b69d02bfb162c432df709f Mon Sep 17 00:00:00 2001
+From: vgupta <vgupta@4eed8e25-bc12-0410-818a-f70ee6866280>
+Date: Sat, 3 Mar 2012 10:02:24 +0000
+Subject: [PATCH] TOO_LONG 100 usec to prevent memsize from timingout @80Mhz
+
+git-svn-id: http://sjvm-subversion02.internal.synopsys.com/svn/OSS/ARC_Linux/tests/lmbench-3.0-a9@157318 4eed8e25-bc12-0410-818a-f70ee6866280
+
+Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
+---
+ src/memsize.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/memsize.c b/src/memsize.c
+index eb25a0924872..b333cf8cbd32 100644
+--- a/src/memsize.c
++++ b/src/memsize.c
+@@ -15,7 +15,7 @@ char	*id = "$Id$\n";
+ #define	CHK(x)	if ((x) == -1) { perror("x"); exit(1); }
+ 
+ #ifndef	TOO_LONG
+-#define	TOO_LONG	10	/* usecs */
++#define	TOO_LONG	100	/* usecs */
+ #endif
+ 
+ int	alarm_triggered = 0;
+-- 
+2.25.1
+
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
