Return-Path: <SRS0=u+eN=IG=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26140C433E0
	for <linux-snps-arc@archiver.kernel.org>; Mon,  8 Mar 2021 06:50:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C82FD64E56
	for <linux-snps-arc@archiver.kernel.org>; Mon,  8 Mar 2021 06:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C82FD64E56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtzRs+KSgS1RYJNPy6ciGF+lrpsYTlzGf9LhE+I1lLQ=; b=RCvZajJ85WRG0111aiuG/UNNF/
	XukQFcBTXNothDG+VdDpUhMYkRqG0J5BFk1O8wjunJ5bc6nnXKuJ0kF3FzvUwOIpoQFI+47kq64LX
	ut5aNy1cfKT9MCn6muOOcYuavC8uOVBVCThgIv8S2MwgImLqznr9893IiqsibKN1M3N9Lr4QXayD7
	HExbII8tWLlbGBU02UxvVIrJLwoXcSj6V3G2ZdZeaRahiwFHO+LA9xRVFcbAv48NrowlqrQHda61b
	LMA0knXbkSFx9ID5mkUl6xtB2303A6BM7QpL4gGYIpnZCusR4913B3nQBXi0ZjuFa4taufpDFZmaE
	J+FVS4Hw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ9ih-00FYgj-VJ; Mon, 08 Mar 2021 06:50:24 +0000
Received: from foss.arm.com ([217.140.110.172])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ9aT-00FWiv-MU; Mon, 08 Mar 2021 06:42:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 587DB113E;
 Sun,  7 Mar 2021 22:41:45 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.67.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8AA953F73C;
 Sun,  7 Mar 2021 22:41:36 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, x86@kernel.org,
 linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH 2/6] mm: Generalize SYS_SUPPORTS_HUGETLBFS (rename as
 ARCH_SUPPORTS_HUGETLBFS)
Date: Mon,  8 Mar 2021 12:11:41 +0530
Message-Id: <1615185706-24342-3-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615185706-24342-1-git-send-email-anshuman.khandual@arm.com>
References: <1615185706-24342-1-git-send-email-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_064155_281521_6FBA01C8 
X-CRM114-Status: GOOD (  12.64  )
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

SYS_SUPPORTS_HUGETLBFS config has duplicate definitions on platforms that
subscribe it. Instead, just make it a generic option which can be selected
on applicable platforms. Also rename it as ARCH_SUPPORTS_HUGETLBFS instead.
This reduces code duplication and makes it cleaner.

Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-sh@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm/Kconfig                       | 5 +----
 arch/arm64/Kconfig                     | 4 +---
 arch/mips/Kconfig                      | 6 +-----
 arch/parisc/Kconfig                    | 5 +----
 arch/powerpc/Kconfig                   | 3 ---
 arch/powerpc/platforms/Kconfig.cputype | 6 +++---
 arch/riscv/Kconfig                     | 5 +----
 arch/sh/Kconfig                        | 5 +----
 fs/Kconfig                             | 5 ++++-
 9 files changed, 13 insertions(+), 31 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 853aab5ab327..d612d2be6859 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -31,6 +31,7 @@ config ARM
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT if CPU_V7
 	select ARCH_SUPPORTS_ATOMIC_RMW
+	select ARCH_SUPPORTS_HUGETLBFS if ARM_LPAE
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
@@ -1503,10 +1504,6 @@ config HW_PERF_EVENTS
 	def_bool y
 	depends on ARM_PMU
 
-config SYS_SUPPORTS_HUGETLBFS
-       def_bool y
-       depends on ARM_LPAE
-
 config HAVE_ARCH_TRANSPARENT_HUGEPAGE
        def_bool y
        depends on ARM_LPAE
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 606a2323e002..68fe3b5bf17a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -72,6 +72,7 @@ config ARM64
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_USE_SYM_ANNOTATIONS
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC
+	select ARCH_SUPPORTS_HUGETLBFS
 	select ARCH_SUPPORTS_MEMORY_FAILURE
 	select ARCH_SUPPORTS_SHADOW_CALL_STACK if CC_HAVE_SHADOW_CALL_STACK
 	select ARCH_SUPPORTS_LTO_CLANG if CPU_LITTLE_ENDIAN
@@ -1053,9 +1054,6 @@ config HW_PERF_EVENTS
 	def_bool y
 	depends on ARM_PMU
 
-config SYS_SUPPORTS_HUGETLBFS
-	def_bool y
-
 config ARCH_WANT_HUGE_PMD_SHARE
 
 config ARCH_ENABLE_SPLIT_PMD_PTLOCK
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d89efba3d8a4..73ea9b7558c1 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -16,6 +16,7 @@ config MIPS
 	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
+	select ARCH_SUPPORTS_HUGETLBFS if CPU_SUPPORTS_HUGEPAGES
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_LD_ORPHAN_WARN
@@ -1281,11 +1282,6 @@ config SYS_SUPPORTS_BIG_ENDIAN
 config SYS_SUPPORTS_LITTLE_ENDIAN
 	bool
 
-config SYS_SUPPORTS_HUGETLBFS
-	bool
-	depends on CPU_SUPPORTS_HUGEPAGES
-	default y
-
 config MIPS_HUGE_TLB_SUPPORT
 	def_bool HUGETLB_PAGE || TRANSPARENT_HUGEPAGE
 
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 4e53ac46e857..4ce68e640474 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -12,6 +12,7 @@ config PARISC
 	select ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_NO_SG_CHAIN
+	select ARCH_SUPPORTS_HUGETLBFS if PA20
 	select ARCH_SUPPORTS_MEMORY_FAILURE
 	select DMA_OPS
 	select RTC_CLASS
@@ -138,10 +139,6 @@ config PGTABLE_LEVELS
 	default 3 if 64BIT && PARISC_PAGE_SIZE_4KB
 	default 2
 
-config SYS_SUPPORTS_HUGETLBFS
-	def_bool y if PA20
-
-
 menu "Processor type and features"
 
 choice
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 386ae12d8523..a74c211e55b1 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -700,9 +700,6 @@ config ARCH_SPARSEMEM_DEFAULT
 	def_bool y
 	depends on PPC_BOOK3S_64
 
-config SYS_SUPPORTS_HUGETLBFS
-	bool
-
 config ILLEGAL_POINTER_VALUE
 	hex
 	# This is roughly half way between the top of user space and the bottom
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 3ce907523b1e..cec1017813f8 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -40,8 +40,8 @@ config PPC_85xx
 
 config PPC_8xx
 	bool "Freescale 8xx"
+	select ARCH_SUPPORTS_HUGETLBFS
 	select FSL_SOC
-	select SYS_SUPPORTS_HUGETLBFS
 	select PPC_HAVE_KUEP
 	select PPC_HAVE_KUAP
 	select HAVE_ARCH_VMAP_STACK
@@ -95,9 +95,9 @@ config PPC_BOOK3S_64
 	bool "Server processors"
 	select PPC_FPU
 	select PPC_HAVE_PMU_SUPPORT
-	select SYS_SUPPORTS_HUGETLBFS
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
+	select ARCH_SUPPORTS_HUGETLBFS
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select IRQ_WORK
 	select PPC_MM_SLICES
@@ -278,9 +278,9 @@ config FSL_BOOKE
 # this is for common code between PPC32 & PPC64 FSL BOOKE
 config PPC_FSL_BOOK3E
 	bool
+	select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
 	select FSL_EMB_PERFMON
 	select PPC_SMP_MUXED_IPI
-	select SYS_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
 	select PPC_DOORBELL
 	default y if FSL_BOOKE
 
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 85d626b8ce5e..69954db3aca9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -30,6 +30,7 @@ config RISCV
 	select ARCH_HAS_STRICT_KERNEL_RWX if MMU
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
+	select ARCH_SUPPORTS_HUGETLBFS if MMU
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
@@ -165,10 +166,6 @@ config ARCH_WANT_GENERAL_HUGETLB
 config ARCH_SUPPORTS_UPROBES
 	def_bool y
 
-config SYS_SUPPORTS_HUGETLBFS
-	depends on MMU
-	def_bool y
-
 config STACKTRACE_SUPPORT
 	def_bool y
 
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index e798e55915c2..a54b0c5de37b 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -101,9 +101,6 @@ config SYS_SUPPORTS_APM_EMULATION
 	bool
 	select ARCH_SUSPEND_POSSIBLE
 
-config SYS_SUPPORTS_HUGETLBFS
-	bool
-
 config SYS_SUPPORTS_SMP
 	bool
 
@@ -175,12 +172,12 @@ config CPU_SH3
 
 config CPU_SH4
 	bool
+	select ARCH_SUPPORTS_HUGETLBFS if MMU
 	select CPU_HAS_INTEVT
 	select CPU_HAS_SR_RB
 	select CPU_HAS_FPU if !CPU_SH4AL_DSP
 	select SH_INTC
 	select SYS_SUPPORTS_SH_TMU
-	select SYS_SUPPORTS_HUGETLBFS if MMU
 
 config CPU_SH4A
 	bool
diff --git a/fs/Kconfig b/fs/Kconfig
index 462253ae483a..1b1be98e3b85 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -222,10 +222,13 @@ config TMPFS_INODE64
 
 	  If unsure, say N.
 
+config ARCH_SUPPORTS_HUGETLBFS
+	def_bool n
+
 config HUGETLBFS
 	bool "HugeTLB file system support"
 	depends on X86 || IA64 || SPARC64 || (S390 && 64BIT) || \
-		   SYS_SUPPORTS_HUGETLBFS || BROKEN
+		   ARCH_SUPPORTS_HUGETLBFS || BROKEN
 	help
 	  hugetlbfs is a filesystem backing for HugeTLB pages, based on
 	  ramfs. For architectures that support it, say Y here and read
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
