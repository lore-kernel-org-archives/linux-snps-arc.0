Return-Path: <SRS0=SdQC=GP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29130C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 13:00:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE6B323117
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 13:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE6B323117
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=83X16UVMS3UFTe+oNSA78hhFA4ecXGoWbxO3TQfB2ys=; b=siYMWVLTG6EwfH8D1JiM+tEFu
	gjzjEDMmWlTfid8h93BKrng2d934AMlXZ424CDfsGzAZDbgqSCTapkpjXym6Ao3eUjzxIDAS4QydT
	D2ZBOCK+fng2tB1Dy/5QxXv65m1ZMLaGCT8In0LBztcPtjCmBVmm0t84eZj/nJu39rEQ4Vs5CVpwO
	1rNU7dyHYEuSXagaCag/uHrFdqYXylBH1oNYwqNL5LORObRnFUhWemZJjldo5ZOBcCOsYnwmcz2DJ
	3vM/7K0T5ki+TNYaS+bC8hZ1ES3IDY1zYGQQasa9SgKayG7ELZ7Xa7AufRCDHhT1FFpz7nc3PA3HP
	W0ZlfST0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzJHW-0002Jf-7z; Tue, 12 Jan 2021 13:00:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzJFB-00013R-R8
 for linux-snps-arc@lists.infradead.org; Tue, 12 Jan 2021 12:57:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 527692333B;
 Tue, 12 Jan 2021 12:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610456273;
 bh=RXTWyssdws4QSfJ+JmgOYZPTOqGjh2f/lY6IjIbNXnA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fp0PoNKG/AKVtVJbgvzoXSNmVAHzHoI3RfB7vXR4uHWOIuX3gqgZQO+sxDCXULree
 825yQdphvCouKgMGdWGG38Cg46/OxNfcOfdneWLJVMH1QOsFUK/WNML8aB1i1W3vW4
 0h1tCsDulkvh63d55PeAW1dC3pJG1MKSlMlkDH3L+gPQJOMd1uXRRmhnfEUpAa0C13
 U3q8pKjMKtxisgKqX/+lYM6LLZ9haBkA9AEIwnlVgX19hqaDQAHzoSr/i5q12OZV2/
 v54QOnewECN9xPwYHfSC1UA0Nn5A/K7jpdLi5h2MtcSlix9sggAm3gGGzjXZgNW/XG
 DK6ZLOMuzTstg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 02/13] ARC: build: add uImage.lzma to the
 top-level target
Date: Tue, 12 Jan 2021 07:57:38 -0500
Message-Id: <20210112125749.71193-2-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112125749.71193-1-sashal@kernel.org>
References: <20210112125749.71193-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_075755_305196_8E64FFF0 
X-CRM114-Status: GOOD (  11.21  )
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
index 98d31b701a97c..1146ca5fc349b 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -99,7 +99,7 @@ libs-y		+= arch/arc/lib/ $(LIBGCC)
 
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
