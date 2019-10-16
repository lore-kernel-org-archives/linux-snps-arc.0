Return-Path: <SRS0=haJm=YJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D650FA372A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Oct 2019 16:24:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 436E32168B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Oct 2019 16:24:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GHKLM5Wo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="mVnhWYOM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 436E32168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4bOxM9iQm9WNnOfUpPrMnOg/2Mei7S4VqZO603+s3ZQ=; b=GHKLM5WoShOPWu
	S8z4lfIPN41+uUFuVu1bb5AogIde/xUoXZ5VbsoxqHEBV9MrlMa/EsP/mb+NdQM/qC1b4GiJLAtzi
	ZvW6iiucQhllRnYpMHc1GVmHH4QIDjgh7Qz3i2VstM5Ax2q4OiHsnnyLMm4zUWW+eWZNjuDQQfZqJ
	OYOlZrNEda+xFZYzvDw5bXr445buEM5Fkjqfu4BB1w76j3a0az20o9k5av4u9DROydVp7pQj9P1rD
	rH/PTKskkOKPAPigwlF1S4FYPNlY1Ol8S+RqzqhDWFG3nWqm8S+zvSdvG20i0egju4Cz48KebdbEe
	kvHxz60XnTpn/yEuuQlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKm5q-0007FC-0t; Wed, 16 Oct 2019 16:24:10 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKm5n-0007DQ-IB
 for linux-snps-arc@lists.infradead.org; Wed, 16 Oct 2019 16:24:09 +0000
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com
 [10.13.135.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 00485C3006;
 Wed, 16 Oct 2019 16:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1571243046; bh=I83LSLyqJ3n0GzQ1+sT02W9/9Z0LbDBtsN2auGtpAaE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mVnhWYOMOtzVRxSoWjsbiXp8fHrwtS9YMzNXCKPRO/Aetx1ogSf706iRyJKzLeccp
 +kWaDRKzTqHzLJeRMn850VmVRlSFQtADSIHn8DyDbaAwIB6z/as9Lx2sXw4SU9zi05
 7yv7p+QsBHdgUZlRQOKbfeJxZFmZr5BYVWNsobI2at++Vy8lbTYWs5RWMrnTjBWj4Z
 1dNcYUW4+J2m/OA/5lsgEM3MINWYoh24edgnlUEhs47cpyZ7iVEjk282LLd6f/jYF9
 8dJyW1YFv+TH605rIRuhV9FBAdsDMo2ahTxrZiskFJ8UaKYhONh4BTPa+48ErX7W2m
 uL1mSffnxaRrA==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.61])
 by mailhost.synopsys.com (Postfix) with ESMTP id 77CE9A007D;
 Wed, 16 Oct 2019 16:24:04 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-mm@kvack.org
Subject: [PATCH v3 3/5] asm-generic/tlb: stub out p4d_free_tlb() if nop4d ...
Date: Wed, 16 Oct 2019 09:23:58 -0700
Message-Id: <20191016162400.14796-4-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191016162400.14796-1-vgupta@synopsys.com>
References: <20191016162400.14796-1-vgupta@synopsys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_092407_675070_664D96AE 
X-CRM114-Status: GOOD (  11.52  )
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

... independent of __ARCH_HAS_5LEVEL_HACK

This came up when removing __ARCH_HAS_5LEVEL_HACK for ARC as code bloat.
With this patch we see the following code reduction

| bloat-o-meter2 vmlinux-C-elide-pud_free_tlb vmlinux-D-elide-p4d_free_tlb
| add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-104 (-104)
| function                                     old     new   delta
| free_pgd_range                               552     422    -130
| Total: Before=4137172, After=4137042, chg -1.000000%

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 include/asm-generic/5level-fixup.h  | 1 -
 include/asm-generic/pgtable-nop4d.h | 2 +-
 include/asm-generic/tlb.h           | 2 --
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/asm-generic/5level-fixup.h b/include/asm-generic/5level-fixup.h
index f6947da70d71..4c74b1c1d13b 100644
--- a/include/asm-generic/5level-fixup.h
+++ b/include/asm-generic/5level-fixup.h
@@ -51,7 +51,6 @@ static inline int p4d_present(p4d_t p4d)
 #undef p4d_free_tlb
 #define p4d_free_tlb(tlb, x, addr)	do { } while (0)
 #define p4d_free(mm, x)			do { } while (0)
-#define __p4d_free_tlb(tlb, x, addr)	do { } while (0)
 
 #undef  p4d_addr_end
 #define p4d_addr_end(addr, end)		(end)
diff --git a/include/asm-generic/pgtable-nop4d.h b/include/asm-generic/pgtable-nop4d.h
index aebab905e6cd..ce2cbb3c380f 100644
--- a/include/asm-generic/pgtable-nop4d.h
+++ b/include/asm-generic/pgtable-nop4d.h
@@ -50,7 +50,7 @@ static inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
  */
 #define p4d_alloc_one(mm, address)		NULL
 #define p4d_free(mm, x)				do { } while (0)
-#define __p4d_free_tlb(tlb, x, a)		do { } while (0)
+#define p4d_free_tlb(tlb, x, a)			do { } while (0)
 
 #undef  p4d_addr_end
 #define p4d_addr_end(addr, end)			(end)
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 5e0c2d01e656..05dddc17522b 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -594,7 +594,6 @@ static inline void tlb_end_vma(struct mmu_gather *tlb, struct vm_area_struct *vm
 	} while (0)
 #endif
 
-#ifndef __ARCH_HAS_5LEVEL_HACK
 #ifndef p4d_free_tlb
 #define p4d_free_tlb(tlb, pudp, address)			\
 	do {							\
@@ -603,7 +602,6 @@ static inline void tlb_end_vma(struct mmu_gather *tlb, struct vm_area_struct *vm
 		__p4d_free_tlb(tlb, pudp, address);		\
 	} while (0)
 #endif
-#endif
 
 #endif /* CONFIG_MMU */
 
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
