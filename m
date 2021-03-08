Return-Path: <SRS0=u+eN=IG=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B85C433E0
	for <linux-snps-arc@archiver.kernel.org>; Mon,  8 Mar 2021 06:56:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B5C064E56
	for <linux-snps-arc@archiver.kernel.org>; Mon,  8 Mar 2021 06:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B5C064E56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49/odLJXBmhPwaSg7ysF1YFgjQgLcaQN504c9MmpGa0=; b=gnjbLz7vPc8cf1LdFhg4RP7kNC
	TctLTkCZNtI8wK/Z2MGPiO4FwahwA/X09iEkX25qi/06JqNp1qZr32xohDuzaDsI6xRL8lvOXm25W
	FrrFZYDO++Tn20D9cmh31xhCopFi0r1nPJHoXcipGEVtEop7AaW4axogEblM5/C6LPACU4MSbZTqF
	wGGEjaKqEY/6kDp37SaFNcHXmAv/Jygm9oDeSjJmb5i1DKDkO9BtHodXZXXOV6inwOl8Q0164zch1
	YpXPJ/2Dwnbc43zeYga5OeL+rHWwJ3ybatPh73+0+J+d/fNpmyzEyNvC7trTj4SW/pOnX5aHiVjlC
	iTECYNdw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ9oe-00FaRA-Bc; Mon, 08 Mar 2021 06:56:32 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1234::107])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9bN-00FWxQ-T3; Mon, 08 Mar 2021 06:42:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tmRikT90ApbrH9p2ttGRcFHHDMUUxUw29Wr36MuuvgY=; b=c+CUV4Zpqc/6xQdvlVqj1vTsE/
 x1n5PMf3KsGyDu0Fx2JtazYu8ierM+gUtP0iZSN2rdeFCOmR6Vj/HIScX1eYKBC6RWV7iQBby0jLg
 X2tYbRosse2/vEGuasFYIrdCKX7OvChwsBkCxa2/WbCk4G0LTCAtUyAyQvzte2CjxF00g44BI/Ja0
 sfBeolqoH/9R9vZI/PV7vgH8fLUj4+pugzAx3glxUy5tInqj7biyPBxpZAdal1tAuejB6ekTtFIr2
 mzHjJh5dUvZSsWNvPpEpUNZnvfRE5NU7QTA7ondKE5Bkwj0gBtJW2WcTUt0ejC2FSnzQygCIgBdM/
 ORinVUFA==;
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9aX-000UVH-Sc; Mon, 08 Mar 2021 06:42:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEB08106F;
 Sun,  7 Mar 2021 22:41:35 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.67.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B98303F73C;
 Sun,  7 Mar 2021 22:41:28 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, x86@kernel.org,
 linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/6] mm: Generalize ARCH_HAS_CACHE_LINE_SIZE
Date: Mon,  8 Mar 2021 12:11:40 +0530
Message-Id: <1615185706-24342-2-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615185706-24342-1-git-send-email-anshuman.khandual@arm.com>
References: <1615185706-24342-1-git-send-email-anshuman.khandual@arm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

ARCH_HAS_CACHE_LINE_SIZE config has duplicate definitions on platforms that
subscribe it. Instead, just make it a generic option which can be selected
on applicable platforms. This change reduces code duplication and makes it
cleaner.

Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: x86@kernel.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arc/Kconfig   | 4 +---
 arch/arm64/Kconfig | 4 +---
 arch/x86/Kconfig   | 4 +---
 mm/Kconfig         | 3 +++
 4 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index bc8d6aecfbbd..fab05f7189c0 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -6,6 +6,7 @@
 config ARC
 	def_bool y
 	select ARC_TIMERS
+	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DMA_PREP_COHERENT
 	select ARCH_HAS_PTE_SPECIAL
@@ -48,9 +49,6 @@ config ARC
 	select HAVE_ARCH_JUMP_LABEL if ISA_ARCV2 && !CPU_ENDIAN_BE32
 	select SET_FS
 
-config ARCH_HAS_CACHE_LINE_SIZE
-	def_bool y
-
 config TRACE_IRQFLAGS_SUPPORT
 	def_bool y
 
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1f212b47a48a..606a2323e002 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -11,6 +11,7 @@ config ARM64
 	select ACPI_PPTT if ACPI
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_BINFMT_ELF_STATE
+	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DMA_PREP_COHERENT
@@ -1057,9 +1058,6 @@ config SYS_SUPPORTS_HUGETLBFS
 
 config ARCH_WANT_HUGE_PMD_SHARE
 
-config ARCH_HAS_CACHE_LINE_SIZE
-	def_bool y
-
 config ARCH_ENABLE_SPLIT_PMD_PTLOCK
 	def_bool y if PGTABLE_LEVELS > 2
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2792879d398e..51d171abb57a 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -61,6 +61,7 @@ config X86
 	select ARCH_32BIT_OFF_T			if X86_32
 	select ARCH_CLOCKSOURCE_INIT
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
+	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE	if !X86_PAE
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
@@ -313,9 +314,6 @@ config GENERIC_CALIBRATE_DELAY
 config ARCH_HAS_CPU_RELAX
 	def_bool y
 
-config ARCH_HAS_CACHE_LINE_SIZE
-	def_bool y
-
 config ARCH_HAS_FILTER_PGPROT
 	def_bool y
 
diff --git a/mm/Kconfig b/mm/Kconfig
index 24c045b24b95..1c9a37fc651a 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -760,6 +760,9 @@ config IDLE_PAGE_TRACKING
 	  See Documentation/admin-guide/mm/idle_page_tracking.rst for
 	  more details.
 
+config ARCH_HAS_CACHE_LINE_SIZE
+	bool
+
 config ARCH_HAS_PTE_DEVMAP
 	bool
 
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
