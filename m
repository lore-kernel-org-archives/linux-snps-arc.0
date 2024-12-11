Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E425AE7717D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Dec 2024 23:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=W8s+r6P+Wf6zwemLiHHkBT/eq2KMerlWBweTJ1QdrdU=; b=zzg4LqYz2G0AX/TpsczwK/mpXc
	Rt9vpO23nBikHTJgOl3IFEAE5L4UokXd6OT8TedGyaJnZROLGqL1obzgrleICLeSYnqLBIgQCqalW
	NN26wvAasqcAIMNgcRUU3ocZmqmYC5Igb3qIXRuxe9EtxOObHLCrWjGNNXJeHjL+EBdvxSeWkz8Ux
	sLnHqKanvBHZMPip2ozxlp00WmyRbB/kODzuuk146ScgyHIqmeVYapTuw5KKKsWcJmi6wby0IvikH
	nlR9dPdfznn1b6bgNmRHZBlt458QRLDlh07e2JTIeBgfIRzD9x0YDX2sey45+BXejNEyXc8C1etOZ
	VofOBqwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWNB-0000000GW6a-2sxh;
	Wed, 11 Dec 2024 23:44:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW87-0000000GSfn-0MUX
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 11 Dec 2024 23:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=z6Hm5oOLdBb7ho6/nkMyyfkvkknoYZ/+aPdlC1ktc9c=; b=o3AjDsOX4U3AI/UNIzKR0PgQ37
	4LvMIsnUgViC0HRuUGsQHwQOYOonAC6hrcQsGBSBhp7R11V08KKfG5hhnC+CqbusQs+SrLvbd/nBO
	iAgcTmJh7Py6cYbV3JjTgK9y6GBcthy6VDN0skw3jII7Tp/Cm4GCy9tJEDRFV+APZGbHHqCXxPjX2
	1KgYH3gNC7PJUJ2lc/S9J8LpW9h1WbH3rnZccc10vzda08KbNl6d1DzAE2nycvq0CtzjEC8PbI5I6
	ggcHD3DHHrm3O6J6bsDk3e8puoWerVKWi+84nwAzEodb0nwnkyeVYNPtOCME4JePudH5DRzj17/3S
	U7tg0DWQ==;
Received: from mail-oa1-x49.google.com ([2001:4860:4864:20::49])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW84-00000003w75-0DpH
	for linux-snps-arc@lists.infradead.org;
	Wed, 11 Dec 2024 23:28:29 +0000
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-29e2bd938a1so3287420fac.3
        for <linux-snps-arc@lists.infradead.org>; Wed, 11 Dec 2024 15:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959704; x=1734564504; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z6Hm5oOLdBb7ho6/nkMyyfkvkknoYZ/+aPdlC1ktc9c=;
        b=Sl5VMlULaaO9iPZ6Qo7l3Rl1aTQIjQ6N20DmSeRRhpZxPf9/F8O50hKFLMa1K5PvGB
         HGEhO7HWICiB/r+D8yjmQLCtQuc5PAQFz5OYa1RRWyHOGb2xtF+ddU1B5re1KWUuk0KL
         qHhZYmD2XnSq9ekqlf7dCb2jbWD7+STZzRKt0b7TVCVXcXmbfljTT2sf+p5zTjMh5lZa
         TZOow3rXsgfksNJ+sC5LAAaa7J7gcJHU8jsK4ZFrgY0+NO85RP1hG9jlM0r/+wSobEwt
         Xe6q1LtK18EBWnzAtfZlZLGBbsQ45YibdEbLQnVdZI3PbSHtnXWZz8um2/uiv1j8RIZ+
         N81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959704; x=1734564504;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z6Hm5oOLdBb7ho6/nkMyyfkvkknoYZ/+aPdlC1ktc9c=;
        b=Bsq8jIsb5gNaODCqmaKGTvw2hqESOcN2tcudqEl21GhQ6kKDFydYOVSgjj2VPslpIh
         RYZEzyoVBmFCVKaFnN1bqPB5XJx7Wg4776sdsX23GwLXe/lqVU5dHWvkswDrYSMF5wNU
         Cs3jM+UCxjI+2ygTC8NG1zk6LSu8WJrEU0iGOBal0X86j6z7pQMwtgVp4sCWkfmEqB3U
         KruapgModho/I/hR9+QMPpHlaZAku2l554VQaARg0manxkyo6XJ1jZ2Rtw3xnh2bX3on
         RWa3JwD3puihN5yPb3s65thMtNayBgUMIIrWBciLh0JdUkUbfALQoYowsepIs3S//Ev7
         g2jg==
X-Forwarded-Encrypted: i=1; AJvYcCUomYuhLEhk/MWJLwMtD4TJ2rxVVzJWBTWya2Ve95fI7VwVfd9RtaRWMHWxADlytSrrhAVxPp9y5wWn6i+zoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwbyR4mpkWdQK2ANm2iETja9Pel9rF/o0GkjQKhpFZTSAQfgfO
	sZ3DdVeE9OqixLjNqgfs4LK/VkUNbpeeVp4fhvWUwheTwez048JuKaU9qCTff0C7FaSs0NKUGXD
	qQwGrd0bjequhU1WL2wOHOw==
X-Google-Smtp-Source: AGHT+IGQDLulfLF8RwhcJUV0HutTvJeMfbYLu8JUEjKppHvTG+7VWlPJjZzjhgEci5/4OsV71lgRhbIjtjk4C1ysLQ==
X-Received: from oabrl17.prod.google.com ([2002:a05:6871:6511:b0:296:1589:4069])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:224d:b0:29e:f61:3b62 with SMTP id 586e51a60fabf-2a38236803dmr971354fac.7.1733959704488;
 Wed, 11 Dec 2024 15:28:24 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:52 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-15-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 14/16] mm: xtensa: Introduce arch_mmap_hint()
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
X-CRM114-CacheID: sfid-20241211_232828_378647_E201DA8B 
X-CRM114-Status: GOOD (  11.52  )
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

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/xtensa/kernel/syscall.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/arch/xtensa/kernel/syscall.c b/arch/xtensa/kernel/syscall.c
index dc54f854c2f5..6bbe10c2a633 100644
--- a/arch/xtensa/kernel/syscall.c
+++ b/arch/xtensa/kernel/syscall.c
@@ -54,12 +54,12 @@ asmlinkage long xtensa_fadvise64_64(int fd, int advice,
 }
 
 #ifdef CONFIG_MMU
-unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
-		unsigned long len, unsigned long pgoff, unsigned long flags,
-		vm_flags_t vm_flags)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
-	struct vm_area_struct *vmm;
-	struct vma_iterator vmi;
+	if (len > TASK_SIZE)
+		return -ENOMEM;
 
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
@@ -71,16 +71,27 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		return addr;
 	}
 
-	if (len > TASK_SIZE)
-		return -ENOMEM;
-	if (!addr)
-		addr = TASK_UNMAPPED_BASE;
-
 	if (flags & MAP_SHARED)
 		addr = COLOUR_ALIGN(addr, pgoff);
 	else
 		addr = PAGE_ALIGN(addr);
 
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
+unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
+		unsigned long len, unsigned long pgoff, unsigned long flags,
+		vm_flags_t vm_flags)
+{
+	struct vm_area_struct *vmm;
+	struct vma_iterator vmi;
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	addr = TASK_UNMAPPED_BASE;
+
 	vma_iter_init(&vmi, current->mm, addr);
 	for_each_vma(vmi, vmm) {
 		/* At this point:  (addr < vmm->vm_end). */
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
