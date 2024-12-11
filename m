Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0BCE77182
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Dec 2024 23:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=q4st4F3SaiP0jKYON3/PJU5u0nqBvup4zc6hnRr2rc4=; b=ji2yDRPT01f3pCboRd9RwEh17+
	zDbtiY6lwuSe3rcZvUJFfZMS1obkWpUsTVfjn5Szyq2ux1lApaco7w7yK+gaDSyeMEx6AimkhXMgd
	mxjAOcNOet+CnjPUVM4q/s9uzI6/Wzmj9qcwkP7I6xHCYZbCyO/JgwMGkHjDVNhf/HwLHyisgwg+e
	z/qflMhVlZsp7hbj2zLBAJkte56MrVLI7w911dpw7tlfRTNEfjnLbq27rI9DcsjBW95MtScH+ETH1
	HiHs+E2yzDZVZYZhB8edDb4Ms8Q79hfKzHMZbL8mp0oedJVrGg6Bb4Q715c/JKd8I0NQMrM5PJNQZ
	qo6FBENg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW8h-0000000GSuL-0y1S;
	Wed, 11 Dec 2024 23:29:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7i-0000000GSUp-2beu
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 11 Dec 2024 23:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=i4sLwXeXnZGwZmaOI+TJwHO8calXr1XpV7HCaSQYyYY=; b=cRRCOX7vzTXZ7ZXnqpL1rQYWGL
	n1G7yJtFb7whZGHEDx7HX82tNuJ1RpyiPYgMmcaoNvLWi1DSYBOjMk1FrFOAKZ8OQI85BK/7lzrdD
	LLMEPiaGT6y8XpLg3j9YNmd8DgjXVLjwtjdymsBuMOQXF5OLdX/ju1q5UZ7obSM1UZHJhy24I40yP
	pnSjVLLCsbONiGAnf+VHi58MvGjZQ5xndvCRqY1EoBwkgv1eL/x1BrlkXLhDc3UFDMf4VesEu1+b7
	slHikvpKry7+ThKXsRYwc07lGycmttYG4UFj5CTafi0a0LcCLBaau6VgNhg72wUC+yisRDrDMEvBl
	mFMFnh0A==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7f-00000003vyM-0zYV
	for linux-snps-arc@lists.infradead.org;
	Wed, 11 Dec 2024 23:28:05 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7ea69eeb659so36226a12.0
        for <linux-snps-arc@lists.infradead.org>; Wed, 11 Dec 2024 15:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959680; x=1734564480; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i4sLwXeXnZGwZmaOI+TJwHO8calXr1XpV7HCaSQYyYY=;
        b=Vwkch71garP1ztd0OeRBOfZPpNrMMQtpeknY3QduBjmWKZgnMOxaXr3jtZh6PoBX2f
         DtepdVsC+FlfO/w6+tXxVfoy7jTH1T8UG++qRK0eyINGA4HNZIBATnB9DRAmcIYYoU2j
         OLh9HfEBgAPCZEj+KmRknRqFLbzWdKNPJh7l8TjWjHP8PfD5t6wiBbN5Kw3lyHz72rLY
         QZBlj62d68qp/lScsO0vdXM9w3/ZmT68dQcGd+d5wiWJsB+YhLuV/WtFMrBo8bvnV5a0
         p8niwVIvoKCbUIKDbjGA+IQT+aLJJH9byAsstTTDt8ClaJkJMTRg4jQfd+CdU3qpeWob
         Wzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959680; x=1734564480;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i4sLwXeXnZGwZmaOI+TJwHO8calXr1XpV7HCaSQYyYY=;
        b=OOCV/K8HwzT1QOuIGfCnleCzRvARAmKvZe1MY08Of3Rw5BVH8EyAjpI8zQrHtdeaTs
         ixh+9xYrXhOxjjt70xeNxJSHEVds9EOE7MzQZhnq5IIzlIV89H88ddlhctghSjpekxU0
         mcU+sAYWJoPTCr/ElPfKWwltqNJ7tYEjJ51yTFB2mUj6boeomw9dX3YE6dq0X5a0bUOa
         jHzusGIGgUNgAmFo5E3qACfGMntdaytY1fWKiWa/Wby9QADTYkPMM8U3M2rqGzvMuC95
         SYIDT3RpGsvAyNE2mv7ggjmIn1PA5ULOGQrxvdM+ONAeJGyn1NwH7UNzK3TC0P2/Fcwd
         u0LA==
X-Forwarded-Encrypted: i=1; AJvYcCXqtNpJAXS17Q918so87MgSGAOsIGkyd/PU8Lbop5yh7+nDXayoMorr+mQW0CaTKzoydMI6hNHYESZ+OfcfAg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yywprt6r/rwTZkR/KelQt8meu1XtoLmEVFsrqxnONQhRIaO9Y+F
	2LDxFRVRqdK+OOzMR4XBZzngarRis/4UcwWQoyyo4aTDt/Yo8Pp3VKEbEvpkWYdTa4atfULf97b
	vzTkgnnIrJ/JLkHDrbMqe8Q==
X-Google-Smtp-Source: AGHT+IFtd/N2pCFnI2u1d5m96JgTZmL7tbAt9a9u3MHy4m9H51vxoRQ9F2QC80/CNULE+uh+FoVAQHYq51Gg3PfRrg==
X-Received: from pjf11.prod.google.com ([2002:a17:90b:3f0b:b0:2ea:29de:af10])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2790:b0:2ee:f80c:688d with SMTP id 98e67ed59e1d1-2f12802a503mr6866191a91.25.1733959679820;
 Wed, 11 Dec 2024 15:27:59 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:39 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-2-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 01/16] mm: Introduce generic_mmap_hint()
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
X-CRM114-CacheID: sfid-20241211_232803_562027_C7168050 
X-CRM114-Status: GOOD (  15.02  )
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

Consolidate the hint searches from both directions (topdown and
bottomup) into generic_mmap_hint().

No functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 include/linux/sched/mm.h |  4 +++
 mm/mmap.c                | 76 ++++++++++++++++++++++++----------------
 2 files changed, 50 insertions(+), 30 deletions(-)

diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index 928a626725e6..edeec19d1708 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -201,6 +201,10 @@ unsigned long mm_get_unmapped_area_vmflags(struct mm_struct *mm,
 					   unsigned long flags,
 					   vm_flags_t vm_flags);
 
+unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
+				unsigned long len, unsigned long pgoff,
+				unsigned long flags);
+
 unsigned long
 generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long len, unsigned long pgoff,
diff --git a/mm/mmap.c b/mm/mmap.c
index df9154b15ef9..382b4eac5406 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -620,6 +620,47 @@ unsigned long vm_unmapped_area(struct vm_unmapped_area_info *info)
 	return addr;
 }
 
+/*
+ * Look up unmapped area at the requested hint addr
+ *
+ * NOTE: MAP_FIXED is also handled here since it's a special case of
+ * enforcing the hint address.
+ *
+ * Returns:
+ *    ERR_VALUE: If the requested mapping is not valid
+ *    0: If there isn't a sufficiently large hole at the hint addr.
+ *    addr: If sufficient VA space is available at the hint address;
+ *          or MAP_FIXED was specified.
+ */
+unsigned long generic_mmap_hint(struct file *filp, unsigned long addr,
+				unsigned long len, unsigned long pgoff,
+				unsigned long flags)
+{
+	struct mm_struct *mm = current->mm;
+	struct vm_area_struct *vma, *prev;
+	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
+
+	/* requested length too big for entire address space */
+	if (len > mmap_end - mmap_min_addr)
+		return -ENOMEM;
+
+	if (flags & MAP_FIXED)
+		return addr;
+
+	if (!addr)
+		return 0;
+
+	addr = PAGE_ALIGN(addr);
+	vma = find_vma_prev(mm, addr, &prev);
+	if (mmap_end - len >= addr && addr >= mmap_min_addr &&
+	    (!vma || addr + len <= vm_start_gap(vma)) &&
+	    (!prev || addr >= vm_end_gap(prev)))
+		return addr;
+
+	/* Fallback to VA space search */
+	return 0;
+}
+
 /* Get an address range which is currently unmapped.
  * For shmat() with addr=0.
  *
@@ -637,25 +678,13 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma, *prev;
 	struct vm_unmapped_area_info info = {};
 	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
 
-	if (len > mmap_end - mmap_min_addr)
-		return -ENOMEM;
-
-	if (flags & MAP_FIXED)
+	addr = generic_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
 		return addr;
 
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma_prev(mm, addr, &prev);
-		if (mmap_end - len >= addr && addr >= mmap_min_addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)) &&
-		    (!prev || addr >= vm_end_gap(prev)))
-			return addr;
-	}
-
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = mmap_end;
@@ -685,27 +714,14 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 				  unsigned long len, unsigned long pgoff,
 				  unsigned long flags, vm_flags_t vm_flags)
 {
-	struct vm_area_struct *vma, *prev;
 	struct mm_struct *mm = current->mm;
 	struct vm_unmapped_area_info info = {};
 	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
 
-	/* requested length too big for entire address space */
-	if (len > mmap_end - mmap_min_addr)
-		return -ENOMEM;
-
-	if (flags & MAP_FIXED)
-		return addr;
-
 	/* requesting a specific address */
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-		vma = find_vma_prev(mm, addr, &prev);
-		if (mmap_end - len >= addr && addr >= mmap_min_addr &&
-				(!vma || addr + len <= vm_start_gap(vma)) &&
-				(!prev || addr >= vm_end_gap(prev)))
-			return addr;
-	}
+	addr = generic_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
