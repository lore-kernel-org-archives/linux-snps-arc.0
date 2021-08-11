Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC34C43216
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C066760EB5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 00:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C066760EB5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fe7G/Q3uK+fw5I8rrTyNGfxa2u3PRYyN4eXJvNMoen4=; b=S4h6JBs4pZNbgY
	KIz2wLu6/KKkZvPlbEh3wDcIDzfTr/vP8a3Aen2h/K4y6t73xHqYMgVFs+0Uvwls1/7GTsbHwlcFM
	QF1SSMi0SIgeHiWyD2YJMtFIFoX4wSjXhkDhTaclzAWt1F4Rxl+aq/D31vPERBpvllcH8NTXByHn4
	u6kDDJNtyjZY+UHBKJu+Sp59yBH+8uGvfQ8VRY6Izu8fI4EAFoEka/jfi4LRjdzQIH35mBqyFO/cV
	XaKZf1/edWqxlZAAcMNJW/2tkRL6SHOag0zJkaq+yniOw7RU2L+ImqnVZRRopjcm0U/PvCMO6k1Y8
	55aipSCtuj+49Hu6QEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDcL8-0056ly-Ng; Wed, 11 Aug 2021 00:43:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDcL3-0056fH-E9
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 00:43:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E229B60EDF;
 Wed, 11 Aug 2021 00:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628642601;
 bh=rQG6R4IYtK009L51KoLDJPAjJafHG5PoJg6sbJHan6E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DJg+8ueSH0w/uLEJilaVjKfT7/1op5f9m25OKoODB2hgOotmDiKaiWNsqlSSJFjWa
 I184RC/qwaFr3Qxsf9BJ26Wjz+PnlteUyda2kOpu1K6VbC/nasY6d5hW8DYjn/WWDL
 hDzArlo4G20vmIyrDFCP94XrRzXCnTmzUfnY9X2IYALSRgT66zRyKRXAJliAEtpt6E
 Y8r94qPZjjfFn2porTkDsupsx0dUBiMIqZzn6ww0B0d1Sv1nWhSn7L5BYLwxWXm3kq
 L2IG9lDzZVjkulLxDzXvYk2Tx4sRr1sIbfds+xs2KQPooGRGNYWAXU42SlIi64Pbf5
 N7KCYFHYLALnA==
From: Vineet Gupta <vgupta@kernel.org>
To: linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Mike Rapoport <rppt@kernel.org>, Vineet Gupta <vgupta@kernel.org>
Subject: [PATCH 11/18] ARC: mm: move MMU specific bits out of entry code
Date: Tue, 10 Aug 2021 17:42:51 -0700
Message-Id: <20210811004258.138075-12-vgupta@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811004258.138075-1-vgupta@kernel.org>
References: <20210811004258.138075-1-vgupta@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_174321_575362_C73D9BB0 
X-CRM114-Status: UNSURE (   9.06  )
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

Signed-off-by: Vineet Gupta <vgupta@kernel.org>
---
 arch/arc/kernel/entry.S | 6 ------
 arch/arc/mm/tlb.c       | 3 +++
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arc/kernel/entry.S b/arch/arc/kernel/entry.S
index 2cb8dfe866b6..684efd094520 100644
--- a/arch/arc/kernel/entry.S
+++ b/arch/arc/kernel/entry.S
@@ -101,12 +101,6 @@ ENTRY(EV_MachineCheck)
 	lr  r0, [efa]
 	mov r1, sp
 
-	; hardware auto-disables MMU, re-enable it to allow kernel vaddr
-	; access for say stack unwinding of modules for crash dumps
-	lr	r3, [ARC_REG_PID]
-	or	r3, r3, MMU_ENABLE
-	sr	r3, [ARC_REG_PID]
-
 	lsr  	r3, r2, 8
 	bmsk 	r3, r3, 7
 	brne    r3, ECR_C_MCHK_DUP_TLB, 1f
diff --git a/arch/arc/mm/tlb.c b/arch/arc/mm/tlb.c
index b68d5798327b..34f16e0b41e6 100644
--- a/arch/arc/mm/tlb.c
+++ b/arch/arc/mm/tlb.c
@@ -813,5 +813,8 @@ void do_tlb_overlap_fault(unsigned long cause, unsigned long address,
 		}
 	}
 
+	/* Re-enable MMU as hardware may have auto-disabled it upon exception */
+	write_aux_reg(ARC_REG_PID, read_aux_reg(ARC_REG_PID) | MMU_ENABLE);
+
 	local_irq_restore(flags);
 }
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
