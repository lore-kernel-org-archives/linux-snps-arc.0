Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BD0C3DA7D
	for <linux-snps-arc@archiver.kernel.org>; Tue,  3 Jan 2023 07:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:From:Cc:To
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wa6TL1F/jYWHu77WoObLvsskFmA2OYujufNZsDHBaHE=; b=pVKev5y/DdVZs7
	UcrEfDvIUu5x/nFcoSTk3k+VE0RMwbtj7YulcfBkA1P37breuZUoT7ITQsaBdC/ufDm8DQFygv4rP
	3VmjlKFtb2r88KNZB8IGEbpLDohYY/KlycHM5LRA2xCDQE7IpScO0LDRt3xmd2UPkVjUUsJnXegwT
	JS4kISgPOltiAywujxYdlj/h7L7qTL6B+GQzOOLDblXSvk9QEG9gcQRv5s7TEYWnnsKhTCElsyhQ7
	wEzSInXAx1Ts3V1DP2B7TzwZUonmn4iVoZy84xkx9lhTshzxLtV/EPqdnmtQE1jWkYgUzvFzXZytz
	FPGElYKrtOI5dH615WLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCbsx-00HUo1-8d; Tue, 03 Jan 2023 07:38:59 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCbqd-00HU86-VH
	for linux-snps-arc@lists.infradead.org; Tue, 03 Jan 2023 07:36:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EAE39B80E15;
	Tue,  3 Jan 2023 07:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 587D9C433EF;
	Tue,  3 Jan 2023 07:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1672731392;
	bh=We8YovPZ2nI+Fgz0rvsu2sDYpnNLWdkWpGiPY8Zs6oY=;
	h=Subject:To:Cc:From:Date:From;
	b=iXsvIaRSpjLz/jbAL4nWEtBpr+CCGJTSe+usd9rQYBh/A2/Lrynca9a+BiJIVHjFz
	 rLYcmby7p4961diFl/SCFZRVIqBvJ8OLhU0sgtIAi8uIbNS4Gky/BmvZ7c4hgfK27E
	 XJqRl533++cKHSgknbRSJhOchvAWr0IkcP49mqI8=
Subject: Patch "arc: add support for TIF_NOTIFY_SIGNAL" has been added to the 5.10-stable tree
To: axboe@kernel.dk,gregkh@linuxfoundation.org,linux-snps-arc@lists.infradead.org,vgupta@synopsys.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 03 Jan 2023 08:36:24 +0100
Message-ID: <167273138442184@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_233637_614588_BB8894F7 
X-CRM114-Status: GOOD (  17.46  )
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


This is a note to let you know that I've just added the patch titled

    arc: add support for TIF_NOTIFY_SIGNAL

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arc-add-support-for-tif_notify_signal.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From b71f35bd26a9b588d59894e542c48b4360be52fc Mon Sep 17 00:00:00 2001
From: Jens Axboe <axboe@kernel.dk>
Date: Mon, 12 Oct 2020 07:15:37 -0600
Subject: arc: add support for TIF_NOTIFY_SIGNAL

From: Jens Axboe <axboe@kernel.dk>

[ Upstream commit 53855e12588743ea128ee31f913d1c6e2f1d32c8 ]

Wire up TIF_NOTIFY_SIGNAL handling for arc.

Cc: linux-snps-arc@lists.infradead.org
Acked-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arc/include/asm/thread_info.h |    4 +++-
 arch/arc/kernel/entry.S            |    3 ++-
 arch/arc/kernel/signal.c           |    2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

--- a/arch/arc/include/asm/thread_info.h
+++ b/arch/arc/include/asm/thread_info.h
@@ -79,6 +79,7 @@ static inline __attribute_const__ struct
 #define TIF_SIGPENDING		2	/* signal pending */
 #define TIF_NEED_RESCHED	3	/* rescheduling necessary */
 #define TIF_SYSCALL_AUDIT	4	/* syscall auditing active */
+#define TIF_NOTIFY_SIGNAL	5	/* signal notifications exist */
 #define TIF_SYSCALL_TRACE	15	/* syscall trace active */
 
 /* true if poll_idle() is polling TIF_NEED_RESCHED */
@@ -89,11 +90,12 @@ static inline __attribute_const__ struct
 #define _TIF_SIGPENDING		(1<<TIF_SIGPENDING)
 #define _TIF_NEED_RESCHED	(1<<TIF_NEED_RESCHED)
 #define _TIF_SYSCALL_AUDIT	(1<<TIF_SYSCALL_AUDIT)
+#define _TIF_NOTIFY_SIGNAL	(1<<TIF_NOTIFY_SIGNAL)
 #define _TIF_MEMDIE		(1<<TIF_MEMDIE)
 
 /* work to do on interrupt/exception return */
 #define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_SIGPENDING | \
-				 _TIF_NOTIFY_RESUME)
+				 _TIF_NOTIFY_RESUME | _TIF_NOTIFY_SIGNAL)
 
 /*
  * _TIF_ALLWORK_MASK includes SYSCALL_TRACE, but we don't need it.
--- a/arch/arc/kernel/entry.S
+++ b/arch/arc/kernel/entry.S
@@ -308,7 +308,8 @@ resume_user_mode_begin:
 	mov r0, sp	; pt_regs for arg to do_signal()/do_notify_resume()
 
 	GET_CURR_THR_INFO_FLAGS   r9
-	bbit0  r9, TIF_SIGPENDING, .Lchk_notify_resume
+	and.f  0,  r9, TIF_SIGPENDING|TIF_NOTIFY_SIGNAL
+	bz .Lchk_notify_resume
 
 	; Normal Trap/IRQ entry only saves Scratch (caller-saved) regs
 	; in pt_reg since the "C" ABI (kernel code) will automatically
--- a/arch/arc/kernel/signal.c
+++ b/arch/arc/kernel/signal.c
@@ -405,7 +405,7 @@ void do_signal(struct pt_regs *regs)
 
 	restart_scall = in_syscall(regs) && syscall_restartable(regs);
 
-	if (get_signal(&ksig)) {
+	if (test_thread_flag(TIF_SIGPENDING) && get_signal(&ksig)) {
 		if (restart_scall) {
 			arc_restart_syscall(&ksig.ka, regs);
 			syscall_wont_restart(regs);	/* No more restarts */


Patches currently in stable-queue which might be from axboe@kernel.dk are

queue-5.10/x86-process-setup-io_threads-more-like-normal-user-space-threads.patch
queue-5.10/powerpc-add-support-for-tif_notify_signal.patch
queue-5.10/eventfd-provide-a-eventfd_signal_mask-helper.patch
queue-5.10/fs-provide-locked-helper-variant-of-close_fd_get_file.patch
queue-5.10/relay-fix-type-mismatch-when-allocating-memory-in-re.patch
queue-5.10/eventfd-change-int-to-__u64-in-eventfd_signal-ifndef.patch
queue-5.10/io_uring-pass-in-epoll_uring_wake-for-eventfd-signaling-and-wakeups.patch
queue-5.10/blk-mq-fix-possible-memleak-when-register-hctx-faile.patch
queue-5.10/fix-handling-of-nd-depth-on-lookup_cached-failures-in-try_to_unlazy.patch
queue-5.10/net-provide-__sys_shutdown_sock-that-takes-a-socket.patch
queue-5.10/task_work-unconditionally-run-task_work-from-get_signal.patch
queue-5.10/openrisc-add-support-for-tif_notify_signal.patch
queue-5.10/signal-add-task_sigpending-helper.patch
queue-5.10/net-remove-cmsg-restriction-from-io_uring-based-send-recvmsg-calls.patch
queue-5.10/alpha-add-support-for-tif_notify_signal.patch
queue-5.10/nios32-add-support-for-tif_notify_signal.patch
queue-5.10/ia64-don-t-call-handle_signal-unless-there-s-actually-a-signal-queued.patch
queue-5.10/task_work-remove-legacy-twa_signal-path.patch
queue-5.10/revert-proc-don-t-allow-async-path-resolution-of-proc-self-components.patch
queue-5.10/m68k-add-support-for-tif_notify_signal.patch
queue-5.10/s390-add-support-for-tif_notify_signal.patch
queue-5.10/um-add-support-for-tif_notify_signal.patch
queue-5.10/tools-headers-uapi-sync-openat2.h-with-the-kernel-sources.patch
queue-5.10/kernel-provide-create_io_thread-helper.patch
queue-5.10/iov_iter-add-helper-to-save-iov_iter-state.patch
queue-5.10/arc-unbork-5.11-bootup-fix-snafu-in-_tif_notify_signal-handling.patch
queue-5.10/arch-ensure-parisc-powerpc-handle-pf_io_worker-in-copy_thread.patch
queue-5.10/csky-add-support-for-tif_notify_signal.patch
queue-5.10/arm-add-support-for-tif_notify_signal.patch
queue-5.10/kernel-stop-masking-signals-in-create_io_thread.patch
queue-5.10/fs-expose-lookup_cached-through-openat2-resolve_cached.patch
queue-5.10/task_work-add-helper-for-more-targeted-task_work-canceling.patch
queue-5.10/nds32-add-support-for-tif_notify_signal.patch
queue-5.10/signal-kill-jobctl_task_work.patch
queue-5.10/hexagon-add-support-for-tif_notify_signal.patch
queue-5.10/sh-add-support-for-tif_notify_signal.patch
queue-5.10/riscv-add-support-for-tif_notify_signal.patch
queue-5.10/h8300-add-support-for-tif_notify_signal.patch
queue-5.10/io_uring-import-5.15-stable-io_uring.patch
queue-5.10/sparc-add-support-for-tif_notify_signal.patch
queue-5.10/blktrace-fix-output-non-blktrace-event-when-blk_clas.patch
queue-5.10/eventpoll-add-epoll_uring_wake-poll-wakeup-flag.patch
queue-5.10/parisc-add-support-for-tif_notify_signal.patch
queue-5.10/entry-add-support-for-tif_notify_signal.patch
queue-5.10/x86-wire-up-tif_notify_signal.patch
queue-5.10/task_work-use-tif_notify_signal-if-available.patch
queue-5.10/drbd-fix-an-invalid-memory-access-caused-by-incorrec.patch
queue-5.10/kernel-don-t-call-do_exit-for-pf_io_worker-threads.patch
queue-5.10/kernel-allow-fork-with-tif_notify_signal-pending.patch
queue-5.10/pata_ipx4xx_cf-fix-unsigned-comparison-with-less-tha.patch
queue-5.10/mips-add-support-for-tif_notify_signal.patch
queue-5.10/xtensa-add-support-for-tif_notify_signal.patch
queue-5.10/c6x-add-support-for-tif_notify_signal.patch
queue-5.10/microblaze-add-support-for-tif_notify_signal.patch
queue-5.10/net-add-accept-helper-not-installing-fd.patch
queue-5.10/ia64-add-support-for-tif_notify_signal.patch
queue-5.10/arm64-add-support-for-tif_notify_signal.patch
queue-5.10/arc-add-support-for-tif_notify_signal.patch
queue-5.10/revert-proc-don-t-allow-async-path-resolution-of-proc-thread-self-components.patch
queue-5.10/fs-make-do_renameat2-take-struct-filename.patch
queue-5.10/kernel-remove-checking-for-tif_notify_signal.patch
queue-5.10/arch-setup-pf_io_worker-threads-like-pf_kthread.patch
queue-5.10/nvme-pci-fix-mempool-alloc-size.patch
queue-5.10/fs-add-support-for-lookup_cached.patch

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
