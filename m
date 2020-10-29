Return-Path: <SRS0=3YnE=EE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C2CBC2D0A3
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Oct 2020 16:09:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6F172076E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Oct 2020 16:09:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lp0g460J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="fORaOs7U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6F172076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uF4ZyPsmuWYYgVDgaco/2t6r4Mqs9zQnmQr6aG6Rczg=; b=Lp0g460JUmyNBD5kQsgC3tW74n
	9oaOn2/FEWLRdmqvu4fy+qD3z+j1iUzMzubcdYCR3hc/9rHeUfJqcWfu04sCbde3Vl4o2UPUa9972
	OMCJrJti+8ypx6nMyj8hwkgigHbSsVgnm8AuxpOZjOD2ljO2UuFZeGzlDkaTderCyu/QrDv2DTsPk
	PfYcv53XgwZ5rSy8KgPhkgYuLidT6WKKlYWcjZehLsIz6+8TS2ToGST4mZ8REmJE/+N+z9p78BUfY
	2koLcAnBmtk7EZ6enu33JflLMPhiVIoLGA7r43nNwCc2x11JVoLOvmovR7e5fUdIfn0IEkoIdSUGV
	nvoRz2RQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYAUq-0000dS-L2; Thu, 29 Oct 2020 16:09:52 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYAUo-0000d1-Us
 for linux-snps-arc@lists.infradead.org; Thu, 29 Oct 2020 16:09:51 +0000
Received: by mail-io1-xd42.google.com with SMTP id y20so4108553iod.5
 for <linux-snps-arc@lists.infradead.org>; Thu, 29 Oct 2020 09:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=LdBAYsKEvWPvRHoZsmwL/K8VMPs5QiQDesTNSmD4LhU=;
 b=fORaOs7UmmGq0d6PCPyVWkKNXA/Jrwf5DUahZkn0erDiUUDTTBesJF5feLKgJKWqwC
 /WBeQL5N6H+TIhzcnvLnRq9xkp4i4ySe8U31Nn77TwwgrEw2IHylfPNm/sm3WyqEEd8N
 yAf3tXRkd7KxQAWjB9UkiSne+2SEwYli1y8h/4k8caV4faCmcigK6Ou3Bv9HiSovXry3
 nWI0RiXYcyhGkxsg+SU+4lMXnBQLMGldUKDPi2zWhokbnjqWlFv+UHzo4McisTpP8o1O
 96EOInoT3nvETMGwu8RBKB8DpPOPPz7MBg1h0Lo8SUm/7d/zgTj5URDD4E86uscq7A7o
 XrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=LdBAYsKEvWPvRHoZsmwL/K8VMPs5QiQDesTNSmD4LhU=;
 b=bZfTRuXTn8fF2ZZnsBr4VdHvgNGajuyCKNIXvtyTikWi1pa9V86TrwPJ8omTpemMQt
 vcK1ef06ABuaQ9PohhFWXQpWlIhaH0lttX6ggulAryoISM58VsEoL4enSypUfMCf5H0R
 JqFglPWoETGQqrfDZ60HFhuimbM1gSY8lmNXv8GDHilyEn+GGqWeYGSFL+tqf4peKSLU
 Ino0PMRDsCC18NGC7Gzt0H0wSiYLVzKvmB2+H0jhtT9S+0nRIeMJ+3YO8E+TzxEDBoIe
 wn0mLpklO1GcaAj8DNgfBG8LJmny5irlYulaGAgncwolBbBXSja62ddA1ndGcC5L2zrq
 PmCA==
X-Gm-Message-State: AOAM532rwfFvx+osoem6NtzkVy+5Kp4JjZnO9UJAdYYzLWNflA97wUaD
 EZh7DBAeeVvhM2b4smH0uN9DXM8qWE66Xg==
X-Google-Smtp-Source: ABdhPJz+vHMG/DPsoacQ29Usqa1YJlY+eJ1yOutBU0aUeQAds41NGo5q/PkWbvuSrGBKVaXnVYmrlg==
X-Received: by 2002:a5e:c017:: with SMTP id u23mr3957177iol.81.1603987788814; 
 Thu, 29 Oct 2020 09:09:48 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id v88sm2772240ila.71.2020.10.29.09.09.48
 for <linux-snps-arc@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 09:09:48 -0700 (PDT)
To: linux-snps-arc@lists.infradead.org
From: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] arc: add support for TIF_NOTIFY_SIGNAL
Message-ID: <6b89e805-c645-e738-794f-05ba6be68d60@kernel.dk>
Date: Thu, 29 Oct 2020 10:09:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_120951_153520_7008EFE7 
X-CRM114-Status: GOOD (  17.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Wire up TIF_NOTIFY_SIGNAL handling for arc.

Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Jens Axboe <axboe@kernel.dk>
---

5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
for details:

https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/

As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
as that will enable a set of cleanups once all of them support it. I'm
happy carrying this patch if need be, or it can be funelled through the
arch tree. Let me know.

 arch/arc/include/asm/thread_info.h | 4 +++-
 arch/arc/kernel/entry.S            | 2 +-
 arch/arc/kernel/signal.c           | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arc/include/asm/thread_info.h b/arch/arc/include/asm/thread_info.h
index f9eef0e8f0b7..c0942c24d401 100644
--- a/arch/arc/include/asm/thread_info.h
+++ b/arch/arc/include/asm/thread_info.h
@@ -79,6 +79,7 @@ static inline __attribute_const__ struct thread_info *current_thread_info(void)
 #define TIF_SIGPENDING		2	/* signal pending */
 #define TIF_NEED_RESCHED	3	/* rescheduling necessary */
 #define TIF_SYSCALL_AUDIT	4	/* syscall auditing active */
+#define TIF_NOTIFY_SIGNAL	5	/* signal notifications exist */
 #define TIF_SYSCALL_TRACE	15	/* syscall trace active */
 
 /* true if poll_idle() is polling TIF_NEED_RESCHED */
@@ -89,11 +90,12 @@ static inline __attribute_const__ struct thread_info *current_thread_info(void)
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
diff --git a/arch/arc/kernel/entry.S b/arch/arc/kernel/entry.S
index ea00c8a17f07..cb3a0dbdb795 100644
--- a/arch/arc/kernel/entry.S
+++ b/arch/arc/kernel/entry.S
@@ -307,7 +307,7 @@ resume_user_mode_begin:
 	mov r0, sp	; pt_regs for arg to do_signal()/do_notify_resume()
 
 	GET_CURR_THR_INFO_FLAGS   r9
-	bbit0  r9, TIF_SIGPENDING, .Lchk_notify_resume
+	and.f  0,  r9, TIF_SIGPENDING|TIF_NOTIFY_SIGNAL, .Lchk_notify_resume
 
 	; Normal Trap/IRQ entry only saves Scratch (caller-saved) regs
 	; in pt_reg since the "C" ABI (kernel code) will automatically
diff --git a/arch/arc/kernel/signal.c b/arch/arc/kernel/signal.c
index 2be55fb96d87..a78d8f745a67 100644
--- a/arch/arc/kernel/signal.c
+++ b/arch/arc/kernel/signal.c
@@ -362,7 +362,7 @@ void do_signal(struct pt_regs *regs)
 
 	restart_scall = in_syscall(regs) && syscall_restartable(regs);
 
-	if (get_signal(&ksig)) {
+	if (test_thread_flag(TIF_SIGPENDING) && get_signal(&ksig)) {
 		if (restart_scall) {
 			arc_restart_syscall(&ksig.ka, regs);
 			syscall_wont_restart(regs);	/* No more restarts */
-- 
2.29.0

-- 
Jens Axboe


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
