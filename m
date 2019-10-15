Return-Path: <SRS0=vguH=YI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D457DECE596
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2019 19:19:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8BBC217D6
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2019 19:19:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iS3kgPbS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZLSPKlF3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8BBC217D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5vtH41i/FKhqvzvxkeCF2uvmhQ81kRe8HrEw39BgnDo=; b=iS3kgPbSHwH7th
	9DBPYgR/BKQabwzrSKLtZoyEb7njzA8lTftHadhhzqxM2B0xjkRtE73F32uoZu23BN4s0A7tYIhOn
	WgcNtQw+C8rTQyZyTHCzJAbn4908PDEqV2gVNmNrAejV8DfoDP+GUPQMjlo2AtHMcAkDh9qzdhyGC
	wjHZ3izhfIVMLTq1WmDFMn6pX+xcSKRfz3ixIJGORWhEtW3WqkPXtAS7MTMG08UMGLWgj27202y76
	ANn707Rlhx7P/rDq+tupq8d2d2Eb3x36FUXpXrCYxfq72oNMRg8tSuwOi3XzYTsIS/roxpp15rZ4G
	7Z5rpZWJ8CFujTtD8tvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKSM4-00025k-BQ; Tue, 15 Oct 2019 19:19:36 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKSM0-00023K-V0
 for linux-snps-arc@lists.infradead.org; Tue, 15 Oct 2019 19:19:34 +0000
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com
 [10.13.135.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E20F5C0C5D;
 Tue, 15 Oct 2019 19:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1571167171; bh=TWgIAs403uWUV0wYIkngd1fRYFF87Lk2XfM7j9v1Avg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZLSPKlF3qsHIMHjNHX42zIg6rv8COLc9ZMJr/pGptVwfRJeIM+xBDW23wXMHCEVNa
 MdVqy65PrxiOrKXzvojFPr+6dSgi7PY8JlLojB2pZn2bFOb6oCxhtEbQUVqF255oJA
 LyUfQHIS/UX534EhoNu01ZjN18aS4TmWn5li0jWye2T8VA4ZwTJlRROsxbQfDb9s58
 hEWVJ8J8flWGQEjC8bofa3jNnhZqJGTIgoWyod5l+i8d9VOTPKoCldNKBcDxvfvY5Z
 CKF2IMWPRfD+aRsAVJimGOKOR9SW11l0ER/m6tKSlMXtJQ0gkbkAfkwR6G79h/qHjg
 Eht8vPO+SeINQ==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.61])
 by mailhost.synopsys.com (Postfix) with ESMTP id 4C1A7A007D;
 Tue, 15 Oct 2019 19:19:29 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 4/5] asm-generic/tlb: stub out pmd_free_tlb() if nopmd
Date: Tue, 15 Oct 2019 12:19:25 -0700
Message-Id: <20191015191926.9281-5-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191015191926.9281-1-vgupta@synopsys.com>
References: <20191015191926.9281-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_121933_007716_FD34E91B 
X-CRM114-Status: GOOD (  11.22  )
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

Note that pmd routine folding can be tricky as even in 2-level setup
(where pmd is folded) most pmd routines refer to upper levels.
This one can surely be elided however.

| bloat-o-meter2 vmlinux-E-elide-p?d_clear_bad vmlinux-F-elide-pmd_free_tlb
| add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-112 (-112)
| function                                     old     new   delta
| free_pgd_range                               422     310    -112
| Total: Before=4137042, After=4136930, chg -1.000000%

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 include/asm-generic/pgtable-nopmd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/asm-generic/pgtable-nopmd.h b/include/asm-generic/pgtable-nopmd.h
index b85b8271a73d..0d9b28cba16d 100644
--- a/include/asm-generic/pgtable-nopmd.h
+++ b/include/asm-generic/pgtable-nopmd.h
@@ -60,7 +60,7 @@ static inline pmd_t * pmd_offset(pud_t * pud, unsigned long address)
 static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 {
 }
-#define __pmd_free_tlb(tlb, x, a)		do { } while (0)
+#define pmd_free_tlb(tlb, x, a)		do { } while (0)
 
 #undef  pmd_addr_end
 #define pmd_addr_end(addr, end)			(end)
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
