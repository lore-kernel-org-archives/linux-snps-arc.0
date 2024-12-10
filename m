Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB04E7717D
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Dec 2024 02:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=52DjSIbODJyMA//QRLZd8UbRXHUhrBIjvxZixXE0gu8=; b=DaT7mV/lQ5Zw1EvSfKwD4DnRw5
	zpwElxjwJIUBVVcK/4r3WbqPK07KWKfe3Owj1i5G/CELENuMZjb9kk6NCXkCUccSkdfpTYnfSSCgE
	b8+mB/WNgP4r/YrObphgexxhPEbPLf3InNsPsBLvb4hIGPwspyAlgo8RIJOPtzIl/0OoEXLXLvYxd
	3BnFNJ6gZjjKQqZIS513kCIud0dgIUuCWZmt6xfqrO3IN3PkFkvB+FXAheXjFDWk6rN265hSi2HDw
	ynb9CC9i8C7i3brQw761kZUb/r/499t6BFrOGJQz07e92B76Ygkci8sH/nlE0mNkHVB7g2AO3uwhN
	lcSKn9cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqNy-0000000A2hi-0MVj;
	Tue, 10 Dec 2024 02:54:06 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqC4-00000009zoq-0rE1
	for linux-snps-arc@lists.infradead.org;
	Tue, 10 Dec 2024 02:41:49 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ee6b027a90so7843138a91.1
        for <linux-snps-arc@lists.infradead.org>; Mon, 09 Dec 2024 18:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798507; x=1734403307; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lD1y5M/92bgTaY6KXagZAGAzcvbsf/5mzkOXcooW0ho=;
        b=u3svTV5LhfvDuW3Db6wUpLFXfiqh51qRge86S417ihdlJ2Fqu3Qb/PAmLZoDhZIAmN
         RFIIOdR/tUiGnBn6KRK9cWk+xXYT6ygDumymzwnv8mwYkghfUKuQgGyVlzwtW8hKQUVq
         YOE7LsabLuBFC26uiXwX6lf8sw70JIzZB3X3JmgKZOcU5JFyFClE/pZUmqy8Xdt929t/
         R5jN4+aCeJqtfzDscE53nTaTIulGYUUEnrI/sJzvsGZvL0ktneEA80gogl6LxQExC27a
         5JaXl3In5veRs60/FBmFTFph3KiS+o3ngiamX6pbu0wTjlc/reo5wKyZWj1AvQHhodUf
         862g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798507; x=1734403307;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lD1y5M/92bgTaY6KXagZAGAzcvbsf/5mzkOXcooW0ho=;
        b=Ebq2lyGc9BR7WIfp6qmoztOaGtTfYAtBvu4j4dlSXRwjQ3WglIKjg3mxL9PE4zsxWy
         /27Q7N9zZ/PTRvK4qubiHEuU9VPCOsSaRbcIWh6ku+fLWcu7dLXU3oa1r6reBR/biUo0
         V8f85Y1NuMvDdsfIOEMIslL2MyRZEjTkOJX8bVbkvSFJ6BwYRWfdF1ydl0T9a/8F8syX
         R75L4/JV9w5Lzkfg1YjR9Chhg76DzxAMWpDcWmLQhFmD+5JiWYuhfmkDAcTl2t0GcWK0
         U9IAvHNMqyamyzInX+5BXOrvk5QEWGDWxDfIUG2DUpISwNutFZN13/cq9TPc8/1FDUTy
         DtlA==
X-Forwarded-Encrypted: i=1; AJvYcCUmjNJLWVk2kRgGSju7qDr5D9IAlLCGvQDLeCAMQVJiYbVyNCWjaUEgDXKZleDYooTvciHKATrCaPrxo+xE7A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8/2n5qOp7LHX88xUuFrmy041MIZpI7wWnqfzonj87IDZuex7i
	sJmC92Ox99mb5FRhFUearGqzYR+5dXOfJgv7MpjZ+6OMFxwW/c9I9/YcJ2MxztVyuHTam+2kiWD
	iF/ZNoMzjkGIkhvsBUULx3w==
X-Google-Smtp-Source: AGHT+IEki7Ie5yO93OnRXKQVvZe4Tx9Zhtxszko37jcevo7YJZw67tf4QTtrn4drQ39DwCB2Qw8B/AwA/g2PTJdBkw==
X-Received: from pjg15.prod.google.com ([2002:a17:90b:3f4f:b0:2e0:915d:d594])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a:b0:2ee:f80c:6892 with SMTP id 98e67ed59e1d1-2efcf136579mr4227892a91.3.1733798507341;
 Mon, 09 Dec 2024 18:41:47 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:15 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-14-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 13/17] mm: sparc64: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com
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
X-CRM114-CacheID: sfid-20241209_184148_243768_2F20ACFB 
X-CRM114-Status: GOOD (  12.19  )
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

Introduce sparc64 arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/sparc/include/asm/pgtable_64.h |  1 +
 arch/sparc/kernel/sys_sparc_64.c    | 47 +++++++++++++++++++++--------
 2 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 2b7f358762c1..f24a4eb2777b 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -1148,6 +1148,7 @@ static inline bool pte_access_permitted(pte_t pte, bool write)
  */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 /* We provide a special get_unmapped_area for framebuffer mmaps to try and use
  * the largest alignment possible such that larget PTEs can be used.
diff --git a/arch/sparc/kernel/sys_sparc_64.c b/arch/sparc/kernel/sys_sparc_64.c
index c5a284df7b41..a782696e98e0 100644
--- a/arch/sparc/kernel/sys_sparc_64.c
+++ b/arch/sparc/kernel/sys_sparc_64.c
@@ -98,10 +98,39 @@ static unsigned long get_align_mask(struct file *filp, unsigned long flags)
 	return 0;
 }
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	unsigned long task_size = TASK_SIZE;
+	bool file_hugepage = false;
+	int do_color_align = 0;
+
+	if (!addr)
+		return 0;
+
+	if (filp && is_file_hugepages(filp))
+		file_hugepage = true;
+
+	if ((filp || (flags & MAP_SHARED)) && !file_hugepage)
+		do_color_align = 1;
+
+	if (test_thread_flag(TIF_32BIT))
+		task_size = STACK_TOP32;
+
+	if (unlikely(len > task_size || len >= VA_EXCLUDE_START))
+		return 0;
+
+	if (do_color_align)
+		addr = COLOR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
 {
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct * vma;
 	unsigned long task_size = TASK_SIZE;
 	int do_color_align;
 	struct vm_unmapped_area_info info = {};
@@ -129,17 +158,9 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 	if ((filp || (flags & MAP_SHARED)) && !file_hugepage)
 		do_color_align = 1;
 
-	if (addr) {
-		if (do_color_align)
-			addr = COLOR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (task_size - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.length = len;
 	info.low_limit = TASK_UNMAPPED_BASE;
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
