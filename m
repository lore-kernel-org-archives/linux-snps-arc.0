Return-Path: <SRS0=jlyS=GR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF09C433DB
	for <linux-snps-arc@archiver.kernel.org>; Thu, 14 Jan 2021 11:35:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C24A23A34
	for <linux-snps-arc@archiver.kernel.org>; Thu, 14 Jan 2021 11:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C24A23A34
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zus/7vXmFDW++Xs0aw7BVoV9zTThPMy4T9XqL4SxP6w=; b=FblmbHa3ROyrX0hvyxRRkPTL/
	ZGxTkUJl3kPqO5odC3iX4L059RTT98TKvDIvGLVo9KrX0aYPFruH4TEOLv1G8tCFbrFNQS4rngm1d
	3WwHScvknGF7ozz0hrSXYikHd1KWTOKhkXX4wqLLiTHs11lmn6d/jvymzHl+HweAhfIfOflJNqsZw
	RUP0CRpt1xwQC38phIhtruRoiji3pEQVhPtSyNkTjk11YZfQ3z5Qo7Lr8fw0eCfbLFO7xCRQ2dqWB
	ZqmA7BfpZRG/d1Mb6Hra5gm/MGrGufpslbfr+wCQIwV/LtAimkag3C2uYHJyniPn9hhiKv7bk1OPp
	ogH31rfww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l00ut-0008Es-31; Thu, 14 Jan 2021 11:35:51 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l00uo-00087h-Rk
 for linux-snps-arc@lists.infradead.org; Thu, 14 Jan 2021 11:35:49 +0000
Received: by mail-pf1-x436.google.com with SMTP id c13so3157616pfi.12
 for <linux-snps-arc@lists.infradead.org>; Thu, 14 Jan 2021 03:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AYFhWYvlMHFaN194DuP9Mk/3w2ENP7CTYz+Se/lFzBQ=;
 b=zZUJNJPhK7vwVZo3zG1L/ZLlhGgRFtQKowTKqhvvF7eFc3s3ezuRailFhUhF2kVpg1
 XqlIlpxX1roPBkCGmEG4JkGCWMCZrmtUSHYhup+Q+9g364u4bEvTsgbKUquse8cVWgTj
 piQAfeXwWyDTfwsMUHcD0aA+o/CQPOkybKOn/6hOE71SZeW2oksCYnahsxgiNJkH/xF5
 ItmDc/bpU9bMl/gJlifRnXyhlTDY0vVXisakj25ILk2G13A8mnqd4wlcMvjIEGN8vsww
 yAa+rogw5E/eiY34s70yJr8QPk8qEkG6c84T6J/2a8cJhLgFl/iEqOqjhaaYu5wNb5Fn
 XnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AYFhWYvlMHFaN194DuP9Mk/3w2ENP7CTYz+Se/lFzBQ=;
 b=Fo3uC3CKZd4D2LYaxOpl1P+nR7/alQeomnya5nrH0Lf8IWtc8X52o5yHCWFsqWcCbe
 FGCZQQ8NuphdB2JaI7SWd78nlelzmXt9t/5CxzBZe1zcabZs97yGqa4SuFQQ94KpJ40F
 eeG98bCzl4uV0eBynL0knQzdaRgUk9PqdP8+AQF2/6Jwbp+/3Vd8VEWue98SFK2rUm4g
 9n9ZsWJEMJMhsCmbOe90YLHiLvVFcW1Sq0QMunyB5BT8DddwZ6vrMDLEomtU5DUOMYRe
 Su3ERkEQ97QzYAKrAMAmYI1BhYJ+sdC2/f7MPSSZ81MEWDwaVokA6W4cNdVKwaSCE8mU
 T+9A==
X-Gm-Message-State: AOAM530nEh3ZdMiMjh8ztXveFIaKXjeIJ3y+W6fuwVJFs/Y5/iThSs2l
 vHSLzRR8zEws0r7xK0LWyWAWfviekmfs2Q==
X-Google-Smtp-Source: ABdhPJzg1zptJKMu9bTjn6PS8c4QYvzj+iujyctChMFT1NQzHaOeW3F1te+tLmaKVJLiXtZeLXQpnQ==
X-Received: by 2002:aa7:8583:0:b029:1a9:39bc:ed3b with SMTP id
 w3-20020aa785830000b02901a939bced3bmr7001430pfn.48.1610624144666; 
 Thu, 14 Jan 2021 03:35:44 -0800 (PST)
Received: from localhost ([122.172.85.111])
 by smtp.gmail.com with ESMTPSA id m4sm5320866pgv.16.2021.01.14.03.35.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Jan 2021 03:35:44 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Robert Richter <rric@kernel.org>, Vineet Gupta <vgupta@synopsys.com>
Subject: [PATCH 03/18] arch: arc: Remove CONFIG_OPROFILE support
Date: Thu, 14 Jan 2021 17:05:16 +0530
Message-Id: <906d9d40746bb1b60823a288d00820cb50d29138.1610622251.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1610622251.git.viresh.kumar@linaro.org>
References: <cover.1610622251.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_063547_092739_AAE3ECEA 
X-CRM114-Status: GOOD (  13.99  )
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Christoph Hellwig <hch@infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 linux-kernel@vger.kernel.org, anmar.oueja@linaro.org,
 oprofile-list@lists.sf.net, Alexander Viro <viro@zeniv.linux.org.uk>,
 William Cohen <wcohen@redhat.com>, linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

The "oprofile" user-space tools don't use the kernel OPROFILE support
any more, and haven't in a long time. User-space has been converted to
the perf interfaces.

Remove the old oprofile's architecture specific support.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/arc/Kconfig           |  1 -
 arch/arc/Makefile          |  2 --
 arch/arc/oprofile/Makefile | 10 ----------
 arch/arc/oprofile/common.c | 23 -----------------------
 4 files changed, 36 deletions(-)
 delete mode 100644 arch/arc/oprofile/Makefile
 delete mode 100644 arch/arc/oprofile/common.c

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index b55ca77f619b..bc8d6aecfbbd 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -37,7 +37,6 @@ config ARC
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
 	select HAVE_MOD_ARCH_SPECIFIC
-	select HAVE_OPROFILE
 	select HAVE_PERF_EVENTS
 	select HANDLE_DOMAIN_IRQ
 	select IRQ_DOMAIN
diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 578bdbbb0fa7..4392c9c189c4 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -96,8 +96,6 @@ core-$(CONFIG_ARC_PLAT_TB10X)	+= arch/arc/plat-tb10x/
 core-$(CONFIG_ARC_PLAT_AXS10X)	+= arch/arc/plat-axs10x/
 core-$(CONFIG_ARC_SOC_HSDK)	+= arch/arc/plat-hsdk/
 
-drivers-$(CONFIG_OPROFILE)	+= arch/arc/oprofile/
-
 libs-y		+= arch/arc/lib/ $(LIBGCC)
 
 boot		:= arch/arc/boot
diff --git a/arch/arc/oprofile/Makefile b/arch/arc/oprofile/Makefile
deleted file mode 100644
index 698367bb41d0..000000000000
--- a/arch/arc/oprofile/Makefile
+++ /dev/null
@@ -1,10 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_OPROFILE) += oprofile.o
-
-DRIVER_OBJS = $(addprefix ../../../drivers/oprofile/, \
-		oprof.o cpu_buffer.o buffer_sync.o \
-		event_buffer.o oprofile_files.o \
-		oprofilefs.o oprofile_stats.o \
-		timer_int.o )
-
-oprofile-y	:= $(DRIVER_OBJS) common.o
diff --git a/arch/arc/oprofile/common.c b/arch/arc/oprofile/common.c
deleted file mode 100644
index 86bf5899533b..000000000000
--- a/arch/arc/oprofile/common.c
+++ /dev/null
@@ -1,23 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2004, 2007-2010, 2011-2012 Synopsys, Inc. (www.synopsys.com)
- *
- * Based on orig code from @author John Levon <levon@movementarian.org>
- */
-
-#include <linux/oprofile.h>
-#include <linux/perf_event.h>
-
-int __init oprofile_arch_init(struct oprofile_operations *ops)
-{
-	/*
-	 * A failure here, forces oprofile core to switch to Timer based PC
-	 * sampling, which will happen if say perf is not enabled/available
-	 */
-	return oprofile_perf_init(ops);
-}
-
-void oprofile_arch_exit(void)
-{
-	oprofile_perf_exit();
-}
-- 
2.25.0.rc1.19.g042ed3e048af


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
