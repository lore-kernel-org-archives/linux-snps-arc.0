Return-Path: <SRS0=3pus=PW=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD9AC433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Nov 2021 20:57:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0CB36115B
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Nov 2021 20:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0CB36115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m47KQUG+OeqrIjbWvmNicFIrgaTL215XQyoz1dmLAqo=; b=3m8BHntslgNIMz
	bIwjxeUp6I8D08IO2h1uy9X70dJ9g2L86d49WDHvgYJn9rybyQWC76ktiXKSC14KWX+Rgm3eqPw3W
	3964Ynj324IHrobOIUf1gwdC3E/k4GKX4EsO7gUCresGe4z4Wlnlx7ECcGdykpwxPaK85MCwJ+KbH
	zq3jyIwODMJNRIcXFdLOAJAm3UbAUH5JEwb6XW2vrGO/SJT1XDwiQwkCFHIw707iPQ1wZEPRa2KTW
	XtegxOV4SOq2t8V6QDwgyRfpYAY2t7j0b1R1cSez/iWdFiJ2p4cdHRmhpfQK+3zcI54CDSH450/H8
	I+89y4fBJ6y3iExmNZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miNKV-006ZSs-6o; Wed, 03 Nov 2021 20:57:55 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miNJt-006Z60-37; Wed, 03 Nov 2021 20:57:19 +0000
Received: by mail-pl1-x635.google.com with SMTP id t11so3554963plq.11;
 Wed, 03 Nov 2021 13:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BFDd8LYLL9iLsk41I8B0uvCN8xqAE1pF4tRiEAvVNwE=;
 b=mU/lV2PDVhzl2apO/sKJObAt5f2aQJwQjF56oeVDNAVFILPaAuxYJqhe1INkvwqK4F
 LngVqgj0bbkDnnMIpWpgkEg0e1gJ0LjAb+Wa0Zl4FB/D1ubP7uxUhSGpeFZ/UyV3OVDE
 iboE6h8OZq9FAYalgtPZyloyJkImXmUB4SWh+r+uP5/FsZ736QljFfuaw+xVrDymxAB4
 N/D/ZuCnmbUzIGKyGSVySnFm/d5mC3XHS9nuPl4FkifJtkOBXUSHWmxEgGxCyGGR9Dhx
 LaYP4R60y2USvsvPyIpAax1BhdGd55TQ7J+x2lsDtzWDTlNrIBhyOX1s8ltU2lNK8Vw1
 /8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BFDd8LYLL9iLsk41I8B0uvCN8xqAE1pF4tRiEAvVNwE=;
 b=ugYTDrGgKiTwYtSJrlWAPPZwzkiX4I4SL6YnXTKgxrmoQOox2O4Vb5IN+FCT2ZmHqF
 /C8mTjMiYKLKa0Dxt3RGNoHXAOLicsjiW2QknLO2v1zu7wxF2695r76/5rChCExv/o8g
 j5jv9V7Q/nHykkjj8b+h9agjaaUMl5zVsrSJRBqw2GVW+6tpcm/FGx0hlkVy+lQvO4Lo
 HYe65sJj3tO/gw1gWAjPKMrJXg+402l5A7EpL0OFCul/NgqkX+AgE5h6/CSTnuAdcMIR
 C65WWOfP5gmNOwwYCP1/J4dBJkQz4ApkAZtLt85e6ZzA7ezuq+xdhMKhEMJOHVVH2+kO
 CCFA==
X-Gm-Message-State: AOAM533VXzd3qViZ1JNg1X/j4mnXXD8f1MICpeYyWLGyac6FCsELxXIB
 Tg/c+RpfPtSUjqeGMHn7Bds=
X-Google-Smtp-Source: ABdhPJztIqZLojbQkcG9MLb1IIhhdLW0+uR0uxDfAsAAHrYl0w4LRAN+yau1elpkYyy4Jk6iCHIbXw==
X-Received: by 2002:a17:903:1c3:b0:142:3ae:5c09 with SMTP id
 e3-20020a17090301c300b0014203ae5c09mr14720727plh.52.1635973032210; 
 Wed, 03 Nov 2021 13:57:12 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id b18sm2554859pjo.31.2021.11.03.13.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 13:57:11 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Nitin Gupta <ngupta@vflare.org>, Minchan Kim <minchan@kernel.org>,
 Andy Lutomirski <luto@amacapital.net>, Borislav Petkov <bp@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-mm@kvack.org,
 Ingo Molnar <mingo@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
 Arnd Bergmann <arnd@arndb.de>, Stefan Agner <stefan@agner.ch>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mike Rapoport <rppt@linux.ibm.com>,
 linux-snps-arc@lists.infradead.org (open list:SYNOPSYS ARC ARCHITECTURE),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT),
 linux-mips@linux-mips.org (open list:MIPS),
 linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND
 64-BIT)), 
 linux-arch@vger.kernel.org (open list:GENERIC INCLUDE/ASM HEADER FILES)
Subject: [PATCH stable 4.14 1/2] mm/zsmalloc: Prepare to variable
 MAX_PHYSMEM_BITS
Date: Wed,  3 Nov 2021 13:57:03 -0700
Message-Id: <20211103205704.374734-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103205704.374734-1-f.fainelli@gmail.com>
References: <20211103205704.374734-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_135717_193575_63EDA1F4 
X-CRM114-Status: GOOD (  16.07  )
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

From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

commit 02390b87a9459937cdb299e6b34ff33992512ec7 upstream

With boot-time switching between paging mode we will have variable
MAX_PHYSMEM_BITS.

Let's use the maximum variable possible for CONFIG_X86_5LEVEL=y
configuration to define zsmalloc data structures.

The patch introduces MAX_POSSIBLE_PHYSMEM_BITS to cover such case.
It also suits well to handle PAE special case.

Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Nitin Gupta <ngupta@vflare.org>
Acked-by: Minchan Kim <minchan@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>
Cc: Borislav Petkov <bp@suse.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-mm@kvack.org
Link: http://lkml.kernel.org/r/20180214111656.88514-3-kirill.shutemov@linux.intel.com
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/x86/include/asm/pgtable-3level_types.h |  1 +
 arch/x86/include/asm/pgtable_64_types.h     |  2 ++
 mm/zsmalloc.c                               | 13 +++++++------
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/pgtable-3level_types.h b/arch/x86/include/asm/pgtable-3level_types.h
index 876b4c77d983..6a59a6d0cc50 100644
--- a/arch/x86/include/asm/pgtable-3level_types.h
+++ b/arch/x86/include/asm/pgtable-3level_types.h
@@ -44,5 +44,6 @@ typedef union {
  */
 #define PTRS_PER_PTE	512
 
+#define MAX_POSSIBLE_PHYSMEM_BITS	36
 
 #endif /* _ASM_X86_PGTABLE_3LEVEL_DEFS_H */
diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
index bf6d2692fc60..2bd79b7ae9d6 100644
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -40,6 +40,8 @@ typedef struct { pteval_t pte; } pte_t;
 #define P4D_SIZE	(_AC(1, UL) << P4D_SHIFT)
 #define P4D_MASK	(~(P4D_SIZE - 1))
 
+#define MAX_POSSIBLE_PHYSMEM_BITS	52
+
 #else /* CONFIG_X86_5LEVEL */
 
 /*
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 6ed736ea9b59..633ebcac82f8 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -83,18 +83,19 @@
  * This is made more complicated by various memory models and PAE.
  */
 
-#ifndef MAX_PHYSMEM_BITS
-#ifdef CONFIG_HIGHMEM64G
-#define MAX_PHYSMEM_BITS 36
-#else /* !CONFIG_HIGHMEM64G */
+#ifndef MAX_POSSIBLE_PHYSMEM_BITS
+#ifdef MAX_PHYSMEM_BITS
+#define MAX_POSSIBLE_PHYSMEM_BITS MAX_PHYSMEM_BITS
+#else
 /*
  * If this definition of MAX_PHYSMEM_BITS is used, OBJ_INDEX_BITS will just
  * be PAGE_SHIFT
  */
-#define MAX_PHYSMEM_BITS BITS_PER_LONG
+#define MAX_POSSIBLE_PHYSMEM_BITS BITS_PER_LONG
 #endif
 #endif
-#define _PFN_BITS		(MAX_PHYSMEM_BITS - PAGE_SHIFT)
+
+#define _PFN_BITS		(MAX_POSSIBLE_PHYSMEM_BITS - PAGE_SHIFT)
 
 /*
  * Memory for allocating for handle keeps object position by
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
