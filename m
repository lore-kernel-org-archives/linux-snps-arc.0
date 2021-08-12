Return-Path: <SRS0=WOcc=ND=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2445C19F36
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DC3D610FD
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 23:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5DC3D610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j8KDXfe9W5hQ8XG1GLyPK+v0ejnR21q1DVjv2/upAAU=; b=udI16QeJR6QwA4
	FbkZDtyr1GIyKhZKy2wxlsCT+5fA9HIN7RjWpLg+LhtZCwxVIWZHBDvowzNJg4Dy8Irti5vMs7MHW
	iZedqnFMbKbYl2XmDjBLrnDSDQsksH7AiI8WsE1Aqp33ENBkQv2mBhxuy2wZbguwiBd0j/OpMcYx0
	drif0WQ1jTDkwFYZ3GPIJ4oJ22T2XaMtCJzxXnAg9Kgyejteq0NVdR9NfiN/5EjZu/Oyv1xgdZ8xf
	xu8C8lBYd6VlSRzUUC/6CPjTeMaj093IYNmC0zAuOKz7Nf5Ebjti8O/zgqPhdCtBCfLd4D5xeWE7d
	r+DHLaneU63EYqp/Kgfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEKH5-00BU4R-ME; Thu, 12 Aug 2021 23:38:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEKGy-00BTsj-CR
 for linux-snps-arc@lists.infradead.org; Thu, 12 Aug 2021 23:38:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00929610FF;
 Thu, 12 Aug 2021 23:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628811484;
 bh=OznPj0H31NuyGJ0zu5NrPr8zmibKxgGabmxj0tfu3OI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qSLCgRfDUgYypTq6vAUv99MIOcg2OnKf0tnDXJqcySf3ubU/7uoPK7McrjorJIkxX
 VfcDxT+ITm2tR4CPvh0KFoYz7ntI9yAluS95kThBPQzj4peUcTgFXvXnixaRcjf4oz
 mvs8MWR0B4l9tfx3cNDVtWbyU9kofkJhuFdo243+DMU9Jh8DGEgSEz+EkTdio3gE+g
 J/H9DmrTQ4RbJIOPOW9rTn8IDNhacihpSUGjLyQzwhEITlQo9bQeNjdriIb90bWMvn
 ETyBJ0iKYzooOHqC2RVmF1lRDL8zf7EGYlVavXPmsVbI08yOdOsazanNOQZVC2nb8z
 xgdu49URX80Dg==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH v2 15/19] ARC: mm: hack to allow 2 level build with 4 level
 code
Date: Thu, 12 Aug 2021 16:37:49 -0700
Message-Id: <20210812233753.104217-16-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210812233753.104217-1-vgupta@kernel.org>
References: <20210812233753.104217-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_163804_509523_F9BAF027 
X-CRM114-Status: UNSURE (   9.08  )
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

PMD_SHIFT is mapped to PUD_SHIFT or PGD_SHIFT by asm-generic/pgtable-*
but only for !__ASSEMBLY__

tlbex.S asm code has PTRS_PER_PTE which uses PMD_SHIFT hence barfs
for CONFIG_PGTABLE_LEVEL={2,3} and works for 4.

So add a workaround local to tlbex.S - the proper fix is to change
asm-generic/pgtable-* headers to expose the defines for __ASSEMBLY__ too

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/mm/tlbex.S | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arc/mm/tlbex.S b/arch/arc/mm/tlbex.S
index 0b4bb62fa0ab..c4a5f16444ce 100644
--- a/arch/arc/mm/tlbex.S
+++ b/arch/arc/mm/tlbex.S
@@ -145,6 +145,14 @@ ex_saved_reg1:
 ;TLB Miss handling Code
 ;============================================================================
 
+#ifndef PMD_SHIFT
+#define PMD_SHIFT PUD_SHIFT
+#endif
+
+#ifndef PUD_SHIFT
+#define PUD_SHIFT PGDIR_SHIFT
+#endif
+
 ;-----------------------------------------------------------------------------
 ; This macro does the page-table lookup for the faulting address.
 ; OUT: r0 = PTE faulted on, r1 = ptr to PTE, r2 = Faulting V-address
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
