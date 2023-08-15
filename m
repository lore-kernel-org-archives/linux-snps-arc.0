Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80844C04FE0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Aug 2023 00:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ys6uqodl04YjEh5tJEFtrRaDSacXLHV6x571FWfTBwc=; b=djPSsIWuSSpMzM
	2t6FnNL/f5wgBRMsNeYt1kBvd9qJcAD+MVN7G9oCZr1EbpPlDqxpfHH7a0lzAizL3AZHtabO+BVft
	fJ9ETWZK2/SjaieFuUIwXvc2pZVbp2uQvyv74SksLFh9ln5Dm4L6FYK2tzW2dKh0fu7o7SmGrwYPG
	qyIxtDNYfeESO9IZrfSMo4WDoZ8cQQeE4N2adwMda0md/G7Y+AI0DxGMQZs0TxnR7wx4CVoaBlHX+
	2sGvlNELhcFEp4uFHAbKPf/J1ot7XBUQXRjLnqz93kVa2lmBK33g/3iaJ2Iwjy/G4kWVMZiZLUSLn
	qiAZdJ36cwZ4viqoaI+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qViER-000cWk-1n;
	Tue, 15 Aug 2023 00:48:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qViEO-000cTk-0t
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Aug 2023 00:48:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C267364009;
	Tue, 15 Aug 2023 00:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F3CC433CB;
	Tue, 15 Aug 2023 00:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692060499;
	bh=YH1Bc28nzEk45ZXRwo0o5JTtxWlnUgrQ7Atrmj3ROek=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sYn9I40SFgdPcfvO+C1hyvCYNpDILybAVYz26koAmqj/kKoLVs8PazZpg2vzGnFyG
	 D+QnTkdkKTqjl9/c7LFQqsMCSe31rR9RqvluNm04G7sFNwExJ2BEX9D1xdgFxQj3q7
	 g9ZiBKNtZCtVvRQcUrlUSbYqCGuO0eWBy24njidcrnEZNKQPsKSol0n+efHEJaJ3xL
	 VYDMzZZCeJo6RBOUl2KkCZDpA0Aq5h/r6XDbJpWyJ/ugdrSD8DphbH+xRlcT0+N76q
	 6yZq5j9IYGgWwnnvotQuESl5w9b97H8QiQ9Rk07XnY9l9Kc64Twm3/nI9PyNnfzSgr
	 pD+WPdvs/ATOw==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 02/20] ARC: uaccess: use optimized generic __strnlen_user/__strncpy_from_user
Date: Mon, 14 Aug 2023 17:47:55 -0700
Message-Id: <20230815004813.555115-3-vgupta@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230815004813.555115-1-vgupta@kernel.org>
References: <20230815004813.555115-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_174820_356196_FBA25041 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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

The existing ARC variants have 2 issues
 - Use ZOL which may not be present in forthcoming architecture
 - Byte loop based vs. generic version which is word loop based

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 96cf8720bb93..47b4acc7d0c9 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -26,6 +26,8 @@ config ARC
 	select GENERIC_PENDING_IRQ if SMP
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
+	select GENERIC_STRNCPY_FROM_USER if MMU
+	select GENERIC_STRNLEN_USER if MMU
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if ARC_MMU_V4
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
