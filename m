Return-Path: <SRS0=X5Oj=3J=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9854C2D0DB
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Jan 2020 10:10:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6B342073A
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Jan 2020 10:10:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CTnRAqit";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Q7WBqy+U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6B342073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=1+uFOzSL6endnnhq1IryYpmWK26idA0WkmajxY5ALJE=; b=CTn
	RAqitZ0mlIkVhwr4JOd9HU4/GmWfdS5Hj4zlH+Bk+aawml7M8JFc49nh1pLHnw9kp8e/s40YrNKaq
	fRTfv2xtSdDjBcSulqBylSsgu7pzDyvQ6lkbU5YRmBXxE3JCF1bVZg/FoYzP3psHxwB0smTMqCES7
	fYf7pwcZr4Cf6lZy0foRuwEMTXwz86VIbcg+IDX+YmoF2D8RWAR0bZjTCNTVhRJB9N4KiCRy0kuPQ
	j06PsEnxGKznmpWkuDGLVRZycHAy/IDx6t9WgVPQmTT9cwYqNWxH+bW7s4c/8n7IQtAqjzDshVsiR
	gn5SxEXjJAEDddqLyzbIPV75x46fmAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itU0O-0007DM-GU; Mon, 20 Jan 2020 10:10:00 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itU0I-0007Cw-UL
 for linux-snps-arc@lists.infradead.org; Mon, 20 Jan 2020 10:09:59 +0000
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id D41E94052A;
 Mon, 20 Jan 2020 10:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579514992; bh=xPaTWfePXY611wuEfKcw+1Ot1+JQuxG5IdJAmY64a6I=;
 h=From:To:Cc:Subject:Date:From;
 b=Q7WBqy+Ul+fau44a9ga918myLyaTGN9i1QtYD11Jz9Ucmip1191V+eX6CFw/Om+vB
 /ty/UeKIPTnRFFUDtCPnZVDOpjkfsoXXoh3KCqTp4IiisVLk13Lpujze8JN9jXFQy+
 SiuRJeu44g2OBxGfmbuMCE0QSmiVzXVrEJb2wXr9qGrnVTb96ZOQ7hNyhfW4xM/Uu7
 jG+s/t/da0Z0TvJW7rrWI4Vg1eM3KOKlXQh8rz0+at1ARr6h/YsOXOQc2cIw12+m1W
 cRJVTLtKCO87epUfRuS3G5rjy7KWfg0vJ6e7Lgz8ahcJ+NjyrheQzx4Pr4v1L2bfSg
 I7L3xPqBxeGzA==
Received: from ru20arcgnu1.internal.synopsys.com
 (ru20arcgnu1.internal.synopsys.com [10.121.9.48])
 by mailhost.synopsys.com (Postfix) with ESMTP id 785E1A005C;
 Mon, 20 Jan 2020 10:09:48 +0000 (UTC)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: u-boot@lists.denx.de
Subject: [PATCH] ARC: Don't mess with endianess settings
Date: Mon, 20 Jan 2020 13:09:40 +0300
Message-Id: <20200120100940.904-1-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_020954_984857_88E7C96A 
X-CRM114-Status: UNSURE (   9.33  )
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
Cc: linux-snps-arc@lists.infradead.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, uboot-snps-arc@synopsys.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

There seem to be not that much sense in explicitly setting endianess
flags for the tools as we assume the tool with required endianess is
used. I.e. we use LE tools for building for LE targets and BE tools
for BE targets.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 arch/arc/config.mk | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arc/config.mk b/arch/arc/config.mk
index 18005d9993..4b8a0870eb 100644
--- a/arch/arc/config.mk
+++ b/arch/arc/config.mk
@@ -8,16 +8,6 @@ else
 CONFIG_SYS_BIG_ENDIAN = 1
 endif
 
-ifdef CONFIG_SYS_LITTLE_ENDIAN
-PLATFORM_LDFLAGS += -EL
-PLATFORM_CPPFLAGS += -mlittle-endian
-endif
-
-ifdef CONFIG_SYS_BIG_ENDIAN
-PLATFORM_LDFLAGS += -EB
-PLATFORM_CPPFLAGS += -mbig-endian
-endif
-
 ifdef CONFIG_ARC_MMU_VER
 CONFIG_MMU = 1
 endif
-- 
2.16.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
