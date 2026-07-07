Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7BFC43458
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jul 2026 19:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Subject:Cc:To:
	From:Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=EWaJYsf/9l27PYBe20QGZSbqeDliYCPogMiYEX6s5Iw=; b=YCP4cgBTuhKyYn
	gYqqEwr6OPoGZsGWmFTw3bHWIwUxczuf4kUoq6UHW9G+cHtV5TThkLO+R3YXHtVOw3o/d9ChdtVrv
	A5ZXsi/ieG62bXOUeRROvvr6Gd+FEWA6AtwPLwIPfR+7zvONbVGNjR7XgCTCWn3lx/+V4tStLZ2s6
	pfNo7ab/M2l87W0USvmojXD4ZzAC0YRC6/b+b09oYPXnNzgO6eV9nVGYfEw6vGYuuMTkpJbWLR7qz
	1rQsAYCDfO+WkLdz31yICXz2/LSFFtylElOyXLrmBJLRhyyV7S8cBhTXgh98CXCTraBzDn/yRQlxb
	nH8sEdG1rCFEeE2jxxlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whB8l-0000000FiA2-0fBW;
	Tue, 07 Jul 2026 19:07:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whB88-0000000FhUT-1RfQ;
	Tue, 07 Jul 2026 19:06:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B33606138B;
	Tue,  7 Jul 2026 19:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997691F00A3F;
	Tue,  7 Jul 2026 19:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783451211;
	bh=2hP2B4F9qeeUXuU3XysbmgOwdSnbN4nPIvEqn4Tc+Vc=;
	h=Date:From:To:Cc:Subject:References;
	b=GX8UQNU5eotoxcPBLwgb2dREYSYCaobbI7j41EIjeAQbZxYCGuF9DAt9CuKdWhml5
	 sKLqvJU7OLLMsewiAA5UrA2UnmhlrFwfEUGzISBe2Jat9AL4izazWtNtXgKtBBNbzS
	 Pk/Ylkh8qbCDazP5INDbcRzOErFrWroa9+BlpD5E0YXaC/H3Z3JkwneB2JtFInyqn1
	 9UUW7cznoP9Sj9JShH/9STHt6/MiC/5xbpW1rEBQWCbAjEVvJGIuJwCWYWkkgnIyrX
	 3Z+Nm44fpA3fg/FSFwJd+2UjfCZ/sMDtcZhjx7lFIz/M/97exj3ilz3ZoFUpMhhgHk
	 1wiFALaxAM02A==
Date: Tue, 07 Jul 2026 21:06:48 +0200
Message-ID: <20260707190254.338083894@kernel.org>
User-Agent: quilt/0.69
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
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
 x86@kernel.org,
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
Subject: [patch 13/18] entry: Make trace_syscall_enter() return type bool
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

In preparation of converting the return value of
syscall_enter_from_user_mode[_work]() bool, rework trace_syscall_enter() to

 - update the syscall number via a pointer argument

 - Return True if the syscall number is != -1, False otherwise

That aligns with ptrace_report_syscall_permit_enter() and
seccomp_permit_syscall().

The only difference is that this also returns False, when the syscall
number was already -1 to begin with, but there is not much which can be
done about that. As the architecture has to preset the return value to
-ENOSYS anyway, that results in the correct return value for such an
invalid syscall.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
---
 include/linux/entry-common.h  |    8 +++++---
 kernel/entry/syscall-common.c |    7 ++++---
 2 files changed, 9 insertions(+), 6 deletions(-)

--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -58,7 +58,7 @@ static __always_inline bool arch_ptrace_
 #endif
 
 bool syscall_user_dispatch(struct pt_regs *regs);
-long trace_syscall_enter(struct pt_regs *regs, long syscall);
+bool trace_syscall_enter(struct pt_regs *regs, long *syscall);
 void trace_syscall_exit(struct pt_regs *regs, long ret);
 
 static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
@@ -108,8 +108,10 @@ static __always_inline long syscall_trac
 	/* Either of the above might have changed the syscall number */
 	syscall = syscall_get_nr(current, regs);
 
-	if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT))
-		syscall = trace_syscall_enter(regs, syscall);
+	if (unlikely(work & SYSCALL_WORK_SYSCALL_TRACEPOINT)) {
+		if (!trace_syscall_enter(regs, &syscall))
+			return -1L;
+	}
 
 	syscall_enter_audit(regs, syscall);
 
--- a/kernel/entry/syscall-common.c
+++ b/kernel/entry/syscall-common.c
@@ -7,14 +7,15 @@
 
 /* Out of line to prevent tracepoint code duplication */
 
-long trace_syscall_enter(struct pt_regs *regs, long syscall)
+bool trace_syscall_enter(struct pt_regs *regs, long *syscall)
 {
-	trace_sys_enter(regs, syscall);
+	trace_sys_enter(regs, *syscall);
 	/*
 	 * Probes or BPF hooks in the tracepoint may have changed the
 	 * system call number. Reread it.
 	 */
-	return syscall_get_nr(current, regs);
+	*syscall = syscall_get_nr(current, regs);
+	return *syscall != -1L;
 }
 
 void trace_syscall_exit(struct pt_regs *regs, long ret)


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
