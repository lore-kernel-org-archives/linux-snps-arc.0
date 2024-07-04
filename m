Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B020C3271E
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jul 2024 14:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PvF7AVy4gBGHShp1u5W+Y4GuluRMVMI1xoPUdu3bawc=; b=BTGCmCsByRrL9K
	R/Pgsu5vEyr5p9byJbKIuEVVnljxyRSsVYYjNen084BpeCCRwH2RCeNIKEGQByzghjlcTsBR6Hmdl
	kDl2Cizk5KD8ca7+p0aGIUOXq/cxzzQSjhhMPDft8pWo4OTvj40JATUnPnwoyJWLOFfTloKiafkcZ
	qPxNt4un2D9Xd6xIfW35EQunCF+B2y3X54SIVyMi1Gy8kzkIklcC3gNRoJui1rtFEeozlrCEARgL+
	KhHOYiZtSCwi8ecXlrncZquBo8wTdIwfbIXA+e0X2bb5xk9ICAFVtrZbKvRH6rtsiv/5C6vM2CT9M
	+Xx3S7fvxPlJxHKsRc9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNeJ-0000000DXRN-46B8;
	Thu, 04 Jul 2024 14:41:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNbf-0000000DVah-3Hc6;
	Thu, 04 Jul 2024 14:38:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F33F6CE37C4;
	Thu,  4 Jul 2024 14:38:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3838CC3277B;
	Thu,  4 Jul 2024 14:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720103921;
	bh=81xZqAqMMJsoQ/qsHSh8rpdAlokl3hrFn6SptOvlN7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mczAQ3ChPjLIGeQmpSKKAez1foAozzDTANOt++XJFPJAYjsYAsA/z3Gq02ak2VRdo
	 EFX23WnntApIHipQwC0ma8a8iZ3PRBT5PdiC2Qcfrd1/QjfdP2WOGIzhk6tvZIITMn
	 M3FjIOnBFnCwLyGFs5iHEODlby9mK9Wf8KbBpYDjhPrqBKcHTshw4ffUxT6TRr4B9e
	 L0Vcg79Bh/FD1PH3MxRcw7hYeZEh3uC6UHlcIhVvcPMGh+4CVNhM6i3ORZvmQeQ6WH
	 mtKEJJC7q/+6/QB3EG3AZGeoh1y8TRjKLBuBpdepwwl4kVCnj1ZY0CkakHRXTo+xvd
	 8nJ+tnBLED1cQ==
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
Subject: [PATCH 16/17] openrisc: convert to generic syscall table
Date: Thu,  4 Jul 2024 16:36:10 +0200
Message-Id: <20240704143611.2979589-17-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704143611.2979589-1-arnd@kernel.org>
References: <20240704143611.2979589-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_073844_235819_3D34C5B5 
X-CRM114-Status: GOOD (  18.89  )
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

The uapi/asm/unistd_32.h and asm/syscall_table_32.h headers can now be
generated from scripts/syscall.tbl, which makes this consistent with
the other architectures that have their own syscall.tbl.

openrisc has one extra system call that gets added to scripts/syscall.tbl.

The time32, stat64, rlimit and renameat entries in the syscall_abis_32
line are for system calls that were part of the generic ABI when
arch/nios2 got added but are no longer enabled by default for new
architectures.

Both the user visible side of asm/unistd.h and the internal syscall
table in the kernel should have the same effective contents after this.

When asm/syscalls.h is included in kernel/fork.c for the purpose of
type checking, the redirection macros cause problems.  Move these so
only the references get redirected.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/openrisc/include/asm/Kbuild        |  2 ++
 arch/openrisc/include/asm/syscalls.h    |  4 ----
 arch/openrisc/include/asm/unistd.h      |  8 ++++++++
 arch/openrisc/include/uapi/asm/Kbuild   |  2 ++
 arch/openrisc/include/uapi/asm/unistd.h | 14 +-------------
 arch/openrisc/kernel/Makefile.syscalls  |  3 +++
 arch/openrisc/kernel/sys_call_table.c   |  9 +++++++--
 scripts/syscall.tbl                     |  2 ++
 8 files changed, 25 insertions(+), 19 deletions(-)
 create mode 100644 arch/openrisc/include/asm/unistd.h
 create mode 100644 arch/openrisc/kernel/Makefile.syscalls

diff --git a/arch/openrisc/include/asm/Kbuild b/arch/openrisc/include/asm/Kbuild
index c8c99b554ca4..cef49d60d74c 100644
--- a/arch/openrisc/include/asm/Kbuild
+++ b/arch/openrisc/include/asm/Kbuild
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
+syscall-y += syscall_table_32.h
+
 generic-y += extable.h
 generic-y += kvm_para.h
 generic-y += parport.h
diff --git a/arch/openrisc/include/asm/syscalls.h b/arch/openrisc/include/asm/syscalls.h
index aa1c7e98722e..9f4c47961bea 100644
--- a/arch/openrisc/include/asm/syscalls.h
+++ b/arch/openrisc/include/asm/syscalls.h
@@ -25,8 +25,4 @@ asmlinkage long __sys_clone(unsigned long clone_flags, unsigned long newsp,
 asmlinkage long __sys_clone3(struct clone_args __user *uargs, size_t size);
 asmlinkage long __sys_fork(void);
 
-#define sys_clone __sys_clone
-#define sys_clone3 __sys_clone3
-#define sys_fork __sys_fork
-
 #endif /* __ASM_OPENRISC_SYSCALLS_H */
diff --git a/arch/openrisc/include/asm/unistd.h b/arch/openrisc/include/asm/unistd.h
new file mode 100644
index 000000000000..c73f65e18d3b
--- /dev/null
+++ b/arch/openrisc/include/asm/unistd.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+
+#define __ARCH_WANT_STAT64
+#define __ARCH_WANT_SYS_FORK
+#define __ARCH_WANT_SYS_CLONE
+#define __ARCH_WANT_TIME32_SYSCALLS
+
+#include <uapi/asm/unistd.h>
diff --git a/arch/openrisc/include/uapi/asm/Kbuild b/arch/openrisc/include/uapi/asm/Kbuild
index e78470141932..2501e82a1a0a 100644
--- a/arch/openrisc/include/uapi/asm/Kbuild
+++ b/arch/openrisc/include/uapi/asm/Kbuild
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
+syscall-y += unistd_32.h
+
 generic-y += ucontext.h
diff --git a/arch/openrisc/include/uapi/asm/unistd.h b/arch/openrisc/include/uapi/asm/unistd.h
index 566f8c4f8047..46b94d454efd 100644
--- a/arch/openrisc/include/uapi/asm/unistd.h
+++ b/arch/openrisc/include/uapi/asm/unistd.h
@@ -17,16 +17,4 @@
  * (at your option) any later version.
  */
 
-#define sys_mmap2 sys_mmap_pgoff
-
-#define __ARCH_WANT_RENAMEAT
-#define __ARCH_WANT_STAT64
-#define __ARCH_WANT_SET_GET_RLIMIT
-#define __ARCH_WANT_SYS_FORK
-#define __ARCH_WANT_SYS_CLONE
-#define __ARCH_WANT_TIME32_SYSCALLS
-
-#include <asm-generic/unistd.h>
-
-#define __NR_or1k_atomic __NR_arch_specific_syscall
-__SYSCALL(__NR_or1k_atomic, sys_or1k_atomic)
+#include <asm/unistd_32.h>
diff --git a/arch/openrisc/kernel/Makefile.syscalls b/arch/openrisc/kernel/Makefile.syscalls
new file mode 100644
index 000000000000..525a1e7e7fc9
--- /dev/null
+++ b/arch/openrisc/kernel/Makefile.syscalls
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_32 += or1k time32 stat64 rlimit renameat
diff --git a/arch/openrisc/kernel/sys_call_table.c b/arch/openrisc/kernel/sys_call_table.c
index 3d18008310e4..b2f57e2538f7 100644
--- a/arch/openrisc/kernel/sys_call_table.c
+++ b/arch/openrisc/kernel/sys_call_table.c
@@ -16,9 +16,14 @@
 
 #include <asm/syscalls.h>
 
-#undef __SYSCALL
 #define __SYSCALL(nr, call) [nr] = (call),
+#define __SYSCALL_WITH_COMPAT(nr, native, compat) __SYSCALL(nr, native)
+
+#define sys_mmap2 sys_mmap_pgoff
+#define sys_clone __sys_clone
+#define sys_clone3 __sys_clone3
+#define sys_fork __sys_fork
 
 void *sys_call_table[__NR_syscalls] = {
-#include <asm/unistd.h>
+#include <asm/syscall_table_32.h>
 };
diff --git a/scripts/syscall.tbl b/scripts/syscall.tbl
index 40307011abdb..28329c00bf68 100644
--- a/scripts/syscall.tbl
+++ b/scripts/syscall.tbl
@@ -299,6 +299,8 @@
 
 244	nios2	cacheflush			sys_cacheflush
 
+244	or1k	or1k_atomic			sys_or1k_atomic
+
 260	time32	wait4				sys_wait4			compat_sys_wait4
 260	64	wait4				sys_wait4
 261	common	prlimit64			sys_prlimit64
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
