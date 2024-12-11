Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72794E7717D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Dec 2024 23:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=oC+g1b1hz1zJuKTNDehMJn9yqF6aNjqdTlagM8VDA2Q=; b=UM8ary8D+ENBvO0c5hHV1+Cd1f
	XChyI32Gm3pvexz9ZW+ljzz9fvGh2X68i6yVRRWP8Ketwa67EpqeNiaogqJSvpKpb2e6lzDohC2fB
	Ns3zdZx4msZgV1hQ1ZKVyCaNICLjU3wpGul3oBVHq6f/ESC11jquyMfN3ProI4wTIdUf+gFsZNgL+
	Rey/Cthtbk3HLgSZJ7N4KLx0MwHIZvOfq9YYndJOQcGTMKWBw6BEV5kjwxYMLzEHgBqleEL4oFIk3
	H7BFaGqPF1Qkkzq3VSK7VWj5Qc43xLV4IbcIe+wxBeo4ypttprLoG4HpPyrY9otydjFvxFoGVwymU
	USwz6kDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWDr-0000000GU2k-0gVZ;
	Wed, 11 Dec 2024 23:34:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7t-0000000GSYI-0QDm
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 11 Dec 2024 23:28:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=My9IlOPq9ns5P/NZxzKqYlKU2U5PkE8SqDXKTXIHc1k=; b=iFQO87zwjdyVTF7uLetQ2XJXfk
	DduXJIaKEM0k8tu6C+9hQIrcNAyRPjsdyz7GbrYsJALXpo0k0/PhsVCN+uQ+pamQ5A3DP497foL4B
	9W3Ue7kXlfyEzSwET1RXacn+D2ZTJPquNmMQvzCIl14BjEUBomIkthSCXfoZ0LBCnWWhEWa4hgAZC
	LmI5wxMf2lqNl7L+qD5/R3FxVEqknDhN4AFTwRvWjiINDoftlzZ4Bs3PzCV3qlC/D5X9WmItzvnOZ
	khtPSEmGh1VCWRfqtoP9YwQU2lx+zd0ACc/it3tQmAnGN73CabOUnYrKuODYk0Yr82m+dvwcC3mxJ
	Dvlm/DIw==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7o-00000001eLv-3c88
	for linux-snps-arc@lists.infradead.org;
	Wed, 11 Dec 2024 23:28:16 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-726047a4bd1so24824b3a.3
        for <linux-snps-arc@lists.infradead.org>; Wed, 11 Dec 2024 15:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959689; x=1734564489; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=My9IlOPq9ns5P/NZxzKqYlKU2U5PkE8SqDXKTXIHc1k=;
        b=Ig3zHH/lTutfYhaOLX46aZk5Aco99mDskmKb8BZxejwrFaR6f2WehuNeDw5FRSyuiO
         AqZ00JvhVvzuCfVR0uTcKYUEf7mtx6pKgsGgsB16C/YC6XCpCsdiMD9pwvFIRgP+7ktQ
         +uWKfV0FZnMM/jYOCxvjfxrneN8nZg+hp0WoAAPbktCT9Pi427QLm8Th7RgWYGdhATKD
         3H3SvanTVCQ1WvwHRJRF4PSQsHIcn0Z56JaRM0ROX7iffqTJIBW3eX0YL5lFqrfWF7mH
         aSySmEQ4RWvGb29/q9T9Y8sRjOjlrN8X6UZ6czStoeFolnPGF7UPpmHcEzKut4XryH14
         TN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959689; x=1734564489;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=My9IlOPq9ns5P/NZxzKqYlKU2U5PkE8SqDXKTXIHc1k=;
        b=hcaH/YdmK4PH2868B00N/Da+Ib94MqCJvUPHuOls5ClfShD3Xp0GVAQedzDi+SRFsU
         i5/tvARrXbm6+gr4Wp6LmNafDMkOBc9iJBYpysvlNNhxpt1kEJWSZPYu9WiAPS4L4Um5
         JCxBHIcK2dHUF2c4pR6IgfyaSedxZdztC7tEob7hIgR/Ao0k8gDIBpLINB3NN0ABrr+E
         rMB0DR3RHDv14ecrK1FpqqB1XuYy5V9gvul3kF4RL0ySJ+c9zzfOeVYY4j9tD9xf2T30
         TcxvtFhs5y9bM9ICLr677HAXU3AHqbBOujTz4QrIpuVUoMjkYmxyv3ddwnWAmjj7GVdl
         i0Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWpwW/LK6cIMo60ALbwi+qcHNqQ1OeY75BLmQUPBGDTsQl5R6JQD9nWiqHIq5zI5jhgauUt0Kc7q/AyPExJXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXLR1+9/LPrXkBupMHsOpNmpGrUJuuWLhGVq4O6VYL1RYAsnL7
	UKqHSXgJ/lY4n62hBKSKFDede42Y196ZY/bJ0/Mxz/koRx1aNz/FhNIJZXe0eFUV+HWImrCT85G
	jzWetX9gPaQkRrK83epBkGQ==
X-Google-Smtp-Source: AGHT+IHgv+hz6lUV53h1smjsDXGUMrAdu+yMyNI0Y1qN6skLJAQw6jBsC8TmY8m6/oNaMxzzcfOLndyqCxWrzR4uSQ==
X-Received: from pgbee13.prod.google.com ([2002:a05:6a02:458d:b0:7fd:4d08:df94])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:7890:b0:1db:e40d:5f89 with SMTP id adf61e73a8af0-1e1cebb5277mr1761320637.28.1733959689528;
 Wed, 11 Dec 2024 15:28:09 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:44 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-7-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 06/16] mm: csky: Introduce arch_mmap_hint()
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
X-CRM114-CacheID: sfid-20241211_232812_960645_D62775A6 
X-CRM114-Status: GOOD (  15.35  )
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

Introduce csky arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/csky/abiv1/inc/abi/pgtable-bits.h |  1 +
 arch/csky/abiv1/mmap.c                 | 68 ++++++++++++++------------
 2 files changed, 38 insertions(+), 31 deletions(-)

diff --git a/arch/csky/abiv1/inc/abi/pgtable-bits.h b/arch/csky/abiv1/inc/abi/pgtable-bits.h
index ae7a2f76dd42..c346a9fcb522 100644
--- a/arch/csky/abiv1/inc/abi/pgtable-bits.h
+++ b/arch/csky/abiv1/inc/abi/pgtable-bits.h
@@ -51,5 +51,6 @@
 					((offset) << 10)})
 
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* __ASM_CSKY_PGTABLE_BITS_H */
diff --git a/arch/csky/abiv1/mmap.c b/arch/csky/abiv1/mmap.c
index 1047865e82a9..0c5c51a081e4 100644
--- a/arch/csky/abiv1/mmap.c
+++ b/arch/csky/abiv1/mmap.c
@@ -13,6 +13,39 @@
 	((((addr)+SHMLBA-1)&~(SHMLBA-1)) +	\
 	 (((pgoff)<<PAGE_SHIFT) & (SHMLBA-1)))
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	bool do_align;
+
+	if (len > TASK_SIZE)
+		return -ENOMEM;
+
+	/*
+	 * We only need to do colour alignment if either the I or D
+	 * caches alias.
+	 */
+	do_align = filp || (flags & MAP_SHARED);
+
+	/*
+	 * We enforce the MAP_FIXED case.
+	 */
+	if (flags & MAP_FIXED) {
+		if (flags & MAP_SHARED &&
+		    (addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1))
+			return -EINVAL;
+		return addr;
+	}
+
+	if (do_align)
+		addr = COLOUR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 /*
  * We need to ensure that shared mappings are correctly aligned to
  * avoid aliasing issues with VIPT caches.  We need to ensure that
@@ -27,8 +60,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
-	int do_align = 0;
+	bool do_align;
 	struct vm_unmapped_area_info info = {
 		.length = len,
 		.low_limit = mm->mmap_base,
@@ -36,37 +68,11 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		.align_offset = pgoff << PAGE_SHIFT
 	};
 
-	/*
-	 * We only need to do colour alignment if either the I or D
-	 * caches alias.
-	 */
-	do_align = filp || (flags & MAP_SHARED);
-
-	/*
-	 * We enforce the MAP_FIXED case.
-	 */
-	if (flags & MAP_FIXED) {
-		if (flags & MAP_SHARED &&
-		    (addr - (pgoff << PAGE_SHIFT)) & (SHMLBA - 1))
-			return -EINVAL;
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
 		return addr;
-	}
-
-	if (len > TASK_SIZE)
-		return -ENOMEM;
-
-	if (addr) {
-		if (do_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
 
+	do_align = filp || (flags & MAP_SHARED);
 	info.align_mask = do_align ? (PAGE_MASK & (SHMLBA - 1)) : 0;
 	return vm_unmapped_area(&info);
 }
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
