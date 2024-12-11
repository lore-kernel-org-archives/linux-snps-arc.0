Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0C7E77182
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Dec 2024 23:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GKGlKCmC+0mLWYs30PTQHAYmpSQqfYKGSZfu2lpRf+M=; b=SkLPKuPOVKITSBg7SYSYfd08Jn
	zWWLUM5OT571XTdKr4sTw/OoQfRuw8tI6t1TwuFEBYx6zxsGHH1z2X49VfQHJhLuA4cOJ2xPssc+S
	1vuxRR3VFs6TnqSVFJ1Fn+l+VAe9jy1lkUXrPypvBURzOf7zHewUus4hxeOlt7OiMp6eTCsnUEM/X
	/Mk06XT1V7/Rv2x9i+RvIaHCaPFB+6HFFAxD87mrKyOlXky3J6+XIFDruzfA/0zNxrR5iIqnp6yc9
	rQvJxHBgFggPmI+7lJjUnvLdGjE81irKDpxlMyd5gqSKsbomV2+5teLq7LhxovO+gUh2Z++oXZWAQ
	nCdjMG0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWJ1-0000000GUpB-2exM;
	Wed, 11 Dec 2024 23:39:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW81-0000000GScR-49Cg
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 11 Dec 2024 23:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wxiw+xEGORRKxhtCLZq/pFo2CvQKmbacY9QkYe3JDdE=; b=aH3NLbTdLysGM0sVW5DuWiZ+e7
	HcsABmtNP6ngSsg02qa3yXQFLPMI7lO7HD4cCN2CNlL3QGumwNgSsufCqdJMUvizOdyVnsiQHOdwd
	kFPP3ZyC6qS4Etj69Qi25G0DjTxusMQ71MsIO+HbMNATSkfQxKY9NsL/ZyHsY4c4qOb4jr1zRmWOE
	AGnYU0NqQOya1P9TGQBka98cWPlhc4blRr0XVlvLYz2G0K3oU0UxbNgNzUgFdN0Y2DgMSYWPbPga9
	5QnVthzLsK2jzRxJFGMNeUF9vVOf0yWm3KDbQ1bJVOUf2BIMPmxby4IMa+vn/FgWJHaXi0XHjGUOl
	xYPAI8Fg==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7w-00000003w3Z-0jt3
	for linux-snps-arc@lists.infradead.org;
	Wed, 11 Dec 2024 23:28:23 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-725e4bee252so21382b3a.1
        for <linux-snps-arc@lists.infradead.org>; Wed, 11 Dec 2024 15:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959695; x=1734564495; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wxiw+xEGORRKxhtCLZq/pFo2CvQKmbacY9QkYe3JDdE=;
        b=KpF7kk4WVhru/HFvJ6GmGqwLwSFOMAZ/F4S3xiTLkHAdCpM8anYwV7DQfR06cFlhP4
         O1gAjt62rf0nkiVfEYwsoURd7lADnm3QyyWc2dpcRy5JrWTEC2HKFgINskcE6AlJVKEi
         NQrqqc/e1vhhVmfYcBES1trpxRipOnsFk42ewb46fmH0s1uK+7QGiCBEIqo1Q/bMBCpn
         eANNmtXEuJSxJ4uX0ubvppUuB28RLc2CH1ytmh22TI1pJ9cDu2XNGNh2ovuWIZX4xA2d
         dls6fhmIphtlRapqhASvpWbiUulLq+TChAlakVZSuYDOsRB4h9kCkYxycl6JJ2LWBLXG
         4JXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959695; x=1734564495;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxiw+xEGORRKxhtCLZq/pFo2CvQKmbacY9QkYe3JDdE=;
        b=m2bzZopatnmmk43DdBVgLJZpDdMzoNSl1SnGcVRO/reRUXa+TQ8Ay6hKg3S7fqDwKf
         3secqjgikb03BR91JX7mlarkYc8Ldf75BC5YILVTchf5Q6CfqfZswaC1H04kjxrAxCxP
         DH4Edyl6tT806hhL5ccNYI4QEv5Ui+3UWBi6PjtyKHEP22GZ2B0O3Kz3/3yIAI6GdOyO
         jKUwNDfJ2+uZi3jWnCdn/6D9P2TOT4+ZklP19thF/BM5iGtShgrNR7pL8hYd/Zh0onBq
         2SOXrfJ7Q7I/EaWIeP4U9azK8EWJlF9dG30of6LzEBXG2v5Xt2nHzsAVyVEuYok55Ax0
         APCA==
X-Forwarded-Encrypted: i=1; AJvYcCVpUQBeoY4bLTU20wvN3oA1QX8rOaWs42f/My2WrQL04SfdcnndsNu21Wl9KGNT4DTHAU41asFpepTDH4t/2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/dIh3ouWnZ3/R0Zp422SruFwwtUcrm50k0JLR4NzX/y22rQIp
	kV+owJ1r0Abn5qPXxQu5aJ8x5gT4ZNbuxAdnBMnHxoJ2m5pVzThcTl9jFgnSXn6V9PZuwKPaAjR
	wsHS8tHisv5SXvdLyonEjFw==
X-Google-Smtp-Source: AGHT+IF4fNavDkLG8tRoFUmw2gnTJz71oU9t6WKhM2RNFmEQvjdeJ2dIL8s2CnxPdes2eHu66I58PC2AE4yum4CFsw==
X-Received: from pgbdp11.prod.google.com ([2002:a05:6a02:f0b:b0:7fd:4c8f:e6a1])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:258a:b0:1e1:a829:bfb6 with SMTP id adf61e73a8af0-1e1cea52239mr1772079637.3.1733959695421;
 Wed, 11 Dec 2024 15:28:15 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:47 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-10-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 09/16] mm: parisc: Introduce arch_align_mmap_hint()
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
X-CRM114-CacheID: sfid-20241211_232822_391442_669701A3 
X-CRM114-Status: GOOD (  13.38  )
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

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/parisc/include/asm/pgtable.h |  1 +
 arch/parisc/kernel/sys_parisc.c   | 53 +++++++++++++++++--------------
 2 files changed, 31 insertions(+), 23 deletions(-)

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
index f852fe274abe..c1702d481e33 100644
--- a/arch/parisc/kernel/sys_parisc.c
+++ b/arch/parisc/kernel/sys_parisc.c
@@ -96,24 +96,16 @@ unsigned long mmap_upper_limit(struct rlimit *rlim_stack)
 
 enum mmap_allocation_direction {UP, DOWN};
 
-static unsigned long arch_get_unmapped_area_common(struct file *filp,
-	unsigned long addr, unsigned long len, unsigned long pgoff,
-	unsigned long flags, enum mmap_allocation_direction dir)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma, *prev;
 	unsigned long filp_pgoff;
-	int do_color_align;
-	struct vm_unmapped_area_info info = {
-		.length = len
-	};
+	bool do_color_align;
 
 	if (unlikely(len > TASK_SIZE))
 		return -ENOMEM;
 
-	do_color_align = 0;
-	if (filp || (flags & MAP_SHARED))
-		do_color_align = 1;
 	filp_pgoff = GET_FILP_PGOFF(filp);
 
 	if (flags & MAP_FIXED) {
@@ -128,18 +120,33 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		return addr;
 	}
 
-	if (addr) {
-		if (do_color_align)
-			addr = COLOR_ALIGN(addr, filp_pgoff, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
+	do_color_align = filp || (flags & MAP_SHARED);
 
-		vma = find_vma_prev(mm, addr, &prev);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)) &&
-		    (!prev || addr >= vm_end_gap(prev)))
-			return addr;
-	}
+	if (do_color_align)
+		addr = COLOR_ALIGN(addr, filp_pgoff, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
+static unsigned long arch_get_unmapped_area_common(struct file *filp,
+	unsigned long addr, unsigned long len, unsigned long pgoff,
+	unsigned long flags, enum mmap_allocation_direction dir)
+{
+	struct mm_struct *mm = current->mm;
+	unsigned long filp_pgoff;
+	bool do_color_align;
+	struct vm_unmapped_area_info info = {
+		.length = len
+	};
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	filp_pgoff = GET_FILP_PGOFF(filp);
+	do_color_align = filp || (flags & MAP_SHARED);
 
 	info.align_mask = do_color_align ? (PAGE_MASK & (SHM_COLOUR - 1)) : 0;
 	info.align_offset = shared_align_offset(filp_pgoff, pgoff);
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
