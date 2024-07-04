Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAD6C3271E
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jul 2024 14:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=baL5mAVBNqE3HIZFpGKlzhWtvl4JwMIdz5gCqQ7Gg1s=; b=MRPr/+D34C1Bty
	/t0JG71bOm0SU6ZS6TKhE52x4DP0xQYL5SU0PVGadE8r6BbR75bd/E+1H3UUFnzhx/GPobaL4z/lw
	akGwGSZqrtPk6/MoH/drCXzgV7V+z1HuM7ye1GHtdBCMMSMI81TAKu+ybd0CfRyKW02ZhSoLorYHD
	eS1Fwz1cIBnZP6TIJU8DppFVvTh8qJqneKYCv0IMq8BOf80gv/TvHPm8iGHuSiBw7RG7uUPzbK6Aj
	EmJKsUkh9KOOCitNwsYzzhrEsRkA8TKb+VYygHgkhIysB+E+vIo30nvKk+nzc/k98XPX4XUey+WI2
	2swzZyGJem52L4T2WcpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNdn-0000000DX48-3CX5;
	Thu, 04 Jul 2024 14:40:55 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNbQ-0000000DVOl-1mQo;
	Thu, 04 Jul 2024 14:38:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D2F51CE37C8;
	Thu,  4 Jul 2024 14:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130D2C32781;
	Thu,  4 Jul 2024 14:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720103906;
	bh=RlwUoPa6usH7GUZMKOc08+J1UN1kqcfKaKnNDtJsta0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cApuf/CheQFpFENORhWm//pVQ8ai15IgR4LmKNMzOuR16rr2RdCAaLpfrLZuyt6zz
	 zhrlgVC11NJvEly/GNXXXyhizXOEKheltXb35IvFY5YSyAOhpfwJj7qp3dNZYnYboe
	 KUE62IOzp2IjOe1XOd33qxxM5loN1/7ZgycI0Dq3LB1orXI7cs4mbwZiUsw+a+rRyv
	 MW9KSZhWOcx8SxaP+CC8PSQRrubMf8UACbdAeMh6w2NbuEk2ghlGqJmmfohmCI0yXb
	 xk1kxeIRQchSDylYC+6WDONdvFncErEs8PXpv9IUV8fQqwcns4tXjKoBVfmLTm69rT
	 1DfhcTD8tWmGg==
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
Subject: [PATCH 14/17] loongarch: convert to generic syscall table
Date: Thu,  4 Jul 2024 16:36:08 +0200
Message-Id: <20240704143611.2979589-15-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704143611.2979589-1-arnd@kernel.org>
References: <20240704143611.2979589-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_073828_972104_6C1A16C0 
X-CRM114-Status: GOOD (  17.72  )
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

The uapi/asm/unistd_64.h and asm/syscall_table_64.h headers can now be
generated from scripts/syscall.tbl, which makes this consistent with
the other architectures that have their own syscall.tbl.

Unlike the other architectures using the asm-generic header, loongarch
uses none of the deprecated system calls at the moment.

Both the user visible side of asm/unistd.h and the internal syscall
table in the kernel should have the same effective contents after this.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/loongarch/include/asm/Kbuild        | 1 +
 arch/loongarch/include/asm/unistd.h      | 2 ++
 arch/loongarch/include/uapi/asm/Kbuild   | 2 ++
 arch/loongarch/include/uapi/asm/unistd.h | 3 +--
 arch/loongarch/kernel/Makefile.syscalls  | 4 ++++
 arch/loongarch/kernel/syscall.c          | 3 ++-
 6 files changed, 12 insertions(+), 3 deletions(-)
 create mode 100644 arch/loongarch/kernel/Makefile.syscalls

diff --git a/arch/loongarch/include/asm/Kbuild b/arch/loongarch/include/asm/Kbuild
index 0db5ad14f014..2bb3676429c0 100644
--- a/arch/loongarch/include/asm/Kbuild
+++ b/arch/loongarch/include/asm/Kbuild
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+syscall-y += syscall_table_64.h
 generated-y += orc_hash.h
 
 generic-y += mcs_spinlock.h
diff --git a/arch/loongarch/include/asm/unistd.h b/arch/loongarch/include/asm/unistd.h
index cfddb0116a8c..fc0a481a7416 100644
--- a/arch/loongarch/include/asm/unistd.h
+++ b/arch/loongarch/include/asm/unistd.h
@@ -8,4 +8,6 @@
 
 #include <uapi/asm/unistd.h>
 
+#define __ARCH_WANT_SYS_CLONE
+
 #define NR_syscalls (__NR_syscalls)
diff --git a/arch/loongarch/include/uapi/asm/Kbuild b/arch/loongarch/include/uapi/asm/Kbuild
index 4aa680ca2e5f..c6d141d7b7d7 100644
--- a/arch/loongarch/include/uapi/asm/Kbuild
+++ b/arch/loongarch/include/uapi/asm/Kbuild
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
+syscall-y += unistd_64.h
+
 generic-y += kvm_para.h
diff --git a/arch/loongarch/include/uapi/asm/unistd.h b/arch/loongarch/include/uapi/asm/unistd.h
index 191614b9b207..1f01980f9c94 100644
--- a/arch/loongarch/include/uapi/asm/unistd.h
+++ b/arch/loongarch/include/uapi/asm/unistd.h
@@ -1,4 +1,3 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#define __ARCH_WANT_SYS_CLONE
 
-#include <asm-generic/unistd.h>
+#include <asm/unistd_64.h>
diff --git a/arch/loongarch/kernel/Makefile.syscalls b/arch/loongarch/kernel/Makefile.syscalls
new file mode 100644
index 000000000000..ab7d9baa2915
--- /dev/null
+++ b/arch/loongarch/kernel/Makefile.syscalls
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# No special ABIs on loongarch so far
+syscall_abis_64 +=
diff --git a/arch/loongarch/kernel/syscall.c b/arch/loongarch/kernel/syscall.c
index 8801611143ab..ec17cd5163b7 100644
--- a/arch/loongarch/kernel/syscall.c
+++ b/arch/loongarch/kernel/syscall.c
@@ -20,6 +20,7 @@
 
 #undef __SYSCALL
 #define __SYSCALL(nr, call)	[nr] = (call),
+#define __SYSCALL_WITH_COMPAT(nr, native, compat) __SYSCALL(nr, native)
 
 SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned long, len, unsigned long,
 		prot, unsigned long, flags, unsigned long, fd, unsigned long, offset)
@@ -32,7 +33,7 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned long, len, unsigned long,
 
 void *sys_call_table[__NR_syscalls] = {
 	[0 ... __NR_syscalls - 1] = sys_ni_syscall,
-#include <asm/unistd.h>
+#include <asm/syscall_table_64.h>
 };
 
 typedef long (*sys_call_fn)(unsigned long, unsigned long,
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
