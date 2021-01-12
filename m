Return-Path: <SRS0=SdQC=GP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 622ABC433DB
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 12:59:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0996A2311A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jan 2021 12:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0996A2311A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9OKBov0jWk1HvtSlmdq3x5uahC6iWHNl4L/rNJQC6jY=; b=zohvJiY9y2ezEtqKiyhj2+B26
	Z51lB/uMxCbq2uC48A2zZ436nzNq9UcPEzg2JGnyv5A8iiuukqPqXfoZGSt7agLX2aGtB72hNObFp
	ufb3REWDFyHYdXl7uI5lOkWbwGh1TPzHYrywQNpgy6VpdTelNkqi37Hh/BIoKhVVUVTJ3DXoACPkY
	wTIIP0K0YSsCelCZJNtRYUCsJbvCfH9G58Yf4RyVZTVKLXQUGUWAySp27Md4zE0WPXzb9yEiukQP8
	Wc3alNsRFmc0Ftf7LVFSOWLDbigmXem12uqphhTuS1o+Uh6Poxw2P1t5SDmMKhVJMtoNxa0hfAJss
	7BzFBIYNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzJGp-0001yk-43; Tue, 12 Jan 2021 12:59:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzJEn-0000pi-DE
 for linux-snps-arc@lists.infradead.org; Tue, 12 Jan 2021 12:57:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA47C2388D;
 Tue, 12 Jan 2021 12:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610456248;
 bh=sz1R3HwZb4o4qiTaMpMikNw4vJUb6krejvhqf5QBTOI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ORICluun8ZPtlmqNrNHRWnosn4q2S7rLddgFL6W/knRu3vdD6hde/e4T7j9zoNFfW
 cFnKPr25RYYv23UoW1shR6aG2ne5YQXbpfPDPT/ah268cEjVvE5MsUoFqEfthKo3qr
 rWYX6QVakdCwk4Z9wEeCsAenOl/y1Ve6Ukgj3IeH61DrkgsXBb3P8JS9KgVWedw6HY
 9cD/rGio09F3fJB1xZfiByZ8wVNiLmsreqBZHhuoCtkgb/7b+BPWX6kJvG1/amKuj1
 a6dabZKDlqNd+da6V+7XL6ffQHp3VWKtNNpG6PLQKNDXRGX2nU7tNChKKMKKGdXrqd
 ZbFwtb35gWqIQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 02/16] ARC: build: add uImage.lzma to the
 top-level target
Date: Tue, 12 Jan 2021 07:57:11 -0500
Message-Id: <20210112125725.71014-2-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210112125725.71014-1-sashal@kernel.org>
References: <20210112125725.71014-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_075729_883082_94FDA7ED 
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
index b07fdbdd8c836..cbb110309ae1c 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -91,7 +91,7 @@ libs-y		+= arch/arc/lib/ $(LIBGCC)
 
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
