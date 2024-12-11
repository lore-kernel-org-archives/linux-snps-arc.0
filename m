Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8E6E77180
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Dec 2024 23:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bBqhh4JdB9qi9Pg0nZ06dMYnEqHtvD4DOhhDehoBJnY=; b=SN26IgccZ/ORFbwbBliHDBcHB2
	n7GtiUNSixAasL9897mRKtSY0wlMQKcJwGy6LqxG3KHdwt3LE7f3J+eWNH7135TdNZwUNf1lISqcr
	e+edcxOc1wpDBAl7avBVDokbQ/GdL8Kfd50AW9aUlirpIZSOA1QdgvsQtvor5DJnShAiYFEZfHvUS
	PoJVtDoDJvN2ADdAE57xpShsj2LSrZmM1kH8Bq4o3EnuL+ffHQ1SctKCmS/+WG8NokkupxSNIMCyH
	1azoRMd5OnyQidRx/KZxJhfk8fWcQ4eRtkmgFQfU0AQubH2YBbH5JvxLpJgp7f0ossqY2Xq/QFECc
	JPZFBkUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWAm-0000000GTcl-01UP;
	Wed, 11 Dec 2024 23:31:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7l-0000000GSVm-2hRS
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 11 Dec 2024 23:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=C3IQSr9A1qLdVskR9rEe7ppqc2lFkJy3Q6Qw5iPRaPE=; b=bjxAGLAijpOGeSBg8+QHgKgl7n
	oP6/PignGEJ8I/Jdz4PTaCMzRlc1v94fyh1MJmLuBfNvH3UECOsLBHLT6aNAlgHjZN266k/I32rMC
	xpDnbjuc2hQTJbE+SfkC4YhaoayM/IQQwAz0nCrHYt/zxz06FRj71SRtwQ50qFan9z1nu8T+vm5dw
	+n/CQOuqy7nxvuWqG67Y4/XZX/45W79dJxTbbx/y0Y6a4T47GepwIcRxzd2k9Xk7jR/sW4zqpIODH
	UQLs3mGfSfwztzJtUYP0GpkowO2NfspkZBma1vR2nrM20Ccf93B9DotU06XAwv5uSJJzROLXyfNxy
	1sWDjmeQ==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7h-00000003vye-0H0r
	for linux-snps-arc@lists.infradead.org;
	Wed, 11 Dec 2024 23:28:07 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-725cab4d72bso19301b3a.2
        for <linux-snps-arc@lists.infradead.org>; Wed, 11 Dec 2024 15:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959682; x=1734564482; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=C3IQSr9A1qLdVskR9rEe7ppqc2lFkJy3Q6Qw5iPRaPE=;
        b=00F0bz5e+gNvXHk4Kq2xxctR6EeaQvHU6ZIZ06lX92r95IhpdNJ1XZQumZ/LmVNPhQ
         szIpcXSJ2LGy6Wi9Ce0wbtMRLhsKqulXtThUXLfW4m3i0ZpcVjJNSyq0b8LurwHulWJ/
         XMnwGa04NczRlqRFjYXmjYe6WZ7q1eovryEMS44ETTQ6UyP1GpWJGNuFolJfN7pYiawK
         DQKzDDebJyWbbRd++Jql1HS0gH29dRkpzKZj7xzXABHxlaSYcdyKUknrEbl5MFDUacHM
         ATM2yQ5wl1e5fvKMNjrIEi90crqr5w2qqxCqjnA8HkTU7SPKDQ9i0gryFw0lMuPQ/+Mc
         QffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959682; x=1734564482;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C3IQSr9A1qLdVskR9rEe7ppqc2lFkJy3Q6Qw5iPRaPE=;
        b=um7CD0LKBVIwUhE08aoTLhFX5E27oRTaJoXLGUuJHeTCD6I6ZRxXXq9ecy95Rt6p8X
         9vhirZqgwZq49L+8lVtf9W1MkaxYZ6sUINhK0XumSLWf9elJEB7ww8NKrdHkGi0zjF+p
         rjsbKB5BFm6+DKfa9WWxLeEGugKH1Q74S9AzMzZIuR2nl7nIRUehsEZ4pyba9LVUPWQT
         prmliIY8JHfhCmxUEPdvnLwqAoXPdV0Rr3xCqr8F+Dz1M6VOpQispaEhCwtZLFxX2NmX
         yE3d0g1Z8jdY0Dq2+VHSn9FGkRNVvOvgoe/oRxoSS7S6sXat7/lPAvC3BNoBmqXP6KJ2
         pM/A==
X-Forwarded-Encrypted: i=1; AJvYcCX49GLH5BpytYKAbRJA19xL2W4YWjFSNOtejeycOCB80NqKX/i5/eXldipBfI3VWlM/83NUsJIsYW4CDpSHNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLGbZLuUh9naPoX1Tiz+4agSRKyuiZPVCb4vX3edSsCFPW9JiV
	UI4wzzAOQynHDx3PO9E0mN0GOEXh+UeQeYhi2unonElWKGTPUT+Ll/4/se1c8+xY/xncw8c/PWT
	LzH9CRXja1d5iPGX3Ig6F4g==
X-Google-Smtp-Source: AGHT+IHwoWCnSZAFhgfRGzh0vJKMetndx4pRL/iGA/i3q5lPp5GtpRRmcU9xCr75DNYXJvBdH8Wl1Hh5YkFK8klCiw==
X-Received: from pge13.prod.google.com ([2002:a05:6a02:2d0d:b0:801:9432:2d6d])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:cf83:b0:1d9:18af:d150 with SMTP id adf61e73a8af0-1e1ceafb16amr1741157637.21.1733959681795;
 Wed, 11 Dec 2024 15:28:01 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:40 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-3-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 02/16] mm: x86: Introduce arch_mmap_hint()
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
X-CRM114-CacheID: sfid-20241211_232805_372335_447147D1 
X-CRM114-Status: GOOD (  16.58  )
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

Introduce x86 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Fallback to generic_mmap_hint() if an architecture doesn't
provide HAVE_ARCH_MMAP_HINT.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate most of the error handling in arch_mmap_hint().
  - Fallback to generic_mmap_hint() if arch_mmap_hint() is not provided.

 arch/x86/include/asm/pgtable_64.h |  1 +
 arch/x86/kernel/sys_x86_64.c      | 64 +++++++++++++++----------------
 include/linux/sched/mm.h          |  5 +++
 mm/mmap.c                         |  9 +++++
 4 files changed, 45 insertions(+), 34 deletions(-)

diff --git a/arch/x86/include/asm/pgtable_64.h b/arch/x86/include/asm/pgtable_64.h
index d1426b64c1b9..4472fd0040c3 100644
--- a/arch/x86/include/asm/pgtable_64.h
+++ b/arch/x86/include/asm/pgtable_64.h
@@ -245,6 +245,7 @@ extern void cleanup_highmap(void);
 
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #define PAGE_AGP    PAGE_KERNEL_NOCACHE
 #define HAVE_PAGE_AGP 1
diff --git a/arch/x86/kernel/sys_x86_64.c b/arch/x86/kernel/sys_x86_64.c
index 776ae6fa7f2d..008c6d19bd02 100644
--- a/arch/x86/kernel/sys_x86_64.c
+++ b/arch/x86/kernel/sys_x86_64.c
@@ -123,31 +123,44 @@ static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
 	return 0;
 }
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	unsigned long begin, end;
+
+	find_start_end(addr, flags, &begin, &end);
+
+	/* requested length too big for entire address space */
+	if (len > end || len > TASK_SIZE)
+		return -ENOMEM;
+
+	/* No address checking. See comment at mmap_address_hint_valid() */
+	if (flags & MAP_FIXED)
+		return addr;
+
+	addr = PAGE_ALIGN(addr);
+
+	/* Fallback to VA space search? */
+	if (!mmap_address_hint_valid(addr, len))
+		return 0;
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long
 arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len,
 		       unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
 {
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	struct vm_unmapped_area_info info = {};
 	unsigned long begin, end;
 
-	if (flags & MAP_FIXED)
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
 		return addr;
 
 	find_start_end(addr, flags, &begin, &end);
 
-	if (len > end)
-		return -ENOMEM;
-
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma(mm, addr);
-		if (end - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
-
 	info.length = len;
 	info.low_limit = begin;
 	info.high_limit = end;
@@ -168,34 +181,17 @@ arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr0,
 			  unsigned long len, unsigned long pgoff,
 			  unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma;
-	struct mm_struct *mm = current->mm;
 	unsigned long addr = addr0;
 	struct vm_unmapped_area_info info = {};
 
-	/* requested length too big for entire address space */
-	if (len > TASK_SIZE)
-		return -ENOMEM;
-
-	/* No address checking. See comment at mmap_address_hint_valid() */
-	if (flags & MAP_FIXED)
-		return addr;
-
 	/* for MAP_32BIT mappings we force the legacy mmap base */
 	if (!in_32bit_syscall() && (flags & MAP_32BIT))
 		goto bottomup;
 
 	/* requesting a specific address */
-	if (addr) {
-		addr &= PAGE_MASK;
-		if (!mmap_address_hint_valid(addr, len))
-			goto get_unmapped_area;
-
-		vma = find_vma(mm, addr);
-		if (!vma || addr + len <= vm_start_gap(vma))
-			return addr;
-	}
-get_unmapped_area:
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index edeec19d1708..f4143703f234 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -205,6 +205,11 @@ unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
 				unsigned long len, unsigned long pgoff,
 				unsigned long flags);
 
+/* See generic_mmap_hint() */
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags);
+
 unsigned long
 generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long len, unsigned long pgoff,
diff --git a/mm/mmap.c b/mm/mmap.c
index 382b4eac5406..76dd6acdf051 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -705,6 +705,15 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 }
 #endif
 
+#ifndef HAVE_ARCH_MMAP_HINT
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+				      unsigned long len, unsigned long pgoff,
+				      unsigned long flags)
+{
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+#endif
+
 /*
  * This mmap-allocator allocates new areas top-down from below the
  * stack's low limit (the base):
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
