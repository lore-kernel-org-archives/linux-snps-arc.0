Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50391E7717D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Dec 2024 23:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=E7WajjQAYW7iYeINQV8M59gil0tRC2gdX3eV4tm38sU=; b=4WqqL06p74PRYua0ObRLWaaTI+
	rKUIZRB494QkJtHNajKm0X+cVAMRETJ9/bs/ZzA+vAA4JQoRW1ycatY4ahmYT4rhLONb6XKCyzPjl
	UZl+ttyHx6ADCwvyR/Ke7ccmi79s/XWbePqE5WVfCRIZMmHLJQYjI3mZlp2oQ1C4pCU5/9tShL7EW
	NHLU6nSn74pTyeSW6BSYE4uhXAGeWlyRYu1ZQNuMsZvsG3LAbeqGfiQw2PBe8TEXRjzy0ZVySz1qS
	sVruvKgg6tOQtM07fQCCM8Rmn9q4zUAIV25vgRvMF1BqLY0Mi9XC6mlYJf9kWyXJAepRu4n23eRT2
	h9bWfyuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWEt-0000000GUEI-0JGL;
	Wed, 11 Dec 2024 23:35:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7v-0000000GSYo-1QSH
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 11 Dec 2024 23:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lSyWTl6AgHPTeHZ5Av2U3d+7m6ogGk/gBzGXwo6uPmA=; b=DKFJ5sbzHl19r1aks9EzUnIFMS
	Cq79IHl4f+9gDVIH3QW0lefU9bWStuXf1NTiPUjc0Om3X72S+wTmQQaQnPSJIco1jyYDxlDEuv6aC
	EFXInOy5QQzFc1Fq658Bol3mRCuIdMg1FwgIT9ay0Vl1wdXgYYKooJ6ZHuBZMhrzpp8D1qEUjCLe8
	mZF3H29BsbiblkRWai1ipi/4a61WG0IYGyYpL8jICPgCNneopYTxfDCOsS98BhKkkeI9mVRxsZ05M
	iBC+CohJm/gKKQ+SD1SESUk4rvquwgHabNyHxjevFOAXvMrfCy8OkwN3iW/j72PFkdCqQkAf3p56f
	U2qtBgpA==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7r-00000001eQ5-3ndj
	for linux-snps-arc@lists.infradead.org;
	Wed, 11 Dec 2024 23:28:18 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-725cab4d72bso19399b3a.2
        for <linux-snps-arc@lists.infradead.org>; Wed, 11 Dec 2024 15:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959693; x=1734564493; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lSyWTl6AgHPTeHZ5Av2U3d+7m6ogGk/gBzGXwo6uPmA=;
        b=2a3zxZ/2QY7lXdlwRp46EiUR6/33ZV8i/gUxqgx8O392lSrJkx58OaWyu3wjhFV6kQ
         umIXB9HyKi94LAA2cBBTUBBbARcrh84xuUp1OedGvDtYHbj37of4epwP9IqbhVECpjoB
         AmkTijdkzG9G5BIxK6qtOkjOvBFPZMjIoD4InDP7tzkoHxsI3NcNWupl8QRgL8fmXDU+
         n7bah4LMb9t1LdN+QWnc09x7OuHnGypckrUlSKLs4M+Rteox+yJgkcjvlTgitrTfYd6m
         +abZOnUkG1TMaHg8v5TQaaz+0NBE1s46lLaWgCGG2lIXkEw2EfUeU4MpcS2P31PheEwV
         02RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959693; x=1734564493;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lSyWTl6AgHPTeHZ5Av2U3d+7m6ogGk/gBzGXwo6uPmA=;
        b=YxieMJH4qUkQO180v5vvZP+PyATd3fuw5dBK5Rgpjzy/1vnMd6jnbtNtcb59eohKiE
         fohvwyRKl9tdax9z0txzpPTdbFYu/Jdp2M5m52rhnTXusMf5GwVcti8PiLz9P5bWibWU
         D5MCY40Ad0APNftauj8HohyUia6IofeMCfDVmEbqc2UKNNDso/83dElLOn2ZfYPozfWk
         SUAEXq1yDHVwG99ht/LcFUNUhb3D+u5OFrt5LZSJXspR6vOdYSjExXfzk1LhYpoYN4az
         Dm04nPVkQZ+w7GW/mg7iJZmTSSh7rCy9SxLeITmCoo5bW8Vcd7Zc3XQ+5vsEzS4GE84b
         dF/g==
X-Forwarded-Encrypted: i=1; AJvYcCXLwXr/WeuO8SK2WE3uE0tCSp9Jwk5hkju6dq4mXHqjvNnn2A0z2HVKixB8OxN3W5JBoyjdS7fwq20aYgrQSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyuIemWRmPnPDxiFBNwH1qV0EsxKiK1yJwQEnSCyhE1ooq7OMsc
	sX9KTWFOG4aAkuF+hLdvkHhsw/Fzz5ak3cchJsT5TeyE6toBfOpaoTaGU4cdCi+LuKIWhSR8YGK
	dpZEJOaMc9Yiq12T/RR5qKQ==
X-Google-Smtp-Source: AGHT+IELNRPT2MoTQPIqvo9hLlMpqD0+8YUx/FKtbvg/ITxUep08nhQE+boeOUdV49+7nevT39OL6ys2YO6NUc/bEw==
X-Received: from pfxa2.prod.google.com ([2002:a05:6a00:1d02:b0:725:c7de:e052])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:c95:b0:725:f376:f4f4 with SMTP id d2e1a72fcca58-728faa23b24mr1501920b3a.13.1733959693368;
 Wed, 11 Dec 2024 15:28:13 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:46 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-9-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 08/16] mm: mips: Introduce arch_align_mmap_hint()
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
X-CRM114-CacheID: sfid-20241211_232816_050435_FB98B191 
X-CRM114-Status: GOOD (  14.04  )
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

Introduce mips arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/mips/include/asm/pgtable.h |  1 +
 arch/mips/mm/mmap.c             | 50 ++++++++++++++++++---------------
 2 files changed, 29 insertions(+), 22 deletions(-)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index c29a551eb0ca..837f25624369 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -766,5 +766,6 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
  */
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* _ASM_PGTABLE_H */
diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
index 5d2a1225785b..ee9f675190f1 100644
--- a/arch/mips/mm/mmap.c
+++ b/arch/mips/mm/mmap.c
@@ -26,15 +26,11 @@ EXPORT_SYMBOL(shm_align_mask);
 
 enum mmap_allocation_direction {UP, DOWN};
 
-static unsigned long arch_get_unmapped_area_common(struct file *filp,
-	unsigned long addr0, unsigned long len, unsigned long pgoff,
-	unsigned long flags, enum mmap_allocation_direction dir)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
-	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
-	unsigned long addr = addr0;
-	int do_color_align;
-	struct vm_unmapped_area_info info = {};
+	bool do_color_align;
 
 	if (unlikely(len > TASK_SIZE))
 		return -ENOMEM;
@@ -54,22 +50,32 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		return addr;
 	}
 
-	do_color_align = 0;
-	if (filp || (flags & MAP_SHARED))
-		do_color_align = 1;
+	do_color_align = filp || (flags & MAP_SHARED);
+
+	if (do_color_align)
+		addr = COLOUR_ALIGN(addr, pgoff);
+	else
+		addr = PAGE_ALIGN(addr);
+
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
+
+static unsigned long arch_get_unmapped_area_common(struct file *filp,
+	unsigned long addr0, unsigned long len, unsigned long pgoff,
+	unsigned long flags, enum mmap_allocation_direction dir)
+{
+	struct mm_struct *mm = current->mm;
+	unsigned long addr = addr0;
+	struct vm_unmapped_area_info info = {};
+	bool do_color_align;
 
 	/* requesting a specific address */
-	if (addr) {
-		if (do_color_align)
-			addr = COLOUR_ALIGN(addr, pgoff);
-		else
-			addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	do_color_align = filp || (flags & MAP_SHARED);
 
 	info.length = len;
 	info.align_mask = do_color_align ? (PAGE_MASK & shm_align_mask) : 0;
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
