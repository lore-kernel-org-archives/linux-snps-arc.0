Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318AEE7717D
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Dec 2024 02:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xlbvZvIcsFlj2rTGAlKA3o3DfG94Ua4eiNsJmrGpu/c=; b=f67M4VAApUAhv5Oc33qgGyAUFK
	SbLpIha9fqPkhYcLkvsTqbNaDnRq83VA4fEqtN6ZOU0FuKa0uIDownoSzbLpD2/Kt7jUInr42QOqd
	1dOixOcslKp4UgTp4cNuh7bRIT8S8PbE8++AgkbAPkTu6lBZusURY23sg0+y9mwJb9/rlDvUg2+NA
	zrJKZVhujd+HW+EJ4mksXqFaMVF24RNtlOt2HwM+TEsARK1v2FWVgym56st5Actolb/tgF4oaB2Ex
	SJFin9eCJYrPZEjpVIpmsSwoKwaYziTcoI00M7Q/rvBeuGge5wZBle80SJV3TuIWSJVkxX9SHOZOo
	HQk5WKDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqOy-0000000A2pT-3xtW;
	Tue, 10 Dec 2024 02:55:08 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqC5-00000009zqH-3q7c
	for linux-snps-arc@lists.infradead.org;
	Tue, 10 Dec 2024 02:41:51 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ef79d9c692so4105027a91.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 09 Dec 2024 18:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798509; x=1734403309; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8RBi4d94aA8fGJb29BjAVbVAiuWgJzs9FAFEoE/Tcq4=;
        b=KfKRciCUJCeKvREO4krzVk5pafqPS+FpurF0bGoGZBMwB+MIrN/le2ohG7OJtHPBEZ
         oDBSx+Xb7Q84yxnaojDayZzhi7NsmePXypbssosd3EvQAGSnSyQsj+ql0Hw3BpwWVJIt
         v2O6P7ZfaxsTd4abRJNwkm63qJ2Lxf5YRmbSbsZQeO7F1A2ybPhdDKAQtZT6eSk56QtI
         3+FNSB0zPYsL0iNK+ymCyAaCiIOtSSiOvPFxaiAbjMNLSeFW0Rq1+r2rOHIPNJt9rOXe
         +eXGHC18/yiSx5+0t1/HBrlFaAyQn92xhxatflElGiOVwSL7VGkl1QI61N4hIDfFDrbR
         XfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798509; x=1734403309;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8RBi4d94aA8fGJb29BjAVbVAiuWgJzs9FAFEoE/Tcq4=;
        b=cHRirOjOfXAE+9w5FoggVhGSxbO051K1yRzV1gqB43BNNx83uCj+DLKFs30JTxbpr8
         HeDeMg3C60zd790lUgsTuYvodmcMFscP9DIWlAZdPqEVAkOMqQWgJfa9D3MMpDps9aNu
         KD8Tu/X2sMl4+1qRmniVhs1B0AVJadpJwKG1JJJpyFgw29uzi5WUdfhokcFrZxLyqSE+
         RGcs6GHzM9VTAHVFoTB/bqVxGfv2gtlUz0NF8ijOxjKY0KdQPQl2Bzn3koDcTncfLbXV
         cQiC5vG8vbELKpniYf/dKAVN/+usgW7pCROIh0VVZugh8iJJmUeyj4WsM+GWpbmQufZ9
         Cmdw==
X-Forwarded-Encrypted: i=1; AJvYcCUmBeAydbrGlfb35KZcQK0BXlvxbALDNjTJ9AUc38ydAKtm1Jtf9dFnusuvQOzrBJe92fJ3Pa22JhC9t1kCaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdpnDpdCeZnFzFaAQrUsk641hrwX921qYo8mRyMraKr3GI4L0j
	nTHRdltAc9ve8JUY306aeFxqdx1fnWQ4t5m13Np1sV6V7w9dS2Y68iN9ESgfQ8C00NxKm3YTrix
	7kDuCPL9GrbVmhzmSwWH0eg==
X-Google-Smtp-Source: AGHT+IEWnrN6kZ7CMoj0XPEY5LyEzTzu31G9SE2ukZ22eBNhBZBZVrxzEpEONDIVdXz8wv9Xu2tYcLSnTTgrFqyRgw==
X-Received: from pjbsq5.prod.google.com ([2002:a17:90b:5305:b0:2ef:9866:6155])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2544:b0:2ee:c918:cd42 with SMTP id 98e67ed59e1d1-2ef6a6c11b1mr19145935a91.22.1733798508962;
 Mon, 09 Dec 2024 18:41:48 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:16 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-15-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 14/17] mm: xtensa: Introduce arch_mmap_hint()
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
X-CRM114-CacheID: sfid-20241209_184149_957544_E6187185 
X-CRM114-Status: GOOD (  12.28  )
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

Introduce xtensa arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.

If a sufficiently sized hole doesn't exist at the hint address,
fallback to searching the entire valid VA space instead of only
the VA space above the hint address.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/xtensa/include/asm/pgtable.h |  1 +
 arch/xtensa/kernel/syscall.c      | 26 ++++++++++++++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/xtensa/include/asm/pgtable.h b/arch/xtensa/include/asm/pgtable.h
index 1647a7cc3fbf..31b7da0805ec 100644
--- a/arch/xtensa/include/asm/pgtable.h
+++ b/arch/xtensa/include/asm/pgtable.h
@@ -425,5 +425,6 @@ void update_mmu_tlb_range(struct vm_area_struct *vma,
  * SHM area cache aliasing for userland.
  */
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* _XTENSA_PGTABLE_H */
diff --git a/arch/xtensa/kernel/syscall.c b/arch/xtensa/kernel/syscall.c
index dc54f854c2f5..353cce1ac9f1 100644
--- a/arch/xtensa/kernel/syscall.c
+++ b/arch/xtensa/kernel/syscall.c
@@ -54,6 +54,24 @@ asmlinkage long xtensa_fadvise64_64(int fd, int advice,
 }
 
 #ifdef CONFIG_MMU
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	if (!addr)
+		return 0;
+
+	if (len > TASK_SIZE)
+		return 0;
+
+	if (flags & MAP_SHARED)
+		addr = COLOUR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long len, unsigned long pgoff, unsigned long flags,
 		vm_flags_t vm_flags)
@@ -73,8 +91,12 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 
 	if (len > TASK_SIZE)
 		return -ENOMEM;
-	if (!addr)
-		addr = TASK_UNMAPPED_BASE;
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	addr = TASK_UNMAPPED_BASE;
 
 	if (flags & MAP_SHARED)
 		addr = COLOUR_ALIGN(addr, pgoff);
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
