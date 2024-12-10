Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 266F8E7717D
	for <linux-snps-arc@archiver.kernel.org>; Tue, 10 Dec 2024 02:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7b/PhBsStCwZJTy54LJ8HvzkbopEfcLVfiqI69/CzIA=; b=TQ6FrNJduP9odNAgZZoHJQr6y3
	OjidBeJoyP0tAReIj60p1S6H8Of3cUJjd/Z6y48nPnjjI2cYnbg18oXXi43nvz0JW+mF1kGyLIqpB
	tCpHpjldrkBV2OTWDR46o2q9S/CWGw9GmVAH6o+UewkbPiWSJN5Airo6b/ar/+T++Pgt5OVCZXUYW
	TAW3K5Ihl/OqN4ywcbtBJogUitgv+lPY+XPr3J0z5DGRn+7WAKBEkKlVvXdxjERSxksnPD17mvVFb
	j6YTax9RuQTvI32zCdrYULUeDafypASDU8xFtdLHA//DnmpNK4NzaZEg5CSQdJ/kxgbx4n636bZ3P
	sqfxCqgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqR0-0000000A37Z-3mbA;
	Tue, 10 Dec 2024 02:57:14 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKqC9-00000009ztW-1yYo
	for linux-snps-arc@lists.infradead.org;
	Tue, 10 Dec 2024 02:41:54 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-725e59e41d2so1743142b3a.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 09 Dec 2024 18:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733798512; x=1734403312; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PpJ3voZ2zpkCxNiGYJ7mZV4beiWEDuh5gW+cJghhtIw=;
        b=k1PcLdXaNfKwDwl2YxLwMTSvhJ0sWCsGWsuC/rScCSfld0e60G4Q6uzfHYmaXCwIui
         iBpBu4HKZS0dsqHK7odSQiOg2VqKaCSEplmkQFCjtGqSYN/GtUHYSuqkbPzvPB8zBIVx
         hPsoMV3dKK4FtPPjZ0/KCH2rTzB0jFSLJgtPs1o00gCcwwyBjKDcHJ5F1V5DYIMPUmd1
         tKKcypuQCCIyFlowSgldod0TkrZaS4fZrz+P+zY1PeW8GvL3+Jy207iIC7scq1WjUINz
         Xhkt1GANU+9ANQXCv+NdXfh2Sr8I9J08obSo4yGqXx0TWlh7Icfj3ookMdpVJ0GwWqJv
         2P6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733798512; x=1734403312;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PpJ3voZ2zpkCxNiGYJ7mZV4beiWEDuh5gW+cJghhtIw=;
        b=Px25qbpgxh/qR4LW6TBpjZUU9UpkrULxD7BWaokH9eGopO6MAowZYsUNf+sAbaZ9uf
         XPQy5IGANY5N8qnJdedCaZm451uavPYWXoYNppTPf/QG2KBXn11E12wIxSOEnuEtRstq
         uaTF2gsPijvWDAZ3RepDodrNFRiUUg69Z5l6lJDnleSjqvEw9kPbbqao9CyA7de5yCdW
         i3DntLPsY0hLU5t4RrAODYwXXGEDdAf+jU3SV1wwl4uEV2kGwkYahtUd4XlyPhEU1e+r
         9NFANH0OWvgldIbuEJnfO9bTvvxUkwxHiP87pH+o46d9x3s5sp04h4VYvbdzStQaRtBG
         ABxg==
X-Forwarded-Encrypted: i=1; AJvYcCXPFm+VOMHjE0EYl0P3acaC/eGPZoXUcn3w5S10rkod+sXG9dTN/6FgJAZGNnJMRxZrsIFEiVqrswADblSPGg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+ZVpmUqqF6fu/WlZ4EmorOIVgo9EzDXeICeCF21y2VT1DqDuy
	gD+mazDjdeHw8SCEurMgIkR1V2anVszXa2kYbN2VuZP7gTnEVCUhAnT46llFycWfP7YHwX1G6/1
	MnyUAAISHcHJJXvuol8EhKQ==
X-Google-Smtp-Source: AGHT+IH+U5NNduIwURg0BoDlPsKnnOIwfCnZdS3eRXACF/uPNRGoE141bvOCCDVesMcVlUE6OG1mnMpg0Q9mT2r6sg==
X-Received: from pfu5.prod.google.com ([2002:a05:6a00:a385:b0:725:f376:f548])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3016:b0:725:c8ea:b320 with SMTP id d2e1a72fcca58-725c8eab756mr18454838b3a.14.1733798512543;
 Mon, 09 Dec 2024 18:41:52 -0800 (PST)
Date: Mon,  9 Dec 2024 18:41:18 -0800
In-Reply-To: <20241210024119.2488608-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241210024119.2488608-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241210024119.2488608-17-kaleshsingh@google.com>
Subject: [PATCH mm-unstable 16/17] mm: Fallback to generic_mmap_hint()
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
X-CRM114-CacheID: sfid-20241209_184153_518055_5CDE2868 
X-CRM114-Status: UNSURE (   6.78  )
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

If an architecture doesn't provide arch_mmap_hint() fallback to
generic_mmap_hint().

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 mm/mmap.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index e97eb8bf4889..59bf7d127aa1 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -691,6 +691,15 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 }
 #endif
 
+#ifndef HAVE_ARCH_MMAP_HINT
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
+{
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+#endif
+
 /*
  * This mmap-allocator allocates new areas top-down from below the
  * stack's low limit (the base):
-- 
2.47.0.338.g60cca15819-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
