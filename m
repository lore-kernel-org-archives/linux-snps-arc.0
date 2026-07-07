Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8435CC43458
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2026 19:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Subject:Cc:To:
	From:Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=XeLGmLr3v6ABdnCTyon3pULK/ItcWIxvDVkqPMvis+0=; b=Mj9btlqvJ0Ui+O
	RKPwGhcC12JL0daYaiCnPAUBRCTee1+f/PIY84KS/FfmDwIDYzwrAimUTqk9ANozyq9Xw3x9cSlkX
	SOlFkjdwxHzozquh+NYIeB7qRU8Xrc2OxpT6GpkA7jQ5ieZ5YqiXKAXsz4PZxekHhufEB6GSOFXft
	7jaaTj772puqSCCvmRIhkBKFpofQQX4uLewsiCQOw5SbDSTTujrsbiDeMT8q2D6qbQ+yJTZ1VgfZr
	jyCpYKiCS0oFtuN9WJIhaf8wGZLOIuXLn+JR9ySCexXbp/ejndZQOkUpC2GMLbNy3x0nmiNgb0+o9
	Tkl2kMsRnCyMdifvhbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whB82-0000000FhNQ-0OcK;
	Tue, 07 Jul 2026 19:06:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whB7n-0000000Fh4P-1DlS;
	Tue, 07 Jul 2026 19:06:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B667561384;
	Tue,  7 Jul 2026 19:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9882A1F00A3D;
	Tue,  7 Jul 2026 19:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783451190;
	bh=9cJlPyoSYNFp/gOreqxa1IqYId3zkUs6emQr6ytoL3s=;
	h=Date:From:To:Cc:Subject:References;
	b=nQZnMsUeWM0MBmYh2tftX2ldO6f4f4+KQMN8PIETF59TUOLWGfrzzUj86Bfd1xFh6
	 10CcaK+cuIh4vWxH/paWeIPEbvqCR1T98llJwakIpvPv3wZbJgr7EneYcvAjY3VyZc
	 A4mjZpEslZwnTQ9Y3RdELc2sHV368KIKF0A5adgHMQpKbhnF3wx5Vk/7BVZea8ug+A
	 sLcT2ttVqhK19d2pPXbALVn/ZjJDUgCPlmQmEO3tTnqhNKn17sPyy6QjidI+vgfixZ
	 R+fRDdpiEFDapfuQEgmUBP+RUuSIVZHbmwmncIS0zVZsCPzwXAEyG1obgAdo30Y+r0
	 YPfe7YvFhevHQ==
Date: Tue, 07 Jul 2026 21:06:27 +0200
Message-ID: <20260707190254.079478122@kernel.org>
User-Agent: quilt/0.69
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 x86@kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org,
 Kees Cook <kees@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>,
 Jinjie Ruan <ruanjinjie@huawei.com>,
 Andy Lutomirski <luto@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Helge Deller <deller@gmx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Richard Weinberger <richard@nod.at>,
 Chris Zankel <chris@zankel.net>,
 linux-arm-kernel@lists.infradead.org,
 linux-alpha@vger.kernel.org,
 linux-csky@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>,
 Vineet Gupta <vgupta@kernel.org>,
 Will Deacon <will@kernel.org>,
 Brian Cain <bcain@kernel.org>,
 Michal Simek <monstr@monstr.eu>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>,
 linux-snps-arc@lists.infradead.org,
 linux-hexagon@vger.kernel.org,
 linux-openrisc@vger.kernel.org,
 sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: [patch 08/18] x86/syscall: Use
 [syscall_]enter_from_user_mode_randomize_stack()
References: <20260707181957.433213175@kernel.org>
MIME-Version: 1.0
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

These functions integrate the stack randomization.

syscall_enter_from_user_mode_randomize_stack() has the advantage that the
randomization happens early right after enter_from_user_mode().

In both cases also the overhead of get/put_cpu_var() in
add_random_kstack_offset() is avoided.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: x86@kernel.org
---
 arch/x86/entry/syscall_32.c         |   19 +++++--------------
 arch/x86/entry/syscall_64.c         |    3 +--
 arch/x86/include/asm/entry-common.h |    1 -
 3 files changed, 6 insertions(+), 17 deletions(-)

--- a/arch/x86/entry/syscall_32.c
+++ b/arch/x86/entry/syscall_32.c
@@ -142,10 +142,9 @@ static __always_inline bool int80_is_ext
 	 * int80_is_external() below which calls into the APIC driver.
 	 * Identical for soft and external interrupts.
 	 */
-	enter_from_user_mode(regs);
+	enter_from_user_mode_randomize_stack(regs);
 
 	instrumentation_begin();
-	add_random_kstack_offset();
 
 	/* Validate that this is a soft interrupt to the extent possible */
 	if (unlikely(int80_is_external()))
@@ -210,11 +209,9 @@ DEFINE_FREDENTRY_RAW(int80_emulation)
 {
 	int nr;
 
-	enter_from_user_mode(regs);
+	enter_from_user_mode_randomize_stack(regs);
 
 	instrumentation_begin();
-	add_random_kstack_offset();
-
 	/*
 	 * FRED pushed 0 into regs::orig_ax and regs::ax contains the
 	 * syscall number.
@@ -252,10 +249,10 @@ DEFINE_FREDENTRY_RAW(int80_emulation)
 	 * orig_ax, the int return value truncates it. This matches
 	 * the semantics of syscall_get_nr().
 	 */
-	nr = syscall_enter_from_user_mode(regs, nr);
+	nr = syscall_enter_from_user_mode_randomize_stack(regs, nr);
+
 	instrumentation_begin();
 
-	add_random_kstack_offset();
 	do_syscall_32_irqs_on(regs, nr);
 
 	instrumentation_end();
@@ -268,15 +265,9 @@ static noinstr bool __do_fast_syscall_32
 	int nr = syscall_32_enter(regs);
 	int res;
 
-	/*
-	 * This cannot use syscall_enter_from_user_mode() as it has to
-	 * fetch EBP before invoking any of the syscall entry work
-	 * functions.
-	 */
-	enter_from_user_mode(regs);
+	enter_from_user_mode_randomize_stack(regs);
 
 	instrumentation_begin();
-	add_random_kstack_offset();
 	local_irq_enable();
 	/* Fetch EBP from where the vDSO stashed it. */
 	if (IS_ENABLED(CONFIG_X86_64)) {
--- a/arch/x86/entry/syscall_64.c
+++ b/arch/x86/entry/syscall_64.c
@@ -86,10 +86,9 @@ static __always_inline bool do_syscall_x
 /* Returns true to return using SYSRET, or false to use IRET */
 __visible noinstr bool do_syscall_64(struct pt_regs *regs, int nr)
 {
-	nr = syscall_enter_from_user_mode(regs, nr);
+	nr = syscall_enter_from_user_mode_randomize_stack(regs, nr);
 
 	instrumentation_begin();
-	add_random_kstack_offset();
 
 	if (!do_syscall_x64(regs, nr) && !do_syscall_x32(regs, nr) && nr != -1) {
 		/* Invalid system call, but still a system call. */
--- a/arch/x86/include/asm/entry-common.h
+++ b/arch/x86/include/asm/entry-common.h
@@ -2,7 +2,6 @@
 #ifndef _ASM_X86_ENTRY_COMMON_H
 #define _ASM_X86_ENTRY_COMMON_H
 
-#include <linux/randomize_kstack.h>
 #include <linux/user-return-notifier.h>
 
 #include <asm/nospec-branch.h>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
