Return-Path: <SRS0=sYE2=EP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75276C2D0A3
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Nov 2020 10:41:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE52D2065D
	for <linux-snps-arc@archiver.kernel.org>; Mon,  9 Nov 2020 10:41:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jrkSbQpn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3tOP35o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE52D2065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:From:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Yqnkc9Y67PqS4BFqtH0TocrykH2A/l5nIOt5Qiw3Rfg=; b=jrkSbQpnwhf077P2soxXjnhrx
	X3Ydo+UF5DVBw4EF5WprGyOOmkqMaqWYkByiQitdV7FdIalwuOVnVK+dvESmXKttQIc4xl5vs8Muc
	Stv/ewFdYLX51IzYQW+VSwNw9nzU6zc4KEL7sFlmTLhuwXe4KLjWhM4BtjQUrCwOcH0ezPCwZMpKo
	E3k0cDAJBa3HFyEOIi6bRmuk/v5+2s01IGic3Cwqx6nxueuyyH6cYv2BHsEK1+WQklaCdk0GkqhbW
	v7Qc78WLfroxGUfh8uOSr3Q9UCFg3Tz5sDBWMC3wkUflpWNrdiXfsS07nsxaiN/HRpcclkEEkL2RZ
	z2SYNZDNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc4c7-0008RV-US; Mon, 09 Nov 2020 10:41:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc4c5-0008R3-2E
 for linux-snps-arc@lists.infradead.org; Mon, 09 Nov 2020 10:41:30 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 598F02067C;
 Mon,  9 Nov 2020 10:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604918487;
 bh=29+zaJetCJJYKNW5vKnHBGhK7qncWvP6KJkt8WVFJ3w=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=j3tOP35ou+sFuL4DqzRIJ5Md46PAWu0mUlMuzEXuggXx06POLLJJvsOYhT0a8yNdG
 +JWyyMs/oWILMO1kTsRhyRE3ff9ByOsHiT1A7qXI5JXz31uwfy0r2qsr1Yeg0SCI/f
 kNghpKGOvEYdWNogu5bCZrCvL9sbGBlc6yTZ27oA=
Subject: Patch "Revert "ARC: entry: fix potential EFA clobber when
 TIF_SYSCALL_TRACE"" has been added to the 4.19-stable tree
To: Vineet.Gupta1@synopsys.com, gregkh@linuxfoundation.org,
 linux-snps-arc@lists.infradead.org, vgupta@synopsys.com, wbx@uclibc-ng.org
From: <gregkh@linuxfoundation.org>
Date: Mon, 09 Nov 2020 11:42:14 +0100
In-Reply-To: <20201020021957.1260521-1-vgupta@synopsys.com>
Message-ID: <16049185342311@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_054129_361922_F31B81E1 
X-CRM114-Status: GOOD (  14.76  )
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


This is a note to let you know that I've just added the patch titled

    Revert "ARC: entry: fix potential EFA clobber when TIF_SYSCALL_TRACE"

to the 4.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-arc-entry-fix-potential-efa-clobber-when-tif_syscall_trace.patch
and it can be found in the queue-4.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From Vineet.Gupta1@synopsys.com  Mon Nov  9 11:28:19 2020
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Mon, 19 Oct 2020 19:19:57 -0700
Subject: Revert "ARC: entry: fix potential EFA clobber when TIF_SYSCALL_TRACE"
To: stable@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Waldemar Brodkorb <wbx@uclibc-ng.org>
Message-ID: <20201020021957.1260521-1-vgupta@synopsys.com>

From: Vineet Gupta <Vineet.Gupta1@synopsys.com>

This reverts commit 00fdec98d9881bf5173af09aebd353ab3b9ac729.
(but only from 5.2 and prior kernels)

The original commit was a preventive fix based on code-review and was
auto-picked for stable back-port (for better or worse).
It was OK for v5.3+ kernels, but turned up needing an implicit change
68e5c6f073bcf70 "(ARC: entry: EV_Trap expects r10 (vs. r9) to have
 exception cause)" merged in v5.3 which itself was not backported.
So to summarize the stable backport of this patch for v5.2 and prior
kernels is busted and it won't boot.

The obvious solution is backport 68e5c6f073bcf70 but that is a pain as
it doesn't revert cleanly and each of affected kernels (so far v4.19,
v4.14, v4.9, v4.4) needs a slightly different massaged varaint.
So the easier fix is to simply revert the backport from 5.2 and prior.
The issue was not a big deal as it would cause strace to sporadically
not work correctly.

Waldemar Brodkorb first reported this when running ARC uClibc regressions
on latest stable kernels (with offending backport). Once he bisected it,
the analysis was trivial, so thx to him for this.

Reported-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
Bisected-by: Waldemar Brodkorb <wbx@uclibc-ng.org>
Cc: stable <stable@vger.kernel.org> # 5.2 and prior
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arc/kernel/entry.S |   16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

--- a/arch/arc/kernel/entry.S
+++ b/arch/arc/kernel/entry.S
@@ -156,6 +156,7 @@ END(EV_Extension)
 tracesys:
 	; save EFA in case tracer wants the PC of traced task
 	; using ERET won't work since next-PC has already committed
+	lr  r12, [efa]
 	GET_CURR_TASK_FIELD_PTR   TASK_THREAD, r11
 	st  r12, [r11, THREAD_FAULT_ADDR]	; thread.fault_address
 
@@ -198,9 +199,15 @@ tracesys_exit:
 ; Breakpoint TRAP
 ; ---------------------------------------------
 trap_with_param:
-	mov r0, r12	; EFA in case ptracer/gdb wants stop_pc
+
+	; stop_pc info by gdb needs this info
+	lr  r0, [efa]
 	mov r1, sp
 
+	; Now that we have read EFA, it is safe to do "fake" rtie
+	;   and get out of CPU exception mode
+	FAKE_RET_FROM_EXCPN
+
 	; Save callee regs in case gdb wants to have a look
 	; SP will grow up by size of CALLEE Reg-File
 	; NOTE: clobbers r12
@@ -227,10 +234,6 @@ ENTRY(EV_Trap)
 
 	EXCEPTION_PROLOGUE
 
-	lr  r12, [efa]
-
-	FAKE_RET_FROM_EXCPN
-
 	;============ TRAP 1   :breakpoints
 	; Check ECR for trap with arg (PROLOGUE ensures r9 has ECR)
 	bmsk.f 0, r9, 7
@@ -238,6 +241,9 @@ ENTRY(EV_Trap)
 
 	;============ TRAP  (no param): syscall top level
 
+	; First return from Exception to pure K mode (Exception/IRQs renabled)
+	FAKE_RET_FROM_EXCPN
+
 	; If syscall tracing ongoing, invoke pre-post-hooks
 	GET_CURR_THR_INFO_FLAGS   r10
 	btst r10, TIF_SYSCALL_TRACE


Patches currently in stable-queue which might be from Vineet.Gupta1@synopsys.com are

queue-4.19/revert-arc-entry-fix-potential-efa-clobber-when-tif_syscall_trace.patch

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
