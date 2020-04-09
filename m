Return-Path: <SRS0=Kc19=5Z=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319AAC2BA80
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Apr 2020 02:56:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02CC520757
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Apr 2020 02:56:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WuQg6XsI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Fm5bH9kd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02CC520757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z2V19UsZDaF65upBXg6airJ2/Ho4LixNi6H6OKSq7Lo=; b=WuQg6XsIpE7OWN
	KgGgUECKQ5NwBXrJJozhTXgcKv0KqdCMClqI/ZswmaSwlL1wmYeKbXh6nQ9bCA1iwzwEdzBM81Nsx
	o8qIqM8n8CG9G7RAUZaYJrUryiIziepHt1jOMsN7r+3EEMr6lPpmxhD6bAAd3hZT/zGfja0K1digm
	wqmN4Hr2Ve2T+U0/1OHAQ85tAAorsvTFA3zXXGuQalUfG25TnNon3jkLr4f05RNAt60BL1e6SjE34
	ZDKIyV8CYFFXwKrf5eNXg3P9TSKN4x+X3IvoTUnQr327IpEImJ+Gx5U1IQyEgG9Qsi6naCsuKxpJ0
	ATSpheCUbjufugIBmxxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMNMz-0005fJ-S9; Thu, 09 Apr 2020 02:56:45 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.73.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMNMr-0005aC-Jv
 for linux-snps-arc@lists.infradead.org; Thu, 09 Apr 2020 02:56:42 +0000
Received: from mailhost.synopsys.com (sv2-mailhost1.synopsys.com
 [10.205.2.133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 7F18D406A1;
 Thu,  9 Apr 2020 02:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586400997; bh=Gt9GqCutqCoYBioCHctrMs+x1X9krzkeqiOIxcHq1kc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fm5bH9kd+3waYyaufD7+hZUREQkU0bPLhDJXoItkESy3XikeDB8bXTtG/yoq84E9X
 yL800ZVmRATcPfioaIXcxiKF5BeiHjzAkeejgtA5oAmdi1TmDbtAwxnSPGDTMEZ64o
 nnC7XfLIDTTO0ut60OkyFLnc/aj8qbg1Knhav1SNsPL/7/6Gu0+Db4/kFJd+s8Zaja
 HMltiWmXWbrpK83eA3dWn+BojCC6ahK+zmZo3YtUj8sCfsez2NGlsEiAeYTD52yt++
 syOxvdRBDfoZqbOXnhj7pq+wvdAZNKs0w2vBy1KOTIqnzSzFKLS02G3wOYttS9kmIC
 nfgxKkB0+le5w==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 4493BA00BB;
 Thu,  9 Apr 2020 02:56:36 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: libc-alpha@sourceware.org
Subject: [PATCH v5 13/14] build-many-glibcs.py: Enable ARC builds
Date: Wed,  8 Apr 2020 19:56:14 -0700
Message-Id: <20200409025615.27003-14-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409025615.27003-1-vgupta@synopsys.com>
References: <20200409025615.27003-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200408_195637_657144_71439C10 
X-CRM114-Status: UNSURE (   7.86  )
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
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 scripts/build-many-glibcs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/build-many-glibcs.py b/scripts/build-many-glibcs.py
index 64a836c52ea9..77b686d34cea 100755
--- a/scripts/build-many-glibcs.py
+++ b/scripts/build-many-glibcs.py
@@ -1248,6 +1248,7 @@ def install_linux_headers(policy, cmdlist):
     """Install Linux kernel headers."""
     arch_map = {'aarch64': 'arm64',
                 'alpha': 'alpha',
+                'arc': 'arc',
                 'arm': 'arm',
                 'csky': 'csky',
                 'hppa': 'parisc',
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
