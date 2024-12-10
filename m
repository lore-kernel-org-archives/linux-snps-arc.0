Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF06E7717D
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Dec 2024 02:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZV7BXT7P9sU/WdEDHbx0gm1DJfBQ9IKbCcZG8GWjReQ=; b=lRwf/gWKFbcJYw3lS8vWKdMy53
	KUj1jK/LcVaDAueZqOugEKEbvxus1lYk4ePVQmIorSfxeAN5c+qQYaywRU3WbAzchOxe8zU0Zpwt1
	e3p/1Qq/R6BGqtGg3BsFekgNsHRa06NqQYZpFzuok4xyWhvibVmRPbox7SSomjq5/jy9tfV4lXyiI
	VqNIhs/64JCKLoMZHAujSfpYopmcp8CHoKEBZ18krBb52pZz3iD56nCtxc6NP5c0WxnSPfRPDaHGo
	xh+lK78GpuLwpulEmNqOHOPAsRCdv5JP5CyPHupy1iaPxahCBrWGvDEkV9c3DzLnM+9TCTlFq5/MC
	4dmJ7dfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqKu-0000000A2CJ-3h9v;
	Tue, 10 Dec 2024 02:50:56 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqBx-00000009zgT-10y3
	for linux-snps-arc@lists.infradead.org;
	Tue, 10 Dec 2024 02:41:43 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef9b9981f1so3104292a91.3
        for <linux-snps-arc@lists.infradead.org>; Mon, 09 Dec 2024 18:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798500; x=1734403300; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mf1Z0F5Ql7IvXQrLTKqKwAEdrn6ngNUpJrr6RniRFlg=;
        b=faYclCTcsaRSmeO9d+x4XSoq3YIqT5awDiYDXaFMt69WbFXP89BRCL4Tl02nikHmJ7
         gLuB5Df1C60IiYJT8M839wQUYz5KhH3Lt3UFxf5hltGFynU235e8gZQiKGjoCzviMaus
         RQht1i7wnSfnKFgaMhnICiLTO7Ni3Xqw0u7AhNpFKgiRPis5G8AFQm8nLCDqK6l0U/tl
         o3hODhqoIap4FbN8EI1jiocULt3Lbpwzj3dE2nFVKryTgEKhTdd4LGJBbGEWuiFqpoxG
         3X2kIv6cWfqOaFrFRfGaV9sM92BfB8Bhr6w0745hOPI21cMfwjvRteo+KYN9hERV7Dx+
         Abww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798500; x=1734403300;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mf1Z0F5Ql7IvXQrLTKqKwAEdrn6ngNUpJrr6RniRFlg=;
        b=sqJwnil0Z3ezMkII1bB9e2BPszB1kmcKMTYFxLSkaCP4Jut7G1V1xA5AuvqS1JaNvj
         d5159mlYOQ/AQ5ezEArLNBCfUjWg5LX84HB/U/joSBcc97oQNo+vwGXPhBPCVjdBLWzW
         TEhSmc9McrTcmTx/kVCVrnIa4tzz8BDgk7Ldcz95+/ye7OTK07dDxjQGuku7rMSQiICZ
         g1k7LDAKs7Y4Ml6r/o9zfQc3FdLw0MSqZnvTftSMsK3h8Csn4w1qIB+cJjZRwZB/b114
         00jupBbqJBZysjr0B7rMMj2abPx0auTUioJ60Q8n01tGHPPP5K2ZGnzPNZ7ytn2jtNuG
         e8xw==
X-Forwarded-Encrypted: i=1; AJvYcCWB9gx+rqry9WAo/UOAAR+ibzQhcashI+W3FTcoBsr9l+uM8m4LRvzs+OiRuzs6JuiT4Drq9Z0k/sRdsEGsTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2xa4H/UF3aqQdG72o3hxeCYEumrZ761WqYEaH0vR6WidMvmIj
	vdOKX2IhQVaZg5U35G/9NB/dtAq4y/L1pVKgvaccrT3MqknoJfeHnxxz9ihOpbkqxhKykqi68fL
	nAybipxUcu5bTFtxdhZlOUw==
X-Google-Smtp-Source: AGHT+IHck+gUbecP/UklvDvIRj3mcbH15c15qNgDIstF76hslPLb9WiX1BCJU02h3ccJwRMDSBhkm2vIDcdP4/ivvw==
X-Received: from pjbpa5.prod.google.com ([2002:a17:90b:2645:b0:2ea:aa56:49c])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4cc6:b0:2ee:8a5d:d520 with SMTP id 98e67ed59e1d1-2efcf29a264mr3977311a91.23.1733798500058;
 Mon, 09 Dec 2024 18:41:40 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:11 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-10-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 09/17] mm: parisc: Introduce arch_align_mmap_hint()
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
X-CRM114-CacheID: sfid-20241209_184141_273187_1A959500 
X-CRM114-Status: GOOD (  11.73  )
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

Introduce parisc arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/parisc/include/asm/pgtable.h |  1 +
 arch/parisc/kernel/sys_parisc.c   | 37 ++++++++++++++++++++-----------
 2 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/arch/parisc/include/asm/pgtable.h b/arch/parisc/include/asm/pgtable.h
index babf65751e81..73987357c78e 100644
--- a/arch/parisc/include/asm/pgtable.h
+++ b/arch/parisc/include/asm/pgtable.h
@@ -505,6 +505,7 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
diff --git a/arch/parisc/kernel/sys_parisc.c b/arch/parisc/kernel/sys_parisc.c
index f852fe274abe..8ab05b29c505 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -96,12 +96,32 @@ unsigned long mmap_upper_limit(struct rlimit *rlim_stack)
 
 enum mmap_allocation_direction {UP, DOWN};
 
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	unsigned long filp_pgoff = GET_FILP_PGOFF(filp);
+	int do_color_align = 0;
+
+	if (!addr)
+		return 0;
+
+	if (filp || (flags & MAP_SHARED))
+		do_color_align = 1;
+
+	if (do_color_align)
+		addr = COLOR_ALIGN(addr, filp_pgoff, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
 static unsigned long arch_get_unmapped_area_common(struct file *filp,
 	unsigned long addr, unsigned long len, unsigned long pgoff,
 	unsigned long flags, enum mmap_allocation_direction dir)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma, *prev;
 	unsigned long filp_pgoff;
 	int do_color_align;
 	struct vm_unmapped_area_info info = {
@@ -128,18 +148,9 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		return addr;
 	}
 
-	if (addr) {
-		if (do_color_align)
-			addr = COLOR_ALIGN(addr, filp_pgoff, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-
-		vma = find_vma_prev(mm, addr, &prev);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)) &&
-		    (!prev || addr >= vm_end_gap(prev)))
-			return addr;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.align_mask = do_color_align ? (PAGE_MASK & (SHM_COLOUR - 1)) : 0;
 	info.align_offset = shared_align_offset(filp_pgoff, pgoff);
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
