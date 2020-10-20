Return-Path: <SRS0=Bb/B=D3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A67C433E7
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Oct 2020 02:20:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C86FA222E9
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Oct 2020 02:20:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eGzJa/gT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="BBmBAqsY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C86FA222E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sT60746wKAX/vZTvwWnBZErJ2HhgJDOxnQVtau8o6rA=; b=eGzJa/gTf8I3CcrkhMr3PJHe1j
	UFbxLx5Zb7wJRdjArtvYlUsnyInV+s4kQ8qa3Nxic3zlNv5S6vU0RVeEmxG/EmFtTIH/l4qitY7ye
	yPSgJjIq4XUS5SiiZ9OK87DMe1CxNgzNoVAw4ZMqlbDhJ0DaMP4GLOorKg1oCoGmdMrZpOyqoyzW5
	tkKKQCZtlu+ETC2egl1G6qtmchHYC1gB0cMMNJLSVcsrhevLNzHIWJqeBn0uWHZyqQ+byC2MjbZjl
	TOIqUBJXxJdw1ltNMt9w8imvmwMjtjpTNVdEcm2cvxQtNcobD2riJKjcTZN+Srnq1IN8iXCZV93cb
	5H434fcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUhFu-0001v3-P1; Tue, 20 Oct 2020 02:20:07 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUhFr-0001uX-Rb
 for linux-snps-arc@lists.infradead.org; Tue, 20 Oct 2020 02:20:04 +0000
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com
 [10.205.2.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C20CEC00A7;
 Tue, 20 Oct 2020 02:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1603160402; bh=Y5kCe7twpvpAVlRszOPR/AKOY980wsss/eMlLX4vYD0=;
 h=From:To:Cc:Subject:Date:From;
 b=BBmBAqsYTIqhj205PkATalZZvP46q05w9Z39AokxS6jNjbgwvyI6Vp5ICtTOZMHW2
 0qUkxeL4fMoGxP/Jdz8+l+3iL6xSgiG9p5zw0yfKAUG39pKhDk+IoDTRrcZTizKeSu
 dpCvP+pWz1uF/wEVqcQYvKGwxVShiXpUJc1OXj2H6Cl7qi+EaCa9855TS7VoTH9FXt
 quDzntNpYJFjy4FKAOLJheRDcmY8NS5OE1ffGKq2DIqVGhbOIO8BxRathzGgwWF8lw
 CBiZlknCU56RX58qXSCUnsbtLGJymWZaT2MTKbMtG0UQFmk4yagUtdropjiNoCZqI0
 IfqEhmCvC3ctw==
Received: from vineetg-Latitude-7400.internal.synopsys.com (unknown
 [10.13.183.89])
 by mailhost.synopsys.com (Postfix) with ESMTP id 37221A0099;
 Tue, 20 Oct 2020 02:19:58 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: stable@vger.kernel.org
Subject: [PATCH] Revert "ARC: entry: fix potential EFA clobber when
 TIF_SYSCALL_TRACE"
Date: Mon, 19 Oct 2020 19:19:57 -0700
Message-Id: <20201020021957.1260521-1-vgupta@synopsys.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_222004_127488_D904F8D9 
X-CRM114-Status: GOOD (  12.35  )
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
Cc: Waldemar Brodkorb <wbx@uclibc-ng.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

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
---
 arch/arc/kernel/entry.S | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/arc/kernel/entry.S b/arch/arc/kernel/entry.S
index ea00c8a17f07..60406ec62eb8 100644
--- a/arch/arc/kernel/entry.S
+++ b/arch/arc/kernel/entry.S
@@ -165,6 +165,7 @@ END(EV_Extension)
 tracesys:
 	; save EFA in case tracer wants the PC of traced task
 	; using ERET won't work since next-PC has already committed
+	lr  r12, [efa]
 	GET_CURR_TASK_FIELD_PTR   TASK_THREAD, r11
 	st  r12, [r11, THREAD_FAULT_ADDR]	; thread.fault_address
 
@@ -207,9 +208,15 @@ tracesys_exit:
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
@@ -236,10 +243,6 @@ ENTRY(EV_Trap)
 
 	EXCEPTION_PROLOGUE
 
-	lr  r12, [efa]
-
-	FAKE_RET_FROM_EXCPN
-
 	;============ TRAP 1   :breakpoints
 	; Check ECR for trap with arg (PROLOGUE ensures r10 has ECR)
 	bmsk.f 0, r10, 7
@@ -247,6 +250,9 @@ ENTRY(EV_Trap)
 
 	;============ TRAP  (no param): syscall top level
 
+	; First return from Exception to pure K mode (Exception/IRQs renabled)
+	FAKE_RET_FROM_EXCPN
+
 	; If syscall tracing ongoing, invoke pre-post-hooks
 	GET_CURR_THR_INFO_FLAGS   r10
 	btst r10, TIF_SYSCALL_TRACE
-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
