Return-Path: <SRS0=Uylt=AY=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E696EC433E4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Jul 2020 03:25:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97C152075F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Jul 2020 03:25:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tpLHNj7l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97C152075F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYIn1e1YfKcwZFPq6L9j+fXgXckNH616kypq4NiGohY=; b=tpLHNj7l1hufjXp5219XEZz4X1
	tO4FqK6wiZW4j6HzT3PCFl9S1+cP8/T9wK56ii9BoAO00bIyXAvokJjBo343cQDtI9JDuKqgVmSZ2
	q0jl5tFomn+ZavevT/47py82hCqZKq1Ws0O8az1iayfZtnqqDeoYLFMkaEYjUK83fvV7LowzfFgcc
	6bgaw8an8PwknFTOvvvb53udtwiInwSPyvf+rFNjV+S92s2b4UeRgLS9PNUVg9cCxnZ3vOBn8sw+Y
	Wpxjx9mApjKZBSyMaw2PxwBT9tndB0DnlynTRuvBTKuQJzJKDzA6Iuh9nS+kv0BkHK7LCxQXnTw2/
	RMXNWlYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jup5R-0002PH-Fd; Mon, 13 Jul 2020 03:25:01 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jup57-0002Fo-Ey; Mon, 13 Jul 2020 03:24:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D1071FB;
 Sun, 12 Jul 2020 20:24:40 -0700 (PDT)
Received: from p8cg001049571a15.arm.com (unknown [10.163.87.124])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 526E93F7D8;
 Sun, 12 Jul 2020 20:24:28 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Subject: [PATCH V5 4/4] Documentation/mm: Add descriptions for arch page table
 helpers
Date: Mon, 13 Jul 2020 08:53:07 +0530
Message-Id: <1594610587-4172-5-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594610587-4172-1-git-send-email-anshuman.khandual@arm.com>
References: <1594610587-4172-1-git-send-email-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200712_232441_769241_5717AE1E 
X-CRM114-Status: GOOD (  17.89  )
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, agordeev@linux.ibm.com,
 Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, christophe.leroy@csgroup.eu,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, ziy@nvidia.com,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-snps-arc@lists.infradead.org, Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, cai@lca.pw,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, gerald.schaefer@de.ibm.com,
 christophe.leroy@c-s.fr, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 aneesh.kumar@linux.ibm.com, Borislav Petkov <bp@alien8.de>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 rppt@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This adds a specific description file for all arch page table helpers which
is in sync with the semantics being tested via CONFIG_DEBUG_VM_PGTABLE. All
future changes either to these descriptions here or the debug test should
always remain in sync.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Gerald Schaefer <gerald.schaefer@de.ibm.com>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Kirill A. Shutemov <kirill@shutemov.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: x86@kernel.org
Cc: linux-arch@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Acked-by: Mike Rapoport <rppt@linux.ibm.com>
Suggested-by: Mike Rapoport <rppt@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 Documentation/vm/arch_pgtable_helpers.rst | 258 ++++++++++++++++++++++
 mm/debug_vm_pgtable.c                     |   6 +
 2 files changed, 264 insertions(+)
 create mode 100644 Documentation/vm/arch_pgtable_helpers.rst

diff --git a/Documentation/vm/arch_pgtable_helpers.rst b/Documentation/vm/arch_pgtable_helpers.rst
new file mode 100644
index 000000000000..f3591ee3aaa8
--- /dev/null
+++ b/Documentation/vm/arch_pgtable_helpers.rst
@@ -0,0 +1,258 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _arch_page_table_helpers:
+
+===============================
+Architecture Page Table Helpers
+===============================
+
+Generic MM expects architectures (with MMU) to provide helpers to create, access
+and modify page table entries at various level for different memory functions.
+These page table helpers need to conform to a common semantics across platforms.
+Following tables describe the expected semantics which can also be tested during
+boot via CONFIG_DEBUG_VM_PGTABLE option. All future changes in here or the debug
+test need to be in sync.
+
+======================
+PTE Page Table Helpers
+======================
+
++---------------------------+--------------------------------------------------+
+| pte_same                  | Tests whether both PTE entries are the same      |
++---------------------------+--------------------------------------------------+
+| pte_bad                   | Tests a non-table mapped PTE                     |
++---------------------------+--------------------------------------------------+
+| pte_present               | Tests a valid mapped PTE                         |
++---------------------------+--------------------------------------------------+
+| pte_young                 | Tests a young PTE                                |
++---------------------------+--------------------------------------------------+
+| pte_dirty                 | Tests a dirty PTE                                |
++---------------------------+--------------------------------------------------+
+| pte_write                 | Tests a writable PTE                             |
++---------------------------+--------------------------------------------------+
+| pte_special               | Tests a special PTE                              |
++---------------------------+--------------------------------------------------+
+| pte_protnone              | Tests a PROT_NONE PTE                            |
++---------------------------+--------------------------------------------------+
+| pte_devmap                | Tests a ZONE_DEVICE mapped PTE                   |
++---------------------------+--------------------------------------------------+
+| pte_soft_dirty            | Tests a soft dirty PTE                           |
++---------------------------+--------------------------------------------------+
+| pte_swp_soft_dirty        | Tests a soft dirty swapped PTE                   |
++---------------------------+--------------------------------------------------+
+| pte_mkyoung               | Creates a young PTE                              |
++---------------------------+--------------------------------------------------+
+| pte_mkold                 | Creates an old PTE                               |
++---------------------------+--------------------------------------------------+
+| pte_mkdirty               | Creates a dirty PTE                              |
++---------------------------+--------------------------------------------------+
+| pte_mkclean               | Creates a clean PTE                              |
++---------------------------+--------------------------------------------------+
+| pte_mkwrite               | Creates a writable PTE                           |
++---------------------------+--------------------------------------------------+
+| pte_mkwrprotect           | Creates a write protected PTE                    |
++---------------------------+--------------------------------------------------+
+| pte_mkspecial             | Creates a special PTE                            |
++---------------------------+--------------------------------------------------+
+| pte_mkdevmap              | Creates a ZONE_DEVICE mapped PTE                 |
++---------------------------+--------------------------------------------------+
+| pte_mksoft_dirty          | Creates a soft dirty PTE                         |
++---------------------------+--------------------------------------------------+
+| pte_clear_soft_dirty      | Clears a soft dirty PTE                          |
++---------------------------+--------------------------------------------------+
+| pte_swp_mksoft_dirty      | Creates a soft dirty swapped PTE                 |
++---------------------------+--------------------------------------------------+
+| pte_swp_clear_soft_dirty  | Clears a soft dirty swapped PTE                  |
++---------------------------+--------------------------------------------------+
+| pte_mknotpresent          | Invalidates a mapped PTE                         |
++---------------------------+--------------------------------------------------+
+| ptep_get_and_clear        | Clears a PTE                                     |
++---------------------------+--------------------------------------------------+
+| ptep_get_and_clear_full   | Clears a PTE                                     |
++---------------------------+--------------------------------------------------+
+| ptep_test_and_clear_young | Clears young from a PTE                          |
++---------------------------+--------------------------------------------------+
+| ptep_set_wrprotect        | Converts into a write protected PTE              |
++---------------------------+--------------------------------------------------+
+| ptep_set_access_flags     | Converts into a more permissive PTE              |
++---------------------------+--------------------------------------------------+
+
+======================
+PMD Page Table Helpers
+======================
+
++---------------------------+--------------------------------------------------+
+| pmd_same                  | Tests whether both PMD entries are the same      |
++---------------------------+--------------------------------------------------+
+| pmd_bad                   | Tests a non-table mapped PMD                     |
++---------------------------+--------------------------------------------------+
+| pmd_leaf                  | Tests a leaf mapped PMD                          |
++---------------------------+--------------------------------------------------+
+| pmd_huge                  | Tests a HugeTLB mapped PMD                       |
++---------------------------+--------------------------------------------------+
+| pmd_trans_huge            | Tests a Transparent Huge Page (THP) at PMD       |
++---------------------------+--------------------------------------------------+
+| pmd_present               | Tests a valid mapped PMD                         |
++---------------------------+--------------------------------------------------+
+| pmd_young                 | Tests a young PMD                                |
++---------------------------+--------------------------------------------------+
+| pmd_dirty                 | Tests a dirty PMD                                |
++---------------------------+--------------------------------------------------+
+| pmd_write                 | Tests a writable PMD                             |
++---------------------------+--------------------------------------------------+
+| pmd_special               | Tests a special PMD                              |
++---------------------------+--------------------------------------------------+
+| pmd_protnone              | Tests a PROT_NONE PMD                            |
++---------------------------+--------------------------------------------------+
+| pmd_devmap                | Tests a ZONE_DEVICE mapped PMD                   |
++---------------------------+--------------------------------------------------+
+| pmd_soft_dirty            | Tests a soft dirty PMD                           |
++---------------------------+--------------------------------------------------+
+| pmd_swp_soft_dirty        | Tests a soft dirty swapped PMD                   |
++---------------------------+--------------------------------------------------+
+| pmd_mkyoung               | Creates a young PMD                              |
++---------------------------+--------------------------------------------------+
+| pmd_mkold                 | Creates an old PMD                               |
++---------------------------+--------------------------------------------------+
+| pmd_mkdirty               | Creates a dirty PMD                              |
++---------------------------+--------------------------------------------------+
+| pmd_mkclean               | Creates a clean PMD                              |
++---------------------------+--------------------------------------------------+
+| pmd_mkwrite               | Creates a writable PMD                           |
++---------------------------+--------------------------------------------------+
+| pmd_mkwrprotect           | Creates a write protected PMD                    |
++---------------------------+--------------------------------------------------+
+| pmd_mkspecial             | Creates a special PMD                            |
++---------------------------+--------------------------------------------------+
+| pmd_mkdevmap              | Creates a ZONE_DEVICE mapped PMD                 |
++---------------------------+--------------------------------------------------+
+| pmd_mksoft_dirty          | Creates a soft dirty PMD                         |
++---------------------------+--------------------------------------------------+
+| pmd_clear_soft_dirty      | Clears a soft dirty PMD                          |
++---------------------------+--------------------------------------------------+
+| pmd_swp_mksoft_dirty      | Creates a soft dirty swapped PMD                 |
++---------------------------+--------------------------------------------------+
+| pmd_swp_clear_soft_dirty  | Clears a soft dirty swapped PMD                  |
++---------------------------+--------------------------------------------------+
+| pmd_mkinvalid             | Invalidates a mapped PMD [1]                     |
++---------------------------+--------------------------------------------------+
+| pmd_set_huge              | Creates a PMD huge mapping                       |
++---------------------------+--------------------------------------------------+
+| pmd_clear_huge            | Clears a PMD huge mapping                        |
++---------------------------+--------------------------------------------------+
+| pmdp_get_and_clear        | Clears a PMD                                     |
++---------------------------+--------------------------------------------------+
+| pmdp_get_and_clear_full   | Clears a PMD                                     |
++---------------------------+--------------------------------------------------+
+| pmdp_test_and_clear_young | Clears young from a PMD                          |
++---------------------------+--------------------------------------------------+
+| pmdp_set_wrprotect        | Converts into a write protected PMD              |
++---------------------------+--------------------------------------------------+
+| pmdp_set_access_flags     | Converts into a more permissive PMD              |
++---------------------------+--------------------------------------------------+
+
+======================
+PUD Page Table Helpers
+======================
+
++---------------------------+--------------------------------------------------+
+| pud_same                  | Tests whether both PUD entries are the same      |
++---------------------------+--------------------------------------------------+
+| pud_bad                   | Tests a non-table mapped PUD                     |
++---------------------------+--------------------------------------------------+
+| pud_leaf                  | Tests a leaf mapped PUD                          |
++---------------------------+--------------------------------------------------+
+| pud_huge                  | Tests a HugeTLB mapped PUD                       |
++---------------------------+--------------------------------------------------+
+| pud_trans_huge            | Tests a Transparent Huge Page (THP) at PUD       |
++---------------------------+--------------------------------------------------+
+| pud_present               | Tests a valid mapped PUD                         |
++---------------------------+--------------------------------------------------+
+| pud_young                 | Tests a young PUD                                |
++---------------------------+--------------------------------------------------+
+| pud_dirty                 | Tests a dirty PUD                                |
++---------------------------+--------------------------------------------------+
+| pud_write                 | Tests a writable PUD                             |
++---------------------------+--------------------------------------------------+
+| pud_devmap                | Tests a ZONE_DEVICE mapped PUD                   |
++---------------------------+--------------------------------------------------+
+| pud_mkyoung               | Creates a young PUD                              |
++---------------------------+--------------------------------------------------+
+| pud_mkold                 | Creates an old PUD                               |
++---------------------------+--------------------------------------------------+
+| pud_mkdirty               | Creates a dirty PUD                              |
++---------------------------+--------------------------------------------------+
+| pud_mkclean               | Creates a clean PUD                              |
++---------------------------+--------------------------------------------------+
+| pud_mkwrite               | Creates a writable PUD                           |
++---------------------------+--------------------------------------------------+
+| pud_mkwrprotect           | Creates a write protected PUD                    |
++---------------------------+--------------------------------------------------+
+| pud_mkdevmap              | Creates a ZONE_DEVICE mapped PUD                 |
++---------------------------+--------------------------------------------------+
+| pud_mkinvalid             | Invalidates a mapped PUD [1]                     |
++---------------------------+--------------------------------------------------+
+| pud_set_huge              | Creates a PUD huge mapping                       |
++---------------------------+--------------------------------------------------+
+| pud_clear_huge            | Clears a PUD huge mapping                        |
++---------------------------+--------------------------------------------------+
+| pudp_get_and_clear        | Clears a PUD                                     |
++---------------------------+--------------------------------------------------+
+| pudp_get_and_clear_full   | Clears a PUD                                     |
++---------------------------+--------------------------------------------------+
+| pudp_test_and_clear_young | Clears young from a PUD                          |
++---------------------------+--------------------------------------------------+
+| pudp_set_wrprotect        | Converts into a write protected PUD              |
++---------------------------+--------------------------------------------------+
+| pudp_set_access_flags     | Converts into a more permissive PUD              |
++---------------------------+--------------------------------------------------+
+
+==========================
+HugeTLB Page Table Helpers
+==========================
+
++---------------------------+--------------------------------------------------+
+| pte_huge                  | Tests a HugeTLB                                  |
++---------------------------+--------------------------------------------------+
+| pte_mkhuge                | Creates a HugeTLB                                |
++---------------------------+--------------------------------------------------+
+| huge_pte_dirty            | Tests a dirty HugeTLB                            |
++---------------------------+--------------------------------------------------+
+| huge_pte_write            | Tests a writable HugeTLB                         |
++---------------------------+--------------------------------------------------+
+| huge_pte_mkdirty          | Creates a dirty HugeTLB                          |
++---------------------------+--------------------------------------------------+
+| huge_pte_mkwrite          | Creates a writable HugeTLB                       |
++---------------------------+--------------------------------------------------+
+| huge_pte_mkwrprotect      | Creates a write protected HugeTLB                |
++---------------------------+--------------------------------------------------+
+| huge_ptep_get_and_clear   | Clears a HugeTLB                                 |
++---------------------------+--------------------------------------------------+
+| huge_ptep_set_wrprotect   | Converts into a write protected HugeTLB          |
++---------------------------+--------------------------------------------------+
+| huge_ptep_set_access_flags  | Converts into a more permissive HugeTLB        |
++---------------------------+--------------------------------------------------+
+
+========================
+SWAP Page Table Helpers
+========================
+
++---------------------------+--------------------------------------------------+
+| __pte_to_swp_entry        | Creates a swapped entry (arch) from a mapped PTE |
++---------------------------+--------------------------------------------------+
+| __swp_to_pte_entry        | Creates a mapped PTE from a swapped entry (arch) |
++---------------------------+--------------------------------------------------+
+| __pmd_to_swp_entry        | Creates a swapped entry (arch) from a mapped PMD |
++---------------------------+--------------------------------------------------+
+| __swp_to_pmd_entry        | Creates a mapped PMD from a swapped entry (arch) |
++---------------------------+--------------------------------------------------+
+| is_migration_entry        | Tests a migration (read or write) swapped entry  |
++---------------------------+--------------------------------------------------+
+| is_write_migration_entry  | Tests a write migration swapped entry            |
++---------------------------+--------------------------------------------------+
+| make_migration_entry_read | Converts into read migration swapped entry       |
++---------------------------+--------------------------------------------------+
+| make_migration_entry      | Creates a migration swapped entry (read or write)|
++---------------------------+--------------------------------------------------+
+
+[1] https://lore.kernel.org/linux-mm/20181017020930.GN30832@redhat.com/
diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 0db4390435be..e86c3d824693 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -31,6 +31,12 @@
 #include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 
+/*
+ * Please refer Documentation/vm/arch_pgtable_helpers.rst for the semantics
+ * expectations that are being validated here. All future changes in here
+ * or the documentation need to be in sync.
+ */
+
 #define VMFLAGS	(VM_READ|VM_WRITE|VM_EXEC)
 
 /*
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
