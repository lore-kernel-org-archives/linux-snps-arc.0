Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E12C3271E
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jul 2024 14:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9PxtIJEFFPg76wDn7nljEJI4cL6k79fwnVhuz4w8DLc=; b=cVHkpDSpo1TnFg
	uJVo9cZFQVTF8jGussjUose0UL9EEKg12CWH7qbNkzap5qqLqYEwdEUDNJQYjD3xNgr996JP3lmXV
	7bwVeKBomaHarAXlWXYqz4KFpN3Di2QCNsok1eiUjd7Eil4+RxrBULppIh1CTzX5I1NnlkhrvuN/q
	7aUKZxajGfKKtNQjFoCa+xTlddcBas63+3g+wdsQ1LwDVnNEVQPPK3l9vAh5mwRD2f3/L2/VS8KZg
	aOFwdKL5WQ5Ur4+eQ+KctVKoHvnXUS5DNeF/QvR6X4B9G5MgKMer+o5q4KtEfWsn13FrCr5FbTmPn
	TQJBcNmhYzbZSxUaHwvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNcG-0000000DVzb-1bQr;
	Thu, 04 Jul 2024 14:39:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNaf-0000000DUpR-2pkG;
	Thu, 04 Jul 2024 14:37:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 28A0C627A9;
	Thu,  4 Jul 2024 14:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9DEFC4AF13;
	Thu,  4 Jul 2024 14:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720103860;
	bh=SGxdMT+s6TdyFUJTUykvjKQsqRmp3AbcEBt+9JQTwHs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S1htzPLcjs7pU16Tmrqttia/HNLUDban3aE6r5b02ODibeyQMutURMDJItDEDIVhf
	 AI6n7Kh7lHx2hFh6wAavVYu447eqoscgcQJ76Z6IsmPRzxb8rRyYY7thZGrnJIozAJ
	 X7ozCtr3cbAZKq262p8lYtXTuZ29fMxAjOgLS9ydB6ZxZix/ZGVaUYWcaimYJhJ0TV
	 3/RpNKQNl+g3L/RcWXW/rVfEZDB2IA+5qhwRX2I4802GfFz6GopJBOsiQXZyY4brNC
	 5VzgU4QgLA/eJjtaHKF7ODNFrkh+RSMFlFo0E5dGHyAFpbN2Lz5vabrUMcsYlrcvTv
	 RKaMOdejnyfEg==
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
Subject: [PATCH 08/17] arc: convert to generic syscall table
Date: Thu,  4 Jul 2024 16:36:02 +0200
Message-Id: <20240704143611.2979589-9-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704143611.2979589-1-arnd@kernel.org>
References: <20240704143611.2979589-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_073741_841334_0257365E 
X-CRM114-Status: GOOD (  19.64  )
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

arc has a couple of architecture specific system calls, which I add to the
generic table. This for some reason includes the deprecated sys_sysfs()
syscall that was presumably added by accident.

The time32, renameat, stat64 and rlimit entries in the syscall_abis_32
entry are for system calls that were part of the generic ABI when arch/arc
got added but are no longer enabled by default for new architectures.

Both the user visible side of asm/unistd.h and the internal syscall
table in the kernel should have the same effective contents after this.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arc/include/asm/Kbuild        |  2 ++
 arch/arc/include/asm/unistd.h      | 14 ++++++++++
 arch/arc/include/uapi/asm/Kbuild   |  2 ++
 arch/arc/include/uapi/asm/unistd.h | 43 +-----------------------------
 arch/arc/kernel/Makefile.syscalls  |  3 +++
 arch/arc/kernel/sys.c              |  5 ++--
 scripts/syscall.tbl                |  5 ++++
 7 files changed, 30 insertions(+), 44 deletions(-)
 create mode 100644 arch/arc/include/asm/unistd.h
 create mode 100644 arch/arc/kernel/Makefile.syscalls

diff --git a/arch/arc/include/asm/Kbuild b/arch/arc/include/asm/Kbuild
index 3c1afa524b9c..49285a3ce239 100644
--- a/arch/arc/include/asm/Kbuild
+++ b/arch/arc/include/asm/Kbuild
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
+syscall-y += syscall_table_32.h
+
 generic-y += extable.h
 generic-y += kvm_para.h
 generic-y += mcs_spinlock.h
diff --git a/arch/arc/include/asm/unistd.h b/arch/arc/include/asm/unistd.h
new file mode 100644
index 000000000000..211c230d88d6
--- /dev/null
+++ b/arch/arc/include/asm/unistd.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _ASM_ARC_UNISTD_H
+#define _ASM_ARC_UNISTD_H
+
+#include <uapi/asm/unistd.h>
+
+#define __ARCH_WANT_STAT64
+#define __ARCH_WANT_SYS_CLONE
+#define __ARCH_WANT_SYS_VFORK
+#define __ARCH_WANT_SYS_FORK
+
+#define NR_syscalls __NR_syscalls
+
+#endif
diff --git a/arch/arc/include/uapi/asm/Kbuild b/arch/arc/include/uapi/asm/Kbuild
index e78470141932..2501e82a1a0a 100644
--- a/arch/arc/include/uapi/asm/Kbuild
+++ b/arch/arc/include/uapi/asm/Kbuild
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
+syscall-y += unistd_32.h
+
 generic-y += ucontext.h
diff --git a/arch/arc/include/uapi/asm/unistd.h b/arch/arc/include/uapi/asm/unistd.h
index 5eafa1115162..cb2905c7c5da 100644
--- a/arch/arc/include/uapi/asm/unistd.h
+++ b/arch/arc/include/uapi/asm/unistd.h
@@ -7,45 +7,4 @@
  * published by the Free Software Foundation.
  */
 
-/******** no-legacy-syscalls-ABI *******/
-
-/*
- * Non-typical guard macro to enable inclusion twice in ARCH sys.c
- * That is how the Generic syscall wrapper generator works
- */
-#if !defined(_UAPI_ASM_ARC_UNISTD_H) || defined(__SYSCALL)
-#define _UAPI_ASM_ARC_UNISTD_H
-
-#define __ARCH_WANT_RENAMEAT
-#define __ARCH_WANT_STAT64
-#define __ARCH_WANT_SET_GET_RLIMIT
-#define __ARCH_WANT_SYS_EXECVE
-#define __ARCH_WANT_SYS_CLONE
-#define __ARCH_WANT_SYS_VFORK
-#define __ARCH_WANT_SYS_FORK
-#define __ARCH_WANT_TIME32_SYSCALLS
-
-#define sys_mmap2 sys_mmap_pgoff
-
-#include <asm-generic/unistd.h>
-
-#define NR_syscalls	__NR_syscalls
-
-/* Generic syscall (fs/filesystems.c - lost in asm-generic/unistd.h */
-#define __NR_sysfs		(__NR_arch_specific_syscall + 3)
-
-/* ARC specific syscall */
-#define __NR_cacheflush		(__NR_arch_specific_syscall + 0)
-#define __NR_arc_settls		(__NR_arch_specific_syscall + 1)
-#define __NR_arc_gettls		(__NR_arch_specific_syscall + 2)
-#define __NR_arc_usr_cmpxchg	(__NR_arch_specific_syscall + 4)
-
-__SYSCALL(__NR_cacheflush, sys_cacheflush)
-__SYSCALL(__NR_arc_settls, sys_arc_settls)
-__SYSCALL(__NR_arc_gettls, sys_arc_gettls)
-__SYSCALL(__NR_arc_usr_cmpxchg, sys_arc_usr_cmpxchg)
-__SYSCALL(__NR_sysfs, sys_sysfs)
-
-#undef __SYSCALL
-
-#endif
+#include <asm/unistd_32.h>
diff --git a/arch/arc/kernel/Makefile.syscalls b/arch/arc/kernel/Makefile.syscalls
new file mode 100644
index 000000000000..391d30ab7a83
--- /dev/null
+++ b/arch/arc/kernel/Makefile.syscalls
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_32 += arc time32 renameat stat64 rlimit
diff --git a/arch/arc/kernel/sys.c b/arch/arc/kernel/sys.c
index 1069446bdc58..36a2a95c083b 100644
--- a/arch/arc/kernel/sys.c
+++ b/arch/arc/kernel/sys.c
@@ -8,11 +8,12 @@
 
 #define sys_clone	sys_clone_wrapper
 #define sys_clone3	sys_clone3_wrapper
+#define sys_mmap2	sys_mmap_pgoff
 
-#undef __SYSCALL
 #define __SYSCALL(nr, call) [nr] = (call),
+#define __SYSCALL_WITH_COMPAT(nr, native, compat)  __SYSCALL(nr, native)
 
 void *sys_call_table[NR_syscalls] = {
 	[0 ... NR_syscalls-1] = sys_ni_syscall,
-#include <asm/unistd.h>
+#include <asm/syscall_table_32.h>
 };
diff --git a/scripts/syscall.tbl b/scripts/syscall.tbl
index 7871bbfa9b58..13f4c79ba5c2 100644
--- a/scripts/syscall.tbl
+++ b/scripts/syscall.tbl
@@ -288,6 +288,11 @@
 243	time32	recvmmsg			sys_recvmmsg_time32		compat_sys_recvmmsg_time32
 243	64	recvmmsg			sys_recvmmsg
 # Architectures may provide up to 16 syscalls of their own between 244 and 259
+244	arc	cacheflush			sys_cacheflush
+245	arc	arc_settls			sys_arc_settls
+246	arc	arc_gettls			sys_arc_gettls
+247	arc	sysfs				sys_sysfs
+248	arc	arc_usr_cmpxchg			sys_arc_usr_cmpxchg
 260	time32	wait4				sys_wait4			compat_sys_wait4
 260	64	wait4				sys_wait4
 261	common	prlimit64			sys_prlimit64
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
