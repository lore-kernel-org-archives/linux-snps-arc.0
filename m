Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B74C30653
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jul 2024 14:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JIQEL8aX8/mVo3MkV3lDF76njIHPKZ7ZsSBuGV+85WE=; b=Vg9X91oNWXeZQ+
	lxHNypPu+DkSPEIu+Koduhw1fZwNweZKbXSKfoRanzz/9t4DBHRD/nb9OXSyJnGjO0YLQUtFqo9ww
	ikPY2q7IuEzXZpBwFfTbg238gi5oOEH7Xng1LzXAVV2oSexqhK1rLITimhqWSZ/2aTbSVWczOE8FM
	YqLuIRoVxmy1bt7AaUGHWyfmKWvMZEtidZBE1YqMUTJWtOn+kpm74UPj2wspH4ZzTrNi0vfjsx3/H
	e+/uZpDz0jhiryF2Tx5oG3TZLYuyjxCdAn5S2YzIzt1MaXsD0tw9QjMNG0gwG3OJRlj8z9DrX91c3
	Jndve9jcwePQ1Dvfiwzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNdY-0000000DWt2-0C8D;
	Thu, 04 Jul 2024 14:40:40 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNbJ-0000000DVIo-0XfG;
	Thu, 04 Jul 2024 14:38:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4ED92CE37C2;
	Thu,  4 Jul 2024 14:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF23C3277B;
	Thu,  4 Jul 2024 14:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720103898;
	bh=ODPfrstW6z55EUTJBlL5CpBuNw04MBo366IHejLQljg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ENcGfyAkVNir+N00kkmJQU041xFHzk6bryBStS3PHMWYJ3JHfVBOnCsWJFi4f90c/
	 jcIl0WCIN3kE0BArYuBLN+WZmgCD+3R73p7xAkbD5T/nNlQCjn9ra9IYSqAxWn7Grk
	 bp5jfk1kWsBi0+wt11ubVSnmUOgq8nvYN7bi1wmDndXmL0mgn5MJmTnne71Z1XyrL3
	 /gP1XGtd56H2LCrgfUNI4lshCvU9mxujWAMIoIlyanLxlTuEBPt1e/fGPi4wLoWA4M
	 0WgCCijUZXOOTzDXyGRhBaTHQmDgq7Eg8LyGc8wGXHxTfJYXnippNRxoP/dDttBWq8
	 tsoFUgKbX83mg==
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
Subject: [PATCH 13/17] hexagon: use new system call table
Date: Thu,  4 Jul 2024 16:36:07 +0200
Message-Id: <20240704143611.2979589-14-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704143611.2979589-1-arnd@kernel.org>
References: <20240704143611.2979589-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_073821_610148_225B0E1F 
X-CRM114-Status: GOOD (  16.05  )
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

The time32, stat64, rlimit and renameat entries in the syscall_abis_32
line are for system calls that were part of the generic ABI when
arch/hexagon got added but are no longer enabled by default for new
architectures.

As a side-effect, calling an unimplemented syscall now return -ENOSYS
rather than branching into a NULL pointer.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/hexagon/include/asm/Kbuild        |  2 ++
 arch/hexagon/include/asm/unistd.h      | 10 ++++++++++
 arch/hexagon/include/uapi/asm/Kbuild   |  2 ++
 arch/hexagon/include/uapi/asm/unistd.h | 15 ++-------------
 arch/hexagon/kernel/Makefile.syscalls  |  3 +++
 arch/hexagon/kernel/syscalltab.c       |  8 ++++++--
 6 files changed, 25 insertions(+), 15 deletions(-)
 create mode 100644 arch/hexagon/include/asm/unistd.h
 create mode 100644 arch/hexagon/kernel/Makefile.syscalls

diff --git a/arch/hexagon/include/asm/Kbuild b/arch/hexagon/include/asm/Kbuild
index 3ece3c93fe08..8c1a78c8f527 100644
--- a/arch/hexagon/include/asm/Kbuild
+++ b/arch/hexagon/include/asm/Kbuild
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
+syscall-y += syscall_table_32.h
+
 generic-y += extable.h
 generic-y += iomap.h
 generic-y += kvm_para.h
diff --git a/arch/hexagon/include/asm/unistd.h b/arch/hexagon/include/asm/unistd.h
new file mode 100644
index 000000000000..1f462bade75c
--- /dev/null
+++ b/arch/hexagon/include/asm/unistd.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#define __ARCH_WANT_STAT64
+#define __ARCH_WANT_SYS_CLONE
+#define __ARCH_WANT_SYS_VFORK
+#define __ARCH_WANT_SYS_FORK
+
+#define __ARCH_BROKEN_SYS_CLONE3
+
+#include <uapi/asm/unistd.h>
diff --git a/arch/hexagon/include/uapi/asm/Kbuild b/arch/hexagon/include/uapi/asm/Kbuild
index e78470141932..2501e82a1a0a 100644
--- a/arch/hexagon/include/uapi/asm/Kbuild
+++ b/arch/hexagon/include/uapi/asm/Kbuild
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
+syscall-y += unistd_32.h
+
 generic-y += ucontext.h
diff --git a/arch/hexagon/include/uapi/asm/unistd.h b/arch/hexagon/include/uapi/asm/unistd.h
index 4bea7428e747..6f670347dd61 100644
--- a/arch/hexagon/include/uapi/asm/unistd.h
+++ b/arch/hexagon/include/uapi/asm/unistd.h
@@ -27,17 +27,6 @@
  *  See also:  syscalltab.c
  */
 
-#define sys_mmap2 sys_mmap_pgoff
-#define __ARCH_WANT_RENAMEAT
-#define __ARCH_WANT_STAT64
-#define __ARCH_WANT_SET_GET_RLIMIT
-#define __ARCH_WANT_SYS_EXECVE
-#define __ARCH_WANT_SYS_CLONE
-#define __ARCH_WANT_SYS_VFORK
-#define __ARCH_WANT_SYS_FORK
-#define __ARCH_WANT_TIME32_SYSCALLS
-#define __ARCH_WANT_SYNC_FILE_RANGE2
+#include <asm/unistd_32.h>
 
-#define __ARCH_BROKEN_SYS_CLONE3
-
-#include <asm-generic/unistd.h>
+#define __NR_sync_file_range2 __NR_sync_file_range
diff --git a/arch/hexagon/kernel/Makefile.syscalls b/arch/hexagon/kernel/Makefile.syscalls
new file mode 100644
index 000000000000..d2b7c5d44d95
--- /dev/null
+++ b/arch/hexagon/kernel/Makefile.syscalls
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_32 += hexagon time32 stat64 rlimit renameat
diff --git a/arch/hexagon/kernel/syscalltab.c b/arch/hexagon/kernel/syscalltab.c
index 5d98bdc494ec..b53e2eead4ac 100644
--- a/arch/hexagon/kernel/syscalltab.c
+++ b/arch/hexagon/kernel/syscalltab.c
@@ -11,8 +11,10 @@
 
 #include <asm/syscall.h>
 
-#undef __SYSCALL
 #define __SYSCALL(nr, call) [nr] = (call),
+#define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, native)
+
+#define sys_mmap2 sys_mmap_pgoff
 
 SYSCALL_DEFINE6(hexagon_fadvise64_64, int, fd, int, advice,
 		SC_ARG64(offset), SC_ARG64(len))
@@ -21,6 +23,8 @@ SYSCALL_DEFINE6(hexagon_fadvise64_64, int, fd, int, advice,
 }
 #define sys_fadvise64_64 sys_hexagon_fadvise64_64
 
+#define sys_sync_file_range sys_sync_file_range2
+
 void *sys_call_table[__NR_syscalls] = {
-#include <asm/unistd.h>
+#include <asm/syscall_table_32.h>
 };
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
