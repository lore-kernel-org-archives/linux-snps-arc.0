Return-Path: <SRS0=haJm=YJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3E0FA372F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Oct 2019 16:24:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 949862168B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Oct 2019 16:24:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lZ+WEu/F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GNRSeiD+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 949862168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2txIrih9iROec95JONkjWFB+FcrRkf7epX6XfUmYnrk=; b=lZ+WEu/FyJbVuC
	qRXmeQkbvJqqwPYZQoFi29HKily6tq4qd/lfN7tcNZAJ5RutsxQ2o1crYSTNz0UhwxVqJpl7xepuS
	PCfXEA5SqpgmbX5vNsx5TQpMQTAZAZhUEBkB/zRqKDpA/yXqii8ASK008oyX3brV2UeoGK3WknhgO
	X+asVrPELX7+SdyqIZYA/OxFo+Z7MItE3tq6WD3aqIgm7mFnNAGQifLUfR7NTQRM6/nMHei0fxmSB
	2ogmlOWerruGzjhk6Iz+mv/nL9ENR62YXYm0uCrXANbD+0ZErSZLW0qJfFfi9ben0S5UR/Z+DQjWT
	yOH3P7rbouc9fnx+qlBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKm5s-0007H8-Qd; Wed, 16 Oct 2019 16:24:12 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKm5p-0007Eb-2O
 for linux-snps-arc@lists.infradead.org; Wed, 16 Oct 2019 16:24:11 +0000
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com
 [10.13.135.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 10620C300B;
 Wed, 16 Oct 2019 16:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1571243048; bh=Q1OWeW46pCK8necNfIb4Cw9P88sWMr95qAMSB5WZ0fs=;
 h=From:To:Cc:Subject:Date:From;
 b=GNRSeiD+nBpYkpwkOSZNxrMIFHMdMmXpHqEClsL06AtAgJBXyUf1Ptp+hlS3r6d2C
 EjhH8bk+lU8LFmOdlWjPimuje4r52uMAvtVkbh7hGCOjjncVug2omGKze/+GDrLjls
 L6/p8sClaz4jRT/iAgpgnHn3U4/w6fqrItaNxY5s94IiEiVDlw0GXUqnWQUeVD4q5T
 M6WKB341jFkyttCEuM5FiSDo4PnvioBPHREC8d6iYf1UKnNiHZDfZbQZMVedoCaCE3
 e6JeBvLZKh54BoFoJ1uEeJ+aD4ssxqTpdUsnmmmzKxb8cB/7m2LqvnGcuwnl6r/0RH
 mABQaLiIsWxNg==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.61])
 by mailhost.synopsys.com (Postfix) with ESMTP id 14661A006D;
 Wed, 16 Oct 2019 16:24:02 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-mm@kvack.org
Subject: [PATCH v3 0/5] elide extraneous generated code for folded p4d/pud/pmd
Date: Wed, 16 Oct 2019 09:23:55 -0700
Message-Id: <20191016162400.14796-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_092409_199547_93A3012D 
X-CRM114-Status: UNSURE (   9.32  )
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-kernel@vger.kernel.org,
 Nick Piggin <npiggin@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-snps-arc@lists.infradead.org,
 Will Deacon <will@kernel.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi,

This series came out of seemingly benign excursion into understanding/removing
__ARCH_USE_5LEVEL_HACK from ARC port showing some extraneous code being
generated despite folded p4d/pud/pmd

| bloat-o-meter2 vmlinux-[AB]*
| add/remove: 0/0 grow/shrink: 3/0 up/down: 130/0 (130)
| function                                     old     new   delta
| free_pgd_range                               548     660    +112
| p4d_clear_bad                                  2      20     +18

The patches here address that

| bloat-o-meter2 vmlinux-[BF]*
| add/remove: 0/2 grow/shrink: 0/1 up/down: 0/-386 (-386)
| function                                     old     new   delta
| pud_clear_bad                                 20       -     -20
| p4d_clear_bad                                 20       -     -20
| free_pgd_range                               660     314    -346

The code savings are not a whole lot, but still worthwhile IMHO.

Please review, test and apply. It seems to survive my usual battery of
multibench, hakcbench etc.

Thx,
-Vineet

---
Changes since v2 [3]
 - No code changes: Fixed the silly typos and collected ACKs

Changes since v1 [1]
 - Per Linus Sugestion remvoed the extra ifdey'ery (hence not
   accumulating Kirill's ACks)
 - Added the RFC patch for pmd_free_tlb() after discussions [2]
 - Also throwing in the ARC patch which started this all (so we get the
   full context of patchset) - I'm ok if this goes via mm tree, should
   be non contentious and can drop this too if Andrew thinks otherwise

[1] http://lists.infradead.org/pipermail/linux-snps-arc/2019-October/006263.html
[2] http://lists.infradead.org/pipermail/linux-snps-arc/2019-October/006277.html
[3] http://lists.infradead.org/pipermail/linux-snps-arc/2019-October/006307.html
---

Vineet Gupta (5):
  ARC: mm: remove __ARCH_USE_5LEVEL_HACK
  asm-generic/tlb: stub out pud_free_tlb() if nopud ...
  asm-generic/tlb: stub out p4d_free_tlb() if nop4d ...
  asm-generic/tlb: stub out pmd_free_tlb() if nopmd
  asm-generic/mm: stub out p{4,u}d_clear_bad() if
    __PAGETABLE_P{4,u}D_FOLDED

 arch/arc/include/asm/pgtable.h      |  1 -
 arch/arc/mm/fault.c                 | 10 ++++++++--
 arch/arc/mm/highmem.c               |  4 +++-
 include/asm-generic/4level-fixup.h  |  1 -
 include/asm-generic/5level-fixup.h  |  1 -
 include/asm-generic/pgtable-nop4d.h |  2 +-
 include/asm-generic/pgtable-nopmd.h |  2 +-
 include/asm-generic/pgtable-nopud.h |  2 +-
 include/asm-generic/pgtable.h       | 11 +++++++++++
 include/asm-generic/tlb.h           |  4 ----
 mm/pgtable-generic.c                |  9 +++++++++
 11 files changed, 34 insertions(+), 13 deletions(-)

-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
