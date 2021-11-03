Return-Path: <SRS0=3pus=PW=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A35C433FE
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Nov 2021 20:58:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F39B61156
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Nov 2021 20:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F39B61156
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oAp55K1RsOAlTZL1InGcQz1tIqM4VrPjQZghV2zOxZU=; b=JjEBL/iZa0mAO7
	4ucPykpsjNd6U2xPIOnZFaK53tUh8uasZcQzOCL4CxkcWsFoatn01p1j63W7HMy9kW/px5/MQNK0R
	Nk/XMtNh7F4siMf0x6z5SwCIHBh7z7Z0teOFxKuPguYRHpikqrDvKzybXITBhpsHSOw4pLmCpch+I
	zwVBUCEO5nBTYdEfJ5X6Pl7NUxFT/pemLjemb/U42deMA29ldqc+0b2R+GDw4xGD+eLFWarGqRFjf
	QwnBtjq7/Xd7b/LNC+WdUX5AZZzBTsLZ58vfC/5EjEegmj7hoevGDoFelA+rVOga4WBv1E96anvc8
	nvIUkBqlSL5dBfyWrmFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miNLL-006Zvq-Kz; Wed, 03 Nov 2021 20:58:47 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miNKF-006ZJJ-Fr; Wed, 03 Nov 2021 20:57:41 +0000
Received: by mail-pl1-x62e.google.com with SMTP id r5so3644003pls.1;
 Wed, 03 Nov 2021 13:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S0dFQ/UQsJWaH1kYJj3rWoS4C5q2ObA8TNk2IQSTt/E=;
 b=AXEWEp3emvXTgbngg4++MXlbgCHH34v77Xce8c+ORkiO3/qFOKvu0613Q6ztFJfnPS
 VeoxlHXujoFqOXxq322zYzRFXYyauddU9hS0kdhCp9F7Yr2xVUF34o+uS2pwXVPSMc3a
 CyrLgQLFw1Duf1oMB2WN8QuOXt4V4HB3CwFyavkEpqN8dfvxmYSee7yAo8lTPnV/PWJa
 CpaaShYJCHMUSRu3yD8vPSTstS8/E2uMd9awmsBMSB/GpyeXh3Ol5jv1IYmFhT3dsdu8
 9IBtuS22yL8DvScVbbeS2BK5usQTjChqURTmsc2be3zGiw7+EmRDEwy6nXGFC/PS11Xz
 Bhxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S0dFQ/UQsJWaH1kYJj3rWoS4C5q2ObA8TNk2IQSTt/E=;
 b=fZ9of63HK4bCPs9uCGWwf2cGu/haGy/+5ymD+A+h4I+3oiCRMv5uXn/3a5hnZbuT8m
 dKexe/7cvvnR5tZUjDjUgz8HaVzX2Yteo1hn4zCUpvAiz0EAdKiaU1e4fBIv2vtbOlZE
 DTkjMDMJNi0CpWXr3aN21fOjNyzyh72PxrmHEyWqL3qN4ODOMeTA8WmmH1U7JPtsYXwp
 w4qR+ohXcYuNgerXwMsaTtVo7edCk1ZSwCwjKvszTiC0fnaPEOX6uYokUD/CPRoBaFcq
 q3L5hC8z4+fKf7ET0bcgudEgpZUH/SRdn6ygNRaMBTwJuFcQsU95wzJv5Jqfzk3VdZKK
 X8AQ==
X-Gm-Message-State: AOAM532BFDNl/hj0nWU/YkWXo+Tk8TRTMtVLZxbuhuQjQNDAwUE614b8
 qGGD/2Ssnf0RqOkLbu71j4s=
X-Google-Smtp-Source: ABdhPJx3h3YvixDAK7XkDn1NEXW/Ly0bj8zLO7l9ZanyuX8A7hDGbBtgHH352XBpCOFs5bwZzGQnXg==
X-Received: by 2002:a17:902:cec4:b0:141:cfa1:f7e with SMTP id
 d4-20020a170902cec400b00141cfa10f7emr26542606plg.13.1635973058968; 
 Wed, 03 Nov 2021 13:57:38 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id n14sm2512073pgd.68.2021.11.03.13.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 13:57:22 -0700 (PDT)
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
 Arnd Bergmann <arnd@arndb.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Mike Rapoport <rppt@linux.ibm.com>, Stefan Agner <stefan@agner.ch>,
 linux-snps-arc@lists.infradead.org (open list:SYNOPSYS ARC ARCHITECTURE),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT),
 linux-mips@linux-mips.org (open list:MIPS),
 linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND
 64-BIT)), 
 linux-arch@vger.kernel.org (open list:GENERIC INCLUDE/ASM HEADER FILES)
Subject: [PATCH stable 4.9 1/2] mm/zsmalloc: Prepare to variable
 MAX_PHYSMEM_BITS
Date: Wed,  3 Nov 2021 13:57:13 -0700
Message-Id: <20211103205714.374801-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103205714.374801-1-f.fainelli@gmail.com>
References: <20211103205714.374801-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_135739_593453_94BB34C1 
X-CRM114-Status: GOOD (  15.78  )
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
[florian: drop arch/x86/include/asm/pgtable_64_types.h changes since
there is no CONFIG_X86_5LEVEL]
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/x86/include/asm/pgtable-3level_types.h |  1 +
 mm/zsmalloc.c                               | 13 +++++++------
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/pgtable-3level_types.h b/arch/x86/include/asm/pgtable-3level_types.h
index bcc89625ebe5..f3f719d59e61 100644
--- a/arch/x86/include/asm/pgtable-3level_types.h
+++ b/arch/x86/include/asm/pgtable-3level_types.h
@@ -42,5 +42,6 @@ typedef union {
  */
 #define PTRS_PER_PTE	512
 
+#define MAX_POSSIBLE_PHYSMEM_BITS	36
 
 #endif /* _ASM_X86_PGTABLE_3LEVEL_DEFS_H */
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 8db3c2b27a17..2b7bfd97587a 100644
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
