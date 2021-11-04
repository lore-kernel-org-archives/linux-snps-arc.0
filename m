Return-Path: <SRS0=DVbr=PX=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0667C433EF
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Nov 2021 08:35:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8570261212
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Nov 2021 08:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8570261212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=KERdVKb6tFTPQ3jkMCc66DYs7ubnj4ln8KCIUfz54A8=; b=naKNm2uMFTBP9Q
	wZx5WpJPzU+OoRvP5e1KS4syqbipGN89E4Ul+SrAwFFWmjxVOsnvP6QTCsTpDOBDw1wmlkz4tzB5N
	hoetoh9D4TmIoEHwhRF+5nzbtbMAL+7UUztll3QKjPNdvO819zbT9QjxQhlY/smJ8u0QX8DyzTjIN
	yy9BXMo8pOSfUc6vd0uIMkRMKrRgGwbjmatCjBeeQwJfaGWzAdQaV7E4PF9ZBun75M1zEEpn7nss6
	eI0Z/G0kSfamANnRFX7iCnpSVDu7qrIi+3+Gs/mlRC6ZOMA1E2vxmMQ1NO6IsJWD0hKsFDnu/q4BS
	Atrd66EUb7iPtm4K41pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miYDd-008JDb-W9; Thu, 04 Nov 2021 08:35:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miYDF-008J14-8v; Thu, 04 Nov 2021 08:35:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EF7961216;
 Thu,  4 Nov 2021 08:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1636014908;
 bh=McY9gQ8BqcMk7vs9Z3yJmIcYKviY8ebHfiIPLxeEYfg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=L2hIUVZJC5ixiAN4OCUcLRhkNCWwGRCwv5ZsXPbX0UpJkgBT2HwOuX+Yqla3g61dm
 KhM1aP0lHGRwM7wo7C3IWrIUPTQjVy+DIzARDcFt7LyWvMfe2tvxaqCPOo/uXCZWj/
 6uz6VABI2LcN4iXF5cAdroklb+0OlCvodXhIgDbU=
Subject: Patch "mm/zsmalloc: Prepare to variable MAX_PHYSMEM_BITS" has been
 added to the 4.14-stable tree
To: arnd@arndb.de, benh@kernel.crashing.org, bp@suse.de, f.fainelli@gmail.com,
 gregkh@linuxfoundation.org, hpa@zytor.com, kirill.shutemov@linux.intel.com,
 linux-arm-kernel@lists.infradead.org, linux-mips@linux-mips.org,
 linux-mm@kvack.org, linux-snps-arc@lists.infradead.org, linux@armlinux.org.uk,
 linuxppc-dev@lists.ozlabs.org, luto@amacapital.net, minchan@kernel.org,
 mingo@kernel.org, mingo@redhat.com, mpe@ellerman.id.au, ngupta@vflare.org,
 paulus@samba.org, peterz@infradead.org, ralf@linux-mips.org,
 rppt@linux.ibm.com, sashal@kernel.org, sergey.senozhatsky.work@gmail.com,
 stefan@agner.ch, tglx@linutronix.de, torvalds@linux-foundation.org,
 tsbogend@alpha.franken.de, vgupta@synopsys.com, x86@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 04 Nov 2021 09:34:58 +0100
In-Reply-To: <20211103205704.374734-2-f.fainelli@gmail.com>
Message-ID: <163601489811148@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_013509_468530_F415C374 
X-CRM114-Status: GOOD (  17.13  )
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


This is a note to let you know that I've just added the patch titled

    mm/zsmalloc: Prepare to variable MAX_PHYSMEM_BITS

to the 4.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     mm-zsmalloc-prepare-to-variable-max_physmem_bits.patch
and it can be found in the queue-4.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Thu Nov  4 09:33:05 AM CET 2021
From: Florian Fainelli <f.fainelli@gmail.com>
Date: Wed,  3 Nov 2021 13:57:03 -0700
Subject: mm/zsmalloc: Prepare to variable MAX_PHYSMEM_BITS
To: linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Nitin Gupta <ngupta@vflare.org>, Minchan Kim <minchan@kernel.org>, Andy Lutomirski <luto@amacapital.net>, Borislav Petkov <bp@suse.de>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, linux-mm@kvack.org, Ingo Molnar <mingo@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Vineet Gupta <vgupta@synopsys.com>, Russell King <linux@armlinux.org.uk>, Ralf Baechle <ralf@linux-mips.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)), Arnd Bergmann <arnd@arndb.de>, Stefan Agner <stefan@agn
 er.ch>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Mike Rapoport <rppt@linux.ibm.com>, linux-snps-arc@lists.infradead.org (open list:SYNOPSYS ARC ARCHITECTURE), linux-arm-kernel@lists.infradead.org (moderated list:ARM PORT), linux-mips@linux-mips.org (open list:MIPS), linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)), linux-arch@vger.kernel.org (open list:GENERIC INCLUDE/ASM HEADER FILES)
Message-ID: <20211103205704.374734-2-f.fainelli@gmail.com>

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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/x86/include/asm/pgtable-3level_types.h |    1 +
 arch/x86/include/asm/pgtable_64_types.h     |    2 ++
 mm/zsmalloc.c                               |   13 +++++++------
 3 files changed, 10 insertions(+), 6 deletions(-)

--- a/arch/x86/include/asm/pgtable-3level_types.h
+++ b/arch/x86/include/asm/pgtable-3level_types.h
@@ -44,5 +44,6 @@ typedef union {
  */
 #define PTRS_PER_PTE	512
 
+#define MAX_POSSIBLE_PHYSMEM_BITS	36
 
 #endif /* _ASM_X86_PGTABLE_3LEVEL_DEFS_H */
--- a/arch/x86/include/asm/pgtable_64_types.h
+++ b/arch/x86/include/asm/pgtable_64_types.h
@@ -40,6 +40,8 @@ typedef struct { pteval_t pte; } pte_t;
 #define P4D_SIZE	(_AC(1, UL) << P4D_SHIFT)
 #define P4D_MASK	(~(P4D_SIZE - 1))
 
+#define MAX_POSSIBLE_PHYSMEM_BITS	52
+
 #else /* CONFIG_X86_5LEVEL */
 
 /*
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


Patches currently in stable-queue which might be from f.fainelli@gmail.com are

queue-4.14/mm-zsmalloc-prepare-to-variable-max_physmem_bits.patch
queue-4.14/arch-pgtable-define-max_possible_physmem_bits-where-needed.patch

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
