Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E07EE77180
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Dec 2024 02:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eO3CLhvhVeWJvYtix6ZczpCD3m7UW7rOvXTC+UPVnWs=; b=KxD8/wZ6k58H5KPNYahrlMoj8E
	msJ1DCNWadCC7ePPGJiOoI//U9JsdPArQYW2Y2kJMvAosJtwH5pfhUfxVhkpOr4SWSXKyMoR86EPe
	njNUiZLDJx94dkGLN3xnjJuGPg4OcNq+kbm+/nww2CvMv7nuSWBzalC9pKoMUL405oQdNN8I/Ocr+
	RyhCXp02WY/1iMnkSmZk9OVWjvjNBe7MZsiqWsg/x0Z0aeGGNM4sXddS5xCrPub1g70M99E8QWdj+
	hzZoIfjwDhl1mSIGeoXMi1z5+4DotQYN/KbB3pr5LlgtTwOCHFhwBzFViRECTvrX6Qzg/NgZDBGa7
	+DKZ8r3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqPz-0000000A2zL-3LXM;
	Tue, 10 Dec 2024 02:56:11 +0000
Received: from mail-oa1-x49.google.com ([2001:4860:4864:20::49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqC8-00000009zs3-0HAb
	for linux-snps-arc@lists.infradead.org;
	Tue, 10 Dec 2024 02:41:53 +0000
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-296e12a44c4so3976762fac.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 09 Dec 2024 18:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798511; x=1734403311; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QfykOM1fOarLfySIdaHc0pH2J2Kgj1GMXq62gJs/y4s=;
        b=LvlPBypkCoHyO4es5UcvxVs7x4T9PhV8/r6KjQsfTvs5i6tEl5XCKVwQJoBJv1GTmy
         E4fkfuyIlJviU82WFT2XfSXJNriEeEDy9ws6HzWE43LEoDG59DDIDpKhBimb+92MxYTD
         bwesWcjzo6Qk+o1RkqaW8rj1Vvz3muwtMbARKRr4N2RXOK/1W0KZEdUVXYvPv0enFZiP
         Q3k1YDGiudbGL3Tsq3YQDpr9CwXcnya427O21/ucwcw9V9fGa6zOImbAEPwTZpTK/7zw
         3Su22fGsOmgFn/O9HVlXZZ2XKGKOBucjfUIqfXebAU/mYIOlioRNdox2rLn2GZMmclYq
         weuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798511; x=1734403311;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QfykOM1fOarLfySIdaHc0pH2J2Kgj1GMXq62gJs/y4s=;
        b=IdfsQLUvrInE6k6/wGn++x/pmDAR88Iaq/YDcGNY7EkeyaeiDEAzbd6f6wMHahkpM4
         44exRlOfPolpXr6M3t9MkS2yK61UB/tbhMxgWsEbjMvo79L/zfyZp2/NBonu31jjUXBR
         q9l4Jp/4aBx1mV4GNl5wGUpVk37/aSdBLaxrwbDhS+6SyO7nkCJssRIuHx8Qj4HGUw/z
         rMTTm95klFKvdK/fUmOb88arLB4oinWgn0YkkLzZjxFpiHWIkoFm8p3tv+thKSSJayPE
         hAc9Yblt9LdnSjBDR+n+VW8hf2kmaCsyokDeNTHmSjvDXl0Owv+3bPeSyX2Jmok1xMeo
         bWVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAB7Ie+7JmxPwDj2KAz0+mrbQhSCIZPm4/yZH6Kl5GBxXawSFL7yMm6avsMQxCJVtIxFikRpQFJLCXNNZ3Jg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwY41lzQqlVLo2dav6fj2oLEd5JUc6V38ADkKuurrRwAkti+gtm
	Jr0Ct59QvkElbLPqkDBbi+7FvYSG2lM8HYxiSXBC0cLy+5BVkeXQbx6pKg5D8OLCtRHFPNBL6ON
	p2eOjpQvDPme6dYMdlPaoeA==
X-Google-Smtp-Source: AGHT+IGyaGimLFtOc8xFMrBxHlvoKkgipEDRsXSRpIYCtUs3FtGiq87tnN7DOlflNQnY8+3VkwfOeHU4ERQxyW4QXg==
X-Received: from oabps11.prod.google.com ([2002:a05:6870:9e0b:b0:296:5847:48e8])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:3108:b0:29e:287e:3706 with SMTP id 586e51a60fabf-29f732d630amr9859551fac.17.1733798510837;
 Mon, 09 Dec 2024 18:41:50 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:17 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-16-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 15/17] mm: powerpc: Introduce arch_mmap_hint()
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
X-CRM114-CacheID: sfid-20241209_184152_107908_A624DD74 
X-CRM114-Status: UNSURE (   9.01  )
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

Introduce powerpc arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.
This is a preparatory patch, no functional change is introduced.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 arch/powerpc/include/asm/book3s/64/slice.h |  1 +
 arch/powerpc/mm/book3s64/slice.c           | 31 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/slice.h b/arch/powerpc/include/asm/book3s/64/slice.h
index 5fbe18544cbd..89f629080e90 100644
--- a/arch/powerpc/include/asm/book3s/64/slice.h
+++ b/arch/powerpc/include/asm/book3s/64/slice.h
@@ -10,6 +10,7 @@
 #endif
 #define HAVE_ARCH_UNMAPPED_AREA
 #define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+#define HAVE_ARCH_MMAP_HINT
 #endif
 
 #define SLICE_LOW_SHIFT		28
diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/slice.c
index bc9a39821d1c..70b95968301a 100644
--- a/arch/powerpc/mm/book3s64/slice.c
+++ b/arch/powerpc/mm/book3s64/slice.c
@@ -647,6 +647,37 @@ static int file_to_psize(struct file *file)
 }
 #endif
 
+static unsigned long slice_mmap_hint(unsigned long addr, unsigned long len,
+				     unsigned long flags, unsigned int psize)
+{
+	unsigned long hint_addr = slice_get_unmapped_area(addr, len, flags, psize, 0);
+
+	if (IS_ERR_VALUE(hint_addr) || hint_addr != PAGE_ALIGN(addr))
+		return 0;
+
+	return hint_addr;
+}
+
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	unsigned int psize;
+
+	if (!addr)
+		return 0;
+
+	if (radix_enabled())
+		return generic_mmap_hint(filp, addr, len, pgoff, flags);
+
+	if (filp && is_file_hugepages(filp))
+		psize = file_to_psize(filp);
+	else
+		psize = mm_ctx_user_psize(&current->mm->context);
+
+	return slice_mmap_hint(addr, len, flags, psize);
+}
+
 unsigned long arch_get_unmapped_area(struct file *filp,
 				     unsigned long addr,
 				     unsigned long len,
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
