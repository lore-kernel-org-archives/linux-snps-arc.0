Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE215C30653
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jul 2024 14:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGtEyroS/Q9XcS/TlRBRyTOn2pe9k2BiDDXYeM5VcE0=; b=Hc8X0Pka/OzUbh
	rZoW7iX+ncFfuOEhPZTK3DKLOhjF4LUe2en2c+Xa3q9aqKHfjGpJc9i8O9UwPIaNUECJNXe1s2sfJ
	GcUbitpHHKHzDL4yxtDR9fvHWnyz2EDFqI2RRasZB/tR+JNNar38m5aQuJV0taIWu+OJgy6SQV0dU
	tCQIF+Z/pEx24q06h2D8UEiIXaKmNBFQ3baRya+xeYq4pGuCNG7oc6+StjHLgCV1/zeVQAIj+V2Ql
	qbMCkfR1QY1rqLN2U/EC1I6KHGSKx2wxEiscT6tFCc2xdlPp/r70itRalbyci4HMPpB7ujjw/RiyR
	vCbh5D/WUpPBOV0fomPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNci-0000000DWHG-26yX;
	Thu, 04 Jul 2024 14:39:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNav-0000000DV0w-0z3P;
	Thu, 04 Jul 2024 14:37:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 596E760B68;
	Thu,  4 Jul 2024 14:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09ABAC3277B;
	Thu,  4 Jul 2024 14:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720103876;
	bh=nZGoGsld/DUw3AVg7vD7mXB59Rr8GgAXxGVkFPOubWI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JVXxYUaMIFExsZ9KH6GofYN627sH7sWihH7abVtu0seuRwuE69WyU26iNHsLQWNzH
	 gzk110N8UMZqijpiSwrKOVNZWsyMIstyUjjvbUDTP6vZIofa00veXipVpbCZNL5wl+
	 gd7WfktcSKVOL8+/lD3cDEvYsTln9WifVFedFGSZneD3d2bBY0RqvxvI62xTVsk2W2
	 qY6aV7Aije9aa4nle+LZbf6H3Y5g9UloFGsWUZP51T1ZbIyMophz0iAajit+vYbDV9
	 uBk4zCuyK6SvyimShQ+RGwcsuJwsYImjosHwqAsxyvVPR8NLF/LGEPo3No4vU7PTUD
	 KtdN0wKnc4Nhw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Christian Brauner <brauner@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-openrisc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 10/17] arm64: generate 64-bit syscall.tbl
Date: Thu,  4 Jul 2024 16:36:04 +0200
Message-Id: <20240704143611.2979589-11-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704143611.2979589-1-arnd@kernel.org>
References: <20240704143611.2979589-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_073757_483188_A36F1445 
X-CRM114-Status: GOOD (  20.98  )
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

From: Arnd Bergmann <arnd@arndb.de>

Change the asm/unistd.h header for arm64 to no longer include
asm-generic/unistd.h itself, but instead generate both the asm/unistd.h
contents and the list of entry points using the syscall.tbl scripts that
we use on most other architectures.

Once his is done for the remaining architectures, the generic unistd.h
header can be removed and the generated tbl file put in its place.

The Makefile changes are more complex than they should be, I need
a little help to improve those. Ideally this should be done in an
architecture-independent way as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/include/asm/Kbuild        |  1 +
 arch/arm64/include/asm/seccomp.h     |  1 +
 arch/arm64/include/asm/unistd.h      |  5 ++---
 arch/arm64/include/uapi/asm/Kbuild   |  1 +
 arch/arm64/include/uapi/asm/unistd.h | 24 +-----------------------
 arch/arm64/kernel/Makefile.syscalls  |  1 +
 arch/arm64/kernel/sys.c              |  6 ++++--
 arch/arm64/tools/Makefile            |  6 +++++-
 arch/arm64/tools/syscall_64.tbl      |  1 +
 9 files changed, 17 insertions(+), 29 deletions(-)
 create mode 120000 arch/arm64/tools/syscall_64.tbl

diff --git a/arch/arm64/include/asm/Kbuild b/arch/arm64/include/asm/Kbuild
index 3fc45ef32e85..7d7d97ad3cd5 100644
--- a/arch/arm64/include/asm/Kbuild
+++ b/arch/arm64/include/asm/Kbuild
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 syscall-y += syscall_table_32.h
+syscall-y += syscall_table_64.h
 
 # arm32 syscall table used by lib/compat_audit.c:
 syscall-y += unistd_32.h
diff --git a/arch/arm64/include/asm/seccomp.h b/arch/arm64/include/asm/seccomp.h
index d56164d3cac5..c83ca2c8b936 100644
--- a/arch/arm64/include/asm/seccomp.h
+++ b/arch/arm64/include/asm/seccomp.h
@@ -23,6 +23,7 @@
 #define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
 #define SECCOMP_ARCH_NATIVE_NAME	"aarch64"
 #ifdef CONFIG_COMPAT
+#include <asm/unistd_compat_32.h>
 # define SECCOMP_ARCH_COMPAT		AUDIT_ARCH_ARM
 # define SECCOMP_ARCH_COMPAT_NR		__NR_compat32_syscalls
 # define SECCOMP_ARCH_COMPAT_NAME	"arm"
diff --git a/arch/arm64/include/asm/unistd.h b/arch/arm64/include/asm/unistd.h
index 55ac26355be4..fdd16052f9bc 100644
--- a/arch/arm64/include/asm/unistd.h
+++ b/arch/arm64/include/asm/unistd.h
@@ -41,9 +41,8 @@
 #endif
 
 #define __ARCH_WANT_SYS_CLONE
+#define __ARCH_WANT_NEW_STAT
 
-#ifndef __COMPAT_SYSCALL_NR
-#include <uapi/asm/unistd.h>
-#endif
+#include <asm/unistd_64.h>
 
 #define NR_syscalls (__NR_syscalls)
diff --git a/arch/arm64/include/uapi/asm/Kbuild b/arch/arm64/include/uapi/asm/Kbuild
index 602d137932dc..c6d141d7b7d7 100644
--- a/arch/arm64/include/uapi/asm/Kbuild
+++ b/arch/arm64/include/uapi/asm/Kbuild
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
+syscall-y += unistd_64.h
 
 generic-y += kvm_para.h
diff --git a/arch/arm64/include/uapi/asm/unistd.h b/arch/arm64/include/uapi/asm/unistd.h
index 9306726337fe..038dddf8f554 100644
--- a/arch/arm64/include/uapi/asm/unistd.h
+++ b/arch/arm64/include/uapi/asm/unistd.h
@@ -1,24 +1,2 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-/*
- * Copyright (C) 2012 ARM Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-
-#define __ARCH_WANT_RENAMEAT
-#define __ARCH_WANT_NEW_STAT
-#define __ARCH_WANT_SET_GET_RLIMIT
-#define __ARCH_WANT_TIME32_SYSCALLS
-#define __ARCH_WANT_MEMFD_SECRET
-
-#include <asm-generic/unistd.h>
+#include <unistd_64.h>
diff --git a/arch/arm64/kernel/Makefile.syscalls b/arch/arm64/kernel/Makefile.syscalls
index 1e14effb3921..3cfafd003b2d 100644
--- a/arch/arm64/kernel/Makefile.syscalls
+++ b/arch/arm64/kernel/Makefile.syscalls
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
 syscall_abis_32 +=
+syscall_abis_64 += renameat newstat rlimit memfd_secret
 
 syscalltbl = arch/arm64/tools/syscall_%.tbl
diff --git a/arch/arm64/kernel/sys.c b/arch/arm64/kernel/sys.c
index d5ffaaab31a7..f08408b6e826 100644
--- a/arch/arm64/kernel/sys.c
+++ b/arch/arm64/kernel/sys.c
@@ -48,14 +48,16 @@ asmlinkage long __arm64_sys_ni_syscall(const struct pt_regs *__unused)
  */
 #define __arm64_sys_personality		__arm64_sys_arm64_personality
 
+#define __SYSCALL_WITH_COMPAT(nr, native, compat)  __SYSCALL(nr, native)
+
 #undef __SYSCALL
 #define __SYSCALL(nr, sym)	asmlinkage long __arm64_##sym(const struct pt_regs *);
-#include <asm/unistd.h>
+#include <asm/syscall_table_64.h>
 
 #undef __SYSCALL
 #define __SYSCALL(nr, sym)	[nr] = __arm64_##sym,
 
 const syscall_fn_t sys_call_table[__NR_syscalls] = {
 	[0 ... __NR_syscalls - 1] = __arm64_sys_ni_syscall,
-#include <asm/unistd.h>
+#include <asm/syscall_table_64.h>
 };
diff --git a/arch/arm64/tools/Makefile b/arch/arm64/tools/Makefile
index fa2251d9762d..c2b34e761006 100644
--- a/arch/arm64/tools/Makefile
+++ b/arch/arm64/tools/Makefile
@@ -3,12 +3,16 @@
 gen := arch/$(ARCH)/include/generated
 kapi := $(gen)/asm
 
-kapi-hdrs-y := $(kapi)/cpucap-defs.h $(kapi)/sysreg-defs.h
+kapisyshdr-y := cpucap-defs.h sysreg-defs.h
+
+kapi-hdrs-y := $(addprefix $(kapi)/, $(kapisyshdr-y))
 
 targets += $(addprefix ../../../, $(kapi-hdrs-y))
 
 PHONY += kapi
 
+all: $(syscall64) kapi
+
 kapi:   $(kapi-hdrs-y)
 
 quiet_cmd_gen_cpucaps = GEN     $@
diff --git a/arch/arm64/tools/syscall_64.tbl b/arch/arm64/tools/syscall_64.tbl
new file mode 120000
index 000000000000..63135cf34b65
--- /dev/null
+++ b/arch/arm64/tools/syscall_64.tbl
@@ -0,0 +1 @@
+../../../scripts/syscall.tbl
\ No newline at end of file
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
