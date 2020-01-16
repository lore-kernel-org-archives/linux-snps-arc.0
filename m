Return-Path: <SRS0=rUT0=3F=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6FDC32771
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Jan 2020 00:09:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F26522522
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Jan 2020 00:09:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OOL31KiZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="V9LY1ZT/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F26522522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5ocQkYaSw7JlL6Zel/dRdPlCfA0gDYD1Quvvq2Ds6uk=; b=OOL31KiZTnhHrG
	VJNAti/9FOBP+Yp4rpimhdiU6lweGyl2Jn31ycucoRCsTacIllH8aftD2J5Z7iQf822NCFXAeOltE
	ptlaUrazoy63yYFK7sd3Iy9VqcY17kZMv9RKS2g8MN/52sZeMmZ+YDEGiHvuFZtOaa2cze02132vH
	Ce7797xPdc95/TvPzdyg6C9WcucNmM3CXvtYJ3q8pQ5ViLsy8PDYH5+kDV5hKQWgqHS4XpqF+AwfA
	IISYC+bpI+3gljHe3dYIkxFF6eMsgFJFQtNGkTvblsYNj2thN0mHjL7ueD0kMjfeyVjoa8aL/1OGJ
	SYgDZOjavwZ0royxKT2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irsjU-0008IC-Mc; Thu, 16 Jan 2020 00:09:56 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irsjS-0008Hi-5B
 for linux-snps-arc@lists.infradead.org; Thu, 16 Jan 2020 00:09:55 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6D728C0525;
 Thu, 16 Jan 2020 00:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579133391; bh=wGe7qKxUwSLqkYniadVYIK/uchv8SHM51LLFaYp1I6A=;
 h=From:To:Cc:Subject:Date:From;
 b=V9LY1ZT/7QJRkwbuI7X3qOU9aauI0DaSZp6F1mFP9qOU4400k/fCZxOxuCde/Japw
 tt7TrJOxHZCCr3wHrvwPh3pG7ePhfpAMdi6ArDTN9/pEqR0uBMrVpF1k9HEFnz5ndJ
 HU3D/g3r2bw8N9DGLrH+Bt61aTCLb6+t22w5utPT8OUhl115pjYfJ0hGLkFTrygMjS
 aPEc1vCRbdpTPiSGFj0x2fN76p6zkSD5gWvVizUKTjBUgAeZFd663EdECQTxQt+XEf
 DMAhmWS2iYzdXwFYF72qn4nyDGHX/T8NtzSGfJbpUjtamvsRG+R37MNZ1YSU67FIbM
 TNs4drFWmYCww==
Received: from vineetg-Latitude-E7450.internal.synopsys.com
 (vineetg-latitude-e7450.internal.synopsys.com [10.10.161.20])
 by mailhost.synopsys.com (Postfix) with ESMTP id B8647A00C2;
 Thu, 16 Jan 2020 00:09:49 +0000 (UTC)
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: linux-snps-arc@lists.infradead.org
Subject: [PATCH] ARC: wireup clone3 syscall
Date: Wed, 15 Jan 2020 16:09:48 -0800
Message-Id: <20200116000948.17646-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_160954_313789_F351A25B 
X-CRM114-Status: GOOD (  11.27  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch <linux-arch@vger.kernel.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, Arnd Bergmann <arnd@arndb.de>,
 Christian Brauner <christian@brauner.io>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/Kconfig                   |  1 +
 arch/arc/include/asm/syscalls.h    |  1 +
 arch/arc/include/uapi/asm/unistd.h |  1 +
 arch/arc/kernel/entry.S            | 12 ++++++++++++
 arch/arc/kernel/process.c          |  7 +++----
 arch/arc/kernel/sys.c              |  1 +
 6 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index 26108ea785c2..c4409eab07a9 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -28,6 +28,7 @@ config ARC
 	select GENERIC_SMP_IDLE_THREAD
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_TRACEHOOK
+	select HAVE_COPY_THREAD_TLS
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_FUTEX_CMPXCHG if FUTEX
diff --git a/arch/arc/include/asm/syscalls.h b/arch/arc/include/asm/syscalls.h
index 7ddba13e9b59..c3f4714a4f5c 100644
--- a/arch/arc/include/asm/syscalls.h
+++ b/arch/arc/include/asm/syscalls.h
@@ -11,6 +11,7 @@
 #include <linux/types.h>
 
 int sys_clone_wrapper(int, int, int, int, int);
+int sys_clone3_wrapper(void *, size_t);
 int sys_cacheflush(uint32_t, uint32_t uint32_t);
 int sys_arc_settls(void *);
 int sys_arc_gettls(void);
diff --git a/arch/arc/include/uapi/asm/unistd.h b/arch/arc/include/uapi/asm/unistd.h
index 5eafa1115162..fa2713ae6bea 100644
--- a/arch/arc/include/uapi/asm/unistd.h
+++ b/arch/arc/include/uapi/asm/unistd.h
@@ -21,6 +21,7 @@
 #define __ARCH_WANT_SET_GET_RLIMIT
 #define __ARCH_WANT_SYS_EXECVE
 #define __ARCH_WANT_SYS_CLONE
+#define __ARCH_WANT_SYS_CLONE3
 #define __ARCH_WANT_SYS_VFORK
 #define __ARCH_WANT_SYS_FORK
 #define __ARCH_WANT_TIME32_SYSCALLS
diff --git a/arch/arc/kernel/entry.S b/arch/arc/kernel/entry.S
index 72be01270e24..7e5109dab4e8 100644
--- a/arch/arc/kernel/entry.S
+++ b/arch/arc/kernel/entry.S
@@ -35,6 +35,18 @@ ENTRY(sys_clone_wrapper)
 	b .Lret_from_system_call
 END(sys_clone_wrapper)
 
+ENTRY(sys_clone3_wrapper)
+	SAVE_CALLEE_SAVED_USER
+	bl  @sys_clone3
+	DISCARD_CALLEE_SAVED_USER
+
+	GET_CURR_THR_INFO_FLAGS   r10
+	btst r10, TIF_SYSCALL_TRACE
+	bnz  tracesys_exit
+
+	b .Lret_from_system_call
+END(sys_clone3_wrapper)
+
 ENTRY(ret_from_fork)
 	; when the forked child comes here from the __switch_to function
 	; r0 has the last task pointer.
diff --git a/arch/arc/kernel/process.c b/arch/arc/kernel/process.c
index e1889ce3faf9..bfd4cbe74aa3 100644
--- a/arch/arc/kernel/process.c
+++ b/arch/arc/kernel/process.c
@@ -171,9 +171,8 @@ asmlinkage void ret_from_fork(void);
  * |    user_r25    |
  * ------------------  <===== END of PAGE
  */
-int copy_thread(unsigned long clone_flags,
-		unsigned long usp, unsigned long kthread_arg,
-		struct task_struct *p)
+int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
+	unsigned long kthread_arg, struct task_struct *p, unsigned long tls)
 {
 	struct pt_regs *c_regs;        /* child's pt_regs */
 	unsigned long *childksp;       /* to unwind out of __switch_to() */
@@ -231,7 +230,7 @@ int copy_thread(unsigned long clone_flags,
 		 * set task's userland tls data ptr from 4th arg
 		 * clone C-lib call is difft from clone sys-call
 		 */
-		task_thread_info(p)->thr_ptr = regs->r3;
+		task_thread_info(p)->thr_ptr = tls;
 	} else {
 		/* Normal fork case: set parent's TLS ptr in child */
 		task_thread_info(p)->thr_ptr =
diff --git a/arch/arc/kernel/sys.c b/arch/arc/kernel/sys.c
index fddecc76efb7..1069446bdc58 100644
--- a/arch/arc/kernel/sys.c
+++ b/arch/arc/kernel/sys.c
@@ -7,6 +7,7 @@
 #include <asm/syscalls.h>
 
 #define sys_clone	sys_clone_wrapper
+#define sys_clone3	sys_clone3_wrapper
 
 #undef __SYSCALL
 #define __SYSCALL(nr, call) [nr] = (call),
-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
