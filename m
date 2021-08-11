Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84492C19F36
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4272C60EB5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4272C60EB5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nCi/RQaYkiHjZIrHEaWxZsXriukS54D5Z8o6bYHMMYA=; b=e+AMF3XeDu/TFs
	4u2bqwv4hasFiiPj3TVzbH0CTMuJDr+maYUTLTQgVGqovb82Eu6gRz1AmxOLP94rvnkIYcR8PPdaw
	B0RFq9LKI6bN3uxJzFjrYrplzdnxN+YRfwgHPz+Dt+vvWmwdELY/y9Q5irwrtUkd5yjMUYF957Vt2
	Cgt89OBDlZXarhr62oqTW/BBMX5c1oYN7tSUgHaxFE+MIQkBupbB2L1vvqR23WBhF492Rlf2Il+Lb
	yYJ25x/3UeSvdvKKRMuh4ryPpXsz9gkDYFhN2geFvc5quv9Eux7JLLmgIq9RHkpZom9R7MPvG1P27
	RgwFF6LX4Mk5cLIgB8Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDcL9-0056mg-KI; Wed, 11 Aug 2021 00:43:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDcL4-0056dD-OR
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 00:43:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3FF6260E97;
 Wed, 11 Aug 2021 00:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628642602;
 bh=xDJ908ZzfO6+yH0suS+Wf2y1mcWCsd5q/TbB74bMqLk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dx/7wL9VqmoKx8zT58MEHcTkH3sRnAUzpeBYJPrDooFmOZWP2OEPHhDvVRq1SWBpn
 rI3jxw5FPKPfAnrRZqqV22NN4vrCt+0MgWAaAcv6iAmMfGOL5CcUf9ZZMWGZFRhFBC
 TrZM6Pf4/X6/FFbDo4TxsniUc0aO+lVH0C/Rsf4XoTQNd2ZiUOzLDYkEVuRC2Xf0eg
 t6jq2Trd3/FOcPVYECbXSpQcAFgGAuulYPKg7lyK3GA5xXZmxN8T91uBiKk+Ruhzfh
 cWneKU1nY8fqyoUdpdf5AW5KWz84GyO70HYRgl7oiNE0miDCnjFtg2lYuVFvIvyT7o
 mHiBMOwpkp2rA==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 14/18] ARC: mm: hack to allow 2 level build with 4 level code
Date: Tue, 10 Aug 2021 17:42:54 -0700
Message-Id: <20210811004258.138075-15-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811004258.138075-1-vgupta@kernel.org>
References: <20210811004258.138075-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_174322_876326_05B665DF 
X-CRM114-Status: UNSURE (   8.74  )
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
index 6b5872197005..d08bd09a0afc 100644
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
