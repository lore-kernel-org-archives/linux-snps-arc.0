Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E6DE77181
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Dec 2024 02:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=O7Sw4m9K5wkzS+aLrJzz/REdyUO5M6mhkkbtcU49NC8=; b=zkCxUecWei9Yi2Mj5goxcHyoxQ
	HOvrNIwsqKaWuhVOneyUya5g3/OrQl+fQBOJ/W2v5kauJSN3ekfCfmou0ir97SItDTjgRJBpKPnu3
	EXWvf4wtr8Qupj3VIXcAJSKsqhDXYL5KrgHeM1mG6MklmCGIKhu9NvviB+vrpGRQpsRgywAmxpWRr
	wj8qQOlWA4CvKEJwOtRxpuxFwykj8d2VG9HHqfHv8S/tZ+fLOAZLhK2wFKc/yJMDHhQq3DHPSgGbG
	STocvpcl0Wx95zyqjqGGcdSGZuQ8BMrhNfE6Zl8r6OushLySM2djxTruT6H5pyH2gwxolPzzsZyID
	s3/L9Afg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqMx-0000000A2Yr-3nuO;
	Tue, 10 Dec 2024 02:53:03 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqC2-00000009zn7-2Tur
	for linux-snps-arc@lists.infradead.org;
	Tue, 10 Dec 2024 02:41:47 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2eeeb5b7022so4909473a91.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 09 Dec 2024 18:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798505; x=1734403305; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1BAtlrJSVyRPOsQk5wSikGaGR3zqoYCpGFeQDDyhzvw=;
        b=g/I/SjLMXNroKOwKUJDNmgkHwlpELxMxA6NehWXh9vVOd7iiVNyrqKCk7GnOmp3PvD
         eJ/85k7r0sWIzsGB2XTYJby6ICquVn+fAI2fuzzmUVnUPj16JIFFprLZ64fa/NOcAK0S
         ry98wNsaHQ16Lvb8tn2StuRScWQGkAM1j3BDaVqogY8IiGPjva0RoTL5/KJIKMTKxp5H
         OxOzYNPdNoci0wDy/S93omQYGYQEZuGIj2aRpdFArJytQmlrMIIYo8M1/km41b06xrOb
         AiMtIZHf5WfLROPBMPOVShkw9WNLxNU4E8w5VrJ2rIAjP0IsP3LPmYyQg7cir7xiAiMU
         EsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798505; x=1734403305;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1BAtlrJSVyRPOsQk5wSikGaGR3zqoYCpGFeQDDyhzvw=;
        b=jCP02Z1CjLWToCzeevRkSo0xrO5EUgLAXjVbArBNOoOvSAJ4L1kRWqkrEg1lGQ8DTX
         YEYNQMZuPxikUFpwl5Gq2zqyXj/xFWJAn3d8baiOmpq6huA6ohV2XYLHdmAc6xjvPDhP
         /vFLLYjH6QsHecEXAAd0QMujZVXwFeDxRu+fV5tyiS27dZufjYpy2gXBqR/t/AgMjR12
         iXPKhPGVCV+FKV+qt4EfQXFcf9E8+QIy3+S/zzevFCJ+aBwly1G7uiFrlYbg2cpMM0bS
         U/Rjr8jNLZXX+gA9fRnCjna78PCOEsquUZM/lCUdiy1gyyPN/FTPPyi/6tPsH6D3uj5g
         KiwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyFQ+6AnmxnJ6LbhUI4xdLx0khZS6vodKDapFbTeNgjglHSOHDaWeipjeCM9amE9daFWFlyD1pOpi2pW4DHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBA4Uq/G+k989IkokoJk7GmvkFYp8cymtlTENQviFgRjppHo0c
	FL7Rwv2nNpGKVPEiaAkSmQ9IDqB3X9vhBJCNsygIyi7GwdJYzKixJir6zd+KnElVOKn9yA/5zmc
	DUhiPTGQiH8d1ivNXYggBHg==
X-Google-Smtp-Source: AGHT+IG3H2VSitmLlBO6Re0RjQMAvCNU6wOeSZb7FxqqgQkEm7xuddsNJr2NEUZE8SQmtflSqHbUwj9vfGvySeSwAw==
X-Received: from pjbnr3.prod.google.com ([2002:a17:90b:2403:b0:2ef:6fb0:55fb])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a06:b0:2ee:9a82:5a93 with SMTP id 98e67ed59e1d1-2efcf138437mr4485348a91.14.1733798505429;
 Mon, 09 Dec 2024 18:41:45 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:14 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-13-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 12/17] mm: sparc32: Introduce arch_mmap_hint()
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
X-CRM114-CacheID: sfid-20241209_184146_653318_5EF052B0 
X-CRM114-Status: GOOD (  11.53  )
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
 arch/sparc/include/asm/pgtable_32.h |  1 +
 arch/sparc/kernel/sys_sparc_32.c    | 21 ++++++++++++++++++---
 2 files changed, 19 insertions(+), 3 deletions(-)

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
index fb31bc0c5b48..2d5065ee1a94 100644
--- a/arch/sparc/kernel/sys_sparc_32.c
+++ b/arch/sparc/kernel/sys_sparc_32.c
@@ -40,6 +40,19 @@ SYSCALL_DEFINE0(getpagesize)
 	return PAGE_SIZE; /* Possibly older binaries want 8192 on sun4's? */
 }
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	if (!addr)
+		return 0;
+
+	if (len > TASK_SIZE - PAGE_SIZE)
+		return 0;
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags, vm_flags_t vm_flags)
 {
 	struct vm_unmapped_area_info info = {};
@@ -61,11 +74,13 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 	/* See asm-sparc/uaccess.h */
 	if (len > TASK_SIZE - PAGE_SIZE)
 		return -ENOMEM;
-	if (!addr)
-		addr = TASK_UNMAPPED_BASE;
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
