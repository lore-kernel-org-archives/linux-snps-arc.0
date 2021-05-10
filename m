Return-Path: <SRS0=C+4U=KF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B513C433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 18:06:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D50CB611AB
	for <linux-snps-arc@archiver.kernel.org>; Mon, 10 May 2021 18:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D50CB611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dv0qMuK1AJKManiaWnKclOh4YHi+yniL6G8Opx8u5eo=; b=OgiFzs3K0QwbLOfp+2xjZFFOd
	p+wFIQ3SVZYFqISFFNv9WWZBqlLQ+kcs/X1nmB8wI/W4ls6brVjln0qnrEaxCGAvzT4o4UNc97+le
	CU9UmLD1sx6Wxhg5UuDW3YEqTJediZJGCJJHmQlTvaozbOZ5D20LeTz3HDStE/4/V2w1WD4LPfs79
	QG6iM3iG/el/Vy2SQ1t84BWCDNcxeDYWiB2Dv10MLf+Yx6sZj4LJY49NoHba6GsKleR+N7WVWa9Kq
	YkvjYVlot6V0w+zRqnXuEw9uzjqzc2z8tCklmCYUCqVeVVz69P+96vWwzWJDl8zwvJr4WD2V9lZol
	pwqgdGTNw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgAIc-00FMlY-5x; Mon, 10 May 2021 18:06:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgADJ-00FKox-VR
 for linux-snps-arc@desiato.infradead.org; Mon, 10 May 2021 18:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=9aS/HsiWLRlCtBO6I0rLKp16bM+IW9QsCwFqy9lvRz0=; b=Db+4Ku05r4W78ZUlndb6+7Upph
 KRreHDV1t3NB+HOPRosBH0MYbDRnOA6jyYIEbMTs4Ff0JDKfjH5PM2fjKtCyDMolOnmC0xg/l7Pp6
 s1zWDZyzOVt9ONi31rWXd++zg/5xhyzWBkAk05XCfTahXaVztx2nzT4DlviUuFOugtsSsn75qt2eZ
 xu+3k0yiBBv1dyAivNObxrgGYLkWSg/wtV66aiDtRbadI9J6+NMhtF/Mk3RrOfmExbheXiu2jXZFM
 Wbyb22Dh+bLxA9HZjXTX9gY1tSiGjaxI1gsaite7hUNdhuNwotlttsAwusorn4bPqL5LuEuta57HE
 cb8m80AQ==;
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgADF-0090zD-Lb
 for linux-snps-arc@lists.infradead.org; Mon, 10 May 2021 18:01:04 +0000
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com
 [10.205.2.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E4CE2C008F;
 Mon, 10 May 2021 18:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1620669656; bh=HulA2YrArNvg2SDWu8CAsAwlBHgZwY5ATMG+b79s/Z0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UdZvm8+k+V6YsWtiGiwMjpKqtVQPY10xCWUs9u822hECAE5g6kuc//ODT0tLbpLFG
 rvxCug5/R9W4zduZZ7GVTolyc+CVY/e0ZAl/MO1Q3+Cxb4A5DGBoaoJfyf4wdCWD8g
 l05Di+t7GugsgBRu+qGsyv5Wr+Aviyr7EgKP19cDt0kaqiqNBycXySUf02oY68/W5P
 up7nvbHTHzuoKKOsxgvcXWVTMy2j8QclFW32Y+4t9Op55eFo2s+0+oGZ0P6ORgVAbr
 5znPgv755F7/Nq/1mqpDk6IZXo2DggzkBlva2IIjNl2/Y9mASqPhhYcyYd/TTrGk17
 9xsQcoHiE7xcQ==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.202.19.21])
 by mailhost.synopsys.com (Postfix) with ESMTP id 7C105A0066;
 Mon, 10 May 2021 18:00:55 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: buildroot@busybox.net
Cc: Alexey.Brodkin@synopsys.com, Evgeniy.Didin@synopsys.com,
 linux-snps-arc@lists.infradead.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: [PATCH v2 2/3] lmbench: increase memsize delay for slow FPGAs
Date: Mon, 10 May 2021 11:00:46 -0700
Message-Id: <20210510180049.61421-3-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510180049.61421-1-vgupta@synopsys.com>
References: <20210510180049.61421-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_110101_752448_753F1BD0 
X-CRM114-Status: GOOD (  14.68  )
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
