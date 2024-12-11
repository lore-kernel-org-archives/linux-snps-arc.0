Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED34E7717D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Dec 2024 23:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5c4burNb6LsHXAV73TNmXmgLcdywt1gUTE7ERazZILs=; b=fVB4kYJgwzu0ZlTVa3oKAP1u8W
	LHKE8HO4uMgon6CSROzz4fVbb3eB9G9NcqR4BI68JxDMLRulKg7KPthAo7zW88fNYZ6T6nozVNnIK
	gRa9PRf2v7kbsjiS2//Dv7+gQ3ynBJYD243Q4oTlHkXIW8c4qOjZAhc7NBWlVhsBtBibak720DDAl
	lySix4QEur31M+g25aW97bgElQcsFi06IPTc4ImTOiPvNEyRTbkX2wBLMCM91/d8DCMbTdpXDFZ6g
	U85jN5oPD7RbkD7BIdC6ZskfqJd+aWZSOffSKYSeFbRKA8Xhk/SP5KDi+2AZbeE4MJe8DcErGbSad
	egVF1rTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWHz-0000000GUfh-3vWZ;
	Wed, 11 Dec 2024 23:38:43 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7y-0000000GSa5-2BMM
	for linux-snps-arc@lists.infradead.org;
	Wed, 11 Dec 2024 23:28:23 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-725cf25d47bso14398b3a.2
        for <linux-snps-arc@lists.infradead.org>; Wed, 11 Dec 2024 15:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959701; x=1734564501; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UgF7uGjYnhvUd+Jp5od3s3bWQayM3Oz+R04wRikqyig=;
        b=LxAuibNI9/xLSXf98Ad3If6UwR18JvaJYwPEzzThyQZzELjy1t6PC/XBYgkvBbX6Bp
         CbTZ1Cz7bUX8qhxtpgvolDGGQw8FmgAHL7ug8nVmGS7FEAE8ZW8vagftvHwBddIkRJmX
         CrvCEu5p37aUpFI673SRBItQpF9PotT5flp9eZlyIdgL5tasK2wvsy27k6KBP33l6UF7
         M1grxCTW8t+vPyuvJcOlnlWR2trBQfys9n+FhT22+zmUGWvsodDv8W/NOKUjFlltNIrE
         FMzfnvw/j/5MaovinIXdVEDtA1Zt+Y32uS1+QF+un42+uHYy0ozWIc3gyEuon8fsw2pR
         P2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959701; x=1734564501;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UgF7uGjYnhvUd+Jp5od3s3bWQayM3Oz+R04wRikqyig=;
        b=Px9M1JhkiiExH5N+LW6I0JbHmNYAxqP3umerHKxseV02w82JBfP5iHAsr++YoK5zPU
         PdBMRzvN9IDruwRTCaKR4I4nvwwfqltsCizjVed/TevgRk4x7XUPU/OuZi5wm4Hew0Kc
         dMNGEQlZMNdhkNB2a4VMTxVo6+9ApI8J3rA2A7Ny+1cTHxm8P9wXNrlzLCHnME1SRoct
         2iITJ2nvpx96BAqYeDuLuYuS0Pex2cr9zchPA/Ha5vU2mPMJwskO0IJRgKjeC2acp/7h
         swwBk0I1V1+YWS6A9IgxZqr6pN3l1jMEmZ7iqa+PAd9zNVNd2WQ/LoSF0YTnZ6AFa0wi
         x3vQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5NMbKXVedKdDxRpC+Oxs0IZ9sdCODApkD7hCAHo7F0iJ5uxsZVi8QS8njLY9eEHEWV1Pv+CRYW3WVVrG+3g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/Tr/PXlwGogdKheAXgHmuBV8asQJ1xhUSTKKxYbuD7ZWC4Q0t
	u2BkRDBJzNef0d+CCGG2P0aWB6tKTeasDcqrVXqARv5gPfb8AFRSlWJ2Gv4SQcPIt5HGfh+9sNl
	M66rPpIjHytv3lb5TtcSXJg==
X-Google-Smtp-Source: AGHT+IFqVvEP6jzHMp67taGtKGZyTqxXNFEg2GPfnpgGUKbuvSmZTqL3vNpWjeuOs0OQEe1804BSml5OhCqqS6mIfw==
X-Received: from pfbdw6.prod.google.com ([2002:a05:6a00:3686:b0:725:d2c1:3f5f])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:43ac:b0:1e1:9fef:e974 with SMTP id adf61e73a8af0-1e1ceb34d58mr1527638637.24.1733959700835;
 Wed, 11 Dec 2024 15:28:20 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:50 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-13-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 12/16] mm: sparc32: Introduce arch_mmap_hint()
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
X-CRM114-CacheID: sfid-20241211_152822_551444_9071315F 
X-CRM114-Status: GOOD (  13.98  )
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

Introduce sparc32 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.

If a sufficiently sized hole doesn't exist at the hint address,
fallback to searching the entire valid VA space instead of only
the VA space above the hint address.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/sparc/include/asm/pgtable_32.h |  1 +
 arch/sparc/kernel/sys_sparc_32.c    | 33 +++++++++++++++++++----------
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
index 62bcafe38b1f..95084c4d0b01 100644
--- a/arch/sparc/include/asm/pgtable_32.h
+++ b/arch/sparc/include/asm/pgtable_32.h
@@ -437,6 +437,7 @@ static inline int io_remap_pfn_range(struct vm_area_struct *vma,
 
 /* We provide our own get_unmapped_area to cope with VA holes for userland */
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_MMAP_HINT
 
 #define pmd_pgtable(pmd)	((pgtable_t)__pmd_page(pmd))
 
diff --git a/arch/sparc/kernel/sys_sparc_32.c b/arch/sparc/kernel/sys_sparc_32.c
index fb31bc0c5b48..0cc717755417 100644
--- a/arch/sparc/kernel/sys_sparc_32.c
+++ b/arch/sparc/kernel/sys_sparc_32.c
@@ -40,13 +40,17 @@ SYSCALL_DEFINE0(getpagesize)
 	return PAGE_SIZE; /* Possibly older binaries want 8192 on sun4's? */
 }
 
-unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
-	struct vm_unmapped_area_info info = {};
-	bool file_hugepage = false;
+	bool file_hugepage;
+
+	/* See asm-sparc/uaccess.h */
+	if (len > TASK_SIZE - PAGE_SIZE)
+		return -ENOMEM;
 
-	if (filp && is_file_hugepages(filp))
-		file_hugepage = true;
+	file_hugepage = filp && is_file_hugepages(filp);
 
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
@@ -58,14 +62,21 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 		return addr;
 	}
 
-	/* See asm-sparc/uaccess.h */
-	if (len > TASK_SIZE - PAGE_SIZE)
-		return -ENOMEM;
-	if (!addr)
-		addr = TASK_UNMAPPED_BASE;
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
+unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len,
+				     unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
+{
+	struct vm_unmapped_area_info info = {};
+	bool file_hugepage = false;
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.length = len;
-	info.low_limit = addr;
+	info.low_limit = TASK_UNMAPPED_BASE;
 	info.high_limit = TASK_SIZE;
 	if (!file_hugepage) {
 		info.align_mask = (flags & MAP_SHARED) ?
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
