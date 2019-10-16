Return-Path: <SRS0=haJm=YJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C145FA372B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Oct 2019 16:24:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 635ED2168B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Oct 2019 16:24:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jXQaace8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BsaK07H4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 635ED2168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bRFNV8b4FfZY8yC/IpV4k+xWehQwzR/0fMOHXqaII3U=; b=jXQaace8i1RfOI
	xlLn8VK5RSxTa/bQIlTxzUB6RwiZoisX5ypzdDdkOloKAwS48MI1gcGE7Bnd1v9iOD1pTS176H3Ec
	dtNGLvb3qnoARtFu/cvI4j2vDCBdUlV16FnxtYjEcEycme30pBUhyYR5GuEGwvfFU2svJ4/Y3Z59t
	ixSZwAD4JilzDUm7Q8PGxyXFczqBbks3EDdEFN/3q6WodkTmv3fRc9xfSYHIOeuXXQI5Lpm2j9Vvt
	I32NgVz5PTTtr9gv6gIJsZkSjI9qyejWvcHbPXYHVPzkmNB0DSG2R4kDFbeX1yhwXWE3t3w9d5Ocj
	fnD4dCngVln9sXICnZrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKm5s-0007Gk-J6; Wed, 16 Oct 2019 16:24:12 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKm5n-0007DS-IC
 for linux-snps-arc@lists.infradead.org; Wed, 16 Oct 2019 16:24:10 +0000
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com
 [10.13.135.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0E0C0C300A;
 Wed, 16 Oct 2019 16:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1571243046; bh=sQQnWNTHgJgqWsf7Fs/Gt9Bwrdd0KhmQt5tqyg196Ac=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BsaK07H4OejHgox9AYlonp99duJAAWde7cz7GBf+tFPHsXVXmb+HN7T8ccVclIIiJ
 tYkVC9dYeEOOP2hlYi44FJNoW1ThNvfskjQBLZl3DFHUvM9LQVkKsJLO3K1lKxNek/
 eRIPZXIsM3bdXaFW+E1xP+2I83QQ4QS7UEBMo5DzyKYO6UIsjW+qMw5/obztNXFt5c
 qqlp+ZtIl+9ahgyCrJcY8kl+J0x00BCqGI7QwFatU0cig+o6IMP8jwXOWkKDgMLbG/
 tYEe4r5CSjzz/Aaw7Ay/8BI1vMVNITF9AL31tdyWaYlrXHXZCVHgNKkwmvYIwRCF2B
 8Kcsyzehu620w==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.61])
 by mailhost.synopsys.com (Postfix) with ESMTP id 935BDA0083;
 Wed, 16 Oct 2019 16:24:04 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-mm@kvack.org
Subject: [PATCH v3 5/5] asm-generic/mm: stub out p{4,
 u}d_clear_bad() if __PAGETABLE_P{4, U}D_FOLDED
Date: Wed, 16 Oct 2019 09:24:00 -0700
Message-Id: <20191016162400.14796-6-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191016162400.14796-1-vgupta@synopsys.com>
References: <20191016162400.14796-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_092407_676317_92FFDC59 
X-CRM114-Status: UNSURE (   9.75  )
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

This came up when removing __ARCH_HAS_5LEVEL_HACK for ARC as code bloat.
With this patch we see the following code reduction.

| bloat-o-meter2 vmlinux-D-elide-p4d_free_tlb vmlinux-E-elide-p?d_clear_bad
| add/remove: 0/2 grow/shrink: 0/0 up/down: 0/-40 (-40)
| function                                     old     new   delta
| pud_clear_bad                                 20       -     -20
| p4d_clear_bad                                 20       -     -20
| Total: Before=4136930, After=4136890, chg -1.000000%

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 include/asm-generic/pgtable.h | 11 +++++++++++
 mm/pgtable-generic.c          |  9 +++++++++
 2 files changed, 20 insertions(+)

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
index 532c29276fce..3d7c01e76efc 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -24,18 +24,27 @@ void pgd_clear_bad(pgd_t *pgd)
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
+ * Note that the pmd variant below can't be stub'ed out just as for p4d/pud
+ * above. pmd folding is special and typically pmd_* macros refer to upper
+ * level even when folded
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
