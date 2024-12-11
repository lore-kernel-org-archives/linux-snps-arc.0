Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C54AE77183
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Dec 2024 23:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Jmv6kdvg6ws3WscUGx75vWH1YsM7LRq3yfX9yOwWdiY=; b=j9gzHUvGaIONSqBhoqvxBP/A2w
	tACkp64a6un8MM0R/urNs/BIVs/NldPfAT3JxERfANG1CiorzufKv9wJKyz7FbArMjr299xIaVEpK
	9VhSwGia94NGegkMBU4Dx+O7cu41KPe5VU+wo6CyDu79sKCr9CKPIB6X+VMBojbz7AQqWCjWq6BLU
	bC4h3uPFAWfDoQN4pLyElMsBTYneMT593mtmhdAvZlqtIm52yjqqQGTciSLoI/w6OECEw7JQfld2p
	aPVuZMy8/Lr6/4VGVY4PG1oQg4UiUuxso9f78pUdIy4t/Gql9BIzKjU68kjvzeUQ2hqqAvaKy5AaH
	KadWB6Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWI0-0000000GUfq-0olq;
	Wed, 11 Dec 2024 23:38:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW81-0000000GScO-3az7
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 11 Dec 2024 23:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vYJJcdIp4OFdB+jw/mn5ZasDVQdafEZmT3OPk14pFSA=; b=aPV2xFyZXcpRQQGFdmd+zSwMCA
	fAVpUNONJBHAl1fRivcw9SD1Q5Hxr0BzGPcx9Oi402iNWptpgTOeCoiSkzBN5FE8ZKqvAeJaOK21x
	1w5noEtKUH78Iuiql+7fBMDaEbWBclYBwG8VG8twZ+FQx4sEyxb3uRGx607nyiYFoYj6dLThPr2um
	zdPByYoU7G+hw2DPQCsOvLx3UkE0FvccKiPVBFVdyvvvMKjyioh3vDL314aVk8nH9dYHaCV96hp+e
	HwFPXzirgjMk8oqHsC/kdwdzQoTJHratZGHggO/72bOXN6on6Xtk2RAYWoYOnpCRYUChaqIdu83uD
	DdHNv1pw==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW7k-00000003w0f-3Cjt
	for linux-snps-arc@lists.infradead.org;
	Wed, 11 Dec 2024 23:28:23 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-725e8775611so21738b3a.1
        for <linux-snps-arc@lists.infradead.org>; Wed, 11 Dec 2024 15:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959686; x=1734564486; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vYJJcdIp4OFdB+jw/mn5ZasDVQdafEZmT3OPk14pFSA=;
        b=xgDGUgyKboK7D0b3t4dgs6q99P65HPzaq0vFlrwRRovWD4Sl1lc1l4v7FctgCWukH8
         EnOkMSgDy2HNf4Yd6RffvvF4ihn4DfwTFE5OS6sFlwte1ZgskZeVPcBfdnqWFEkarXX8
         vWPZxbzljyvR3WUr0lWoHFh9iuSaSuZEOYDVo01hxcrYgVrJNkagPTik7Cc7QGP0ZgKA
         xhu3s/8icocq5R3Sk2GlwX1NOOiNT/QAc0ozhejIZ3LuXxz/+AgAO1MxJNnhSCCkcqdG
         /S0OhyoolpOpllPSWCAyTUhStyUuzghOFvnb4LDsZ1m+fzXOKLhiVTWXtpMpAUP4CKdz
         M8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959686; x=1734564486;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vYJJcdIp4OFdB+jw/mn5ZasDVQdafEZmT3OPk14pFSA=;
        b=wHh6rf0stQUoo5rx3u0SUK6rAAU+lgI9Z6q+7YNK0Tx0HOrCgzlYw4QT/2jHQs/xil
         bcCA41ZVxryGcD/43NSQI479H6IpVp7lbQNa+Uknz4wga8MDE42cQDDGtRE7eR1enCJD
         g6o7Uor0zGrApN0VOKh6l1rYTtHimhpui4YJihFStxbnXNFfr3W1SCZdTVQz6scTLZUS
         RiE+vzlHJER3A3IB89bmtk2Ttg5pt9XJGNF/hndEctzu2NgzC8uaGblZY8FwWeuQZDm7
         LsFHk383gFKXil9p0MolyzW7CAQS5HumMzzn9UDNo9rTdonyQXv72Jj5AUjaeALkUAqW
         +UUw==
X-Forwarded-Encrypted: i=1; AJvYcCV9H/THeD5lsk02626rXYvIFSngUIttRgQDc0AnPocCigjUdjuDr0zCX5Hzc66aF69WXtgLISGbedTmmyBSwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZIbXBRkxTNdOBH4erQmEb62TR2hPerx5+jirFmj0QYgRNK1Pf
	RDLFpGALvcZ23T1+KMo07vzgyv/CRG7ax2poU8uG53MyOGhQRJao3BDvKRHFzLXbA6kAnoxjTdp
	I17oLC9wBkPw/qAH8MktR6A==
X-Google-Smtp-Source: AGHT+IGKKVpJDJ1y2ylGaA50Z43wv3+APAJV0fjiCw5ytHmnD6GxlKgAyJQZQRFGHnrCD199ncZRE2+HH1UPCzOgAg==
X-Received: from pgbfy22.prod.google.com ([2002:a05:6a02:2a96:b0:7fd:4739:79be])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:328c:b0:1e0:c56f:7db4 with SMTP id adf61e73a8af0-1e1cea71c6cmr1602899637.2.1733959685721;
 Wed, 11 Dec 2024 15:28:05 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:42 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-5-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 04/16] mm: alpha: Introduce arch_mmap_hint()
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
X-CRM114-CacheID: sfid-20241211_232809_024852_66B1885E 
X-CRM114-Status: GOOD (  12.97  )
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

Introduce alpha arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - Consolidate error handling in arch_mmap_hint().

 arch/alpha/include/asm/pgtable.h |  1 +
 arch/alpha/kernel/osf_sys.c      | 31 ++++++++++++++++++++-----------
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/alpha/include/asm/pgtable.h b/arch/alpha/include/asm/pgtable.h
index 635f0a5f5bbd..372885a01abd 100644
--- a/arch/alpha/include/asm/pgtable.h
+++ b/arch/alpha/include/asm/pgtable.h
@@ -362,5 +362,6 @@ extern void paging_init(void);
 
 /* We have our own get_unmapped_area to cope with ADDR_LIMIT_32BIT.  */
 #define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_MMAP_HINT
 
 #endif /* _ALPHA_PGTABLE_H */
diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 86185021f75a..308f832732dc 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -1225,10 +1225,9 @@ arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
 	return vm_unmapped_area(&info);
 }
 
-unsigned long
-arch_get_unmapped_area(struct file *filp, unsigned long addr,
-		       unsigned long len, unsigned long pgoff,
-		       unsigned long flags, vm_flags_t vm_flags)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
 	unsigned long limit;
 
@@ -1241,8 +1240,15 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	if (len > limit)
 		return -ENOMEM;
 
-	if (flags & MAP_FIXED)
-		return addr;
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
+unsigned long
+arch_get_unmapped_area(struct file *filp, unsigned long addr,
+		       unsigned long len, unsigned long pgoff,
+		       unsigned long flags, vm_flags_t vm_flags)
+{
+	unsigned long limit;
 
 	/* First, see if the given suggestion fits.
 
@@ -1253,12 +1259,15 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	   That said, I can see the use in being able to suggest not
 	   merely specific addresses, but regions of memory -- perhaps
 	   this feature should be incorporated into all ports?  */
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
-	if (addr) {
-		addr = arch_get_unmapped_area_1 (PAGE_ALIGN(addr), len, limit);
-		if (addr != (unsigned long) -ENOMEM)
-			return addr;
-	}
+	/* "32 bit" actually means 31 bit, since pointers sign extend.  */
+	if (current->personality & ADDR_LIMIT_32BIT)
+		limit = 0x80000000;
+	else
+		limit = TASK_SIZE;
 
 	/* Next, try allocating at TASK_UNMAPPED_BASE.  */
 	addr = arch_get_unmapped_area_1 (PAGE_ALIGN(TASK_UNMAPPED_BASE),
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
