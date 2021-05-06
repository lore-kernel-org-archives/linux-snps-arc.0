Return-Path: <SRS0=IDKR=KB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0107EC43460
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 May 2021 00:40:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABD9261222
	for <linux-snps-arc@archiver.kernel.org>; Thu,  6 May 2021 00:40:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABD9261222
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dv0qMuK1AJKManiaWnKclOh4YHi+yniL6G8Opx8u5eo=; b=oWp5qL7tJ2k2mGEpWFV0+YwZw
	wRYLM9VZqr4QqIGF3eI7U4rjF6dYhCgYHsMMFsSYwFaneH+OZTuO8LXpv+Civris+6qnU05QBHtgN
	vdNu9bqXaDhsqtIHX9dDkAUCFmVZIh5FOOqz7CqpZA2qm/eNCCV8BLzYhLpaDDTYYOrvHdjFyhnJM
	YUKiyhLbu9eGMnNZ1Ezqjulak0iLEY8/2nPm2mFKAFx3Ei3CHlGMKZZNjvenTiftjtNZqqO77FnVu
	Aa2TBLg8id0G4FosVgrNdMLjnAbGbczR8m6r7zxwvNviMbPRtGT9JVgY+/+ggpeHQt8VrlN6vYwmP
	L5KG76tlQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leS3q-002jkR-S6; Thu, 06 May 2021 00:40:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leS3h-002jhu-E0
 for linux-snps-arc@desiato.infradead.org; Thu, 06 May 2021 00:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=9aS/HsiWLRlCtBO6I0rLKp16bM+IW9QsCwFqy9lvRz0=; b=fz2QWk5Uo+3BoY46qh/VZv4YKZ
 5xAzJV79JloT5yfpunuzXZPd4GBt4sreK0cLU7Deh9Uwp20tO/Neg8sIhfQ9uLijQYNd9IxGE5Ont
 HK7EBQK6Wy99AVMMu2LsJ+A1zIiLMNl/8nR4JQ7QV7rJ8fGinv5jlj8b06SDJwH8+fDo1Bkik/xOq
 gaiIJ9HiUnOUPXvH4mfCrlyloKoKoswoolDdEbvOrjQVKLvo3XNTgU4hSjlsxVmo+CpjPTvLphQ38
 z2894iGr0LaCG8FrDsXi60pt5fGStKi6RsoPhE1Rk0KqPM9S7u7q/Sdh9wQLVFeTWHdYLhyEcs/CY
 C1jVcWEQ==;
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leS3d-005RfO-JN
 for linux-snps-arc@lists.infradead.org; Thu, 06 May 2021 00:40:03 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 41D17C0635;
 Thu,  6 May 2021 00:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1620261600; bh=HulA2YrArNvg2SDWu8CAsAwlBHgZwY5ATMG+b79s/Z0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SSGkfyiWijhaYTBqc40HbuzucVsE9loOfkLtNYYuVP4ZAzxjV25J5/KA6hEwRbDVv
 3TIL+BiuzMUHgnZC+69Q7iTRcYZSuipyai9gck/Uzkx/jVXdkN+Bub/322Kl4lv3RZ
 lcgutXSDAqgIPFCC86LZRUkSWU2ov48e69qbj3YqbzEOU1r84OkWw59XkzTc4Fo12n
 07xy5hu/XrCzPaZwoDo9hIjQ005KXPRVcfiIShEv7HFK4vmG2ATyuejppX8Hd0g366
 0NOHtuWykXCsTWFtQ3m+kk3tvJ9AidWPYUYa8e7+xCST5zowXMU39vEbEhKA6InlFG
 S1kIZdR+SRYvg==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.202.19.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id E3387A00A4;
 Thu,  6 May 2021 00:39:59 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Cc: Alexey.Brodkin@synopsys.com, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH 2/3] lmbench: increase memsize delay for slow FPGAs
Date: Wed,  5 May 2021 17:39:56 -0700
Message-Id: <20210506003957.2994235-3-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506003957.2994235-1-vgupta@synopsys.com>
References: <20210506003957.2994235-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_174001_703266_25574D39 
X-CRM114-Status: GOOD (  14.42  )
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
