Return-Path: <SRS0=aZIh=55=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75150C2BB85
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Apr 2020 01:33:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4621020678
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Apr 2020 01:33:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X3UBIljJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="fmTKMsW7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4621020678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KyTXtEc7+hP1B7U+pT1GM6UzBolYK936vf0O0363mYg=; b=X3UBIljJXSi6nC
	/wKiqBPY16F6HxBS1VF+M2voECaDTUzdJxTXVitNm19no1JYyOpIZOrFPOnxEg6l90ISJPT7uyK/h
	+wghuwtwc3TnwQ9QNuY/zhDzm0BtQC1FYEm3P4gup2VBJCxSE6XQRe6xDhui2xcFlf3PLhTguOkKv
	h2P8LTxCTds73b3Nt6poQhuAp0YQJITWAIQukTT/+2gP0fOKS1mJB7JEpb+f/b7XRVk1wjk4A5JtU
	sl5u2IVvd1QivC8GdhfILUJA0bPepwO4XXgsdyqjgiXGyjM83N26tNZH5U7pKfJoH6gd7cSCGEdn7
	z1dV6YVEWC6WZXwmm51A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jNnye-0001N6-6X; Mon, 13 Apr 2020 01:33:32 +0000
Received: from conuserg-08.nifty.com ([210.131.2.75])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNnyb-0001Lp-84
 for linux-snps-arc@lists.infradead.org; Mon, 13 Apr 2020 01:33:30 +0000
Received: from oscar.flets-west.jp (softbank060142179096.bbtec.net
 [60.142.179.96]) (authenticated)
 by conuserg-08.nifty.com with ESMTP id 03D1WsFq003537;
 Mon, 13 Apr 2020 10:32:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 03D1WsFq003537
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1586741575;
 bh=BJbt349d1GFRoVaxKRMr2OOu2ZIUsOrtI77b0u4o6KI=;
 h=From:To:Cc:Subject:Date:From;
 b=fmTKMsW7Mb4qSZ2Qxx5qs13u7Bhatv1VPfUDo7caOIskmNiRX99kycLGcIUCS+iHP
 dAueM0zk/+G+Kzk0lcDQEH2//DFrSSZgRuW5TF6JfglS8MCTHGaHA3LiFUbGCf2GLJ
 zJY98yrO9zh2g+/KN7lKM02K3Wp+ygRIBhN7JjD82fLph7g1d7uJKnSwX1E22wRyq+
 H6tI0cNUzbVAQbX3Kul0o6itC2IKOEIiFwNQc0uU9LbX9qXzNWyFSp9l8fyByqyxkx
 zE2MtyDojqOQUQx1mm/AgnUk9pxQRE7NlW7A/I7nSxi1OSRCQxxtzwhU8wHJoqvcfz
 +/U/ER6ceLAAQ==
X-Nifty-SrcIP: [60.142.179.96]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org
Subject: [PATCH] arc: ptrace: hard-code "arc" instead of UTS_MACHINE
Date: Mon, 13 Apr 2020 10:32:40 +0900
Message-Id: <20200413013240.8659-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200412_183329_504237_83355BEB 
X-CRM114-Status: UNSURE (   8.28  )
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
Cc: Enrico Weigelt <info@metux.net>, Masahiro Yamada <masahiroy@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

ARC uses the UTS_MACHINE defined in the top Makefile as follows:

  UTS_MACHINE     := $(ARCH)

We know it is "arc" when we are building the kernel for ARC.
Hard-code user_regset_view::name, like many other architectures do.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arc/kernel/Makefile | 3 ---
 arch/arc/kernel/ptrace.c | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arc/kernel/Makefile b/arch/arc/kernel/Makefile
index 75539670431a..8c4fc4b54c14 100644
--- a/arch/arc/kernel/Makefile
+++ b/arch/arc/kernel/Makefile
@@ -3,9 +3,6 @@
 # Copyright (C) 2004, 2007-2010, 2011-2012 Synopsys, Inc. (www.synopsys.com)
 #
 
-# Pass UTS_MACHINE for user_regset definition
-CFLAGS_ptrace.o		+= -DUTS_MACHINE='"$(UTS_MACHINE)"'
-
 obj-y	:= arcksyms.o setup.o irq.o reset.o ptrace.o process.o devtree.o
 obj-y	+= signal.o traps.o sys.o troubleshoot.o stacktrace.o disasm.o
 obj-$(CONFIG_ISA_ARCOMPACT)		+= entry-compact.o intc-compact.o
diff --git a/arch/arc/kernel/ptrace.c b/arch/arc/kernel/ptrace.c
index d5f3fcf273b5..f49a054a1016 100644
--- a/arch/arc/kernel/ptrace.c
+++ b/arch/arc/kernel/ptrace.c
@@ -253,7 +253,7 @@ static const struct user_regset arc_regsets[] = {
 };
 
 static const struct user_regset_view user_arc_view = {
-	.name		= UTS_MACHINE,
+	.name		= "arc",
 	.e_machine	= EM_ARC_INUSE,
 	.regsets	= arc_regsets,
 	.n		= ARRAY_SIZE(arc_regsets)
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
