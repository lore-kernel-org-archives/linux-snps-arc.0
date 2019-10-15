Return-Path: <SRS0=vguH=YI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7342ECE58C
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2019 19:19:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B84F20854
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2019 19:19:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r3MuW4pM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZCwJap5y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B84F20854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/N87tqY/SoA6S41Cnk6fnLn9Or5htoDsh/kbwSIY14U=; b=r3MuW4pMnctcdw
	Jw0b6DLAnd5HvAOLAn4v7MZo+YAM9CkpjTtxrUqhQhLWMaGA758HzK69WWUAH1xwbsrVtzetwTx/A
	mAJVOw6k/xuqXok2bsVJmGsZ9tXEAgY7d/L9pazP6Y+ZEh/AEh0+EK9vFDs0VWRmGOJoq+5KnrkGq
	NIfRBfLgUrQLdatg92yEgj1Rba0Bb3hMwQbFl0q+63kC2AAXzAwJcyBmCSV6U/IRaj6mHTe+itGme
	r3K0eWq3kAOzPIFCyMVM3fT1eMh6Qvvaqwsjv4JNK8374/11vA2JVAlPgQriAMFRTMNxRupkQVd8B
	PfVFC4MfKiMWwIa6uQzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKSM3-00025R-Vg; Tue, 15 Oct 2019 19:19:36 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKSM0-00023G-V1
 for linux-snps-arc@lists.infradead.org; Tue, 15 Oct 2019 19:19:34 +0000
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com
 [10.13.135.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id ED46AC0C42;
 Tue, 15 Oct 2019 19:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1571167170; bh=HXvS8rDRQphESG7ffnx96mHp9U7LHEpSGqJLrluE2qs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZCwJap5yYG7J/fX2/MtXF9Lr8CqjfSDU0gQFHRsYSxx2FEWJi/iuZokzl3Uf30gzg
 SuPpnut/Hlh2Ch2hC3n+P5PJm3A2/zjEQfiX8bTSa8wmOU9PBcPMevWWfwpqKoFzf2
 T8/tJZ0J6978lmKMd9VzQQ6JM3DJeuVkbene5eXKbP4VlpiDzaU50l01SsCeFcLvdK
 uH+nugVtEdJl9nJZd+ADQ1w4DXyIPY516+Nre5nCJS9f77LFY8tTeMC+JX7spZC6+a
 zzgv3/AFp9jYvvdqu55ATtDwmqvP/Ejt2i1bblheBZ9CHGqeYLnBJmR432v9efuxx6
 s9uOiNKbDoBXQ==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.61])
 by mailhost.synopsys.com (Postfix) with ESMTP id 6329BA007E;
 Tue, 15 Oct 2019 19:19:29 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 5/5] asm-generic/mm: stub out p{4,
 d}d_clear_bad() if __PAGETABLE_P{4, u}D_FOLDED
Date: Tue, 15 Oct 2019 12:19:26 -0700
Message-Id: <20191015191926.9281-6-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191015191926.9281-1-vgupta@synopsys.com>
References: <20191015191926.9281-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_121933_008862_5BBFF5EF 
X-CRM114-Status: GOOD (  10.37  )
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
Cc: linux-arch@vger.kernel.org, linux-mm@kvack.org,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This removes the code for 2 level paging as seen on ARC

| bloat-o-meter2 vmlinux-D-elide-p4d_free_tlb vmlinux-E-elide-p?d_clear_bad
| add/remove: 0/2 grow/shrink: 0/0 up/down: 0/-40 (-40)
| function                                     old     new   delta
| pud_clear_bad                                 20       -     -20
| p4d_clear_bad                                 20       -     -20
| Total: Before=4136930, After=4136890, chg -1.000000%

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 include/asm-generic/pgtable.h | 11 +++++++++++
 mm/pgtable-generic.c          |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pgtable.h
index 818691846c90..9cdcbc7c0b7b 100644
--- a/include/asm-generic/pgtable.h
+++ b/include/asm-generic/pgtable.h
@@ -558,8 +558,19 @@ static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
  * Do the tests inline, but report and clear the bad entry in mm/memory.c.
  */
 void pgd_clear_bad(pgd_t *);
+
+#ifndef __PAGETABLE_P4D_FOLDED
 void p4d_clear_bad(p4d_t *);
+#else
+#define p4d_clear_bad(p4d)        do { } while (0)
+#endif
+
+#ifndef __PAGETABLE_PUD_FOLDED
 void pud_clear_bad(pud_t *);
+#else
+#define pud_clear_bad(p4d)        do { } while (0)
+#endif
+
 void pmd_clear_bad(pmd_t *);
 
 static inline int pgd_none_or_clear_bad(pgd_t *pgd)
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 532c29276fce..a5edddc3846a 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -24,18 +24,26 @@ void pgd_clear_bad(pgd_t *pgd)
 	pgd_clear(pgd);
 }
 
+#ifndef __PAGETABLE_P4D_FOLDED
 void p4d_clear_bad(p4d_t *p4d)
 {
 	p4d_ERROR(*p4d);
 	p4d_clear(p4d);
 }
+#endif
 
+#ifndef __PAGETABLE_PUD_FOLDED
 void pud_clear_bad(pud_t *pud)
 {
 	pud_ERROR(*pud);
 	pud_clear(pud);
 }
+#endif
 
+/*
+ * Note that below can't be stubed out for nopmd case:
+ * pmd folding is special and typically pmd_* macros refet to upper level
+ */
 void pmd_clear_bad(pmd_t *pmd)
 {
 	pmd_ERROR(*pmd);
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
