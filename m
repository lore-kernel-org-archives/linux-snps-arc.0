Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B35FE7717D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Dec 2024 23:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pI4wIs2Wq0qefEX4eu+j/jQpamKpeWwatY1qfCLKCoY=; b=NdvRBio4M4frkVSrPI5hZFCiSW
	AmWkAmNA5u08WxHqAha8NNQYo5190vA2EYS61wsPcBglcHKNu52mXB3L0yHP8iUrLj4zbG6Zh21A5
	iCtFfpIw+CiiWWtxFURUIt9KgWwZnfTPTGJXnEYvtRoplLhWK9Sehz1B4h+FGVK4akPJYnPia2mr3
	XUK0VwLFEoQWrE/ufZ1enzgAikgacXjh5xo/Okd0l+AWdUXidLifqpPUv1WUUiU/+9J0tQ14V9xvt
	OSOEvNVcjho5SjbinzD5hheyK/ZZGkhZuSRMR0vhMaO3HyKLZqKQ7ND5KvTWU26KbGCjXqRlDGU/l
	k4BLtEXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWGy-0000000GUYS-0IOZ;
	Wed, 11 Dec 2024 23:37:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7y-0000000GSaA-2ii9
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 11 Dec 2024 23:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6OFip67XXDkH1HTauBcRO/RiBVwg85LoldBpce5+fvY=; b=YA4IrV+vS7uBSag+4tnM8qav4g
	2zxwBfmLxvTSMO0A0XlXZqEk12Pgl01SpTX6nnULMkxJzqOFhhOHF8PnVcu3bO+fM83PlTmmQZ73J
	dRXhU4fb0E1nHWZOqEhUoboWOSnyxlCkqx8LzpAiPPmJF+IYmcTZXhmy2SrYCnxvCmKJGutUxsAYS
	9jcag/yBHjimRkVlGWdNdDpYDX/NJ9lzNbLKaOn/uriDHo15JYY9bx/ucRZpDE+5F9DdDy5oXokLI
	omLPWSsCpGcQ3DLm/Tbj7EePUZDvEOhZ1kiMEeLEEFm8sbUqpKXPA2AavnOiFbXlFYbiLaPb7iqpc
	O7Z4wLcw==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7v-00000001eUK-3DcP
	for linux-snps-arc@lists.infradead.org;
	Wed, 11 Dec 2024 23:28:21 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-728e177bc36so23368b3a.3
        for <linux-snps-arc@lists.infradead.org>; Wed, 11 Dec 2024 15:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959697; x=1734564497; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6OFip67XXDkH1HTauBcRO/RiBVwg85LoldBpce5+fvY=;
        b=Kx+rYiIbY4N1ReAGyHcehO8AAMvgX8JVBnbPvkrlcqCnO1ywTCPOoxyHpVnjVZ2+Id
         pHOjUkhCwF4i9Zpb44nt7GmP/b2jGK89yI3LBs0VJXm8RVBhSXS/+fRSv4o7nVWjcnJ/
         XJ/50hAlxCqrfXvgjROjgycMJcfncaA3aTrPbBOmlJXbWfB+gWJWNK7Eykv8zVg5NKUC
         B8yJH4hT5HQeiDjYneHMds1rFat9X53daynvpJFqXYlpdcHKXTBR87dMPXMEmBxpllyH
         6dPsHgFkvRpLtYxXnM8SC64xv8+CkjDRO+uSs/K5whMP2pD71PCM92cm9UtY6ZTFc1w3
         2kTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959697; x=1734564497;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6OFip67XXDkH1HTauBcRO/RiBVwg85LoldBpce5+fvY=;
        b=T+BmDM3FZc2uuEEzKQ9CA4zjdgVY7lLOaW6G6dt+07BxAMROr7L2Op5Rd0ACIxjvgW
         jTBHwopdecIK0P8Sr7jMX8p3w0IEW9/bm9Jj3SxDWX/pGAWFOnCSWYFZYYbmB5vro1pw
         X7ZOJ1pjh3JXl/oYLLSmm6bwpzYGSc8X9X92QsY1/f0j00XOVC7nbIr3DwI0fJ0RDf02
         ibi5ikfaQaOtBFGR3bW5yEl1M4tTF5SF6U8whFR5k/VaYiU+DJHMrQkgGq20PN/MH1sw
         +p4sceSzsC+q4Mq7uUJrY7nokTbOqz/3PdM/TrMLlVLNHQ1xTuw4ciqHuZ3EiBoHJqSx
         jXXA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ55M+FWWiIGIEtcX/VMwCjaczMIB4Cg0ioNklktkgN9xBrgLl/NeBb0m+jQubXQnQH0yX105uVJFuPPw9MA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOZzAorXKN4dOxZLSQwKAPsnnkhq+JuN0gkp9yG2rJgR3y96/a
	0oWBOL8YpZWiDicLAQqW2ukchgNaQMHtm9c6al8Re9SW8EBKZRV2rRE2SB2o/NnMBvG8zOi2yL+
	0lA65O8iTsZUB5Za+HwEoGg==
X-Google-Smtp-Source: AGHT+IHidwQ3DrDPNLywyhRXMiEnGjaKCiBaEc5hXwYPZZjpJE9GCWopm3osDWhhLjTFzQGtE2yr4rptNlkPUN/bOw==
X-Received: from pfbch7.prod.google.com ([2002:a05:6a00:2887:b0:725:e05b:5150])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:99f:b0:725:e015:909d with SMTP id d2e1a72fcca58-728faadfd6cmr1845767b3a.21.1733959697352;
 Wed, 11 Dec 2024 15:28:17 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:48 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-11-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 10/16] mm: s390: Use generic_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_232819_839852_34A9D2A8 
X-CRM114-Status: GOOD (  13.92  )
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

Introduce s390 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/s390/include/asm/pgtable.h |  1 +
 arch/s390/mm/mmap.c             | 51 +++++++++++++++------------------
 2 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 48268095b0a3..eaecb558ab9b 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1997,6 +1997,7 @@ extern void s390_reset_cmma(struct mm_struct *mm);
 /* s390 has a private copy of get unmapped area to deal with cache synonyms */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #define pmd_pgtable(pmd) \
 	((pgtable_t)__va(pmd_val(pmd) & -sizeof(pte_t)*PTRS_PER_PTE))
diff --git a/arch/s390/mm/mmap.c b/arch/s390/mm/mmap.c
index 33f3504be90b..8afb046605c9 100644
--- a/arch/s390/mm/mmap.c
+++ b/arch/s390/mm/mmap.c
@@ -83,28 +83,33 @@ static int get_align_mask(struct file *filp, unsigned long flags)
 	return 0;
 }
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	/* requested length too big for entire address space */
+	if (len > TASK_SIZE - mmap_min_addr)
+		return -ENOMEM;
+
+	if (flags & MAP_FIXED)
+		return addr;
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 				     unsigned long len, unsigned long pgoff,
 				     unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	struct vm_unmapped_area_info info = {};
 
-	if (len > TASK_SIZE - mmap_min_addr)
-		return -ENOMEM;
-
-	if (flags & MAP_FIXED)
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (IS_ERR_VALUE(addr))
+		return addr;
+	if (addr)
 		goto check_asce_limit;
 
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr && addr >= mmap_min_addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			goto check_asce_limit;
-	}
-
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = TASK_SIZE;
@@ -123,25 +128,15 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long ad
 					     unsigned long len, unsigned long pgoff,
 					     unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
 	struct vm_unmapped_area_info info = {};
 
-	/* requested length too big for entire address space */
-	if (len > TASK_SIZE - mmap_min_addr)
-		return -ENOMEM;
-
-	if (flags & MAP_FIXED)
-		goto check_asce_limit;
-
 	/* requesting a specific address */
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr && addr >= mmap_min_addr &&
-				(!vma || addr + len <= vm_start_gap(vma)))
-			goto check_asce_limit;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (IS_ERR_VALUE(addr))
+		return addr;
+	if (addr)
+		goto check_asce_limit;
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
