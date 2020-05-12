Return-Path: <SRS0=6ApH=62=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002B2CA90AF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 May 2020 18:46:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC2D820673
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 May 2020 18:46:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cQNnLnE0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwfBouFs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC2D820673
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6WxEVL9kN7pCQ/Q0Y0gWtuj87VXv/dwsNB1eNpz7XRc=; b=cQNnLnE0pCD5gG
	qB+pgWgSiIB2v4HxbQdxsqqEDeJXeyv7Oi60bvioVrfYlg94FF/V99eqwH6yqkWeTdCfybOapWSZc
	O5JYiUhC+lEVuTFS/7c4grUrVhNLFJZT3HVRp1dxFSZwKGHgYamMb0i2BF9A8d3g5hURDa++tR4Pw
	DZCrFvYhS5midGAQW4JQwjE1DLwfqUW1kEqN78xIfZDfpKIh7J7w3Tqsbqi8GciTwEUH8P1qcAH1w
	61wInUEF1TTi/nZ+ris5gC5+b9Zjf8n3fFCBMKeYX7rbFgzu7GHo4TTmvpoGramWWQnpmki/qCDpo
	2I8X5TUNlCI5xzo1HfdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYZup-0003wI-Iz; Tue, 12 May 2020 18:46:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYZul-0003u1-H6; Tue, 12 May 2020 18:46:04 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20724207BC;
 Tue, 12 May 2020 18:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589309163;
 bh=atmnGCDoPk5y69B76HVx6bX3NRhp438vfpo6E2XojpU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QwfBouFsLRnlT2Sr0gTs8+RR8GI46zlRZcArZa598W3Uy1zK3eMrdG5MuObjTaeaa
 bmhU294WnwEVHg416fZA1TDU1TnGHodrvpucPLyNv0juuc+e7KsRaI9L4NL1IvKO4M
 m9kbRsjsEnI7m4NXHJxzZ7cZ79o0LcODoZOrkQjY=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 05/12] m68k/mm/motorola: move comment about page table
 allocation funcitons
Date: Tue, 12 May 2020 21:44:15 +0300
Message-Id: <20200512184422.12418-6-rppt@kernel.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200512184422.12418-1-rppt@kernel.org>
References: <20200512184422.12418-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_114603_606987_B749A057 
X-CRM114-Status: GOOD (  12.64  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Brian Cain <bcain@codeaurora.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-parisc@vger.kernel.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Thomas Gleixner <tglx@linutronix.de>, Richard Weinberger <richard@nod.at>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

The comment about page table allocation functions resides in
include/asm/motorola_pgtable.h while the functions live in
include/asm/motorola_pgaloc.h.

Move the comment close to the code.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/m68k/include/asm/motorola_pgalloc.h | 6 ++++++
 arch/m68k/include/asm/motorola_pgtable.h | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/include/asm/motorola_pgalloc.h b/arch/m68k/include/asm/motorola_pgalloc.h
index c66e42917912..f3cb453a07b7 100644
--- a/arch/m68k/include/asm/motorola_pgalloc.h
+++ b/arch/m68k/include/asm/motorola_pgalloc.h
@@ -18,6 +18,12 @@ extern void init_pointer_table(void *table, int type);
 extern void *get_pointer_table(int type);
 extern int free_pointer_table(void *table, int type);
 
+/*
+ * Allocate and free page tables. The xxx_kernel() versions are
+ * used to allocate a kernel page table - this turns on ASN bits
+ * if any.
+ */
+
 static inline pte_t *pte_alloc_one_kernel(struct mm_struct *mm)
 {
 	return get_pointer_table(TABLE_PTE);
diff --git a/arch/m68k/include/asm/motorola_pgtable.h b/arch/m68k/include/asm/motorola_pgtable.h
index 48f19f0ab1e7..9e5a3de21e15 100644
--- a/arch/m68k/include/asm/motorola_pgtable.h
+++ b/arch/m68k/include/asm/motorola_pgtable.h
@@ -227,12 +227,6 @@ static inline pte_t *pte_offset_kernel(pmd_t *pmdp, unsigned long address)
 #define pte_offset_map(pmdp,address) ((pte_t *)__pmd_page(*pmdp) + (((address) >> PAGE_SHIFT) & (PTRS_PER_PTE - 1)))
 #define pte_unmap(pte)		((void)0)
 
-/*
- * Allocate and free page tables. The xxx_kernel() versions are
- * used to allocate a kernel page table - this turns on ASN bits
- * if any.
- */
-
 /* Prior to calling these routines, the page should have been flushed
  * from both the cache and ATC, or the CPU might not notice that the
  * cache setting for the page has been changed. -jskov
-- 
2.26.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
