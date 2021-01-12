Return-Path: <SRS0=SdQC=GP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D3C4C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 12:58:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5CEA23121
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 12:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5CEA23121
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j4TsmXiexhRAxAeEjG2kt5v/hXwOKGfQtTlw2wFXJYg=; b=caZO1Df7Wc9CJBlU6t7XBkCdF
	wcjJQ1+IRHNkpL0AKWtIpg6ldbuRxgIlZJ3PxKcn0mXhNWIFvch4mTas+7si905TWgfAgtOQvHMZG
	MbUZqIvH2VHQpDptTGmtMPIgsbycxjTW54OemE54ye2S6XVhdFuklNYyI5KgVUygshg2+k3FwDkEk
	8KRAiHqbruT4FOWW+Qle0KXXulInbxZBTzwl82HQFRJy3hJFKVyW1hUDqHN6DD+/z9yZbBc19/KG4
	GjoLTob8Aw6PCQVGu/C369Ye1cqom2bHffWwflUdHePJg/lMEE9vlLYFzTMmj8ZOKpS8KdJ02Chku
	usGQdYtpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzJFJ-00017N-2X; Tue, 12 Jan 2021 12:58:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzJE9-0000S5-Kb
 for linux-snps-arc@lists.infradead.org; Tue, 12 Jan 2021 12:56:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A40702343F;
 Tue, 12 Jan 2021 12:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610456208;
 bh=tT2JVAOyu67caF+7hVecNlQnhoOZBnX1WTz/U0A/ivw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S0q+4L3bKCW8NlpSS90eHsa+7SL0dCvDdA9Dl+aNRoeuDJBg+Au9IBy4o0GVMQ9tQ
 KfxyDEC+s5QxW8Kt+BHOLnQicYTrJ8sE8SEdtDmhzoO3Ori/LaKN3g6k06Hq8JwE33
 CqIE1F9grtPGzSlDHiOflCaSvyatA6K1PiOAA+DinmN4oKVpMl9b/oOveDZ8ETsg+l
 ITl5GY63TXZ9JIYbMzB/YRwzFmkeR+NFBtS5+i4NBV73rgt3UTeP0vgtjOmhkAkZ3D
 bDgu5knw3cZy6I0QW6iFXoYLmW8/w39yFRrFgIYmOeOGTpRCfwZtMdN8ZNKoc0C+nn
 8ar3k0RLv48+w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 02/28] ARC: build: add uImage.lzma to the
 top-level target
Date: Tue, 12 Jan 2021 07:56:18 -0500
Message-Id: <20210112125645.70739-2-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112125645.70739-1-sashal@kernel.org>
References: <20210112125645.70739-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_075649_809882_7570AADD 
X-CRM114-Status: GOOD (  11.11  )
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
Cc: Sasha Levin <sashal@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Masahiro Yamada <masahiroy@kernel.org>

[ Upstream commit f2712ec76a5433e5ec9def2bd52a95df1f96d050 ]

arch/arc/boot/Makefile supports uImage.lzma, but you cannot do
'make uImage.lzma' because the corresponding target is missing
in arch/arc/Makefile. Add it.

I also changed the assignment operator '+=' to ':=' since this is the
only place where we expect this variable to be set.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 5e5699acefef4..b0b119ebd9e9f 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -90,7 +90,7 @@ libs-y		+= arch/arc/lib/ $(LIBGCC)
 
 boot		:= arch/arc/boot
 
-boot_targets += uImage uImage.bin uImage.gz
+boot_targets := uImage uImage.bin uImage.gz uImage.lzma
 
 $(boot_targets): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
-- 
2.27.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
