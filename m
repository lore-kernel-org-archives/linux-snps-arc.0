Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210C7C3271E
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jul 2024 14:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i2/LclFWDhkC0MrlXzAP0QpEYqBkCp1zPkOombeVfFY=; b=iD+Wu6wM55C27z
	jVMaJxqtHTkflp3ACAu0o/KiU8dByJ0wDGQcj+5zNkkkZbKK1ZWX1aCtWZAqwWwehUjWQ/E6Z26LW
	q4mKpn3fUnifi57s11CBK4fTGkEFsSlpmaePgVDo2Hvx2kdN3E8AIOrO2dIto9gAGQfjDO5HSNYKR
	ibApyy4Xc82sQS51SRgqCKYJVoTvk/r+wudggxOSQI/dwcJv1h0ze58qtiP1YPF5K/YHnEKth8NC3
	U+bMHYzLmoraogzE4JhqqYfHH3TvnwL9gt1+X+rnRqsmeP73LtaBMq27gDObyvfbQOxErYmv0z9jC
	yP2J0Hwk+PAYr56yPYsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNcz-0000000DWTY-2Qq8;
	Thu, 04 Jul 2024 14:40:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPNb2-0000000DV6v-2BZe;
	Thu, 04 Jul 2024 14:38:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D9F5C627B6;
	Thu,  4 Jul 2024 14:38:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8157CC4AF0B;
	Thu,  4 Jul 2024 14:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720103883;
	bh=qMy/ikxpHS3hjhTlTaba5eVga/lQ/MRQyAUcrByidBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YfktrOqHQKOoLgbuL1wu59/ZRO17ByQ3slKns4BMf97AF811z6gAmANnhO2R4IBDR
	 CHfjyDWO7wduo7no+fonxCRFOl143NLma4TRWxLcbdL8TgM3ybDqXkdosGWrtxIBHY
	 1ofM8jd6CTEy3eZXRxbpTdWXxyHgzmBIoySeEfrxcd56OSBCEWd7sCyd6J7t1pOKf6
	 YxxQs0TTdRwdo4hjNBrrP0u1+DYs/fHrAWtYEGglM4R+6lS3Jp/qflLPPshD/NcaHf
	 /GherjlZ+FlkR5M0CKlMWtNUzGciTRwiIwvoUrw0AS4Zem4bPPTAqyl0Tzwj3NTs0z
	 Eo4tt06vJ0lmg==
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
Subject: [PATCH 11/17] arm64: rework compat syscall macros
Date: Thu,  4 Jul 2024 16:36:05 +0200
Message-Id: <20240704143611.2979589-12-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240704143611.2979589-1-arnd@kernel.org>
References: <20240704143611.2979589-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_073804_852707_E9652EAE 
X-CRM114-Status: GOOD (  13.39  )
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

The generated asm/unistd_compat_32.h header file now contains
macros that can be used directly in the vdso and the signal
trampolines, so remove the duplicate definitions.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/include/asm/seccomp.h               | 10 +++++-----
 arch/arm64/include/asm/unistd.h                | 15 ---------------
 .../include/asm/vdso/compat_gettimeofday.h     | 12 ++++++------
 arch/arm64/kernel/signal32.c                   |  2 +-
 arch/arm64/kernel/sigreturn32.S                | 18 +++++++++---------
 5 files changed, 21 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/include/asm/seccomp.h b/arch/arm64/include/asm/seccomp.h
index c83ca2c8b936..b83975555314 100644
--- a/arch/arm64/include/asm/seccomp.h
+++ b/arch/arm64/include/asm/seccomp.h
@@ -8,13 +8,13 @@
 #ifndef _ASM_SECCOMP_H
 #define _ASM_SECCOMP_H
 
-#include <asm/unistd.h>
+#include <asm/unistd_compat_32.h>
 
 #ifdef CONFIG_COMPAT
-#define __NR_seccomp_read_32		__NR_compat_read
-#define __NR_seccomp_write_32		__NR_compat_write
-#define __NR_seccomp_exit_32		__NR_compat_exit
-#define __NR_seccomp_sigreturn_32	__NR_compat_rt_sigreturn
+#define __NR_seccomp_read_32		__NR_compat32_read
+#define __NR_seccomp_write_32		__NR_compat32_write
+#define __NR_seccomp_exit_32		__NR_compat32_exit
+#define __NR_seccomp_sigreturn_32	__NR_compat32_rt_sigreturn
 #endif /* CONFIG_COMPAT */
 
 #include <asm-generic/seccomp.h>
diff --git a/arch/arm64/include/asm/unistd.h b/arch/arm64/include/asm/unistd.h
index fdd16052f9bc..80618c9bbcd8 100644
--- a/arch/arm64/include/asm/unistd.h
+++ b/arch/arm64/include/asm/unistd.h
@@ -16,21 +16,6 @@
 #define __ARCH_WANT_SYS_FORK
 #define __ARCH_WANT_SYS_VFORK
 
-/*
- * Compat syscall numbers used by the AArch64 kernel.
- */
-#define __NR_compat_restart_syscall	0
-#define __NR_compat_exit		1
-#define __NR_compat_read		3
-#define __NR_compat_write		4
-#define __NR_compat_gettimeofday	78
-#define __NR_compat_sigreturn		119
-#define __NR_compat_rt_sigreturn	173
-#define __NR_compat_clock_gettime	263
-#define __NR_compat_clock_getres	264
-#define __NR_compat_clock_gettime64	403
-#define __NR_compat_clock_getres_time64	406
-
 /*
  * The following SVCs are ARM private.
  */
diff --git a/arch/arm64/include/asm/vdso/compat_gettimeofday.h b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
index ecb6fd4c3c64..778c1202bbbf 100644
--- a/arch/arm64/include/asm/vdso/compat_gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
@@ -8,7 +8,7 @@
 #ifndef __ASSEMBLY__
 
 #include <asm/barrier.h>
-#include <asm/unistd.h>
+#include <asm/unistd_compat_32.h>
 #include <asm/errno.h>
 
 #include <asm/vdso/compat_barrier.h>
@@ -24,7 +24,7 @@ int gettimeofday_fallback(struct __kernel_old_timeval *_tv,
 	register struct timezone *tz asm("r1") = _tz;
 	register struct __kernel_old_timeval *tv asm("r0") = _tv;
 	register long ret asm ("r0");
-	register long nr asm("r7") = __NR_compat_gettimeofday;
+	register long nr asm("r7") = __NR_compat32_gettimeofday;
 
 	asm volatile(
 	"	swi #0\n"
@@ -41,7 +41,7 @@ long clock_gettime_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
 	register struct __kernel_timespec *ts asm("r1") = _ts;
 	register clockid_t clkid asm("r0") = _clkid;
 	register long ret asm ("r0");
-	register long nr asm("r7") = __NR_compat_clock_gettime64;
+	register long nr asm("r7") = __NR_compat32_clock_gettime64;
 
 	asm volatile(
 	"	swi #0\n"
@@ -58,7 +58,7 @@ long clock_gettime32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
 	register struct old_timespec32 *ts asm("r1") = _ts;
 	register clockid_t clkid asm("r0") = _clkid;
 	register long ret asm ("r0");
-	register long nr asm("r7") = __NR_compat_clock_gettime;
+	register long nr asm("r7") = __NR_compat32_clock_gettime;
 
 	asm volatile(
 	"	swi #0\n"
@@ -75,7 +75,7 @@ int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
 	register struct __kernel_timespec *ts asm("r1") = _ts;
 	register clockid_t clkid asm("r0") = _clkid;
 	register long ret asm ("r0");
-	register long nr asm("r7") = __NR_compat_clock_getres_time64;
+	register long nr asm("r7") = __NR_compat32_clock_getres_time64;
 
 	asm volatile(
 	"       swi #0\n"
@@ -92,7 +92,7 @@ int clock_getres32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
 	register struct old_timespec32 *ts asm("r1") = _ts;
 	register clockid_t clkid asm("r0") = _clkid;
 	register long ret asm ("r0");
-	register long nr asm("r7") = __NR_compat_clock_getres;
+	register long nr asm("r7") = __NR_compat32_clock_getres;
 
 	asm volatile(
 	"       swi #0\n"
diff --git a/arch/arm64/kernel/signal32.c b/arch/arm64/kernel/signal32.c
index bbd542704730..50b74cc5c64d 100644
--- a/arch/arm64/kernel/signal32.c
+++ b/arch/arm64/kernel/signal32.c
@@ -451,7 +451,7 @@ int compat_setup_frame(int usig, struct ksignal *ksig, sigset_t *set,
 
 void compat_setup_restart_syscall(struct pt_regs *regs)
 {
-       regs->regs[7] = __NR_compat_restart_syscall;
+       regs->regs[7] = __NR_compat32_restart_syscall;
 }
 
 /*
diff --git a/arch/arm64/kernel/sigreturn32.S b/arch/arm64/kernel/sigreturn32.S
index ccbd4aab4ba4..6f486b95b413 100644
--- a/arch/arm64/kernel/sigreturn32.S
+++ b/arch/arm64/kernel/sigreturn32.S
@@ -13,7 +13,7 @@
  * need two 16-bit instructions.
  */
 
-#include <asm/unistd.h>
+#include <asm/unistd_compat_32.h>
 
 	.section .rodata
 	.globl __aarch32_sigret_code_start
@@ -22,26 +22,26 @@ __aarch32_sigret_code_start:
 	/*
 	 * ARM Code
 	 */
-	.byte	__NR_compat_sigreturn, 0x70, 0xa0, 0xe3		// mov	r7, #__NR_compat_sigreturn
-	.byte	__NR_compat_sigreturn, 0x00, 0x00, 0xef		// svc	#__NR_compat_sigreturn
+	.byte	__NR_compat32_sigreturn, 0x70, 0xa0, 0xe3	// mov	r7, #__NR_compat32_sigreturn
+	.byte	__NR_compat32_sigreturn, 0x00, 0x00, 0xef	// svc	#__NR_compat32_sigreturn
 
 	/*
 	 * Thumb code
 	 */
-	.byte	__NR_compat_sigreturn, 0x27			// svc	#__NR_compat_sigreturn
-	.byte	__NR_compat_sigreturn, 0xdf			// mov	r7, #__NR_compat_sigreturn
+	.byte	__NR_compat32_sigreturn, 0x27			// svc	#__NR_compat32_sigreturn
+	.byte	__NR_compat32_sigreturn, 0xdf			// mov	r7, #__NR_compat32_sigreturn
 
 	/*
 	 * ARM code
 	 */
-	.byte	__NR_compat_rt_sigreturn, 0x70, 0xa0, 0xe3	// mov	r7, #__NR_compat_rt_sigreturn
-	.byte	__NR_compat_rt_sigreturn, 0x00, 0x00, 0xef	// svc	#__NR_compat_rt_sigreturn
+	.byte	__NR_compat32_rt_sigreturn, 0x70, 0xa0, 0xe3	// mov	r7, #__NR_compat32_rt_sigreturn
+	.byte	__NR_compat32_rt_sigreturn, 0x00, 0x00, 0xef	// svc	#__NR_compat32_rt_sigreturn
 
 	/*
 	 * Thumb code
 	 */
-	.byte	__NR_compat_rt_sigreturn, 0x27			// svc	#__NR_compat_rt_sigreturn
-	.byte	__NR_compat_rt_sigreturn, 0xdf			// mov	r7, #__NR_compat_rt_sigreturn
+	.byte	__NR_compat32_rt_sigreturn, 0x27		// svc	#__NR_compat32_rt_sigreturn
+	.byte	__NR_compat32_rt_sigreturn, 0xdf		// mov	r7, #__NR_compat32_rt_sigreturn
 
         .globl __aarch32_sigret_code_end
 __aarch32_sigret_code_end:
-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
