Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD47E77181
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Dec 2024 02:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=B2OYmBUZqT06bvfWm/ajZCSUOQ+5LDsNzII0kLz+5sQ=; b=NwWwwpACEJI4tie8InVYxuiXP0
	sNvEfHk16/8CN4z7DqKFCfRsLk4CBYav/bceEe2OGY8rsDInxIYi2DNls3I9tLlhR87EYZWz/7KKJ
	NojeH4BUm1S1zT0Iq5/tYfYWoR404qFPewfWW4HBO5X0Z+90rDY0C0+PqxEX9vcazdCYFTsVmPyzI
	5FmsKt26FmPwF81VYeKfz/jW0OFGpvKx4zOWBisrGfGVN3z+zKkd88eqSjw9MTz7+HOgc7iNzDf/k
	PGXMrgUGsfA1xupp5z6ffAvTbbugnjFg9TmSYI5ICJ4w30em2ZG21awHRrB5b1GZP1Pd6elvRiitr
	xzS+4o9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqGq-0000000A1Pw-4C89;
	Tue, 10 Dec 2024 02:46:45 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqBp-00000009zaj-2w4b
	for linux-snps-arc@lists.infradead.org;
	Tue, 10 Dec 2024 02:41:34 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ee5616e986so7906629a91.2
        for <linux-snps-arc@lists.infradead.org>; Mon, 09 Dec 2024 18:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798493; x=1734403293; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=plyHizQjFILOlGH5Iba1IrDdDMxWHhXvOcpLcYrtGxg=;
        b=lmHn/p9sp7qR4UEF06UGklTWqS1XXlMMeyxO5WAYs1dH7h8zydt0sozDzjKjMPUmZh
         hKh1zceg8a3e23Eqp3iDoKcBX+WuVbJDa1L+Zk9Jfrz5OZQLB33iz8rUabKmAyhcxd3X
         pr706uyeiVYH5lb8+RKMdM696arEC8m7oo1nM7Zlrag2HyPdn78bNOnWe/AfqDOybx0D
         uedNEy58ptbyBJNGXvvnMEA7UCvSKppCo+RWOGhL4pQT5NJTO6RkVWzoQlJbBYY8gZ2R
         tC50mPJh1Rjb5wdz7AY31nRksKLyN4US8s0EAfJqUljrO2sJmIN0bHG4t21kPznOgjTb
         HSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798493; x=1734403293;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=plyHizQjFILOlGH5Iba1IrDdDMxWHhXvOcpLcYrtGxg=;
        b=F7l3Vcv4Z0J7vYOpgBbZbzu0MqeDs2Nkw7Edt8pB2PlUcCVIM+1PNi6R1iVPPHuDo9
         SfMIWI+mpDc8W46wbLY6UUEmTMFSF+/Jo6EZ+xVaMVn1cFc/NlgmH6vOkjMh8TwLEk6Q
         yqjwPyP7AvlilWRCmlevU8A7KckOQebtKpRuHR2OKrSD+Ogr1h8nPdRTjFagPHGH5po8
         6aDqApNV8cTc9JbBA3wJg703EV5I/5RKoJvhXQvKrqdMGkW0P4Y9EYpotvJod/rcj0Sa
         od0ns60D8ij4NuVatIpUyUpb2pJX2h+pxkE4KfSg52nJ2LIi/sfQaS28IIaVmsooVUKi
         35Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVypH0gDLt6RYNOew7SK3h5j8ebMIPRHjn171P835TYxgbRm7sQvzOTkHnirYAKTPMIcdp2+FS7AKo2DPRgCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAFJudZxNenTkWNLxsQos5djwIvXxGZ2LQK36jHgHtnl/UsGgT
	hzXArSRLEFQWVk31Z2Tzlg8oIqeg5H/Da+S5mJU9xhBfqceB1jgB4Kuvb7ePyEUBL3kT9wFY5Cu
	xM+6O2N+5nfBXGdXXOCwvog==
X-Google-Smtp-Source: AGHT+IHwTbEIW/FAeU1sg3ure6LNMbce1+qfNwJ7QwjwcLyYjZmtwQZSOt2eORyWNRKplpOxNs0RywA1YRSDvXTeEQ==
X-Received: from pjbsd7.prod.google.com ([2002:a17:90b:5147:b0:2ea:5c73:542c])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c0f:b0:2ee:ad18:b309 with SMTP id 98e67ed59e1d1-2efcf1700c3mr4344722a91.3.1733798492790;
 Mon, 09 Dec 2024 18:41:32 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:07 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-6-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 05/17] mm: arc: Use generic_mmap_hint()
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
X-CRM114-CacheID: sfid-20241209_184133_746425_3BE9E929 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
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

Use generic_mmap_hint() in arch arch_get_unmapped_area().

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/arc/mm/mmap.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/arc/mm/mmap.c b/arch/arc/mm/mmap.c
index 2185afe8d59f..6b1fcea06779 100644
--- a/arch/arc/mm/mmap.c
+++ b/arch/arc/mm/mmap.c
@@ -27,7 +27,6 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
-	struct vm_area_struct *vma;
 	struct vm_unmapped_area_info info = {};
 
 	/*
@@ -43,14 +42,9 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	if (len > TASK_SIZE)
 		return -ENOMEM;
 
-	if (addr) {
-		addr = PAGE_ALIGN(addr);
-
-		vma = find_vma(mm, addr);
-		if (TASK_SIZE - len >= addr &&
-		    (!vma || addr + len <= vm_start_gap(vma)))
-			return addr;
-	}
+	addr = generic_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
 
 	info.length = len;
 	info.low_limit = mm->mmap_base;
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
